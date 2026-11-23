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
sys.source(file.path(root, "tools/pipsys/pipsys.R"), envir = globalenv())
stopifnot(
  identical(run, file.path(outputs_dir(root), "pipaux/m2-aux-inputs",
                           "20261119T215954Z-pfw-predicate-proof")),
  identical(scratch, file.path(root, ".tmp/m2pfwfix")),
  check_path(file.path(run, "handoff.md"), root), check_path(scratch, root),
  identical(read_packages(root)[package == "pipaux", path],
            file.path(dirname(root), "pipaux"))
)
source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
stamp_ns <- load_qualified_stamp()
suppressPackageStartupMessages(library(data.validator))

raw_file <- file.path(root, ".tmp/m2pfw/pfw.dta")
country_file <- file.path(root, ".tmp/cp26/inputs/country_list.qs2")
source_head <- "01ff827340a9759dc3d4ef18d31f4e3ba26ff2be"
source_blobs <- c(
  "aux_pfw.R" = "bdf7dec36a773d0d2f686c0c2c778951d84ace48",
  "validation_report.R" = "0ff34163096ded283817113f2021c97d10584747",
  "aux_country_list.R" = "8bf568af91467df1d00b3d384e40651e20ffc73b"
)
sources <- file.path(dirname(root), "pipaux/R", names(source_blobs))
pins <- c(raw_file, country_file, sources)
hashes <- c(
  "5d80c203fb709e9568f4f4b9db1973254b7021fbe36c06d2f47c5f7bebcb0f45",
  "1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f",
  "0b2c655d73f04676bec1ab36ee2accfe6704338d1fb599d3638b1c58c1d20d06",
  "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0",
  "d357b7635c2c7c8992b55eb3e76143dbd60d6cceffaab5dfcd1c2a2bc575a23b"
)
sha <- function(paths) unname(tools::sha256sum(paths))
stopifnot(identical(sha(pins), hashes))
countries <- qs2::qs_read(country_file)
country_hash <- stamp::st_hash_obj(countries)
stopifnot(identical(country_hash, "9211182e995b116f"))
restore <- get(".st_restore_sanitized_object", envir = stamp_ns)
countries <- restore(countries)
stopifnot(is.data.table(countries))
gh <- list(
  file_path = "pfw.dta", ext = "dta", owner = "PIP-Technical-Team",
  repo = "aux_pfw", branch = "20260401_TEST",
  gh_raw_sha = "83bc9738cd45ad7e60bc14f5ca837b0075f052b1",
  commit = "9e0fbb33aefdfb5daecb00f024052fa75741b940"
)
cat(R.version.string, "\nPASS: exact source and input pins.\n")

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

# Substitute only the argument expression for the pinned region_code check.
region_rule <- function(lines) {
  i <- grep('region_code, description = "`region_code` values within range"',
            lines, fixed = TRUE) - 1L
  pattern <- "^validate_cols\\((in_set\\(c\\([^)]*\\)\\)),\\s*$"
  stopifnot(length(i) == 1L, grepl(pattern, trimws(lines[i]), perl = TRUE))
  return(list(index = i, text = sub(pattern, "\\1", trimws(lines[i]),
                                    perl = TRUE)))
}
original <- readLines(sources[[1L]], warn = FALSE)
prior <- region_rule(original)
proposed <- region_rule(readLines(sources[[3L]], warn = FALSE))
tested <- original
tested[prior$index] <- sub(prior$text, proposed$text, original[prior$index],
                         fixed = TRUE)
stopifnot(identical(which(tested != original), prior$index))
region_accepts <- eval(str2lang(proposed$text), list(in_set = assertr::in_set),
                      baseenv())
cat("Hypothetical region_code predicate:", proposed$text, "\n")

pilot <- new.env(parent = globalenv())
pilot$in_set <- assertr::in_set
pilot$not_na <- assertr::not_na
code_names <- c("aux_pfw_update", "aux_pfw_clean", "pfw_validate_raw",
                "pfw_validate_output", "get_error_validation")
extract(original, code_names[1:3], pilot)
extract(tested, code_names[4L], pilot)
extract(readLines(sources[[2L]], warn = FALSE), code_names[5L], pilot)
candidate_code <- paste(unlist(lapply(code_names, function(name) {
  c(paste(name, "<-"), deparse(pilot[[name]], width.cutoff = 80L))
})), collapse = "\n")
hash_code <- get("st_hash_code", envir = stamp_ns)
candidate_code_hash <- hash_code(candidate_code)

