# Shared metadata and file-existence inspection only. Never read artifact payloads.
main <- function() {
  checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
  library <- file.path(checkout, ".tmp/one-survey/qmd-acceptance-20261113/library")
  scratch <- normalizePath(Sys.getenv("ARP_SCRATCH"), winslash = "/")
  output <- normalizePath(Sys.getenv("ARP_OUTPUT"), winslash = "/")
  stopifnot(getRversion() == "4.5.2",
    identical(normalizePath(.libPaths(), winslash = "/"),
              c(library, normalizePath(.Library, winslash = "/"))),
    startsWith(scratch, paste0(checkout, "/.tmp/arp/")),
    startsWith(output, paste0(checkout, "/.cg-docs/orchestration/outputs/")),
    startsWith(normalizePath(tempdir(), winslash = "/"), scratch))
  setwd(scratch)
  invisible(loadNamespace("data.table", lib.loc = library))
  invisible(loadNamespace("qs2", lib.loc = library))
  for (package in c("data.table", "qs2")) {
    stopifnot(identical(
      normalizePath(getNamespaceInfo(asNamespace(package), "path"), winslash = "/"),
      file.path(library, package)))
  }
  stopifnot(!any(c("stamp", "pipfun", "pipload", "pipaux", "pipdata") %in%
                  loadedNamespaces()))
  cat("Metadata-only reader:", R.version.string, "PID", Sys.getpid(), "\n")
  print(.libPaths())
  cat("No PIP context/aliases, authentication, pipeline or shared writes.\n")
  requested <- c(pfw = "dbd2ccf63260991d", cpi = "ae38185bd7ff383c",
                 ppp = "c16e62d94f46e1bc", pop = "c059b971f5fc70cc",
                 gdp = "062e2d30b15b4661", pce = "4d57e305a0e3c86e")
  root <- paste0(
    "//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2/",
    "aux_repository/aux_data/20260401_TEST"
  )
  started <- format(Sys.time(), "%Y-%m-%dT%H:%M:%OS6Z", tz = "UTC")
  file <- file.path(root, ".stamp/catalog.qs2")
  before <- unname(tools::md5sum(file))
  stopifnot(length(before) == 1L, !is.na(before))
  catalog <- qs2::qs_read(file)
  artifacts <- as.data.frame(catalog$artifacts)
  versions <- as.data.frame(catalog$versions)
  cat("Catalog artifacts:", nrow(artifacts), "version rows:", nrow(versions), "\n")
  cat("Saved timestamp class:", paste(class(versions$created_at), collapse = "/"), "\n")
  cat("Saved timestamp timezone:", paste(attr(versions$created_at, "tzone"), collapse = "/"), "\n")
  if (inherits(versions$created_at, "POSIXt")) {
    versions$epoch <- as.numeric(versions$created_at)
  } else if (is.character(versions$created_at)) {
    versions$epoch <- as.numeric(as.POSIXct(versions$created_at, tz = "UTC",
      tryFormats = c("%Y-%m-%dT%H:%M:%OSZ", "%Y-%m-%d %H:%M:%OS")))
  } else {
    stop("Unsupported saved timestamp representation; no chronology inferred.")
  }
  versions$saved_utc <- format(as.POSIXct(versions$epoch, origin = "1970-01-01",
                                         tz = "UTC"),
                               "%Y-%m-%dT%H:%M:%OS6Z", tz = "UTC")
  artifact_names <- basename(gsub("\\", "/", artifacts$path, fixed = TRUE))
  summaries <- list()
  details <- list()
  orphans <- list()
  for (measure in names(requested)) {
    logical_name <- paste0(measure, ".qs2")
    artifact <- artifacts[artifact_names == logical_name, , drop = FALSE]
    stopifnot(nrow(artifact) == 1L)
    rows <- versions[versions$artifact_id == artifact$artifact_id[[1L]], , drop = FALSE]
    stopifnot(nrow(rows) > 0L, !anyNA(rows$epoch), !anyDuplicated(rows$version_id))
    folders <- file.path(root, logical_name, "versions", rows$version_id)
    rows$payload_exists <- file.exists(file.path(folders, "artifact"))
    rows$json_exists <- file.exists(file.path(folders, "sidecar.json"))
    rows$qs2_exists <- file.exists(file.path(folders, "sidecar.qs2"))
    rows$retained <- rows$payload_exists & (rows$json_exists | rows$qs2_exists)
    rows$measure <- measure
    rows$validated_in_user_run <- rows$version_id == requested[[measure]]
    newest <- rows$version_id[rows$epoch == max(rows$epoch)]
    kept <- rows[rows$retained, , drop = FALSE]
    stopifnot(nrow(kept) > 0L)
    newest_kept <- kept[kept$epoch == max(kept$epoch), , drop = FALSE]
    pointer <- artifact$latest_version_id[[1L]]
    pointer_row <- rows[rows$version_id == pointer, , drop = FALSE]
    candidate <- rows[rows$version_id == requested[[measure]], , drop = FALSE]
    stopifnot(nrow(pointer_row) == 1L, nrow(candidate) == 1L)
    existing_dirs <- list.dirs(file.path(root, logical_name, "versions"),
                               full.names = FALSE, recursive = FALSE)
    orphan_ids <- setdiff(existing_dirs, rows$version_id)
    if (length(orphan_ids)) {
      orphans[[measure]] <- data.frame(measure = measure, version = orphan_ids,
        state = "No catalog row; public exact-pin acceptance not established")
    }
    status <- if (length(orphan_ids)) {
      "ORPHAN DIRECTORIES: unresolved retention/rank evidence"
    } else if (nrow(newest_kept) > 1L) {
      "TIED RETAINED TIMESTAMPS: no unique chronology inferred"
    } else if (identical(newest_kept$version_id[[1L]], requested[[measure]])) {
      "Latest retained equals publicly validated candidate"
    } else {
      "Newer retained version needs public validation; no silent adoption"
    }
    summaries[[measure]] <- data.frame(
      measure = measure, catalog_pointer = pointer,
      pointer_retained = pointer_row$retained[[1L]],
      newest_catalog_ids = paste(newest, collapse = ","),
      newest_retained_ids = paste(newest_kept$version_id, collapse = ","),
      newest_retained_utc = newest_kept$saved_utc[[1L]],
      retained_count = nrow(kept), validated_id = requested[[measure]],
      validated_retained_now = candidate$retained[[1L]],
      validated_saved_utc = candidate$saved_utc[[1L]], status = status
    )
    details[[measure]] <- rows[, c("measure", "version_id", "saved_utc", "epoch",
      "content_hash", "code_hash", "payload_exists", "json_exists", "qs2_exists",
      "retained", "validated_in_user_run")]
  }
  after <- unname(tools::md5sum(file))
  stopifnot(identical(before, after))
  summary <- do.call(rbind, summaries)
  detail <- do.call(rbind, details)
  orphan <- if (length(orphans)) do.call(rbind, orphans) else
    data.frame(measure = character(), version = character(), state = character())
  utils::write.table(summary, file.path(output, "baseline-ranking.tsv"),
                     sep = "\t", row.names = FALSE, quote = TRUE)
  utils::write.table(detail, file.path(output, "version-metadata.tsv"),
                     sep = "\t", row.names = FALSE, quote = TRUE)
  utils::write.table(orphan, file.path(output, "orphan-directories.tsv"),
                     sep = "\t", row.names = FALSE, quote = TRUE)
  window <- data.frame(started_utc = started,
    finished_utc = format(Sys.time(), "%Y-%m-%dT%H:%M:%OS6Z", tz = "UTC"),
    catalog_md5_before = before, catalog_md5_after = after,
    catalog_unchanged = identical(before, after),
    main_sidecar_comparison = "Prior saved inspection, NOT refreshed in this reader")
  utils::write.table(window, file.path(output, "metadata-window.tsv"),
                     sep = "\t", row.names = FALSE, quote = TRUE)
  print(summary, row.names = FALSE)
  cat("PASS: catalog metadata stable across read window; payload files not opened.\n")
  cat("Physical retained eligibility is not new payload validation or release authority.\n")
  cat("Prior main-sidecar matching evidence remains historical, not a current refresh.\n")
}
main()
