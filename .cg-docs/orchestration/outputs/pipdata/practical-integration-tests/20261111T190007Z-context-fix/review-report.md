---
date: 2026-11-11
depth: full
type: standard
plan: null
findings:
  P1.1: fixed
  P2.1: fixed
  P3.1: fixed
---

# Public Context Fix Review

## Status
Full ten-role independent review complete. Two new findings, P2.1 and P3.1,
corrected within scope. Carried-forward package-context defect P1.1 is fixed
at the tested boundary. No skipped findings or accepted exceptions. Final
light mode:verify completed; see verify-review.md. Expanded verification remains BLOCKED by five
unavailable upstream-parent checks; this is not all-green survey acceptance.

## Scope
Existing pipdata PROD at c5b27fa4458d7175aca81a203762bae81e9f0b40, only
R/dependency_contract.R and tests/testthat/test-public-working-release-context.R.
No original survey Plan, source pin, public worker, bootstrap source or existing
test assertion changed. Reviewers inspected actual source and retained execution
evidence; they did not independently execute tests.

## Findings
- **[P1.1] fixed** Carried-forward public context mismatch from the November 11
  survey full review. R/dependency_contract.R:266-279 now resolves omitted fields
  through exported pipfun::get_wrk_release(), whose pinned contract assigns the
  descriptor into the caller frame. Explicit values remain supported; no obsolete
  option fallback, hidden state, catch-all recovery or other-package change.
  Original red preceded source editing. Final frozen regression on exact installed
  c5b27fa baseline: six preconditions pass, then the exact context error. Final
  candidate: eleven assertions pass, reaching only the expected missing-auxiliary
  fixture boundary. This closes the bounded package defect, not the historical
  survey report's acceptance gate, which is not edited here.
- **[P2.1] fixed [safe_auto]** Adversarial, new test setup call: localizing
  pipfun.main_dir alone does not localize pip_create_globals(root_dir), which
  defaults to PIP_ROOT_DIR and has directory side effects even for create_dir=FALSE.
  Added root_dir=root through public setup's supported ellipsis. A temporary
  unused ambient-root path inside the same isolated fixture now proves it remains
  absent. No shared-path negative control or new dependency. Full affected rerun
  passes with this additional assertion; no old assertion weakened.
- **[P3.1] fixed [safe_auto]** Documentation, R/dependency_contract.R:271: added one
  succinct comment explaining the public getter's caller-frame assignment. No
  conventional-return assumption or unrelated documentation regeneration.

## Independent Roles
All reports are pip-handoff-v2 under this run; all ten returned usable findings
or explicit no-issues results with named files and evidence/limits.

| Role | Report | Result |
|---|---|---|
| Code quality | review-code-quality/handoff.md | No additional findings |
| Testing | review-testing/handoff.md | No additional findings |
| Documentation | review-documentation/handoff.md | P3.1 |
| Version control | review-version-control/handoff.md | No additional findings |
| Reproducibility | review-reproducibility/handoff.md | No additional findings |
| Performance | review-performance/handoff.md | No additional findings |
| Architecture | review-architecture/handoff.md | No additional findings |
| Data quality | review-data-quality/handoff.md | No additional findings |
| Learnings | review-learnings/handoff.md | No additional findings |
| Adversarial | review-adversarial/handoff.md | P2.1 |

Learnings used targeted local Brain/solutions, including the preserved fresh-master
bootstrap solution, real-stage/transport-only acceptance Plan and contained-R
preflight lesson. No team pull/download or generated HTML body read. No charter,
roadmap, original Plan or pin changes. All supported P0-P3 findings addressed;
source review is not a claim of numerical or production correctness.

## Checks Run
Runtime: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/c11.

- Initial red-confirmed.log: 1 block, 5 passes, 1 exact context test error, 0
  assertion failures/skips. green.log: identical first regression, 10 passes.
- Final test after P2 isolation correction: red-final.log gives 1 block, 6 passes,
  1 exact pipdata_dependency_context_error. affected-final.log gives 110 blocks,
  550 passes, zero failures/errors/skips, including 11 new-regression assertions
  and all seven unchanged bootstrap blocks / 19 assertions. Frozen final-test
  SHA256 is recorded in final-source-sha256.tsv and both per-run test manifests.
- expanded.log: completed 197 blocks, 1266 passing assertions, zero assertion
  failures, FIVE test errors, zero skips. All five errors are nzchar(PDM2_RUN)
  precondition failures at test-m2-engine-authority.R:26 via blocks at 99,132,168,
  209,277. Required evidence/current-parents.rds is unavailable. The other context
  wrapper tests completed. No silently narrowed rerun is substituted for this
  failed expanded result; no upstream preparation/full survey is run to evade it.
- Final candidate = exact local baseline archive plus two owned files only;
  unchanged payload content checked against baseline. Installed executable
  context/wrapper/bootstrap bodies match the recorded snapshot. All test-file
  contents checked unchanged across each final execution. Dependencies remain
  the recorded n11 combination; tools are explicitly copied installed versions.
- git diff --check passes (LF/CRLF notices only). Required editor Problems API
  get_errors and execution_subagent are unavailable; no fabricated check/Pester.

## Gaps
- **B1 BLOCKER:** Five M2 actual-upstream-parent checks cannot execute without
  their independent saved PDM2_RUN/evidence/current-parents.rds prerequisite.
  Establishing/reusing certified same-store parent evidence is not authorized by
  this bounded task; no fixture fabrication, bypass, skip or assertion weakening.
- Final mode:verify completed with code-quality/testing only, no new supported
  findings. Review closure does not remove B1, authorize a commit/pin change or
  certify the original survey. Role reports and verify-review.md retained here.
- Full package R CMD check, full survey, scientific numerical/readback acceptance,
  shared/production writes and exhaustive OS write tracing are not performed.
  The deliberate missing-auxiliary fixture endpoint is not a new producer defect.
- Installer emitted the retained missing help-CSS copy warning while staged/final
  loading and test execution passed. No help-styling fix added.
- Kilo may save its own tool output on C: under the global runtime exception;
  reviewer version-control report records that automatic behavior. All agent-
  directed source, runtime, library, temp, cache, log and report paths are on E:.
