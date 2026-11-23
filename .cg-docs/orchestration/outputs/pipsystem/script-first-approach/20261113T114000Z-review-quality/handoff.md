---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-quality
status: completed
updated: UNKNOWN
owner: code-quality-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md revision 1
next: Implementation owner triages Q1, performs the targeted check and final verification; source changes are outside this read-only review.
---

# Script-first Qmd code-quality review

## Summary
Completed the scoped read-only code-quality review of Plan revision 1. One P2
test-coverage finding (safe_auto); no P0 or P1 findings identified. No additional
actionable P3 findings identified. Review completion is not Plan completion or
original survey acceptance.

Supplied runtime evidence confirms four PASS, processing FAIL with actual message
"A single working release and identity are required.", and two NOT RUN
(`.tmp/one-survey/n11/qmd-20261113T114000Z/results.tsv:2-8`). The rendered HTML
explicitly says original survey acceptance is NOT PASSED (line 2757). This is the
expected truthful blocked path, not a newly attributed package-code finding.

## Findings

### Q1
**[P2]** `experiments/one-survey/check-qmd.R:23-25` -- Dependency-skip check never evaluates the downstream chunks. **Tag:** safe_auto.

**Issue / evidence:** Line 17 invokes the real error recorder and correctly checks
its FAIL/message/global state at lines 18-22. However, line 23 then evaluates only
`release-setup`, while line 24 asserts that rows 3:7 are still NOT RUN. Those rows
were initialized NOT RUN by `experiments/pip-pipeline.qmd:38-46` and none of their
chunks is evaluated by this test. Removing a downstream `if (pipeline_ok)` guard
would therefore not make this check fail. The PASS message at line 25 overstates
the dependency behavior actually exercised. This matters particularly because the
same-run render reaches only the processing blocker, leaving the final two bodies
unexecuted (`results.tsv:6-8`).

**Smallest fix:** In the existing isolated `state`, after recording the synthetic
failure, evaluate the existing downstream chunk bodies (`auxiliary-inputs`,
`acquisition-validation`, `cleaning-metadata-storage`, `exact-readback`, and
`invalid-no-output`) before the existing NOT RUN assertion. Keep the real chunk
code and error recorder; do not duplicate a dispatcher or add a test framework.
No package execution occurs while their guards work. The current state has no
fixture/processing inputs, so an unguarded chunk cannot quietly earn success.

**One functional check:** Run the existing focused check in the authorized private
runtime after correction; it should preserve the synthetic FAIL/message and all
downstream NOT RUN rows after evaluating the actual chunk bodies. This was not
executed by this reviewer, in accordance with the user's prohibition.

## Changes
Only this required report created and finalized, at the exact requested E:
checkout path. No source edits, installs, package edits, commands, Git mutations,
or changes to protected project records. Existing mixed-owned scenario/reproduce
and earlier setup contents are not attributed to this implementation or reviewed
for unrelated findings.

## Checks run
All checks below are static reads, not newly executed tests.

- Read Plan revision 1, project charter/configuration, design and harvest brief.
  Confirmed data.table-collapse dialect (`compound-gpid.local.md:3`).
- Loaded existing R shared, technical, data.table, collapse, testing and analytical
  skills and read the R router and testing-integrity reference before R review.
- Inspected the complete new Qmd, fixture support and focused checker. Public
  calls are visible; numerical paired-row, exact saved-version and invalid
  classification/diagnostic/no-output assertions remain explicit
  (`pip-pipeline.qmd:194-210,238-245,265-286,305-307`). Did not infer a runtime pass
  from those unexecuted assertions.
- Inspected launcher Qmd mode additions and rendering/isolation block
  (`run.ps1:1-6,67-97,130`) with inherited environment and path helper as context.
  Fresh render/store, existing private R, E: child-write settings, installed Quarto,
  copied-source equality check, exit handling and environment restoration are
  visible. No new actionable issue identified in those scoped changes.
- Inspected only the source-safe default change at `setup.R:7` as owned work.
  The rest of setup was read as integration context, not treated as new work.
- Compared the visible instruction paragraphs at `AGENTS.md:126-139`,
  `ORCHESTRATOR.md:113-126` and `CONTRACT.md:17-30`: they agree. Inspected the
  `kilo.json:7` prompt surface within the tool's long-line visibility limit.
  No instruction-scope finding identified; full JSON parsing/equivalence was not
  independently rerun.
- Read the supplied `results.tsv:1-8`, complete `quarto.log:1-67` and targeted HTML
  output: run identity at HTML line 2338, store at 2360, actual processing error at
  2607, NOT RUN rows at 2717/2722 and NOT PASSED at 2757. Log line 65 records HTML
  creation. This corroborates a render, not successful original acceptance.
- Read implementation work report as attributed evidence only: it reports source
  hash and previous checks at lines 40-61, earlier dirty ownership at 71-75, and
  pending review/verification/reload at 77-83. No prior command result was
  represented as executed by this reviewer.

## Gaps
- No commands, runtime checks or Git inspection will be executed in this review.
- HEAD and current time are UNKNOWN because command execution is prohibited.
- Branch main and checkout are user-supplied targets, not independently verified
  Git state. Implementation report line 10 reports historical HEAD
  e9c71e3190f1ce88a017ae25af7c373a64c655a2; current HEAD remains UNKNOWN.
- The immutable committed scenario oracle could not be retrieved with Git under
  the no-command restriction. Visible assertions were inspected against the Plan's
  stated requirements; exact independent comparison to the committed oracle and
  source-to-render hash verification were not performed. Earlier dirty scenario
  contents were not substituted as the oracle.
- `kilo.json:7` exceeds the read/search tools' 2,000-character per-line visibility
  limit. Full prompt suffix/equivalence and JSON validity remain implementation-
  reported, not independently verified here.
- No package repository was read; no new package repository SHA is required.
  Installed package pins are visible in setup.R:16-22, not newly certified.
- Q1 remains unfixed because this is read-only. Final mode:verify and instruction
  reload remain pending in the implementation work report:77-83. The known
  processing blocker, B6 and later stages remain outside this review's fix scope.
- No .cg-docs/views bodies/diffs read. No framework, additional safeguard,
  dependency, package fix, or removal/move of protected paths recommended.
