---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T025013Z-metadata-loader-fix
status: completed
updated: 2026-11-12T13:03:48Z
owner: cg-version-control independent B4 reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator retains OPEN/manual B5 and real second-public-path gaps; this completed review does not authorize implementation or acceptance.
---

# Independent B4 version-control and provenance review

## Summary
No new supported P0-P3 version-control/provenance issue in R/pd_metadata_refresh.R, tests/testthat/test-pd-metadata-refresh.R, tests/testthat/test-pd_process_data.R, or tests/testthat/test-public-metadata-loader.R relative to m17/baseline. Existing PROD/full expected HEAD verified. Review completion is not public-workflow acceptance: final affected evidence remains 146 blocks/671 passes/3 B5 errors, NOT green.

## Changes
Only this assigned report is created or changed by this reviewer. No implementation, Git mutation, pin change, other-package change, protected artifact change, script/test/R execution, downloads, or environment switch.

## Checks run
- Read review-brief.md and current B4 handoff. Loaded clear-technical-communication, R technical/data.table/testing, and Git workflow skills; consulted renv conventions without running renv.
- Read-only Git status/branch/full HEAD, frozen-tree and manifest comparisons, and independent SHA256 hashing completed.
- Current candidate-verified manifest: 252 listed files rehashed, zero mismatches. All ten checkout source/test files equal corresponding frozen files.
- Full frozen baseline-to-candidate-verified tree comparison changes exactly the four B4 files named above; full manifest diff changes exactly those three existing entries plus the one new public test. No dependency descriptor, lockfile, other-package source, or preserved source/test entry is added to that delta. Git reports seven tracked modifications plus three untracked public tests: six prior context/B2/B3 files and four B4 files, not four changes relative to Git HEAD.
- Git no-index comparison with default checkout conversion shows 158 insertions/24 deletions. Disabling autocrlf exposes existing CRLF/LF differences within the same three changed files; these are not extra files or evidence of unrelated source logic. Inspected substantive diffs with --ignore-space-at-eol. No line-ending rewrite was performed.
- R/pd_metadata_refresh.R:64-68,101-104 changes only explicit id_name, exact unchanged version expressions, and metadata FALSE/TRUE; removed unsupported alias. Existing hash checks and strict fence unchanged. Unit/adapter changes align reader requests and retain existing field/error checks. New real regression:94-98 passively observes the exported loader without substituting its result; second phase is written at107-123 but not reached.
- install.R:10-24 constructs candidate-verified from baseline plus exactly four owned files and hashes it; install-verified.log:1,22-25 records that frozen source and successful package loads. Its CSS-copy warning:16-19 is retained, not hidden. check.R:9-29 selects explicit old baseline-library for red-verified and checks installed worker bodies against the selected snapshot. affected-verified.log:1 confirms final installed workers match candidate-verified.
- Current authority is candidate-verified/ with logs/candidate-verified-source-sha256.tsv. candidate-first and candidate are intermediate historical snapshots, not final authority. Complete manifest comparisons show candidate-first -> candidate changes source and public-test entries; candidate -> candidate-verified changes only adapter-test entry. Historical manifests were not rewritten.
- Independently hashed all six preserved checkout files and their frozen counterparts; they equal baseline manifest authority and the review handoff's expected hashes (table below). Independently hashed all four B4 checkout/frozen files; they equal current manifest authority (table below).
- red-verified-test-sha256.tsv and affected-verified-test-sha256.tsv are byte-identical SHA256 c1821d831697cea1ac6f61cc3b38c501240b16190717188eba5362120c9d979b. These complete test manifests establish the same recorded test payload across frozen red and final affected runs; they do not turn red into green.
- pins.tsv equals retained w16/logs/pins.tsv byte-for-byte (SHA256 5903d43eca50cdb1e9e781811773fd124afc061451821021bd7b9e2042ff7acb). dependencies.tsv likewise equals w16 (32b889f38f0b7f6633f1a38fd1acd40dad70afb6ff830b5138b02904febe6369). No dependency/renv command executed or new pin proposed.
- proof.log:1,17-18,38-50 records installed public loader equality to pinned source, country_code-first signature, explicit ID/version, metadata default FALSE, and no alias/dots. This is retained execution evidence, not an independently rerun body comparison.
- Inspected actual test logs: red-verified.log:87-88 is 13 blocks/25 passes/0 assertion failures/5 old alias errors/0 skips, explicitly RED; metadata-unit.log:7 is 12/37/0 failures/errors/skips on intermediate candidate (the metadata source/unit hashes remain identical in final candidate); public-final.log:59 is 1/5/0 failures/1 error/0 skips, not success. affected-verified.log:104-184 retains all three stale-snapshot errors;187-189 reports 146/671/0 failures/3 errors/0 skips and halts. No narrowed green replacement.
- diagnose.log:31-42 records identical contexts, zero differing component hashes, and only the secondary index [stage] difference. first-untraced.log:55,85,115 reproduces two stale-snapshot errors without new loader tracing. These historical first-call-only runs do not prove the second public callsite executed.
- Final read-only Git status/full HEAD unchanged from first inspection. UTC timestamps obtained from local machine clock; local zone Eastern Standard Time (EST at inspection). No timestamp guessed.

