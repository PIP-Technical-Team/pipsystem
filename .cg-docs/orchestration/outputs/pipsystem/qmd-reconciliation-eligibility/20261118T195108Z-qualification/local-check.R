# Local qualification only; this script has no live entry point.
checkout <- Sys.getenv("QRE_CHECKOUT")
scratch <- normalizePath(Sys.getenv("QRE_SCRATCH"), winslash = "/")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(getRversion() == "4.5.2",
          startsWith(scratch, paste0(checkout, "/.tmp/qre/")),
          startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/")),
          identical(normalizePath(.libPaths(), winslash = "/"),
                    normalizePath(c(libraries, .Library), winslash = "/")))
setwd(scratch)
loader <- file.path(
  Sys.getenv("QRE_QUALIFICATION", unset = Sys.getenv("QRE_BUNDLE")),
  "qualified-stamp.R"
)
bad_identity <- new.env(parent = baseenv())
source(loader, local = bad_identity)
# Change only this test's expected hash, not the installed package or its files.
bad_identity$stamp_fingerprints[["NAMESPACE"]] <- strrep("0", 64L)
identity_refusal <- tryCatch(bad_identity$load_qualified_stamp(), error = identity)
stopifnot(inherits(identity_refusal, "error"),
          grepl("fingerprint mismatch", conditionMessage(identity_refusal), fixed = TRUE),
          !"stamp" %in% loadedNamespaces())
cat("PASS: same-path fingerprint mismatch rejected before Stamp load.\n")

source(loader)
qualified_stamp_namespace <- load_qualified_stamp()
reload_refusal <- tryCatch(load_qualified_stamp(), error = identity)
stopifnot(inherits(reload_refusal, "error"),
          grepl("Stamp is already loaded", conditionMessage(reload_refusal), fixed = TRUE))
stamp_root <- normalizePath(getNamespaceInfo(qualified_stamp_namespace, "path"),
                            winslash = "/")
stopifnot(identical(stamp_root, normalizePath(stamp_install, winslash = "/")),
          identical(names(formals(stamp::st_reconcile_latest)),
                    c("path", "version_id", "expected_previous_id", "alias", "dry_run")),
          identical(formals(stamp::st_reconcile_latest)$dry_run, TRUE))
cat("R:", R.version.string, "PID:", Sys.getpid(), "\nStamp:", stamp_root, "\n")
print(.libPaths())
for (package in sort(loadedNamespaces())) {
  if (package == "base") next
  path <- normalizePath(getNamespaceInfo(asNamespace(package), "path"), winslash = "/")
  stopifnot(dirname(path) %in% normalizePath(.libPaths(), winslash = "/"))
  cat("Namespace:", package, as.character(getNamespaceVersion(package)), path, "\n")
}

# Fresh local store: prove that the loaded build can check coherent bytes and
# reject a non-latest target without writing a lock, payload, or catalog.
root <- file.path(scratch, "store")
stamp::st_opts(store_file_hash = TRUE, versioning = "content", retain_versions = Inf)
stamp::st_init(root, alias = "local_check", verbose = FALSE)
first <- stamp::st_save(1:3, "values.rds", format = "rds", alias = "local_check",
                        verbose = FALSE)$version_id
Sys.sleep(1.1) # Avoid a timestamp tie in this synthetic store.
latest <- stamp::st_save(4:6, "values.rds", format = "rds", alias = "local_check",
                         verbose = FALSE)$version_id
snapshot <- function() {
  paths <- list.files(root, all.files = TRUE, recursive = TRUE, include.dirs = TRUE)
  files <- file.path(root, paths)
  list(paths = paths, md5 = tools::md5sum(files[!dir.exists(files)]))
}
before <- snapshot()
result <- stamp::st_reconcile_latest("values.rds", latest, latest,
                                     alias = "local_check", dry_run = TRUE)
refusal <- tryCatch(
  stamp::st_reconcile_latest("values.rds", first, latest,
                             alias = "local_check", dry_run = TRUE),
  error = identity
)
stopifnot(identical(result$action, "noop"), inherits(refusal, "stamp_reconcile_error"),
          grepl("unique valid chronological latest", conditionMessage(refusal), fixed = TRUE),
          identical(before, snapshot()))
cat("PASS: qualified build returned noop, rejected non-latest target, and preserved local bytes/tree.\n")

setwd(checkout)
source("experiments/one-survey/check-qmd.R")

# The qualified namespace is loaded, but the synthetic alias is not "aux".
# This executes the real cell's no-alias branch before any shared path lookup.
no_alias_state <- new.env(parent = globalenv())
no_alias_state$pip_checkout <- checkout
invisible(utils::capture.output(
  eval(parse(text = eligibility_code), envir = no_alias_state)
))
stopifnot(all(no_alias_state$real_aux_results$status == "NOT RUN"),
          all(grepl("aux alias must already be registered",
                    no_alias_state$real_aux_results$detail, fixed = TRUE)))
cat("PASS: the actual qualified namespace with no aux alias refuses live checks.\n")
