# Source-only checks. Complete files and installed parity run after installation.
setwd("tests/pipsys")
expressions <- parse("test-pip-next.R")
for (i in seq_len(4)) eval(expressions[[i]])
for (expression in expressions) {
  if (!is.call(expression) ||
      !identical(expression[[1]], as.name("test_that"))) next
  if (expression[[2]] %in% c(
    "chat is a concise decision brief with material caveats",
    "priority follows prerequisite evidence rather than downstream readiness",
    "saved assessment retains full evidence and prompts",
    "coordination exception applies only to pip-next"
  )) eval(expression)
}
sample <- "../../.cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel/sampled-output-final-headings.md"
if (file.exists(sample)) {
  ps <- new.env()
  sys.source("../../tools/pipsys/pipsys.R", envir = ps)
  lines <- readLines(sample, warn = FALSE)
  for (heading in c("Recommendation", "Task states and blockers", "Parallel work",
                    "Evidence and gaps", "Source output")) {
    body <- ps$markdown_section(lines, heading)
    stopifnot(length(body) > 0L, any(nzchar(trimws(body))))
  }
  cat("Existing saved-advice parser reads all five final sampled report sections\n")
}
