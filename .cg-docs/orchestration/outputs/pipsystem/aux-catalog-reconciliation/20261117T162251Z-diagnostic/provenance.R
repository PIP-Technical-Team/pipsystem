# Selective existing receipt checks: no install/setup/whole-ecosystem loading.
source_root <- normalizePath(Sys.getenv("AUX_DIAG_SOURCE_ROOT"),
                             winslash = "/", mustWork = TRUE)
scratch <- normalizePath(Sys.getenv("ONE_SURVEY_ROOT"), winslash = "/",
                         mustWork = TRUE)
output <- normalizePath(Sys.getenv("AUX_DIAG_OUTPUT"), winslash = "/",
                        mustWork = TRUE)
mode <- Sys.getenv("AUX_DIAG_MODE")
attempt <- Sys.getenv("AUX_DIAG_ATTEMPT")
checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
stopifnot(
  startsWith(scratch, paste0(checkout, "/.tmp/aux-catalog-reconciliation/")),
  startsWith(output, paste0(checkout, "/.cg-docs/orchestration/outputs/")),
  identical(normalizePath(R.home(), winslash = "/"), file.path(scratch, "r")),
  identical(normalizePath(.libPaths(), winslash = "/"),
            c(file.path(source_root, "library"), file.path(scratch, "r/library"))),
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/")),
  all(startsWith(normalizePath(Sys.getenv(c("HOME", "TEMP", "TMP", "TMPDIR")),
                               winslash = "/"), paste0(scratch, "/")))
)
inventory <- readRDS(file.path(source_root, "inventory.rds"))
pins <- read.delim(file.path(source_root, "pins.tsv"), stringsAsFactors = FALSE)
stamp_sha <- "95890411e8bf9db842593c2b0ab68ec4f2a66b25"
receipt <- inventory$receipts$stamp
stopifnot(
  identical(inventory$root, source_root),
  identical(pins$sha[pins$package == "stamp"], stamp_sha),
  identical(inventory$packages$sha[inventory$packages$package == "stamp"], stamp_sha),
  identical(receipt$root, source_root), identical(receipt$sha, stamp_sha),
  receipt$exit == 0L,
  identical(receipt$path, file.path(source_root, "library/stamp")),
  identical(receipt$archive_md5, unname(tools::md5sum(
    file.path(source_root, "sources/stamp.tar")
  ))),
  identical(receipt$installed_md5, unname(tools::md5sum(
    file.path(receipt$path, "Meta/package.rds")
  ))),
  any(grepl("DONE (stamp)", readLines(receipt$log), fixed = TRUE))
)
dependencies <- inventory$dependencies
recorded <- read.delim(file.path(source_root, "dependencies.tsv"),
                       stringsAsFactors = FALSE, check.names = FALSE)
stopifnot(identical(dependencies, recorded), !anyDuplicated(dependencies$package))
for (index in seq_len(nrow(dependencies))) {
  dependency <- dependencies[index, ]
  description <- file.path(source_root, "library", dependency$package, "DESCRIPTION")
  stopifnot(
    identical(dependency$path, dirname(description)),
    identical(dependency$description_md5, unname(tools::md5sum(description))),
    identical(dependency$version, unname(read.dcf(description)[1L, "Version"]))
  )
}
loadNamespace("stamp")
loaded <- loadedNamespaces()
forbidden <- c("pipfun", "pipload", "pipaux", "pipdata", "wbpip", "dlw")
stopifnot(!any(forbidden %in% loaded))
paths <- vapply(loaded, function(package) {
  if (package == "base") file.path(.Library, "base") else
    getNamespaceInfo(asNamespace(package), "path")
}, "")
for (package in names(paths)) {
  path <- normalizePath(paths[[package]], winslash = "/", mustWork = TRUE)
  if (package %in% c("stamp", dependencies$package)) {
    expected <- file.path(source_root, "library", package)
  } else {
    expected <- file.path(scratch, "r/library", package)
  }
  stopifnot(identical(path, expected))
}
utils::write.table(
  data.frame(package = names(paths), path = unname(paths), pid = Sys.getpid()),
  file.path(output, paste0(mode, "-", attempt, "-namespaces.tsv")),
  sep = "\t", row.names = FALSE, quote = FALSE
)
cat("PASS: private receipts and", nrow(dependencies),
    "dependency descriptions; stamp SHA", stamp_sha, "\n")
cat("PASS: copied R home", R.home(), "PID", Sys.getpid(), "\n")
cat("PASS: exact original contributed/copied base origins; no PIP packages loaded\n")
diag_context <- list(source_root = source_root, scratch = scratch, output = output,
                     mode = mode, attempt = attempt, stamp_sha = stamp_sha)
