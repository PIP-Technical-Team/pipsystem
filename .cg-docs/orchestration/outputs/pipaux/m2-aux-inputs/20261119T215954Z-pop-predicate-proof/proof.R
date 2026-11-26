root <- Sys.getenv("POP_ROOT")
pipaux_head <- "01ff827340a9759dc3d4ef18d31f4e3ba26ff2be"
previous <- file.path(root, ".cg-docs/orchestration/outputs/pipaux/m2-aux-inputs",
                      "20261119T215954Z-pop-local/proof.R")
stopifnot(identical(unname(tools::sha256sum(previous)),
                    "337dccde8324bc54c72e29a6d9634af84cfe5e91f549c5bae3321a02e960b445"))

candidate_validators <- function(pilot, original, extract, upstream_code) {
  validators <- c("popmain_validate_raw", "spop_validate_raw",
                  "pop_validate_output")
  lines <- c(312L, 453L, 412L)
  levels <- c("pop_data_level", "pop_data_level", "reporting_level")
  replacement <- original
  for (i in seq_along(lines)) {
    key_args <- paste("country_code, year,", levels[[i]])
    old <- paste0("validate_if(is_uniq(", key_args, "),")
    new <- paste0("validate_if(all(is_uniq(", key_args, ")),")
    line <- lines[[i]]
    stopifnot(identical(trimws(original[[line]]), old))
    replacement[[line]] <- sub(old, new, original[[line]], fixed = TRUE)
  }
  extract(replacement, validators, pilot)
  parts <- c(list(aux_pop_update = upstream_code),
             mget(validators, envir = pilot, inherits = FALSE))

  # Test each full validator, not a standalone substitute for its predicate.
  for (i in seq_along(validators)) {
    validator <- parts[[validators[[i]]]]
    unique_keys <- data.table::data.table(country_code = c("COL", "COL"),
                                         year = c(2010, 2011), pop = c(10, 20))
    domain <- if (levels[[i]] == "reporting_level") "national" else 2
    data.table::set(unique_keys, j = levels[[i]], value = rep(domain, 2L))
    duplicate_keys <- data.table::copy(unique_keys)
    data.table::set(duplicate_keys, i = 2L, j = "year", value = 2010)
    validator(unique_keys, detail = FALSE)
    failure <- tryCatch(validator(duplicate_keys, detail = FALSE), error = identity)
    stopifnot("Duplicate control did not fail validation" = inherits(failure, "error"),
              "Duplicate control failed for the wrong reason" = grepl(
                "no duplicate records in key variables",
                gsub("[[:space:]]+", " ", conditionMessage(failure)), fixed = TRUE
              ))
    cat("PASS:", validators[[i]], "accepted unique keys and rejected duplicate keys.\n")
  }

  # Stamp fingerprints the unchanged producer body plus the experimental validators.
  code <- function() NULL
  body(code) <- as.call(c(list(as.name("{")), lapply(parts, body)))
  return(code)
}

# Reuse the pinned local harness through its exact Stamp readback. Keep every
# edit in memory, and end with the requested readback/key check only.
harness <- readLines(previous, warn = FALSE)
end <- which(harness == "pilot$pop_validate_output(pop, detail = FALSE)")
stopifnot(length(end) == 1L)
harness <- harness[seq_len(end)]
replace_one <- function(before, after) {
  hit <- which(grepl(before, harness, fixed = TRUE))
  stopifnot(length(hit) == 1L)
  harness[hit] <<- sub(before, after, harness[hit], fixed = TRUE)
}
replace_one('file.path(root, ".tmp/m2pop")', 'file.path(root, ".tmp/m2popfix")')
replace_one(
  'raw_paths <- file.path(scratch, "inputs", names(raw_blobs))',
  paste('candidate_code <- candidate_validators(pilot, original, extract, upstream_code)',
        'candidate_hash <- stamp::st_hash_obj(paste(deparse(candidate_code), collapse = "\\n"))',
        'cat("Experimental candidate code hash:", candidate_hash, "\\n")',
        'raw_paths <- file.path(root, ".tmp/m2pop/inputs", names(raw_blobs))',
        sep = "\n")
)
replace_one('unchanged pinned main, special and output validators',
            'experimental main, special and output validators')
replace_one('metadata$proof <- list(release = release, year_ceiling = year_ceiling,',
            paste('metadata$proof <- list(experimental = TRUE, pipaux_head = pipaux_head,',
                  '                         candidate_code_hash = candidate_hash,',
                  '                         release = release, year_ceiling = year_ceiling,',
                  sep = "\n"))
replace_one('code = upstream_code', 'code = candidate_code')
replace_one('Running pinned population producer;', 'Running one experimental population producer;')
eval(parse(text = harness), envir = environment())

direct <- qs2::qs_read(retained)
national <- pop[list("COL", 2010, "national"), on = pk, nomatch = NULL]
stopifnot(
  "No exact positive national COL 2010 population match" =
    nrow(national) == 1L && all(is.finite(national$pop) & national$pop > 0),
  identical(key(pop), pk), !anyDuplicated(pop, by = pk),
  min(pop$year) >= 1960, max(pop$year) <= year_ceiling,
  !is.null(meta$file_hash),
  identical(meta$file_hash, secretbase::siphash13(file = retained)),
  identical(stamp::st_hash_obj(pop), meta$content_hash),
  identical(stamp::st_hash_obj(direct), meta$content_hash),
  !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces())
)
receipt <- data.frame(
  release = release, experimental = TRUE, pipaux_head = pipaux_head,
  code_hash = candidate_hash, version = version, rows = nrow(pop),
  year_ceiling = year_ceiling, byte_checksum = meta$file_hash,
  content_hash = meta$content_hash, retained_path = retained,
  retained_sha256 = unname(tools::sha256sum(retained)),
  col_2010_national = "exactly_one_positive"
)
utils::write.table(receipt, file.path(run, "candidate.tsv"), sep = "\t",
                   row.names = FALSE)
cat("PASS: exact retained version and direct bytes match both recorded hashes;",
    "one finite positive national COL 2010 key.\n")
