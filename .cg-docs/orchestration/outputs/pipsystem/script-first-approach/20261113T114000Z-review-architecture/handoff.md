---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-architecture
status: completed
updated: UNKNOWN
owner: architecture-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md rev1
next: Plan implementation owner integrates F1, verifies the correction under implementation authority, and retains the package blocker.
---

# Script-first full-route architecture review

## Summary
Completed static full-route architecture review of Plan rev1 and the named owned surfaces. One P2 finding (safe_auto); no P0/P1 or additional architectural findings identified. No fixes applied.

The entry remains readable development evidence, not another engine: public calls are visible, pd_process_data composes cleaning/metadata/storage, and the narrative retains pipdata orchestration and stamp rebuild authority (experiments/pip-pipeline.qmd:16-26,159-175,185-218,222-252; SYSTEM_DESIGN.md:186,290,299-307). The fixture helper isolates synthetic tables and transport substitutions rather than replacing validation or processing (qmd-fixtures.R:1-90). A 338-line narrative is not a reason to fragment its visible public calls into a dispatcher.

Observed saved results are 4 PASS / 1 FAIL / 2 NOT RUN. The failure is exactly "A single working release and identity are required." (.tmp/one-survey/n11/qmd-20261113T114000Z/results.tsv:2-8). This is not original survey acceptance. B6 and later stages remain explicitly outside this example (experiments/pip-pipeline.qmd:23-26,321-337).

## Findings

### F1 — P2 — safe_auto — Reporting check does not exercise dependent chunks

**File/evidence:** experiments/one-survey/check-qmd.R:16-25, especially 23-24; experiments/pip-pipeline.qmd:159-175,185-218,229-253,262-294,302-316.

**Issue:** After initializing all statuses as NOT RUN and injecting a Release setup failure, the checker evaluates release-setup again, not any downstream chunk. It then asserts that rows 3:7 retain their initialization values and announces that dependencies remain NOT RUN. None of the dependent chunk guards has been exercised. Removing a downstream guard would not be detected by this check.

**Impact:** The focused check overstates coverage of the document's failure-propagation boundary. The current saved render honestly exercises the real cleaning failure path, but that evidence does not make this synthetic checker sensitive to regressions in the other dependent chunks. This is a development-evidence gap, not evidence of incorrect published numbers.

**Minimal fix:** In the existing focused checker, evaluate the actual downstream chunk texts after injecting failure, then assert that their rows remain NOT RUN and no downstream work occurred. Keep this local and base-R; do not add a runner, new dependency or package substitutes to the Qmd. One functional check for the change: the focused check should pass with guards present and fail if a dependent guard is temporarily removed. Do not change old mixed-owned helpers or weaken numerical/version/invalid assertions. Classification safe_auto means a bounded fix is suitable within the owning implementation workflow, not permission to edit during this read-only review.

## Changes
Only this requested report created and finalized, on E: in the specified checkout. No source, package, instruction, original Plan, old helper, generated-view, Git, install or client-setting changes. No commits made.

## Checks run
- Loaded pl-clear-technical-communication and the required R shared, technical, data.table, collapse and testing skills before R review.
- Read compound-gpid.md, SYSTEM_DESIGN.md, HARVEST_BRIEF.md, Plan rev1 and the coordination contract.
- Statically traced Qmd reporting initialization, package verification, fixture setup, working release, auxiliary writes, acquisition/classification, processing, pinned readback, invalid/no-output and same-run summary. No independent rerun authority or new metadata API found.
- Compared visible assertions to current scenario.R:207-292 for paired values, exact saved pins, metadata and invalid classification/no-output. These expectations are present in Qmd:194-210,238-245,265-286,305-307. This is not certification against the immutable Git oracle.
- Read qmd-fixtures.R and check-qmd.R in full; traced qmd launcher additions through run.ps1:67-97,130 and setup.R:7. Read existing paths.ps1 only to understand the reused boundary; no recommendation to alter it.
- Reviewed the matching visible rule blocks in AGENTS.md:126-139, ORCHESTRATOR.md:113-126 and CONTRACT.md:17-30. kilo.json:7 was inspected, but the read/search tool truncates its long prompt line; full prompt-tail equality and JSON validity are not independently certified.
- Read current results.tsv:1-8. Read the implementation work report as attributed evidence only; did not treat its reported executions as fresh reviewer runs.
- Commands, tests, R, Quarto, Git, JSON parsing and mutation checks: NOT RUN, explicitly prohibited for this review. No generated HTML or generated-view bodies/diffs read.

## Gaps
- HEAD and actual report-update timestamp remain UNKNOWN because shell/Git commands are prohibited. Branch main is user-supplied, not independently verified. The work report:10 reports prior root/main HEAD e9c71e3190f1ce88a017ae25af7c373a64c655a2; it is not a fresh HEAD observation.
- No package repository was read; package provenance is inherited from setup.R:9-22 and was not independently revalidated. Those seven recorded source pins were inspected, not changed.
- Immutable ORACLE at e9c71e3190f1ce88a017ae25af7c373a64c655a2 was not retrieved because Git commands are prohibited. Current mixed-owned scenario.R was contextual evidence only.
- No execution or source mutation was performed to reproduce F1. Its evidence is the static control flow; the proposed focused check remains unexecuted here.
- Full kilo.json prompt-tail equality/validity, rendered HTML correspondence, source-copy hash and uncommitted-diff ownership remain unverified by this reviewer. Generated evidence and prior worker claims do not substitute for these checks.
- Exact readback and invalid/no-output remain NOT RUN in current results; the context failure is retained, not repaired or waived. Original survey Plan acceptance, B6, full-route production execution and later stages are not certified.
- Instruction reload remains pending according to .cg-docs/work-reports/2026-11-13-script-first-pipeline-qmd.md:77-80. This review does not establish that a reload occurred.