## SHA256 identity

All rows below independently hash-identical between current checkout and candidate-verified. First six also match preserved baseline authority; last four match current B4 manifest.

| File | SHA256 |
| --- | --- |
| R/dependency_contract.R | 62922a9b60c893f79e033b9d808411bdedacdcb754663a9be3deb7860e2372ea |
| R/reconcile_pip_inventory.R | 1ee2cae8c9092e552736978ed51cdedf3e8c7a4c45b4fa026bbfe1e9dedd8bc4 |
| R/pd_process_data.R | a5b7bac456507fb9cc2aa1c4dae17ff1813bdf7862ed3bbe2de9dea624d0cb1c |
| tests/testthat/test-public-working-release-context.R | 478fce6684831c75bf4e49273d7e7b078db45ae9c002c264c5ed6e7c9f625f71 |
| tests/testthat/test-reconcile-pip-inventory.R | 1e06152afe935b05afd4cb8dd3ea461a85f4f13e4b29a8a81220b014b906b431 |
| tests/testthat/test-public-clean-welfare-type.R | 02b32c0f2559862a582ec115c9c652324d2b0c2c645951f5bba643594e179006 |
| R/pd_metadata_refresh.R | b746cdd5f751e37f5be1b395c7c419765ac727b5d8d1b2f61ec78d5adc3a74cd |
| tests/testthat/test-pd-metadata-refresh.R | 855333782ca84ce9cccc9a8b76ca44ed561d6a16c5237b65f484eb67a661c999 |
| tests/testthat/test-pd_process_data.R | b5f6b490d2cfc34f472f3bf5716184ee32ee1857eef10f89f747309ac1909513 |
| tests/testthat/test-public-metadata-loader.R | 2cf0311e032ea9154da97671b9e09b9e4144e6337cf67549d7feb2fcc91998ff |

## Findings

No new supported P0-P3 issues in the four named B4 files within this version-control/provenance review. No credential, PII, large-binary, dependency-lock or unrelated-change addition observed in this bounded delta. Existing PROD is the explicitly required branch; no feature-branch recommendation or Git operation is imposed. Prior reviews are not reopened.

## Gaps
- B5 remains OPEN/manual at R/dependency_execution.R:945-949; final affected run is 146 blocks/671 passes/0 assertion failures/3 errors/0 skips, NOT green. Remedy/acceptance requires a separately authorized B5 investigation; no strict-fence relaxation, index-option workaround, waiver or implementation is performed or authorized here.
- Real second metadata-only public read/version-kind proof and post-return/publication assertions remain blocked at test-public-metadata-loader.R:98 before113. Passing executable unit contracts do not establish real public refresh, complete-parent, expanded-gate or original-survey acceptance. Retain this gap until actual public execution reaches and verifies both phases.
- Source/log/hash review only: no R, scripts or tests executed, no RDS binary decoding, no get_errors/execution_subagent result invented. Installed body equality and recorded test outcomes rely on retained logs/harness inspection, not independent reruns.
- Full 252-entry current frozen manifest rehashed, but no exhaustive all-package/OS-write audit or Git-history investigation. Pin/dependency manifest preservation is verified, not a blanket assertion that every external repository was audited. Reviewer's only direct filesystem write is this assigned E: report; automatic Kilo runtime files are outside this direct-write claim.
- Minimal first applied: bounded review and one report, no extra safeguards, dependencies, Plans, branch creation, refactoring, protected-artifact cleanup or changes to prior reports. Existing implementation/pins/other packages remain untouched by this reviewer.
