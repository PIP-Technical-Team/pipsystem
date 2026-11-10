# Private runtime and all write roots are established by run.ps1 before startup.
root <- normalizePath(Sys.getenv("ONE_SURVEY_ROOT"), winslash = "/",
                      mustWork = TRUE)
checkout <- "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"
stopifnot(startsWith(root, paste0(checkout, "/.tmp/one-survey/")))
lib <- file.path(root, "library")
mode <- tail(commandArgs(TRUE), 1L)
options(pipfun.log.auto = FALSE, pipfun.verbose = FALSE)
packages <- data.frame(
  package = c("stamp", "pipfun", "pipload", "wbpip", "dlw", "pipaux", "pipdata"),
  repo = c("E:/PovcalNet/01.personal/wb384996/Rpackages/stamp",
           paste0("E:/PovcalNet/01.personal/wb384996/PIP/",
                  c("pipfun", "pipload", "wbpip")),
           "E:/PovcalNet/01.personal/wb384996/Rpackages/dlw",
           paste0("E:/PovcalNet/01.personal/wb384996/PIP/", c("pipaux", "pipdata"))),
  sha = c("95890411e8bf9db842593c2b0ab68ec4f2a66b25",
          "7d534516a8c17c33d537681610eccd4c29211762",
          "ff9a81e386a09fb2531c154f63fd2b91521313c6",
          "fd2c687ed527ebe33d0a7addf9859f72f71ff39f",
          "12faa058b521ef511073a7b21b1b1dd7993c9649",
          "01ff827340a9759dc3d4ef18d31f4e3ba26ff2be",
          "13a38280c1eafe7e03a97837cdb57833fbe9d926"))
