---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T214400Z-plan-review
status: completed
updated: 2026-11-09T21:46:01Z
owner: independent-cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Independent review complete; implementation remains outside this review and subject to the existing execution-authorization gate.
---

# Independent plan review

## Summary
No significant issues found. Plan is well-structured and ready for implementation, subject to its explicit dependency/isolation preflight and existing execution-authorization gate. Actionable findings: P0 0, P1 0, P2 0, P3 0. Full revision 1 plan and verbatim charter Objective, Constraints and Current Focus read. All four prior P2 findings are addressed; historical-pin testing is explicitly narrowed to single-version readback, not certified. This is a source-based plan critique, not an installed-package execution pass. This report is the only write; no pipeline execution.

## Changes
Created, checkpointed and finalized this separate report. No plan or package changes; no commits. The report checkpoint's provisional timestamp was replaced with the actual system-clock UTC completion time.

## Findings and prior-fix verification

No actionable P0-P3 gaps established. Prior findings are from `20261109T213600Z-plan-critic/handoff.md:26-48` in the same task output directory.

| Prior finding | Current evidence | Assessment |
|---|---|---|
| P2.1: stale invalid-row premise | Plan line 21 explicitly distinguishes vignette from source. `pipdata/R/dependency_execution.R:214-231` filters valid/Yes rows; `R/pd_process_data.R:226-248` enforces eligibility and validates formatted output. `vignettes/articles/Processing-Data.Rmd:83-100` still describes valid and invalid admission. | Addressed. Documentation discrepancy is not mislabeled a reproduced runtime defect. |
| P2.2: one version does not prove historical-pin selection | Plan line 60 explicitly retains historical selection after a later save as UNKNOWN. V3 at line 86 requires only actual saved-pin readback; no subsequent distinguishable version is claimed. `pipload/R/pip_read-write.R:23-34,92-107` documents character pins and delegates them to stamp. | Addressed by the prior critic's permitted narrowing, not by adding a second save. Risk-table line 71 must be interpreted within line 60's explicit limitation. |
| P2.3: vacuous malformed control | Plan line 46 and V4 line 87 require a fresh store or distinct identity/checksum, completed invalid classification, missing-weight diagnostic, and no output for that identity; no-work and execution failure are disallowed as substitutes. `Validating-Data.Rmd:71-102,156-179` distinguishes these outcomes and cache keys. | Addressed without adding an unnecessary test framework. |
| P2.4: recursive work invocation | Plan line 23 puts review before the outer execution workflow. Step 3 line 54 now contains review/correction/final verification, not a recursive work invocation. | Addressed. |

### Objective, isolation, APIs and gates

- **User objective and charter:** The readable two-script installed-package baseline matches the assessed scripts-first user objective (`20261109T205401Z-assessment/handoff.md:34-44`). It remains a development/evidence experiment, not a pipsystem release orchestrator or proof of stamp-selected incremental execution (plan lines 21,46,74; charter lines 24-40; design lines 186-192,299-309). Deflation, mean, live services and historical selection remain outside this baseline. No protected design change is proposed.
- **Minimal first:** Two scripts, optional thin launcher, one positive example and one negative control; no dependency matrix, new framework or general installer (plan lines 36,45,60,74). Isolation prevents shared-state or external writes and is justified by the storage constraint, rather than speculative resilience infrastructure. Required full review is an explicit existing gate, not an invented additional safeguard.
- **Isolation sequencing:** Source preflight and child environment must precede R loading/installing (plan lines 37,102). This is material: `pipdata/R/zzz.R:2-5,10-25` establishes a default user cache option and initializes logging on load; `pipfun/R/zzz.R:4-14,17-32` derives main storage from PIP_ROOT_DIR and initializes logging; `pipaux/R/zzz.R:16-61` captures working-release/folder/alias state and has a Y-drive default. The plan explicitly isolates runtime options, aliases, manifests, paths and library provenance, not just `.libPaths()`.
- **Actual exported path:** `pipdata/NAMESPACE:35,52,57-58,62,67-68` exports the named validator, cleaning, metadata, wrapper and save functions. `pipdata_dlw_process()` accepts explicit release/TEST and calls the real working-release setup (`R/pipdata_dlw_process.R:663-686`); `pd_process_data()` consumes and filters the completed validation inventory and dispatches clean and metadata stages (`R/pd_process_data.R:108-187`). The overview documents these supported paths (`PIP-data-pipeline.Rmd:25-47,248-275`), even though `pd_run_pipeline()` is its newer top-level staged wrapper.
- **Offline prerequisite:** Working-release setup itself resolves release metadata through `get_pip_releases()` even with an explicit release (`pipfun/R/working_release.R:79-103`) before registering real folders and aliases (`:128-158`). Release-catalog transport therefore also needs fixture-backed external acquisition, consistent with plan line 46's external-transport allowance; replacing the setup function or mutating private package state would not demonstrate the planned public path. This is an implementation detail within the stated substitution boundary, not a new finding.
- **Numbers and storage:** Fixture welfare is annual per capita and weights are already person weights (`helper-one-survey-upstream-acceptance.R:122-131`). Plan line 46 correctly expects daily 1,2,3,4 and unchanged 10,20,30,40 with household/person row correspondence. Exact `pip` and `pip_meta` reads are documented separately (`PIP-data-pipeline.Rmd:287-305`); this does not confuse a separately versioned metadata object with stamp's current custom sidecar (design lines 135-139,309).
- **Review gates:** Plan line 54 names all ten full-review roles. This matches `.kilo/shared/review-routing.contract.md:10-14`; installation paths trigger full coverage (`:58-70`). Final verify is light-only (`:39-40`) and therefore complements, rather than substitutes for, full execution review. V5 and blocked stops (plan lines 88,106-110) prevent unavailable reviewers, captured package failures or missing evidence from being reported as completion. Review dispatch/tool availability has not been demonstrated here.
- **Feasibility:** Public wrapper, cleaner, validator and versioned-read seams exist in source. Installation compatibility, dependency availability and runtime behavior are not established; the plan makes those Phase 1 checks and explicitly blocks rather than weakening the public-path scenario or downloading mutable dependencies. The 60-120 minute estimate expressly excludes dependency blockers/approval waits (line 18); this review does not certify the estimate.

