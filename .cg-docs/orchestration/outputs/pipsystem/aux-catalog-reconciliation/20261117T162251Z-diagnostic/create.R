# One synthetic artifact only; no producer/shared data or internal package APIs.
source(file.path(Sys.getenv("AUX_DIAG_OUTPUT"), "provenance.R"))
store <- file.path(scratch, paste0("store-", attempt))
stopifnot(!dir.exists(store))
first_input <- list(value = c(11L, 23L, 42L), label = "first")
second_input <- list(value = c(13L, 29L, 47L), label = "second")
invisible(stamp::st_opts(retain_versions = Inf))
invisible(stamp::st_init(store, alias = "local_diagnostic", verbose = FALSE))
first_save <- stamp::st_save(
  first_input, "item.rds", format = "rds", alias = "local_diagnostic",
  verbose = FALSE
)
stopifnot(is.character(first_save$version_id),
          length(first_save$version_id) == 1L, nzchar(first_save$version_id))
first_catalog <- as.data.frame(stamp::st_catalog_query(alias = "local_diagnostic"))
stopifnot(nrow(first_catalog) == 1L,
          identical(first_catalog$version_id, first_save$version_id))
second_save <- stamp::st_save(
  second_input, "item.rds", format = "rds", alias = "local_diagnostic",
  verbose = FALSE
)
stopifnot(is.character(second_save$version_id),
          length(second_save$version_id) == 1L, nzchar(second_save$version_id))
second_catalog <- as.data.frame(stamp::st_catalog_query(alias = "local_diagnostic"))
utils::write.table(
  data.frame(stage = c("first", "second"),
             returned_id = c(first_save$version_id, second_save$version_id),
             catalog_id = c(first_catalog$version_id, second_catalog$version_id)),
  file.path(output, paste0("save-trace-", attempt, ".tsv")),
  sep = "\t", row.names = FALSE, quote = FALSE
)
saveRDS(list(store = store,
             ids = c(first_save$version_id, second_save$version_id),
             creator_pid = Sys.getpid()),
        file.path(output, paste0("save-receipt-", attempt, ".rds")))
cat("Two changed public saves returned:", first_save$version_id,
    second_save$version_id, "\n")
source(file.path(output, "verify.R"))
