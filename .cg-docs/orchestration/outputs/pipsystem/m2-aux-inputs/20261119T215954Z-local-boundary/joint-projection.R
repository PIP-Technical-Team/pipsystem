# Read all four local candidates without creating any survey or release output.
bundle <- Sys.getenv("AUX_PROBE_BUNDLE")
checking_joint <- TRUE
source(file.path(bundle, "pfw-projection.R"), local = TRUE)

pop_path <- file.path(
  root, ".tmp/m2popq/store/pop.qs2/versions/5b6239b8a683e66b/artifact"
)
pop_sha <- "df27d9e660fcd92daa219e104f07286d0688e12e7674701e1736668e3956c83c"
stopifnot(identical(unname(tools::sha256sum(pop_path)), pop_sha))
population <- qs2::qs_read(pop_path)
stopifnot(identical(stamp::st_hash_obj(population), "cb4509fb588f1f23"))
col_population <- consumer$filter_aux_data("pop", population, keys)
population_values <- consumer$create_attr("pop", col_population)
population_key <- paste(keys$surveyid_year, domains[["pop"]], sep = "_")
stopifnot(identical(population_key, "2010_national"))
invisible(consumer$pd_deflation_select(
  population_values, population_key, "population"
))
if (identical(Sys.getenv("AUX_PROBE_MODE"), "JointFixed")) {
  source_paths <- file.path(dirname(root), "pipaux/R", c(
    "aux_pfw.R", "aux_pop.R", "validation_report.R"
  ))
  source_hashes <- c(
    "e4441f10f7920ae512dc3b1593fe4c83caf3761a449f069c588c702134f8fb4f",
    "6e11bbf7463e2bb1cd3fb30cadb3f35d2a317ebd4f88ddb1629524ae5302ed81",
    "c3265cb9889670ad07fdadffb50286708f41eaafb010f98214938edcb7c62ae0"
  )
  stopifnot(identical(unname(tools::sha256sum(source_paths)), source_hashes))
  suppressPackageStartupMessages(library(data.validator))
  validator <- new.env(parent = globalenv())
  validator$setDT <- data.table::setDT
  validator$in_set <- assertr::in_set
  validator$not_na <- assertr::not_na
  validator$is_uniq <- assertr::is_uniq
  for (file in source_paths) {
    sys.source(file, envir = validator)
  }
  validator$pfw_validate_output(data.table::as.data.table(pfw), detail = FALSE)
  validator$pop_validate_output(data.table::as.data.table(population), detail = FALSE)
  cat("PASS: corrected pipaux output validators accept the full local PFW and POP.\n")
}
stopifnot(
  identical(unname(tools::sha256sum(pop_path)), pop_sha),
  !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
)
cat("PASS: experimental POP supplies exact positive 2010_national key.\n")
cat("PASS: local CPI/PPP/PFW/POP keys cover national Colombia for 2021.\n")
cat("LIMIT: experimental PFW/POP; no same-store recipe binding.\n")
cat("NOT RUN: vintage selection, package startup, release setup, survey and deflation.\n")
