# Source only in the user's already initialized R session. Never initializes,
# updates, saves, repairs or selects a working auxiliary version.
validate_retained_candidates <- function() {
  checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
  private_library <- file.path(
    checkout, ".tmp/one-survey/qmd-acceptance-20261113/library"
  )
  stopifnot(identical(readLines(file.path(checkout, ".git/HEAD"), warn = FALSE),
                      "ref: refs/heads/main"), getRversion() == "4.5.2")
  stopifnot("Use the already initialized reader session" =
              all(c("stamp", "pipfun", "pipload", "qs2") %in% loadedNamespaces()),
            identical(normalizePath(.libPaths()[[1L]], winslash = "/"),
                      normalizePath(private_library, winslash = "/")))
  old_options <- options(pipfun.log.auto = FALSE, pipfun.verbose = FALSE,
                         pipload.verbose = FALSE)
  on.exit(options(old_options), add = TRUE)

  # Check readers and their actual import origins; never switch libraries or
  # unload an existing namespace to make a mismatch disappear.
  seen <- character()
  check_origin <- function(package) {
    if (package %in% seen) return(invisible(NULL))
    seen <<- c(seen, package)
    stopifnot(package %in% loadedNamespaces())
    namespace <- asNamespace(package)
    private_path <- file.path(private_library, package)
    if (dir.exists(private_path)) {
      expected <- private_path
    } else {
      expected <- file.path(.Library, package)
      priority <- read.dcf(file.path(expected, "DESCRIPTION"), fields = "Priority")
      stopifnot(priority[[1L]] %in% c("base", "recommended"))
    }
    actual <- if (package == "base") file.path(.Library, "base") else
      getNamespaceInfo(namespace, "path")
    if (!identical(normalizePath(actual, winslash = "/"),
                   normalizePath(expected, winslash = "/"))) {
      stop(paste("Namespace origin mismatch:", package, "expected", expected,
                 "got", actual), call. = FALSE)
    }
    for (import in names(getNamespaceImports(namespace))) check_origin(import)
    return(invisible(NULL))
  }
  for (package in c("stamp", "pipfun", "pipload", "qs2")) check_origin(package)
  # Public calls may lazily load ordinary helpers. They must resolve from the
  # first, private library; already loaded helpers must have that same origin.
  for (package in c("cli", "rlang", "data.table", "fs", "secretbase", "qs2")) {
    stopifnot(dir.exists(file.path(private_library, package)))
    if (package %in% loadedNamespaces()) check_origin(package)
  }
  stopifnot("metadata_only" %in% names(formals(pipload::pip_read)))
  pipfun::get_wrk_release(name = "probe_context", verbose = FALSE)
  stopifnot(identical(as.character(probe_context$release), "20260401"),
            identical(probe_context$identity, "TEST"),
            identical(probe_context$ppp, 2021))
  aux_root <- paste0(
    "//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2/",
    "aux_repository/aux_data/20260401_TEST"
  )
  stopifnot(identical(
    normalizePath(as.character(stamp::st_alias_get("aux")$root), winslash = "/"),
    normalizePath(aux_root, winslash = "/")
  ))
  cat("Checked reader/import origins:", length(seen), "namespaces.\n")
  cat("Context: 20260401 / TEST / PPP2021; COL2010 GEIH income.\n")

  candidates <- c(
    pfw = "dbd2ccf63260991d", cpi = "ae38185bd7ff383c",
    ppp = "c16e62d94f46e1bc", pop = "c059b971f5fc70cc",
    gdp = "062e2d30b15b4661", pce = "4d57e305a0e3c86e"
  )
  results <- data.frame(
    measure = names(candidates), version = unname(candidates),
    catalog = "NOT RUN", metadata = "NOT RUN", payload = "NOT RUN",
    hash = "NOT RUN", projection = "NOT RUN", rows = NA_integer_,
    detail = "", stringsAsFactors = FALSE
  )
  require_true <- function(condition, description) {
    if (!isTRUE(condition)) rlang::abort(description)
    return(invisible(NULL))
  }
  require_columns <- function(data, columns) {
    require_true(all(columns %in% names(data)), paste(
      "Missing required fields:", paste(setdiff(columns, names(data)), collapse = ", ")
    ))
    return(invisible(NULL))
  }
  national_domains_ready <- FALSE
  for (index in seq_along(candidates)) {
    measure <- names(candidates)[[index]]
    candidate <- candidates[[index]]
    stage <- "catalog"
    tryCatch({
      versions <- as.data.frame(stamp::st_versions(
        paste0(measure, ".qs2"), alias = "aux"
      ))
      row <- versions[!is.na(versions$version_id) &
                        versions$version_id == candidate, , drop = FALSE]
      require_true(nrow(row) == 1L, "Exact candidate must have one catalog row.")
      results$catalog[[index]] <- "PASS"

      stage <- "metadata"
      metadata <- pipload::pip_read(
        id = measure, format = "qs2", alias = "aux", version = candidate,
        metadata_only = TRUE, verbose = FALSE
      )
      require_true(is.list(metadata) && length(metadata) > 0L,
                   "Public historical metadata reader returned no metadata.")
      results$metadata[[index]] <- "PASS"
      stage <- "payload"
      payload <- pipload::pip_read(
        id = measure, format = "qs2", alias = "aux", version = candidate,
        metadata_only = FALSE, verbose = FALSE
      )
      results$payload[[index]] <- "PASS"
      results$rows[[index]] <- NROW(payload)

      # Hash the untouched public payload. No attribute stripping, default PPP
      # filtering or guessed normalization to manufacture agreement.
      stage <- "hash"
      require_true(is.character(metadata$content_hash) &&
                     length(metadata$content_hash) == 1L &&
                     !is.na(metadata$content_hash) && nzchar(metadata$content_hash),
                   "Historical sidecar lacks a usable content_hash.")
      require_true(identical(row$content_hash, metadata$content_hash),
                   "Catalog and historical sidecar content_hash disagree.")
      actual_hash <- stamp::st_hash_obj(payload)
      check_origin("secretbase")
      require_true(identical(actual_hash, metadata$content_hash), paste(
        "Public payload content_hash mismatch; expected", metadata$content_hash,
        "got", actual_hash
      ))
      results$hash[[index]] <- "PASS"

      stage <- "projection"
      require_true(is.data.frame(payload), "Candidate payload is not tabular.")
      data <- data.table::as.data.table(data.table::copy(payload))
      require_columns(data, "country_code")
      if (measure == "pfw") {
        domains <- paste0(c("cpi", "ppp", "pop", "gdp", "pce"), "_domain")
        require_columns(data, c("surveyid_year", "survey_acronym", "welfare_type",
                                "inpovcal", domains))
        selected <- data[toupper(country_code) == "COL" & surveyid_year == 2010 &
                           toupper(survey_acronym) == "GEIH" & inpovcal == 1]
        require_true(nrow(selected) > 0L &&
                       !anyNA(selected$welfare_type) &&
                       all(nzchar(as.character(selected$welfare_type))) &&
                       !anyDuplicated(tolower(selected$welfare_type)),
                     "Missing or ambiguous included PFW welfare mapping.")
        selected <- selected[tolower(welfare_type) == "income"]
        require_true(nrow(selected) == 1L, "Target requires one included income mapping.")
        domain_values <- vapply(domains, function(name) {
          value <- selected[[name]][[1L]]
          require_true(!is.na(value) && as.character(value) %in% c("1", "2"),
                       "PFW domain must be an exact supported code 1 or 2.")
          as.integer(as.character(value))
        }, integer(1))
        require_true(!anyNA(domain_values) && all(domain_values %in% c(1L, 2L)),
                     "PFW contains missing or unsupported auxiliary domains.")
        if (all(c("cpi_domain_var", "ppp_domain_var") %in% names(selected))) {
          vars <- unlist(selected[, c("cpi_domain_var", "ppp_domain_var"),
                                   with = FALSE], use.names = FALSE)
          if (!anyNA(vars) && all(domain_values == 1L)) {
            require_true(identical(tolower(vars[[1L]]), tolower(vars[[2L]])),
                         "CPI and PPP national-domain variables disagree.")
          }
        }
        national_domains_ready <- all(domain_values == 1L)
        if (national_domains_ready) {
          results$projection[[index]] <- "PASS"
          results$detail[[index]] <- "One included income mapping; national auxiliary domains."
        } else {
          results$detail[[index]] <- "Subnational domains need a different bounded check; not assessed."
        }
      } else if (!national_domains_ready) {
        results$detail[[index]] <- "Projection NOT RUN: verified national PFW domains unavailable."
      } else {
        required <- switch(measure,
          cpi = c("year", "survey_acronym", "cpi_year", "reporting_level", "cpi_value"),
          ppp = c("ppp_year", "release_version", "adaptation_version", "reporting_level", "ppp"),
          c("year", "reporting_level", measure)
        )
        require_columns(data, required)
        selected <- data[country_code == "COL"]
        if (measure == "cpi") {
          selected <- selected[year == 2010 & survey_acronym == "GEIH"]
          keys <- c("cpi_year", "reporting_level")
        } else if (measure == "ppp") {
          keys <- c("ppp_year", "release_version", "adaptation_version", "reporting_level")
        } else {
          selected <- selected[year == 2010]
          keys <- c("year", "reporting_level")
        }
        require_true(nrow(selected) > 0L && !anyNA(selected[, ..keys]) &&
                       !anyDuplicated(as.data.frame(selected[, ..keys])),
                     "Missing or ambiguous target projection keys.")
        if (measure == "cpi") selected <- selected[cpi_year == 2021]
        if (measure == "ppp") selected <- selected[ppp_year == 2021]
        selected <- selected[reporting_level == "national"]
        value_name <- if (measure == "cpi") "cpi_value" else measure
        values <- selected[[value_name]]
        require_true(nrow(selected) > 0L && is.numeric(values) &&
                       all(is.finite(values) & values > 0),
                     "Target national 2021/year2010 values are absent or nonpositive.")
        if (measure != "ppp") {
          require_true(nrow(selected) == 1L, "Target national value is not unique.")
        }
        results$projection[[index]] <- "PASS"
        results$detail[[index]] <- if (measure == "ppp") {
          paste(nrow(selected), "national PPP2021 variants; vintage NOT selected.")
        } else {
          "Unique finite positive target national value; raw value not printed."
        }
      }
    }, error = function(error) {
      results[index, stage] <<- "FAIL"
      results$detail[[index]] <<- cli::ansi_strip(conditionMessage(error))
    })
  }
  return(results)
}

# Reset only this probe's output so a stopping guard cannot leave a stale PASS.
retained_candidate_results <- NULL
retained_candidate_results <- validate_retained_candidates()
print(retained_candidate_results, row.names = FALSE)
cat("Technical read/coverage checks only; release authority NOT ASSESSED.\n")
cat("Shared selections unchanged. No producer, repair, save or pipeline requested.\n")
