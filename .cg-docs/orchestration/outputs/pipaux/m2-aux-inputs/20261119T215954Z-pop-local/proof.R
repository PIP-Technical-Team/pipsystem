root <- Sys.getenv("POP_ROOT")
run <- Sys.getenv("POP_RUN")
scratch <- normalizePath(Sys.getenv("POP_SCRATCH"), winslash = "/")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(
  identical(scratch, file.path(root, ".tmp/m2pop")),
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/t/")),
  getRversion() == "4.5.2",
  identical(normalizePath(.libPaths(), winslash = "/"),
            normalizePath(c(libraries, .Library), winslash = "/"))
)
setwd(scratch)
run_date <- Sys.Date()
year_ceiling <- as.numeric(format(run_date, "%Y"))
cat(R.version.string, "; Sys.Date():", format(run_date),
    "; population year ceiling:", year_ceiling, "\n")

source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
invisible(load_qualified_stamp())
suppressPackageStartupMessages({
  library(data.table)
  library(data.validator)
})

release <- "20260401_TEST"
owner <- "PIP-Technical-Team"
raw_commit <- "639613e9032e61c45b3f1dd8208cff0587d1b624"
raw_blobs <- c(
  "pop.xlsx" = "3326203c0ce359852633cf9da6bd49d24676723b",
  "spop.csv" = "da1c247e66623145a8ebcee6a8046630c1e00b48"
)
country_pin <- "30d540ca6e32d842"
country_sha <- "1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f"
country_file <- file.path(root, ".tmp/cp26/inputs/country_list.qs2")
stopifnot("Staged country-list SHA256 mismatch" =
            identical(unname(tools::sha256sum(country_file)), country_sha))
countries <- qs2::qs_read(country_file)
stopifnot("Staged country-list object hash mismatch" =
            identical(stamp::st_hash_obj(countries), "9211182e995b116f"))
cat("PASS: staged country-list retained pin", country_pin,
    "; SHA256", country_sha, "\n")

source_root <- file.path(dirname(root), "pipaux/R")
sources <- file.path(source_root, c("aux_pop.R", "validation_report.R"))
stopifnot(identical(unname(tools::sha256sum(sources)), c(
  "38e26add1c071b3f89e039ffdb0633118ee25beda97ce21cd7ae6cfafad3bc3e",
  "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0"
)))

# Extract only the upstream producer, transformations and validators. Patch
# only I/O references in the in-memory producer, never package files.
extract <- function(lines, names, target) {
  expressions <- as.list(parse(text = lines, keep.source = FALSE))
  for (name in names) {
    matches <- Filter(function(x) {
      is.call(x) && identical(x[[1L]], quote(`<-`)) &&
        identical(x[[2L]], as.name(name)) && is.call(x[[3L]]) &&
        identical(x[[3L]][[1L]], quote(`function`))
    }, expressions)
    if (length(matches) != 1L) cli::cli_abort("Unexpected definition: {name}.")
    eval(matches[[1L]], envir = target)
  }
  invisible(NULL)
}
pilot <- new.env(parent = globalenv())
pilot$in_set <- assertr::in_set
pilot$not_na <- assertr::not_na
pilot$is_uniq <- assertr::is_uniq
original <- readLines(sources[[1L]], warn = FALSE)
extract(original, c("aux_pop_update", "clean_names_from_wide", "clean_from_wide",
                    "popmain_validate_raw", "spop_validate_raw",
                    "pop_validate_output"), pilot)
extract(readLines(sources[[2L]], warn = FALSE), "get_error_validation", pilot)
upstream_code <- pilot$aux_pop_update
adjusted <- original
rewrites <- c("pipfun::load_from_gh(" = "read_staged_pop(",
              "cl <- pipload::load_aux_data(" = "cl <- read_staged_countries(",
              "pip_aux_save(" = "save_local_pop(")
for (i in seq_along(rewrites)) {
  pattern <- names(rewrites)[[i]]
  found <- which(grepl(pattern, original, fixed = TRUE) &
                   !startsWith(trimws(original), "#"))
  stopifnot(length(found) == c(2L, 1L, 1L)[[i]])
  adjusted[found] <- sub(pattern, rewrites[[i]], original[found], fixed = TRUE)
}
extract(adjusted, "aux_pop_update", pilot)

