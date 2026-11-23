---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T223219Z-qmd-acceptance/architecture
status: completed
updated: 2026-11-13T22:53:36Z
owner: cg-architecture
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinator consumes this report in continuation V5 consolidation and final verification.
---

# Narrow Qmd acceptance architecture review

## Summary
No issues found: zero supported P0, P1, P2 or P3 architecture findings in
the narrow continuation. No finding classification tag is applicable.
This is a static review of the approved pin continuation and retained
first-save execution evidence, not a rerun of the completed broad reviews.
Scope and checkout provenance come from review-brief.md:3-35 and the parent
handoff.md:9-12; no independent Git command was executed.

### Architecture conclusions and evidence

- Public processing path retained, without an internal-worker bypass:
  `experiments/pip-pipeline.qmd:119-128,167-189,208-225` calls
  `pipfun::setup_working_release()`, `pipdata::dlw_gmd_list()`,
  `pipdata::pipdata_dlw_process()` and `pipdata::pd_process_data()`.
  The real returned inventory feeds the real clean/metadata/storage call;
  there is no synthetic master seed or replacement processing worker.
- No hidden release-context bypass in the inspected acceptance code:
  `experiments/pip-pipeline.qmd:97-103` sets runtime roots/verbosity and
  the manifest path, not `pipfun.working_release` or `pipfun.identity`.
  Release identity is established by the public setup call at lines 119-128.
  `experiments/one-survey/qmd-fixtures.R:48-94` enumerates all replacement
  bindings: release/PPP-vintage GitHub transport and DLW catalog/download
  transport only. It does not replace validation, cleaning, metadata,
  release-context resolution or processing workers. The download substitute
  writes the synthetic input through `pipload::pip_write()` at lines 86-89;
  the invalid input really loses `weight` at lines 82-84.
- No new runtime orchestrator: this remains a linear acceptance narrative
  with fail/NOT RUN reporting (`experiments/pip-pipeline.qmd:16-18,24-42`),
  not a planner, scheduler, rebuild authority or independent processing
  implementation. Package responsibilities remain consistent with
  `SYSTEM_DESIGN.md:186-192,290-307`. The launcher only prepares an isolated
  render and invokes Quarto (`experiments/one-survey/run.ps1:67-96`).
- Exact pin update is visible at `experiments/one-survey/setup.R:16-22`;
  runtime `pins.tsv:2-8` records the matching seven archives, including
  pipdata `53a76e379c81a3ac70b39925954981ae6a691459`. Verification compares
  the complete package table, receipts and actual namespace paths
  (`setup.R:203-241`), rather than trusting a stale inventory's existence.
- Acceptance remains downstream of successful public processing:
  `experiments/pip-pipeline.qmd:214-244` extracts returned data/metadata
  version IDs and reads those exact versions; lines 245-260 assert paired
  daily welfare and weights, survey ID, CPI, PPP and weight total.
  Lines 173-189 require completed valid/invalid classification and the
  specific missing-weight diagnostic. Lines 275-289 test no invalid clean
  or metadata artifact only after the earlier work passes.
- Evidence does not promote first-save success into B6/history or whole-Plan
  completion: `experiments/pip-pipeline.qmd:18,294-309` explicitly excludes
  those claims; `.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:214-228`
  retains V5 pending and historical B6 failed/open. The approved Qmd deviation
  is recorded at work-report lines 162-176; the original Plan remains
  active (`.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md:4,13-15`).

## Changes
Only this exact report created and finalized, on E:. No source changes,
package edits, other report edits, commands, installs, downloads, pipeline
runs, Agent Manager operations or Git mutations. No protected/Decided
changes or additional safeguards proposed. Minimal-first scope preserved.

## Checks run
Performed by this reviewer: static reads of the review brief, contract,
project objective/design/harvest rules, original Plan, continuation handoff
and appended work-report, canonical Qmd, setup.R, qmd-fixtures.R,
check-qmd.R, run.ps1 and paths.ps1. Loaded shared, technical, data.table,
collapse, testing and analytical R skills plus technical communication.

Read retained execution evidence (not executed by this reviewer):

- `.tmp/one-survey/qmd-acceptance-20261113/pins.tsv:2-8` matches the source
  seven-pin configuration.
- Runtime `logs/check.log:1-3,10-11,28-29,44-45,92-96` records private
  library paths, exact-path usability/control success and V1 PASS.
- Runtime `logs/qmd-check.log:1-4` records all three focused check groups
  passing; line 1 is the deliberate synthetic failure-control output.
- Runtime `qmd-20261113-acceptance/results.tsv:2-8` records seven PASS rows,
  including clean pin `ab5f8ecf4163c542`, metadata pin `68b3b5b50c5dc90b`,
  exact readback/paired values and invalid/no-output assertions.
- Read the render directory listing: actual `pip-pipeline.html`, copied
  Qmd, Quarto log and results table are present. No derived
  `.cg-docs/views/**` body read.

Required independent runtime checks were NOT RUN by this reviewer, as
explicitly prohibited by review-brief.md:39-42. Prior execution is reported
as retained evidence, not new reviewer execution.

## Gaps
- Historical B6 later-refresh remains failed/open and outside scope; exact
  first-save readback does not establish historical pin selection after a
  subsequent save (original Plan:63-64; review-brief.md:34-35).
- No package source repository was read. The archived SHAs are recorded in
  runtime pins.tsv and parent handoff.md:54-62; this review does not certify
  the internal package fix or redo its completed owner reviews.
- Static source inspection supports no hidden context or internal-worker
  bypass in the acceptance path. Identity/authorization of the earlier
  executing session is not independently established by these source files;
  no session launch, execution or worker bypass occurred in this review.
- No exhaustive OS write audit, independent source-hash recomputation,
  rerender, live DLW, production, auxiliary-producer, deflation, means or
  incremental-rebuild certification. Retained evidence and static inspection
  are the bounded basis for this conclusion.
- Overall V5 consolidation and light final verification remain the parent
  coordinator's work; this architecture report alone does not complete the
  original Plan. No broader review or B6 repair is recommended here.
