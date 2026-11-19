# Read the exact catalog row and legacy JSON sidecar; stat, not open, the data.
inspect_pin <- function(root, catalog, name, target) {
  versions <- as.data.frame(catalog$versions)
  artifacts <- as.data.frame(catalog$artifacts)
  row <- versions[which(versions$version_id == target), , drop = FALSE]
  stopifnot("Target row is not unique" = nrow(row) == 1L)
  artifact <- artifacts[which(artifacts$artifact_id == row$artifact_id[[1L]]),
                        , drop = FALSE]
  stopifnot("Artifact row is not unique" = nrow(artifact) == 1L)

  directory <- file.path(root, name)
  expected_path <- tolower(as.character(fs::path_norm(
    normalizePath(directory, winslash = "/", mustWork = TRUE)
  )))
  stopifnot("Target is not bound to the expected artifact" = identical(
    chartr("\\", "/", artifact$path[[1L]]), chartr("\\", "/", expected_path)
  ))
  retained <- file.path(directory, "versions", target)
  json <- file.path(retained, "sidecar.json")
  stopifnot("Expected a single JSON sidecar" =
              identical(row$sidecar_format[[1L]], "json") &&
              !file.exists(file.path(retained, "sidecar.qs2")))
  meta <- jsonlite::read_json(json, simplifyVector = TRUE)
  stopifnot("Expected legacy sidecar metadata" =
              is.list(meta) && !anyDuplicated(names(meta)) &&
              !(is.list(meta$attrs) && !is.null(meta$attrs[["stamp"]])))
  info <- file.info(file.path(retained, "artifact"), extra_cols = FALSE)
  stopifnot("Retained file size unavailable" =
              identical(info$isdir, FALSE) && !is.na(info$size))

  scalar_text <- function(x) {
    is.character(x) && length(x) == 1L && !is.na(x) && nzchar(x)
  }
  size <- meta$size_bytes
  valid_size <- (is.numeric(size) || is.character(size)) && length(size) == 1L
  size <- if (valid_size) suppressWarnings(as.numeric(size)) else NA_real_
  return(c(
    path_exact = identical(meta$path, expected_path),
    path_slashes_equal = scalar_text(meta$path) &&
      identical(chartr("\\", "/", meta$path), chartr("\\", "/", expected_path)),
    format_recognized = scalar_text(meta$format) &&
      meta$format %in% stamp::st_formats(),
    format_matches_catalog = identical(meta$format, artifact$format[[1L]]),
    content_hash_matches_catalog = scalar_text(meta$content_hash) &&
      identical(meta$content_hash, as.character(row$content_hash[[1L]])),
    sidecar_size_matches_file = !is.na(size) && identical(size, info$size),
    sidecar_size_matches_catalog = !is.na(size) &&
      identical(size, as.numeric(row$size_bytes[[1L]])),
    byte_checksum_recorded = scalar_text(meta$file_hash)
  ))
}

run_pin_diagnosis <- function(root, output, targets = c(
  pfw = "dbd2ccf63260991d", cpi = "ae38185bd7ff383c",
  ppp = "c16e62d94f46e1bc", pop = "c059b971f5fc70cc",
  gdp = "062e2d30b15b4661", pce = "4d57e305a0e3c86e"
)) {
  catalog_file <- file.path(root, ".stamp/catalog.qs2")
  before <- catalog_hash(catalog_file)
  on.exit(assert_catalog_unchanged(catalog_file, before), add = TRUE)
  catalog <- qs2::qs_read(catalog_file)
  fields <- c("path_exact", "path_slashes_equal", "format_recognized",
              "format_matches_catalog", "content_hash_matches_catalog",
              "sidecar_size_matches_file", "sidecar_size_matches_catalog",
              "byte_checksum_recorded")
  rows <- lapply(names(targets), function(measure) {
    flags <- tryCatch(
      inspect_pin(root, catalog, paste0(measure, ".qs2"), targets[[measure]]),
      error = function(error) NULL
    )
    observed <- !is.null(flags)
    if (!observed) flags <- stats::setNames(rep(NA, length(fields)), fields)
    return(data.frame(measure = measure, target = targets[[measure]],
                      observation = if (observed) "OBSERVED" else "UNAVAILABLE",
                      as.list(flags)))
  })
  assert_catalog_unchanged(catalog_file, before)
  summary <- do.call(rbind, rows)
  utils::write.table(summary, output, sep = "\t", row.names = FALSE)
  cat("PASS: sampled catalog SHA256 unchanged across metadata read.\n")
  cat("Catalog SHA256:", before, "\n")
  cat("Observed rows:", sum(summary$observation == "OBSERVED"), "of",
      length(targets), "\n")
  cat("Alias setup, payload contents, byte verification, reconciliation, apply",
      "and surveys: NOT RUN.\n")
  return(invisible(summary))
}
