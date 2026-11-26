root <- Sys.getenv("PFW_ROOT")
scratch <- Sys.getenv("PFW_SCRATCH")
run <- Sys.getenv("PFW_RUN")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
normalize <- function(path) {
  normalizePath(path, winslash = "/", mustWork = TRUE)
}
stopifnot(
  getRversion() == "4.5.2", identical(normalize(getwd()), scratch),
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

raw_file <- file.path(scratch, "pfw.dta")
country_file <- file.path(root, ".tmp/cp26/inputs/country_list.qs2")
inputs <- c(raw_file, country_file)
input_hashes <- c(
  Sys.getenv("PFW_RAW_SHA256"),
  "1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f"
)
source_head <- "01ff827340a9759dc3d4ef18d31f4e3ba26ff2be"
source_blobs <- c(
  "aux_pfw.R" = "bdf7dec36a773d0d2f686c0c2c778951d84ace48",
  "validation_report.R" = "0ff34163096ded283817113f2021c97d10584747"
)
sources <- file.path(dirname(root), "pipaux/R", names(source_blobs))
stopifnot(
  identical(unname(tools::sha256sum(inputs)), input_hashes),
  identical(unname(tools::sha256sum(sources)), c(
    "0b2c655d73f04676bec1ab36ee2accfe6704338d1fb599d3638b1c58c1d20d06",
    "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0"
  ))
)
countries <- qs2::qs_read(country_file)
country_version <- "30d540ca6e32d842"
country_hash <- stamp::st_hash_obj(countries)
stopifnot(identical(country_hash, "9211182e995b116f"))
gh <- list(
  file_path = "pfw.dta", ext = "dta", owner = "PIP-Technical-Team",
  repo = "aux_pfw", branch = "20260401_TEST",
  gh_raw_sha = "83bc9738cd45ad7e60bc14f5ca837b0075f052b1",
  commit = "9e0fbb33aefdfb5daecb00f024052fa75741b940"
)
cat(R.version.string, "\nPASS: input and pipaux working-file hashes.\n")

extract <- function(lines, names, target) {
  definitions <- as.list(parse(text = lines, keep.source = FALSE))
  for (name in names) {
    matches <- Filter(function(expr) {
      is.call(expr) && identical(expr[[1L]], quote(`<-`)) &&
        identical(expr[[2L]], as.name(name)) && is.call(expr[[3L]]) &&
        identical(expr[[3L]][[1L]], quote(`function`))
    }, definitions)
    if (length(matches) != 1L) cli::cli_abort("Unexpected definition: {name}.")
    eval(matches[[1L]], envir = target)
  }
  return(invisible(NULL))
}

# Keep unmodified validators and hash the original producer, not the harness.
pilot <- new.env(parent = globalenv())
pilot$in_set <- assertr::in_set
pilot$not_na <- assertr::not_na
original <- readLines(sources[[1L]], warn = FALSE)
extract(original, c("aux_pfw_update", "pfw_validate_raw", "pfw_validate_output"),
        pilot)
upstream <- pilot$aux_pfw_update
extract(readLines(sources[[2L]], warn = FALSE), "get_error_validation", pilot)
rewrites <- c(
  "pipfun::load_from_gh(" = "read_staged_pfw(",
  "cl <- pipload::load_aux_data(" = "cl <- read_staged_countries(",
  "saved <- pip_aux_save(" = "saved <- save_local_pfw("
)
adjusted <- original
for (pattern in names(rewrites)) {
  matches <- which(grepl(pattern, original, fixed = TRUE) &
                     !startsWith(trimws(original), "#"))
  if (length(matches) != 1L) cli::cli_abort("Unexpected PFW I/O call: {pattern}.")
  adjusted[matches] <- sub(pattern, rewrites[[pattern]], original[matches],
                           fixed = TRUE)
}
extract(adjusted, c("aux_pfw_update", "aux_pfw_clean"), pilot)

pilot$read_staged_pfw <- function(measure, owner, branch, ext) {
  stopifnot(measure == "pfw", owner == gh$owner, branch == gh$branch, ext == "dta")
  raw <- haven::read_dta(raw_file, encoding = "UTF-8")
  data.table::setDT(raw)
  data.table::setattr(raw, "gh", gh)
  return(raw)
}
pilot$read_staged_countries <- function(measure, verbose) {
  stopifnot(measure == "country_list", isFALSE(verbose))
  # Mirror st_load's class restoration, not a forced data.table conversion.
  restore <- getFromNamespace(".st_restore_sanitized_object", "stamp")
  restored <- restore(countries)
  stopifnot("Pinned country list is not a data.table after Stamp restoration" =
              is.data.table(restored))
  cat("PASS: country-list reader restored the recorded data.table class.\n")
  return(restored)
}

store <- file.path(scratch, "store")
artifact <- "pfw.qs2"
alias <- "pfw_local"
expected <- NULL
stopifnot(!file.exists(store))
pilot$save_local_pfw <- function(x, id, pk, metadata, code, code_label, verbose) {
  stopifnot(
    id == "pfw", identical(key(x), pk), !anyNA(x[, ..pk]),
    !anyDuplicated(x, by = pk), identical(attr(x, "gh"), gh),
    identical(metadata$gh, gh), identical(code, pilot$aux_pfw_update)
  )
  cat("PASS: upstream raw and output PFW validators; keyed producer output.\n")

  # The package writer keeps Git origin in metadata, not in the object.
  data.table::setattr(x, "gh", NULL)
  expected <<- data.table::copy(x)
  metadata$proof <- list(
    release = gh$branch, input_sha256 = input_hashes,
    country_list_version = country_version, country_list_hash = country_hash,
    pipaux_head = source_head, pipaux_blobs = as.list(source_blobs),
    code_label = code_label
  )
  stamp::st_opts(store_file_hash = TRUE, versioning = "content")
  stamp::st_init(store, alias = alias, verbose = FALSE)
  return(stamp::st_save(
    x, artifact, alias = alias, format = "qs2", pk = pk,
    metadata = metadata, code = upstream, verbose = verbose
  ))
}

saved <- pilot$aux_pfw_update(owner = gh$owner, branch = gh$branch, detail = FALSE)
version <- saved$version_id
stopifnot(length(version) == 1L, grepl("^[0-9a-f]{16}$", version))
retained <- file.path(store, artifact, "versions", version, "artifact")
sidecar <- stamp::st_read_sidecar(artifact, alias = alias, version_id = version)
result <- stamp::st_load_version(artifact, version, alias = alias, verbose = FALSE)
stopifnot(
  identical(sidecar$file_hash, secretbase::siphash13(file = retained)),
  identical(sidecar$content_hash, stamp::st_hash_obj(expected)),
  identical(sidecar$content_hash, stamp::st_hash_obj(result)),
  identical(unname(tools::sha256sum(inputs)), input_hashes),
  !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
)
pilot$pfw_validate_output(result, detail = FALSE)
actual <- copy(result)
setattr(actual, ".internal.selfref", NULL)
setattr(expected, ".internal.selfref", NULL)
stopifnot("Exact retained PFW data and attributes differ" =
            identical(actual, expected, num.eq = FALSE, single.NA = FALSE))
cat("PASS: exact retained PFW readback, output validator and recorded hashes.\n")

mapping <- result[
  country_code == "COL" & surveyid_year == 2010L & survey_acronym == "GEIH" &
    welfare_type == "income" & !is_alt_welf & inpovcal == 1
]
if (nrow(mapping) != 1L) {
  cli::cli_abort("Expected one included non-alternative COL/2010/GEIH/income PFW mapping; found {nrow(mapping)}.")
}
receipt <- data.frame(
  release = gh$branch, version = version, rows = nrow(result),
  mapping_count = nrow(mapping), coverage = mapping$survey_coverage,
  cpi_domain = as.integer(mapping$cpi_domain),
  ppp_domain = as.integer(mapping$ppp_domain),
  pop_domain = as.integer(mapping$pop_domain),
  content_hash = sidecar$content_hash, byte_checksum = sidecar$file_hash,
  retained_sha256 = unname(tools::sha256sum(retained)), retained = retained
)
utils::write.table(receipt, file.path(run, "candidate.tsv"), sep = "\t",
                   row.names = FALSE)
cat("PASS: one included non-alternative COL/2010/GEIH/income PFW mapping.\n")
