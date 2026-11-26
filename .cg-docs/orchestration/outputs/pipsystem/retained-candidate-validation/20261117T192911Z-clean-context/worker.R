main <- function() {
  args <- commandArgs(TRUE)
  stopifnot(length(args) == 1L, args %in% c("preflight", "shared-context"))
  mode <- args[[1L]]
  checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
  source_root <- normalizePath(Sys.getenv("CLEAN_SOURCE_ROOT"), winslash = "/")
  scratch <- normalizePath(Sys.getenv("CLEAN_RUN_ROOT"), winslash = "/")
  output <- normalizePath(Sys.getenv("CLEAN_OUTPUT"), winslash = "/")
  library <- file.path(source_root, "library")
  probe <- file.path(checkout, paste0(
    ".cg-docs/orchestration/outputs/pipsystem/retained-candidate-validation/",
    "20261117T171652Z-readonly/probe.R"
  ))
  probe_md5 <- "c6a708961e8f8c3d1f9e803bd6ceae2d"
  stopifnot(
    identical(readLines(file.path(checkout, ".git/HEAD")), "ref: refs/heads/main"),
    getRversion() == "4.5.2",
    startsWith(scratch, paste0(checkout, "/.tmp/rcv/")),
    startsWith(output, paste0(checkout, "/.cg-docs/orchestration/outputs/")),
    startsWith(normalizePath(tempdir(), winslash = "/"), scratch),
    identical(normalizePath(.libPaths(), winslash = "/"),
              c(library, normalizePath(.Library, winslash = "/")))
  )
  setwd(scratch)
  options(pipfun.log.auto = FALSE, pipfun.verbose = FALSE, pipload.verbose = FALSE)
  stopifnot(identical(unname(tools::md5sum(probe)), probe_md5))
  inventory <- readRDS(file.path(source_root, "inventory.rds"))
  stopifnot(identical(inventory$root, source_root))
  expected_shas <- c(
    stamp = "95890411e8bf9db842593c2b0ab68ec4f2a66b25",
    pipfun = "7d534516a8c17c33d537681610eccd4c29211762",
    pipload = "4ef0d90a974cb6ff0725da69373bde421dd04ad5"
  )
  for (package in names(expected_shas)) {
    receipt <- inventory$receipts[[package]]
    stopifnot(identical(receipt$root, source_root), receipt$exit == 0L,
      identical(receipt$path, file.path(library, package)),
      identical(receipt$sha, unname(expected_shas[[package]])),
      identical(receipt$archive_md5, unname(tools::md5sum(
        file.path(source_root, "sources", paste0(package, ".tar"))
      ))),
      identical(receipt$installed_md5, unname(tools::md5sum(
        file.path(receipt$path, "Meta/package.rds")
      ))),
      any(grepl(paste0("DONE (", package, ")"), readLines(receipt$log), fixed = TRUE)))
  }
  dependencies <- inventory$dependencies
  recorded <- read.delim(file.path(source_root, "dependencies.tsv"),
                         stringsAsFactors = FALSE, check.names = FALSE)
  stopifnot(identical(dependencies, recorded), !anyDuplicated(dependencies$package))
  for (index in seq_len(nrow(dependencies))) {
    dependency <- dependencies[index, ]
    description <- file.path(library, dependency$package, "DESCRIPTION")
    stopifnot(identical(dependency$path, dirname(description)),
      identical(dependency$description_md5, unname(tools::md5sum(description))),
      identical(dependency$version, unname(read.dcf(description)[1L, "Version"])))
  }
  invisible(loadNamespace("data.table", lib.loc = library))
  table_origin <- normalizePath(getNamespaceInfo(asNamespace("data.table"), "path"),
                                winslash = "/")
  stopifnot(identical(table_origin, file.path(library, "data.table")))
  cat("PASS: fresh R", as.character(getRversion()), "PID", Sys.getpid(), "\n")
  cat("Working directory:", getwd(), "\n")
  cat("Library search order:\n")
  print(.libPaths())
  cat("PASS: data.table origin:", table_origin, "\n")
  cat("PASS: pinned receipts and", nrow(dependencies), "dependency descriptions\n")

  # Local-only regression check for the exact legacy suffix in pipfun's globals.
  # Empty directories are not a release fixture or a PIP context initialization.
  legacy_tree <- file.path(scratch, "path-check", paste0(
    "pip_ingestion_pipeline/pc_data/output-tfs-sync/ITSES-POVERTYSCORE-DATA"
  ))
  deeper_path <- file.path(legacy_tree, paste(rep("v", 48L), collapse = ""),
                           "survey_data")
  stopifnot(nchar(deeper_path, type = "bytes") < 260L)
  if (!dir.exists(deeper_path)) {
    dir.create(deeper_path, recursive = TRUE, showWarnings = FALSE)
  }
  stopifnot(dir.exists(deeper_path))
  cat("PASS: isolated legacy path-budget test plus 48-character component:",
      nchar(deeper_path, type = "bytes"), "bytes (<260)\n")

  # HARD boundary: local preflight exits before PIP loading, credentials,
  # network access, shared path lookup, setup or candidate execution.
  if (mode == "preflight") {
    stopifnot(!any(c("pipfun", "stamp", "pipload", "qs2", "pipaux", "pipdata") %in%
                    loadedNamespaces()))
    cat("PASS: local preflight only; shared bootstrap/candidate checks NOT RUN\n")
    return(0L)
  }

  stage <- "context bootstrap"
  candidate_started <- FALSE
  tryCatch({
    invisible(loadNamespace("stamp", lib.loc = library))
    invisible(loadNamespace("pipfun", lib.loc = library))
    for (package in c("stamp", "pipfun", "data.table")) {
      stopifnot(identical(
        normalizePath(getNamespaceInfo(asNamespace(package), "path"), winslash = "/"),
        file.path(library, package)
      ))
    }
    shared_main <- "//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2"
    aux_root <- file.path(shared_main, "aux_repository/aux_data/20260401_TEST")
    catalog <- file.path(aux_root, ".stamp/catalog.qs2")
    stopifnot(dir.exists(shared_main), dir.exists(aux_root), file.exists(catalog))
    before <- unname(tools::md5sum(catalog))
    stopifnot(length(before) == 1L, !is.na(before))
    legacy <- file.path(scratch, "legacy")
    cat("User-authorized public context setup; existing shared store only.\n")
    context <- pipfun::setup_working_release(
      release = "20260401", identity = "TEST", ppp = 2021,
      main_dir = shared_main, root_dir = legacy, out_dir = legacy,
      force = FALSE, verbose = FALSE
    )
    stopifnot(identical(as.character(context$release), "20260401"),
              identical(context$identity, "TEST"), identical(context$ppp, 2021))
    stage <- "catalog preservation after context setup"
    if (!identical(before, unname(tools::md5sum(catalog)))) {
      stop("Aux catalog changed during context setup; no rollback attempted; investigate concurrency or side effects.",
           call. = FALSE)
    }
    cat("PASS: context 20260401/TEST/PPP2021; aux catalog bytes unchanged\n")
    invisible(loadNamespace("pipload", lib.loc = library))
    invisible(loadNamespace("qs2", lib.loc = library))
    for (package in c("pipload", "qs2", "data.table")) {
      stopifnot(identical(
        normalizePath(getNamespaceInfo(asNamespace(package), "path"), winslash = "/"),
        file.path(library, package)
      ))
    }
    stage <- "read-only candidate probe"
    stopifnot(identical(unname(tools::md5sum(probe)), probe_md5))
    candidate_started <- TRUE
    base::source(probe, local = environment())
    utils::write.table(retained_candidate_results,
      file.path(output, "candidate-results.tsv"), sep = "\t",
      row.names = FALSE, quote = TRUE)
    stage <- "catalog preservation after reads"
    if (!identical(before, unname(tools::md5sum(catalog)))) {
      stop("Aux catalog changed during candidate reads; no rollback attempted; investigate concurrent changes.",
           call. = FALSE)
    }
    cat("PASS: aux catalog bytes unchanged after candidate reads\n")
    if (any(retained_candidate_results[, c("catalog", "metadata", "payload", "hash",
                                          "projection")] != "PASS")) {
      cat("Candidate checks include FAIL/NOT RUN; no readiness claim.\n")
      return(2L)
    }
    cat("All bounded technical checks PASS; authority/repair still NOT AUTHORIZED.\n")
    return(0L)
  }, error = function(error) {
    cat("FAIL:", stage, "--", conditionMessage(error), "\n")
    if (!candidate_started) cat("Dependent candidate checks: NOT RUN\n")
    return(1L)
  })
}
exit_status <- tryCatch(main(), error = function(error) {
  # Shared/probe errors are caught inside main; this is local startup only.
  cat("FAIL: startup/preflight --", conditionMessage(error), "\n")
  cat("Dependent candidate checks: NOT RUN\n")
  return(1L)
})
quit(save = "no", status = exit_status)
