checkout <- Sys.getenv("QRE_CHECKOUT")
scratch <- normalizePath(Sys.getenv("QRE_SCRATCH"), winslash = "/")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(
  getRversion() == "4.5.2",
  startsWith(scratch, paste0(checkout, "/.tmp/qre/")),
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/")),
  identical(normalizePath(.libPaths(), winslash = "/"),
            normalizePath(c(libraries, .Library), winslash = "/"))
)
setwd(scratch)
qualification <- file.path(checkout, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/",
  "20261118T195108Z-qualification/qualified-stamp.R"
))
source(qualification)
qualified_stamp_namespace <- load_qualified_stamp()
cat("PASS: unchanged exact-build fingerprint loader; no shared aliases.\n")

# These are saved path strings only. path_abs is lexical: no UNC lookup/init.
historical_ids <- c(
  pfw = "4f7efb3695ee4849", cpi = "6e8535a1bb1d4326",
  ppp = "684e265fc5ac8351", pop = "3ca8789b53651783",
  gdp = "64322ec075203631", pce = "03542a9c6d4c04bf"
)
unc_root_text <- paste0(
  "//w1wbgencifs01/pip/pip_ingestion_pipeline_v2/",
  "aux_repository/aux_data/20260401_test/"
)
lexical_id <- function(path) {
  secretbase::siphash13(as.character(fs::path_abs(path)))
}
for (measure in names(historical_ids)) {
  canonical <- paste0(unc_root_text, measure, ".qs2")
  stored <- paste0("\\\\", substring(canonical, 3L))
  stopifnot(
    identical(lexical_id(stored), unname(historical_ids[[measure]])),
    identical(lexical_id(canonical), unname(historical_ids[[measure]])),
    !identical(stored, canonical)
  )
  cat("PASS:", measure, "historical artifact ID matches both lexical UNC forms;",
      "raw path strings differ.\n")
}

snapshot_tree <- function(root) {
  paths <- list.files(root, all.files = TRUE, recursive = TRUE,
                      include.dirs = TRUE, no.. = TRUE)
  files <- file.path(root, paths)
  return(list(paths = paths, sha256 = tools::sha256sum(files[!dir.exists(files)])))
}

# Only this disposable synthetic catalog is edited; no package/real-store edits.
root <- file.path(scratch, "synthetic")
stamp::st_opts(store_file_hash = TRUE, versioning = "content",
               retain_versions = Inf)
stamp::st_init(root, alias = "diagnosis", verbose = FALSE)
saved <- stamp::st_save(1:3, "values.rds", format = "rds", alias = "diagnosis",
                        verbose = FALSE)
reconcile <- function() {
  stamp::st_reconcile_latest("values.rds", saved$version_id,
                             saved$version_id, alias = "diagnosis", dry_run = TRUE)
}
stopifnot(identical(reconcile()$action, "noop"))
cat("PASS: coherent public-save baseline returns noop.\n")

file <- file.path(root, ".stamp/catalog.qs2")
catalog <- qs2::qs_read(file)
original_path <- catalog$artifacts$path[[1L]]
alternate_path <- chartr("/", "\\", original_path)
stopifnot(
  !identical(original_path, alternate_path),
  identical(lexical_id(original_path), lexical_id(alternate_path)),
  identical(normalizePath(original_path, winslash = "/", mustWork = FALSE),
            normalizePath(alternate_path, winslash = "/", mustWork = FALSE))
)
catalog$artifacts$path[[1L]] <- alternate_path
qs2::qs_save(catalog, file)
before <- snapshot_tree(root)
versions <- stamp::st_versions("values.rds", alias = "diagnosis")
payload <- stamp::st_load_version("values.rds", saved$version_id,
                                  alias = "diagnosis")
stopifnot(nrow(versions) == 1L, identical(as.integer(payload), 1:3))
refusal <- tryCatch(reconcile(), error = identity)
stopifnot(
  inherits(refusal, "stamp_reconcile_error"),
  grepl("Target and artifact catalog binding is not unique.",
        conditionMessage(refusal), fixed = TRUE),
  identical(before, snapshot_tree(root))
)
cat("PASS: equivalent Windows path spelling alone reproduces the exact error;",
    "public historical reads still succeed; dry-run tree/bytes unchanged.\n")

catalog$artifacts$path[[1L]] <- original_path
qs2::qs_save(catalog, file)
before <- snapshot_tree(root)
stopifnot(identical(reconcile()$action, "noop"),
          identical(before, snapshot_tree(root)))
cat("PASS: restoring only synthetic path spelling restores noop.\n")
cat("Shared lookup/registration/eligibility retry, catalog apply and survey: NOT RUN.\n")
cat("R:", R.version.string, "PID:", Sys.getpid(), "\n")
print(.libPaths())
for (package in sort(loadedNamespaces())) {
  path <- if (package == "base") file.path(.Library, "base") else
    getNamespaceInfo(asNamespace(package), "path")
  path <- normalizePath(path, winslash = "/", mustWork = TRUE)
  stopifnot(dirname(path) %in% normalizePath(.libPaths(), winslash = "/"))
  cat("Origin:", package, path, "\n")
}
