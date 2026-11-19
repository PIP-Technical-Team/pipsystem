# Focused base-R checks: use only the existing private installed library.
checkout <- normalizePath(Sys.getenv("PIP_CHECKOUT", unset = "."),
                          winslash = "/", mustWork = TRUE)
document <- file.path(checkout, "experiments/pip-pipeline.qmd")
stopifnot(file.exists(document))
lines <- readLines(document, warn = FALSE)
starts <- grep("^```\\{r", lines)
chunks <- lapply(starts, function(start) {
  finish <- start + which(lines[(start + 1L):length(lines)] == "```")[1L]
  lines[(start + 1L):(finish - 1L)]
})
names(chunks) <- sub("^```\\{r ([^}]+)\\}$", "\\1", lines[starts])
invisible(lapply(chunks, function(code) parse(text = code)))
# BEGIN real-data setup checks
# Exercise the visible manual cell without initializing a release or store.
stopifnot(sum(names(chunks) == "real-data-setup") == 1L)
real_code <- chunks[["real-data-setup"]]
stopifnot(identical(real_code[[1L]], "#| eval: false"))
# This early oracle establishes the missing-cell red baseline offline.
stopifnot(sum(names(chunks) == "real-working-release") == 1L)
original_main_dir <- getOption("pipfun.main_dir")
original_root <- Sys.getenv("PIP_ROOT_DIR", unset = NA_character_)
(function() {
  on.exit({
    options(pipfun.main_dir = original_main_dir)
    if (is.na(original_root)) {
      Sys.unsetenv("PIP_ROOT_DIR")
    } else {
      Sys.setenv(PIP_ROOT_DIR = original_root)
    }
  }, add = TRUE)

  reader <- new.env(parent = baseenv())
  sys.source(file.path(checkout, "experiments/one-survey/local-root.R"), reader)
  fixture_root <- tempfile("local-root-")
  dir.create(fixture_root)
  on.exit(unlink(fixture_root, recursive = TRUE), add = TRUE)
  missing_config <- tryCatch(reader$read_pip_main(fixture_root), error = identity)
  stopifnot(inherits(missing_config, "error"),
            grepl("require .pip-local-root", conditionMessage(missing_config),
                  fixed = TRUE))
  fixture_config <- file.path(fixture_root, ".pip-local-root")
  writeLines("relative/path", fixture_config)
  stopifnot(inherits(tryCatch(reader$read_pip_main(fixture_root), error = identity),
                     "error"))
  writeLines("\\\\example.invalid\\share\\pipeline\\", fixture_config)
  source_with_fixture <- function(file, local) {
    assign("read_pip_main", function(checkout) reader$read_pip_main(fixture_root),
           envir = parent.frame())
  }

  namespaces_before <- loadedNamespaces()
  real_state <- new.env(parent = baseenv())
  real_state$source <- source_with_fixture
  # Deterministic directory test double, NOT current shared-folder evidence.
  real_state$dir.exists <- function(paths) rep(TRUE, length(paths))
  eval(parse(text = real_code), envir = real_state)
  expected_context <- list(
    release = "20260401",
    identity = "TEST",
    ppp = 2021,
    main_dir = "//example.invalid/share/pipeline",
    survey_id = "COL_2010_GEIH_V04_M_V01_A_GMD_GPWG",
    pip_id = "COL_2010_GEIH_INC_GPWG"
  )
  stopifnot(
    identical(real_state$real_context, expected_context),
    identical(getOption("pipfun.main_dir"), expected_context$main_dir),
    identical(Sys.getenv("PIP_ROOT_DIR"), dirname(expected_context$main_dir)),
    all(real_state$folder_status$exists)
  )

  # A missing directory must fail before the cell can print a PASS claim.
  missing_state <- new.env(parent = baseenv())
  missing_state$source <- source_with_fixture
  missing_state$dir.exists <- function(paths) rep(FALSE, length(paths))
  output <- utils::capture.output({
    missing_error <- tryCatch(
      eval(parse(text = real_code), envir = missing_state),
      error = function(error) error
    )
  })
  stopifnot(
    inherits(missing_error, "error"),
    !any(grepl("Folder existence: PASS", output, fixed = TRUE)),
    !any(c("pipfun", "pipdata", "pipload", "stamp") %in%
           setdiff(loadedNamespaces(), namespaces_before))
  )
})()
stopifnot(
  identical(getOption("pipfun.main_dir"), original_main_dir),
  identical(Sys.getenv("PIP_ROOT_DIR", unset = NA_character_), original_root)
)
cat(paste0(
  "PASS: offline context/control-flow checks with directory test doubles; ",
  "no shared-folder acceptance.\n"
))
# END real-data setup checks

