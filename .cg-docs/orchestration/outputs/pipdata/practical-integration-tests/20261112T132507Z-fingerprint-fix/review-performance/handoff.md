---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T132507Z-fingerprint-fix
status: completed
updated: 2026-11-12T15:42:55Z
completed: 2026-11-12T15:42:55Z
owner: cg-performance independent NEW B5 review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Review complete; retain B6 manual acceptance blocker for coordinator, with no implementation authorized here.
---

# B5 Independent Performance Review

## Summary
No supported new P0-P3 performance issues found in the named B5 delta: R/dependency_execution.R, tests/testthat/test-fingerprint-fence.R, and retained tests/testthat/test-public-metadata-loader.R, against f19/baseline. Both fences use the same helper; its deep copy is confined to fingerprint components, not survey data. Review is not public-path acceptance: B6 metadata-only selection still fails three assertions.

## Findings
- R/dependency_execution.R:945-951 deep-copies only x$components when it is a data.table, then removes only its secondary indices. The helper receives the fingerprint list, NOT the full snapshot/execution. Its other fields remain part of identical(); no whole survey, inventory, master, auxiliary payload or snapshot is deep-copied by this change.
- R/code_fingerprint.R:1-37,44-93 establishes the caller contract: components contain stage/component/hash rows for declared code/constants/external functions/recode specification, with separate stage summaries and package-version audit. Copy work scales with this small code-fingerprint table, not observation count. Numeric memory/time impact is UNKNOWN (not measured); no evidence warrants speculative caching, pooling or broader optimization.
- R/dependency_execution.R:954-959 and1100-1112 use the SAME pd_fingerprint_values helper on current and frozen fingerprints. Context OR short-circuit, error class, catalog/version/hash validation954-996, lease assertion1105 and manifest identity1114-1124 remain unchanged. There is no new global index-disable option or in-place removal of the frozen snapshot's index. The existing stage lookup900-903 is not changed or disabled.
- tests/testthat/test-fingerprint-fence.R:55-98 adds index-only acceptance and complete snapshot/index immutability checks, plus both-fence rejection controls for genuine context/component membership/name/class/component hash/summary hash/audit changes. Deep copies59,78-96 are bounded synthetic fingerprint/catalog fixtures, not survey payload copies.
- tests/testthat/test-public-metadata-loader.R:83-92,101,107-117 repairs the declared CPI fields/provenance marker and moves ID/country/kind/version expectations outside a passive observer. The observer now records four selector values and no longer reads the master on every loader entry. Existing survey copies in fixture setup are baseline behavior, not introduced by B5. Exact full-request, version-pin, welfare and caller-immutability checks remain118-124. No producer or worker return is substituted by this delta.

No finding requiring safe_auto, manual or advisory remediation is raised in this delta. B6 below is a retained manual acceptance blocker, not a newly attributed B5 performance defect.

## Changes
Only this assigned report created. No implementation, R, scripts, tests, benchmarks, Git mutation, protected-artifact change, or old-review restart.
Minimal first applied: bounded functional correction reviewed without proposing dependencies, new safeguards, benchmarks or implementation work.

## Checks run
- Read review-brief.md and compared dependency_execution.R and retained public test against f19/baseline; inspected all 99 lines of new fingerprint test.
- Confirmed existing PROD/full HEAD; three checkout SHA256 values match brief and files compare equal to candidate-reviewed.
- Inspected producer shape, both fences, retained proof/refresh/selection/public logs and bounded result summaries.
- Read-only Git comparisons to candidate-reviewed emitted no differences for all three files; source and retained-test baseline diff whitespace checks passed with process-local core.whitespace=cr-at-eol, no Git config change. New test fully read; no baseline file exists for that addition.
- Independent SHA256: source 4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02; new test b4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57; retained test f9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44. All match brief authority.
- Retained f19/logs/proof.log:29-51 and diagnose-refresh.log:48-65 report equal contexts and complete object equality after only copied-components index removal at each actual fence. This is inspected historical execution evidence, not a new reviewer run.
- Retained red-final.log:7-19: 4 blocks/18 passes/2 intended index-only failures/0 errors/skips on explicit baseline. both-green.log:4-7: 4/20/0 failures/errors/skips. code-reviewed.log:4-7: 12/51/0 failures/errors/skips. These support functional behavior, not measured speed.
- Retained public-reviewed.log:80-115: 4/31/3 assertion failures/0 errors/skips; affected-reviewed.log:109-144: 150/705/3 assertion failures/0 errors/skips. Both are NOT GREEN. diagnose-selection.log:52-75 shows aux_cpi_changed + output_missing, reconstruct TRUE and metadata pin/hash NA; no metadata-only TRUE execution certified.
- Loaded communication, R technical, data.table and R testing skills. pipdata root config absent; read adjacent pipsystem config (data.table-collapse) without treating it as pipdata configuration authority. Get-Date/Get-TimeZone confirm timestamp uses UTC metadata, with local Eastern Standard Time. All reviewer-controlled writes confined to this E: report through apply_patch; no processes capable of test/cache output started.

## Evidence paths
Runtime/log root: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/f19. Scoped authority: candidate-reviewed and logs/reviewed-candidate-source-sha256.tsv. Baseline is copied final B4 source, not Git HEAD alone. Earlier candidate/final/both scopes were not substituted for reviewed-candidate authority.

## Checks not run
No R, scripts, tests, benchmarks, installation, implementation or binary RDS decoding. Runtime latency/peak allocation and exhaustive host write tracing are UNKNOWN. No get_errors or execution_subagent result fabricated. No original full survey, parent completeness or expanded acceptance run.

## Gaps
- B6 OPEN/manual: retained second request selects metadata FALSE and clean pin instead of TRUE and old metadata pin; three failures remain, not acceptance.
- No fresh execution, benchmark, binary evidence decoding, exhaustive OS-write audit, current-parent/expanded or original-survey certification.
- pipdata root compound-gpid.local.md is absent; review limited to named B5 delta, not prior pending fixes or a fresh whole-package provenance audit. Protected artifacts, Plan, pins, branch and prior reports left untouched.
