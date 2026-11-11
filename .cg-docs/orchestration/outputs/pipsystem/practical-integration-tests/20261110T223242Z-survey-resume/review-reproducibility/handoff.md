---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-reproducibility
status: partial
updated: 2026-11-10T22:50:00Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 506d8aa80230a32f6f6beee478c98a65488aa74e
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision1
next: Parent retains blocked Plan; worker supplies failed-boundary diagnosis and parent verifies final reports without claiming V2-V4.
---

# Full-route reproducibility review

## Summary
No supported P0-P3 reproducibility issues found in the inspected setup.R (251 lines), run.ps1 (103 lines), paths.ps1 (33 lines), and checks.ps1 (122 lines) snapshot. This is partial coverage, NOT clearance of the original full-route Plan: scenario.R was absent in the inspected directory. Missing scenario and numerical/malformed-control evidence are completion gaps, not invented defects in nonexistent code.

Fresh retained evidence for resume-20261110-full supports successful seven-package installation, isolated actual installer children, namespace loading, and caller restoration on success and an actual intentional child failure. Reviewer did not execute those checks; the distinction between inspection and retained execution evidence is maintained below.

Read-only Git observation returned main at 77b6424046367f8283d89c87d9c5767ab9d01915, whereas the task supplied f9454707b292a620e25abef17f2e515794020ba7. Parent was notified; no Git mutation by this reviewer.

## Changes
Only this required report created and updated. No code, tests, Git, packages or downloads changed. Findings and limits sent to parent/implementation worker through the board. No generated HTML bodies read or produced.

## Checks run
### Reviewer actions (read-only except own report)
- Loaded R technical and analytical skills and technical communication skill; read required charter/design/harvest, report contract, original revision1 Plan, resumption task and original Work Report.
- Ran read-only git rev-parse HEAD and git branch --show-current; result main at full SHA above. Read system date (17:43 ET / 22:43Z). No tests, R sessions, installers, package-manager commands, downloads or Git mutations run.
- Static inspection: setup.R:9-22 retains the six original package pins and changes only pipfun; :80-85 archives explicit Git SHAs, not dirty worktrees; :89-103 records repository status and source hooks. :118-146 traverses Depends/Imports/LinkingTo and collects source installation postorder, copying third-party dependencies after their own dependencies. :139-150 records dependency version, origin, destination and DESCRIPTION checksum; :163-202 verifies receipts and actual namespace paths.
- Static inspection: run.ps1:11-33 checks checkout and redirects before copies/writes; paths.ps1:7-30 checks existing ancestors and recursive entries for junctions/reparse points/hardlinks. run.ps1:14-18 refuses reused installation attempts; :38-64 sets private environment before R startup; :65-91 copies only private R/base/recommended runtime and asserts actual child library paths. :98-103 restores modified process environment and error preference in finally. checks.ps1:11-29 compares all process environment keys/values for success/failure. Hardcoded roots are deliberate local experiment constraints, not an unsupported portability promise.

### Fresh retained execution evidence inspected (not rerun by reviewer)
All paths below are relative to .tmp/one-survey/.
- resume-20261110-full/pins.tsv:2-8 matches setup's full seven pins. Compared with original Work Report:49-57: only pipfun changed.
- resume-20261110-full/logs/setup.log:1-9 records intentional missing-cli failure followed by seven successful installs; :31-33 verifies usable exact paths and two-library layout; :120 records seven-source acceptance. This is not the older two-package diagnostic or original failed installation. Read install-pipaux.log and install-pipdata.log:14 separately: both DONE. Their :9-10 missing private R.css warnings remain disclosed, not silently removed or treated as failure of numeric execution.
- resume-20261110-full/logs/child-startup.log:1-25 records actual setup, installer, staging/lazy-load, check and intentional-failure processes. Every listed library is under the private attempt, including 00LOCK staging. No ambient site/user library appears in those entries.
- resume-20261110-full/dependencies.tsv:1-108 records 107 copied third-party dependencies, each with version, original E library path, private destination and DESCRIPTION checksum. No lockfile-only independent reconstruction is claimed: copying requires the recorded existing installed dependencies, explicitly allowed by this bounded Plan. Adding renv or an installer framework is not warranted by this review.
- resume-20261110-full/logs/outer-green.log:23-112 retains package/path acceptance; :113-122 captures the actual intentional child error and expected launcher failure; :123 confirms all environment keys and error preference restored on success and failure. This supports the outer assertion, unlike a child-only log.
- resume-20261110-red/logs/baseline.log:1-9 fails on actual missing pipfun, not merely missing inventory. This is expected red evidence, not a passing setup.
- checkpoint-20261110T224226Z-fixtures/checks.log:22-49 records traversal, redirected helper/output/source paths, no-overlay, hardlinked log and ancestor rejection, then ten-control pass. Those V1/V3 labels are harness-local labels, NOT original Plan V3 numerical/readback proof.
- resume-20261110-full/logs/source-hooks.txt:1-324 records all seven source hook sets; inspected content includes pipaux's top-level globals initialization (:226-227) and pipdata manifest cache default (:294-299). These support explicit startup review, not exhaustive filesystem-write tracing of every transitive dependency.

