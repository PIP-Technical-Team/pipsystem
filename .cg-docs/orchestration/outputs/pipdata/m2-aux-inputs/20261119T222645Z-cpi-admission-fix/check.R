root <- Sys.getenv("CPI_REPO")
path <- function(...) file.path(root, ...)
scope <- commandArgs(trailingOnly = TRUE)[[1L]]
stopifnot(scope %in% c("red", "green"))
scratch <- normalizePath(getwd(), winslash = "/", mustWork = TRUE)
is_e <- function(x) grepl("^E:/", x, ignore.case = TRUE)
.libPaths(strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]],
          include.site = FALSE)
libraries <- normalizePath(.libPaths(), winslash = "/", mustWork = TRUE)
base_library <- normalizePath(.Library, winslash = "/", mustWork = TRUE)
cat(R.version.string, "\nWorking directory:", scratch, "\nTemp:", tempdir(),
    "\nLibraries:", paste(libraries, collapse = " | "), "\n")
stopifnot(is_e(scratch), is_e(normalizePath(tempdir(), winslash = "/")),
          all(is_e(setdiff(tolower(libraries), tolower(base_library)))))

implementation <- new.env(parent = globalenv())
library(testthat)
for (package in c("wbpip", "testthat", "data.table", "codetools")) {
  location <- normalizePath(find.package(package), winslash = "/")
  stopifnot(is_e(location) || identical(package, "codetools"))
  cat(package, as.character(utils::packageVersion(package)), location, "\n")
}

# Emulate only pipdata's namespace lookup; use the shipped adapter, allowlist,
# code canonicalizer, domain registry and installed arithmetic unchanged.
implementation$asNamespace <- function(name) {
  if (identical(name, "pipdata")) implementation else base::asNamespace(name)
}
source_file <- function(file, select = NULL) {
  for (expression in parse(file)) {
    if (is.null(select) || (is.call(expression) &&
        identical(expression[[1L]], quote(`<-`)) &&
        is.symbol(expression[[2L]]) &&
        as.character(expression[[2L]]) %in% select)) {
      eval(expression, implementation)
    }
  }
}
source_file(path("R", "aaa.R"), ".data_level_columns")
source_file(path("R", "pd_deflation.R"))
source_file(path("R", "code_fingerprint.R"))

file <- path("tests", "testthat", "test-pd-deflation.R")
tests <- parse(file)
is_bounded <- function(expression) {
  is.call(expression) && identical(expression[[1L]], quote(test_that)) &&
    startsWith(expression[[2L]], "bounded ")
}
source_file(file, "bounded_deflation_inputs")
bounded <- Filter(is_bounded, as.list(tests))
if (scope == "red") {
  bounded <- Filter(function(x) startsWith(x[[2L]],
    "bounded CPI allows missing"), bounded)
  stopifnot(length(bounded) == 1L)
}
cat("Selected test blocks:", length(bounded), "\n")
run_tests <- function() {
  testthat::local_edition(3)
  reporter <- testthat::ListReporter$new()
  testthat::with_reporter(reporter, {
    reporter$start_file(file)
    for (expression in bounded) eval(expression, implementation)
    reporter$end_file()
  })
  result <- as.data.frame(reporter$get_results())
  print(result[c("test", "failed", "error", "warning", "skipped", "passed")],
        row.names = FALSE)
  cat("Passing expectations:", sum(result$passed), "\n")
  stopifnot(nrow(result) == length(bounded), !any(result$failed),
    !any(result$error), !any(result$warning), !any(result$skipped))
}
if (scope == "red") {
  local({
    testthat::local_edition(3)
    eval(bounded[[1L]], implementation)
  })
} else {
  run_tests()
  calculation <- function(path, parents) {
    pd_deflate_microdata(NULL, NULL, NULL, NULL)
  }
  proof <- implementation$pd_engine_proof(calculation, list(), list())
  frozen <- environment(get("pd_deflate_microdata", proof$environment))
  for (helper in c("pd_deflate_microdata", "pd_deflation_number",
                   "pd_deflation_select")) {
    component <- proof$components[[paste0("adapter:", helper)]]
    source <- implementation$pd_canonical_function(implementation[[helper]])
    effective <- implementation$pd_canonical_function(get(helper, frozen))
    stopifnot(identical(source, effective),
      identical(component$algorithm, "sha256"),
      identical(component$hash, implementation$pd_engine_digest(effective)))
    cat("PASS: exact proof component", helper, component$hash, "\n")
  }
}
stopifnot(!any(c("pipdata", "pipload", "pipfun", "pipaux", "dlw", "stamp") %in%
               loadedNamespaces()))
