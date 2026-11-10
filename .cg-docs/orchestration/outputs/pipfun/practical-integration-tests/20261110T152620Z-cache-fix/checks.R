options(pipfun.log.auto = FALSE, pipfun.verbose = FALSE)
mode <- commandArgs(trailingOnly = TRUE)[[1L]]
run <- Sys.getenv("PIPFUN_FIX_RUN")
repo <- Sys.getenv("PIPFUN_FIX_REPO")
runtime <- file.path(run, "runtime")
stopifnot(startsWith(normalizePath(tempdir(), winslash = "/"), "E:/"),
          all(startsWith(normalizePath(.libPaths(), winslash = "/"), "E:/")))
cat("R:", R.version.string, "\nTemp:", tempdir(), "\nLibraries:\n")
print(.libPaths())
library(pipfun)
cat("pipfun namespace:", getNamespaceInfo(asNamespace("pipfun"), "path"), "\n")

diagnostic_root <- file.path(runtime, paste0("diagnostic-", mode))
cache <- fs::path(diagnostic_root, "pip_ingestion_pipeline/pc_data/cache/clean_survey_data")
stopifnot(!fs::dir_exists(diagnostic_root), !fs::dir_exists(cache))
if (mode == "baseline") {
  first <- tryCatch(pipfun::pip_create_globals(root_dir = diagnostic_root,
                                              vintage = NULL,
                                              create_dir = FALSE,
                                              verbose = FALSE), error = identity)
  stopifnot(inherits(first, "ENOENT"), !fs::dir_exists(diagnostic_root), !fs::dir_exists(cache))
  cat("EXPECTED BASELINE ENOENT:", conditionMessage(first), "\n")
  cat("Root exists:", fs::dir_exists(diagnostic_root), "cache exists:", fs::dir_exists(cache), "\n")
  quit(status = 0L)
}

library(data.table)
library(testthat)
options(testthat.edition = 3)
stopifnot(identical(normalizePath(find.package("pipfun"), winslash = "/"),
                    normalizePath(file.path(runtime, "library/pipfun"), winslash = "/")))
glbs <- pipfun::pip_create_globals(root_dir = diagnostic_root,
                                  vintage = NULL, create_dir = FALSE, verbose = FALSE)
stopifnot(identical(glbs$CACHE_SVY_DIR_PC, cache),
          !fs::dir_exists(diagnostic_root), !fs::dir_exists(cache))
cat("INSTALLED FRESH-ROOT PASS:", as.character(glbs$CACHE_SVY_DIR_PC), "\n")
cat("Root exists:", fs::dir_exists(diagnostic_root), "cache exists:", fs::dir_exists(cache), "\n")

# Existing vintage tests expect this PPP table; keep their network input local.
ppp_fixture <- data.table(
  ppp_year = c(2005, 2011, 2011, 2011, 2011, 2017, 2017, 2021, 2021),
  ppp_rv = c("v1", "v1", "v1", "v2", "v2", "v1", "v1", "v1", "v1"),
  ppp_av = c("v1", "v1", "v2", "v1", "v2", "v1", "v2", "v1", "v2")
)
run_tests <- function() {
  local_info <- Sys.info()
  cat("Actual Sys.info user before test-only substitution:", local_info[["user"]], "\n")
  local_info[["user"]] <- "pipfun-local-test"
  testthat::local_mocked_bindings(Sys.info = function() local_info, .package = "base")
  testthat::local_mocked_bindings(load_from_gh = function(...) copy(ppp_fixture),
                                 .package = "pipfun")
  testthat::test_dir(file.path(repo, "tests/testthat"),
                     filter = "^pip_create_(globals|vintage)$",
                     reporter = "summary", stop_on_failure = TRUE)
}
results <- run_tests()
counts <- as.data.table(as.data.frame(results))
print(counts[, .(file, test, failed, skipped, error, warning, passed)])
cat("TOTAL EXPECTATIONS:", sum(counts$passed), "passed;", sum(counts$failed), "failed\n")
print(sessionInfo())
