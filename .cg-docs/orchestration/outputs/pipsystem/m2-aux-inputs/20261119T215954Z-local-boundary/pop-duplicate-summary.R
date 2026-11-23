# Local diagnosis only: reproduce key construction, with no producer or save.
root <- Sys.getenv("AUX_PROBE_ROOT")
scratch <- Sys.getenv("AUX_PROBE_SCRATCH")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(
  getRversion() == "4.5.2",
  identical(getwd(), scratch),
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/t/")),
  identical(
    normalizePath(.libPaths(), winslash = "/"),
    normalizePath(c(libraries, .Library), winslash = "/")
  )
)
suppressPackageStartupMessages({
  library(data.table)
  library(data.validator)
})
workbook <- file.path(root, ".tmp/m2pop/inputs/pop.xlsx")
source_path <- file.path(dirname(root), "pipaux/R/aux_pop.R")
report_source <- file.path(dirname(source_path), "validation_report.R")
paths <- c(workbook, source_path, report_source)
expected <- c(
  "4d5febb535435d55de1eae4ad011f5b3d8282b0508dec9d06884e97b65277708",
  "38e26add1c071b3f89e039ffdb0633118ee25beda97ce21cd7ae6cfafad3bc3e",
  "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0"
)
stopifnot(identical(unname(tools::sha256sum(paths)), expected))

producer <- new.env(parent = globalenv())
sys.source(source_path, envir = producer)
sys.source(report_source, envir = producer)
producer$in_set <- assertr::in_set
producer$not_na <- assertr::not_na
producer$is_uniq <- assertr::is_uniq
wide <- suppressMessages(readxl::read_excel(workbook))
long <- wide |>
  producer$clean_names_from_wide() |>
  producer$clean_from_wide()
groups <- long[
  , .(rows = .N, distinct_nonmissing = uniqueN(pop, na.rm = TRUE),
      missing = sum(is.na(pop))),
  by = .(country_code, year, pop_data_level)
][rows > 1L]
# Report counts only; do not emit workbook rows or alter the source.
cat("Reshaped rows:", nrow(long), "\n")
cat("Duplicate keys:", nrow(groups), "\n")
cat("Keys with conflicting nonmissing values:",
    groups[distinct_nonmissing > 1L, .N], "\n")
cat("Duplicate keys with any missing value:", groups[missing > 0L, .N], "\n")
cat("COL 2010 national duplicate keys:",
    groups[country_code == "COL" & year == 2010L & pop_data_level == 2L, .N],
    "\n")
cat("assertr is_uniq formals:", paste(names(formals(assertr::is_uniq)),
                                      collapse = ", "), "\n")
try_validator <- function(data, validator = producer$popmain_validate_raw) {
  tryCatch({
    validator(data, detail = FALSE)
    "PASS"
  }, error = function(error) conditionMessage(error))
}
workbook_result <- try_validator(long)
cat("Existing validator on workbook:", workbook_result, "\n")
control <- data.table(
  country_code = c("AAA", "AAA"), year = c(2010, 2011),
  pop_data_level = c(2, 2), pop = c(100, 200)
)
control_result <- try_validator(control)
cat("Existing validator on unique keys:", control_result, "\n")
direct <- tryCatch({
  with(control, assertr::is_uniq(country_code, year, pop_data_level))
}, error = function(error) conditionMessage(error))
cat("Direct three-column is_uniq call:", direct, "\n")
error_count <- function(data) {
  report <- data_validation_report()
  data |>
    validate(name = "Composite key control") |>
    validate_if(
      all(assertr::is_uniq(country_code, year, pop_data_level)),
      description = "no duplicate records in key variables"
    ) |>
    add_results(report)
  return(sum(get_results(report, unnest = FALSE)$type == "error"))
}
unique_errors <- error_count(control)
duplicate_errors <- error_count(rbind(control, control[1L]))
workbook_errors <- error_count(long)
cat(sprintf(
  "Scalar uniqueness predicate error counts: unique=%d, duplicate=%d, workbook=%d.\n",
  unique_errors, duplicate_errors, workbook_errors
))
stopifnot(
  nrow(groups) == 0L,
  identical(direct, c(TRUE, TRUE)),
  grepl("no[[:space:]]+duplicate records", workbook_result),
  grepl("no[[:space:]]+duplicate records", control_result),
  unique_errors == 0L,
  duplicate_errors == 1L,
  workbook_errors == 0L
)
rewrite_validator <- function(replacement) {
  altered <- producer$popmain_validate_raw
  expression <- "is_uniq(country_code, year, pop_data_level)"
  code <- paste(deparse(body(altered)), collapse = "\n")
  stopifnot(length(gregexpr(expression, code, fixed = TRUE)[[1L]]) == 1L,
            grepl(expression, code, fixed = TRUE))
  body(altered) <- parse(text = sub(expression, replacement, code,
                                    fixed = TRUE))[[1L]]
  return(altered)
}
forms <- c(
  qualified = "assertr::is_uniq(country_code, year, pop_data_level)",
  qualified_scalar = "all(assertr::is_uniq(country_code, year, pop_data_level))"
)
for (form in names(forms)) {
  validator <- rewrite_validator(forms[[form]])
  cat(sprintf(
    "Full validator (%s): unique fixture=%s, duplicate fixture=%s, workbook=%s.\n",
    form, try_validator(control, validator) == "PASS",
    try_validator(rbind(control, control[1L]), validator) == "PASS",
    try_validator(long, validator) == "PASS"
  ))
}
stopifnot(identical(unname(tools::sha256sum(paths)), expected))
cat("NOT RUN: population update, validation bypass and save.\n")
