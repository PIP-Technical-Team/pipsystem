root <- Sys.getenv("PPP_ROOT")
bundle <- Sys.getenv("PPP_BUNDLE")
scratch <- Sys.getenv("PPP_SCRATCH")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
normalize <- function(path) normalizePath(path, winslash = "/", mustWork = TRUE)
stopifnot(
  getRversion() == "4.5.2",
  identical(normalize(getwd()), scratch),
  startsWith(normalize(tempdir()), paste0(scratch, "/t/")),
  identical(normalize(.libPaths()), normalize(c(libraries, .Library)))
)

source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
invisible(load_qualified_stamp())
suppressPackageStartupMessages({
  library(data.table)
  library(data.validator)
})

inputs <- file.path(scratch, "ppp.csv")
inputs <- c(inputs, Sys.getenv("PPP_COUNTRIES"))
sha <- unname(tools::sha256sum(inputs))
stopifnot(identical(sha, c(Sys.getenv("PPP_CSV_SHA"),
                          Sys.getenv("PPP_COUNTRY_SHA"))))
country_pin <- "30d540ca6e32d842"
countries <- qs2::qs_read(inputs[[2L]])
stopifnot(identical(stamp::st_hash_obj(countries), "9211182e995b116f"))

gh <- list(
  owner = "PIP-Technical-Team", repo = "aux_ppp", branch = "20260401_TEST",
  file_path = "ppp.csv", ext = "csv", gh_raw_sha = Sys.getenv("PPP_BLOB"),
  commit = Sys.getenv("PPP_COMMIT"), sha256 = sha[[1L]],
  url = Sys.getenv("PPP_URL")
)
parsed <- readr::read_csv(inputs[[1L]], show_col_types = FALSE, progress = FALSE)
stopifnot(nrow(parsed) > 0L, nrow(readr::problems(parsed)) == 0L)
raw <- data.table::as.data.table(parsed)
data.table::setattr(raw, "gh", gh)

source_root <- "E:/PovcalNet/01.personal/wb384996/PIP/pipaux/R"
files <- file.path(source_root, c("aux_ppp.R", "validation_report.R"))
stopifnot(identical(unname(tools::sha256sum(files)), c(
  "ef74bf540d975a94fc63807d5663a9e934d710177bbbd3453765c6cd3ae5c3f3",
  "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0"
)))

# Extract definitions without loading any PIP package or startup hooks.
pilot <- new.env(parent = globalenv())
extract <- function(lines, functions) {
  definitions <- as.list(parse(text = lines, keep.source = FALSE))
  for (name in functions) {
    selected <- Filter(function(expr) {
      is.call(expr) && identical(expr[[1L]], quote(`<-`)) &&
        identical(expr[[2L]], as.name(name)) && is.call(expr[[3L]]) &&
        identical(expr[[3L]][[1L]], quote(`function`))
    }, definitions)
    stopifnot(length(selected) == 1L)
    eval(selected[[1L]], envir = pilot)
  }
  invisible(NULL)
}
original <- readLines(files[[1L]], warn = FALSE)
extract(original, "aux_ppp_update")
upstream_code <- pilot$aux_ppp_update
adjusted <- original
replacements <- c("pipfun::load_from_gh(" = "read_ppp(",
                  "cl <- pipload::load_aux_data(" = "cl <- read_countries(")
for (pattern in names(replacements)) {
  matches <- which(grepl(pattern, original, fixed = TRUE))
  stopifnot(length(matches) == 1L)
  adjusted[matches] <- sub(pattern, replacements[[pattern]], adjusted[matches],
                           fixed = TRUE)
}
extract(adjusted, c("aux_ppp_update", "aux_ppp_clean", "ppp_validate_raw",
                    "ppp_validate_output"))
extract(readLines(files[[2L]], warn = FALSE), "get_error_validation")
pilot$in_set <- assertr::in_set
pilot$not_na <- assertr::not_na
pilot$read_ppp <- function(measure, owner, branch, tag, ext) {
  stopifnot(measure == "ppp", owner == gh$owner, branch == gh$branch,
            tag == branch, ext == gh$ext)
  return(data.table::copy(raw))
}
pilot$read_countries <- function(measure, verbose) {
  stopifnot(measure == "country_list")
  return(countries)
}