# Inspect the manual initializer without loading packages or reading metadata.
stopifnot(sum(names(chunks) == "real-working-release") == 1L)
initialization_code <- chunks[["real-working-release"]]
stopifnot(identical(initialization_code[[1L]], "#| eval: false"))
initialization_text <- paste(initialization_code, collapse = "\n")
for (required_call in c(
  "pipfun::setup_working_release(", "pipfun::get_wrk_release(",
  "pipfun::get_pip_folders(", "pipfun::get_pip_aliases(",
  "stamp::st_alias_get("
)) {
  stopifnot(grepl(required_call, initialization_text, fixed = TRUE))
}
for (explicit_setting in c(
  "release = real_context$release", "identity = real_context$identity",
  "ppp = real_context$ppp", "main_dir = real_context$main_dir",
  "root_dir = legacy_root", "out_dir = legacy_root"
)) {
  stopifnot(grepl(explicit_setting, initialization_text, fixed = TRUE))
}
synthetic_setup <- paste(chunks[["release-setup"]], collapse = "\n")
stopifnot(
  grepl("ppp = 2021", synthetic_setup, fixed = TRUE),
  grepl("identical(working_release$ppp, 2021)", synthetic_setup, fixed = TRUE)
)
# Missing context fails before any namespace call; readbacks remain NOT RUN.
initialization_state <- new.env(parent = baseenv())
initialization_output <- utils::capture.output(
  eval(parse(text = initialization_code), envir = initialization_state)
)
stopifnot(
  identical(initialization_state$real_setup_results$status,
            c("FAIL", "NOT RUN")),
  !any(grepl("PASS", initialization_output, fixed = TRUE))
)
cat("PASS: manual initializer source/PPP/skip and failure control flow.\n")

# The read-only eligibility cell stays out of renders and stops in a cold session.
stopifnot(sum(names(chunks) == "real-auxiliary-eligibility") == 1L)
eligibility_code <- chunks[["real-auxiliary-eligibility"]]
stopifnot(identical(eligibility_code[[1L]], "#| eval: false"))
eligibility_text <- paste(eligibility_code, collapse = "\n")
stopifnot(
  grepl("stamp::st_reconcile_latest(", eligibility_text, fixed = TRUE),
  grepl("dry_run = TRUE", eligibility_text, fixed = TRUE),
  !grepl("dry_run\\s*=\\s*FALSE|st_(init|save|restore|rebuild|prune_versions)\\s*\\(",
         eligibility_text)
)
eligibility_state <- new.env(parent = baseenv())
eligibility_state$loadedNamespaces <- function() character()
invisible(utils::capture.output(
  eval(parse(text = eligibility_code), envir = eligibility_state)
))
stopifnot(
  nrow(eligibility_state$real_aux_results) == 6L,
  all(eligibility_state$real_aux_results$status == "NOT RUN"),
  all(grepl("qualified Stamp", eligibility_state$real_aux_results$detail,
            fixed = TRUE))
)
# Fixed, previously cross-checked pins; no dependency on local diagnostic output.
ranking <- data.frame(
  measure = c("pfw", "cpi", "ppp", "pop", "gdp", "pce"),
  catalog_pointer = c("5a1af0d6edf7d639", "02e66e507fb7946a", "13aa439a44297b23",
                      "44be5f221cdbd223", "9927e67693c42f7c", "6fde46585a733db2"),
  validated_id = c("dbd2ccf63260991d", "ae38185bd7ff383c", "c16e62d94f46e1bc",
                   "c059b971f5fc70cc", "062e2d30b15b4661", "4d57e305a0e3c86e")
)
stopifnot(
  identical(eligibility_state$real_aux_results$measure, ranking$measure),
  identical(eligibility_state$real_aux_results$previous, ranking$catalog_pointer),
  identical(eligibility_state$real_aux_results$target, ranking$validated_id)
)
cat("PASS: auxiliary eligibility cell is manual and cold-session checks stay NOT RUN.\n")

# Exercise the document's actual error recorder, not a duplicate implementation.
state <- new.env(parent = globalenv())
eval(parse(text = chunks[["reporting-init"]]), envir = state)
state$record_failure(simpleError("synthetic package blocker"), "Release setup")
stopifnot(
  identical(state$results$status[2L], "FAIL"),
  identical(state$results$detail[2L], "synthetic package blocker"),
  !state$pipeline_ok
)
eval(parse(text = chunks[["release-setup"]]), envir = state)
for (name in c(
  "auxiliary-inputs", "acquisition-validation", "cleaning-metadata-storage",
  "exact-readback", "invalid-no-output"
)) {
  eval(parse(text = chunks[[name]]), envir = state)
}
stopifnot(all(state$results$status[3:7] == "NOT RUN"))
cat("PASS: chunks parse; actual error is FAIL; dependencies remain NOT RUN.\n")

invisible(parse(file = file.path(
  checkout, "experiments/one-survey/qmd-fixtures.R"
)))
source(file.path(checkout, "experiments/one-survey/qmd-fixtures.R"))
fixtures <- survey_fixture_tables("valid-survey", "invalid-survey")
stopifnot(
  identical(fixtures$catalog$FileName,
            c("valid-survey.dta", "invalid-survey.dta")),
  identical(names(fixtures$aux), c("pfw", "cpi", "ppp", "pop", "gdp", "pce")),
  all(fixtures$aux$cpi$cpi_value == 1.4),
  identical(fixtures$aux$ppp$ppp, 1.6)
)
cat("PASS: fixture support parses; catalog and auxiliary values preserved.\n")
