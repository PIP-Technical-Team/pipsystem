read_pip_main <- function(checkout) {
  config <- file.path(checkout, ".pip-local-root")
  if (!file.exists(config)) {
    stop("Shared steps require .pip-local-root at the checkout root.", call. = FALSE)
  }
  path <- trimws(readLines(config, warn = FALSE))
  path <- sub("/+$", "", chartr("\\", "/", path))
  if (length(path) != 1L || !grepl("^//[^/]+/[^/]+(/[^/]+)*$", path)) {
    stop(".pip-local-root must contain one absolute UNC path.", call. = FALSE)
  }
  return(path)
}
