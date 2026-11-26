# Independent Review Brief

## Scope
Read-only independent full review of pipdata's public working-release context fix.
Existing repository E:/PovcalNet/01.personal/wb384996/PIP/pipdata, branch PROD,
baseline HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40, clean at initial inspection.
Only source change R/dependency_contract.R:266 onwards and new regression
tests/testthat/test-public-working-release-context.R. Inspect actual diff/files.
No implementation delegated. Write ONLY your assigned report under this run.

## Requirements And Evidence
- User requests public pipfun setup-to-processing integration, no hidden options,
  fabricated state, worker substitution, public bypass or weaker assertions.
- Exact pinned public contract: sibling pipsystem/.tmp/one-survey/n11/sources/
  pipfun/R/working_release.R:54-169,286-329. Setup stores descriptor in .pipenv;
  exported getter assigns descriptor to caller frame (not a conventional return).
- Old pipdata reads absent pipfun.working_release/pipfun.identity options.
  Fix uses getter only for NULL release/identity; explicit args preserved.
  No catch/fallback, no bootstrap behavior change or new exported API.
- Regression public setup and pd_process_data(bootstrap=TRUE), valid completed
  inventory, real stamp/reader/planner, only external release/PPP transport mocks.
  Passive exit trace observes actual context; no worker replaced. It intentionally
  supplies no auxiliary data and requires the specific missing-auxiliary error,
  not arbitrary error or survey success. Internal state is restored after test,
  never seeded to simulate public setup. No release options are set by new test.
- Runtime E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/c11.
  logs/red-confirmed.log: five passing preconditions, one test error with exact
  pipdata_dependency_context_error before source edit. logs/green.log: same frozen
  regression, ten assertions pass. logs/affected.log:110 blocks/549 assertions,
  zero failed/error/skipped, including unchanged seven bootstrap cases/19 asserts.
  Expanded affected suite may be running; consult report/log if available.
- Installed baseline copied from recorded n11; test tools copied from earlier
  bootstrap-fix/v/library with recorded provenance. Candidate constructed from
  exact c5b27fa Git archive plus only two owned files, not dirty-tree install.
  sources/candidate and logs/candidate-source-sha256.tsv preserve payload.
- Child environment, temp/home/profiles/library/cache/log/root redirected before
  R children by c11/run.ps1; private R startup audits own library/staging only.
  No exhaustive OS write audit. One help CSS-copy install warning retained.
- Existing charter compound-gpid.md; compound-gpid.local.md absent. R package,
  data.table. .Rbuildignore excludes .cg-docs. No generated HTML bodies needed.
- Original survey Plan/work reports and pins remain read-only. No survey rerun,
  other-package edits, downloads, Git mutations, environment switches or new
  worktrees/sessions. Internal review subagents are authorized, not new sessions.
- get_errors and execution_subagent unavailable: do not fabricate diagnostics or
  run unsafe Pester. Missing required dependency/check is a blocker.

## Reviewer Instructions
Load pl-clear-technical-communication and cg-skill-r-technical; testing reviewers
also load cg-skill-r-testing, and appropriate other R skills if needed. Use reads,
grep/glob, read-only Git only. Do not run R/shell scripts or tests. All direct and
indirect writes MUST stay on E: and ONLY in your assigned report. Do not write
code, cache, temporary files or logs on C:. Use apply_patch to create/checkpoint
your report. Report file format pip-handoff-v2: schema, project pipdata, task
practical-integration-tests, run 20261111T190007Z-context-fix, status,
updated UTC if known or UNKNOWN, owner your role, repo above, branch PROD, head
full SHA above, plan NONE, next; Summary, Changes, Checks run, nonempty Gaps.
Findings P0-P3 with concrete file/line, impact, remedy and [safe_auto]/[manual]/
[advisory]. If none explicitly say no issues found for named changed files.
Identify missing checks honestly; source review is not independent execution.
Do not recommend deleting/replacing/renaming/moving protected artifacts:
.cg-docs/brainstorms/, .cg-docs/solutions/, .cg-docs/archive/, compound-gpid.md,
compound-gpid.local.md, roadmap.json, SCHEMA_VERSION, .github/.

Minimal first: smallest complete fix; safeguards only for almost-irreversible
failures; one functional check per change; installed tools/dependencies only
when worthwhile; Plans about two pages. Avoid unrelated suggestions. Human
times use local ET with system clock; machine evidence timestamps remain UTC.
Final task response must name your saved report, findings and checks/limits.
