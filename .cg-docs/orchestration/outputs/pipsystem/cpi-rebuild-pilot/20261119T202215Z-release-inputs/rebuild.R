root <- Sys.getenv("CPI_ROOT")
scratch <- normalizePath(Sys.getenv("CPI_SCRATCH"), winslash = "/", mustWork = TRUE)
bundle <- Sys.getenv("CPI_BUNDLE")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(
  identical(scratch, file.path(root, ".tmp/cp26")),
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/t/")),
  getRversion() == "4.5.2",
  identical(normalizePath(.libPaths(), winslash = "/"),
            normalizePath(c(libraries, .Library), winslash = "/"))
)
setwd(scratch)
source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
invisible(load_qualified_stamp())
suppressPackageStartupMessages({
  library(data.table)
  library(data.validator)
})

inputs <- utils::read.delim(file.path(bundle, "inputs.tsv"), colClasses = "character")
local_files <- file.path(scratch, "inputs", c("cpi.csv", "country_list.qs2"))
stopifnot(
  identical(inputs$input, c("raw_cpi", "country_list")),
  identical(inputs$release, rep("20260401_TEST", 2L)),
  identical(inputs$local_file, local_files),
  identical(unname(tools::sha256sum(local_files)), inputs$sha256)
)
source_root <- file.path(dirname(root), "pipaux/R")
files <- file.path(source_root, c("aux_cpi.R", "validation_report.R"))
stopifnot(identical(unname(tools::sha256sum(files)), c(
  "0f1de54cc95867baee9b62893a2ca7e3d74978c773b5cc6621c36e0c04888eeb",
  "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0"
)))
raw <- data.table::as.data.table(readr::read_csv(local_files[[1L]],
                                                show_col_types = FALSE))
stopifnot(nrow(readr::problems(raw)) == 0L, nrow(raw) > 0L)
countries <- qs2::qs_read(local_files[[2L]])
stopifnot(identical(stamp::st_hash_obj(countries), inputs$source_object[[2L]]))
gh <- list(owner = "PIP-Technical-Team", repo = "aux_cpi", branch = "20260401_TEST",
           file_path = "cpi.csv", ext = "csv", gh_raw_sha = inputs$source_object[[1L]],
           commit = inputs$version[[1L]])
data.table::setattr(raw, "gh", gh)

# Reuse only the selected functions, without starting pipaux or pipfun. In
# the pilot copy, acquisition and saving are bound to local adapters only.
pilot <- new.env(parent = globalenv())
pilot$in_set <- assertr::in_set
pilot$not_na <- assertr::not_na
extract <- function(lines, names, target) {
  expr <- parse(text = lines, keep.source = FALSE)
  for (name in names) {
    matches <- Filter(function(x) {
      is.call(x) && identical(x[[1L]], quote(`<-`)) &&
        identical(x[[2L]], as.name(name)) && is.call(x[[3L]]) &&
        identical(x[[3L]][[1L]], quote(`function`))
    }, as.list(expr))
    if (length(matches) != 1L) cli::cli_abort("Unexpected CPI definition: {name}.")
    eval(matches[[1L]], envir = target)
  }
  invisible(NULL)
}
original <- readLines(files[[1L]], warn = FALSE)
extract(original, "aux_cpi_update", pilot)
upstream_code <- pilot$aux_cpi_update
rewrites <- c("pipfun::load_from_gh(" = "read_staged_cpi(",
              "cl <- pipload::load_aux_data(" = "cl <- read_staged_country_list(",
              "pip_aux_save(" = "save_pilot_cpi(")
adjusted <- original
for (pattern in names(rewrites)) {
  matches <- which(grepl(pattern, original, fixed = TRUE) &
                     !startsWith(trimws(original), "#"))
  if (length(matches) != 1L) cli::cli_abort("Unexpected CPI I/O call: {pattern}.")
  adjusted[matches] <- sub(pattern, rewrites[[pattern]], adjusted[matches],
                            fixed = TRUE)
}
extract(adjusted, c("aux_cpi_update", "aux_cpi_clean", "cpi_validate_raw",
                    "cpi_validate_output"), pilot)
