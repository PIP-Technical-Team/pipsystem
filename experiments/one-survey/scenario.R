# Offline example based on the three pipdata articles at pinned 13a38280.
# Only release/catalog/download transport is substituted. No acceptance workers.
root <- normalizePath(Sys.getenv("ONE_SURVEY_ROOT"), winslash = "/",
                      mustWork = TRUE)
checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
stopifnot(startsWith(root, paste0(checkout, "/.tmp/one-survey/")))
setwd(root)
source(file.path(checkout, "experiments/one-survey/setup.R"))
invisible(verify(readRDS(file.path(root, "inventory.rds"))))
options(pipfun.verbose = FALSE, pipload.verbose = FALSE,
        pipdata.verbose = FALSE, dlw.verbose = FALSE,
        pipdata.dependency_manifest_path = file.path(root, "manifest"))

main <- function() {
  # AAA/2010/SYNA named synthetic fixture: annual LCU, person weights.
  raw <- data.table::data.table(
    countrycode = "AAA", year = 2010L, survname = "SYNA",
    hhid = paste0("h", 1:4), pid = paste0("p", 1:4), hsize = c(1, 2, 3, 4),
    welfare = c(365, 730, 1095, 1460),
    welfshprosperity = c(365, 730, 1095, 1460),
    weight = c(10, 20, 30, 40), urban = c(1, 0, 1, 0),
    age = c(25, 35, 45, 55), male = c(1, 0, 1, 0))
  survey_id <- "AAA_2010_SYNA_V01_M_V01_A_GMD_GPWG"
  expected_survey_id <- survey_id
  pip_id <- "AAA_2010_SYNA_INC_GPWG"
  expected_pip_id <- pip_id
  bad_id <- "AAA_2010_SYNB_V01_M_V01_A_GMD_GPWG"
  bad_pip <- "AAA_2010_SYNB_INC_GPWG"
  catalog <- data.table::data.table(Country = "AAA", Year = 2010L,
    Survey_acronym = c("SYNA", "SYNB"), Vermast = "V01", Veralt = "V01",
    Collection = "GMD", Module = "GPWG",
    FileName = paste0(c(survey_id, bad_id), ".dta"),
    Checksum = c("synthetic-valid-v1", "synthetic-missing-weight-v1"),
    Ext = "dta")
  substitutions <- c(
    "pipfun::get_file_from_gh: synthetic releases.csv acquisition only",
    "pipfun::download_from_gh/get_file_info_from_gh: synthetic PPP vintage CSV/provenance",
    "dlw::dlw_server_catalog: two synthetic current catalog rows",
    "dlw::dlw_get_gmd: fixture download writes real pipload/stamp artifacts",
    "Auxiliary/country tables are explicitly fixture-only inputs, not producer certification")
  writeLines(substitutions, file.path(root, "substitutions.txt"))
  saveRDS(list(raw = raw, catalog = catalog), file.path(root, "inputs.rds"))
  # Replace only external I/O endpoints, and restore namespace bindings on exit.
  transport <- function(package, name, replacement) {
    ns <- asNamespace(package)
    original <- get(name, ns)
    unlockBinding(name, ns)
    assign(name, replacement, ns)
    lockBinding(name, ns)
    function() {
      unlockBinding(name, ns)
      assign(name, original, ns)
      lockBinding(name, ns)
    }
  }
  restore_release <- transport("pipfun", "get_file_from_gh", function(...) {
    data.table::data.table(release = "20260401", identity = "TEST")
  })
  on.exit(restore_release(), add = TRUE)
  restore_csv <- transport("pipfun", "download_from_gh", function(path, ...) {
    stopifnot(grepl("/ppp_vintage.csv$", path))
    destination <- list(...)[[1L]]
    data.table::fwrite(data.table::data.table(ppp_year = 2021L,
      ppp_rv = "01", ppp_av = "01"), destination)
  })
  on.exit(restore_csv(), add = TRUE)
  restore_info <- transport("pipfun", "get_file_info_from_gh", function(...) {
    list(sha = "synthetic-ppp-vintage-v1")
  })
  on.exit(restore_info(), add = TRUE)
  restore_catalog <- transport("dlw", "dlw_server_catalog", function(...) {
    data.table::copy(catalog)
  })
  on.exit(restore_catalog(), add = TRUE)
  restore_download <- transport("dlw", "dlw_get_gmd", function(filename, ...) {
    stopifnot(filename %in% catalog$FileName)
    value <- data.table::copy(raw)
    if (identical(filename, paste0(bad_id, ".dta"))) {
      value[, weight := NULL]
      value[, survname := "SYNB"]
    }
    pipload::pip_write(value, id = tolower(sub("[.]dta$", "", filename)),
                       alias = "dlw", pk = c("hhid", "pid"), verbose = FALSE)
  })
  on.exit(restore_download(), add = TRUE)

  boundary <- "pipfun::setup_working_release"
  result <- tryCatch({
    pipfun::setup_working_release("20260401", "TEST", verbose = FALSE)
    # Normalized auxiliary fixtures are inputs to real cleaning/metadata code.
    pfw <- data.table::data.table(country_code = "AAA", surveyid_year = 2010L,
      survey_acronym = c("SYNA", "SYNB"), welfare_type = "income",
      inpovcal = 1, use_imputed = 0, cpi_domain = 1, ppp_domain = 1,
      pop_domain = 1, gdp_domain = 1, pce_domain = 1,
      cpi_domain_var = "", ppp_domain_var = "", is_alt_welf = FALSE)
    cpi <- data.table::data.table(country_code = "AAA", year = 2010L,
      survey_acronym = c("SYNA", "SYNB"), cpi_year = 2021L,
      reporting_level = "national", cpi_value = 1.4)
    ppp <- data.table::data.table(country_code = "AAA", ppp_year = 2021L,
      release_version = "v1", adaptation_version = "v1",
      reporting_level = "national", ppp = 1.6, ppp_default_by_year = TRUE)
    aux <- list(pfw = pfw, cpi = cpi, ppp = ppp)
    keys <- list(pfw = c("country_code", "surveyid_year", "survey_acronym",
                         "welfare_type"),
      cpi = c("country_code", "year", "survey_acronym", "cpi_year",
              "reporting_level"),
      ppp = c("country_code", "ppp_year", "release_version",
              "adaptation_version", "reporting_level"))
    for (measure in c("pop", "gdp", "pce")) {
      value <- data.table::data.table(country_code = "AAA", year = 2010L,
                                      reporting_level = "national")
      data.table::set(value, j = measure, value = 100)
      aux[[measure]] <- value
      keys[[measure]] <- c("country_code", "year", "reporting_level")
    }
    boundary <- "pipload::pip_write auxiliary fixtures"
    for (measure in names(aux)) {
      pipload::pip_write(aux[[measure]], measure, alias = "aux",
                         pk = keys[[measure]], verbose = FALSE)
    }
    boundary <- "pipdata::dlw_gmd_list"
    pipdata::dlw_gmd_list()
    boundary <- "pipdata::pipdata_dlw_process"
    validation <- pipdata::pipdata_dlw_process(release = "20260401",
      identity = "TEST", verbose = FALSE)
    saveRDS(validation, file.path(root, "validation-result.rds"))
    print(validation)
    stopifnot(identical(validation$outcome, "success"),
      identical(validation$validation$outcome, "success"))
    inv <- validation$validation$inventory
    stopifnot(nrow(inv[survey_id == expected_survey_id & status == "valid"]) == 1L,
      nrow(inv[survey_id == bad_id & status == "invalid"]) == 1L,
      validation$validation$summary$n_failed == 0L)
    report <- pipload::load_gmd_valid_report(verbose = FALSE)
    saveRDS(report, file.path(root, "validation-report.rds"))
    diagnostic <- report[table_name == bad_id & type == "error"]
    stopifnot(any(grepl("weight variable should be in the data",
                       diagnostic$description, fixed = TRUE)))
    before <- lapply(c("pip", "pip_meta"), function(alias) {
      stamp::st_catalog_query(alias = alias)
    })
    saveRDS(before, file.path(root, "downstream-before.rds"))
    boundary <- "pipdata::pd_process_data"
    master <- pipdata::pd_process_data(inv = inv, bootstrap = TRUE,
                                      verbose = FALSE)
    saveRDS(master, file.path(root, "master.rds"))
    print(master)
    selected <- master[pip_id == expected_pip_id]
    stopifnot(nrow(selected) == 1L)
    clean_pin <- selected$version_id_data[[1L]]
    metadata_pin <- selected$version_id_metadata[[1L]]
    stopifnot(is.character(clean_pin), nzchar(clean_pin),
              is.character(metadata_pin), nzchar(metadata_pin))
    boundary <- "pipload::pip_read exact saved pins"
    clean <- pipload::pip_read(pip_id, alias = "pip", version = clean_pin,
                               verbose = FALSE)
    metadata <- pipload::pip_read(pip_id, alias = "pip_meta",
                                  version = metadata_pin, verbose = FALSE)
    saveRDS(list(clean_pin = clean_pin, metadata_pin = metadata_pin,
                 clean = clean, metadata = metadata),
            file.path(root, "exact-readbacks.rds"))
    # Compare paired rows, not separately sorted welfare and weight vectors.
    actual <- data.table::data.table(welfare = clean$welfare,
                                     weight = clean$weight)
    expected <- data.table::data.table(welfare = c(1, 2, 3, 4),
                                       weight = c(10, 20, 30, 40))
    print(actual)
    stopifnot(identical(actual, expected),
      identical(metadata$survey_id, survey_id),
      identical(unname(metadata$cpi), 1.4),
      identical(unname(metadata$ppp), 1.6),
      identical(collapse::fsum(clean$weight), 100))
    after <- lapply(c("pip", "pip_meta"), function(alias) {
      catalog <- stamp::st_catalog_query(alias = alias)
      stopifnot(!any(grepl(bad_pip, catalog$path, ignore.case = TRUE)))
      catalog
    })
    saveRDS(after, file.path(root, "downstream-after.rds"))
    writeLines("V2/V3/V4 PASS", file.path(root, "scenario-assertions.txt"))
    TRUE
  }, error = function(e) {
    saveRDS(list(boundary = boundary, message = conditionMessage(e),
      classes = class(e), calls = sys.calls()),
      file.path(root, "first-failure.rds"))
    writeLines(c(paste("FIRST FAILURE:", boundary), conditionMessage(e)),
               file.path(root, "first-failure.txt"))
    stop(e)
  })
  invisible(result)
}
main()
