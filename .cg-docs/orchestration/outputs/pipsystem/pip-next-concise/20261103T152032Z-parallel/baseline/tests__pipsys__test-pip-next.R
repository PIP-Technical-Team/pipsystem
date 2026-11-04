# Contract checks, not a claim that every LLM assessment is deterministic.
# Run tools\pipsys\pipsys.cmd install-kilo first: parity is post-install.
# Run from the checkout root with TEMP/TMP/TMPDIR on E: before starting R:
# Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pip-next.R')"

library(testthat)

next_source <- file.path(
  "..", "..", "tools", "pipsys", "kilo", "commands", "pip-next.md"
)

next_section <- function(heading) {
  if (!file.exists(next_source)) skip("Command not implemented yet")
  lines <- readLines(next_source, warn = FALSE, encoding = "UTF-8")
  start <- match(paste("##", heading), lines)
  if (is.na(start)) return("")
  ends <- which(grepl("^## ", lines) & seq_along(lines) > start)
  end <- if (length(ends)) min(ends) - 1L else length(lines)
  return(paste(lines[seq.int(start, end)], collapse = " "))
}

test_that("pip-next is a selectable project command with no model override", {
  expect_true(file.exists(next_source))
  if (!file.exists(next_source)) return(invisible(NULL))
  lines <- readLines(next_source, warn = FALSE, encoding = "UTF-8")
  expect_identical(lines[1], "---")
  end <- which(lines == "---")[2]
  frontmatter <- yaml::yaml.load(paste(lines[2:(end - 1)], collapse = "\n"))
  expect_identical(frontmatter$agent, "pip-orchestrator")
  expect_match(frontmatter$description, "/pip-next [package]", fixed = TRUE)
  expect_false(any(c("model", "subtask") %in% names(frontmatter)))
})

test_that("argument validation precedes shell use and uses the package registry", {
  text <- next_section("1. Resolve scope before running commands")
  expect_match(text, "^[A-Za-z0-9_-]+$", fixed = TRUE)
  expect_match(text, "tools/pipsys/packages.csv", fixed = TRUE)
  expect_match(text, "pip-next: invalid argument", fixed = TRUE)
  expect_match(text, "pip-next: unknown package", fixed = TRUE)
  expect_match(text, "before any shell call or report write", fixed = TRUE)
  expect_match(text, "ROOT is the current session's pipsystem checkout", fixed = TRUE)
})

test_that("evidence collection handles refs, worktrees and circular assessments", {
  text <- next_section("2. Collect current evidence")
  required <- c(
    "overview", "status PACKAGE", "handoffs", "git rev-parse HEAD",
    "git worktree list --porcelain", "git merge-base --is-ancestor",
    "Do not fetch", "remote-tracking refs may be stale",
    "not proof of any task state, blocker, readiness, approval or recommendation",
    "underlying original sources", "UNKNOWN", "full SHAs"
  )
  for (item in required) expect_match(text, item, fixed = TRUE)
})

test_that("assessment separates blockers from safe parallel opportunities", {
  text <- next_section("3. Decide what can move now")
  required <- c(
    "Ready", "In progress", "Blocked", "Unknown", "upstream deliverable",
    "unblock condition", "owner", "write sets", "shared contracts",
    "Conditional", "No confirmed parallel work", "dirty checkout",
    "Readiness is not execution approval"
  )
  for (item in required) expect_match(text, item, fixed = TRUE)
})

test_that("output leads with an action and retains source reports unchanged", {
  text <- next_section("4. Return an actionable assessment")
  required <- c(
    "Recommendation", "Task states and blockers", "Parallel work",
    "Evidence and gaps", "Source output", "verbatim", "copy-ready",
    "ET", "not read", "estimate", "waiting"
  )
  for (item in required) expect_match(text, item, fixed = TRUE)
})

test_that("assessment writes stay bounded and do not become package progress", {
  text <- next_section("5. Save the assessment")
  required <- c(
    "pip-next-global", "pip-next-PACKAGE", "pip-handoff-v2",
    "assessment completion only", "unique UTC run", "assessment sources",
    "No package work was executed", "CONTRACT.md"
  )
  for (item in required) expect_match(text, item, fixed = TRUE)
  limits <- next_section("Limits and working principles")
  for (item in c(
    "E:", ".tmp/pipsys", "Do not run the PIP pipeline", "Do not start sessions",
    "Do not edit package files", "Minimal first", "almost-irreversible",
    "installed tools", "two pages", "functional check"
  )) expect_match(limits, item, fixed = TRUE)
})

test_that("installed command is byte-for-byte equal to its source", {
  if (!file.exists(next_source)) skip("Command not implemented yet")
  installed <- file.path("..", "..", ".kilo", "commands", "pip-next.md")
  expect_true(file.exists(installed))
  if (!file.exists(installed)) return(invisible(NULL))
  expect_identical(
    readBin(installed, "raw", n = file.info(installed)$size),
    readBin(next_source, "raw", n = file.info(next_source)$size)
  )
})

test_that("frozen scenarios contain inspectable evidence and behavioral oracles", {
  cases <- jsonlite::fromJSON(
    file.path("fixtures", "pip-next-cases.json"), simplifyVector = FALSE
  )
  ids <- vapply(cases$cases, `[[`, character(1), "id")
  expect_false(anyDuplicated(ids) > 0L)
  expect_setequal(ids, c(
    "global-ready", "scoped-wait-parallel", "scoped-all-blocked",
    "shared-file-conflict", "stale-status", "missing-worktree",
    "assessment-feedback", "missing-repo-owner", "unknown-write-sets",
    "invalid-input", "unknown-package", "literal-output-error",
    "invalid-single-token", "invalid-two-packages", "trimmed-package"
  ))
  for (case in cases$cases) {
    expect_type(case$arguments, "character")
    expect_gt(length(case$required), 0L)
    expect_gt(length(case$forbidden), 0L)
    expect_gt(length(case$evidence), 0L)
  }
})
