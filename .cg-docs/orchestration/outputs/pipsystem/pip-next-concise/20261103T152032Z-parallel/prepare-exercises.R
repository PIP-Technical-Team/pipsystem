# Deliberately exclude required/forbidden oracle fields and explanatory answers.
run <- ".cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel"
fixture <- jsonlite::fromJSON("tests/pipsys/fixtures/pip-next-cases.json", simplifyVector = FALSE)
command <- readLines("tools/pipsys/kilo/commands/pip-next.md", warn = FALSE)
args <- commandArgs(trailingOnly = TRUE)
prefix <- if (length(args)) paste0("supplied-input-", args[1], "-") else "supplied-input-"
if (length(args) > 1L) {
  fixture$cases <- Filter(function(case) case$id %in% args[-1L], fixture$cases)
}
groups <- split(seq_along(fixture$cases), ceiling(seq_along(fixture$cases) / 5))
for (i in seq_along(groups)) {
  cases <- lapply(fixture$cases[groups[[i]]], function(case) {
    case[c("id", "arguments", "evidence")]
  })
  input <- c(
    "# Frozen assessment supplied input",
    "## Simulation instructions", fixture$protocol,
    "Simulated ROOT is E:/fixture/pipsystem. Simulate tool/report operations only; no actual package, shell or assessment writes. A report write is simulated successful unless case evidence says otherwise. Missing source/tool responses remain UNKNOWN. Return one CHAT and one SIMULATED SAVED ASSESSMENT per valid case; invalid input has rejection only. Never inspect any oracle or other file.",
    "## Exact revised command", "```markdown", command, "```",
    "## Common evidence", "```json",
    jsonlite::toJSON(fixture$common_evidence, auto_unbox = TRUE, pretty = TRUE),
    "```", "## Case evidence", "```json",
    jsonlite::toJSON(cases, auto_unbox = TRUE, pretty = TRUE), "```"
  )
  writeLines(input, file.path(run, paste0(prefix, i, ".md")))
}
cat(length(fixture$cases), "cases projected into", length(groups), "oracle-free inputs\n")
