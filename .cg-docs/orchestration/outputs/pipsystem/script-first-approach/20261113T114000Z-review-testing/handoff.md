---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-testing
status: completed
updated: UNKNOWN
owner: testing-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md rev1
next: Implementation owner addresses T1 in the existing correction/review workflow.
---

# Full-route testing review

## Summary
Full-route static TESTING review of Plan rev1 completed with one P2 finding
(T1, safe_auto). No P0/P1 findings established. Source inspection preserves the
distinction between document execution and original survey acceptance.

Observed saved evidence has four PASS rows, actual processing FAIL
"A single working release and identity are required.", and two downstream
NOT RUN rows (`.tmp/one-survey/n11/qmd-20261113T114000Z/results.tsv:2-8`).
The HTML reports the same actual failure at line 2607 and original survey
acceptance NOT PASSED at line 2757. This is not original survey acceptance.

## Findings

**[P2] T1 — safe_auto** `experiments/one-survey/check-qmd.R:23-24` --
The dependency-skip test evaluates the failed stage, not a dependent stage.

**Issue**: The check invokes `record_failure()` for Release setup at line 17,
then evaluates `release-setup` itself at line 23. It never evaluates
`auxiliary-inputs` or the other dependent chunks before asserting their initial
NOT RUN values. Removing the next chunk's `if (pipeline_ok)` guard at
`experiments/pip-pipeline.qmd:160` would therefore leave this check green. The
claimed dependency-control test at check-qmd.R:25 and the saved green log at
`.tmp/one-survey/n11/logs/qmd-check.log:2` exceed what this check exercises.
The real render demonstrates the present processing-failure path, but does not
close this release-failure regression gap.

**Fix**: Evaluate the actual next dependent `auxiliary-inputs` chunk in the
existing isolated state after the synthetic release failure, before asserting
rows 3:7 remain NOT RUN. Keep the existing actual-recorder/message assertions.
This is a correction to the existing functional check, not a new framework or
dependency. One focused check should demonstrate that the actual dependent chunk
does not run after the injected failure; do not rerun the pipeline for this fix.

## Coverage assessment

- Qmd reporting uses an actual error handler, sets pipeline_ok FALSE, and keeps
  dependent stage guards (`pip-pipeline.qmd:49-54,159-176,229-253,262-317`).
  The saved render independently shows the processing-error/NOT RUN path.
- Numerical checks compare paired rows, not separately sorted columns; expected
  welfare 1,2,3,4 and weights 10,20,30,40, total weight 100, metadata survey/CPI
  1.4/PPP 1.6 remain explicit (`pip-pipeline.qmd:271-287`).
- Clean and metadata reads use versions returned from the saved selected row,
  not latest (`pip-pipeline.qmd:238-246,265-270`). These checks remain NOT RUN in
  the current evidence, not certified passes.
- Invalid control requires successful validation completion, valid/invalid
  classifications, zero failed jobs and the actual missing-weight diagnostic
  (`pip-pipeline.qmd:194-210`). No-output acceptance is guarded after real
  processing and checks both aliases (`pip-pipeline.qmd:297-315`). A thrown
  processing error is not treated as rejection; saved row 8 is NOT RUN.
- Fixtures are deterministic and explicitly synthetic. Transport substitutions
  are visible at `qmd-fixtures.R:59-87`; actual processing/validation are not
  replaced there. The missing-weight download really drops weight at lines
  79-82. Direct package-boundary verification against source was not performed.
- Existing base-R fixture checks cover catalog filenames, auxiliary names and
  CPI/PPP values (`check-qmd.R:30-38`). No stochastic estimation, simulation,
  API endpoint or optimization model is introduced in the reviewed scope.
- Launcher qmd-render uses a fresh output directory and existing private runtime,
  redirects Quarto outputs and checks rendering exit status (`run.ps1:67-96`).
  qmd-check routes to the focused base-R checker (`run.ps1:127-136`).
- setup.R source-mode fallback is visible at line 7. Seven full source pins
  remain explicit at lines 9-22. No installation is called by its default
  library mode; installation remains in the mode == setup block at line 115.
- Matching style/failure/instruction-reload rules were inspected in
  `AGENTS.md:126-139`, `ORCHESTRATOR.md:113-126`, and
  `.cg-docs/orchestration/CONTRACT.md:17-30`. The fourth surface is kilo.json:7;
  its line exceeds reader truncation. Saved checks report JSON parse, matching
  normalized prompt suffix and unchanged non-prompt configuration. This review
  does not independently execute those checks.

## Changes
Only this requested handoff was created and finalized. No source, package,
instruction, Plan, protected record, generated view body or prior evidence was
changed. No commits or Git commands. Pre-existing dirty scenario/reproduce/setup
content was not modified.

## Checks run
Static reads only: Plan rev1, compound-gpid.md, SYSTEM_DESIGN.md, HARVEST_BRIEF.md,
all named changed source surfaces, current scenario assertion window as secondary
evidence, work report, current TSV, saved qmd-check log, and targeted HTML/log
evidence. Loaded technical communication and R shared/technical/data.table/
collapse/testing/analytical skills.

Observed saved qmd-check log: actual recorder message and three PASS messages
(`.tmp/one-survey/n11/logs/qmd-check.log:1-4`). Observed saved render log:
output created (`qmd-20261113T114000Z/quarto.log:65`). Work report records red
missing-document baseline and green check at lines 41-47; that chronology is
reported evidence, not rerun here.

Tests, shell commands, R execution, JSON parse, Git status/diff/show, installs
and renders NOT RUN by explicit user instruction. No testthat installation
attempted. No package repository read, so no new package HEAD provenance is
claimed. Root/main are user-supplied; current HEAD UNKNOWN. The implementation
work report records starting SHA e9c71e3190f1ce88a017ae25af7c373a64c655a2 at
`.cg-docs/work-reports/2026-11-13-script-first-pipeline-qmd.md:10`.

## Gaps
- Immutable oracle is the user-specified
  `e9c71e3190f1ce88a017ae25af7c373a64c655a2:experiments/one-survey/scenario.R:123-179`.
  Direct git-show comparison was NOT RUN because commands are forbidden. The
  mixed-owned current scenario.R:207-292 was read only as secondary context,
  never substituted for that oracle. Work-report lines 30 and 64-66 claim the
  prior immutable comparison; this review does not independently certify it.
- Numerical/exact-version/no-output acceptance remains unexecuted in the saved
  run because processing fails. B6 and subsequent stages remain outside this
  Plan; no inferred original acceptance or recommendation to weaken assertions.
- T1 is not fixed in this read-only review. Implementation correction and final
  verification remain with the owning workflow; no broader testing apparatus,
  safeguard or dependency is recommended.
- Dirty-path preservation, exact one-line setup diff and non-prompt JSON-only
  change cannot be independently diff-verified without Git execution. No writes
  were made to those files. Instruction reload remains pending per work-report
  line 80; this review does not activate changed instructions.
- updated timestamp is UNKNOWN because no system-clock command is authorized;
  the run identifier is the exact user-assigned report identity, not a claimed
  observation of the current time.
