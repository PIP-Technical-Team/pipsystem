# Minimal public-call reproducer for the first pinned-package path failure.
# Run through run.ps1 -Mode reproduce against a completed isolated setup.
root <- normalizePath(Sys.getenv("ONE_SURVEY_ROOT"), winslash = "/")
checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
source(file.path(checkout, "experiments/one-survey/setup.R"))
invisible(verify(readRDS(file.path(root, "inventory.rds"))))

main <- function() {
  destination <- file.path(root, "store/reproducer-context")
  stopifnot(!file.exists(destination))
  options(pipfun.main_dir = destination, pipfun.verbose = FALSE,
          pipload.verbose = FALSE, pipdata.verbose = FALSE)
  Sys.setenv(PIP_ROOT_DIR = destination)
  replace_transport <- function(name, value, package = "pipfun") {
    ns <- asNamespace(package)
    old <- get(name, ns)
    unlockBinding(name, ns)
    assign(name, value, ns)
    lockBinding(name, ns)
    function() {
      unlockBinding(name, ns)
      assign(name, old, ns)
      lockBinding(name, ns)
    }
  }
  restore_release <- replace_transport("get_file_from_gh", function(...) {
    data.table::data.table(release = "20260401", identity = "TEST")
  })
  on.exit(restore_release(), add = TRUE)
  restore_csv <- replace_transport("download_from_gh", function(path, file) {
    stopifnot(grepl("/ppp_vintage.csv$", path))
    data.table::fwrite(data.table::data.table(ppp_year = 2021L,
      ppp_rv = "01", ppp_av = "01"), file)
  })
  on.exit(restore_csv(), add = TRUE)
  restore_info <- replace_transport("get_file_info_from_gh", function(...) {
    list(sha = "synthetic-ppp-vintage-v1")
  })
  on.exit(restore_info(), add = TRUE)
  release <- pipfun::setup_working_release("20260401", "TEST", verbose = FALSE)
  context_options <- options()[c("pipfun.working_release", "pipfun.identity")]
  print(release)
  print(context_options)
  stopifnot(identical(release$release, "20260401"),
            identical(release$identity, "TEST"),
            is.null(getOption("pipfun.working_release")),
            is.null(getOption("pipfun.identity")))
  inv <- readRDS(file.path(root, "validation-result.rds"))$validation$inventory
  inv <- inv[status == "valid"]
  stopifnot(nrow(inv) == 1L)
  # No context options are seeded to bypass the public setup/wrapper mismatch.
  result <- tryCatch(pipdata::pd_process_data(inv = inv, bootstrap = TRUE,
                                             verbose = FALSE), error = identity)
  versions <- stamp::st_versions("pip_master_inventory.qs2", alias = "pip_master")
  downstream <- lapply(c("pip", "pip_meta"), function(alias) {
    stamp::st_catalog_query(alias = alias)
  })
  saveRDS(list(inv = inv, release = release, context_options = context_options,
              result = result, master_versions = versions, downstream = downstream),
          file.path(root, "reproducer-context.rds"))
  print(result)
  print(versions)
  stopifnot(inherits(result, "error"),
    inherits(result, "pipdata_dependency_context_error"),
    identical(conditionMessage(result),
              "A single working release and identity are required."),
    nrow(versions) == 0L, all(vapply(downstream, nrow, 1L) == 0L))
  cat("First package boundary reproduced; this is NOT scenario acceptance.\n")
}
main()
