# This is a read-only input check. No saved output, vintage choice or survey.
bundle <- Sys.getenv("AUX_PROBE_BUNDLE")
checking_coverage <- TRUE
source(file.path(bundle, "probe.R"), local = TRUE)

payload <- file.path(
  root, ".tmp/m2ppp/store/ppp.qs2/versions/404c83141bb0ab87/artifact"
)
raw_ppp <- file.path(root, ".tmp/m2ppp/ppp.csv")
input_paths <- c(payload, raw_ppp)
ppp_hashes <- c(
  "193a0e6c8bef38bd8b5001cb1542f6353ca7497270b7c4155cd2150a261dca65",
  "7f6debdafb0dbcd687abd5061af3c413cc19fce1f29ad28807aa53c853dba4ea"
)
stopifnot(identical(unname(tools::sha256sum(input_paths)), ppp_hashes))
ppp_table <- qs2::qs_read(payload)
stopifnot(identical(stamp::st_hash_obj(ppp_table), "aa34b27b5f7c6720"))
data.table::setDT(ppp_table)
filtered <- consumer$filter_aux_data("ppp", ppp_table, keys)
attributes <- consumer$create_attr("ppp", filtered)

# Build the two expected consumer names explicitly from approved-year raw cells.
ppp_csv <- utils::read.csv(raw_ppp, check.names = FALSE)
national <- ppp_csv[ppp_csv$code == "COL" & ppp_csv$datalevel == 2L, ]
columns <- c("ppp_2021_v1_v1", "ppp_2021_v1_v2")
variants <- c("ppp_2021_01_01_national", "ppp_2021_01_02_national")
observed <- sort(grep("^ppp_2021_.*_national$", names(attributes), value = TRUE))
expected <- as.numeric(unlist(national[columns], use.names = FALSE))
stopifnot(
  nrow(national) == 1L,
  identical(observed, variants),
  all(is.finite(expected) & expected > 0),
  isTRUE(all.equal(unname(attributes[variants]), expected, tolerance = 1e-14)),
  identical(unname(tools::sha256sum(input_paths)), ppp_hashes)
)

cat("PASS: matching raw national COL PPP2021 values for both unselected keys:\n")
cat(paste(variants, collapse = ", "), "\n")
cat("Exact same national COL factor:", identical(expected[[1L]], expected[[2L]]),
    "\n")
if (!exists("checking_pfw", inherits = FALSE)) {
  cat("NOT RUN: PFW, population, vintage selection, release setup and survey.\n")
}