store <- file.path(scratch, "store")
alias <- "ppp_pilot"
outputs <- new.env(parent = emptyenv())
pilot$pip_aux_save <- function(x, id, pk, metadata = list(), code = NULL,
                               code_label = NULL, verbose) {
  stopifnot(id %in% c("ppp", "ppp_vintage"), !exists(id, outputs),
            identical(data.table::key(x), pk), nrow(x) > 0L)
  if (id == "ppp") {
    stopifnot(identical(metadata$gh, gh), identical(attr(x, "gh"), gh),
              identical(code_label, "aux_ppp_update"), !file.exists(store))
    cat("PASS: upstream PPP raw and output validators returned.\n")
    stamp::st_opts(store_file_hash = TRUE, versioning = "content")
    stamp::st_init(store, alias = alias, verbose = FALSE)
    code <- upstream_code
  }

  # Mirror pip_aux_save's separation of the payload from source metadata.
  x <- data.table::copy(x)
  data.table::setattr(x, "gh", NULL)
  data.table::setattr(x, "aux_name", id)
  metadata$gh <- gh
  metadata$country_list <- list(version = country_pin, sha256 = sha[[2L]])
  saved <- stamp::st_save(
    x, paste0(id, ".qs2"), alias = alias, format = "qs2", pk = pk,
    metadata = metadata, code = code, verbose = FALSE
  )
  outputs[[id]] <- list(expected = x, saved = saved)
  return(saved)
}

options(pipaux.pppyear = 2017)
cat("R:", R.version.string, "\nStarting pinned TEST PPP producer.\n")
invisible(pilot$aux_ppp_update(owner = gh$owner, branch = gh$branch,
                               detail = FALSE))

without_selfref <- function(x) {
  x <- data.table::copy(x)
  data.table::setattr(x, ".internal.selfref", NULL)
  return(x)
}
results <- list()
receipt <- lapply(c("ppp", "ppp_vintage"), function(id) {
  output <- outputs[[id]]
  version <- output$saved$version_id
  stopifnot(grepl("^[0-9a-f]{16}$", version), !isTRUE(output$saved$skipped))
  artifact <- paste0(id, ".qs2")
  path <- file.path(store, artifact, "versions", version, "artifact")
  meta <- stamp::st_read_sidecar(artifact, alias = alias, version_id = version)
  result <- stamp::st_load_version(artifact, version, alias = alias,
                                    verbose = FALSE)
  stopifnot(
    identical(without_selfref(result), without_selfref(output$expected)),
    identical(stamp::st_hash_obj(result), meta$content_hash),
    identical(meta$file_hash, secretbase::siphash13(file = path)),
    identical(meta$gh, gh),
    identical(meta$country_list, list(version = country_pin, sha256 = sha[[2L]]))
  )
  results[[id]] <<- result
  data.frame(artifact, version, rows = nrow(result), path,
             byte_checksum = meta$file_hash, object_hash = meta$content_hash,
             sha256 = unname(tools::sha256sum(path)))
})
pilot$ppp_validate_output(results$ppp, detail = FALSE)

# Independent base-R read: match raw 2021 column suffixes to retained keys.
source_cells <- utils::read.csv(inputs[[1L]], colClasses = "character",
                                check.names = FALSE)
source_columns <- grep("^ppp_2021_[Vv][0-9]_[Vv][0-9]$", names(source_cells),
                        value = TRUE)
national <- which(source_cells$code == "COL" & source_cells$ppp_domain == "1" &
                    source_cells$datalevel == "2")
stopifnot(length(national) == 1L, length(source_columns) > 0L)
expected_tags <- sub("^ppp_", "", source_columns)
expected_values <- as.numeric(unlist(source_cells[national, source_columns],
                                     use.names = FALSE))
actual <- results$ppp[country_code == "COL" & reporting_level == "national" &
                        ppp_year == 2021]
actual_tags <- with(actual, paste(ppp_year, release_version, adaptation_version,
                                  sep = "_"))
inventory <- results$ppp_vintage[ppp_year == 2021]
inventory_tags <- with(inventory, paste(ppp_year, ppp_rv, ppp_av, sep = "_"))
stopifnot(
  identical(sort(expected_tags), sort(actual_tags)),
  identical(sort(expected_tags), sort(inventory_tags)),
  identical(expected_values, actual$ppp[match(expected_tags, actual_tags)]),
  all(is.finite(expected_values) & expected_values > 0),
  identical(unname(tools::sha256sum(inputs)), sha),
  !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
)

utils::write.table(do.call(rbind, receipt), file.path(bundle, "candidate.tsv"),
                   sep = "\t", row.names = FALSE)
cat("PASS: both exact retained readbacks, provenance, byte and object hashes.\n")
cat("PASS: national COL 2021 source key/value cells:", length(expected_tags),
    "; unused candidate tags:", paste(sort(expected_tags), collapse = ", "), "\n")
