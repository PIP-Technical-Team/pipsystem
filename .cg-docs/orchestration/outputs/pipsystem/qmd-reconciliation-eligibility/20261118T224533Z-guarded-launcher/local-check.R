# Synthetic local stores only. Never invoke run_shared_dry_run() in a test.
snapshot_tree <- function(root) {
  paths <- list.files(root, all.files = TRUE, recursive = TRUE,
                      include.dirs = TRUE, no.. = TRUE)
  files <- file.path(root, paths)
  return(list(paths = paths, sha256 = tools::sha256sum(files[!dir.exists(files)])))
}

setwd(scratch)
guard_parent <- file.path(scratch, "guards")
dir.create(guard_parent)
prerequisites <- c("root", "stamp", "temp", "logs", "catalog")
for (missing in prerequisites) {
  root <- file.path(guard_parent, missing)
  if (missing != "root") {
    dir.create(root)
    if (missing != "stamp") {
      dir.create(file.path(root, ".stamp"))
      if (missing != "temp") dir.create(file.path(root, ".stamp/temp"))
      if (missing != "logs") dir.create(file.path(root, ".stamp/logs"))
      if (missing != "catalog") {
        writeLines("synthetic unread catalog", file.path(root, ".stamp/catalog.qs2"))
      }
    }
  }
  before <- snapshot_tree(guard_parent)
  aliases <- stamp::st_alias_list()
  refusal <- tryCatch(register_existing_aux(root), error = identity)
  stopifnot(
    inherits(refusal, "error"),
    grepl("Missing existing auxiliary prerequisite", conditionMessage(refusal),
          fixed = TRUE),
    identical(aliases, stamp::st_alias_list()),
    identical(before, snapshot_tree(guard_parent))
  )
  cat("PASS: missing", missing, "refused before registration; tree/bytes unchanged.\n")
}

# Build a valid local store through public APIs, then measure registration only.
root <- file.path(scratch, "complete")
stamp::st_init(root, alias = "fixture", verbose = FALSE)
saved <- stamp::st_save(1:3, "values.rds", format = "rds", alias = "fixture",
                        verbose = FALSE)
before <- snapshot_tree(root)
registration <- register_existing_aux(root)
stopifnot(identical(before, snapshot_tree(root)))
result <- stamp::st_reconcile_latest(
  "values.rds", saved$version_id, saved$version_id, alias = "aux", dry_run = TRUE
)
stopifnot(identical(result$action, "noop"), identical(before, snapshot_tree(root)))
cat("PASS: public aux-only registration and noop preserve complete local tree/bytes.\n")

# The exact current cell must refuse this local alias before reading shared data.
state <- new.env(parent = baseenv())
state$qualified_stamp_namespace <- qualified_stamp_namespace
state$pip_checkout <- checkout
state$real_context <- list(main_dir = "//example.invalid/share/pipeline")
# Resolve only paths under the synthetic root; any UNC lookup fails this test.
state$normalizePath <- function(path, ...) {
  stopifnot("Local check attempted a shared path lookup" =
              !any(startsWith(as.character(path), "//")))
  base::normalizePath(path, ...)
}
code <- read_eligibility_code()
output <- utils::capture.output(eval(code, envir = state))
stopifnot(
  all(state$real_aux_results$status == "NOT RUN"),
  all(grepl("Local check attempted a shared path lookup",
            state$real_aux_results$detail, fixed = TRUE))
)
cat("PASS: local alias is not accepted as shared eligibility evidence.\n")

# In-memory source mutations never execute: the reviewed image must match first.
document_lines <- readLines(file.path(checkout, "experiments/pip-pipeline.qmd"),
                            warn = FALSE)
mutations <- list(
  target = c("dbd2ccf63260991d", "0000000000000000"),
  previous = c("5a1af0d6edf7d639", "0000000000000000"),
  apply = c("dry_run = TRUE", "dry_run = FALSE"),
  writer = c("print(real_aux_results, row.names = FALSE)",
             "unlink('unapproved-output')")
)
for (name in names(mutations)) {
  replacement <- mutations[[name]]
  changed <- sub(replacement[[1L]], replacement[[2L]], document_lines,
                 fixed = TRUE)
  stopifnot(!identical(changed, document_lines))
  refusal <- tryCatch(read_eligibility_code(changed), error = identity)
  stopifnot(
    inherits(refusal, "error"),
    grepl("Eligibility source differs from the reviewed cell",
          conditionMessage(refusal), fixed = TRUE),
    identical(before, snapshot_tree(root))
  )
  cat("PASS: unreviewed", name, "source change refused before evaluation.\n")
}

# Verify the probe reports the one altered field in a disposable JSON sidecar.
source(pin_diagnosis)
probe_root <- file.path(scratch, "pins")
stamp::st_init(probe_root, alias = "probe", verbose = FALSE)
pin <- stamp::st_save(1:3, "pfw.qs2", alias = "probe", verbose = FALSE)$version_id
test_output <- file.path(scratch, "pin-fixture.tsv")
before_probe <- snapshot_tree(probe_root)
first <- run_pin_diagnosis(probe_root, test_output, c(pfw = pin))
stopifnot(
  identical(first$observation, "OBSERVED"),
  all(unlist(first[-(1:3)])),
  identical(before_probe, snapshot_tree(probe_root)),
  identical(stamp::st_reconcile_latest("pfw.qs2", pin, pin, alias = "probe",
                                        dry_run = TRUE)$action, "noop")
)

sidecar <- file.path(probe_root, "pfw.qs2/versions", pin, "sidecar.json")
meta <- jsonlite::read_json(sidecar, simplifyVector = TRUE)
meta$path <- chartr("/", "\\", meta$path)
jsonlite::write_json(meta, sidecar, auto_unbox = TRUE, digits = NA)
before_probe <- snapshot_tree(probe_root)
altered <- run_pin_diagnosis(probe_root, test_output, c(pfw = pin))
refusal <- tryCatch(
  stamp::st_reconcile_latest("pfw.qs2", pin, pin, alias = "probe", dry_run = TRUE),
  error = identity
)
stopifnot(
  identical(altered$observation, "OBSERVED"),
  identical(names(which(!unlist(altered[-(1:3)]))), "path_exact"),
  inherits(refusal, "stamp_reconcile_error"),
  grepl("Pinned metadata and catalog disagree", conditionMessage(refusal),
        fixed = TRUE),
  identical(before_probe, snapshot_tree(probe_root))
)
cat("PASS: synthetic sidecar slash change reproduces the retry error;",
    "probe isolates path_exact without writes to the tested store.\n")
