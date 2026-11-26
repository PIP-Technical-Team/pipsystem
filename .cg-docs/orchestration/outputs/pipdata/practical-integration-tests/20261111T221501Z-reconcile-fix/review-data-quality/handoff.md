---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T221501Z-reconcile-fix
status: completed
updated: 2026-11-11T22:36:04Z
owner: review-data-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator integrates this bounded review; required verification and real public-parent/expanded gate remain outside this review.
---

## Summary
No issues found in the new B2 changes: R/reconcile_pip_inventory.R:23-25 and tests/testthat/test-reconcile-pip-inventory.R:77-127, compared directly with r13/baseline. No supported P0-P3 data-quality finding attributable to this delta. This is a source/evidence review, not independently executed test proof or acceptance of B1/the original survey.

## Changes
Only this assigned report created/checkpointed/completed, on E:. No code, tests, scripts, protected artifacts or Git state changed. No implementation recommendation or extra safeguard is needed for this bounded change; minimal-first/protected-file constraints retained.

## Findings
Explicitly no issues found in the named changed files within the new B2 delta.

Data-risk assessment:
- **Columnless initialization versus durable corruption:** R/reconcile_pip_inventory.R:23-25 replaces only the local zero-column prior with two zero-length character keys. It creates no observations and performs no persistence or catalog repair. The public first-run route remains pd_load_process_master() (R/pd_process_data.R:194-227): warning-bearing history and surviving storage without trustworthy versions abort before its absent-history return. Those controls are unchanged, not re-reviewed as a separate implementation.
- **Typed-empty schema and existing history:** any prior containing columns bypasses the new branch. Existing invariant retention, downstream invalidation, tombstone construction, and other-survey retention therefore use exactly the baseline path (R/reconcile_pip_inventory.R:26-55). The new typed-empty test checks character NA release/metadata columns and logical FALSE deflated, rather than accepting schema deletion (tests:99-115). Existing invariant test at 42-63 is unchanged.
- **Receipt-derived observations only:** accepted clean results and the exact expected ID set are checked before initialization (source:10-20). New rows still originate in results via add, with a right join against old; the initialized table has zero rows (source:39-55). The two-row regression checks exact identifiers, integer year, versions/hashes, empty typed tombstones and no dummy row (tests:77-97). Public clean execution saves receipts for the expected set and joins invariant metadata onto those receipts (R/pd_process_data.R:288-324); pipeline_stage_cores.R:206-219 passes those receipts and expected IDs into finalization. dependency_manifest.R:463-501 retains receipt/provenance checks before reconciliation and publication.
- **Malformed nonempty history errors:** a prior containing survey_id but lacking pip_id does not match !ncol(out); native join errors still propagate, with no new catch/fallback. The new regression checks that error and caller preservation (tests:117-127). No proposal to reset malformed history or weaken assertions.
- **Caller immutability:** source:3-4 copies both caller tables before data.table operations; the new branch rebinds only out. New columnless and error regressions explicitly compare master to its original shape/content (tests:96,126). Typed-empty coverage checks row count, not full input identity, but the unchanged copy boundary supplies the structural guarantee; this is not a demonstrated defect.

## Checks run
Independently performed read-only checks:
- Read this run's review-brief.md and handoff.md; confirmed PROD and HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40 using Git. Status contained the two B2 files plus the preserved context source/test; no unrelated delta reviewed.
- git diff --no-index against each r13/baseline file confirms exactly the three source lines and three added test blocks, with no pre-existing test edits. git diff --check for the two changed files found no whitespace errors (Git emitted LF/CRLF advisory warnings).
- Read actual source, new tests, relevant unchanged existing invariant/failure tests, clean receipt caller, finalization checks and public master-load boundary for context only. No prior context change or review was reopened.
- Read retained r13/proof.R and proof.log: synthetic pure-function probe captures a zero-row/zero-column left join and one-row keyed right side against the installed baseline. This is not an independently observed real public receipt or durable-master write.
- Read r13/check.R and retained logs: red.log:7-18 records the exact new native missing-pip_id error (20 blocks,61 assertions,1 error); green.log:3-7 records installed-body comparison and 20 blocks/66 assertions with zero failures/errors/skips; affected.log:35-39 records 130 blocks/616 assertions with zero failures/errors/skips. These are retained execution reports, not tests run by this reviewer.
- Read candidate test snapshot, install.R, install-candidate.log and selected recorded manifest entries. Installation log ends DONE with the retained missing help CSS-copy warning; affected log includes PowerShell NativeCommandError formatting around trace stderr, while its test summary reports zero errors. Neither warning was hidden or treated as new runtime proof.
- Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable, cg-skill-r-collapse, cg-skill-r-shared and cg-skill-r-testing. Attempted root compound-gpid.local.md read: absent; used mandated data.table/collapse skills and actual source syntax rather than assuming a configuration value.
- Read UTC system clock with PowerShell-compatible (Get-Date).ToUniversalTime(); initial Get-Date -AsUTC attempt failed under PowerShell 5.1 and made no file changes.

## Gaps
- No R, scripts, tests, binary RDS decoding, package installation, independent receipt revalidation or public survey execution performed: explicitly read-only review. No independent runtime, full R CMD check or OS-write audit claimed.
- Recorded red/green/affected test manifests agree on test-reconcile-pip-inventory.R hash 1e06152afe935b05afd4cb8dd3ea461a85f4f13e4b29a8a81220b014b906b431, but affected-final-test-sha256.tsv records 7ed0498dbc7d029c85afa2402c26cfc7e8c931b5491f39b4a9768827fed83d79 and final-source-sha256.tsv records 77bd8db577ee224a9577a274d96e6acd9d94f39e412dd3dec782c4749fd5bea1 for that filename. The two source manifests also differ for reconciliation source. This review did not recompute hashes or establish the cause (for example encoding/line endings versus a different snapshot), so it does not certify the broad all-manifests-identical assertion. The actual current source/test delta and candidate new tests were inspected directly; no code defect is inferred from these evidence differences.
- Existing-history invariants assessed through the bypass condition and unchanged baseline path; no independent exhaustive type/key/missingness matrix. Typed-empty regression is selective, not a full schema/caller-identity assertion.
- Pure in-memory initialization is not proof of durable corruption recovery. B1 real complete compatible parents, expanded gate and required final verification remain pending per brief; old context review evidence is not substituted for them.
