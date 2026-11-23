---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T221501Z-reconcile-fix
status: completed
updated: 2026-11-11T22:34:55Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator integrates this bounded review; light verification and B1 real-parent/expanded gate remain separate.
---

## Summary
No issues found in the new B2 changes in R/reconcile_pip_inventory.R:23-25 and tests/testthat/test-reconcile-pip-inventory.R:77-127. No supported new P0-P3 reproducibility finding. Reviewed mandatory data-risk concerns: fresh-input join correctness, retained typed schema, caller immutability, provenance and installed test identity. This is source/retained-evidence review, not independently executed test proof or survey acceptance.

## Changes
Only this assigned report created/checkpointed/completed. No implementation, R, scripts, tests, installs, downloads, Git mutations or protected-artifact changes. No old context review restarted. Minimal first: the existing three-line initialization and three focused tests suffice for this bounded defect; no added dependencies or speculative safeguards recommended.

## Checks run
### Independent read-only inspection
- Read review-brief.md and this run's handoff.md. Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable, cg-skill-r-testing and its test-integrity reference.
- Read-only Git status/branch/HEAD confirm PROD at c5b27fa4458d7175aca81a203762bae81e9f0b40; four pending paths are the two preserved context files and two B2 files. Bounded Git diff contains only three source lines and three added tests; diff --check reports no whitespace errors (Git emits line-ending notices).
- Read actual current source/test, r13/baseline source and baseline test insertion boundary, r13/candidate source, and caller R/dependency_manifest.R:463-539. Baseline lacks the initialization. Candidate/source initialize only a columnless copied local input after result/expected-key verification. Typed inputs bypass initialization, malformed nonempty history still reaches the native join error, and no existing master rows are invented or persisted by this helper. Caller retains provenance/receipt validation before reconciliation and verified checkpoint writers afterward.
- New tests use literal deterministic inputs/expected values, not output-derived expectations. They check two receipt rows, invariant types, no tombstones, unchanged caller input, typed-empty schema retention and malformed-history error propagation. No new randomness, timestamps, external data or seed requirement is introduced. Existing setorder(survey_id, pip_id) remains unchanged.

### Recorded r13 baseline-to-candidate and installed equality
All r13 paths below are relative to E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/r13.
- run.ps1:45-49 copies c11 runtime/private library and sources/candidate-final into r13/baseline; pins/dependencies and historical final manifests are copied, not regenerated. install.R:3-21 copies that frozen baseline, overlays ONLY R/reconcile_pip_inventory.R and tests/testthat/test-reconcile-pip-inventory.R, compares every other candidate payload file hash against baseline, and records candidate-source-sha256.tsv. install.R:23-26 installs that candidate with explicit private library and retained source.
- proof.R:15-19 and check.R:17-22 compare installed reconciliation formals and deparsed body with baseline for red, candidate for green/affected. Logs explicitly confirm these comparisons. Test environment parent is asNamespace("pipdata"), not a whole dirty-tree load. Source is loaded separately only for equality comparison.
- logs/proof.log:1-3 records the exact native missing-pip_id join: old zero rows/columns, add one row containing pip_id and canonical receipt-derived data fields. proof.R:25-41 captures actual failing frame fields and writes evidence/confirmed-empty-prior-join.rds; it is a pure in-memory probe, not a stored master or public-preparation bypass.
- logs/install-candidate.log:1,9-25 records candidate install/load success and retains the help CSS-copy warning at 16-19. The warning is not hidden or represented as an analysis failure.

### Recorded test/hash integrity
- logs/red.log:7-18 records only the exact new empty-master test error at baseline join line 41: 20 blocks, 61 passing assertions, zero assertion failures/skips, one error. check.R:41-44 requires this single named regression error and explicitly distinguishes successful wrapper exit from passing tests.
- logs/green.log:3-7 records candidate equality, 20 blocks, 66 passes, zero failures/errors/skips. logs/affected.log:35-39 includes preserved context regression and reconciliation, totals 130 blocks/616 passes, zero failures/errors/skips. Native tracing diagnostics in affected.log are retained, not test failures.
- logs/red-test-sha256.tsv:49, green-test-sha256.tsv:49, affected-test-sha256.tsv:49 and candidate-source-sha256.tsv:246 all record reconciliation test SHA256 1e06152afe935b05afd4cb8dd3ea461a85f4f13e4b29a8a81220b014b906b431. check.R:23-37 hashes all test R files before execution and requires identical hashes afterward before saving evidence. Thus retained red and green use the same new test bytes.
- candidate-source-sha256.tsv:175 records reconciliation source SHA256 1ee2cae8c9092e552736978ed51cdedf3e8c7a4c45b4fa026bbfe1e9dedd8bc4. Its lines 143/244 and test manifests line 47 retain the brief's exact preserved context hashes. final-source-sha256.tsv and affected-final-test-sha256.tsv are inherited c11 records per run.ps1:49, NOT r13 final verification; their old reconciliation hashes are not substituted for r13 candidate/red/green hashes.

### E-only and dependency evidence
- run.ps1:4-37 redirects temp, home, user profile, AppData, XDG, R library/profile/environment/history/Makevars, package/renv/OAuth caches, logs, store and manifest paths to E: before R invocation. Site/user libraries are disabled, --vanilla is used, and copied E: R_HOME/base library is explicit. paths.ps1:1-33 checks checkout outputs and rejects reparse/hard-link escapes. No new runtime dependency resolution is present.
- logs/child-startup.log:1-10 records E: R binaries and libraries for proof/test/install/staged-load children; red/green/affected logs:1-2 record E: libraries and temp roots. logs/pins.tsv records full local package revisions; dependencies.tsv records installed dependency versions/origins/DESCRIPTION digests as inherited provenance, not a newly resolved environment. New B2 code adds no dependency, so no lockfile or environment redesign is justified in this narrow review.
- UTC completion timestamp obtained with (Get-Date).ToUniversalTime(); initial Get-Date -AsUTC was unsupported in Windows PowerShell 5.1 and replaced by this read-only clock expression.

## Gaps
- No R/scripts/tests executed by this reviewer. Installed body equality, runtime hashes and assertion totals are recorded evidence plus inspected recorder logic, not independently rerun results; no fresh cryptographic recomputation or binary RDS deserialization was performed.
- E-only configuration and observed child paths are supported; no exhaustive OS write tracing, independent filesystem-link audit or complete transitive dependency rebuild is claimed. Copied dependency manifests retain historical n11 paths; current r13 library selection is evidenced separately by child/test logs.
- No full package check, cross-platform replay, full survey rerun or research-result manifest update was performed or required for these deterministic unit changes. The helper's in-memory success does not establish durable/public end-to-end correctness.
- B1 real compatible upstream-parent evidence and unchanged expanded gate remain pending; neither old context evidence nor r13 affected green waives that gate. Old context reviews remain authoritative only in their original scope and untouched. No survey acceptance or production/shared-write authorization is given.
