# The retained development install and archive are read-only inputs.
stamp_install <- "E:/strec/r125434/full-c1/library/stamp"
stamp_archive <- "E:/strec/r125434/full-c1/stamp_0.1.1.tar.gz"
stamp_fingerprints <- c(
  "R/stamp.rdb" = "86d18924c227721e109e369c73432288c06c2b9c002b03ad0e05390a8490d497",
  "R/stamp.rdx" = "983a74b411f2192785d5ea3b28186141af49c84df45f97634d883d4e2597df48",
  "Meta/package.rds" = "4a650d9f3e62d17fa343379103b3704fb24db79112e05f82e2ddd54843773614",
  NAMESPACE = "9b23ac6344a113ba7b39d1feee2442454483c23607672750ce123c22c4767ed2"
)

load_qualified_stamp <- function() {
  stopifnot("Stamp is already loaded; use a fresh qualified session" =
              !"stamp" %in% loadedNamespaces())
  paths <- c(stamp_archive, file.path(stamp_install, names(stamp_fingerprints)))
  expected <- c(
    "771b397235beee349a6046c17f6b4d6cfe66236ae2eac4f49e16307227318cc3",
    unname(stamp_fingerprints)
  )
  stopifnot("Tested Stamp build fingerprint mismatch" =
              identical(unname(tools::sha256sum(paths)), expected))

  namespace <- loadNamespace("stamp", lib.loc = dirname(stamp_install))
  origin <- getNamespaceInfo(namespace, "path")
  normalize <- function(path) normalizePath(path, winslash = "/", mustWork = TRUE)
  stopifnot(identical(normalize(origin), normalize(stamp_install)))
  return(namespace)
}