source <- setNames(file.path(root, "sources", packages$package), packages$package)
required <- packages$package
setwd(root)
safe <- function(path) {
  actual <- normalizePath(path, winslash = "/", mustWork = TRUE)
  stopifnot(all(startsWith(tolower(actual), paste0(tolower(root), "/"))))
  invisible(actual)
}
safe(c(tempdir(), .libPaths(), Sys.getenv(c("HOME", "TEMP", "TMP", "TMPDIR"))))
usable <- function() {
  # Actual namespace loading plus exported behavior, not inventory existence.
  stopifnot(is.character(pipfun::log_names()))
  for (package in required) loadNamespace(package)
  value <- list(example = 1:3)
  hash <- stamp::st_hash_obj(value)
  stopifnot(length(hash) == 1L, grepl("^[0-9a-f]{16}$", hash),
            identical(hash, stamp::st_hash_obj(value)),
            !identical(hash, stamp::st_hash_obj(list(example = 1:4))))
  paths <- vapply(loadedNamespaces(), function(p) {
    if (p == "base") file.path(.Library, "base") else
      getNamespaceInfo(asNamespace(p), "path")
  }, "")
  safe(paths)
  return(paths)
}
if (mode == "baseline") {
  usable()
  stop("Unexpected usable package before installation")
}
if (mode == "forced-failure") stop("Intentional child failure for restoration")
if (mode == "inspect") {
  installer <- get(".install_packages", envir = asNamespace("tools"))
  writeLines(deparse(installer), file.path(root, "logs/installer-source.txt"))
  cat("Private R home:", R.home(), "\n")
  print(installed.packages(lib.loc = .Library)[, c("Package", "Priority")])
  files <- list.files(file.path(root, "r"), recursive = TRUE, full.names = TRUE)
  cat("Private runtime files:", length(files), "bytes:",
      sum(file.info(files)$size), "\n")
}
install <- function(package, destination = lib, label = package) {
  log <- file.path(root, "logs", paste0("install-", label, ".log"))
  rc <- system2(file.path(R.home("bin"), "R.exe"),
    c("CMD", "INSTALL", "--no-multiarch", "--no-test-load",
      paste0("--library=", shQuote(destination)), shQuote(source[[package]])),
    stdout = log, stderr = log)
  cat("INSTALL", package, "exit", rc, "destination", destination, "\n")
  return(list(package = package, sha = packages$sha[packages$package == package],
              root = root, path = file.path(destination, package), exit = rc,
              archive_md5 = unname(tools::md5sum(file.path(
                root, "sources", paste0(package, ".tar")))), log = log))
}
if (mode == "setup") {
  stopifnot(length(list.files(lib, all.files = TRUE, no.. = TRUE)) == 0L,
            length(list.files(file.path(root, "sources"), all.files = TRUE,
                              no.. = TRUE)) == 0L)
  for (i in seq_len(nrow(packages))) {
    p <- packages[i, ]
    archive <- file.path(root, "sources", paste0(p$package, ".tar"))
    rc <- system2("git", c("-C", shQuote(p$repo), "archive", "--format=tar",
                  paste0("--output=", shQuote(archive)), p$sha))
    stopifnot(rc == 0L)
    dir.create(source[[p$package]])
    utils::untar(archive, exdir = source[[p$package]], tar = "internal")
  }
  write.table(packages, file.path(root, "pins.tsv"), sep = "\t",
              row.names = FALSE, quote = FALSE)
  states <- unlist(lapply(seq_len(nrow(packages)), function(i) {
    p <- packages[i, ]
    c(paste("REPOSITORY", p$repo, "ARCHIVE", p$sha),
      system2("git", c("-C", shQuote(p$repo), "rev-parse", "HEAD"),
              stdout = TRUE),
      system2("git", c("-C", shQuote(p$repo), "status", "--short"),
              stdout = TRUE))
  }))
  writeLines(states, file.path(root, "logs/repository-status.txt"))
  # Record source hooks before any source installation. No configure scripts run.
  hook_files <- unlist(lapply(source, function(p) list.files(p,
    pattern = "^(zzz\\.R|configure.*|cleanup.*|Makevars.*)$", recursive = TRUE,
    full.names = TRUE)))
  hooks <- unlist(lapply(hook_files, function(p) c(p, readLines(p, warn = FALSE))))
  writeLines(hooks, file.path(root, "logs/source-hooks.txt"))
  # The real pinned stamp declares cli. The isolated child must fail without it;
  # cli is present in the mixed original installation, but cannot be a fallback.
  missing <- install("stamp", label = "missing-declared-cli")
  missing_text <- readLines(missing$log, warn = FALSE)
  stopifnot(missing$exit != 0L,
            any(grepl("dependencies.*not available|dependency.*not available",
                      missing_text)), any(grepl("cli", missing_text)),
            !dir.exists(file.path(lib, "stamp")))
  cat("P1.2/P2.3: actual declared-dependency child failure confirmed\n")
  ambient <- "E:/PovcalNet/01.personal/wb384996/R/win-library/4.5"
  base <- rownames(installed.packages(lib.loc = .Library))
  seen <- character()
  install_order <- character()
  provenance <- list()
  visit <- function(package) {
    if (package %in% c("R", base, seen)) return(invisible(NULL))
    seen <<- c(seen, package)
    path <- if (package %in% required) source[[package]] else
      file.path(ambient, package)
    desc <- read.dcf(file.path(path, "DESCRIPTION"))
    fields <- intersect(c("Depends", "Imports", "LinkingTo"), colnames(desc))
    deps <- trimws(gsub("\\s*\\(.*?\\)", "", unlist(strsplit(
      paste(desc[1L, fields], collapse = ","), ","))))
    for (dep in deps[nzchar(deps)]) visit(dep)
    if (package %in% required) install_order <<- c(install_order, package)
    if (!package %in% required) {
      # Launcher has rejected redirects throughout this fresh output tree.
      # Reject redirected copy inputs too (Windows junctions need PS inspection).
      rc <- system2("powershell.exe", c("-NoLogo", "-NoProfile", "-NonInteractive",
        "-Command", shQuote(paste0(
          "$ErrorActionPreference='Stop'; $p='", path, "'; ",
          "$items=@(Get-Item -Force -LiteralPath $p)+@(Get-ChildItem -Force -Recurse -LiteralPath $p); ",
          "foreach($i in $items){if(($i.Attributes -band [IO.FileAttributes]::ReparsePoint) -or $i.LinkType -eq 'HardLink'){exit 7}}"))))
      stopifnot(rc == 0L, !dir.exists(file.path(lib, package)))
      stopifnot(file.copy(path, lib, recursive = TRUE, copy.date = TRUE))
      provenance[[package]] <<- data.frame(package = package,
        version = desc[1L, "Version"], origin = path,
        path = file.path(lib, package),
        description_md5 = unname(tools::md5sum(file.path(path, "DESCRIPTION"))))
    }
    invisible(NULL)
  }
  for (package in required) visit(package)
  dependencies <- do.call(rbind, provenance)
  rownames(dependencies) <- NULL
  write.table(dependencies, file.path(root, "dependencies.tsv"), sep = "\t",
              row.names = FALSE, quote = FALSE)
  receipts <- list()
   for (package in install_order) {
    receipt <- install(package)
    stopifnot(receipt$exit == 0L)
    receipt$installed_md5 <- unname(tools::md5sum(
      file.path(receipt$path, "Meta/package.rds")))
    receipts[[package]] <- receipt
  }
  inventory <- list(root = root, packages = packages, dependencies = dependencies,
                    receipts = receipts[required])
  saveRDS(inventory, file.path(root, "inventory.rds"))
}
verify <- function(inventory) {
  stopifnot(identical(inventory$root, root),
            identical(inventory$packages, packages),
            identical(names(inventory$receipts), required),
             nrow(inventory$dependencies) > 0L)
  dependencies <- inventory$dependencies
  expected <- read.delim(file.path(root, "dependencies.tsv"),
                         stringsAsFactors = FALSE, check.names = FALSE)
  stopifnot(identical(dependencies, expected),
            !anyDuplicated(dependencies$package))
  for (i in seq_len(nrow(dependencies))) {
    dep <- dependencies[i, ]
    destination <- file.path(lib, dep$package)
    description <- file.path(destination, "DESCRIPTION")
    safe(description)
    stopifnot(identical(dep$path, destination),
      identical(dep$origin, file.path(
        "E:/PovcalNet/01.personal/wb384996/R/win-library/4.5", dep$package)),
      identical(dep$version, unname(read.dcf(description)[1L, "Version"])),
      identical(dep$description_md5, unname(tools::md5sum(description))))
  }
  for (package in required) {
    receipt <- inventory$receipts[[package]]
    stopifnot(identical(receipt$root, root), receipt$exit == 0L,
      identical(receipt$sha, packages$sha[packages$package == package]),
      identical(receipt$path, file.path(lib, package)),
      identical(receipt$archive_md5, unname(tools::md5sum(file.path(
        root, "sources", paste0(package, ".tar"))))),
      identical(receipt$installed_md5, unname(tools::md5sum(
        file.path(receipt$path, "Meta/package.rds")))),
      any(grepl(paste0("DONE (", package, ")"), readLines(receipt$log), fixed = TRUE)))
  }
  paths <- usable()
  for (package in required) {
    stopifnot(identical(unname(paths[package]), file.path(lib, package)))
  }
  contributed <- intersect(names(paths), dependencies$package)
  stopifnot(identical(unname(paths[contributed]),
                     file.path(lib, contributed)))
  return(paths)
}
if (mode %in% c("setup", "check", "diagnose")) {
  inventory <- readRDS(file.path(root, "inventory.rds"))
  paths <- verify(inventory)
  bad <- inventory
  bad$receipts$pipfun <- NULL
  stopifnot(inherits(try(verify(bad), silent = TRUE), "try-error"))
  bad <- inventory
  bad$receipts$pipfun$sha <- strrep("0", 40)
  stopifnot(inherits(try(verify(bad), silent = TRUE), "try-error"))
  bad <- inventory
  bad$receipts$pipfun$root <- dirname(root)
  stopifnot(inherits(try(verify(bad), silent = TRUE), "try-error"))
  bad <- inventory
  bad$dependencies$version[1L] <- "stale-version"
  stopifnot(inherits(try(verify(bad), silent = TRUE), "try-error"))
  bad <- inventory
  bad$dependencies <- bad$dependencies[1L, , drop = FALSE]
  stopifnot(inherits(try(verify(bad), silent = TRUE), "try-error"))
  write.table(data.frame(package = names(paths), path = unname(paths)),
    file.path(root, "namespace-paths.tsv"), sep = "\t", quote = FALSE,
    row.names = FALSE)
  cat("P2.1/P2.2: usable exact-path packages; 5 stale/incomplete receipt/dependency controls rejected\n")
  print(.libPaths())
  print(paths)
  if (mode != "diagnose") cat("Original V1: seven exact source installs PASS\n")
}
if (mode == "diagnose") {
  diagnostic_root <- file.path(root, "store", "diagnostic")
  stopifnot(!file.exists(diagnostic_root))
  call <- quote(pipfun::pip_create_globals(root_dir = diagnostic_root,
    vintage = NULL, create_dir = FALSE, verbose = FALSE))
  cat("Exact call: ", deparse(call), "\n")
  first <- tryCatch(eval(call), error = identity)
  state <- list(call = call, root = diagnostic_root, result = first,
    source = packages[packages$package %in% c("pipfun", "pipaux"), ],
    installed = inventory$receipts$pipfun, namespaces = paths,
    root_exists_after = dir.exists(diagnostic_root),
    cache_exists_after = dir.exists(file.path(diagnostic_root,
      "pip_ingestion_pipeline/pc_data/cache/clean_survey_data")),
    downstream = "NOT RUN: no pipaux install, survey, storage or numeric scenario")
  saveRDS(state, file.path(root, "diagnostic.rds"))
  if (inherits(first, "error")) {
    cat("FIRST DIAGNOSTIC ERROR class:", paste(class(first), collapse = ","),
        "\n", conditionMessage(first), "\n")
  } else cat("MISMATCH: suspected missing-cache error did not reproduce\n")
  cat("Root exists after:", state$root_exists_after,
      "cache exists after:", state$cache_exists_after, "\n", state$downstream, "\n")
}
