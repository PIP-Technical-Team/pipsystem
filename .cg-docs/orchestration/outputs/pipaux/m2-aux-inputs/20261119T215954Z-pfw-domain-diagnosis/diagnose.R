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
                           "20261119T215954Z-pfw-domain-diagnosis")),
  identical(scratch, file.path(root, ".tmp/m2pfd")),
  check_path(file.path(run, "handoff.md"), root), check_path(scratch, root),
  identical(read_packages(root)[package == "pipaux", path],
            file.path(dirname(root), "pipaux"))
)
source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
invisible(load_qualified_stamp())

raw_file <- file.path(root, ".tmp/m2pfw/pfw.dta")
country_file <- file.path(root, ".tmp/cp26/inputs/country_list.qs2")
pfw_source <- file.path(dirname(root), "pipaux/R/aux_pfw.R")
country_source <- file.path(dirname(root), "pipaux/R/aux_country_list.R")
inputs <- c(raw_file, country_file, pfw_source, country_source)
expected <- c(
  "5d80c203fb709e9568f4f4b9db1973254b7021fbe36c06d2f47c5f7bebcb0f45",
  "1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f",
  "0b2c655d73f04676bec1ab36ee2accfe6704338d1fb599d3638b1c58c1d20d06",
  "d357b7635c2c7c8992b55eb3e76143dbd60d6cceffaab5dfcd1c2a2bc575a23b"
)
stopifnot(identical(unname(tools::sha256sum(inputs)), expected))
countries <- qs2::qs_read(country_file)
stopifnot(identical(stamp::st_hash_obj(countries), "9211182e995b116f"))
restore <- getFromNamespace(".st_restore_sanitized_object", "stamp")
countries <- restore(countries)
stopifnot(is.data.table(countries))
raw <- haven::read_dta(raw_file, encoding = "UTF-8")
setDT(raw)

pfw_lines <- readLines(pfw_source, warn = FALSE)
country_lines <- readLines(country_source, warn = FALSE)

# Evaluate each pinned source's exact region_code predicate, not a copied list.
region_rule <- function(lines) {
  i <- grep('region_code, description = "`region_code` values within range"',
            lines, fixed = TRUE)
  pattern <- "^validate_cols\\((in_set\\(c\\([^)]*\\)\\)),\\s*$"
  stopifnot(length(i) == 1L, grepl(pattern, trimws(lines[i - 1L]), perl = TRUE))
  rule <- sub(pattern, "\\1", trimws(lines[i - 1L]), perl = TRUE)
  return(eval(str2lang(rule), list(in_set = assertr::in_set), baseenv()))
}
pfw_rule <- region_rule(pfw_lines)
country_rule <- region_rule(country_lines)

local_reader <- "cl <- pipload::load_aux_data("
i <- grep(local_reader, pfw_lines, fixed = TRUE)
stopifnot(length(i) == 1L)
pfw_lines[i] <- sub(local_reader, "cl <- read_local_countries(", pfw_lines[i],
                    fixed = TRUE)
definitions <- as.list(parse(text = pfw_lines, keep.source = FALSE))
cleaner <- Filter(function(expr) {
  is.call(expr) && identical(expr[[1L]], quote(`<-`)) &&
    identical(expr[[2L]], quote(aux_pfw_clean))
}, definitions)
stopifnot(length(cleaner) == 1L)
local <- new.env(parent = globalenv())
local$read_local_countries <- function(measure, verbose) {
  stopifnot(identical(measure, "country_list"), isFALSE(verbose))
  return(countries)
}
eval(cleaner[[1L]], envir = local)
invisible(capture.output(suppressMessages(clean <- local$aux_pfw_clean(raw))))

# Verify the joined labels came directly from the staged country-list field.
projection <- unique(countries[, .(country_code, region_code)])
joined <- match(clean$country_code, projection$country_code)
stopifnot(!anyDuplicated(projection$country_code), !anyNA(joined),
          identical(as.character(clean$region_code),
                    as.character(projection$region_code[joined])))
pfw_reject <- !pfw_rule(clean$region_code) %in% TRUE
country_accept <- country_rule(clean$region_code) %in% TRUE
stopifnot(any(pfw_reject), identical(unname(tools::sha256sum(inputs)), expected),
          !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces()))

rejected <- clean[pfw_reject, .(
  pfw_rows = .N, countries = uniqueN(country_code)
), by = region_code][order(region_code)]
selected <- clean[
  country_code == "COL" & surveyid_year == 2010L & survey_acronym == "GEIH" &
    welfare_type == "income" & !is_alt_welf & inpovcal == 1,
  which = TRUE
]
cat(R.version.string, "\n")
cat("PASS: exact inputs, joined country-list code provenance, pinned rule replay.\n")
cat("Joined PFW rows:", nrow(clean), "; PFW-rejected:", sum(pfw_reject),
    "; PFW-rejected but country-list-rule accepted:",
    sum(pfw_reject & country_accept), "\n")
print(rejected)
cat("Selected COL/2010/GEIH/income included non-alternative mappings:",
    length(selected), "; PFW-rejected:", sum(pfw_reject[selected]), "\n")
print(clean[selected, .(mappings = .N), by = region_code])
cat("No producer, save, pipeline, or network call.\n")
