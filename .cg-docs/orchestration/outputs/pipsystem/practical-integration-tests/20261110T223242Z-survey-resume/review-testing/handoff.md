---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-testing
status: partial
updated: 2026-11-10T22:54:44Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 3b57c6aa90928a8a50bd100db6a64c82b0f78f03
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Worker triages retained acquisition failure without bypass; parent reviews final scenario and actual V1-V5 evidence before verification.
---

# Testing review

## Summary
No issues found: zero supported P0-P3 testing defects in the inspected setup/isolation files and initial 191-line scenario.R snapshot. This is NOT full-route clearance. Fresh runtime evidence now records a failure at pipdata::dlw_gmd_list before validation, cleaning or exact-version readback. Failure ownership (harness/fixture versus package) is UNKNOWN; absence of passing V2-V4 evidence is a completion gap, not an invented implementation defect.

## Changes
Only this assigned reviewer handoff. No implementation, package or Git changes.

## Checks run
All checks below were static inspection/read-only evidence consumption, not reviewer execution of tests. Loaded pl-clear-technical-communication and R testing, technical and analytical skills. Read full original revision 1 Plan and resume Task. No downloads, package-repository reads, tests, Pester or Git mutations. Read-only git rev-parse HEAD and branch --show-current returned main at 3b57c6aa90928a8a50bd100db6a64c82b0f78f03; Get-Date returned 2026-11-10T17:46:42.4596460-05:00.

### Setup and isolation
- Inspected experiments/one-survey/setup.R (256 lines), run.ps1 (104), paths.ps1 (33), checks.ps1 (122). This setup snapshot includes new sessionInfo/installed-package evidence writers at setup.R:207-211 and corrected diagnostic wording at :248.
- True usable-package RED: .tmp/one-survey/resume-20261110-red/logs/baseline.log:1-9 fails namespace loading because pipfun is absent, not a fabricated failing assertion. GREEN: resume-20261110-full/logs/setup.log:3-9 records seven successful installs; :31-120 records usable namespaces, the five rejection controls and exact dedicated/private-base library paths. setup.R:32-46 loads all required namespaces and exercises exported pipfun::log_names and stamp::st_hash_obj behavior.
- Real missing declared dependencies: full/logs/install-missing-declared-cli.log:1-4 records stamp installation failure for cli and seven other absent dependencies, removing the attempted dedicated stamp installation. This is not a cli-only selective omission test; its scope is real dependency absence without ambient fallback.
- Provenance and five stale controls: setup.R:163-202 checks receipt root, SHA, archive checksum, installed metadata checksum, installer DONE evidence, dependency table equality, source origin, version, DESCRIPTION checksum and namespace paths. :212-230 rejects missing receipt, stale SHA, wrong root, stale dependency version and truncated dependency rows. full/dependencies.tsv:1-108 records 107 copied dependencies with versions, origins, destinations and DESCRIPTION checksums. The binary inventory itself was not decoded independently.
- Actual installer and staged-child library confinement: full/logs/child-startup.log:1-25 records setup, installer, staged load, check and forced-failure children using only the dedicated library/private R library (plus dedicated-library staging). :26 records scenario startup under those paths; it does not prove all subsequently loaded scenario namespaces.
- Success and actual intentional child failure caller restoration: checks.ps1:11-29 compares every process environment key/value and ErrorActionPreference; :105-121 exercises pre-existing HOME/unset R_TESTS through both paths. full/logs/outer-green.log:113-123 contains real intentional R error, nonzero launcher outcome and retained restoration PASS marker, not merely pre-child path rejection.
- Fresh ten specific boundary controls are retained at checkpoint-20261110T224226Z-fixtures/checks.log:22-49. Inspected matching checks.ps1:36-103 covering traversal, helper redirect, four recursive redirects, two existing-attempt controls, hard-linked log and redirected ancestor. These are boundary controls, not survey numerical evidence.

