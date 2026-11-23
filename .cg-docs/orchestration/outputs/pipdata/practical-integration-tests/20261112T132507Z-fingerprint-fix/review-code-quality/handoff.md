---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T132507Z-fingerprint-fix
status: completed
updated: 2026-11-12T15:43:10Z
owner: cg-code-quality independent B5 reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator consumes this completed B5 review; B6 remains OPEN/manual, with no planner or fence workaround authorized.
---

# Independent NEW B5 Code-Quality Review

## Summary
Completed independent review: **no supported new P0-P3 issues found** in the
three-file NEW B5 delta against f19/baseline:
R/dependency_execution.R, tests/testthat/test-fingerprint-fence.R, and the necessary
retained tests/testthat/test-public-metadata-loader.R fixture/observer repair.
Both guards retain strict context and substantive fingerprint comparison while
ignoring only secondary indices on copied components tables. This conclusion is
bounded source review, not parent-task completion or all-green acceptance.

## Findings
No issues found in this named B5 delta. No safe_auto change proposed. Existing B6
is retained below as an OPEN/manual acceptance gap, not attributed to this local
normalizer without evidence and not a request to implement an out-of-scope fix.

- R/dependency_execution.R:945-952: one shared helper uses data.table::copy before
  setindexv(NULL), so the original reference-backed table is not stripped of its
  indices. It does not reorder rows/columns, coerce class, drop hashes/audit, or
  recalculate fingerprint content. Non-data.table components are not normalized.
- R/dependency_execution.R:954-997 and 1100-1127: both comparisons use that helper
  on current and frozen objects. The context OR short-circuit and stale condition
  class remain unchanged. Exact catalog/version/content checks remain after the
  first comparison; real lease/manifest-parent checks remain on refresh. The
  outer write fence still invokes lease assertion, revalidation and manifest
  identity checks at1182-1192. No global auto-index setting or error acceptance.
- Caller/producer context: stage lookup at900-903 can introduce an index into
  frozen components. R/code_fingerprint.R:44-94 returns summary/components/audit,
  all still included in identical(). Refresh invokes its fence before rebuilding
  facts at dependency_execution.R:504-505. No provider/worker replacement added.
- test-fingerprint-fence.R:1-45 uses exported TEST setup, real context/code
  fingerprints/aux catalog, real lease, and real absent-manifest state. Scoped
  transport fixtures do not replace the fingerprint provider. Lines55-67 prove
  both index-only acceptance and frozen-object/index immutability. Lines69-99
  reject a real configured dependency_scope change, component identity,
  membership, class, component/summary hash and audit version through BOTH fences.
  Deliberate changed snapshots are copies, not stored masters. No new skip or
  expected-failure weakening.
- test-public-metadata-loader.R:83-103,114-124: observer records only; identical
  ID/NULL-country/kind/version expectations now run after calls, outside worker
  error handling. The original full-request, pin, exact historical metadata,
  welfare and caller-immutability assertions remain. metadata=TRUE remains
  mandatory for the second request; it is not changed to match observed FALSE.
  Lines108-111 correct the fixture to cpi2017 and gh$gh_raw_sha, matching the
  declared helper-one-survey-upstream-acceptance.R:134-145,178-181 schema. No
  producer/worker result was substituted and no old review was restarted.

## Changes
Only this assigned report created. No R, scripts, tests, implementation, Git,
Plan, pins or protected artifacts changed. All direct report writes are on E:.
Initial running checkpoint was saved here before finalization. Prior pending
production changes and historical evidence were read only as bounded context.
Minimal first applied: no additional implementation, dependencies, safeguards,
Plan, branch or review scope was introduced.

## Checks run
### Independently performed
- Read review-brief.md and current parent handoff, loaded communication,
  Rtechnical, Rtesting/test-integrity, datatable, Rshared and Rcollapse skills.
  Root compound-gpid.local.md was absent; router/default data.table-collapse
  applies. No dialect override was invented.
- Read-only git rev-parse HEAD / branch --show-current verified the recorded
  full HEAD and PROD. git diff --no-index compared both existing scoped files
  directly against f19/baseline; the new 99-line fence test was read in full.
  No-index exit1 indicates expected differences, not an execution failure.
- Get-FileHash independently verified all three checkout files AND their frozen
  candidate-reviewed counterparts against the brief's SHA256 values:
  source 4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02;
  new test b4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57;
  retained test f9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44.
- Scoped git diff --check passed; LF/CRLF advisories are not source changes.
  E: output parent existence checked before this report was created. Clock and
  local time zone read; machine-readable report timestamps remain UTC.

### Retained evidence inspected, NOT rerun
All paths below are under
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/f19/.
- logs/proof.log:29-51: final installed B4 first actual fence has identical
  context, zero component hash differences, only stage index mismatch; copies
  become identical after only index removal, while actual old fence rejects.
- logs/diagnose-refresh.log:35-65: actual second-phase old raw guard rejects;
  captured context identical, same stage-index-only difference and equality
  after removal from copies. Historical candidate-final, not current success.
- logs/red-final.log:7-19: explicit original B4 installation, four blocks,
  18 passes/two intended stale-snapshot failures/zero errors/skips, one failure
  for each fence. Genuine-change controls pass on that old fence.
- logs/both-green.log:4-7: four blocks/20 passes/zero failures/errors/skips.
  Candidate-both scope; current affected-reviewed log also shows all20 passing.
- logs/code-reviewed.log:4-7: 12 blocks/51 passes/zero failures/errors/skips.
- logs/public-reviewed.log:77-115: four blocks/31 passes/three failures/zero
  test errors/skips. Second request fails metadata kind, prior metadata version,
  and full equality. Preserved B3 public cases have14 passing assertions.
- logs/affected-reviewed.log:108-144: 150 blocks/705 passes/three same selection
  failures/zero test errors/skips; explicit failed-check exit retained. NOT GREEN.
- logs/diagnose-selection.log:52-75: observed second action reconstruct TRUE,
  aux_cpi_changed + output_missing, metadata pin/hash NA and clean output_drift.
  Earlier observer muffle_expectation error at110-120 is historical evidence,
  not current test status. Current observer repair exposes honest assertions.
- check.R was read, not run: explicit red-final baseline-library, frozen first
  fence body comparison, nine preserved-file hash assertions, test hash-before/
  after check, and failure-sensitive summary. Its body check names only the first
  fence; source hash equality plus both-fence tests are additional scoped evidence,
  not a claim of independently re-executed installed second-body equivalence.

## Gaps
- B6 OPEN/manual: second real public request still uses metadata=FALSE and clean
  version instead of metadata=TRUE/prior metadata version. Public4/31/3 failures
  and affected150/705/3 failures, zero test errors/skips, are NOT green.
- Actual successful metadata-only TRUE path remains unexecuted/uncertified.
- Retained logs are not fresh execution; no RDS decoding, full-survey, expanded
  suite or complete-parent acceptance. No original-survey acceptance or waiver.
- No R/scripts/tests/install/linter execution, get_errors/execution_subagent,
  exhaustive OS-write audit, or all-package/Git-tree audit performed. This review
  verifies three hashes, not every historical pending-file claim independently.
- B6 cause/remedy remains unproved at planner/output-receipt consistency level.
  No planner change, forced metadata worker, fence deletion, global index option,
  fabricated parent/master, historical catalog repair, or other-package edit is
  authorized by this report. Existing strong assertions must remain.
- Report completion means only this independent review is complete. Coordinator
  integration/final verification and conditional parent/expanded gates are not
  certified here. No new execution session or worktree was started.