### Package provenance
No package working repository was directly read by reviewer; source hook text and recorded repository state were read from fresh runtime evidence. The exact archived package source SHAs read through that evidence are:

| Package | Full archived SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

Runtime logs/repository-status.txt:1-23 records these same checkout HEADs, with preexisting dirty metadata in stamp/pipload separately reported. Clean exact archives do not imply those worktrees were clean, and dirty worktrees do not invalidate explicit committed Git archives.

## Findings
No issues found within the inspected reproducibility scope. No P0-P3 finding is asserted; therefore no safe_auto/manual/advisory fix tag applies. The stale diagnostic wording at setup.R:243 is already owned by code-quality review; no duplicate reproducibility finding added.

## Gaps
- Concurrent implementation may change after this snapshot. Parent must inspect final scenario and final source/evidence; this partial report cannot be applied to unseen later edits.
- Original V2-V4 remain unassessed: no scenario.R present at initial inspection, no reviewed exported validation/cleaning/storage path, transport-only substitutions, row-aligned daily welfare/person weights, exact saved data/metadata version readback, or completed missing-weight-invalid control. No claims about seed requirements or analytical determinism can be made before scenario exists.
- Full original V1 is not independently certified by reviewer. Runtime R version/session information was not observed in the inspected setup/check log output; final evidence should record actual R version and installed required-package versions. Namespace/installation success is real retained evidence but is not a complete V1-V5 pass.
- No exhaustive OS-level write tracing, archive byte-for-byte reconstruction, binary dependency rebuild, or later-save historical version selection was performed. No outside-checkout write is claimed as observed. Source/environment checks and recorded actual child library paths support containment within their inspected scope only.
- Original failed package logs and earlier two-package follow-up evidence remain historical; neither has been relabeled as this fresh seven-package pass. Final review/verify and remaining development are parent/implementation-worker owned.

## Final-scope checkpoint: 2026-11-10T22:50Z

This checkpoint supplements, and does not erase, the initial partial snapshot above. Authorized follow-up inspected actual scenario.R (191 lines), setup.R (256 lines), run.ps1 (108 lines), reproduce.R (71 lines), new session/package-version files, source pins and first-failure/reproducer evidence. No tests, R execution, code/package/Git mutation or downloads were performed. Only this report was updated on E checkout. Already-loaded R technical/analytical skills reused; data.table skill loaded for actual scenario review.

### Inspected state
- Read-only Git returned main at 506d8aa80230a32f6f6beee478c98a65488aa74e at 17:49:45 ET (22:49:45Z). External commits advanced HEAD; reviewer did not switch branch or perform Git mutation.
- Read-only git hash-object identified scenario.R as eb6c41e4bbdf2c89c1e07909f465c55285d9f724, setup.R as 642b89728ce8b80f5634727e917388f5472afb13, and run.ps1 as 671bbb89a2e9953615ad2b8c7b20316e8563bb84. These identify inspected working-file content, not proof those blobs are committed.
- setup.R:16-22 and fresh runtime pins.tsv:2-8 still retain exactly the seven full source SHAs in the initial table. No other pin change observed. Dependency provenance remains the fresh 107-entry dependencies.tsv reviewed above; no replacement source library or download was introduced by the inspected scenario.
- setup.R:207-211 now emits explicit R/session information and seven required-package versions/private paths. Inspected logs/session-info.txt:1-34 records R 4.5.2, Windows x64, locale, LAPACK, timezone and loaded versions. installed-packages.tsv:2-8 records stamp 0.1.0, pipfun 1.0.1, pipload 1.0.0, wbpip 0.1.6, dlw 0.1.2, pipaux 0.3.0 and pipdata 1.0.0, all in the fresh dedicated library. This closes the initial R/version evidence gap, but not scenario acceptance.
- run.ps1:94-100 selects scenario/reproduce scripts while retaining the prior contained runtime, child environment, path checks and finally restoration. setup.R:248 also corrects the previously reported diagnostic-only wording; no duplicate finding retained here.

