---
schema: pip-handoff-v2
project: pipdata
run: 20261119T151700Z-v3-fixture-diagnosis
status: completed
updated: 2026-11-19T16:27:24Z
owner: Kilo Code
head: 53a76e379c81a3ac70b39925954981ae6a691459
branch: PROD
plan: .cg-docs/plans/2026-11-17-b6-stable-clean-receipt-identity.md revision 2
next: Pipdata receipt-integration maintainer to inspect raw writer and catalog results for one synthetic pfw write under a separate grant.
---

## Summary
Bounded diagnosis complete; V3 remains blocked. The first synthetic auxiliary receipt (`pfw`) fails on both current source and archived HEAD in equivalent fresh settings. The pending aggregate-hash change is not necessary to reproduce that failure. Diagnostic R children: 2/2, no full targeted rerun. V1 and V2 retain their prior passing status.

## Changes
Created this handoff and isolated diagnostic scripts, logs and read-only Git archive evidence under `.tmp/v3-fixture-diagnosis/`. No project source, test, fixture, Plan, dependency pin, prior report or active-state edits; no install, Git mutation, distribution, or production work. Pending work remains in place.

## Checks run
Verified existing pipdata PROD checkout root and full HEAD above, and pipsystem HEAD e9c71e3190f1ce88a017ae25af7c373a64c655a2. Revision 2 canonical validation passed. The resumed handoff and t3 logs record eight auxiliary receipt setup errors, but not the underlying receipt error or condition.

Ran `& .tmp/v3-fixture-diagnosis/run.ps1 current` and `& .tmp/v3-fixture-diagnosis/run.ps1 head`, using installed `C:/Program Files/R/R-4.5.2/bin/Rscript.exe --vanilla`. Both children stopped on the first failed receipt with deliberate diagnostic exit code 10, as recorded in tool output. The helper's unchanged auxiliary setup and its existing Stamp clock mock were used, stopping at the first unsuccessful receipt. No later auxiliary writes or pipeline stages were exercised. The launcher redirected child temp/home/cache/user-library/test-store paths to fresh E: roots and checked path ancestry for reparse points. Logged paths are on E:; the logs are not an exhaustive write audit.

Both children attempted four-row synthetic `pfw` under `c4_aux_fault_matrix`, with Stamp input hash `87c05e3b0df55c40`. Both receipts returned a stage-specific E: `pfw.qs2` path, `version_id = NA_character_`, `content_hash = NA_character_`, `skipped = TRUE`, `success = FALSE`, and exact error `Stamp receipt verification failed.` No condition reached the handler around `pipload::pip_write()`. This does not establish successful persistence, an intentional skip, or the absence of internally handled errors. `pd_save_receipt()` can derive `skipped` from a missing version ID and turns catalog lookup errors into `NULL`.

Source provenance: `git archive` read HEAD into E: scratch without a checkout or Git mutation. HEAD matched before and after, and archived `R/dependency_inputs.R`, `R/save_pip.R`, and `tests/testthat/helper-dependency-fixtures.R` matched their HEAD blob IDs after Git text normalization. Raw archive bytes are separately identified by SHA256 `674FDA88875307A27FBF8AAC983BFD4060B375B9634B9F300FDBDB7F4476EFE3`. Runtime MD5: fixture helper `633006718604d22985b93a5ecef43b3f` and `save_pip.R` `71be6758c0a00b854cedf446b8f2e27d` in both; `dependency_inputs.R` current `17935f1ead34265145fd7046cc5c7e24`, HEAD `9e95bb0f27e6cb3b4c36a9e755943f6c`. Diagnostic script SHA256 `2602F0F00C1F9E7EC911C064704AA27C19A38E4FEF93E711C1A21FE635D00545`; launcher SHA256 `93EB731C9E081390D9FE5022F95D3B33ABED3DAD5961331B4DC08418709483CB`.

Dependency evidence: both stage `stdout.log` files identify the same E: library and matching package-file inventory digests for Stamp 0.0.11, pipload 1.0.0, pipfun 1.0.1, data.table 1.18.4, digest 0.6.39, testthat 3.3.2 and pkgload 1.5.3. Digests summarize relative file names and per-file MD5s, not independent installs or a complete runtime manifest. Raw stage logs are `.tmp/v3-fixture-diagnosis/{current,head}/{stdout,stderr}.log`.

Data-risk review: all eight applicable reviewers completed static review without extra R. The P1 fixture blocker remains open. Report findings addressed by narrowing claims to the first receipt, recording exit status and checking HEAD provenance, and distinguishing matching sampled dependencies from complete environment equivalence. The P2 instrumentation gap is acknowledged below; no third child was run. P3 inventory overhead is noted: the repeated inventories supplied the requested byte comparison; broader inventories are not needed for the next single-boundary check.

## Gaps
V3 BLOCKED. Raw `pip_write()` return and `stamp::st_versions()` result or condition were not captured; the fixture used R's transient directory and did not preserve repository state after exit. The cause, persisted artifact state, and responsible component remain unknown. The smallest next action belongs to pipdata's receipt-integration maintainer: capture the raw writer response and catalog response or original condition for that one `pfw` write, without changing verification or rerunning the suite. If needed, use a persistent isolated E: scratch fixture for that observation. Consult pipload or Stamp only when evidence locates the mismatch at their boundary; Stamp retains rerun authority. No further diagnostic or V3 test is scheduled. P1.4, the 19 historical NOT RUN assertions, and the broader B6 diagnosis remain separate; no Qmd rerun.
