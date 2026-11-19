# Synthetic table inputs and external transport only; no processing substitutes.
survey_fixture_tables <- function(survey_id, bad_id) {
  catalog <- data.table::data.table(
    Country = "AAA", Year = 2010L, Survey_acronym = c("SYNA", "SYNB"),
    Vermast = "V01", Veralt = "V01", Collection = "GMD", Module = "GPWG",
    FileName = paste0(c(survey_id, bad_id), ".dta"),
    Checksum = c("synthetic-valid-v1", "synthetic-missing-weight-v1"),
    Ext = "dta"
  )
  pfw <- data.table::data.table(
    country_code = "AAA", surveyid_year = 2010L,
    survey_acronym = c("SYNA", "SYNB"), welfare_type = "income",
    inpovcal = 1, use_imputed = 0, cpi_domain = 1, ppp_domain = 1,
    pop_domain = 1, gdp_domain = 1, pce_domain = 1,
    cpi_domain_var = "", ppp_domain_var = "", is_alt_welf = FALSE
  )
  cpi <- data.table::data.table(
    country_code = "AAA", year = 2010L, survey_acronym = c("SYNA", "SYNB"),
    cpi_year = 2021L, reporting_level = "national", cpi_value = 1.4
  )
  ppp <- data.table::data.table(
    country_code = "AAA", ppp_year = 2021L, release_version = "v1",
    adaptation_version = "v1", reporting_level = "national", ppp = 1.6,
    ppp_default_by_year = TRUE
  )
  auxiliary <- list(pfw = pfw, cpi = cpi, ppp = ppp)
  keys <- list(
    pfw = c("country_code", "surveyid_year", "survey_acronym", "welfare_type"),
    cpi = c("country_code", "year", "survey_acronym", "cpi_year",
            "reporting_level"),
    ppp = c("country_code", "ppp_year", "release_version",
            "adaptation_version", "reporting_level")
  )
  for (measure in c("pop", "gdp", "pce")) {
    value <- data.table::data.table(
      country_code = "AAA", year = 2010L, reporting_level = "national"
    )
    data.table::set(value, j = measure, value = 100)
    auxiliary[[measure]] <- value
    keys[[measure]] <- c("country_code", "year", "reporting_level")
  }
  return(list(catalog = catalog, aux = auxiliary, keys = keys))
}

# Given raw rows, catalog rows and the invalid survey ID, replace only external
# transport bindings in this isolated child. Return a zero-argument restoration
# function; the Qmd calls it after writing the summary, before the child exits.
use_fixture_transport <- function(raw, catalog, bad_id) {
  restorations <- list()
  replace_transport <- function(package, name, replacement) {
    namespace <- asNamespace(package)
    original <- get(name, namespace)
    unlockBinding(name, namespace)
    assign(name, replacement, namespace)
    lockBinding(name, namespace)
    restorations[[length(restorations) + 1L]] <<- function() {
      unlockBinding(name, namespace)
      assign(name, original, namespace)
      lockBinding(name, namespace)
    }
  }
  replace_transport("pipfun", "get_file_from_gh", function(...) {
    data.table::data.table(release = "20260401", identity = "TEST")
  })
  replace_transport("pipfun", "download_from_gh", function(path, ...) {
    stopifnot(grepl("/ppp_vintage.csv$", path))
    destination <- list(...)[[1L]]
    data.table::fwrite(
      data.table::data.table(ppp_year = 2021L, ppp_rv = "01", ppp_av = "01"),
      destination
    )
  })
  replace_transport("pipfun", "get_file_info_from_gh", function(...) {
    list(sha = "synthetic-ppp-vintage-v1")
  })
  replace_transport("dlw", "dlw_server_catalog", function(...) {
    data.table::copy(catalog)
  })
  replace_transport("dlw", "dlw_get_gmd", function(filename, ...) {
    stopifnot(filename %in% catalog$FileName)
    value <- data.table::copy(raw)
    if (identical(filename, paste0(bad_id, ".dta"))) {
      value[, weight := NULL]
      value[, survname := "SYNB"]
    }
    pipload::pip_write(
      value, id = tolower(sub("[.]dta$", "", filename)), alias = "dlw",
      pk = c("hhid", "pid"), verbose = FALSE
    )
  })
  return(function() {
    for (restore in rev(restorations)) restore()
  })
}
