run <- ".cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel"
base <- file.path(run, "baseline")
ps <- new.env()
sys.source("tools/pipsys/pipsys.R", envir = ps)
bytes <- function(path) readBin(path, "raw", n = file.info(path)$size)
root <- normalizePath(".", winslash = "/")
stopifnot(startsWith(root, "E:/"))
stopifnot(startsWith(normalizePath(tempdir(), winslash = "/"), "E:/"))
for (kind in c("commands", "agents")) {
  sources <- list.files(file.path("tools/pipsys/kilo", kind), pattern = "\\.md$", full.names = TRUE)
  for (source in sources) {
    name <- basename(source)
    dest <- file.path(".kilo", kind, name)
    original <- file.path(base, paste0("installed__", kind, "__", name))
    stopifnot(ps$check_path(source, root), ps$check_path(dest, root))
    stopifnot(identical(bytes(dest), bytes(original)))
    cat("Contained; no installed-only changes:", dest,
        "; source differs:", !identical(bytes(source), bytes(dest)), "\n")
  }
}