### Scenario static inspection (not executed by reviewer)
- scenario.R:3-12 resolves the runtime root, sources setup and verifies recorded installed provenance before workflow calls. All explicit evidence files use that root. R process launch remains through the inspected private launcher. No new external output path or unpinned acquisition is introduced in this source.
- :15-40 defines deterministic synthetic raw data, separate SYNA/SYNB identities and checksums, and explicitly discloses release/catalog/download transport substitutions and fixture-only auxiliary inputs. No random sampling, bootstrap, Monte Carlo or randomized split is present, so no missing seed finding is supported.
- :44-85 temporarily replaces named external acquisition endpoints and registers restoration on exit. Real working-release setup (:89), auxiliary storage (:117-120), catalog acquisition (:122), validation (:124-125), clean/metadata processing (:144-145) and saved-pin reads (:155-158) remain actual package calls; no copied acceptance worker or manufactured validation result observed.
- :128-138 requires success plus completed valid/invalid inventory entries and the exact missing-weight diagnostic. :150-161 uses separate returned saved data and metadata version IDs. :162-172 compares paired welfare/weight rows (not independently sorted columns), metadata values and total weight. :173-179 asserts malformed identity absent from downstream catalogs before writing a pass marker. These are unexecuted intended assertions, not demonstrated results.
- :181-187 records the first failing boundary and rethrows. The actual retained failure occurred at :121-122, before validation and all numeric/readback/malformed assertions. It is not a malformed-input rejection.

### Fresh failure and reproducer evidence
All artifact paths here are under .tmp/one-survey/resume-20261110-full/.
- first-failure.txt:1-2 identifies pipdata::dlw_gmd_list and the message 'The intended acquisition inventory could not be verified durably.' logs/scenario.log:1-10 records the error and halted process. No V2-V4 pass inferred.
- Independently inspected archived pipdata source at SHA 13a38280c1eafe7e03a97837cdb57833fbe9d926: R/pipdata_dlw_compare.R:1112-1145 merges catalog/prior state, persists intended inventory and invokes the durable-write gate; :908-915 raises this exact error/class when success/trustworthiness/value checks fail. The initially attempted filename R/dlw_gmd_list.R did not exist; the actual source location was found by targeted search. No package working repository read or changed.
- reproduce.R:9-10 selects a separate new contained store and refuses an existing destination; :26-44 substitutes only release/catalog transport; :45-50 runs public setup/acquisition/readback/version calls without validation or survey processing. :55-62 additionally records an independent direct public write and warnings; :68-69 explicitly identifies reproduction, NOT scenario acceptance.
- logs/reproduce.log:1-13 reproduces the durable inventory error; :14-26 records absent saved-version readback/empty version list; :27-36 and :45-49 record the direct-write fallback with NULL metadata/version and 'qs2 is required to write qs2 format. Please install qs2.' This is materially narrower than a proven pipdata defect: copied qs2 is listed at dependencies.tsv:12, but successful copying does not prove its runtime usability. The installed seven-package namespace check does not itself load every optional format dependency. Actual cause of qs2 unavailability and ownership remain UNKNOWN from the inspected evidence. Parent notified not to assign root cause prematurely.

### Findings and final limits
No supported P0-P3 reproducibility issues found in this final inspected source/evidence scope; no safe_auto/manual/advisory correction asserted. The observed package-boundary failure is retained as a completion blocker, not classified as a new code defect without root-cause evidence. No extra safeguard/framework/dependency is recommended.

The initial absence-of-scenario and absent R/version-file gaps are superseded by this checkpoint. The decisive remaining gaps are unchanged: V2-V4 were not reached/passed; no completed validation or missing-weight rejection, cleaned row-aligned numeric result, exact-version data/metadata readback, or absent-downstream proof was executed. RDS binary payloads were not decoded by this reviewer. The direct-write warning is observed evidence, not a verified diagnosis of missing/unsupported qs2 binary or dependency. No exhaustive indirect-write tracing was done. Parent owns final blocked Plan/report consistency, final verification, and the actual package/dependency diagnosis handoff; later unseen edits are not covered by this checkpoint.
