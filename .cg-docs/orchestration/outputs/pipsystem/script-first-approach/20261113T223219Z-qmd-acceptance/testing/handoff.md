---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T223219Z-qmd-acceptance-testing
status: completed
updated: 2026-11-13T22:53:36Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Continuation coordinator incorporates this report into V5 and completes required final verification.
---

# Narrow Qmd acceptance testing review

## Summary
No issues found: zero supported P0, P1, P2 or P3 findings in this narrow
continuation. Retained executed evidence supports V1-V4 for the first-save
synthetic fixture, not B6 later-refresh/history certification. V5 is not
certified by this one testing review. Branch and HEAD above are brief
provenance, not independently queried. The updated timestamp records the
dispatch reference time; no system-clock command was run.

Review follows review-brief.md:3-62; does not repeat the completed broad
style/package reviews or propose additional defensive-test scope.

## Changes
Only this exact report created and finalized. No source/package changes,
execution, downloads, Git operations or mutations, protected-artifact edits,
or writes outside this report. No new findings requiring safe_auto/manual/
advisory correction classification.

## Checks run
All checks in this review were STATIC INSPECTION of source and already
retained output, not fresh execution by this reviewer. Loaded R shared,
technical, data.table, collapse, testing and analytical skills, plus technical
communication. Read the brief, contract, charter, design, harvest brief,
original revision 1 Plan, current continuation handoff and work-report
resumption (work report:160-228).

Runtime-relative paths below use
`.tmp/one-survey/qmd-acceptance-20261113/`; HTML means its
`qmd-20261113-acceptance/pip-pipeline.html`, not `.cg-docs/views/**`.

| Gate | Static assessment of retained executed evidence |
|---|---|
| V1 | Supported for this runtime. `experiments/one-survey/setup.R:16-22` matches `pins.tsv:2-8`; `logs/setup.log:3-9` records all seven successful installs. Its lines 1-2 are the deliberate missing-cli control, and lines 17-30 are disclosed pax-header warnings, not a concealed final installation failure. `logs/check.log:1-3,96` records a separate usable-package check and five rejected stale/incomplete controls; the real QS2/hash assertions are `setup.R:38-56`. `dependencies.tsv:2-108` has 107 copied dependencies, with the explicit native-storage origins at lines 10-12. `installed-packages.tsv:2-8` records seven versions/private paths; `logs/session-info.txt:1-3` records R 4.5.2. `logs/child-startup.log:1-26` distinguishes installer, check and render children and their dedicated libraries. `logs/repository-status.txt:1-24` distinguishes immutable archives from ambient dirty package worktrees; those dirty changes are not the archived source. |
| V2 | Supported for the fresh first-save fixture. `run.ps1:67-96` requires a fresh render directory, uses the private R and copies source; `logs/child-startup.log:26` records the actual Quarto R child. `quarto.log:3-35,62` records the executed chunks and created HTML. The actual public acquisition/validation and processing calls are `experiments/pip-pipeline.qmd:167-172,208-212`; HTML:2538-2574,2613-2641 shows completed classifications and returned master pins. `qmd-fixtures.R:48-94` substitutes external release/PPP-vintage/catalog/download transport, including a real missing-weight download, not validation, cleaning, metadata or storage. Qmd:114,138 discloses those substitutions and fixture-only auxiliary tables. |
| V3 | Supported. Qmd:239-260 passes each returned pin explicitly to `pip_read()` and compares a single paired table to literal expectations, not independently sorted welfare and weight vectors. HTML:2630-2641 records clean `ab5f8ecf4163c542` and metadata `68b3b5b50c5dc90b`; HTML:2682-2696 shows equal expected/actual pairs (1,10), (2,20), (3,30), (4,40). HTML:2710-2712,2751-2753,2772-2773 retains CPI 1.4, PPP 1.6 and survey ID. Qmd:255-264 earns PASS only after these exact assertions and total weight 100; `results.tsv:6-7` confirms their completed result. |
| V4 | Supported for this fresh control, not merely inferred from an empty store after failure. Qmd:173-189 requires success, both classifications, zero failed validations and the missing-weight error. HTML:2551-2574 contains the actual valid/invalid rows and diagnostic. The real processing call succeeds before the guarded no-output assertion (Qmd:205-228,275-288); HTML:2814-2831 shows only SYNA in both downstream catalogs and the same saved pins. `results.tsv:5-8` records completed validation, storage, readback and invalid-no-output PASS. Fresh-directory enforcement (`run.ps1:71-77`) supplies the empty initial-store condition rather than reusing a historical store. |

Focused negative-control evidence is credible: `check-qmd.R:14-31` evaluates
the actual Qmd error recorder and downstream guarded chunks, asserting FAIL
and NOT RUN rather than treating a thrown package error as invalid rejection.
`logs/qmd-check.log:1-4` records the intentional synthetic FAIL and all three
PASS groups. No new red test is necessary for the authorized pin-only delta:
fresh exact-inventory equality and the actual Qmd assertions exercise it.

First-save/B6 distinction is preserved in Qmd:18,294-309 and the work report:
214-228. HTML:2923-2927 reports first-save acceptance PASS and B6/later stages
NOT RUN for this run. This does not reverse the historically failed/open B6
status. Original Plan:63-64 explicitly states that single-version readback
does not prove historical selection after a later save. No B6 repair or
acceptance waiver is recommended.

## Gaps
- No tests, render, package installation, pipeline or Git commands were run by
  this reviewer. Binary inventory/receipts were not decoded or rehashed; their
  verification is evidenced by the retained setup/check output and inspected
  verifier source, not independent re-execution. The source SHA256 in the
  parent handoff:43-44 is retained provenance, not independently recalculated.
- The attempted retained `pip-pipeline.knit.md` read found no such file; the
  actual rendered HTML, result table and Quarto log were inspected instead.
  Content search on embedded HTML exceeded the search-tool record-size limit;
  direct line-range reads supplied actual output evidence.
- V5 still requires coordinator consolidation of all required continuation
  reviews and final mode:verify; this report alone does not complete the Plan.
- B6 later-refresh remains historically failed/open and untested here. Live
  transport, auxiliary producers, deflation, means, incremental execution,
  production and exhaustive OS-level write auditing are not certified.
- No package repository was opened directly. Archived/installed package SHAs
  are recorded in `pins.tsv:2-8` and source-state provenance in
  `logs/repository-status.txt:1-24`; this is not a renewed package-wide review.
