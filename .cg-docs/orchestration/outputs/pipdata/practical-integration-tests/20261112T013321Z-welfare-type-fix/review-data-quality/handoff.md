---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T013321Z-welfare-type-fix
status: completed
updated: 2026-11-12T02:18:45Z
owner: cg-data-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Retain B4 as a manual blocker; no green suite or complete-parent acceptance follows from this completed review.
---

# Independent B3 Data-Quality Review

## Summary

No supported production data-quality defect found in R/pd_process_data.R:321-324. One supported P2 test-diagnostic finding in tests/testthat/test-public-clean-welfare-type.R:107-111: failed boundary readback can mask an earlier processing error. Review completion does not mean integration acceptance. B4 remains BLOCKED; both new public scenarios and the affected selection terminate with metadata API errors after the durable welfare assertions pass.

## Changes

- Created only this review report. No R, tests, scripts, protected artifacts, dependency pins, Git state, or earlier reports changed.
- Reviewed only the new four-line source delta against w15/baseline and the new public regression file. Prior context/B2 changes were contextual prerequisites, not reopened findings.
- Applied Minimal First: assess the smallest complete propagation fix, do not add speculative safeguards, dependencies or implementation. Safeguards are warranted only for almost-irreversible failures; each change needs a functional check; Plans remain about two pages.

## Checks run

Read-only source/evidence review; no R, scripts, tests, package installation or Pester executed.

1. Read the run review-brief.md and handoff.md. Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable, cg-skill-r-testing, cg-skill-r-analytical and cg-skill-r-collapse. compound-gpid.local.md was not found at the repository root or by the available glob; the brief's mandated data.table skill and actual source syntax guided dialect assessment.
2. Read-only Git confirmed existing PROD and full HEAD above. Baseline-to-current source diff contains only four added lines after the existing invariant join; the four preserved context/B2 files were not re-reviewed. Read the complete new regression (read tool shows 124 physical lines, including its final closing line; brief describes 123).
3. Trusted lineage: pd_execute_clean at R/pd_process_data.R:283-286 merges the execution snapshot PFW and cleans before validation. R/pd_split_alt_welfare.R:33-39,64-81 assigns welfare_type from the relevant PFW object to each clean output; no ID-text parsing supplies welfare_type. R/pd_dlw_clean.R:665-672 requires each attribute to be a nonmissing, nonempty character scalar restricted to income/consumption before saving. R/pd_aux_attr.R:34-39 preserves those attributes in auxiliary metadata.
4. Per-output identity: R/dependency_inputs.R:609-620 enforces exact unique clean/metadata output names against expected IDs. R/pd_process_data.R:291-299 already saves each expected output by matching its full artifact ID. New lines 321-324 match each joined receipt pip_id against clean names and extract that specific validated attribute with exact = TRUE and character(1L). Values follow receipt identity rather than input list position or an ID suffix. Source supports multiple outputs; no new multi-output execution proof is claimed.
5. Inventory precedence and immutability: the inventory is copied at R/pd_process_data.R:307, then joined at line 320; the new assignment occurs AFTER that join and replaces any inventory welfare_type with the trusted clean attribute. Only local receipts are mutated. Tests:90-100 copy inv before processing and compare it afterward in absent/conflicting inventory cases. Existing receipt count/success checks, exact output set, validation, execution fence, lease, and error allowlist remain unchanged; no fallback, schema relaxation or new catch was added to the worker.
6. Regression integrity: tests:50-89 invoke real public setup, auxiliary producers, acquisition and validation, substituting transport; supporting country/pop/GDP/PCE inputs are declared fixtures. Tests:93-115 read actual saved master and clean data and require income and unchanged caller input. The known strict-key condition becomes a failed success assertion, not an accepted outcome. Unexpected downstream errors attempt durable checks and rethrow only if those checks return; see P2 below. Successful-public-return assertion is not reached on B4.
7. Inspected w15/logs/proof.log:24-28, which reports trusted PFW/validated clean/metadata income but missing baseline receipt/master welfare_type. This is retained diagnostic evidence, not an independently decoded binary or independently executed proof.
8. Inspected red-final.log:45-93: 2 blocks, 8 passes, 4 intended failures, 0 errors/skips; master welfare absent and no-error assertions fail. Inspected green-final.log:42-100: 2 blocks, 10 passes, 0 assertion failures, 2 errors, 0 skips. Inspected affected-final.log:73,99,125: same two API errors, 132 blocks/626 passes/0 assertion failures/0 skips. These are existing producer results, not reviewer-run tests.
9. Confirmed B4 source: unchanged R/pd_metadata_refresh.R:63-67,101-103 passes positional pip_id and unsupported alias to pipload::load_pip_data. Read pipload/R/load_pip_data.R formals showing explicit id_name, metadata and no alias/dots; the observed error is unused argument (alias = "pip"). No B4 implementation authorized or attempted.
10. Verified existing report destination and its ancestors are E: directories without reparse targets before the sole report write. UTC timestamp above comes from the system clock. Initial Get-Date -AsUTC was unsupported in PowerShell 5.1; corrected read-only call used (Get-Date).ToUniversalTime(). No execution result was fabricated.

## Findings

**[P2]** `tests/testthat/test-public-clean-welfare-type.R:107-111` -- Boundary observation can replace the original processing error. **[safe_auto]**

**Issue**: The generic error handler calls check_saved_boundary() before stop(error). If processing fails before master publication, its pip_read at lines 94-95 can itself abort (pipload/R/pip_read-write.R:92-96 explicitly aborts when no artifact version exists), so the original condition is not rethrown. This was surfaced by the independent testing reviewer and verified against the handler/read implementation.

**Impact**: An early validation/acquisition/storage failure is reported as a secondary missing-master error, obscuring the original data-quality failure and contradicting the handler's promised original-error preservation. The test still fails; no silent pass, corrupted production result or suppression of the currently observed late B4 error is demonstrated.

**Fix**: Keep boundary checks, but guarantee original-condition propagation even when observation errors; preserve any observer error as diagnostic context rather than replacing the original. Verify with an early error and absent master. This is a suggested test-only correction, not implemented or executed in this review.

No supported new production P0-P3 data-quality defect found. The projection restores the trusted attribute without inferring welfare type from pip_id or accepting inventory welfare as authority.

## Gaps

- **[manual] B4 BLOCKED:** public metadata API mismatch at R/pd_metadata_refresh.R:63-67,101-103 is outside this B3 delta. Both public tests and affected suite remain errored, not green. Requires separately authorized correction and rerun; this review does not waive it or approve parents/survey acceptance.
- No complete current-parents.rds, fresh public parent retry, unchanged expanded rerun or complete-survey acceptance was established by this review. Passing field assertions and durable clean/master artifacts are insufficient for those gates.
- New public cases exercise a single income output with absent/conflicting inventory welfare. Consumption and reordered multi-output correspondence were inspected structurally, not executed independently. This bounded evidence limitation is not a demonstrated new defect.
- No independent binary decoding, fresh SHA256 recomputation, full package check, Problems/get_errors, execution_subagent, exhaustive filesystem-write audit or independent test execution. Reported source/test hashes and installation provenance remain producer evidence; source inspection is not independent test proof.
- Only this report is authorized for reviewer writes; prior context/B2, protected artifacts and original Plan/pins remain untouched. Required completion status describes the review artifact only, not the blocked integration gate.
