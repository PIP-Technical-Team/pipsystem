---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T132507Z-fingerprint-fix
status: completed
updated: 2026-11-12T15:54:31Z
owner: cg-code-quality final light mode:verify NEW B5
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Consume completed scoped B5 verification; retain B6 OPEN/manual and failed public/affected acceptance. No planner or fence workaround or waiver authorized.
---

# NEW B5 Final Light Verification

## Summary
Final light mode:verify completed for NEW B5 only. P1.B5 correction is supported
at BOTH original and fact-refresh boundaries; no new supported P0/P1 or cross-file
issue found in the named delta. This is a scoped verification PASS, NOT public,
affected-suite, complete-parent, expanded-test or original-survey acceptance.
B6 remains OPEN/manual. Current three scoped hashes match candidate-reviewed.

## Findings
No new actionable issues found in R/dependency_execution.R,
tests/testthat/test-fingerprint-fence.R, and the bounded retained
tests/testthat/test-public-metadata-loader.R fixture/observer repair against
f19/baseline. P2/P3 review is suppressed only for this fixed-scope verification;
P0/P1 and cross-file issues were not suppressed. No safe_auto change proposed.

- R/dependency_execution.R:945-952 copies only data.table components before
  setindexv(NULL). Every other fingerprint value remains in identical(); no
  schema/class/order/hash/summary/audit coercion, recalculation or removal.
- Lines954-997 and1100-1127 apply the SAME helper to current and frozen values at
  BOTH fences. Context OR short-circuits and stale error classes remain. Exact
  catalog/version/content checks remain at961-993; lease and manifest checks at
  1105/1114-1124 and1182-1192 remain. Producer missing-component/constant errors
  still propagate from R/code_fingerprint.R:44-94. No catch or error acceptance
  added. Refresh caller still invokes the guard before rebuilding facts at504-505.
- test-fingerprint-fence.R:1-45 uses exported TEST setup, real fingerprints,
  context/catalog/lease and actual absent-manifest state. Lines55-67 test both
  index-only acceptances and frozen snapshot/index immutability. Lines69-99
  reject supported configured context, component identity/membership/class,
  component/summary hashes and audit changes through BOTH fences. No provider
  replacement, global index option, skip or expected-failure marker added.
- test-public-metadata-loader.R:83-103,114-124 keeps the observer passive and
  checks ID/NULL-country/kind/version outside worker handling. Baseline comparison
  confirms original full-request/pin/welfare/immutability expectations remain;
  second kind is still TRUE with the first metadata version, not observed FALSE.
  Fixture fields at108-111 match declared helper-one-survey-upstream-acceptance.R:
  134-145,178-181. No producer/worker output substitution.

**[P1]** `tests/testthat/test-public-metadata-loader.R:115-117` -- B6 remains OPEN/manual (existing acceptance gap, not a new B5 finding).
**Issue**: Real second public request selects metadata=FALSE/clean version rather
than metadata=TRUE/prior metadata version. Three unchanged assertions fail;
actual successful metadata-only route is not certified. diagnose-selection.log:
52-75 records aux_cpi_changed/output_missing, reconstruct TRUE, metadata pin/hash
NA and clean output_drift. This is evidence of selection inconsistency, not a
proved planner/output-receipt root cause.
**Fix**: Retain strict assertions and the OPEN/manual blocker. Separately scope and
authorize planner/output-receipt investigation; no implementation, forced worker
path, fence workaround or acceptance waiver is authorized in this B5 verification.

## Changes
Only this assigned E: report created/checkpointed/finalized. No code, R/scripts/
tests execution, Git mutation, protected artifact change, earlier context/B2/B3/B4
review restart, broad route, new session/worktree, Plan/pin or other report edit.
Minimal first: smallest complete review; no new safeguards, dependencies or Plan.

