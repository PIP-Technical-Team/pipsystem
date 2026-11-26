# Run only in the user's already initialized R session. Read metadata only.
# Minimal first: existing APIs/tools, no producer, repair or new safeguards.
checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
stopifnot(dir.exists(checkout))
branch <- system2("git", c("-C", checkout, "branch", "--show-current"),
                  stdout = TRUE)
stopifnot(identical(branch, "main"))

options(pipfun.log.auto = FALSE, pipfun.verbose = FALSE, pipload.verbose = FALSE)
private_library <- file.path(
  checkout, ".tmp/one-survey/qmd-acceptance-20261113/library"
)
for (package in c("stamp", "pipload")) {
  namespace <- loadNamespace(package)
  stopifnot(identical(
    normalizePath(getNamespaceInfo(namespace, "path"), winslash = "/"),
    normalizePath(file.path(private_library, package), winslash = "/")
  ))
}
stopifnot("metadata_only" %in% names(formals(pipload::pip_read)))
expected_aux_root <- paste0(
  "//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2/",
  "aux_repository/aux_data/20260401_TEST"
)
stopifnot(identical(
  normalizePath(as.character(stamp::st_alias_get("aux")$root), winslash = "/"),
  normalizePath(expected_aux_root, winslash = "/")
))

# Query current catalog references, not stale hardcoded version choices.
catalog <- as.data.frame(stamp::st_catalog_query(alias = "aux"))
measures <- c("pfw", "cpi", "ppp", "pop", "gdp", "pce")
names_in_catalog <- basename(gsub("\\", "/", catalog$path, fixed = TRUE))
indices <- match(paste0(measures, ".qs2"), names_in_catalog)
stopifnot(!anyNA(indices))
checks <- lapply(seq_along(measures), function(index) {
  version <- catalog$version_id[[indices[[index]]]]
  outcome <- tryCatch({
    pipload::pip_read(
      id = measures[[index]], format = "qs2", alias = "aux",
      version = version, metadata_only = TRUE, verbose = FALSE
    )
    "PASS: historical sidecar readable (payload/hash not checked)"
  }, error = function(error) {
    paste("FAIL:", conditionMessage(error))
  })
  data.frame(measure = measures[[index]], version = version, outcome = outcome)
})
auxiliary_metadata_probe <- do.call(rbind, checks)
print(auxiliary_metadata_probe, row.names = FALSE)
cat("No producer, repair, survey payload or pipeline stage was requested.\n")