### Actual scenario snapshot
- scenario.R exists and was inspected in full (191 lines); other earlier reviewers' absent-file snapshots do not describe this review's scope.
- Public API calls: :89 setup_working_release, :118 pip_write, :122 dlw_gmd_list, :124 pipdata_dlw_process, :144 pd_process_data, :155-158 exact-version pip_read, :134 load_gmd_valid_report and :140/:174 st_catalog_query. Confirmed exports in fresh source archives: pipfun/NAMESPACE:62, pipload/NAMESPACE:23,45,47, pipdata/NAMESPACE:27,58,62, stamp/NAMESPACE:8. No internal workers or existing acceptance harness are invoked in this snapshot.
- Archived pipdata vignettes explicitly support the real pipeline path: Validating-Data.Rmd:14,24-42; Processing-Data.Rmd:68-75; PIP-data-pipeline.Rmd:32-45,255-270. Source archives remain in the dedicated runtime; no live package checkout bodies were read.
- Offline substitutions are disclosed at scenario.R:35-40 and namespace substitutions limited to release/PPP/catalog/download boundaries at :56-85, restored on exit. The downloaded synthetic frame is persisted through real exported pipload::pip_write (:82-83), not an internal acceptance worker. Auxiliary tables are disclosed fixture-only inputs (:90-119), not producer certification. Runtime reachability remains limited by the first failure below.
- Independent expected values are explicit: raw annual welfare 365/730/1095/1460 and weights 10/20/30/40 (:16-22); paired-row expected daily welfare 1/2/3/4 and unchanged weights (:162-172). No separate sorting can conceal welfare/weight misalignment. Values originate in the approved Plan, not outputs under test.
- Actual exact saved version IDs are selected from the returned master (:148-153), separately supplied for data and metadata (:155-158), with readbacks saved (:159-161). Source assertions additionally check survey_id, CPI 1.4, PPP 1.6 and total person weight 100 (:168-172). These have not reached execution success.
- Malformed control has distinct SYNB identity and checksum (:27-34), removes weight from its actual transport frame (:78-80), demands overall/validation success and completed invalid row/no failed executions (:128-133), and requires the specific missing-weight error (:134-138). Neither no-work nor execution error meets these assertions. Before/after downstream catalogs are saved (:139-142,173-178), with no SYNB clean or metadata artifact allowed. Archived stamp/R/version_store.R:1487-1494,1519-1543 confirms catalog path exists even for empty catalogs, avoiding a missing-column vacuous check.
- Actual first boundary failure: full/logs/scenario.log:1-10 says the intended acquisition inventory could not be verified durably; full/first-failure.txt:1-2 identifies pipdata::dlw_gmd_list. Archived pipdata/R/pipdata_dlw_compare.R:908-915 defines that error as unverified durable fact/value. This does not establish its root cause. scenario.R:181-187 retains failure details and aborts; it does not turn failure into rejection/pass.

### Archived package identities inspected
Only dedicated archived source snapshots were read, not package working repositories. Exact recorded source SHAs are full/pins.tsv:2-8:
- stamp: 95890411e8bf9db842593c2b0ab68ec4f2a66b25
- pipfun: 7d534516a8c17c33d537681610eccd4c29211762
- pipload: ff9a81e386a09fb2531c154f63fd2b91521313c6
- wbpip: fd2c687ed527ebe33d0a7addf9859f72f71ff39f
- dlw: 12faa058b521ef511073a7b21b1b1dd7993c9649
- pipaux: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
- pipdata: 13a38280c1eafe7e03a97837cdb57833fbe9d926

Material scope/failure updates sent to parent and implementation worker through the shared board. No safe_auto/manual/advisory defect classification assigned because no supported code defect was found.

## Gaps
- V2-V4 are NOT verified: the fresh actual scenario stops before validation. Worker must preserve and triage the first acquisition failure; never bypass real exported path, weaken completed-invalid expectations or count execution error as malformed rejection. Parent owns final source/evidence review after concurrent edits.
- Original V1 requires explicit R and installed package versions. Writers now exist at setup.R:207-211, but logs/session-info.txt and installed-packages.tsv were not present in the inspected initial fresh runtime directory snapshot. Retain and inspect actual generated files before claiming V1 complete. A private R-4.5.2 source path alone is not runtime-version evidence.
- No independent test execution, binary RDS decoding, full receipt checksum recalculation or post-scenario namespace inventory occurred. Scope is inspection of source plus retained real execution logs, not independent rerun certification. Source-hook and repository-status bodies were not audited in this testing pass; other route reviewers cover those boundaries.
- Historical exact pin selection after a later save, incremental certification, live DLW, deflation and mean remain excluded/UNKNOWN by the approved Plan.
- get_errors and execution_subagent unavailable; no Pester direct execution. No final cg-review mode:verify or V5 completion is claimed by this partial reviewer handoff. Minimal first retained: bounded functional example only; no new framework, safeguards, dependencies or implementation changes proposed.

## Focused correction1 review — 2026-11-10T22:54:44Z

