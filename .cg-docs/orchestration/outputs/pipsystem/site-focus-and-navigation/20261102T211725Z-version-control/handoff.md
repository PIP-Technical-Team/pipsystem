---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-version-control
status: completed
updated: 2026-11-02T21:19:55Z
owner: cg-version-control
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Review coordinator integrates this no-findings result; no version-control correction required.
---

# Version-control review: site focus and navigation

## Summary

No issues found. Findings: P0 0, P1 0, P2 0, P3 0; no safe_auto/manual/advisory corrections proposed. This is the version-control specialist pass within the requested data-risk review, not a full functional or statistical review.

The inspected changes contain intended source, small task-description reference data, browser fixture source, and task-local Markdown/JSON records. No credentials, connection secrets, raw household/private data, newly vendored dependencies, binary payloads, or generated render/browser outputs were found in the scoped patch and new implementation inputs.

## Changes

- Created and finalized this assigned report only. No commits, source edits, tests, browsers, package access, Git mutations, or shared-pointer changes.

## Checks run

- Read project constraints, Plan r2, execution report, orchestration handoff/restart record, Plan critique, coordination contract, and R technical skill including renv conventions.
- `git status --short`, `git rev-parse HEAD`, `git branch --show-current`: main at requested baseline `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`. Main is explicitly required by Plan line 23, so no feature-branch finding. No new commits exist relative to the baseline to assess for commit hygiene or branch lag.
- `git diff --no-ext-diff <baseline> -- <six tracked implementation paths>` and `git diff --numstat`: 390 insertions and 15 deletions, limited to tools/pipsys/pipsys.R, site/index.md, site/_quarto.yml, site/custom.scss, site/assets/aos-body.html, and tests/pipsys/test-pipsys.R. Inspected the entire scoped patch for exposure and unrelated change mixing.
- Read all five untracked implementation inputs: site/assets/table-tools.js, tables/site_task_context.csv, tests/pipsys/check-site-browser.py, tests/pipsys/site-table-browser.html, and tests/pipsys/site-render-browser.html. CSV lines 1-67 contain feature descriptions, intended results, package names, and evidence locations, not survey observations or private data. Browser HTML files contain synthetic task rows and local generated-site references, not captured DOM outputs.
- `git ls-files -s` and `git ls-files --others --exclude-standard -- <explicit scope>` distinguish six already-tracked modified sources from five new implementation inputs plus new Plan/report/handoff records. Untracked is expected before staging; no staging or commit requested. Do not use the unrelated dirty tree as the change set.
- `git check-ignore -v` confirms .tmp/pipsys/browser/probe.html, site/gen/_focus.md, site/_site/index.html, and site/.quarto/probe are ignored. `git ls-files -- .tmp site/gen site/_site` returned no tracked generated outputs. Ignore evidence: .gitignore lines 42-46. No recommendation to broadly ignore protected project records or the source CSV.
- `git diff --check -- <six tracked paths>`: no whitespace errors; Git emits LF-to-CRLF normalization warnings, not review findings. `git diff --cached --name-only`: empty index diff.
- Read-only final tracked-path inventory still separates the six task modifications from pre-existing active-state/current.json, pipaux handoff, HARVEST.md, docs/pipsys-tools.md, and wiki changes. Those unrelated bodies were not reviewed or modified.
- Task restart record is local to 20261102T204107Z-orchestrator/active-state.json, lines 7-13; Plan lines 77 and 125 explicitly retain shared-pointer separation. It records the named Plan and exact resume command.
- New R code reuses existing data.table/jsonlite and base facilities; Python launcher uses standard-library imports only (check-site-browser.py lines 3-9); JS is dependency-free. No dependency or lockfile change is introduced. No tracked renv/Python lockfile was returned by the targeted inventory; this bounded UI change is not grounds to add environment management.
- Sensitive-term search across this task's currently present Markdown handoffs found no credential/private-data candidates. Other reviewers' handoffs are concurrently written and are not treated as completed independent review evidence.
- UTC timestamp obtained with `(Get-Date).ToUniversalTime()`. An initial `Get-Date -AsUTC` attempt was unsupported in PowerShell 5.1 and was corrected; it made no writes.

## Gaps

- This is a snapshot of an actively edited shared checkout. Other review handoffs may still be empty or running and can change after inspection; their final contents are not certified here.
- No R/testthat, Python execution, browser launch, render, package tests, or pipeline checks ran, as expressly required by this review-only assignment. Functional correctness, numerical correctness, browser containment at runtime, and final verification remain the coordinator's separate evidence surfaces.
- No package repositories or .cg-docs/views bodies were read. No package SHA claim is made. Generated output bodies, unrelated dirty work, complete repository history, and files outside the named scope were not audited for exposure.
- No publication or Git operation is authorized by this result. Local file source links and existing CDN references are intentional site behavior, not evidence that private data have been published.
