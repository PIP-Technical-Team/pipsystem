# Admission check for the experimental PFW. Do not run deflation or select PPP.
bundle <- Sys.getenv("AUX_PROBE_BUNDLE")
checking_pfw <- TRUE
source(file.path(bundle, "ppp-projection.R"), local = TRUE)
mode <- Sys.getenv("AUX_PROBE_MODE")

pfw_path <- file.path(
  root, ".tmp/m2pfwfix/store/pfw.qs2/versions/1ebf03aaca5d5721/artifact"
)
deflation <- file.path(dirname(root), "pipdata/R/pd_deflation.R")
files <- c(pfw_path, deflation)
hashes <- c(
  "26081660861c65136572788e708d0f7d632366ade5df82005a09d12a4540a263",
  if (mode == "JointFixed") {
    "ba4230fe7f6c48cffd88639ad5064ee01ef9fb103b3b6fde82cd807fc17b6402"
  } else {
    "63160268e10ed44fed1848098f74ce19885900f9b82e1f42f3791228a9328042"
  }
)
stopifnot(identical(unname(tools::sha256sum(files)), hashes))
pfw <- qs2::qs_read(pfw_path)
stopifnot(identical(stamp::st_hash_obj(pfw), "fc3469e631532ca2"))
sys.source(deflation, envir = consumer)
keys$welfare_type <- "income"
domains <- consumer$pd_deflation_domains(keys, pfw)
stopifnot(identical(domains, c(
  cpi = "national", ppp = "national", pop = "national"
)))
cat("PASS: experimental full PFW resolves national CPI, PPP and POP domains.\n")
cat("CPI storage type:", typeof(actual), "; classed:", is.object(actual), "\n")
invalid <- names(actual)[!is.finite(actual) | actual <= 0]
cat("CPI nonfinite or nonpositive keys:", paste(invalid, collapse = ", "), "\n")
cat("CPI missing keys:", paste(names(actual)[is.na(actual)], collapse = ", "), "\n")
stopifnot(identical(unname(tools::sha256sum(files)), hashes))
invisible(consumer$pd_deflation_select(attributes[variants], variants, "PPP"))
cat("PASS: both unselected 2021 PPP keys pass the numeric check.\n")

if (mode %in% c("SelectedKeys", "Joint", "JointFixed")) {
  # This simulates a 2021-only metadata input to the unchanged adapter.
  # It neither changes the stored data nor makes an unavailable year usable.
  choose_cpi <- function(key) {
    if (mode == "JointFixed") {
      return(consumer$pd_deflation_select(actual, key, "CPI", allow_missing = TRUE))
    }
    return(consumer$pd_deflation_select(actual[key], key, "CPI"))
  }
  selected <- choose_cpi("2021_national")
  failed <- tryCatch({
    choose_cpi("2005_national")
    FALSE
  }, error = function(error) grepl("requires finite positive", conditionMessage(error)))
  stopifnot(identical(selected, unname(actual["2021_national"])), failed)
  if (mode == "JointFixed") {
    cat("PASS: corrected selector admits 2021 with the full CPI vector; 2005 still fails.\n")
  } else {
    cat("PASS: explicit 2021-only CPI projection is admitted; 2005 stays rejected.\n")
  }
} else {
  invisible(consumer$pd_deflation_select(actual, "2021_national", "CPI"))
}
if (!exists("checking_joint", inherits = FALSE)) {
  cat("NOT RUN: population coverage, vintage selection, release setup and survey.\n")
}
