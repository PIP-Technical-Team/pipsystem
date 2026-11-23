---
date: 2026-11-11
depth: data-risk
type: standard
plan: null
findings:
  P1.B3: fixed
  P2.TEST.1: fixed
  P1.B4: open
---

# B3 Scoped Review

## Status
All eight independent data-risk reports completed/read. B3 projection is supported
at the saved-field boundary; no new production defect found. One P2 test observer
issue corrected and functionally checked. **Acceptance remains BLOCKED by B4:**
the new public scenarios and affected suite retain two real metadata loader API
errors. There is NO all-green, complete-parent or survey acceptance. Final light
verification is complete (verify-review.md); it retains B4 without waiver.

## Scope
Only four new lines R/pd_process_data.R:321-324 and new
test-public-clean-welfare-type.R versus w15/baseline. Preserved four context/B2
files and closed reviews are not reopened. Final source projection is unchanged
throughout review corrections. Test-only P2 correction/new sentinel is in
w15/candidate-verified; prior candidate snapshots and failures are intact.

## Findings
- **P1.B3 fixed, scoped:** actual baseline public proof observed normalized PFW,
  validated clean and auxiliary metadata welfare_type income, with receipt/master
  omission. Projection now matches exact output identity after inventory join
  and uses that validated scalar attribute, not ID text or an inventory fallback.
  Two actual saved-field assertions pass for absent/conflicting inventory inputs;
  strict validation, record immutability and original workers remain unchanged.
  This is boundary correctness, NOT successful public-return acceptance.
- **P2.TEST.1 fixed [safe_auto]:** testing/data-quality independently identify
  observer read failure replacing the original processing error. A test helper
  registers on.exit(stop(original)) before observing, reports an observer failure
  diagnostically, then always rethrows the original condition. Sentinel check
  causes an observer readback error and asserts identical original simpleError;
  both assertions pass. No worker replacement, master fixture, accepted B4 error
  or weakened public no-error requirement. First sentinel attempt misused the
  return value of expect_message; corrected by capturing expression result
  separately, and the failed attempt remains in red-reviewed/affected-reviewed.
- **P1.B4 OPEN [manual], pre-existing/outside B3:** unchanged
  R/pd_metadata_refresh.R:63-67,101-103 calls exported pipload::load_pip_data with
  unsupported alias and positional pip_id. Pinned public signature has no alias/
  dots, first formal country_code and explicit id_name/metadata. Actual B4 errors
  remain in both new public scenarios. No callsite/pipload/pin fix authorized or
  attempted. Separate scope approval and rerun required, not a test exception.

## Independent Roles
All original review findings/reports retained verbatim, including their pre-P2-
correction snapshot counts. This consolidation records later fixes without
rewriting independent review history.

| Role | Report | Result |
|---|---|---|
| Code quality | review-code-quality/handoff.md | No new B3 defect; B4 manual blocker |
| Testing | review-testing/handoff.md | P2.TEST.1 corrected; B4 retained |
| Data quality | review-data-quality/handoff.md | Same P2 diagnostic issue; source trust supported |
| Reproducibility | review-reproducibility/handoff.md | No new issue; manifest scopes explicit |
| Documentation | review-documentation/handoff.md | No new issue; no green claim |
| Version control | review-version-control/handoff.md | No new issue; independently hashed prior/current files |
| Performance | review-performance/handoff.md | No new issue; scales by output count, not survey rows |
| Architecture | review-architecture/handoff.md | No new issue; existing canonical owner retained |

## Checks Run
- Baseline public proof precedes edits: w15/logs/proof.log and
  evidence/confirmed-welfare-propagation.rds. Passive exit observation only;
  new public tests themselves do not trace/replace workers.
- Final frozen red-verified:3 blocks/10 passes/4 intended failures/0 errors/skips.
  Installed affected-verified:133 blocks/628 passes/0 assertion failures/2 B4
  errors/0 skips. New public subset3 blocks/12 passes/2 errors; two saved-field/
  immutability scenarios and exact primary-error sentinel execute. Successful
  public-return assertion remains unreachable on B4, NOT silently waived.
- Snapshot/source/test hashes and red/affected frozen equality independently
  audited by coordinator in verified-provenance-audit.log and corresponding RDS.
  Final authority w15/logs/verified-candidate-source-sha256.tsv. Baseline, first,
  final and reviewed manifests are historical scopes, not current substitutes.
- Final production source SHA256
  a5b7bac456507fb9cc2aa1c4dae17ff1813bdf7862ed3bbe2de9dea624d0cb1c;
  test SHA256 02b32c0f2559862a582ec115c9c652324d2b0c2c645951f5bba643594e179006.
- Installed native QS2/package loads pass; help-CSS copy warning retained. No
  dirty-tree install or dependency download. Four preserved file hashes match.

## Gaps
- P1.B4 remains OPEN/manual and stops acceptance. No all-green regression or
  affected-suite result, complete parent pointer, expanded result or survey claim.
- Reviewers inspected source/text evidence; none ran R/tests/scripts. Version-
  control independently hashed initial reviewed files; later hashes/counts are
  coordinator execution proof until final verification. No false independent-run
  claim, full package check or exhaustive OS/write audit.
- Consumption/reordered multi-output mapping is structurally supported by exact
  validated ID correspondence but not separately executed in these public cases.
- Final light code-quality/testing verification complete, no new supported
  in-scope findings; fresh untraced public retry follows. B4 remains open rather
  than suppressing P0/P1 or claiming parent acceptance.
- get_errors/execution_subagent unavailable; no fabricated Problems/Pester result.
  All original reports/Plan/pins/protected artifacts and four earlier fixes intact.
