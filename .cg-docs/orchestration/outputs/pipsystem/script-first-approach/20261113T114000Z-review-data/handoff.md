---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-data
status: completed
updated: 2026-11-13T11:30:33Z
owner: data-quality-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md revision 1
next: Implementation owner incorporates this review into Plan final verification; original survey acceptance remains blocked.
---

# Script-first data-quality review

## Summary
No actionable P0-P3 data-quality findings identified in the reviewed source.
This is a static review, not successful original survey acceptance, immutable
Git-object verification, or an independently executed test/render result.

The numerical expectations, returned saved-version reads, completed invalid
classification/diagnostic and success-gated no-output check are visibly
preserved against the saved immutable-source excerpt supplied by the parent,
as well as the user requirements and Plan revision 1 at lines 31-33 and 60-73.

Existing same-run results are four PASS, one FAIL and two NOT RUN. Processing
fails with `A single working release and identity are required.` Exact readback
and invalid/no-output acceptance have not executed successfully
(`.tmp/one-survey/n11/qmd-20261113T114000Z/results.tsv:2-8`). Neither original
survey acceptance nor B6 is inferred. The known installed-package failure is
truthfully represented, not a new source defect established by this review.

## Findings

No issues. No safe_auto or manual fixes proposed. Limitations below are
advisory review boundaries, not source-code findings.

## Changes
Only this required report created and finalized. No source, instruction,
package, Plan, generated view, or Git changes; no commits. Existing dirty
scenario.R/reproduce.R/setup.R content was not changed. No writes to C:.

## Checks run
Performed file-based static inspection only. No commands, tests, R execution,
Quarto execution, installation, package execution or Git operations performed.
Loaded communication and R shared, technical, data.table, collapse, testing
and analytical skills; consulted the test-integrity reference.

### Route and data-quality evidence

- Direct assertion comparison: read
  `.cg-docs/orchestration/outputs/pipsystem/script-first-approach/20261112T233858Z-code/oracle-excerpt.txt`.
  Lines 1-2 identify the parent's immutable Git-show retrieval; lines 8-18
  require completed classification and the diagnostic, lines 24-38 require
  real processing and returned exact pins, lines 42-52 require paired values,
  metadata and total weight, and lines 53-55 require no invalid outputs.
  Corresponding Qmd checks at 194-210,232-245,265-287,303-307 preserve these
  assertions without weakening expected values or bypassing processing.
- Input/schema/fixture boundary: `experiments/pip-pipeline.qmd:84-106`
  constructs four paired annual welfare/weight rows and checks the raw
  expectations. `experiments/one-survey/qmd-fixtures.R:3-42` supplies explicit
  synthetic survey/CPI/PPP keys and year fields. Constants match the approved
  fixture, not live auxiliary producer certification. No unnecessary general
  input validation framework is proposed for these closed synthetic inputs.
- Transport substitution: `qmd-fixtures.R:59-87` replaces external release,
  vintage, catalog and acquisition transport. The invalid download actually
  drops weight at lines 79-81. No cleaning, validation, metadata or calculation
  substitute is present. Fixture limits are disclosed in the Qmd at 126-130
  and 154-157.
- Public route: `pip-pipeline.qmd:135-144,162-169,188-210,232-245` visibly
  invokes release setup, fixture storage, acquisition/validation and real
  processing. The success classification is checked before using inventory;
  valid/invalid inventory rows and the missing-weight error are required.
- Exact pins: `pip-pipeline.qmd:238-245` selects the valid survey row and
  captures its returned data and metadata version IDs. Lines 265-270 pass
  these two saved pins explicitly to `pip_read()`, not implicit latest reads.
- Numerical/missingness integrity: `pip-pipeline.qmd:271-287` compares the
  complete paired table to welfare 1,2,3,4 with weights 10,20,30,40, checks
  survey ID, CPI 1.4, PPP 1.6 and total weight 100. Exact paired equality
  rejects row loss, reordered/incorrect pairings and NA values; the fsum
  total is not relied on alone to detect missing weights. Expected values
  are independent literals, not derived from processing output. Annual raw
  welfare 365,730,1095,1460 is preserved at lines 89-90 and 102.
