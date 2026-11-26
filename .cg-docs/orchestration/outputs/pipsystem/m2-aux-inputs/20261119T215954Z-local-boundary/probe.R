# Check the CPI producer/consumer boundary without release or survey execution.
root <- Sys.getenv("AUX_PROBE_ROOT")
scratch <- Sys.getenv("AUX_PROBE_SCRATCH")
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(
  getRversion() == "4.5.2",
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/t/")),
  identical(getwd(), scratch),
  identical(
    normalizePath(.libPaths(), winslash = "/"),
    normalizePath(c(libraries, .Library), winslash = "/")
  )
)
source(file.path(
  root, ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
))
invisible(load_qualified_stamp())

raw_path <- file.path(root, ".tmp/cp26/inputs/cpi.csv")
version <- "b857f991a3c4579f"
snapshot_path <- file.path(
  root, ".tmp/cp26/store/cpi.qs2/versions", version, "artifact"
)
consumer_path <- file.path(dirname(root), "pipdata/R/pd_aux_attr.R")
paths <- c(raw_path, snapshot_path, consumer_path)
expected_hashes <- c(
  "72c597d88f5796d9a3e51e02cf3ac0a17b0700fd211590ca7999c29e221b5fb3",
  "a8afe07d62fb4d7268b9870e0c195919e252f7a61d0e3ddfec4b407de669ec22",
  "372c2d150d343519530d2b9555198bfb3e63bf16762905b50d7961a1dfc88860"
)
stopifnot(identical(unname(tools::sha256sum(paths)), expected_hashes))
snapshot <- qs2::qs_read(snapshot_path)
stopifnot(identical(stamp::st_hash_obj(snapshot), "50007cdf16a77744"))
cat("PASS: local CPI pin and producer/consumer source evidence match.\n")

consumer <- new.env(parent = baseenv())
sys.source(consumer_path, envir = consumer)
keys <- list(country_code = "COL", surveyid_year = 2010L, survey_acronym = "GEIH")
projected <- consumer$filter_aux_data("cpi", snapshot, keys)
actual <- consumer$create_attr("cpi", projected)

# Compare with the original wide CSV cells, not the rebuilt table.
raw <- utils::read.csv(raw_path, stringsAsFactors = FALSE)
colombia <- subset(raw, code == "COL" & year == 2010L & survname == "GEIH")
years <- c(2005L, 2011L, 2017L, 2021L)
levels <- c("rural", "urban", "national")[colombia$cpi_data_level + 1L]
expected_names <- as.vector(outer(years, levels, paste, sep = "_"))
expected_values <- as.vector(t(as.matrix(colombia[paste0("cpi", years)])))
expected <- stats::setNames(expected_values, expected_names)
ordered_names <- sort(names(expected))
target_value <- actual[startsWith(names(actual), "2021_")]
stopifnot(
  nrow(colombia) > 0L,
  !anyNA(levels),
  !anyDuplicated(names(actual)),
  !anyDuplicated(names(expected)),
  setequal(names(actual), names(expected)),
  isTRUE(all.equal(
    actual[ordered_names], expected[ordered_names], tolerance = 1e-14
  )),
  length(target_value) == nrow(colombia),
  all(is.finite(target_value) & target_value > 0),
  identical(unname(tools::sha256sum(paths)), expected_hashes),
  !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
)
cat(sprintf(
  "PASS: pipdata CPI projection matches %d source cells for COL 2010 GEIH (%s).\n",
  length(actual), paste(sort(unique(levels)), collapse = ", ")
))
if (!exists("checking_coverage", inherits = FALSE)) {
  cat("NOT RUN: PFW, PPP, population, release setup, survey and deflation.\n")
}