### Summary
No new supported P0-P3 issues found in this bounded correction snapshot. Accept coordinator P2.1 as a genuine initial usability-test gap, not a proved pipdata defect. This supersedes any interpretation of the initial no-findings snapshot as sufficient V1 storage acceptance. The corrected source now exercises real QS2 serialization and binds provenance to the selected dependency origin. Newly retained correction1 setup output reaches its acceptance marker; full stable scenario and caller-restoration evidence remain parent-owned and unverified here.

### Changes
Appended only this assigned handoff; no implementation, package, Git or download operations. Skills already loaded were reused. No tests or polling performed.

### Checks run
- Inspected CURRENT setup.R in full (272 lines), Git content identity 132146eb86cbef772f82ce4db8b3f5336bd30572. Read-only git rev-parse HEAD returned 506d8aa80230a32f6f6beee478c98a65488aa74e; Get-Date returned 2026-11-10T17:54:44.5664925-05:00. These differ from the earlier snapshot and are not silently conflated.
- Read coordinator review .cg-docs/reviews/2026-11-10-installed-package-one-survey-example-resume-review.md:20-21,26-27,48-49. P2.1 identifies omitted real QS2 suitability testing; V1 was revoked pending reassessment. No independent pipdata defect attribution is made.
- Corrected source check: setup.R:42-45 actually calls qs2::qs_save(list(value = 1:4), storage_probe), reads that same file via qs2::qs_read and requires exact identity to the independently specified object. The E-checkout-local temp path is explicit at :43. This exercises native QS2/stringfish loading plus an actual file write/read, unlike namespace existence or stamp hashing alone. No mocking or fabricated QS2 success branch was introduced. Failures propagate out of usable()/verify(), before acceptance at :249.
- Origin binding: setup.R:25-30 selects precisely qs2, stringfish and RcppParallel from the existing 4.5-pipapi shelf; all other contributed dependencies retain the 4.5 shelf. Dependency discovery/copy uses that selector at :138-159 and records origin, version, destination and DESCRIPTION checksum. verify() compares retained inventory to dependencies.tsv (:185-189), requires the exact selected origin (:195-198), checks version/checksum against the actual destination, executes usable() (:211), and checks loaded contributed namespace paths (:215-217). Thus no automatic fallback to another shelf was added. This is explicit provenance plus functional suitability, not binary-file cryptographic certification.
- Fresh evidence inspected once: .tmp/one-survey/resume-20261110-correction1/logs/setup.log:1-9 retains the genuine missing-dependency failure followed by seven successful installs. :31 records five stale controls rejected; :32-33 records dedicated/private-base libraries; :54-55,64-65,92-93 records RcppParallel/stringfish/qs2 namespace paths inside the new runtime; :126 reaches the setup acceptance marker. Combined with the inspected sequential source, this supports successful QS2 round-trip execution in setup (inference from reaching the later marker; there is no separate QS2-specific success line).
- Actual correction1 dependencies.tsv:10-12 records RcppParallel 6.2.0, stringfish 0.19.2 and qs2 0.2.2, each origin exactly E:/PovcalNet/01.personal/wb384996/R/win-library/4.5-pipapi/<package>, destination under correction1/library/<package>, with DESCRIPTION checksums. This matches the selector; merely claiming compatible versions was not accepted as evidence.
- Initial evidence preserved and inspected: full/first-failure.txt:1-2 retains dlw_gmd_list failure; full/logs/reproduce.log:27-36,45-49 retains a real direct QS2 storage fallback with NULL metadata/version and qs2 unavailable. full/logs/dependency-probe.log:1-3 retains the copied stringfish.dll LoadLibrary failure; :13 and :24-39 records RcppParallel load state/hook. The probe demonstrates the loader failure, not by itself the exact native import causing it. No evidence was replaced by a retrospective success claim.

### Gaps
- The inspected correction1/logs directory contained setup and install evidence but no scenario, check or outer-green log at that snapshot. No stable full-route, corrected exact-version stamp receipt/readback, malformed-input outcome or post-correction caller restoration is certified here. Direct QS2 round-trip suitability does not independently prove the higher-level stamp/pipload durable receipt path; the real scenario must exercise that next.
- Corrected runtime R/package version files, child-startup bodies, binary inventory/probe payload and actual probe artifact were not inspected in this focused pass. Parent must check complete stable runtime evidence; earlier V1 completeness claims remain conditional on that review.
- Inspection consumed retained worker execution evidence only; no rerun, polling, dependency installation, package-repository read or implementation mutation. Current completion status remains partial; parent owns final V1-V5 verification after worker results return.