# Redirect the same three I/O call sites as the prior local proof.
rewrites <- c(
  "pipfun::load_from_gh(" = "read_staged_pfw(",
  "cl <- pipload::load_aux_data(" = "cl <- read_staged_countries(",
  "saved <- pip_aux_save(" = "saved <- save_local_pfw("
)
adapted <- original
for (pattern in names(rewrites)) {
  i <- which(grepl(pattern, original, fixed = TRUE) &
               !startsWith(trimws(original), "#"))
  stopifnot(length(i) == 1L)
  adapted[i] <- sub(pattern, rewrites[[pattern]], original[i], fixed = TRUE)
}
extract(adapted, code_names[1:2], pilot)
pilot$read_staged_pfw <- function(measure, owner, branch, ext) {
  stopifnot(measure == "pfw", owner == gh$owner, branch == gh$branch, ext == "dta")
  raw <- haven::read_dta(raw_file, encoding = "UTF-8")
  setDT(raw)
  setattr(raw, "gh", gh)
  return(raw)
}
pilot$read_staged_countries <- function(measure, verbose) {
  stopifnot(identical(measure, "country_list"), isFALSE(verbose))
  return(countries)
}
clean_local <- pilot$aux_pfw_clean
pilot$aux_pfw_clean <- function(y) {
  clean <- clean_local(y)
  stopifnot(nrow(clean) == 2542L, all(region_accepts(clean$region_code) %in% TRUE))
  cat("PASS: upstream raw validator and proposed region rule for all",
      nrow(clean), "joined rows.\n")
  return(clean)
}

target_mapping <- function(x) {
  match <- x[country_code == "COL" & surveyid_year == 2010L &
               survey_acronym == "GEIH" & welfare_type == "income" &
               !is_alt_welf & inpovcal == 1]
  if (nrow(match) != 1L) {
    cli::cli_abort("Expected one included COL/2010/GEIH/income mapping; found {nrow(match)}.")
  }
  return(match)
}
artifact <- "pfw.qs2"
alias <- "pfw_predicate_experiment"
store <- file.path(scratch, "store")
expected <- NULL
pilot$save_local_pfw <- function(x, id, pk, metadata, code, code_label, verbose) {
  stopifnot(
    id == "pfw", identical(key(x), pk), !anyNA(x[, ..pk]),
    !anyDuplicated(x, by = pk), identical(metadata$gh, gh),
    identical(attr(x, "gh"), gh), identical(code, pilot$aux_pfw_update),
    identical(sha(pins), hashes), !file.exists(store),
    !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
  )
  invisible(target_mapping(x))
  cat("PASS: full output validator, key checks and selected mapping before save.\n")
  setattr(x, "gh", NULL)
  expected <<- copy(x)
  metadata$proof <- list(
    status = "experimental_not_authoritative", pipaux_head = source_head,
    pipaux_blobs = as.list(source_blobs), input_sha256 = hashes[1:2],
    country_list_version = "30d540ca6e32d842", country_list_hash = country_hash,
    prior_predicate = prior$text, adjusted_predicate = proposed$text,
    upstream_code_label = code_label, candidate_code = candidate_code
  )
  stamp::st_opts(store_file_hash = TRUE, versioning = "content", code_hash = TRUE)
  stamp::st_init(store, alias = alias, verbose = FALSE)
  return(stamp::st_save(
    x, artifact, alias = alias, format = "qs2", pk = pk, metadata = metadata,
    code = candidate_code, code_label = "experimental_pfw_region_code",
    verbose = FALSE
  ))
}

saved <- pilot$aux_pfw_update(owner = gh$owner, branch = gh$branch, detail = FALSE)
version <- saved$version_id
stopifnot(length(version) == 1L, grepl("^[0-9a-f]{16}$", version))
retained <- file.path(store, artifact, "versions", version, "artifact")
meta <- stamp::st_read_sidecar(artifact, alias = alias, version_id = version)
disk <- qs2::qs_read(retained)
result <- stamp::st_load_version(artifact, version, alias = alias, verbose = FALSE)
cols <- function(x) lapply(names(x), function(name) x[[name]])
retained_sha <- sha(retained)
stopifnot(
  identical(meta$file_hash, secretbase::siphash13(file = retained)),
  identical(retained_sha, sha(file.path(store, artifact, artifact))),
  identical(meta$content_hash, stamp::st_hash_obj(disk)),
  identical(meta$code_hash, candidate_code_hash), identical(meta$gh, gh),
  identical(meta$proof$adjusted_predicate, proposed$text),
  identical(meta$proof$candidate_code, candidate_code),
  identical(meta$proof$status, "experimental_not_authoritative"),
  identical(names(expected), names(result)), identical(names(disk), names(result)),
  identical(cols(expected), cols(result), num.eq = FALSE, single.NA = FALSE),
  identical(cols(disk), cols(result), num.eq = FALSE, single.NA = FALSE),
  identical(row.names(expected), row.names(result)),
  identical(key(expected), key(result)), identical(meta$pk$keys, key(result)),
  identical(attr(expected, "aux_key"), attr(result, "aux_key")),
  identical(attr(expected, "aux_name"), attr(result, "aux_name")),
  identical(sha(pins), hashes)
)
pilot$pfw_validate_output(result, detail = FALSE)
mapping <- target_mapping(result)
receipt <- data.frame(
  status = meta$proof$status, release = gh$branch, version = version,
  rows = nrow(result), mapping_count = nrow(mapping),
  coverage = mapping$survey_coverage, cpi_domain = as.integer(mapping$cpi_domain),
  ppp_domain = as.integer(mapping$ppp_domain), pop_domain = as.integer(mapping$pop_domain),
  content_hash = meta$content_hash, byte_checksum = meta$file_hash,
  code_hash = meta$code_hash, retained_sha256 = retained_sha, retained = retained
)
utils::write.table(receipt, file.path(run, "candidate.tsv"), sep = "\t",
                   row.names = FALSE)
cat("PASS: exact retained readback, candidate provenance and one selected mapping.\n")
