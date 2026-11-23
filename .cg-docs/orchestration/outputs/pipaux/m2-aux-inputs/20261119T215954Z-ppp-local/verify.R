# Verify the retained versions from the single producer execution, read-only.
root <- Sys.getenv("PPP_ROOT")
bundle <- Sys.getenv("PPP_BUNDLE")
scratch <- Sys.getenv("PPP_SCRATCH")
normalize <- function(path) normalizePath(path, winslash = "/", mustWork = TRUE)
libraries <- strsplit(Sys.getenv("R_LIBS"), ";", fixed = TRUE)[[1L]]
stopifnot(getRversion() == "4.5.2", identical(normalize(getwd()), scratch),
          startsWith(normalize(tempdir()), paste0(scratch, "/t/")),
          identical(normalize(.libPaths()), normalize(c(libraries, .Library))))
source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
ns <- load_qualified_stamp()
store <- file.path(scratch, "store")
alias <- "ppp_readback"
# No reinitialization or mutation: only register the alias in this session.
get(".st_alias_register", envir = ns)(alias, store, ".stamp",
                                     file.path(store, ".stamp"))
versions <- c(ppp = "404c83141bb0ab87", ppp_vintage = "72ea2037d77f5728")
sha <- function(paths) unname(tools::sha256sum(paths))
gh <- list(
  owner = "PIP-Technical-Team", repo = "aux_ppp", branch = "20260401_TEST",
  file_path = "ppp.csv", ext = "csv", gh_raw_sha = Sys.getenv("PPP_BLOB"),
  commit = Sys.getenv("PPP_COMMIT"), sha256 = Sys.getenv("PPP_CSV_SHA"),
  url = Sys.getenv("PPP_URL")
)
countries <- list(version = "30d540ca6e32d842", sha256 = Sys.getenv("PPP_COUNTRY_SHA"))
results <- lapply(names(versions), function(id) {
  version <- versions[[id]]
  artifact <- paste0(id, ".qs2")
  path <- file.path(store, artifact, "versions", version, "artifact")
  meta <- stamp::st_read_sidecar(artifact, alias = alias, version_id = version)
  disk <- qs2::qs_read(path)
  loaded <- stamp::st_load_version(artifact, version, alias = alias,
                                    verbose = FALSE)
  cat("Verified version requested:", artifact, version, "\n")
  cat("Attribute names on disk:", paste(names(attributes(disk)), collapse = ", "),
      "\nAttribute names after load:",
      paste(names(attributes(loaded)), collapse = ", "), "\n")
  cols <- function(x) lapply(names(x), function(name) x[[name]])
  stopifnot(
    identical(meta$gh, gh), identical(meta$country_list, countries),
    identical(meta$file_hash, secretbase::siphash13(file = path)),
    identical(sha(path), sha(file.path(store, artifact, artifact))),
    identical(stamp::st_hash_obj(disk), meta$content_hash),
    identical(names(disk), names(loaded)),
    identical(cols(disk), cols(loaded), num.eq = FALSE),
    identical(row.names(disk), row.names(loaded)),
    identical(data.table::key(loaded), meta$pk$keys),
    identical(attr(disk, "aux_name"), id),
    identical(attr(disk, "aux_key"), meta$pk$keys)
  )
  hash_loaded <- stamp::st_hash_obj(loaded)
  cat("PASS: exact retained bytes, recorded object hash, column data, keys and provenance.\n")
  cat("Object hash after public load:", hash_loaded, "\n")
  receipt <- data.frame(artifact, version, rows = nrow(loaded), path,
                        byte_checksum = meta$file_hash,
                        object_hash = meta$content_hash, sha256 = sha(path),
                        loaded_object_hash = hash_loaded)
  return(list(data = loaded, receipt = receipt))
})

# Use a different CSV parser and compare source suffixes and values by key.
raw <- file.path(scratch, "ppp.csv")
cells <- utils::read.csv(raw, colClasses = "character", check.names = FALSE)
columns <- grep("^ppp_2021_[Vv][0-9]_[Vv][0-9]$", names(cells), value = TRUE)
national <- which(cells$code == "COL" & cells$ppp_domain == "1" &
                    cells$datalevel == "2")
stopifnot(length(national) == 1L, length(columns) > 0L)
tags <- sub("^ppp_", "", columns)
expected <- as.numeric(unlist(cells[national, columns], use.names = FALSE))
ppp <- results[[1L]]$data
actual <- ppp[country_code == "COL" & reporting_level == "national" &
                ppp_year == 2021]
actual_tags <- with(actual, paste(ppp_year, release_version, adaptation_version,
                                  sep = "_"))
inventory <- results[[2L]]$data
inventory <- inventory[ppp_year == 2021]
inventory_tags <- with(inventory, paste(ppp_year, ppp_rv, ppp_av, sep = "_"))
stopifnot(identical(sort(tags), sort(actual_tags)),
          identical(sort(tags), sort(inventory_tags)),
          all(is.finite(expected) & expected > 0),
          identical(sha(c(raw, Sys.getenv("PPP_COUNTRIES"))),
                    c(gh$sha256, countries$sha256)),
          !any(c("pipaux", "pipfun", "pipload", "pipdata") %in% loadedNamespaces()))
actual_values <- actual$ppp[match(tags, actual_tags)]
exact <- identical(expected, actual_values)
cat("Bitwise equal to independent parser:", exact, "\n")
stopifnot(isTRUE(all.equal(expected, actual_values, tolerance = 1e-14)))
cat("PASS: national COL 2021 source checks (relative tolerance 1e-14):",
    length(tags), "cells; unselected tags:", paste(sort(tags), collapse = ", "), "\n")
receipt <- do.call(rbind, lapply(results, `[[`, "receipt"))
utils::write.table(receipt, file.path(bundle, "candidate.tsv"), sep = "\t",
                   row.names = FALSE)
