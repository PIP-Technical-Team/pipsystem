args <- commandArgs(trailingOnly = TRUE)
stopifnot(length(args) == 1L)
run <- normalizePath(".cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel", winslash = "/")
stopifnot(startsWith(normalizePath(tempdir(), winslash = "/"), "E:/"))
cat("Runtime:", R.version.string, "\nTemporary directory:", tempdir(), "\n")
result <- testthat::test_file(args[1], reporter = "summary", stop_on_failure = FALSE)
rows <- as.data.frame(result)
summary <- list(
  file = args[1], tests = nrow(rows), passed = sum(rows$passed),
  failed = sum(rows$failed), errors = sum(rows$error),
  warnings = sum(rows$warning), skipped = sum(rows$skipped)
)
print(summary)
jsonlite::write_json(summary, file.path(run, paste0(basename(args[1]), ".result.json")), auto_unbox = TRUE, pretty = TRUE)
quit(save = "no", status = as.integer(summary$failed > 0 || summary$errors > 0))
