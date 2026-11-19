# This corrected development build is separate from the first qualified tool.
stamp_install <- file.path(.libPaths()[[1L]], "stamp")
stamp_archive <- file.path(dirname(dirname(stamp_install)), "stamp_0.1.1.tar.gz")
stamp_fingerprints <- c(
  "R/stamp.rdb" = "672fa1aa454ba935d2676afec9de789a75a6e36353d53b18529680c6b536c54a",
  "R/stamp.rdx" = "dce62ad5f7da48b733bf914114a48d6d67496555158046f532dfd856fac624ba",
  "Meta/package.rds" = "4946c2c5e3c02fac507605c76c35e56ef2f99906d4efbcd2844d4982b8ece041",
  NAMESPACE = "9b23ac6344a113ba7b39d1feee2442454483c23607672750ce123c22c4767ed2"
)

load_qualified_stamp <- function() {
  stopifnot("Stamp is already loaded; use a fresh qualified session" =
              !"stamp" %in% loadedNamespaces())
  paths <- c(stamp_archive, file.path(stamp_install, names(stamp_fingerprints)))
  expected <- c(
    "96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586",
    unname(stamp_fingerprints)
  )
  stopifnot("Tested Stamp build fingerprint mismatch" =
              identical(unname(tools::sha256sum(paths)), expected))

  namespace <- loadNamespace("stamp", lib.loc = dirname(stamp_install))
  origin <- getNamespaceInfo(namespace, "path")
  normalize <- function(path) normalizePath(path, winslash = "/", mustWork = TRUE)
  stopifnot(identical(normalize(origin), normalize(stamp_install)))
  cat("Qualified archive SHA256:", expected[[1L]], "\n")
  return(namespace)
}
