---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T013321Z-welfare-type-fix
status: completed
updated: 2026-11-12T02:20:23Z
owner: cg-testing independent B3 data-risk review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator to triage P2.TEST.1 within B3; retain separate manual B4 blocker and failed integration gate without waiver.
---

## Summary
Independent B3 testing/data-risk review completed with one P2 test-harness finding below. No supported source defect found in R/pd_process_data.R:321-324. Scope is only the new public regression and four-line source delta against w15/baseline, not the closed context/B2 changes. No R, tests, scripts or implementation executed. Final evidence is NOT all-green; saved-field success does not establish successful public return or complete-parent/survey acceptance.

## Changes
Only this assigned report is created/updated. Closed context/B2 changes and protected artifacts remain untouched.

## Findings

**[P2]** `tests/testthat/test-public-clean-welfare-type.R:107-111` -- Observation can replace the original processing error. **P2.TEST.1 [safe_auto]**

**Issue**: The generic error handler invokes `check_saved_boundary()` before `stop(error)`. If processing fails before publishing the first master, the observer's real `pip_read("pip_master_inventory", ...)` at lines 94-95 raises a missing-artifact error; `stop(error)` is never reached. The public reader explicitly aborts on zero versions (`pipload/R/pip_read-write.R:92-96`). Read failure of a damaged clean artifact has the same effect. This violates the stated original-condition preservation property and obscures the actual regression cause. It does not turn failures into passes. In the recorded late B4 cases both reads succeed, so those logs retain the original B4 error correctly; the finding does not invalidate their observed welfare assertions.

**Fix**: Guarantee rethrow of the same original condition even if durable-boundary observation itself errors, preserving that observation error as an additional diagnostic rather than replacing the cause. Add a focused observer check using an original sentinel condition and an absent/unreadable boundary, asserting that original condition survives. Keep both actual public scenarios, their real workers/readbacks, and their failing no-error requirement unchanged; do not catch B4 as success or replace master/worker behavior. Suggested correction only; no implementation or execution performed in this review.

## Checks run
- Read review brief, run handoff, complete new test (actual 124 lines), relevant clean worker/callers, validator and exact output-ID set checks. Read shared fixtures as input context, without reopening their closed review scope.
- Read-only Git confirms existing PROD HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40. `git diff --no-index` versus w15/baseline/R/pd_process_data.R shows only the four projection lines; the test is absent from baseline. Both scoped current files compare content-equal to candidate-final through read-only Git. No cryptographic hash recomputation claimed.
- New source applies `vapply(..., attr, character(1L), exact = TRUE)` after the invariant/receipt join, using an exact matching artifact ID. `.validate_clean_survey` requires scalar income/consumption before saving (R/pd_dlw_clean.R:665-672); output-set checking precedes the projection. No raw inventory fallback, ID-text welfare inference, worker replacement, new catch or key weakening observed.
- Tests exercise public setup, exported CPI/PPP/PFW producers, DLW acquisition/validation and `pipdata::pd_process_data`. Substitutions are at remote transport boundaries; declared country/pop/GDP/PCE supporting fixtures are real saved inputs. No fake stored master, clean worker replacement or `.pipaux` seeding. Cached auxiliary release is observed, not overwritten. Deferred environment/options cleanup and copied caller inventory support isolation; no stochastic estimation is involved.
- Absent and conflicting (`consumption`) inventory scenarios demand literal `income`, grounded in declared PFW datatype I and trusted clean validation, not computed from the implementation under test. Actual saved master and pinned clean artifact are loaded at test lines 94-99, with caller input equality at line 100. The clean attribute and master field must both be scalar `income`. The strict dependency condition is only captured to fail `expect_false(inherits(processed, "condition"))`; it is not accepted as success.
- Read proof.R/proof.log: baseline passive exit observation compares installed clean worker with baseline, observes PFW/clean/metadata income and omitted receipt/master welfare_type. The diagnostic trace does not replace the worker and is absent from the new tests. Binary RDS/QS2 artifacts were not decoded in this review.
- Inspected check.R and run.ps1 without running either: final red explicitly selects baseline-library; installed worker body is compared against selected snapshot; all four preserved file hashes are checked and pre/post test manifests retained. E: child temp/home/cache/library/store redirection is explicit. No original/full survey execution or dirty-tree install performed by this reviewer.
- Frozen final evidence inspected: red-final.log:45-92 has 2 blocks/8 passes/4 intended assertion failures/0 errors/0 skips (two missing master fields and two no-error failures). green-final.log:45-100 has 2 blocks/10 passes/0 assertion failures/2 late B4 errors/0 skips. affected-final.log:63-125 retains 132 blocks/626 passes/0 assertion failures/2 B4 errors/0 skips; old context/B2 selection remains passing. Successful-public-return assertion at test line 115 is NOT reached in candidate or affected final runs.
- Final source manifest records source a5b7bac456507fb9cc2aa1c4dae17ff1813bdf7862ed3bbe2de9dea624d0cb1c and test 2d9f59fd3c602f8c481c93b9f229de6a84bb7cfa5741d4c0bdc14890bb1de503. All three final test-manifest entries agree. Earlier b0289f19 test hashes are historical, not final proof; PRE-B3 baseline manifests are not current authority.
- Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable, cg-skill-r-testing and cg-skill-r-analytical; read test-integrity reference. Minimal first: bounded correction recommendation, no new dependency/infrastructure or out-of-scope fix; only functional proof of the stated observer behavior recommended. Safeguards reserved for almost-irreversible failures; no Plan required.
- Initial `Get-Date -AsUTC` was unsupported in PowerShell 5.1; read-only `(Get-Date).ToUniversalTime()` provided the UTC completion timestamp. This was not a test failure or write operation.

## Gaps
- **P2.TEST.1 remains unimplemented/unexecuted**: no adversarial observer-error check is present in the reviewed new test. The source/control-flow evidence supports the masking finding; no runtime reproduction is claimed.
- **Separate existing B4 manual blocker**: unchanged R/pd_metadata_refresh.R:63-67,101-103 passes unsupported `alias` and positional pip_id to `pipload::load_pip_data`; its public signature uses country_code first, explicit id_name and metadata, with no alias/dots. Final candidate and affected runs have two real errors. No out-of-scope callsite/other-package fix, catch, test weakening, waiver or all-green claim is requested or authorized here.
- Real saved clean/master field assertions passing do not prove complete metadata, complete parents or survey acceptance. No complete current-parents.rds or new expanded gate was supplied; historical expanded/B2 evidence is not B3 acceptance.
- Review is source and retained text-evidence inspection only, not independently executed test proof, binary decoding, whole-package coverage audit or exhaustive OS write audit. get_errors/execution_subagent are unavailable; no fabricated Problems/Pester/full-package results. Only the assigned E: report was written; protected artifacts, original Plan/pins and historical reports remain unchanged.
