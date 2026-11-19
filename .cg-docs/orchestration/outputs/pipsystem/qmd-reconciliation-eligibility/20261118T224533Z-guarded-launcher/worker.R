# Only the PowerShell launcher's explicit user switches select shared modes.
checkout <- Sys.getenv("QRE_CHECKOUT")
bundle <- Sys.getenv("QRE_BUNDLE")
qualification <- Sys.getenv("QRE_QUALIFICATION")
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

record_origins <- function() {
  packages <- sort(loadedNamespaces())
  origins <- vapply(packages, function(package) {
    path <- if (package == "base") file.path(.Library, "base") else
      getNamespaceInfo(asNamespace(package), "path")
    normalizePath(path, winslash = "/", mustWork = TRUE)
  }, "")
  stopifnot(
    "Namespace outside the declared libraries" =
      all(dirname(origins) %in% normalizePath(.libPaths(), winslash = "/")),
    "Unexpected PIP namespace in auxiliary-only check" =
      !any(c("pipfun", "pipdata", "pipload", "pipaux") %in% packages)
  )
  rows <- data.frame(
    package = packages,
    version = vapply(packages, function(package) {
      as.character(getNamespaceVersion(package))
    }, ""),
    origin = unname(origins)
  )
  path <- sub("\\.tsv$", "-origins.tsv", Sys.getenv("QRE_OUTPUT"))
  utils::write.table(rows, path, sep = "\t", quote = TRUE, row.names = FALSE)
  cat("R:", R.version.string, "PID:", Sys.getpid(), "\n")
  print(.libPaths())
  cat("Namespace origins:", path, "\n")
  invisible(NULL)
}

catalog_hash <- function(path) {
  hash <- unname(tools::sha256sum(path))
  stopifnot("Cannot read the existing catalog" = length(hash) == 1L && !is.na(hash))
  return(hash)
}

assert_catalog_unchanged <- function(path, expected) {
  if (!identical(catalog_hash(path), expected)) {
    rlang::abort(paste(
      "Sampled catalog SHA256 changed; stop without rollback.",
      "This observation does not distinguish this process from concurrent work."
    ))
  }
  invisible(NULL)
}

register_existing_aux <- function(root) {
  directories <- c(root, file.path(root, c(".stamp", ".stamp/temp", ".stamp/logs")))
  catalog <- file.path(root, ".stamp/catalog.qs2")
  missing <- c(directories[!dir.exists(directories)],
               catalog[!file.exists(catalog) || dir.exists(catalog)])
  if (length(missing)) {
    rlang::abort(paste("Missing existing auxiliary prerequisite:",
                       paste(missing, collapse = "; ")))
  }
  before <- catalog_hash(catalog)
  aliases_before <- stamp::st_alias_list()$alias
  stopifnot("Use a fresh process without an aux alias" = !"aux" %in% aliases_before)
  previous <- lapply(aliases_before, stamp::st_alias_get)
  # Even an unexpected initializer error must still sample the catalog again.
  on.exit(assert_catalog_unchanged(catalog, before), add = TRUE)
  stamp::st_init(root = root, alias = "aux", verbose = FALSE)
  alias <- stamp::st_alias_get("aux")
  normalize <- function(path) {
    unname(normalizePath(as.character(path), winslash = "/", mustWork = TRUE))
  }
  stopifnot(
    identical(normalize(alias$root), normalize(root)),
    identical(normalize(alias$stamp_path), normalize(file.path(root, ".stamp"))),
    setequal(stamp::st_alias_list()$alias, c(aliases_before, "aux")),
    identical(lapply(aliases_before, stamp::st_alias_get), previous)
  )
  return(list(catalog = catalog, hash = before))
}