- Genuine invalid/no-output: `pip-pipeline.qmd:194-210` requires successful
  completed classification and the real diagnostic. Lines 303-315 query
  both clean and metadata aliases for the invalid artifact only if all
  preceding checks succeed, including real processing and exact readback.
  A failed processing call cannot earn rejection PASS from an empty store.
- Truthful failure propagation: `pip-pipeline.qmd:38-54` begins with NOT RUN,
  records the actual condition message and closes the processing gate on
  error. Processing errors are caught at 250-252; dependent chunks at 263
  and 303 remain unexecuted. Summary at 324-337 preserves NOT PASSED and
  explicitly NOT RUN later work. `check-qmd.R:14-25` exercises the actual
  recorder and blocked release chunk; its assertions were inspected, not run.
- Private runtime/provenance: launcher Qmd additions at `run.ps1:67-96`
  require a fresh render tree, select private R, redirect render outputs and
  compare the copied document hash. `pip-pipeline.qmd:63-66` invokes existing
  setup/receipt verification. Reviewed setup line 7's nonempty source-mode
  default; seven pins are at `setup.R:16-22`. Existing verification at
  203-241 supplies context only; it is not re-reviewed as newly owned work.
  No package repository was read, so no new package HEAD claim is made.
- Durable instructions: script-first text in `AGENTS.md:126-139`,
  `ORCHESTRATOR.md:113-126` and `CONTRACT.md:17-30` consistently preserves
  numerical/exact-version/invalid-no-output assertions and FAIL/NOT RUN.
  `check-qmd.R:41-67` contains the four-surface comparison and JSON/prompt-only
  check. `kilo.json:7` was inspected only to the reader's line-length limit;
  full fourth-surface equivalence and JSON parsing are implementation-reported,
  not independently executed or fully visible in this review.
- Existing evidence inspected, not rerun: results.tsv lines 2-8 show four
  PASS, actual context FAIL and two NOT RUN. `quarto.log:40-65` records HTML
  output creation, not successful survey acceptance. No HTML or other
  generated-view body was read. Work report lines 40-61 records prior checks;
  these are implementation-reported evidence, not reviewer-run checks.

## Gaps
- Immutable oracle is user-specified commit
  e9c71e3190f1ce88a017ae25af7c373a64c655a2,
  experiments/one-survey/scenario.R lines 123-179. Compared the parent's saved
  immutable-source excerpt directly; its source attribution is parent-reported.
  No Git command was permitted to independently authenticate the excerpt
  against the object. The dirty working-tree scenario was not used as oracle.
- Current repository HEAD/diff/ownership cannot be independently established
  without prohibited Git commands. Branch main is user-specified; head stays
  UNKNOWN. Work report lines 10 and 72-75 reports the starting SHA and dirty
  ownership; this review does not promote those to independently verified Git
  facts. Only setup.R line 7 is assessed as the approved source-mode change.
- The full long kilo.json prompt line was truncated by both file/content tools.
  Exact appended text, JSON validity and prompt-only diff are not independently
  certified; work report lines 45-47 reports those checks. The test source
  intended to establish them is visible at check-qmd.R lines 41-67.
- Existing render does not execute the exact readback/numerical/no-output
  assertions successfully. Runtime correctness of those branches remains
  NOT RUN, not presumed PASS. Resolving the unchanged-pin package context
  blocker is outside this review and this Plan's package-change scope.
- No numerical estimates, original Plan completion, B6, live services,
  auxiliary producers, production, later stages, fresh render, JSON parse,
  path-resolution audit or final Plan verification was executed here.
- Instruction adoption still needs the reload/fresh-session action recorded
  in work report line 80; this review does not reload configuration.