extract(readLines(files[[2L]], warn = FALSE), "get_error_validation", pilot)
pilot$read_staged_cpi <- function(measure, filename, owner, branch, ext) {
  stopifnot(measure == "cpi", filename == "cpi", owner == gh$owner,
            branch == gh$branch, ext == "csv")
  return(data.table::copy(raw))
}
pilot$read_staged_country_list <- function(measure, verbose) {
  stopifnot(measure == "country_list")
  return(countries)
}

store <- file.path(scratch, "store")
stopifnot("Local pilot store already exists" = !file.exists(store))
pilot$save_pilot_cpi <- function(x, id, pk, metadata, code, code_label, verbose) {
  stopifnot(id == "cpi", nrow(x) > 0L, identical(data.table::key(x), pk),
            !anyNA(x[, ..pk]), !anyDuplicated(x, by = pk),
            identical(sort(unique(x$cpi_year)), c(2005L, 2011L, 2017L, 2021L)),
            all(x$country_code %in% countries$country_code))

  # Check the selected 2021 CPI values against the raw cells independently.
  levels <- c("rural", "urban", "national")
  expected <- raw[, .(country_code = code, year = as.integer(year),
                      survey_acronym = survname,
                      reporting_level = levels[as.integer(cpi_data_level) + 1L],
                      raw_value = as.numeric(cpi2021))]
  keys <- pk[pk != "cpi_year"]
  actual <- x[cpi_year == 2021L]
  stopifnot(!anyDuplicated(expected, by = keys),
            all(!is.na(expected[actual, on = keys, which = TRUE])),
            identical(expected[actual, on = keys, raw_value], actual$cpi_value))
  cat("PASS: existing CPI validation, output key, and raw-to-output 2021 values.\n")

  data.table::setattr(x, "gh", NULL)
  metadata$pilot <- list(release = gh$branch, input_versions = inputs$version,
                         input_sha256 = inputs$sha256, code_label = code_label)
  stamp::st_opts(store_file_hash = TRUE, versioning = "content")
  stamp::st_init(store, alias = "cpi_pilot", verbose = FALSE)
  return(stamp::st_save(x, "cpi.qs2", alias = "cpi_pilot", format = "qs2",
                        pk = pk, metadata = metadata, code = upstream_code,
                        verbose = FALSE))
}

options(pipaux.cpivar = "cpi2017")
cat("R:", R.version.string, "PID:", Sys.getpid(), "\n")
cat("Release: 20260401_TEST ; local inputs verified ; starting CPI validation.\n")
saved <- pilot$aux_cpi_update(owner = gh$owner, branch = gh$branch, detail = FALSE)
version <- saved$version_id
stopifnot(grepl("^[0-9a-f]{16}$", version), !identical(version, "dbd2ccf63260991d"))
meta <- stamp::st_read_sidecar("cpi.qs2", alias = "cpi_pilot", version_id = version)
result <- stamp::st_load_version("cpi.qs2", version, alias = "cpi_pilot",
                                 verbose = FALSE)
retained <- file.path(store, "cpi.qs2/versions", version, "artifact")
stopifnot(!is.null(meta$file_hash),
          identical(meta$file_hash, secretbase::siphash13(file = retained)),
          identical(stamp::st_hash_obj(result), meta$content_hash),
          !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces()),
          identical(unname(tools::sha256sum(local_files)), inputs$sha256))
pilot$cpi_validate_output(result, detail = FALSE)
receipt <- data.frame(release = gh$branch, version = version, rows = nrow(result),
                      byte_checksum = meta$file_hash, content_hash = meta$content_hash,
                      retained_sha256 = unname(tools::sha256sum(retained)))
utils::write.table(receipt, file.path(bundle, "candidate.tsv"), sep = "\t",
                   row.names = FALSE)
cat("PASS: exact retained readback, CPI validator, object and stored file hashes.\n")
print(receipt, row.names = FALSE)
cat("Shared writes, catalog repair, promotion and survey processing: NOT RUN.\n")
