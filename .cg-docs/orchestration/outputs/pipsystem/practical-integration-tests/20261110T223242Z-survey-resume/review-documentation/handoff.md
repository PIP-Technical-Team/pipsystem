---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-documentation
status: partial
updated: 2026-11-10T22:47:10Z
owner: cg-documentation reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 3b57c6aa90928a8a50bd100db6a64c82b0f78f03
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent incorporates this snapshot review and verifies final failure/owner evidence after implementation stabilizes.
---

# Documentation review

## Summary
No new supported P0-P3 documentation issues found in the inspected snapshot. This is a completed snapshot review of an ongoing implementation, not original Plan completion or final execution clearance. The known P3 safe_auto stale diagnostic wording is already corrected at experiments/one-survey/setup.R:248; deduplicated, not reopened.

The actual scenario attempt currently fails before validation: .tmp/one-survey/resume-20261110-full/first-failure.txt:1-2 identifies pipdata::dlw_gmd_list and an acquisition inventory that could not be verified durably; logs/scenario.log:1-10 confirms execution halted. This is not completed malformed rejection or numerical/readback evidence. Worker handoff:18-19,35-38 truthfully leaves Phase 2 pending. Main handoff:19-21,36-39 distinguishes original from diagnostic work and pending evidence; original Work Report:87-90 preserves the resumption and new pin/budget without claiming success.

## Changes
Only this reviewer handoff created/updated. No implementation, package or Git changes; no tests, downloads, installs or runtime children launched. Material snapshot status sent to parent and implementation worker on the shared board.

## Checks run
- Read Task specification, main handoff, coordination contract and project read-first documents.
- Read-only Git confirms existing main at 3b57c6aa90928a8a50bd100db6a64c82b0f78f03.
- Read original revision 1 Plan and full original Work Report, including dated resumption; no pending checkpoint treated as a false completion claim.
- Read all five experiment files. New functions are private script helpers, not exported package functions; no missing exported-function roxygen finding applies.
- setup.R:9-22 and pins.tsv:1-8 preserve six original source pins and change only pipfun; setup.R:80-97 records exact archive origin separately from dirty checkout status. Repository-status.txt:1-23 supports worker's recorded preexisting stamp/pipload dirtiness. No live package checkout content was read.
- Read archived pipdata articles PIP-data-pipeline.Rmd:248-316, Processing-Data.Rmd:1-180 and Validating-Data.Rmd:1-190 at pipdata 13a38280c1eafe7e03a97837cdb57833fbe9d926. They identify real public validation/cleaning wrappers, separate data/meta version reads and precise success/no_work/classification distinctions. Illustrative vignette text is not runtime proof; the Processing-Data invalid-row policy text remains a known source/documentation discrepancy already acknowledged by Plan:24, not a newly introduced finding.
- scenario.R:35-40 explicitly lists release/catalog/download substitutions and fixture-only auxiliaries; :56-85 changes external I/O endpoints, not validation/cleaning workers. :123-138 requires actual successful validation, one valid and one invalid row, and the exact missing-weight diagnostic. :150-172 uses separate actual clean/metadata pins and paired welfare/weight comparison (1,2,3,4 against 10,20,30,40), with metadata survey/CPI/PPP and total-weight checks. :173-178 checks malformed identity absent downstream. These are static assertions, NOT executed passes.
- setup.log:3-9 records seven installation exit-zero results, :31-119 namespace paths in isolated runtime. outer-green.log:113-123 retains actual intentional child failure and caller restoration. No reviewer rerun.
- setup.R:207-211 adds readable R-session and seven-package-version emission, but those artifacts were not present in the inspected runtime directory; not certified by this snapshot.
- System-clock UTC read succeeded using (Get-Date).ToUniversalTime(); initial Get-Date -AsUTC attempt was unsupported by PowerShell 5.1 and made no writes.

### Package provenance

Only archived pipdata documentation was inspected as package content. All source identities below are recorded from the experiment pins, not fresh live-repository certification:

| Package | Exact archived SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

## Gaps
- Snapshot is concurrent and may be superseded. Parent must reconcile final Work/Review/Verify reports with actual first-failure reproducer, owner direction, runtime R/package-version evidence and correction accounting. Their absence at an ongoing checkpoint is not presented as a documentation defect or a completed gate.
- V2-V4 lack passing runtime evidence in inspected files; acquisition failure precludes any claim of malformed rejection, numeric success or exact saved-pin readback. V5 final verification remains parent-owned.
- Readable explicit R/package-version files were not yet observed; no full V1 clearance claimed here. Binary RDS receipts were not decoded; no runtime execution was authorized.
- No live DLW, deflation, mean, incremental certification, production writes, auxiliary producer certification or historical selection after a later save is established. Fixture auxiliary inputs do not certify pipaux producers.
- No execution, tests, downloads or package changes authorized for this reviewer. All reviewer writes are this E-checkout handoff only.