## Checks run
### Independently performed (read only)
- Read review-brief.md, parent review-report.md/handoff.md, prior code-quality
  report and f19/logs/reviewed-provenance-audit.log. Read both current fences,
  caller/producer context, both scoped tests and declared CPI fixture schema.
- Loaded communication, Rtechnical, datatable, Rtesting (including test-integrity),
  Rshared and Rcollapse skills. Root compound-gpid.local.md absent; inspected
  r.instructions.md and applied its default data.table-collapse dialect.
- Read-only Git verified PROD and full HEAD above. Compared both existing files
  directly with f19/baseline using git diff --no-index; exit1 denotes expected
  delta. Read new99-line fence test in full. Scoped git diff --check passed;
  LF/CRLF advisories are not implementation changes. No broader pending-file audit.
- Get-FileHash SHA256 independently verified each current file AND its frozen
  f19/candidate-reviewed counterpart against the brief:
  - R/dependency_execution.R: 4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02
  - tests/testthat/test-fingerprint-fence.R: b4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57
  - tests/testthat/test-public-metadata-loader.R: f9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44
- Verified E: report parent exists before creation; read system clock/time zone.
  Initial Get-Date -AsUTC is unsupported in PowerShell5.1 and failed; corrected
  to (Get-Date).ToUniversalTime(), yielding the UTC timestamps above. No file writes
  from that failed read. get_errors/execution_subagent unavailable, not fabricated.

### Retained execution evidence inspected, NOT rerun
Paths below are under E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/f19/.
- logs/proof.log:29-51: actual final installed B4 first fence rejects with identical
  context, zero changed component hashes, stage-index-only mismatch, full identity
  after index removal from copies. logs/diagnose-refresh.log:35-65 confirms the
  same actual second-fence cause in historical candidate-final scope.
- logs/red-final.log:7-19: original B4 baseline4 blocks/18 passes/2 intended index
  failures/0errors/skips, one at each fence; genuine-change controls pass.
- logs/both-green.log:4-7: candidate-both4 blocks/20 passes/0failures/errors/skips.
  Current affected-reviewed includes the same frozen test; hash equality ties
  reviewed source/tests to current checkout, not a new execution claim.
- logs/code-reviewed.log:4-7: current producer12 blocks/51 passes/0fail/errors/skips.
- logs/public-reviewed.log:77-115:4 blocks/31 passes/3 selection assertion failures/
  0test errors/skips. logs/affected-reviewed.log:108-144:150 blocks/705 passes/
  3 same failures/0test errors/skips. Failure-sensitive wrapper exits retained;
  NOT GREEN. No assertion softened to make these appear successful.
- logs/reviewed-provenance-audit.log:1-3 corroborates frozen source/test match,
  nine prior files unchanged, explicit retained repair, red/control counts and
  failed affected acceptance. Its RDS and all nine files were not independently
  rehashed/decoded in this light verification.

## Gaps
- B6 OPEN/manual: public4/31 passes/3 failures and affected150/705 passes/3 failures,
  zero test errors/skips, remain NOT green. Actual successful metadata-only TRUE/
  old-pin route is unexecuted/uncertified. No planner/fence workaround or waiver.
- New controls use empty/absent catalogs/manifest and real lease; not fresh dynamic
  proof of every populated catalog, lease-loss or manifest-parent branch. Existing
  source/error classes remain; no universal runtime coverage claim.
- Source/log/hash inspection only: no R/scripts/tests/install/linter rerun, binary
  RDS decoding, full package check, all-tree rehash or exhaustive OS-write audit.
  Prior nine-file immutability and broader provenance audit are retained evidence,
  not independently repeated here. No fresh installed second-body equivalence run.
- Fresh real preparation, complete-parent/expanded gates and original-survey/
  immutable-revision/pin acceptance are not certified. Parent report and handoff
  remain untouched, including their historical pending-verification statements.
- Completion describes only this final light B5 code-quality verification, not
  parent completion. No old-review restart or broader correction authorized.