## Checks run
- Read plan, charter, SYSTEM_DESIGN.md, HARVEST_BRIEF.md, local configuration, review command and handoff contract.
- Read-only Git: pipsystem main at f9454707b292a620e25abef17f2e515794020ba7; plan and task output directory untracked at start.
- Verified requested report did not exist before creation.
- Read prior independent review and planning/assessment handoffs as historical context, not authorization or runtime evidence.
- Verified public pipload read API accepts exact version IDs and forwards them to stamp (`R/pip_read-write.R:23-34,92-107`).
- Verified pipdata completed-validation filter, clean eligibility and formatted-output validation (`R/pd_process_data.R:108-112,226-248`).
- Reviewed source startup hooks for pipdata, pipload, pipfun and pipaux; environment isolation must precede namespace loading and installation, as the plan requires.
- Read documented outcome schemas, exported APIs, real working-release setup and existing runner configuration as source evidence only; did not reuse or execute the internal harness.
- Compared full-review roles and final verification against the installed review-routing contract.
- Re-read all 110 plan lines at finish; content matches the reviewed corrected revision. Read-only Git blob identifier for the untracked plan: ab9cd8a1822f24f3d63d5670c745a6e37b975b4e.
- Final labeled read-only Git status: pipdata, pipfun and pipaux clean. pipload has existing `.gitignore` modifications and untracked plan/review/config/session-log paths. No cleanup or changes made there. Its installed source snapshot must not silently incorporate that dirty working tree; clean recorded snapshots are already required by plan lines 37,94.
- pipsystem still has the untracked plan and task output tree; no tracked changes made. A PowerShell `Get-Date -AsUTC` probe failed because Windows PowerShell 5.1 does not support it; corrected with `(Get-Date).ToUniversalTime()` for the final report timestamp. No files or child runtime were created by these read-only terminal checks.

### Package provenance (directly inspected)
| Repository | Full HEAD SHA |
|---|---|
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |
| E:/PovcalNet/01.personal/wb384996/PIP/pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| E:/PovcalNet/01.personal/wb384996/PIP/pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| E:/PovcalNet/01.personal/wb384996/PIP/pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |

Provenance query only: pipload-m2-stamp-adapter HEAD 4ef0d90a974cb6ff0725da69373bde421dd04ad5; no source inspected there. Attempted Git lookup at E:/PovcalNet/01.personal/wb384996/PIP/stamp failed because that directory does not exist; no stamp source read or stamp SHA established.

## Gaps
- Installed dependency inventory, selected full package version set (including stamp), successful installation, startup confinement, functional values and actual malformed-input behavior remain UNKNOWN until authorized execution. No R process, installation, package test suite, integration scenario or pipeline ran.
- Historical pin selection after a second distinguishable save remains explicitly untested/UNKNOWN, as the corrected plan now states; single-version readback cannot certify the protected historical-metadata requirement.
- Package HEAD SHAs identify source provenance, not an approved installed configuration. pipload's ambient working tree is dirty; a clean selected snapshot is required. stamp repository location/SHA and its actual storage implementation were not established in this review.
- Full execution review and final verify are future implementation gates, not checks completed by this independent plan review. Runtime review-agent availability remains UNKNOWN. No implementation or Git authorization is inferred.
