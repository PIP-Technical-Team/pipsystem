scratch <- normalizePath(Sys.getenv("SQ_SCRATCH"), winslash = "/", mustWork = TRUE)
output <- Sys.getenv("SQ_OUTPUT")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(
  getRversion() == "4.5.2",
  identical(getwd(), scratch),
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/t/")),
  identical(normalizePath(.libPaths(), winslash = "/"),
            normalizePath(c(libraries, .Library), winslash = "/")),
  !"stamp" %in% loadedNamespaces()
)
stamp_install <- file.path(scratch, "l/stamp")
images <- readLines(file.path(output, "tool.sha256"))
paths <- substring(images, 67L)
stopifnot(
  length(images) == 5L,
  identical(unname(tools::sha256sum(paths)), substring(images, 1L, 64L))
)
namespace <- loadNamespace("stamp", lib.loc = dirname(stamp_install))
stopifnot(identical(normalizePath(getNamespaceInfo(namespace, "path"),
                                  winslash = "/"), stamp_install))
cat(R.version.string, "PID", Sys.getpid(), "\nStamp:", stamp_install,
    "\nTemp:", tempdir(), "\nLibraries:\n")
print(.libPaths())
cat("PATH first entry:", strsplit(Sys.getenv("PATH"), ";", fixed = TRUE)[[1L]][1L],
    "\n")

results <- testthat::test_dir(
  file.path(stamp_install, "tests/testthat"),
  reporter = "summary", stop_on_failure = FALSE, stop_on_warning = FALSE,
  load_package = "installed", package = "stamp"
)
counts <- as.data.frame(results)
stopifnot(nrow(counts) > 0L)
cat("Contexts:", paste(unique(counts$context), collapse = ", "), "\n")
cat(sprintf("PASS %d | FAIL %d | ERROR %d | WARN %d | SKIP %d\n",
            sum(counts$passed), sum(counts$failed), sum(counts$error),
            sum(counts$warning), sum(counts$skipped)))

packages <- sort(loadedNamespaces())
origins <- vapply(packages, function(package) {
  path <- if (package == "base") file.path(.Library, "base") else
    getNamespaceInfo(asNamespace(package), "path")
  normalizePath(path, winslash = "/", mustWork = TRUE)
}, "")
utils::write.table(data.frame(package = packages, path = unname(origins)),
                   file.path(output, "suite-origins.tsv"), sep = "\t",
                   row.names = FALSE)
stopifnot(all(dirname(origins) %in% normalizePath(.libPaths(), winslash = "/")))
dlls <- getLoadedDLLs()
utils::write.table(data.frame(name = names(dlls), path = vapply(dlls, function(dll) {
  dll[["path"]]
}, "")), file.path(output, "suite-dlls.tsv"), sep = "\t", row.names = FALSE)
stopifnot(!any(counts$failed > 0L | counts$error | counts$warning > 0L |
                counts$skipped))
