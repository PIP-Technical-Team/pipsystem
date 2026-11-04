run <- ".cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel"
base <- file.path(run, "baseline")
bytes <- function(path) readBin(path, "raw", n = file.info(path)$size)
for (path in c("tools/pipsys/pipsys.R", "tests/pipsys/test-pipsys.R")) {
  stopifnot(identical(bytes(path), bytes(file.path(base, gsub("/", "__", path, fixed = TRUE)))))
  cat("Existing dirty content preserved:", path, "\n")
}
for (kind in c("commands", "agents")) {
  sources <- list.files(file.path("tools/pipsys/kilo", kind), pattern = "\\.md$", full.names = TRUE)
  for (source in sources) {
    name <- basename(source)
    installed <- file.path(".kilo", kind, name)
    stopifnot(identical(bytes(source), bytes(installed)))
    if (name != "pip-next.md") {
      stopifnot(identical(bytes(installed), bytes(file.path(base, paste0("installed__", kind, "__", name)))))
    }
    cat("Byte parity and non-target preservation:", installed, "\n")
  }
}
invisible(jsonlite::fromJSON("kilo.json"))
invisible(jsonlite::fromJSON("tests/pipsys/fixtures/pip-next-cases.json"))
invisible(parse("tests/pipsys/test-pip-next.R"))
cat("Configuration/fixture JSON and touched R syntax parsed successfully\n")
state <- jsonlite::fromJSON(".cg-docs/active-state/current.json", simplifyVector = FALSE)
task <- jsonlite::fromJSON(".cg-docs/active-state/2026-11-03-pip-next-concise.json", simplifyVector = FALSE)
prior <- jsonlite::fromJSON(".cg-docs/active-state/2026-11-02-pip-next-before-concise.json", simplifyVector = FALSE)
stopifnot(state$status == "completed", task$status == "completed")
stopifnot(identical(state$plan, task$plan), state$activationStatus == "pending-reload")
for (reference in prior$artifactRefs) {
  stopifnot(any(vapply(state$artifactRefs, identical, logical(1), reference)))
}
cat("Completed active-state records parse and preserve all prior artifact references\n")
