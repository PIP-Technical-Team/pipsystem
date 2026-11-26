# Independent public reader: write this before the creator, then run red/green.
if (!exists("diag_context", inherits = FALSE)) {
  source(file.path(Sys.getenv("AUX_DIAG_OUTPUT"), "provenance.R"))
}
receipt_path <- file.path(output, paste0("save-receipt-", attempt, ".rds"))
if (!file.exists(receipt_path)) {
  stop("Diagnostic save receipt is unavailable; creation has not run.",
       call. = FALSE)
}
saved <- readRDS(receipt_path)
assert_diagnostic <- function(label, condition) {
  if (!isTRUE(condition)) stop(label, call. = FALSE)
  cat("PASS:", label, "\n")
}
expected_first <- list(value = c(11L, 23L, 42L), label = "first")
expected_second <- list(value = c(13L, 29L, 47L), label = "second")
store <- file.path(scratch, paste0("store-", attempt))
assert_diagnostic("receipt uses only this local store", identical(saved$store, store))
assert_diagnostic("local store already exists", dir.exists(store))
assert_diagnostic("two nonempty distinct returned version IDs",
  is.character(saved$ids) && length(saved$ids) == 2L &&
  all(grepl("^[0-9a-f]{16}$", saved$ids)) && !anyDuplicated(saved$ids))
if (mode == "second") {
  assert_diagnostic("readback runs in a different R process",
                    !identical(saved$creator_pid, Sys.getpid()))
}
invisible(stamp::st_opts(retain_versions = Inf))
invisible(stamp::st_init(store, alias = "local_diagnostic", verbose = FALSE))
assert_diagnostic("public alias is the local synthetic root", identical(
  normalizePath(as.character(stamp::st_alias_get("local_diagnostic")$root),
                winslash = "/"), store
))
versions <- as.data.frame(stamp::st_versions("item.rds", alias = "local_diagnostic"))
catalog <- as.data.frame(stamp::st_catalog_query(alias = "local_diagnostic"))
assert_diagnostic("exactly both returned IDs retained",
  nrow(versions) == 2L && setequal(versions$version_id, saved$ids))
assert_diagnostic("single catalog row points to the second returned ID",
  nrow(catalog) == 1L && identical(catalog$version_id, saved$ids[[2L]]))
current <- stamp::st_load("item.rds", alias = "local_diagnostic", verbose = FALSE)
first <- stamp::st_load("item.rds", alias = "local_diagnostic",
                        version = saved$ids[[1L]], verbose = FALSE)
second <- stamp::st_load("item.rds", alias = "local_diagnostic",
                         version = saved$ids[[2L]], verbose = FALSE)
assert_diagnostic("current payload exactly equals independent second input",
                  identical(current, expected_second))
assert_diagnostic("first exact payload equals independent first input",
                  identical(first, expected_first))
assert_diagnostic("second exact payload equals independent second input",
                  identical(second, expected_second))
current_metadata <- stamp::st_read_sidecar("item.rds", alias = "local_diagnostic")
first_metadata <- stamp::st_read_sidecar("item.rds", alias = "local_diagnostic",
                                        version_id = saved$ids[[1L]])
second_metadata <- stamp::st_read_sidecar("item.rds", alias = "local_diagnostic",
                                         version_id = saved$ids[[2L]])
first_hash <- stamp::st_hash_obj(expected_first)
second_hash <- stamp::st_hash_obj(expected_second)
assert_diagnostic("independent input content hashes differ",
                  !identical(first_hash, second_hash))
assert_diagnostic("first historical sidecar has independent first content hash",
                  identical(first_metadata$content_hash, first_hash))
assert_diagnostic("second historical sidecar has independent second content hash",
                  identical(second_metadata$content_hash, second_hash))
assert_diagnostic("current sidecar and catalog have independent second content hash",
  identical(current_metadata$content_hash, second_hash) &&
  identical(catalog$content_hash, second_hash))
latest_order <- order(versions$created_at, versions$version_id, decreasing = TRUE)
assert_diagnostic("public latest follows timestamp/version-ID ordering",
  identical(stamp::st_latest("item.rds", alias = "local_diagnostic"),
            versions$version_id[[latest_order[[1L]]]]))
cat("Timestamp tie:", anyDuplicated(versions$created_at) > 0L, "\n")
utils::write.table(versions,
  file.path(output, paste0(mode, "-", attempt, "-versions.tsv")),
  sep = "\t", row.names = FALSE, quote = FALSE)
cat("PASS: all local public diagnostic assertions; shared readiness NOT RUN\n")