read_eligibility_code <- function(lines = readLines(
  file.path(checkout, "experiments/pip-pipeline.qmd"), warn = FALSE
)) {
  start <- which(lines == "```{r real-auxiliary-eligibility}")
  stopifnot("Expected one manual eligibility chunk" = length(start) == 1L)
  finish <- start + which(lines[seq.int(start + 1L, length(lines))] == "```")[1L]
  code <- lines[seq.int(start + 1L, finish - 1L)]
  text <- paste(code, collapse = "\n")
  # Bind the exact reviewed cell, including all six pins, not only call spelling.
  image <- tempfile("eligibility-", tmpdir = scratch, fileext = ".R")
  on.exit(unlink(image), add = TRUE)
  writeBin(charToRaw(text), image)
  image_hash <- unname(tools::sha256sum(image))
  cat("Eligibility cell SHA256:", image_hash, "\n")
  expected_hash <- paste0(
    "2922b5eba7711b366169ea8a106fdb26c",
    "03279eea1d3d6e7695675e816ffc402"
  )
  if (!identical(image_hash, expected_hash)) {
    rlang::abort(paste("Eligibility source differs from the reviewed cell;",
                       "requalify locally. Observed SHA256:", image_hash))
  }
  stopifnot(
    identical(code[[1L]], "#| eval: false"),
    grepl("stamp::st_reconcile_latest(", text, fixed = TRUE),
    grepl("dry_run = TRUE", text, fixed = TRUE),
    !grepl("dry_run\\s*=\\s*FALSE|st_(init|save|restore|rebuild|prune_versions)\\s*\\(",
           text)
  )
  return(parse(text = code))
}

source(file.path(checkout, "experiments/one-survey/local-root.R"))
shared_aux_root <- function(main) file.path(main, "aux_repository/aux_data/20260401_TEST")
pin_diagnosis <- file.path(checkout, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/",
  "20261119T162506Z-pin-diagnosis/read-pins.R"
))

run_shared_dry_run <- function() {
  source(file.path(qualification, "qualified-stamp.R"), local = TRUE)
  qualified_stamp_namespace <- load_qualified_stamp()
  cat("PASS: exact corrected Stamp build fingerprints verified before shared lookup.\n")
  stopifnot(nrow(stamp::st_alias_list()) == 0L)
  code <- read_eligibility_code()
  main <- read_pip_main(checkout)
  registration <- register_existing_aux(shared_aux_root(main))
  cat("PASS: existing prerequisites, aux-only registration and catalog hash.\n")
  on.exit(assert_catalog_unchanged(registration$catalog, registration$hash),
          add = TRUE)
  state <- new.env(parent = baseenv())
  state$qualified_stamp_namespace <- qualified_stamp_namespace
  state$pip_checkout <- checkout
  state$real_context <- list(main_dir = main)
  # Do not source or render the document or run its release initializer.
  eval(code, envir = state)
  rows <- state$real_aux_results
  utils::write.table(rows, Sys.getenv("QRE_OUTPUT"), sep = "\t", quote = TRUE,
                     row.names = FALSE, na = "")
  assert_catalog_unchanged(registration$catalog, registration$hash)
  cat("PASS: sampled catalog SHA256 unchanged after dry-runs.\n")
  cat("Catalog SHA256:", registration$hash, "\n")
  cat("Advisory only. Catalog apply, release setup and survey processing: NOT RUN.\n")
  stopifnot("Eligibility did not pass for all six measures" =
              nrow(rows) == 6L && all(rows$status == "PASS"))
  invisible(NULL)
}

mode <- Sys.getenv("QRE_MODE")
tryCatch({
  if (identical(mode, "local")) {
    # Reuse all established fingerprint, smoke, Qmd and no-alias checks.
    source(file.path(checkout, paste0(
      ".cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/",
      "20261118T195108Z-qualification/local-check.R"
    )))
    source(file.path(bundle, "local-check.R"))
    cat("Shared registration, shared eligibility, apply and survey: NOT RUN.\n")
  } else if (identical(mode, "shared")) {
    run_shared_dry_run()
  } else if (identical(mode, "pin-diagnosis")) {
    source(file.path(qualification, "qualified-stamp.R"))
    invisible(load_qualified_stamp())
    source(pin_diagnosis)
    summary <- run_pin_diagnosis(shared_aux_root(read_pip_main(checkout)),
                                 Sys.getenv("QRE_OUTPUT"))
    stopifnot("Some metadata rows unavailable; see technical rows" =
                all(summary$observation == "OBSERVED"))
  } else {
    stop("Unknown launcher mode; shared eligibility NOT RUN")
  }
  record_origins()
}, error = function(error) {
  cat("FAIL:", conditionMessage(error), "\n")
  tryCatch(record_origins(), error = function(origin_error) {
    cat("Origin recording failed:", conditionMessage(origin_error), "\n")
  })
  cat("No catalog apply or survey processing was requested.\n")
  quit(save = "no", status = 1L)
})
