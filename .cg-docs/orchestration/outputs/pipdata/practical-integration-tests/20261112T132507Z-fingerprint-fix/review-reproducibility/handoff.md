---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T132507Z-fingerprint-fix
status: completed
updated: 2026-11-12T15:43:03Z
owner: cg-reproducibility independent B5 reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator consumes this completed scoped review; B6 remains OPEN/manual and parent/expanded acceptance remains pending.
---

# Independent B5 reproducibility review

## Summary
Completed independent review: **no supported new P0-P3 reproducibility issues found in the named three-file B5 delta**. The index-only correction is supported by fresh final-installed B4 live evidence, not assumed m18 memory. This is not package or parent acceptance. Affected-reviewed is NOT GREEN: 150 blocks, 705 passes, three assertion failures, zero errors/skips. B6 metadata-only selection remains OPEN/manual.

## Changes
Only this assigned report created. No R, scripts, tests, implementation, Git mutation or protected artifacts changed. Review scope: R/dependency_execution.R, tests/testthat/test-fingerprint-fence.R, and the explicit retained tests/testthat/test-public-metadata-loader.R repair; prior reviews remain closed.

## Checks run
- Loaded communication, R technical, data.table and R testing skills. Applied minimal-first: bounded read-only review, no extra scaffolding, dependency or safeguard.
- Verified PROD/full expected HEAD and freshly recomputed SHA256 of all three checkout files and their candidate-reviewed copies. All match the brief: source 4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02; new test b4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57; retained test f9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44.
- Read f19 proof/install/check/redirect harnesses and actual proof.log, diagnose-refresh.log, diagnose-selection.log and reviewed install log. Compared retained test against baseline; assertions move outside worker trace and remain strict.
- Reviewed shared helper and both guards, exact catalog/version checks, lease/manifest checks, real-fixture positive and genuine-change negative controls. No index/global option workaround or production snapshot mutation.
- Complete baseline-to-candidate-reviewed tree diff names exactly the three scoped files (125 insertions/14 deletions). Fresh SHA256 comparisons show all nine preserved earlier files byte-identical across checkout, baseline and candidate-reviewed. Baseline source and retained test hashes also match m18/candidate, respectively 49656aabae806fa31803b503260cca7eb149e8802d297fecdd62ef7b0d7fc124 and 2cf0311e032ea9154da97671b9e09b9e4144e6337cf67549d7feb2fcc91998ff. Old retained fixture/observer source is not overwritten.
- Current source authority is f19/logs/reviewed-candidate-source-sha256.tsv:144,219,246 and candidate-reviewed, not earlier candidate/candidate-final/candidate-both. install.R:7-30 copies the frozen B4 baseline, overlays only three owned files, hashes unchanged content and installs that snapshot. install-reviewed.log:9-25 records successful staged installation and a nonfatal missing R.css warning. Child-startup.log:31-36 records reviewed snapshot install and load-check children on E:. check.R:28-34 validates installed pd_revalidate_snapshot formals/body against that snapshot; this is not an independent installed check of every function.
- Fresh final B4 proof: proof.R:43-68 verifies installed old fence body, passively observes the real exported public preparation and saves the actual stale condition/comparison. proof.log:29-51 reports identical context, zero component hash differences, stage index only, and whole-object identity after removing only that index from copies. diagnose-refresh.log:35-65 independently records the same mismatch in the real second-phase refresh guard. Both binary captures remain present under evidence/; no RDS decoding was attempted by this reviewer.
- R/dependency_execution.R:945-959,1100-1126 copies only data.table components before removing secondary indices; both full-object comparisons still reject all remaining differences. Callers at504 and1184 remain intact. New test:55-98 checks both fences, immutability, real supported context change, component identity/membership/class, component and summary hashes, and audit version. No stochastic algorithm or new undeclared dependency introduced; existing qualified data.table/rlang/withr/testthat usage retained.
- Retained test baseline diff keeps strict ID/NULL-country/kind/version expectations, now after real calls (87-92,101,115), plus original full requests, old exact metadata readback, versions, welfare and caller immutability (102-124). Corrected declared CPI input/gh marker only (108-111); observer records but does not substitute loader/worker results. B6 now surfaces as honest assertions rather than an in-worker expectation error.
- Retained evidence: red-final.log:7-19 is 4 blocks/18 passes/two intended index failures/zero errors/skips on explicit baseline-library. both-green.log:1-7 is 4/20/zero failures/errors/skips; code-reviewed.log:1-7 is 12/51/zero failures/errors/skips. affected-reviewed includes the final fence tests and is 150/705/3 failures; public-reviewed is 4/31/3 failures. Preserved B3 cases pass their 14 assertions, not parent acceptance.
- Complete red-final/public-reviewed/affected-reviewed test manifests have identical SHA256 03a62f0633a7116ab5f9c55ad6f76bb9d204d83c620752ff8d523f8afc4f295b. both-green manifest is an earlier historical scope: explicit diff shows ONLY the retained public test changes ce1ef5e... to f9af4798...; fence test is unchanged b4946acc... . Do not call all four complete manifests identical. Earlier logs, failed controls and snapshots remain separately named; review did not replace them.
- E-only execution settings reviewed at run.ps1:11-34: temp/home/profile/cache/library/history/renv/tool output redirects; native private R and QS2 dependencies/pins retained. dependencies.tsv is inherited n11 provenance, not a fresh f19 installed inventory; actual f19 library/temp paths corroborated by current logs. No downloads or ambient install requested by reviewed harnesses. Reviewer executed only read-only Git/hash/clock commands, not those harnesses. Kilo's automatic saved tool-output runtime is an allowed platform exception, not an agent-created C: artifact or exhaustive E-only attestation.

## Gaps
- B6 persists: second request metadata FALSE rather than TRUE, clean version rather than old metadata pin, and full request mismatch. Real metadata-only TRUE path has not been executed/certified. No B6 implementation authorized.
- Evidence for retained B6: affected-reviewed.log:109-144 records those three failures and an unsuccessful check exit. diagnose-selection.log:52-75 records aux_cpi_changed/output_missing, reconstruct TRUE, metadata pin/hash NA and clean output_drift despite earlier publication. This is an existing separate planner/output-receipt consistency blocker, not a new finding attributed to the B5 representation helper. Classification: manual; no waiver or forced worker path recommended.
- Parent/expanded and original survey acceptance remain pending; guard/producer green subsets do not waive them.
- No R/scripts/tests executed or binary RDS independently decoded; retained logs and harness/source review are evidence inspection, not a fresh runtime rerun. No exhaustive OS-write audit or unavailable tooling result claimed. All reviewer-directed writes restricted to this E: report.
