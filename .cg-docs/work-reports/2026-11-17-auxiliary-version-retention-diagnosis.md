# Auxiliary version-retention diagnostic execution report

## Plan reference and approval
`.cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md`, revision 2.
Separate user approval 2026-11-17T16:21:51Z covers full local execution, checks,
route-aware data-risk review, in-scope fixes and final light verification.
Policy ask; no phases. No shared repair, version authority choice or Git approval.

## Run 20261117T162251Z-diagnostic
Root/main/HEAD e9c71e3190f1ce88a017ae25af7c373a64c655a2 verified. Canonical
artifact preflight PASS. Roadmap writes explicitly excluded. Named active state
used instead of modifying mixed-owned current.json.

## Completed steps
1. Local public save/version/readback diagnostic PASS in creator PID17712 and
   fresh reader PID17200. Copied startup audit and original contributed origins
   confined; original runtime profile remains unchanged.
2. Six-artifact decision dossier prepared/checked; all eight data-risk reviews
   and final light code-quality/testing verification passed with no open findings.

## Evidence
| ID | Status | Artifact |
|---|---|---|
| V1 | PASS | preparation.json, child-startup.log, first-1/second-1 logs and namespace TSVs |
| V2 | PASS | first-1.log, second-1.log, save-trace-1.tsv and exact version/sidecar content-hash assertions |
| V3 | PASS | decision-dossier.md six-row authority/method matrix; dossier-1.log independently checks observed ID pairs and UNKNOWN fields |
| V4 | PASS | Eight scoped review handoffs; final light verify confirms implemented parent Plan P2.1, no supported new/unresolved IDs |

## Deviations and accepted exceptions
None. Public assertions are not weakened. Original/runtime/contributed packages
remain read-only; no acceptance of missing evidence by default.

## Correction budget
Two targeted diagnostic-harness corrections maximum; none used at startup.
Package invariant failures block, not package fixes or diagnostic PASS.

## Executed checks
Artifacts below are relative to run folder
`.cg-docs/orchestration/outputs/pipsystem/aux-catalog-reconciliation/20261117T162251Z-diagnostic/`.
- Preparation copied only existing private R home to fresh local root and adapted
  one copied startup-audit expectation line. Original profile SHA256 remains
  `8AFC9A11B86403F86203B2FA833B8D4E8E01247903B11C69D22A25F54EA30E3A`.
  Copied/source Rscript SHA256 matches
  `66921700DC477930627FC09CF2E734AD9E4A9D55D2C39F8C95CEC6E24FF40D6D`.
- Before creator code existed, independent verifier failed exactly:
  `Diagnostic save receipt is unavailable; creation has not run.` No synthetic
  store was initialized. red-1.log is deliberate missing-evidence baseline, NOT
  an installed package failure or reproduction of the shared-store problem.
- Plan-prescribed standalone R assertions used; testthat is not installed in this
  private library and no framework/dependency was added. Existing package unit
  tests were inspected only as the test index, not rerun/copied into a new suite.
- Stamp receipt root/SHA/archive MD5/installed Meta MD5/DONE log and 107 dependency
  descriptions/versions match retained installation records. Checked stamp source
  SHA `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; actual namespace origins recorded.
  Only stamp and its dependency namespaces loaded, no unrelated PIP packages.
- Creator returned IDs 8bc28cc289f49d51 then 6fee99c874dfb800; catalog points to
  second. Both exact payloads/current payload match independently defined inputs;
  historical/current sidecar content_hash matches independent public object hashes.
  st_latest matches timestamp/ID ordering; no tie observed. first/second exit0.
- First/second R PIDs17712/17200, copied R home and original read-only contributed
  library recorded in startup audit and namespace TSVs. Audits write only new run.
- Informational stamp options messages use stderr; Windows PowerShell decorates
  them NativeCommandError in retained logs. Actual messages are options updates,
  R exits0 and all assertions pass. They are not suppressed or called real failures.
- Dossier independently reconciled all six observed selected/candidate IDs and
  required UNKNOWN authority/cause/backup fields, without new shared reads.
- No harness correction used; all actual required diagnostic checks passed first
  attempt. get_errors unavailable, so editor Problems checks NOT RUN. No Pester.

## Uncertainty and final status
Local diagnostic Plan completed with V1-V4 PASS and no accepted evidence
exceptions. Cause, intended authoritative versions and safe shared repair remain
UNKNOWN. Local RDS/two-save/infinite-retention success does not cover QS2 auxiliary
payload acceptance or historical failure/pruning/concurrency effects. No
production-data copies or shared operations authorized or performed.

## Final review and scope checks
- Data-risk roles: code-quality, testing, documentation, version-control,
  reproducibility, performance, architecture, data-quality. All report no
  supported P0-P3 execution issues; no corrections/suppressions/deferrals.
- Final mode:verify used the actual fixed-parent Plan review P2.1 (startup
  confinement), not a fabricated execution finding. Both required light roles
  verified its implemented realization; no new or unresolved IDs.
- Review records:
  `.cg-docs/reviews/2026-11-17-auxiliary-version-retention-diagnostic-review.md`;
  `.cg-docs/reviews/2026-11-17-auxiliary-version-retention-diagnostic-verify-review.md`.
- Mechanical self-review complete: no added debug/import/TODO or hardcoded
  credential issues. Audit/status cat output is intentional. No new public package
  function or dependency. This scan is not statistical/logical correctness proof;
  scoped reviewers separately inspected exact synthetic assertions.
- Canonical Plan validated after permitted execution-report pointer addition.
  Only allowed status/date/pointer fields change; body/revision2 preserved.
- Original R profile remained unchanged; no package/Qmd/rule/roadmap/current.json
  or Git mutation. Fresh copied runtime and local metadata/results remain on E:.
  No staging/commit/push. Mixed unrelated work is not cleaned or claimed pristine.
- Suggested logical commit only: `test(stamp): record isolated version-retention diagnosis`.

## Next evidence/authority boundary
No source fix is supported by this ordinary-path result. Before shared recovery,
establish either an authoritative recoverable copy of the selected missing pins,
or public exact-version candidate payload/sidecar/hash acceptance followed by an
explicit per-artifact version-selection decision. A supported history-preserving
method and separate user-run shared mutation approval are still required. Do not
use st_rebuild/st_restore as an unproven index-repair shortcut.

Handoff:
`.cg-docs/orchestration/outputs/pipsystem/aux-catalog-reconciliation/20261117T162251Z-diagnostic/handoff.md`.
