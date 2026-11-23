---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T132507Z-fingerprint-fix
status: completed
updated: 2026-11-12T15:43:08Z
owner: cg-architecture independent B5 reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator incorporates this bounded B5 review; retain B6 manual blocker and second-path acceptance gap without planner changes under B5.
---

# Independent NEW B5 architecture review

## Summary
Completed independent review: **no supported new P0-P3 architecture issues found in
the named three-file B5 delta against f19/baseline**. The shared index-only
normalizer is appropriately local to comparison; both guard boundaries still
compare complete fingerprints and context. No extra worker abstraction or bypass
was introduced. B6 remains OPEN/manual; this is not all-green parent acceptance.

## Changes
- Review report only; no implementation, R, scripts, tests, Git or protected artifacts changed.
- Scope: R/dependency_execution.R; tests/testthat/test-fingerprint-fence.R;
  tests/testthat/test-public-metadata-loader.R. Prior fixes/reviews are closed.
- Smallest complete correction: one eight-line internal helper shared at the two
  existing comparisons, rather than global indexing policy, schema projection,
  worker replacement or new execution layer. No package/file restructuring is
  warranted for this bounded fix; splitting the pre-existing long execution module
  is outside this delta, not a new finding.

## Findings and architecture evidence
- **No issues found in R/dependency_execution.R:945-959,1100-1126.** The helper
  copies only a data.table components member before setindexv(NULL); it returns
  the remaining object intact. It neither converts a changed class back to the
  expected class nor sorts/drops component rows, columns, hashes or audit fields.
  Ordinary list replacement and the explicit table copy isolate the stored
  snapshot from by-reference index mutation. Both old/current sides receive the
  same normalization; context OR short-circuit and stale error class remain.
- **No issues found in the boundary integration.** Exact path/version/content_hash
  catalog checks and the existing advanced-receipt historical-version condition
  remain unchanged at dependency_execution.R:961-995. The normal write fence
  still asserts lease, revalidates snapshot/catalog and checks manifest identity
  at1182-1192. Refresh still asserts lease and manifest identity at1105-1126;
  its existing fallback delegates to the full fence at1101-1103. Refresh never
  had the full catalog loop in this baseline; B5 does not remove or relocate one.
  pd_refresh_execution_facts:504 fences before rebuilding facts/plan; metadata
  publication still fences before pd_save_receipt (pd_metadata_refresh.R:124-126).
  Checkpoint integration still fences and revalidates receipts/provenance
  (dependency_manifest.R:445-477). These caller reads establish integration only,
  not a reopened review of their earlier fixes.
- **No issues found in test-fingerprint-fence.R:1-99.** Exported TEST release setup
  supplies actual context, code fingerprints, catalog, lease and manifest absence;
  only GitHub transport inputs are fixtures. Providers/guards/workers are not
  substituted. The index-positive case calls both guards and checks original
  snapshot/index immutability. Both guards reject changed configured context,
  component identity/membership/class, component/summary hashes and audit version.
  Corrupt copies are deliberate negative controls, not stored master fabrication.
- **No issues found in retained test-public-metadata-loader.R delta:83-117.**
  Loader trace now only records arguments; identical ID/NULL-country/kind/version
  expectations execute after the calls, outside worker error handlers. Full
  request equality and prior old-pin, welfare and caller-immutability assertions
  remain at102-124. The corrected cpi2017 and gh$gh_raw_sha fixture inputs drive
  the real aux_cpi producer; no worker result or planner choice is forced. The
  strict second metadata=TRUE/prior metadata pin expectations still fail honestly.

## Checks run
- Loaded required communication, R technical, data.table and R testing skills.
- Read brief, scoped baseline diffs, source and retained proof/red/green/affected logs.
- Verified existing PROD/full HEAD and independently recomputed the three scoped
  SHA256 hashes, matching the review brief.
- Source SHA256: 4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02;
  new test: b4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57;
  retained test: f9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44.
- Read-only Git no-index source/retained-test diffs against f19/baseline show
  precisely the helper/two comparisons and fixture/observer repairs above.
  Bounded whitespace checks with command-local core.whitespace=cr-at-eol report
  no errors; Git emits only line-ending advisories. No Git configuration changed.
- Retained f19/logs/proof.log:29-51 proves the live baseline first fence rejected
  identical context/no changed component hashes, with full equality after index
  removal only. diagnose-refresh.log:48-65 establishes the same actual refresh
  mismatch. These are inspected prior execution records, not new execution.
- red-final.log:18-19: 4 blocks/18 passes/2 intended index assertion failures,
  zero errors/skips; genuine-change controls pass on the old package.
  both-green.log:7: 4/20, zero failures/errors/skips. Current affected-reviewed
  includes the same 20-positive assertions; code-reviewed.log:7 reports 12/51,
  including real function/constant producer changes.
- public-reviewed.log:79-115: 4 blocks/31 passes/3 assertion failures/0 errors/
  skips. affected-reviewed.log:109-143: 150 blocks/705 passes/3 assertion failures/
  0 errors/skips, explicitly NOT GREEN. Both public calls return, but the second
  chooses clean metadata=FALSE and clean version, not the requested TRUE/old pin.
- diagnose-selection.log:52-75 observes actual aux_cpi_changed + output_missing,
  reconstruct_base_metadata=TRUE, missing metadata pin/hash and clean output_drift.
  Source check.R was read (not run): baseline red-final uses explicit old package;
  frozen-source selection and test hashes are checked; failed candidate assertions
  cause a nonzero final check rather than acceptance.
- Verified report parent is an E: directory without a reported reparse target;
  only this assigned report was created/checkpointed/finalized through apply_patch.
  Minimal first observed: no extra safeguards/dependencies or Plan; existing
  red/green functional evidence is the check, not a new validation framework.

## Gaps
- B6 remains OPEN/manual: actual second metadata-only TRUE path is not certified;
  affected-reviewed is 150 blocks/705 passes/3 assertion failures, NOT green.
- Read-only review only: no R/scripts/tests executed, binary evidence decoded or
  complete-parent/expanded/original-survey acceptance established.
- Unit controls cover manifest absence and real lease acquisition, not new active
  manifest-change/catalog-drift/lease-loss integration executions. Preservation of
  those checks is established by unchanged source/caller review, not fresh dynamic
  coverage. No exhaustive platform write audit, get_errors or execution_subagent
  result is claimed; those facilities are unavailable.
- Nine prior pending files were not broadly re-reviewed/rehashed here. This review
  is only the new three-file delta, not full-package or earlier-fix certification.
- No planner/output-receipt diagnosis or remedy is implemented/requested under B5;
  B6 and the real metadata-only TRUE path require their separately scoped work.
