root <- Sys.getenv("POP_ROOT")
prior <- file.path(root, ".cg-docs/orchestration/outputs/pipaux/m2-aux-inputs",
                   "20261119T215954Z-pop-predicate-proof/proof.R")
stopifnot(identical(unname(tools::sha256sum(prior)),
                    "5020b0aa242dc80ba3dad0fd6e18e9e9ecfd20294953a1da346b332b863a0d8a"))

# Reuse the prior controls and producer, changing only the candidate predicate
# in memory. Its existing fingerprints therefore cover the qualified expression.
qualified_harness <- readLines(prior, warn = FALSE)
replace_line <- function(before, after) {
  hit <- which(trimws(qualified_harness) == before)
  stopifnot(length(hit) == 1L)
  qualified_harness[hit] <<- after
}
replace_line(
  'new <- paste0("validate_if(all(is_uniq(", key_args, ")),")',
  '    new <- paste0("validate_if(assertr::is_uniq(", key_args, "),")'
)
replace_line(
  'replace_one(\'file.path(root, ".tmp/m2pop")\', \'file.path(root, ".tmp/m2popfix")\')',
  'replace_one(\'file.path(root, ".tmp/m2pop")\', \'file.path(root, ".tmp/m2popq")\')'
)
replace_line(
  'national <- pop[list("COL", 2010, "national"), on = pk, nomatch = NULL]',
  paste('col_domains <- sort(unique(pop[country_code == "COL" & year == 2010, reporting_level]))',
        'stopifnot(identical(col_domains, c("national", "rural", "urban")))',
        'national <- pop[list("COL", 2010, "national"), on = pk, nomatch = NULL]',
        sep = "\n")
)
replace_line(
  'col_2010_national = "exactly_one_positive"',
  paste('  col_2010_national = "exactly_one_positive",',
        '  col_2010_domains = paste(col_domains, collapse = ","),',
        '  predicate = "assertr::is_uniq"', sep = "\n")
)
cat("Experimental predicate: assertr::is_uniq; no all() wrapper.\n")
eval(parse(text = qualified_harness), envir = environment())
