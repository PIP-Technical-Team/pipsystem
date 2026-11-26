---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T190007Z-context-fix
status: complete
updated: UNKNOWN
owner: review-adversarial
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator triage of P2.1; no implementation performed by reviewer.
---

## Summary

One supported P2 finding in the new regression's filesystem isolation. No supported issues found in the minimal getter change in R/dependency_contract.R:266-274. Review complete within the read-only execution constraints.

## Findings

- **[P2.1]** [cg-adversarial] `tests/testthat/test-public-working-release-context.R`:39 — Public setup can write outside the test's temporary root [safe_auto]
  **Attack vector**: Run the new test with `PIP_ROOT_DIR` set to another directory, including an existing shared or read-only PIP root. The test localizes `pipfun.main_dir` at lines 20-23 but does not pass `root_dir` through setup's `...` or localize `PIP_ROOT_DIR`.
  **Impact**: The regression creates directories outside its temporary fixture, leaves them behind after cleanup, or fails at setup on an unwritable root before reaching the context regression. A normal package test run is not isolated merely because the special c11 launcher redirects the environment.
  **Proof**: Static trigger: set `PIP_ROOT_DIR` to an existing `E:/outside-fixture` directory, then run this test. Pinned pipfun `R/working_release.R`:110-119 forwards `...` to `pip_create_globals(create_dir = FALSE, vintage = list(...))` without supplying `root_dir`. Pinned `R/pip_create_globals.R`:33-34 defaults `root_dir = Sys.getenv("PIP_ROOT_DIR")`, `out_dir = root_dir`; lines 165-173 unconditionally call `fs::dir_create()` for `E:/outside-fixture/pip_ingestion_pipeline/pc_data/output-tfs-sync/ITSES-POVERTYSCORE-DATA/` because vintage is non-NULL, even though `create_dir = FALSE`. The test only registers temporary-root cleanup and environment-binding restoration; neither removes this outside directory. If that root is unwritable, this same call errors before line 42. This trigger is source-derived, not independently executed.
  **Fix**: Add `root_dir = root` to the existing `pipfun::setup_working_release()` invocation so its public `...` routes globals and their output directories into the same temporary fixture. Keep real setup, transport-only mocks, existing assertions, and bootstrap protections unchanged.

## Changes

Report only. No implementation, Git mutation, test execution, or R/shell script execution.

## Checks run

- Read brief, charter, actual diff and complete changed files. Read-only Git confirms branch PROD, full HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40, and no diff in R/pd_process_data.R or tests/testthat/test-pd-process-fresh-bootstrap.R. The new regression is untracked; it was inspected directly rather than inferred from git diff.
- Loaded communication, R technical, R testing, R shared, and data.table skills; read test-integrity reference.
- Checked caller-frame assignment against pinned pipfun R/working_release.R:315-329: the direct namespaced call runs from the context function, assigns a fresh local wrk_release, and does not depend on the getter's return value.
- Traced NULL and explicit argument paths: both explicit values skip the getter; a NULL component uses the getter while a non-NULL component is retained. Default promises for main_dir/namespace are unaffected by the getter, which only reads .pipenv and assigns its descriptor locally. No hidden-option fallback or exception-to-success conversion was added. No supported stale/partial-context or lazy-promise failure established under the pinned public setup contract.
- Checked new regression's state handling: .pipenv and aliases are cleared before real setup; original pipfun/alias/stamp bindings are restored by deferred cleanup. Stamp st_init overwrites scalar path state and registers fresh alias lists; no demonstrated mutation of preserved objects by reference was found. Deferred untrace and local options/mocks restore instrumentation. Filesystem cleanup limitation is P2.1 above.
- Followed public pd_process_data through validated inventory filtering, genuine master-history lookup, dependency context forcing in pd_prepare_dependency_facts:453, and real pd_freeze_aux_snapshot. The auxiliary-missing class at dependency_execution.R:235-245 is reached during preparation, before lease acquisition at :1067 or workers. Thus lazy evaluation does not permit the requested error to occur without first resolving context.
- Regression asserts the specific pipdata_dependency_aux_missing class and separately checks the observed real context's release, identity, and master root. Arbitrary errors, no error, or worker success cannot satisfy that error expectation. Context trace is exit-only observation, not a worker substitution. External substitutions are the three release/PPP transport helpers only.
- Bootstrap protections remain unchanged: history warnings/errors propagate, surviving storage contradicting absent history is rejected, normal existing-history reader remains authoritative. Read the unchanged seven-case bootstrap file; no relaxation recommended.
- Read supplied c11/logs/red-confirmed.log: five passing preconditions followed by exact pipdata_dependency_context_error in public processing; one test error, not a green result. Read green.log: 1 block, 10 passed, 0 failed/errors/skipped. Read affected.log: 110 blocks, 549 passed, 0 failed/errors/skipped; bootstrap file contributes 19 passing assertions. Trace output is shown as PowerShell NativeCommandError text in these logs; this is not silently represented as an R test failure or omitted from this review.
- Read c11/check.R (not executed): verifies installed source bodies against snapshot, frozen regression hash, and test-file hashes; tests use the installed namespace. Read expanded.log: only partial progress through dependency-manifest, without completion summary at inspection. No expanded-suite success is claimed.

## Gaps

- Static independent source/evidence review only. No R, shell scripts, tests, downloads, installs, Git mutation, environment switches, or survey execution. Supplied runtime results are evidence from the implementation run, not this reviewer's independent execution.
- P2.1 is established from the pinned public call chain; its outside-root and permission-denied triggers were not executed under the explicit no-execution constraint. The c11 redirected environment masks that portability/isolation issue in its passing result.
- Expanded affected suite had no final summary when read. Full package checks, randomized-order runs, missing/partial descriptor runtime probes, and explicit/lazy argument runtime probes were not performed here. No unavailable get_errors/execution_subagent diagnostics are fabricated.
- The regression intentionally stops at missing auxiliary data during preparation. It does not demonstrate completed planning, lease/worker execution, full survey success, numerical accuracy, or readback acceptance; those are not conditions for this bounded fix review.
- No exhaustive OS write audit is available. The only reviewer-created or modified artifact is this assigned E: report. Original Plan, pins, protected artifacts, implementation, and other reports remain untouched.
- Minimal first: the finding's remedy is one existing public argument, not a new safety framework, option fallback, dependency, or bootstrap bypass. No speculative unrelated safeguards proposed.
