---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T190007Z-context-fix
status: complete
updated: UNKNOWN
owner: independent testing reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Review complete; coordinator may integrate this evidence-only testing verdict. Expanded-suite completion remains unverified.
---

## Summary
No supported P0, P1, P2 or P3 issues found in the changed files
`R/dependency_contract.R:266-293` and
`tests/testthat/test-public-working-release-context.R:1-87`.
The regression genuinely exercises public setup followed by public processing,
and distinguishes the original context failure from the intended missing-auxiliary
fixture boundary. This is a bounded integration check, not survey completion.
No implementation authorized or performed.

## Changes
Only this report created and checkpointed. Minimal first: review the smallest complete fix, require
a functional check per change, avoid unrelated cleanup or additional safeguards
for reversible failures; installed dependencies only, no new Plan.

## Checks run
- Loaded required communication, R technical, R testing and data.table skills;
  read test-integrity reference.
- Read actual Git diff/status and HEAD, changed files, public processing and
  preserved fresh-master regression source. Only two intended code/test paths
  appear changed; HEAD matches the review brief.
- No tests, R commands, shell scripts, downloads or Git mutations executed.
- Read-only Git comparison against the named baseline confirms both
  `R/pd_process_data.R` and `tests/testthat/test-pd-process-fresh-bootstrap.R`
  are unchanged; current branch is PROD.

### Public contract and path integrity
- Pinned `n11/sources/pipfun/R/working_release.R:121-169` constructs the
  descriptor and persists it into `.pipenv`. Its exported getter at 315-329
  assigns `wrk_release` into `parent.frame()`. The candidate correctly calls
  it for either NULL argument, then fills only the NULL fields. Both explicit
  fields bypass the getter; no fallback/catch or exported API was introduced.
- New test lines 18-19 clear prior pipfun state/aliases, but do not seed a
  descriptor or paths. Lines 39-45 use actual public setup, assert literal
  release/identity and assert the two obsolete options remain absent.
  Lines 50-59 create the completed valid inventory expected by public processing.
- Only release/PPP external transport boundaries are mocked (lines 24-38).
  Pinned pipfun `release_management.R:424`, `pip_create_vintage.R:105-110`
  and `load_from_gh.R:44-93` show those mocks intercept external access while
  retaining PPP disk parsing and setup. No context/master/worker/planner
  replacement or advisory-plan injection appears in the regression.
- Real `pd_process_data()` filters the inventory and loads the master before
  preparing execution (`R/pd_process_data.R:115-124`). The unchanged bootstrap
  branch checks stamp history/storage before returning empty master (194-226).

### Trace and error assertion
- The exit trace at new test lines 60-69 only copies `returnValue()` to a local
  observation environment. It does not replace the context computation,
  assign into the worker's frame or supply a context to processing. Deferred
  untrace removes the instrumentation on normal and error exits.
- Lines 72-75 require `pipdata_dependency_aux_missing`, not arbitrary failure.
  That class is emitted at `R/dependency_execution.R:234-245` for missing aux
  catalog/artifacts. Context failure, master failure, and unexpected success
  cannot satisfy the assertion. Lines 76-86 separately verify the returned
  release, identity, canonical master root and still-absent master history.
  The matching class intentionally covers both empty and incomplete auxiliary
  catalogs; neither is confused with the original context failure.

### State restoration and preserved fresh-master tests
- New test lines 6-17 snapshot and defer restoration of pipfun `.pipenv`,
  stamp alias registry and stamp state before clearing setup state. Cleanup
  empties the changed stores before restoring the prior bindings. Scoped
  options, transport mocks and temporary root also have withr cleanup.
  The inspected pinned stamp state consists of path/configuration bindings
  (`n11/sources/stamp/R/aaa.R:24-36,59-66`; `IO_core.R:105-115`), compatible
  with this save/restore mechanism; no observed in-place nested-state mutation
  invalidates that snapshot in the reviewed path.
- Preserved fresh-master test lines 4-72 still observe real preparation entry
  and empty master without replacing reader/workers. Its broad error capture
  deliberately does NOT establish downstream context or survey success; the
  new class-specific regression supplies the missing integration check.
  Remaining preserved cases cover existing history, non-bootstrap failure,
  listing/read errors, corrupt-history warnings, missing alias and surviving
  storage inconsistent with absent history (lines 74-207).

### Retained runtime evidence (not independently executed)
All runtime paths below are under `pipsystem/.tmp/one-survey/c11/`.
- `logs/red-confirmed.log:26-49`: five passing setup preconditions, one
  unexpected `pipdata_dependency_context_error` at the public processing
  assertion. The zero script exit records successful capture of RED; it is
  explicitly not a passing regression. Failure matches the original symptom.
- `logs/green.log:26-29`: same named regression, ten assertions pass,
  zero failures/errors/skips. Retained candidate test source matches the
  reviewed 87-line test on inspection; `check.R:38-41` checks its hash against
  the candidate copy. `check.R:23-33` verifies installed context/wrapper/master
  helper bodies against baseline or candidate according to the run label.
- `logs/affected.log:16-51`: 110 blocks, 549 passing assertions, zero
  failed/error/skipped; preserved fresh-master file contributes 19 assertions.
- `logs/expanded.log:16-21` ends partway through dependency tests with no final
  totals. It is not evidence of a completed expanded run.
- Trace announcements appear as PowerShell NativeCommandError formatting in
  red/green/affected logs, but completed test summaries distinguish actual
  test errors from stderr formatting. No additional test failure is supported
  by that presentation alone.
- Reviewed `run.ps1:13-35`: child temp/home/profile/library/cache destinations
  are set on E: before R children. Source-only review does not establish an
  exhaustive OS-level write audit.

## Findings
No issues found for the two named changed files within this testing-review
scope. No implementation or unrelated cleanup is recommended.

## Gaps
- Source/evidence review only: no independent test execution, binary RDS analysis,
  or recomputation of historical source hashes. The brief's frozen-red/green
  chronology and archive provenance are supported by the inspected sources/logs,
  not independently reconstructed historical execution.
- The expanded suite has no completion summary in the inspected log. Full-suite
  regression acceptance is not established; the completed affected suite is the
  supported result. No Problems/get_errors or execution_subagent result exists
  in this review; those tools are unavailable and no substitute was fabricated.
- Partial-explicit release/identity inputs and missing-public-setup behavior
  are inspectable in the short implementation but are not separately covered
  by the new test. Existing explicit-both coverage remains in
  `tests/testthat/test-dependency-contract.R:11-20`. This is a coverage limit,
  not evidence of a defect requiring broader safeguards for this bounded fix.
- Restoration was verified structurally, not by independently running a
  deliberately failing test or shuffled suite. Prior third-party instrumentation
  on the same traced function was not an exercised scenario.
- No exhaustive OS write audit, completed survey cleaning/deflation, numeric
  acceptance, deployment or approved immutable revision/pin follows from this
  review. Original survey acceptance remains outside scope.
