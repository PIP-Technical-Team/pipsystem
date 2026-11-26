# Scoped Review Brief

Review Plan revision 2 `.cg-docs/plans/2026-11-16-qmd-working-release-initialization.md`.
Existing main, root E:/PovcalNet/01.personal/wb384996/PIP/pipsystem. No Git mutations,
new sessions/worktrees, package edits/installs, shared writes or full Qmd render.
All writes and indirect temp/cache/log outputs MUST be E: inside this checkout.
Read-only review only, except your assigned handoff report. Do not run R/network.
Load existing R shared, technical, data.table, collapse and testing skills before
reviewing R. Minimal first: smallest complete slice, irreversible-harm safeguards
only (other ideas Later), one functional check/change, installed tools only.

## Scope
Compare current `experiments/pip-pipeline.qmd` and
`experiments/one-survey/check-qmd.R` to task snapshots under
`.tmp/qmd-working-release/20261116T215847Z-code/baseline/`, NOT to absent HEAD
versions (both were pre-existing untracked files). Review task-local harness
`run.ps1`, `live.R`, `check-source.R` under that same task root and actual logs.
Do not reopen earlier broad Qmd/style reviews, B6, unrelated files or prior work.
Fixed release 20260401 / TEST / PPP 2021; selected real survey unchanged.

## Evidence And Known Issues
- Offline missing-cell red confirmed. Initial green source log at task logs/source.log.
- Actual private receipt checks and all seven namespace origins PASS in live logs.
- Real metadata/public initializer executed unpatched, no fixture transport or
  fake release rows. First and existing store exact cell PASS in logs/first-4.log
  and logs/existing-4.log, separate fresh R PIDs and same store-4 directories.
- Earlier failures retained: whole-list identifier assertion rejected numeric
  metadata release date; corrected to exact character identifier comparison with
  strict PPP/identity and full active/returned-state equality. st_alias_get returns
  a config list, so check its documented root. Harness stamp temp/log paths were
  corrected to `.stamp/temp` and `.stamp/logs`. No package changes.
- Current source-4.log FAIL at unchanged original `identical(config, original)`:
  concurrent user-owned kilo.json description now adds Suggested Session Name.
  No rule or original instruction assertion was changed to evade this failure.
  Completion is blocked pending scope decision or owner repair. Other source and
  assertion-preservation checks need rerun once this independent blocker clears.
- Existing credentials read only via gh auth token, captured solely in process
  memory and passed through GH_PASS/gitcreds cache; no credential values retained.
  pipfun still emits fallback diagnostic, but actual metadata lookups succeeded.
- A duplicate task-local launcher block was reconciled with explicit user approval.
- get_errors tool is unavailable; do not claim editor diagnostics were run.

## Reporting
Return supported P0/P1/P2/P3 findings with file:line evidence and concrete impact;
tag [safe_auto], [manual] or [advisory]. Do not treat known legacy failure as
passed, and do not invent out-of-scope cleanup. Report explicit no issues found
if appropriate, with residual limits. Never suppress P0/P1 or cross-file breakage.
Never recommend deleting, replacing, renaming or moving `.cg-docs/brainstorms/`,
`.cg-docs/solutions/`, `.cg-docs/archive/`, `compound-gpid.md`,
`compound-gpid.local.md`, `roadmap.json`, `SCHEMA_VERSION` or `.github/`.
Save pip-handoff-v2 at the exact path in your dispatch, create at start and
finalize before stopping, nonempty Summary/Changes/Checks run/Gaps. No raw
conversations, credentials or household data. Record full SHA of any package
repository read; prefer pinned archive sources with recorded receipt SHAs.