raw_paths <- file.path(scratch, "inputs", names(raw_blobs))
raw_sha <- unname(tools::sha256sum(raw_paths))
read_pop <- function(ext, path) {
  if (identical(ext, "xlsx")) {
    return(suppressMessages(readxl::read_excel(path)))
  }
  data <- readr::read_csv(path, show_col_types = FALSE, col_names = TRUE)
  stopifnot("Special-population CSV parsing problems" =
              nrow(readr::problems(data)) == 0L)
  return(data)
}
raw <- stats::setNames(Map(read_pop, c("xlsx", "csv"), raw_paths), names(raw_blobs))
pilot$read_staged_pop <- function(measure, owner, branch, tag,
                                  filename = measure, ext) {
  file <- paste(filename, ext, sep = ".")
  stopifnot(measure == "pop", owner == "PIP-Technical-Team", branch == release,
            tag == release, file %in% names(raw_blobs))
  pop <- as.data.table(raw[[file]])
  setattr(pop, "gh", list(file_path = file, ext = ext, owner = owner,
                          repo = "aux_pop", branch = branch,
                          gh_raw_sha = raw_blobs[[file]], commit = raw_commit))
  return(pop)
}
pilot$read_staged_countries <- function(measure, verbose) {
  stopifnot(measure == "country_list")
  return(data.table::copy(countries))
}

store <- file.path(scratch, "store")
pk <- c("country_code", "year", "reporting_level")
pilot$save_local_pop <- function(x, id, pk, metadata, code, code_label) {
  stopifnot(id == "pop", identical(pk, c("country_code", "year", "reporting_level")),
            code_label == "aux_pop_update", !file.exists(store))
  cat("PASS: unchanged pinned main, special and output validators.\n")
  # Mirror pip_aux_save's key and provenance handling before local Stamp I/O.
  setattr(x, "gh", NULL)
  setkeyv(x, pk)
  metadata$proof <- list(release = release, year_ceiling = year_ceiling,
                         pop_commit = raw_commit, raw_sha256 = raw_sha,
                         country_list_pin = country_pin,
                         country_list_sha256 = country_sha)
  stamp::st_opts(store_file_hash = TRUE, versioning = "content")
  stamp::st_init(store, alias = "pop_local", verbose = FALSE)
  return(stamp::st_save(x, "pop.qs2", alias = "pop_local", format = "qs2",
                        pk = pk, metadata = metadata, code = upstream_code,
                        verbose = FALSE))
}

cat("Running pinned population producer; joyn", as.character(utils::packageVersion("joyn")), "\n")
saved <- pilot$aux_pop_update(owner = owner, branch = release, detail = FALSE)
version <- saved$version_id
stopifnot(identical(Sys.Date(), run_date), length(version) == 1L,
          grepl("^[0-9a-f]{16}$", version), !isTRUE(saved$skipped))
retained <- file.path(store, "pop.qs2/versions", version, "artifact")
cat("Local retained candidate:", version, "\n")
meta <- stamp::st_read_sidecar("pop.qs2", alias = "pop_local", version_id = version)
pop <- stamp::st_load_version("pop.qs2", version, alias = "pop_local", verbose = FALSE)
pilot$pop_validate_output(pop, detail = FALSE)

# Read the 2010 wide cells directly and apply the nonmissing special override.
raw_col_2010 <- function(data) {
  headers <- unlist(data[2L, seq_len(4L)], use.names = FALSE)
  country_column <- match("Country", headers)
  series_column <- match("Series", headers)
  stopifnot(!anyNA(c(country_column, series_column)), "2010" %in% names(data))
  is_match <- data[[country_column]] == "COL" & grepl("POP", data[[series_column]])
  cells <- data[["2010"]][which(is_match & seq_len(nrow(data)) > 2L)]
  stopifnot(length(cells) <= 1L)
  return(as.numeric(cells[!is.na(cells) & cells != "."]))
}
special <- raw_col_2010(raw[["spop.csv"]])
expected <- if (length(special)) special else raw_col_2010(raw[["pop.xlsx"]])
national <- pop[list("COL", 2010, "national"), on = pk, nomatch = NULL]
stopifnot(
  "No exact positive national COL 2010 population match" =
    nrow(national) == 1L && all(is.finite(national$pop) & national$pop > 0),
  "Exact COL 2010 population differs from its raw source" =
    identical(national$pop, expected),
  identical(key(pop), pk), !anyDuplicated(pop, by = pk),
  min(pop$year) >= 1960, max(pop$year) <= year_ceiling,
  !is.null(meta$file_hash),
  identical(meta$file_hash, secretbase::siphash13(file = retained)),
  identical(stamp::st_hash_obj(pop), meta$content_hash),
  identical(unname(tools::sha256sum(country_file)), country_sha),
  !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
)
receipt <- data.frame(
  release = release, version = version, rows = nrow(pop),
  year_ceiling = year_ceiling, byte_checksum = meta$file_hash,
  content_hash = meta$content_hash,
  retained_sha256 = unname(tools::sha256sum(retained)),
  col_2010_national = "exactly_one_positive",
  raw_match = if (length(special)) "spop.csv" else "pop.xlsx"
)
utils::write.table(receipt, file.path(run, "candidate.tsv"), sep = "\t",
                   row.names = FALSE)
cat("PASS: exact retained readback, checksums and national COL 2010 raw match.\n")
