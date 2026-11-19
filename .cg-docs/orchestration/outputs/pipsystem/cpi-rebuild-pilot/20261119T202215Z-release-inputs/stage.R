root <- Sys.getenv("CPI_ROOT")
scratch <- normalizePath(Sys.getenv("CPI_SCRATCH"), winslash = "/", mustWork = TRUE)
bundle <- Sys.getenv("CPI_BUNDLE")
stopifnot(
  identical(scratch, file.path(root, ".tmp/cp26")),
  getRversion() == "4.5.2",
  startsWith(normalizePath(tempdir(), winslash = "/"), paste0(scratch, "/t/"))
)
setwd(scratch)
source(file.path(root, paste0(
  ".cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/",
  "20261119T151908Z-tool-qualification/qualified-stamp.R"
)))
invisible(load_qualified_stamp())

source(file.path(root, "experiments/one-survey/local-root.R"))
aux <- file.path(read_pip_main(root), "aux_repository/aux_data/20260401_TEST")
catalog_path <- file.path(aux, ".stamp/catalog.qs2")
hash <- function(path) {
  value <- unname(tools::sha256sum(path))
  stopifnot(length(value) == 1L, !is.na(value))
  return(value)
}
catalog_sha <- hash(catalog_path)
catalog <- qs2::qs_read(catalog_path)
artifacts <- as.data.frame(catalog$artifacts)
directory <- file.path(aux, "country_list.qs2")
path_key <- function(x) tolower(chartr("\\", "/", as.character(x)))
artifact <- artifacts[which(path_key(artifacts$path) == path_key(directory)), ,
                      drop = FALSE]
stopifnot("Expected one release country-list artifact" = nrow(artifact) == 1L)
pointer <- artifact$latest_version_id[[1L]]
versions <- as.data.frame(catalog$versions)
rows <- versions[which(versions$artifact_id == artifact$artifact_id[[1L]]), ,
                 drop = FALSE]
stopifnot(nrow(rows) > 0L, all(grepl("^[a-f0-9]{16}$", rows$version_id)),
          !anyDuplicated(rows$version_id), sum(rows$version_id == pointer) == 1L)

main <- file.path(directory, "country_list.qs2")
main_hash <- hash(main)
all_retained <- file.path(directory, "versions", rows$version_id, "artifact")
readable <- which(file.exists(all_retained))
matching <- readable[which(tools::sha256sum(all_retained[readable]) == main_hash)]
cat("Country-list catalog pointer:", pointer, "; retained files:", length(readable),
    "; byte matches to release main:", length(matching), "\n")
# The default CPI loader reads main, not the catalog pointer. Pin the exact
# retained copy that is byte-identical to main; never replace main by a guess.
stopifnot("Cannot uniquely pin release country-list main to retained bytes" =
            length(matching) == 1L)
row <- rows[matching, , drop = FALSE]
version <- row$version_id[[1L]]
retained <- all_retained[[matching]]
cl <- file.path(scratch, "inputs/country_list.qs2")
table <- qs2::qs_read(main)
stopifnot(
  "Country-list object hash does not match its version row" =
    identical(stamp::st_hash_obj(table), as.character(row$content_hash[[1L]])),
  is.data.frame(table), is.character(table$country_code),
  length(table$country_code) > 0L, !anyNA(table$country_code),
  all(nzchar(table$country_code))
)
stopifnot(file.copy(retained, cl, overwrite = FALSE))
stopifnot(identical(main_hash, hash(cl)), identical(main_hash, hash(main)),
          identical(main_hash, hash(retained)),
          identical(catalog_sha, hash(catalog_path)))

csv <- file.path(scratch, "inputs/cpi.csv")
inputs <- data.frame(
  release = "20260401_TEST",
  input = c("raw_cpi", "country_list"),
  source = c("PIP-Technical-Team/aux_cpi/cpi.csv", main),
  version = c("7e96f769859bad9f8d98b8aa0e67250bf1b3e7a3", version),
  source_object = c("adb5a6fdac90e0842e1989a76c9ede023d9e860d",
                    as.character(row$content_hash[[1L]])),
  local_file = c(csv, cl),
  sha256 = c(hash(csv), main_hash),
  bytes = c(file.size(csv), file.size(cl))
)
utils::write.table(inputs, file.path(bundle, "inputs.tsv"), sep = "\t",
                   row.names = FALSE)
cat("PASS: release main, retained country list and staged bytes agree.\n")
cat("Catalog sampled SHA256:", catalog_sha, "\n")
cat("Country-list version:", version, "\n")
cat("No shared writes, aliases, release initialization or producer calls.\n")
