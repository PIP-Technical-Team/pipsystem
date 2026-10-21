---
date: 2026-10-13
title: "M2 Walking Skeleton: One Survey, One Mean, One Test Release"
status: active
scope: "Deep"
brainstorm: ".cg-docs/brainstorms/2026-10-07-m1-code-orchestration-and-storage-decisions-confirmed.md"
language: "R"
estimated-effort: "large"
deviation-policy: "ask"
artifact-schema-version: 1
phases: 4
tags: [m2, walking-skeleton, stamp, pipdata, pipaux, pipster, pipload, contracts, incremental]
---

# Plan: M2 Walking Skeleton

## Objective

Plan the smallest complete path from one explicitly selected GMD survey to one mean statistic and one version-pinned test release. Prove incremental behavior with future executed checks for unchanged inputs, changed consumed CPI, unrelated inputs, code changes, failure recovery, and historical retrieval.

This is the planning document for task `m2-cg-plan-2026-10-10` and milestone `m2-walking-skeleton`. Saving this plan is not M2 implementation approval, approval of Open mechanisms, package-test success, or roadmap completion. No implementation step or phase has started. The requested filename retains the task's earlier date; the frontmatter records the actual preparation date.

**Execution role: umbrella specification, not a `/cg-work` execution target.** Its phases group milestone work across repositories; they are not executable phases in this pipsystem checkout. `/cg-work` requires separately approved repository-local saved Plans and lifecycle scopes as specified under Repository-Local Work Handoff. Review readiness is not permission to implement packages or to mark these umbrella phases complete.

## Context

### Authority and Fresh Baseline

- Direct user approval at `2026-10-13T14:39:55Z` authorizes the request in `.cg-docs/orchestration/REQUESTS.md:413-612`, with exactly this one-file write set. It replaces the older response-only proposal, not its historical evidence.
- The user answered `Approve To Save` to the completion-contract preview, then requested continuation at `2026-10-13T16:23:53Z`. This approves the document and no-output validation, not the proposed implementation contracts or any package work.
- Fresh save preflight at `2026-10-13T12:24:17.1667790-04:00` verified root `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`, branch `main`, and current HEAD `6810a4ef60865e00cb0553c98924ea317b3d2e90`. This HEAD is also this planning task's observed starting/base SHA; an earlier session-launch SHA is UNKNOWN.
- Git status showed existing unstaged changes in `.cg-docs/orchestration/STATE.md`, `.cg-docs/orchestration/REQUESTS.md`, `.gitignore`, and `ORCHESTRATOR.md`. The staging-area check returned no paths. Preserve these changes. The plans-directory read confirmed that the target did not exist before creation.
- Native worker session ID is UNKNOWN, as explicitly permitted. Inventory is limited to project-local evidence, this checkout's Git observations, and the user-supplied task. Other worker ownership, write sets, liveness, package branches/dirty states, and tested pins remain UNKNOWN. No private session state, inventory tool, recall, or helper agent was used.
- Permission evidence for this bounded task is the current direct approval, loaded tool contracts exposing repository reads/Git and `apply_patch`, and successful authorized preflight operations without a denial. The coordinator and roadmap-specific rules in `kilo.json:3-197` are configuration evidence, not this independent planning worker's authority. No permission was widened; no negative permission probe or general sandbox/denied-path certification is claimed. A denied save or validation operation must stop, not be retried through another route.
- Only the named plan may be created. No reports, active-state records, HTML views, roadmap changes, coordination edits, branches, commits, or helper starts are authorized. Future `/cg-work` lifecycle outputs need their own approval and compatible package scope; this umbrella plan must not be executed as package work from pipsystem.

The scope aligns with `compound-gpid.md:10-37`: incremental, portable, domain-neutral stamp, R with data.table and collapse, and M2 planning as Current Focus. The completed M0/M1 documentation plan is historical context, not a phase of this plan.

### Evidence Classes

| Class | Meaning in this plan | Evidence |
|---|---|---|
| CURRENT POLICY | Decided target behavior; do not change without Andres's approval | `SYSTEM_DESIGN.md:121-139,160-168,186-223,238-276,284-321` and controlling decisions below |
| OBSERVED DOCUMENT | File contents read for this task, including the current gate/status fields | `roadmap.json:10-56`; current decision and harvest reads |
| EXECUTED CHECK | Repository/document operation actually run here | Root, branch, HEAD, Git status/index, directory reads, source-reference reads; final document validation/readback is reported in the user handoff |
| INHERITED SOURCE | Package behavior reported by the harvest at its recorded SHA; not reread or tested here | `HARVEST.md:11-49`, notes, and `tables/stamp_fit.csv:2-16` |
| DOCUMENT-REPORTED HISTORY | Earlier approvals/checks recorded in another artifact; not rerun here | Integration report `:28-38,185-299`; coordination setup history |
| PROPOSED | A contract, signature, work set, test, integration sequence, or mitigation awaiting its applicable approval | Contract matrix, phase steps, decisions, and future acceptance checks |
| UNKNOWN / Open | Missing evidence or unsettled policy; do not infer an answer | Decisions and Gaps sections |

No source assertion or inspected test is a test pass. Current charter/design and the later confirmed decisions control over historical harvest proposals. Module-free identity, mandatory long outputs, manual version-label bumps, and a separate pipsystem runtime orchestrator are not selected (`SYSTEM_DESIGN.md:353-355`).

### Controlling Sources

| Source | Relevant sections and use |
|---|---|
| `.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md` | `:42-52,98-107,124-142`: minimal engine, failure policy, pure calculations, plan-only feedback |
| `.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md` | `:169-223,225-246`: module identity, version metadata, generated selection data, independent estimates and assembly |
| `.cg-docs/brainstorms/2026-10-07-m1-code-orchestration-and-storage-decisions-confirmed.md` | `:136-142,162-168`: fingerprints, pipdata coordination, pipload adapter, stamp authority, remaining gaps |
| `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md` | `:82-92,151-174`: exact M2 features, dependencies, and nine-item start gate |
| `.cg-docs/plans/2026-10-07-m0-m1-design-integration.md` | `:300-312`: stable gate ID mapping; completed documentation scope only |
| `.cg-docs/work-reports/2026-10-07-m0-m1-design-integration.md` | `:214-228,283-299`: reported gate/completion history and explicit runtime limits |
| `compound-gpid.context.md` | `:14-20`: approval/completion distinctions and source-linked verification pattern |
| `.cg-docs/orchestration/REQUESTS.md` | `:413-612`: approved assignment, inventory limits, one-file output, eight document acceptance criteria |
| `.cg-docs/orchestration/STATE.md` | `:97-200,515-610`: dated ownership/setup evidence and proposed package boundaries, not fresh package inventory |
| `notes/stamp.md`, `notes/pipaux.md`, `notes/pipdata.md` | S1-S7, A1-A4, D1-D4: generic mechanisms, auxiliary keys, deflation and authority gaps |
| `notes/pipload.md`, `notes/pipster_wbpip.md`, `notes/pipapi.md`, `notes/pipfun.md` | Access/format limits, mean reference, existing API boundary, logging not selection |
| `notes/FINDINGS.md`, `tables/stamp_fit.csv` | `:49-100,110-117` and all 15 fit rows: inherited mechanisms, conflicts and gaps, not adopted historical recommendations |

The controlling brainstorms have `scope: Extended`: they are strategic decision artifacts, not valid implementation scope classifications. This plan is Deep because it has ten steps and crosses storage, scheduling, processing, calculation, and access boundaries. Effort is provisionally large; duration/staffing are UNKNOWN, not a validated schedule.

### Nine-Item Document Start Gate

Fresh roadmap reads and the whole-file ID/status search returned one occurrence of each gate ID below. Each is `done`, with matching controlling evidence. Result: **9/9 at document level**. R1 and complete M1 integration are not additional gate members. Required stamp gaps must still close before M2 completion.

| Gate | Stable feature ID | Current status / roadmap line | Decision or harvest evidence |
|---|---|---|---|
| G1 | `decide-module-out-of-survey-id` | done / 10 | Remaining M0 `:169-190`; current design `:133-139` |
| G2 | `decide-engine-first-interface-later` | done / 13 | First M0 `:124`; design `:272-274` |
| G3 | `decide-pipster-calculations-only` | done / 14 | First M0 `:127`; design `:305` |
| G4 | `decide-stage-5-output-shape` | done / 12 | Remaining M0 `:206-223`; design `:166-168` |
| G5 | `decide-orchestrator-location` | done / 37 | Confirmed M1 `:137,139`; design `:307` |
| G6 | `decide-code-version-rule` | done / 36 | Confirmed M1 `:136,140`; design `:203-205` |
| G7 | `harvest-stamp` | done / 27 | `HARVEST.md:13,32,41-49`; S1-S7 in `notes/stamp.md:7-101`; fit table `:2-16` |
| G8 | `harvest-pipaux` | done / 28 | `HARVEST.md:14,33,41-45`; A1-A4 in `notes/pipaux.md:14-115` |
| G9 | `harvest-pipdata` | done / 29 | `HARVEST.md:15,34,41-46`; D1-D4 in `notes/pipdata.md:13-127` |

The current M2 milestone is `planned`, and all nine M2 features are `idea` with `plan: null` (`roadmap.json:43-56`). M1 R1 is `idea`; partial M1 integration is `active` with a null plan (`:35-39`). No status or link is changed here.

### Inherited Package Provenance

Full SHA pins below come from `HARVEST.md:13-20` and `REQUESTS.md:292-301`. They are inherited evidence pins, not current package HEADs, installed versions, or tested dependencies. No external package repository was read in this assignment. Prefixes used below resolve to these SHAs, regardless of different local keys in individual notes.

| Key | Package | Full inherited SHA |
|---|---|---|
| S | stamp | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| A | pipaux | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` |
| Dp | pipdata | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| L | pipload | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| F | pipfun | `0c6a78d9884ed0965a524311537eec2a5095d60b` |
| P | pipster | `828064e406e07e711c34d2ba725746e367d35f9b` |
| W | wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` |
| I | pipapi | `280af151d05902a550d5dea18cd4bf1a3d013239` |

Historical project key D is `84c384f78ed44bcb96bb19c6d364519df5b5db6f`; it does not identify this new plan or pipdata. Actual later producer/consumer commits, R version, package versions, testthat edition, storage dependencies, dlw, pipfaker, metapip, auxiliary source commits, and fixtures must be recorded by approved implementers. They are UNKNOWN here.

### Brain and Prior Work

The two existing plans are harvest/documentation work, not a saved M2 implementation plan. Their historical scopes are retained; this is a new plan, not a refinement or phase-history reset.

Read the local Brain meta-index and both matched `BRAIN-01.md` topics, the chronology log, and relevant `brain-index.json` source-path snippets after authority. Checked used links against the current decision records, roadmap, completed integration plan/report, and solution. No private link, remote Team Brain retrieval, index rebuild, or Brain write was used.

Relevant learning: keep approval, bounded document completion, and runtime verification separate; verify the exact gate rather than a milestone summary. Source: `.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md:22-40,60-71`. Its report-indexing limitation (`:85-87`) supports direct report reads. The Brain's older unconfirmed M1 record is not substituted for the confirmed source. Index status is not fresh authority or evidence of worker absence.

### Plan Review and Revision Authority

The preceding baseline and one-file creation statements describe the original planning task. At `2026-10-13T19:08:28Z`, the user directly requested `/cg-plan-review`, correction of all findings in this existing plan, and a handoff for `/cg-work`. This authorizes the required read-only plan critic and revisions to this plan only; it does not authorize package work, new output files, roadmap/coordination edits, or design decisions. The workflow's interactive finding choices are satisfied by the user's instruction to address all findings; none is accepted as risk or deferred.

| Finding | Severity | Status | Correction verified by re-review |
|---|---|---|---|
| P1.1 | P1 | Closed | Separate package-local stage evidence from later complete-skeleton integration so phase gates do not depend on future phases |
| P2.1 | P2 | Closed | Require approved repository-local saved Plans and exact lifecycle scopes; never execute this umbrella plan from pipsystem |
| P2.2 | P2 | Closed | Require a verified safe full-suite gate, or a directly approved compatible substitute, before local implementation |
| P2.3 | P2 | Closed | Prohibit execution exceptions from waiving core M2 evidence; retain blocked/incomplete status when it is missing |

The critic read the complete original plan and local controlling evidence, then re-read all 620 lines of the corrected version. It confirmed all four findings closed and returned no residual/new P1, P2 or P3 findings. This proves review readiness as an umbrella for separately authorized local execution planning, not package execution readiness. No package source, private state or runtime tests were inspected/executed. Document validation and final scope-check results must be reported from actual operations in the response. Original inherited evidence and existing unrelated edits remain unchanged.

## Requirements

Plan requirement IDs R1-R15 below are not M1 recommendation IDs. References to **M1 R1** always mean the still-Open row-level invalidation decision.

| ID | Requirement | Source |
|---|---|---|
| R1 | Close only the generic stamp gaps needed by the skeleton, with direct regression evidence | Feature `close-stamp-gaps-for-skeleton`; `notes/stamp.md:21,33,55-82`; fit `:5-6,10,14-15` |
| R2 | Create a minimal pipdata release entry point, separate from processing, with stamp selecting work | Feature `create-engine-skeleton`; design `:272-274,307`; confirmed M1 `:137,139` |
| R3 | Save validated CPI, PPP and PFW through stamp with content-based unchanged handling and usable version pins | Feature `save-cpi-ppp-and-pfw-through-stamp`; design `:89-100`; `notes/pipaux.md:65-105` |
| R4 | Download one explicitly selected module-bearing GMD survey with recorded DLW versions | Feature `download-one-survey`; design `:56-81,127-139` |
| R5 | Format and validate that survey, without saving invalid formatted data or letting invalid downloads proceed | Feature `format-and-validate-one-survey`; design `:160,209-213`; `notes/pipdata.md:75-95` |
| R6 | Deflate using actual consumed CPI/PPP/PFW inputs, dynamic welfare years, and weight dependencies | Feature `deflate-one-survey`; design `:162,201`; `notes/pipdata.md:34-71` |
| R7 | Compute the mean in pipster on supplied data and independently save it through pipdata/stamp | Feature `compute-the-mean`; design `:166,305`; `notes/pipster_wbpip.md:25,44-48,99` |
| R8 | Register and retrieve one test release using exact data, code, and same-version metadata pins | Feature `register-test-release`; design `:26-28,135,238-256` |
| R9 | Prove unchanged and unrelated work is skipped, with CPI selectivity, recovery and code-change checks | Feature `test-incremental-reruns`; strategy `:24,92`; approved task acceptance `REQUESTS:494-501` |
| R10 | Specify contracts, proposed separate-repository write sets, dependency order and approval gates before implementation | Approved request `REQUESTS:480-493`; `ORCHESTRATOR.md:163-179` as workflow evidence |
| R11 | Preserve stamp neutrality/authority, package roles, module identity, current API contracts, and Open M1 R1 | Design `:133-139,186-205,284-321`; current user scope |
| R12 | Verify the nine-member documentary gate, preserve provenance, and distinguish assertions from executed checks | Strategy `:151-174`; `HARVEST.md:41-49`; current request |
| R13 | Cover missing/failed state, no-save validation, unchanged-output lineage and independent saved-result recovery | Design `:166,190,209-223`; S5/S6 and D3 notes |
| R14 | Preserve metadata-only version safeguards and historical/API read contracts without selecting a platform | Design `:135-139,254,280,309-318`; L1/I1 notes |
| R15 | Save/read back only this plan and report actual document checks; retain nonempty Gaps and unverified runtime claims | Approved request `REQUESTS:477-479,499-510,588-606`; current approval |

## Producer/Consumer Contracts

### Shared Envelope and Approval Rules

Every exact R storage type, null rule, physical format, function signature, and new field below is **PROPOSED** unless explicitly identified as inherited source or Decided policy. Approval to save this document does not adopt these contracts. Step 1 must settle or block each contract needed by a selected path.

- Decided identity: country/year ID/acronym/welfare type identifies the survey; module additionally identifies the artifact. Proposed scalar types: country/acronym/welfare/module `character`, year ID `integer`, fractional survey year `double`. Keys must be nonmissing and unambiguous. Do not rename source fields or normalize version labels without an explicit adapter contract.
- Proposed pin: canonical absolute logical artifact path plus stamp version ID, content hash, declared parent path/version pins, physical format, and the matching metadata-version reference. Nonmissing usable pins are required for reuse and release registration. A skipped save's missing returned version is not proof of failure or a usable new pin; resolve the retained pin through stamp's approved interface.
- Proposed provenance: exact package/source commits recorded separately from requested calculation fingerprints; source artifact version, schema identifier, units/period, DLW master/harmonization versions, data type, module, PPP release/adaptation choice, and input-selection policy where applicable. Descriptive versus result-relevant metadata must be classified before versioning decisions.
- Proposed null policy: reject missing/duplicate keys, ambiguous lookups, nonfinite calculation inputs, or missing required pins before a successful stage save. Optional descriptive fields may be absent under an approved schema. Weight/welfare admissibility, zero weights, and statistical missing-value behavior require Andres's approval; do not silently impute or drop rows.
- Distinguish a separately saved metadata artifact from stamp's custom sidecar (`notes/pipload.md:40`; S6). Do not construct snapshot paths in pipload as a replacement for a stable stamp version-aware interface.
- Physical formats must preserve `fst` at current API boundaries. Internal auxiliary/metadata/result formats are Open; QS2 is current wrapper evidence, not a chosen universal format. Version-aware round trips must verify scalar/vector and reserved-key behavior.

### Data and Dependency Matrix

| Edge / owner | Keys and types | Null rules and units | Format and pins | Evidence, compatibility and remaining approval |
|---|---|---|---|---|
| E1 Source auxiliary snapshot -> pipaux -> stamp | CPI source-supported key: `country_code, year, survey_acronym, reporting_level, cpi_year`; proposed character identity/level, integer year/base year, double `cpi_value` and possible `ccf` | Unique complete key; CPI is a base-year conversion ratio; exact construction/normalization and `ccf` consumption Open. Require finite nonzero divisors, subject to approved CPI domain bounds | Cleaned data.table; internal serialization Open; pin cleaned artifact, generator fingerprint, raw source commit/file SHA and input versions separately | A `R/aux_cpi.R:84-98,214-242`; `notes/pipaux.md:24,30-34`; no row-partition mechanism selected; wide test key is not persisted long key |
| E2 Source PPP snapshot -> pipaux -> stamp | Source-supported key: `country_code, reporting_level, ppp_year, release_version, adaptation_version`; proposed character labels/versions, integer PPP year, double PPP value | Complete unique key; proposed PPP units LCU per international unit for selected ICP round; exact source convention must be verified. Finite positive divisor PROPOSED. Default flags are explicit inputs, not a latest lookup at execution | Data.table; internal serialization Open; stamp artifact/version plus raw source and PPP release/adaptation pins | A `R/aux_ppp.R:113-129,251-271,339-344`; `notes/pipaux.md:25,32`; adding a PPP vintage may change selection/default flags |
| E3 Source PFW -> pipaux -> pipdata settings/selection | Saved key is `country_code, surveyid_year, welfare_type`; clean validation uses `country_code, year, welfare_type, is_alt_welf`. Reconciliation Open. Proposed acronym/module in explicit resolved-selection contract, not silently added to saved PK | Keys unique/complete; explicit inclusion/settings and independent CPI/PPP/pop domain choices required. Flags/settings unitless; survey year may be fractional. No default HIST-before-BIN or ambiguous same-welfare winner | PFW data.table with a stamp pin; generated selection is separate versioned data under approved policy; exact schema/physical layout Open | A `R/aux_pfw.R:215-227,427-430,524-547,560-639`; Dp `R/dependency_inputs.R:183-317`; design `:121`; bounded single selection only, not full M3 selector |
| E4 Optional pinned population -> pipdata adjusted weights | Source-supported population key `country_code, year, reporting_level`; proposed double population, matching survey-row area/domain and weight vector | Population changes weights only when used. Proposed unit persons, verify source convention. Require exact selected-year/area coverage and nonzero weight totals; nearest-year/tie behavior Open for this skeleton | Supplied approved population artifact/version, if used, with PFW pop-domain and adjustment-code pins. No unapproved live population fetch or new measure producer | Dp `R/pd_aux_attr.R:159-165,204-210`; `R/pd_deflation.R:439-458,1012-1078`; `notes/pipdata.md:44,53-54`; decide D3 before restricting the primary path or adding required inputs |
| E5 Explicit selection + DLW -> pipdata download/validation | Full module-bearing artifact identity; separate DLW catalog/file/checksum/master/harmonization fields. Proposed source identifier character; year ID integer; data type character | One approved survey/module; no missing source version/checksum/selection. Download availability/validation failure is not a clean artifact. Input welfare period/currency and source weight semantics must be explicit | Harmonized module format/source extension retained until approved reader; stamp raw artifact pin and same-version source metadata; inventory/revision status separate from data success | Dp `R/pipdata_get_gmd.R:503-565`, `R/pipdata_dlw_compare.R:709-723,868-885`; `notes/pipdata.md:19-26,88-90`; only GMD, never raw surveys |
| E6 Validated download + PFW -> pipdata formatted survey | Proposed row alignment key retained from source; exact household/observation PK UNKNOWN, do not invent one. `welfare, weight` double; `area` character when domain resolution needs it; identity in artifact metadata | No invalid download proceeds. Post-format validation before save; welfare LCU per day is Decided. Source annual conversion evidence is not a universal rule for all periods. Duplicate rows, missingness and negative/zero values need explicit rules | data.table with required microdata class/attributes, proposed fst where supported; clean artifact plus rules, source, PFW/selection and metadata pins | Dp `R/pd_dlw_clean.R:183-196`, `R/pd_process_data.R:225-240,330-342`; `notes/pipdata.md:40,81,95`; no row repair/imputation by inference |
| E7 Clean survey + CPI/PPP/PFW (+ population if used) -> pipdata deflation | Join CPI by country/year ID/acronym/base year/level; PPP by country/year/release/adaptation/level. CPI and PPP levels resolve independently. Output `welfare_YYYY` double; keep LCU welfare and aligned final weights explicitly | PPP welfare per day for each supported approved year; inherited algebra `welfare_lcu / ppp / cpi`. Validate required years/levels/divisors. Population is not a welfare divisor. Currency/spatial adjustments and `ccf` inclusion require consumed-input audit | One survey artifact with all `welfare_YYYY` columns; metadata maps each year to selected PPP vintage and domain inputs. One-year name cannot encode several vintages: choose/reject explicitly under D2 | Dp `R/pd_deflation.R:690-709,764-786,807-846,907-928`; W `R/deflate_welfare_mean.R:32-35`; `HARVEST.md:48`; current names conflict with target; retain API adapter |
| E8 Supplied welfare/final weights -> pipster -> pipdata independent mean save | PROPOSED result list or data.table with full artifact ID, PPP year, reporting level, statistic `mean`, scalar double value and unit. One unique row/value per approved identity/year/level; no global mandatory long table | Welfare vector and final weight vector equal length, finite, nonempty; total admissible weight positive. Proposed zero weights allowed, negative weights rejected, no implicit NA removal; obtain D3/D4 approval. Result unit matches PPP welfare per day | pipster returns memory only. pipdata stamps each successful mean independently before assembly; pin deflated artifact, adjusted-weight provenance, mean fingerprint/known helpers and result schema | W `R/md_compute_dist_stats.R:19-28,58-64`; P lacks dedicated mean (`notes/pipster_wbpip.md:25,48,99`). A national mean may depend on area-adjusted population even if welfare did not change |
| E9 Saved results/survey/aux pins -> pipdata test release -> pipload historical read | PROPOSED membership key `(release_id, artifact_role, artifact_id)` with path/version/content-hash/metadata reference; PPP year/vintage and date/purpose explicit; manifest version also pinned | No missing, ambiguous or unverified required member. TEST purpose only. Release cannot advance to a successful registration when a required mean/input fails. No latest-version fallback | PIP-owned manifest stored as an ordinary stamp artifact; internal format Open. Retain exact member and manifest revisions; proposed no-prune isolated M2 fixture. No native stamp release API claimed | S `R/IO_core.R:483-498`; `R/version_store.R:122-146,452-489`; `notes/stamp.md:86-92`; design `:238-256`; full states/atomic multi-writer capture remain later work |
| E10 Optional current-format adapter -> current pipapi | Existing survey file `survey_data/<cache_id>.fst`, numeric `welfare, weight`, area/level mapping; wide metadata uses `cache_id, reporting_level`, CPI/PPP and `survey_mean_ppp`; complete schema/types/nulls UNKNOWN | Current API consumes LCU `welfare` and divides by CPI*PPP. Never relabel already-PPP welfare as current `welfare`; never fabricate missing medians/stats to make a mean-only release look complete | Existing fst names/shape/units only. M2 registers/retrieves a skeleton test release, not an API-ingestable full release. Any partial adapter is tested only against the supplied source-consumed contract | I `R/utils-pipdata.R:274-321`, `R/utils-stats.R:26-60,338-377`; `notes/pipapi.md:43-71,94-109,124-129`; full M5 ingestion and PPP API change deferred |
| E11 pipdata recipe/status facts -> stamp decisions -> pipdata execution/logging | PROPOSED neutral path/version parents, requested code fingerprint, latest success/failure/status proof and reason; output status table keys task/artifact/attempt with character outcome and optional error details | Missing input/status is not proof of success. Deterministic failure waits for review plus input/rule change; external failure eligible next analyst execution. Missing known-helper hash cannot silently be ignored | Generic stamp state/interface Open; pipdata supplies PIP recipes and error classification, receives decisions; persistent manifest/receipts/logs are evidence, not a second authority | S `R/rebuild.R:253-342`, `R/version_store.R:1176-1217`; Dp `R/dependency_execution.R:559-710`; F `R/log_helpers.R:228-262`; no automatic retry loop |

### Proposed Signatures and Compatibility

These are contract sketches, not exported names, exact argument lists, or implementation instructions to create new APIs. Prefer a small correction/extension of existing public interfaces after their fresh source/API check. Do not call private stamp functions or construct its snapshot paths from PIP code as the new stable contract.

| Edge | Signature sketch / existing surface | Compatibility and approval gate |
|---|---|---|
| E1-E3 | Existing evidence `pip_aux_save(x, id, ...) -> pipload::pip_write(...) -> stamp::st_save(...)`; proposed forwarding of explicit format, metadata, code and parent pins | Preserve existing callers. Confirm actual formal arguments and receipt behavior at tested commits; add only the required forwarding/validation. Raw commit detection is not numerical rebuild authority |
| E4/E7 | PROPOSED `resolve_inputs(selection, aux_pins, metadata) -> data + exact consumed inputs`; `deflate(data, inputs) -> data + provenance` | Reuse existing pipdata processing where compatible; these names are placeholders. No partition/projection implementation selected; resolver must not decide currentness |
| E5/E6 | PROPOSED `acquire(selection, source_versions) -> downloaded data + status`; `format_validate(data, settings) -> validated data or typed failure` | Existing acquisition/cleaning and validation helpers are candidates. Preserve legacy API names where used; keep save after successful validation |
| E8 | PROPOSED `mean(welfare, weight) -> list or data.table`; pipdata adds identity/provenance and independently calls the save adapter | Exact public function/output shape Open. Use collapse weighted statistics; no paths, aliases, release selection, IO, or planner in pipster |
| E9 | PROPOSED `register_test_release(release_spec, member_pins) -> manifest_pin`; `load_release(manifest_pin) -> verified pinned members` | Caller-owned pipdata membership; pipload access delegates all version resolution to stamp. No inferred native stamp release signature |
| E11 | PROPOSED neutral `plan(targets, requested_fingerprints, status) -> decisions`; `record_outcome(...)`; version-aware metadata `read_metadata(path, version)` | Extend existing `st_plan_rebuild`, `st_rebuild`, `st_is_stale`, `st_save`, metadata/version access only after maintainers approve semantics. These sketches do not fix an API or make pipdata the scheduler |
| Engine | PROPOSED one pipdata entry point taking a release specification, bounded selection and approved mode, returning a data.table outcome | Illustrative `run(release, scope, mode)` remains illustrative. Preserve current exported contracts; do not create another package or choose hosting |

## Generic Stamp Gaps and Authority

No gap in this section is claimed closed. All repairs are proposed work in stamp's own repository, not pipsystem implementation.

| Gap | Inherited source assertion | Required M2 mechanism and evidence |
|---|---|---|
| Requested code currentness | `st_is_stale` compares immediate parent versions, not requested code; function hash omits environments/transitive helpers (S `R/version_store.R:1176-1217`; `R/hashing.R:318-342,500-529`; notes `:19-23`) | Neutral comparison before selection, curated known result-affecting dependency coverage, explicit absent/NA hash policy. Test relevant function/helper/config change and unrelated package edit |
| Transitive planning/order/cycles | Propagate frontier stops a simple A-B-C chain; strict compares immediate pins; levels are not a general topological order (S `R/rebuild.R:400-518`; notes `:57-68`) | Finite visited/cycle validation, dependency-safe multi-target order, current-lineage verification after execution. Replan/recheck inside stamp so cutoff and failed-parent blocks are correct |
| Unchanged output and receipts | Parent-only saves can skip; skipped receipt lacks a version and executor calls it failed (S `R/IO_core.R:253-269`; `R/rebuild.R:311-327`; notes `:29-35`) | Record successful execution against new parent pins while retaining historical provenance; resolve a usable retained output pin; avoid endless rebuilds and unnecessary descendants when approved result-dependency signal is unchanged. Exact provenance/version mechanism Open under D5 |
| Missing/failed state | Missing child/parent version can return FALSE; catalog lacks persistent failure state; dependents can run after a parent fails (S `R/version_store.R:122-146,1181-1217`; `R/rebuild.R:253-342`; notes `:66-70`) | Neutral status/availability inputs and durable outcomes with approved failure classification, retry eligibility and blocked dependencies. Missing required parent is blocked, not current. No timers/automatic retries |
| Metadata versions/history | Save predicate ignores metadata; current sidecar readers lack a version selector; reserved keys/type round trips not validated (S `R/IO_core.R:253-269,630-660`; `R/format_registry.R:267-347`; notes `:74-82`) | Approved result-relevant metadata change creates an immutable version; data-free same-version metadata access; collision/type validation; stable public access. Descriptive edits need not force versions |
| Addressable parents/unchanged pins | Partition paths are ordinary artifacts, but auto-save yields NA for skipped parts and does not remove keys (S `R/partitions.R:175-212,342-428`; notes `:9-15`) | Ordinary explicit path/version parent contracts and unchanged-pin recovery. Selective mapping/deletion mechanics need separate M1 R1 approval; do not adopt partitions as the solution here |
| Publication/retention integrity | Artifact/sidecar/catalog/snapshot publication is not transactional; optional pruning can erase retained pins (S `R/IO_core.R:347-408`; `R/retention.R:415-435`; notes `:45-49,88-92`) | Required serial M2 checks reject partial/missing pinned states and retain test members. Do not claim atomic multi-writer release capture, lock/SMB safety, or production retention certification |

### Reconcile pipdata's Current Manifest/Planner

Current pipdata compares records, hashes/projections and fingerprints to decide work (Dp `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`; `notes/pipdata.md:99-118`). This conflicts with the Decided stamp authority. Reusing transformations is not approval of those currentness rules.

Proposed reconciliation, subject to the fresh API and work-set gate:

1. Retain acquisition/validation inventories, immutable receipts, failure facts, and safe storage/fencing checks as evidence where compatible. Do not delete operational safeguards solely to reduce code.
2. Pipdata resolves PIP inputs, constructs recipes/desired fingerprints, and supplies facts to neutral stamp APIs. Stamp returns all run/skip/blocked decisions and reasons.
3. Remove or adapt the duplicate numerical currentness predicates on the approved M2 route. The dependency manifest can record inputs and outcomes but cannot override stamp decisions. Do not build a shadow scheduler that merges two authorities.
4. Establish one source of truth for status, parents, fingerprints and versions. Exact migration/deprecation/compatibility for existing callers is Open; tests must identify any remaining old path and prevent accidental use for the skeleton.
5. Pipload handles names/aliases/PIP lookup and forwards pinned access. Logs record outcomes; neither inventory signatures nor logs decide calculation currentness.

The source's Windows/SMB activation gate remains unverified (Dp `R/pd_run_pipeline.R:329-332`; `notes/pipdata.md:118`). No planning approval removes it.

## Decisions and Gaps

### Decisions Needed From Andres

These decisions are not granted by document approval. M1 R1 remains Open. Obtain the exact applicable decision before the affected behavior, and separately approve any future protected-design update.

| ID | Exact decision needed | Blocks |
|---|---|---|
| D1 | Which single GMD survey, module/data type, welfare type, reporting coverage and source versions are accepted for M2? Supply explicit HIST/BIN or competing-survey choice if applicable; approve the bounded generated-selection schema/source without building the full M3 selector | Download and valid identity/selection inputs |
| D2 | Which PPP release/adaptation vintage is selected for each `welfare_YYYY`, and what should happen when several vintages or missing CPI/PPP year/level matches exist? Approve the PFW saved-key/validation-key reconciliation and exact CPI/currency/spatial consumed inputs | Auxiliary validation, deflation, current-format compatibility |
| D3 | Does the primary survey require population-adjusted weights? Approve weight/welfare admissibility, normalization, year/area matching, zero-weight/NA policy, and any additional pinned population input scope. National output alone does not prove adjustment absent | Deflation and mean dependency completeness |
| D4 | Approve the minimal mean result key/type/unit/list-or-data.table contract, physical save format, identity mapping, and synthetic numerical tolerance; approve the small engine/status feedback contract and Force interaction with failed work | Pure mean, independent storage, engine mode tests |
| D5 | Approve neutral stamp status and missing/NA fingerprint policy, result-relevant metadata schema, and unchanged-output provenance/version semantics that keep old pinned history valid while the latest successful execution becomes current | Generic stamp API repair and recovery checks |
| D6 | Approve the single-writer TEST manifest schema, required member roles, retained pins and isolated storage/retention assumptions; confirm that M2 registration/retrieval is not full API ingestion | Test-release write/readback |
| D7 | If completing consumed-row CPI selectivity requires a mechanism, decide M1 R1 explicitly using S1/A1/D2. Partitions or comparison/projection remain alternatives; unrelated-row avoidance cannot be certified by whole-file parent pins alone | Required T3 and M2 completion; does not add R1 to the documentary start gate |
| D8 | Approve repository-local saved Plans, exact work sets, lifecycle outputs/progress fields, owners, dependency commits, test roots/runtime and API compatibility. Require an exact safe full-suite command or directly approved workflow-compatible substitute after inspecting setup/teardown, resource access and exclusions. Record skipped/excluded checks; absence of a safe gate blocks before implementation | All future implementation, local phase completion and parallel proposals |

### Gaps

- UNKNOWN: fresh package HEADs/dirty states, implementation owners, concurrent write sets, installed dependency versions, source auxiliary commits and actual tested pins. Historical full SHAs are evidence only.
- Open: M1 R1, exact consumed-value mapping including unused CPI levels/years, removal/exclusion behavior, PFW key reconciliation, survey-choice input locations, PPP-vintage selection, and any required population input. A bounded fixture is not general selective invalidation.
- Open: generic stamp code-only planning, topological/cycle handling, successful-unchanged lineage, failed/missing state, version-aware metadata, collisions/type preservation, and stable access contracts. No repairs or tests ran here.
- UNKNOWN: execution-time R/dlw access, safe test storage, filelock availability/timeout behavior, Windows/SMB fencing and rename/read safety. Serial synthetic checks do not establish network-drive or parallel production safety.
- UNKNOWN: production numerical/API equivalence, complete production schemas/null rules/writer units, custom PPP behavior, and old-release live availability. Synthetic expected values are future checks, not production-equivalence evidence.
- Open/deferred: full selection implementation, every auxiliary measure, all estimates, grouped/lineup/missing-country methods, full release correction/freeze/retention machinery, target-scale performance, platform/interface, targets replacement and logging relocation.
- Original planning-task document validation and protected-hash checks passed in that task's response. Current revised-plan validation/re-review results must be reported in the review handoff from actual checks. Neither proves any package/runtime capability.

## Implementation Steps

All steps below are **PROPOSED future work**. Each package change requires direct approval in that repository's own session/work branch, with fresh baseline, owner/write-set check, compatible dependencies, allowed test roots and required lifecycle evidence. No phase below grants package, roadmap or report permissions in this planning session.

## Phase 1: Contract Gates, Generic Stamp, and Engine

### 1. Stabilize the Bounded Contracts and Work Orders

- **Requirements**: R1, R2, R10, R11, R12, R14, R15
- **Features**: `close-stamp-gaps-for-skeleton`, `create-engine-skeleton` contract prerequisites only; no added feature.
- **Owner**: package maintainers and user-selected integration owner, assignments UNKNOWN.
- **Files**: proposed later package-local interface/tests/doc changes only; exact paths follow the Write-Set table. Current plan/design/roadmap remain read-only unless separately approved.
- **Details**: recheck the documentary gate and current policy; settle D1-D6/D8 as needed; leave M1 R1 Open until D7 is separately decided. Convert relevant E1-E11 proposals into approved bounded contracts. Audit current public APIs and dependency directions at fresh SHAs. Approve failure/fingerprint/metadata/lineage semantics before coding. Agree exact package write sets and test evidence locations; resolve target ownership conflicts and future lifecycle outputs. Prepare separately approved saved Plans in each target repository, not an inline work order or an execution of this umbrella. Inspect test setup/teardown and external/shared-storage access; approve a safe full-suite gate or compatible substitute and record exclusions before implementation. Identify the CPI control and adjusted-weight cases without fetching production data. No selected path may use UNKNOWN units, ambiguous keys or missing dependency inputs.
- **Dependencies**: inherited S1/A1/D2 and confirmed M0/M1 policy; no runtime dependency pin yet tested.
- **Test Scenarios**: explicit single microdata selection; ambiguous PFW/PPP mapping; absent population when adjustment is needed; unavailable hash; conflicting ownership; cycles; denied repository path.
- **Tests**: future executed contract validation fixtures and dependency/API checks in approved repositories; source-read assertions alone do not prove runtime contracts.
- **Acceptance criteria**: V1; every used contract has an approval and evidence path, fresh observed dependency commits are recorded, local saved Plans name the pins to test and safe suite gates, actual work sets are disjoint or sequenced, and unresolved behavior is blocked rather than inferred. An incoming untested commit is not called tested; a producer's executed pin evidence is required before dependent integration. Contract approval is not implementation approval.

### 2. Close and Test the Required Generic Stamp Mechanisms

- **Requirements**: R1, R10, R11, R13, R14
- **Features**: `close-stamp-gaps-for-skeleton`.
- **Owner**: stamp, in its own approved repository.
- **Files**: candidate inherited `R/rebuild.R`, `R/version_store.R`, `R/IO_core.R`, `R/hashing.R`, `R/format_registry.R`; narrow testthat files and generated API docs if separately approved.
- **Details**: implement the approved neutral pre-execution fingerprint/status comparison, transitive dependency-safe ordering/cycle guard, missing/failed-parent handling, usable skipped-save receipt, successful-unchanged provenance reconciliation, and metadata-only/historical access. Use ordinary artifact path/version pins; do not add PIP vocabulary, release registry, general dependency discovery or an R1 algorithm. Preserve historical snapshots while making current execution state auditable. Recheck downstream currentness after each upstream result, including early cutoff and failure. Serialization/receipt checks must reject partial saved state before reuse.
- **Dependencies**: Step 1's approved generic contracts; fresh stamp commit and storage dependency versions.
- **Test Scenarios**: chain and diamond/multi-target order; cycle rejection; relevant helper/code-only change; absent/NA hash; unchanged B output after A changes; missing snapshot/parent; deterministic versus external failure; metadata-only semantic change; pinned old metadata.
- **Tests**: L-stamp neutral-node regressions for code/helper hashes, missing/failed state, metadata, unchanged lineage and graph order, plus the approved safe full-suite gate. Proposed `test-m2-rebuild.R`, `test-m2-state.R`, `test-m2-metadata.R` only if existing files cannot hold the cases. Reuse/extend inherited save/version/parent tests. Mean/deflation-specific and complete-skeleton T4-T8/T12 remain Phase 4 integration obligations; do not require those later stages to complete this step.
- **Acceptance criteria**: V2-V5 with actual test results and exact commit/runtime pins. The returned signatures, receipt/status meanings and historical behavior are stable for downstream integration. Generic gap closure remains unverified until those results exist.

### 3. Integrate Stamp Authority With the Minimal pipdata Engine

- **Requirements**: R2, R10, R11, R13, R14
- **Features**: `create-engine-skeleton`.
- **Owner**: pipdata coordination; pipload adapter corrections are a separate approved repository sub-work set under the same feature, not another feature.
- **Files**: inherited pipdata `R/pd_run_pipeline.R`, `R/dependency_execution.R`, `R/dependency_plan.R`, `R/dependency_contract.R`, `R/save_pip.R`, `R/code_fingerprint.R`; pipload `R/pip_read-write.R`, relevant format and metadata-loading files; exact minimal entry-point file Open.
- **Details**: keep release coordination separate from survey transformations. Implement the approved single public entry point with bounded incremental/Force behavior; do not fix the illustrative signature. Apply the Manifest Reconciliation sequence. Preserve receipts/status/fencing safeguards, but make stamp the only selector. Forward explicit parents, fingerprints and metadata pins through pipload/stamp. Add a small returned data.table with outcomes/reasons; persistent run records are separate. A full scoped/plan-only analyst interface belongs to M3; any internal decision-query seam must be side-effect-free. Do not let runtime timestamps/log checkpoint code create new result versions on unchanged runs.
- **Dependencies**: tested Step 2 stamp interface; approved pipdata/pipload API contract and supported fst/QS2 paths. Check pipload's load-then-deflate convenience path for an existing reverse dependency before introducing package cycles.
- **Test Scenarios**: stamp skip/run/blocked decisions respected; contradictory manifest facts cannot independently select work; unavailable version/metadata; format mismatch; failed upstream blocks downstream; Force behavior per D4/D5, no implicit failed-work override.
- **Tests**: L-authority with small neutral producer functions and real approved storage adapters: decision forwarding, pinned format/metadata round trips, failure block and outcome records; approved safe full-suite gate. These tests establish the engine/adapter boundary without requiring a future mean or release manifest. Complete T6,T8,T11,T12 integration remains Phase 4.
- **Acceptance criteria**: V6 and E11 round-trip evidence; no independent pipdata or pipload currentness rule on the skeleton path; entry point and adapter API compatibility established at pinned commits. Other legacy callers are preserved or handled by an explicitly approved migration.

## Phase 2: Auxiliary Inputs and One Validated Survey

### 4. Save CPI, PPP, and PFW Through Stamp

- **Requirements**: R3, R10, R11, R12, R14
- **Features**: `save-cpi-ppp-and-pfw-through-stamp`.
- **Owner**: pipaux; pipload provides access; stamp stores/version-selects.
- **Files**: candidate `R/aux_cpi.R`, `R/aux_ppp.R`, `R/aux_pfw.R`, `R/utils.R`, narrowly applicable status/changes code and tests. Do not expand to all auxiliary series.
- **Details**: validate E1-E3 against approved pinned source fixtures/snapshots, resolve the PFW key mismatch and explicit settings, and register parents/code/source metadata through approved interfaces. Source-commit detection prompts inspection; cleaned content and approved semantic metadata determine whether a saved result/dependent changes. Resolve stable pins after skipped saves. Confirm default PPP selection changes are represented. For the skeleton, accept explicit approved source inputs rather than an unpinned remote dependency graph. Optional population needed by E4 must have approved supplied pins; a new population producer/fetch requires additional scope before implementation.
- **Dependencies**: Steps 1-3, pinned source/cleaning rules, approved adapter formats; no R1 mechanism implied by saving whole measures.
- **Test Scenarios**: unchanged source and data-neutral commit; one consumed CPI change; duplicate persisted CPI key; PFW exclusion/ambiguity; added PPP vintage/default change; skipped save with a missing returned version.
- **Tests**: L-aux repeats actual auxiliary save/readback against isolated fixtures, checks data-neutral commit handling, key validation, metadata versioning and retained pins; approved safe full-suite gate. Complete-run T1/T3 and later dependent-stage call counts are Phase 4 obligations, not prerequisites for this step.
- **Acceptance criteria**: V7: three validated, pinned and retrievable auxiliary artifacts with explicit metadata; repeated identical cleaned inputs and data-neutral source commits do not create an unnecessary auxiliary version; PFW/key/PPP decisions recorded. This does not prove downstream selective scheduling, which remains a final check under D7.

### 5. Download One Explicitly Selected GMD Survey

- **Requirements**: R4, R10, R11, R13, R14
- **Features**: `download-one-survey`.
- **Owner**: pipdata acquisition with dlw dependency.
- **Files**: candidate `R/pipdata_get_gmd.R`, `R/pipdata_dlw_compare.R`, inventory/selection helpers and narrowly scoped acquisition tests.
- **Details**: supply D1's approved full module-bearing selection, not a legacy preferred-module default. Register the bounded generated selection and source-version evidence required by policy without implementing the full M3 survey selector. Freeze DLW versions/checksum and record download availability/validation outcomes. Preserve old module identities/versions. A wrong or unavailable download records needs-revision/failure facts and cannot enter the successful processing path. Begin with mocks/fixtures; an actual one-survey DLW acquisition requires separate authorized access and approved nonproduction storage, never this planning task.
- **Dependencies**: engine/adapter contracts and explicit selection/PFW, fresh dlw runtime/API evidence. Candidate parallelism with Step 4 is conditional, not authorized.
- **Test Scenarios**: correct version/module; changed master/harmonization with identical values; wrong checksum/module; unavailable service; ambiguous selection; unchanged version lookup without redundant download.
- **Tests**: L-acquire acquisition/validation inventory and metadata cases, source-call counters and approved safe full-suite gate. Record mock tests separately from the authorized one-survey acquisition; do not require later mean/release recovery or a complete pipeline for local acquisition evidence.
- **Acceptance criteria**: V8 acquisition portion: exactly the accepted source identity/version and retrievable metadata; invalid/failed acquisition blocks clean/deflate/mean/release, while unaffected control work can continue. Live download remains unverified until authorized and executed.

### 6. Format and Validate Before Saving

- **Requirements**: R5, R10, R11, R13, R14
- **Features**: `format-and-validate-one-survey`.
- **Owner**: pipdata processing, separate from coordination.
- **Files**: candidate `R/pd_dlw_clean.R`, `R/pd_process_data.R`, `R/dependency_execution.R`, `R/pipdata_dlw_validation.R`, `inst/extdata/validation_spec.yml`, `R/save_pip.R`, related tests.
- **Details**: reuse formatting helpers only after verifying their source-period and class contracts. Enforce valid acquisition status and active post-format validation before save. Current invalid-row retention/no-save mismatch is an inherited contradiction, not a reproduced production failure (`notes/pipdata.md:95`). Validation outcomes persist separately; an invalid formatted table creates no successful clean output/version. Retain boundary checks before downstream reading. Curate rule/YAML/helper fingerprints, not only top-level function bodies. Do not repair errors, drop inconvenient rows or change scientific missing-value policy by inference.
- **Dependencies**: Step 5 accepted source; Step 4 approved PFW/source settings; D3 quality/unit rules and Step 2 status behavior.
- **Test Scenarios**: correct LCU/day formatting; wrong period; missing/ambiguous keys; invalid downloaded status; missing/nonfinite welfare/weights; changed validation rule; storage failure after a valid table.
- **Tests**: L-format with spies for every clean-save entry point and actual before/after clean catalog/version inventories, not only an expected error; approved safe full-suite gate. Extend valid/invalid completed-inventory tests with the actual clean path. Final downstream failure/no-save integration remains T6/T10.
- **Acceptance criteria**: V8 validation portion and V9 input contract: valid data passes source/class/unit checks and saves through stamp; invalid data has zero clean-save calls/versions and no downstream successful artifact. Failure records are not misreported as successful data saves.

## Phase 3: Deflation and Independently Saved Mean

### 7. Deflate With Exact Input and Weight Dependencies

- **Requirements**: R6, R10, R11, R13, R14
- **Features**: `deflate-one-survey`.
- **Owner**: pipdata processing; stamp decides currentness.
- **Files**: candidate `R/pd_deflation.R`, `R/pd_aux_attr.R`, `R/pd_cpfw_merge.R`, `R/dependency_inputs.R`, `R/pd_deflate_pipeline.R`, exact-input/deflation tests.
- **Details**: freeze E7's approved source/CPI/PPP/PFW/selection pins, audit actual consumed values (not the existing broad projection by assumption), and preserve independent national/area CPI/PPP resolution. Produce `welfare_YYYY` dynamically for the approved available years, with explicit PPP-vintage metadata. Retain LCU welfare for current API compatibility. Reject ambiguous multi-vintage-to-one-column mappings. If population adjustment is used, pin population/domain/adjustment rules and carry final weights into the result dependency graph. A national mean can depend on changed area population. Do not infer M1 R1 or add a second currentness comparison; D7 gates selective mapping integration.
- **Dependencies**: validated survey (Step 6), auxiliary pins (Step 4), D2/D3, and generic mechanisms (Phase 1). All-year survey storage/PPP-wide recalculation remains the Decided trade-off.
- **Test Scenarios**: single-year exact fixture; added PPP year; missing/duplicate vintage; mixed CPI/PPP domains; zero divisor; population-only weight change with identical welfare; unrelated area/year CPI change; consumed CPI change.
- **Tests**: L-calc deflation subcases with actual transformation/storage: arithmetic, dynamic years, domain/vintage validation and population-weight provenance; approved safe full-suite gate. Complete-skeleton CPI-selectivity/call-count and graph integration remains T2/T3/T12 in Phase 4. Do not count replacement workers as a numerical deflation test.
- **Acceptance criteria**: V9: explicit consumed-input and adjusted-weight provenance, supported dynamic naming/year behavior, approved units and validated output/pins; compatible LCU welfare retained. Approve D7 before implementing any selective mechanism needed here, but final T3 does not block this local evidence boundary solely because a later release is absent.

### 8. Compute and Independently Save the Mean

- **Requirements**: R7, R10, R11, R13, R14
- **Features**: `compute-the-mean`.
- **Owner**: pipster for the pure calculation; pipdata for selection/supply/save/recovery.
- **Files**: pipster's smallest approved new mean entry point and unit test if no suitable current function exists; pipdata's separate result-save/assembly seam and tests. Generated namespace/docs only in separately approved package scope.
- **Details**: implement the approved mean contract using collapse weighted statistics on supplied welfare and final weights, with data.table for table outputs. Inherited wbpip reference uses `fmean(welfare, w = weight)` (W `R/md_compute_dist_stats.R:19-28`); pipster's existing supplied grouped mean is not a dedicated microdata estimator. One statistic is mean; call it for each approved welfare year needed by the input contract without hardcoding years. Pipdata supplies identity/provenance and independently saves each successful result through stamp before assembly. Track all result-affecting mean helpers and adjusted-weight dependencies. No pipster path, storage alias, selection or release logic.
- **Dependencies**: Step 7 data and D3/D4 contract; tested pipster/collapse interface and Phase 1 save/receipt behavior.
- **Test Scenarios**: simple weighted mean, zero/negative/missing weights per approved rule, empty vectors, unequal lengths, population-adjusted national mean, helper-only code change, save failure, assembly failure after successful save.
- **Tests**: L-calc mean subcases, pure mean/helper tests and actual independent save/recovery with an injected assembly failure, plus the approved safe full-suite gate. The injected failure needs no completed release implementation. Proposed analytic oracle: welfare `c(1, 3)` with weights `c(1, 3)` gives mean `2.5`; zero-weight invariance and common-weight scaling checks if D3 allows them. Declare tolerance before execution; final real-assembly T4/T5/T9/T10 integration is still required and is not production equality.
- **Acceptance criteria**: V10: a pure result satisfies the approved keys/type/unit contract, and a separately pinned stored mean survives assembly failure. Recovery loads/verifies it without rerunning pipster when stamp says it is current; a missing/corrupt result is not reusable.

## Phase 4: Pinned Test Release and Incremental Evidence

### 9. Register and Retrieve the Test Release

- **Requirements**: R8, R10, R11, R13, R14
- **Features**: `register-test-release`.
- **Owner**: pipdata release coordination; pipload delegates historical access to stamp.
- **Files**: smallest approved pipdata release-manifest entry point/tests and pipload pinned-access corrections where required. No pipapi changes.
- **Details**: validate D6's TEST release specification and required members, including source, clean/deflated survey, relevant auxiliary/settings/selection, optional adjusted-weight inputs, independently saved mean and matching metadata. Pin the manifest's own version as well as each member. Verify snapshots/metadata exist before successful registration; latest catalog state is not membership. After newer data/metadata versions are written in the isolated fixture, load the older release by its manifest pin and verify exact original members. Missing pins fail clearly with no latest fallback. Retain test versions; do not enable pruning. No full production lifecycle, atomic parallel capture or ingestion is implied.
- **Dependencies**: successful saved mean and input graph (Step 8), stable version-aware access, D6, approved serial test storage/runtime.
- **Test Scenarios**: valid TEST specification; missing member; ambiguous version; newer module metadata; removed snapshot; valid older manifest; attempted non-TEST/invalid scope; assembly/registration failure after independent mean save.
- **Tests**: T7, T10-T11; actual stamp and pipload readback, not files manually placed in a presumed version layout.
- **Acceptance criteria**: V11: pinned historical TEST retrieval returns original data and same-version metadata or an explicit missing-version error, with no mixed-latest members. The release is a skeleton test artifact, not a complete API release.

### 10. Execute the Incremental and Recovery Acceptance Suite

- **Requirements**: R9, R10, R11, R12, R13, R14
- **Features**: `test-incremental-reruns`; validates all eight preceding features without adding features.
- **Owner**: user-selected integration owner UNKNOWN; proposed main integration test home is pipdata, with generic regressions in stamp and pure mean tests in pipster.
- **Files**: proposed package-local M2 integration tests/fixtures and approved evidence outputs in those repositories. This session creates none.
- **Details**: use actual transformations, approved real storage adapters and pinned dependencies in an isolated serial test root. Primary path has one survey/mean/TEST release; an unaffected synthetic artifact chain supplies the control, not a second production survey. Separate full-source and consumed-row changes. Record work-decision reasons, function call counts, successful-save attempts, artifact/version inventories, input/output hashes, fingerprints, metadata versions and release pins before/after each case. Reset fixtures between cases, then test convergence without reset. Check no numerical/file rewrites for unchanged/unrelated cases; do not hide writes behind identical hashes. Revalidate pinned prior release after each mutation.
- **Dependencies**: Steps 1-9 with exact tested commits; D7 before completing consumed-row selectivity; fresh ownership/cycle checks and separately approved runtime/access.
- **Test Scenarios**: all T1-T12 below, including no-change second/third runs, CPI-dependent-only work, unrelated helpers/package edits, failure/missing recovery and metadata history.
- **Tests**: explicit package-local testthat files using authorized fixture roots; later commands may be `testthat::test_file(<approved-test-file>)` or the package's verified equivalent. Record actual commands, exits, skips, fixture/runtime versions and pins. Commands/filenames are proposals until fresh test infrastructure is checked.
- **Acceptance criteria**: V12-V14 and all core T1-T12 cases have executed passing evidence at the recorded pins. A blocked, failed, skipped or unavailable core case retains blocked/incomplete status; it cannot be waived as an execution exception. A separate explicit scope/policy revision is required to change the minimum M2 outcome. No feature status is automatically changed by a test result or this plan.

## Proposed Write Sets and Integration Order

All paths in this table are **package-relative candidates inherited from notes**, not an approved exact edit set or a fresh file inventory. Future owners must narrow them after current-source inspection. New tests/function files are PROPOSED. Package roots are historical locations from `HARVEST.md:13-20`, not permission to write there from pipsystem.

| Package / feature mapping | Proposed separate-repository write set | Dependency and ownership gate |
|---|---|---|
| stamp / `close-stamp-gaps-for-skeleton` | `R/rebuild.R`, `R/version_store.R`, `R/IO_core.R`, `R/hashing.R`, `R/format_registry.R`; applicable existing tests or `tests/testthat/test-m2-*.R`; docs/namespace only if API extension approved | Generic contracts first; one owner for shared state/save files; no partition implementation inferred |
| pipload / supporting `create-engine-skeleton`, `register-test-release` | `R/pip_read-write.R`, `R/load_pip_data.R`, `R/load_aux_data.R`, `R/pip_inv_enrich.R`; focused pinned-format/metadata tests | Tested stamp interface first; neutral version access and compatible public forwarding; inspect dependency cycle risk |
| pipaux / `save-cpi-ppp-and-pfw-through-stamp` | `R/aux_cpi.R`, `R/aux_ppp.R`, `R/aux_pfw.R`, `R/utils.R`, narrowly required status code; existing CPI/PPP/PFW/save tests | Stable pipload/stamp contracts and PFW/PPP decisions; single owner for shared wrapper/status code; no all-series expansion |
| pipdata coordination / `create-engine-skeleton`, `compute-the-mean`, `register-test-release`, `test-incremental-reruns` | `R/pd_run_pipeline.R`, `R/dependency_execution.R`, `R/dependency_plan.R`, `R/dependency_contract.R`, `R/code_fingerprint.R`, `R/save_pip.R`; smallest approved entry-point/result/release files; related integration tests | Stamp authority and interfaces proven; shared engine/save/fingerprint files prevent unchecked parallel writers |
| pipdata acquisition/format / `download-one-survey`, `format-and-validate-one-survey` | `R/pipdata_get_gmd.R`, `R/pipdata_dlw_compare.R`, `R/pd_dlw_clean.R`, `R/pd_process_data.R`, `R/pipdata_dlw_validation.R`, `inst/extdata/validation_spec.yml`; related tests | Explicit selection and quality/period rules; coordinate overlap in execution/save/fingerprint code |
| pipdata deflation / `deflate-one-survey` | `R/pd_deflation.R`, `R/pd_aux_attr.R`, `R/pd_cpfw_merge.R`, `R/dependency_inputs.R`, `R/pd_deflate_pipeline.R`; exact-input/deflation tests | Clean and aux contracts/pins; D2/D3 and D7 as needed; shared manifest/inputs/fingerprints sequenced |
| pipster / `compute-the-mean` | Minimal approved pure mean function, focused test and roxygen docs; namespace only through package tooling under separate permission | Approved E8 contract; no I/O/selection/assembly; fresh collapse/pipster dependencies |
| pipfun, wbpip, pipapi | No proposed required edits for M2; pinned utilities/reference/API boundary only | Fresh permitted read/test scope needed later. No logging migration or API PPP change here |
| pipsystem / this planning task | `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md` only | Direct approval and contract-preview approval; no coordination/roadmap/lifecycle output |

Integration order: approved contracts and fresh pins -> generic stamp fixes/tests -> pipload pinned access and pipdata authority reconciliation -> CPI/PPP/PFW and acquisition -> format validation -> exact deflation/weights -> pure mean plus independent save -> TEST manifest/readback -> incremental evidence. This sequence refines the strategy's dependency table without adding roadmap dependency fields.

Logical artifact graph: source aux -> validated aux -> resolved consumed inputs/settings; DLW source + explicit selection -> downloaded survey -> validated clean survey; clean + consumed CPI/PPP/PFW + optional population/weight rules -> deflated survey/final weights -> independent mean -> TEST manifest. A release specification may parameterize the run but must not depend on its own completed manifest. Do not add the manifest as a parent of results it contains. Verify cycles and current versus historical reverse links in stamp.

The proposed code dependency direction is PIP packages -> stamp, pipdata coordination -> pipaux/pipload/pipster, pipaux -> pipload, pipload -> stamp. Fresh DESCRIPTION/API inspection must check existing convenience dependencies, including pipload's call into pipdata, before adding edges. Actual package dependency graph/cycles are UNKNOWN; the artifact DAG sketch does not prove package acyclicity.

### Conditional Parallelism Assessment

No worker is assigned or started. Other ownership/liveness remains UNKNOWN.

| Candidate | Independence conditions | Reasons to sequence / missing evidence |
|---|---|---|
| pipaux auxiliary work and pipdata acquisition | After stable stamp/adapter contracts, explicit survey/PFW schema and fixed disjoint repo work sets | Shared settings/identity/interfaces can still change; fresh owners, branches, exact pins and tests absent |
| pipster pure mean unit implementation and auxiliary/acquisition work | After approved E8 and weight/null rules; use supplied synthetic vectors, no storage integration | Mean key/format/adjusted-weight policy unresolved; integration cannot precede deflated input/save contract |
| stamp metadata and rebuild changes | Only after exact per-file ownership and stable receipt/state contracts | Both touch IO/version state and parent/version semantics; proposed default is one sequenced owner, not concurrent writers |
| pipdata engine, formatting, deflation, result-save, release work | Only with an explicitly checked file/interface split and frozen integration commits | Shared `dependency_execution`, `dependency_inputs`, `code_fingerprint`, `save_pip`, tests and manifests; interfaces/cycles/ownership not verified |

Before any concurrent proposal, require current package roots/branches/base/current SHAs/dirty files, owner and exact write set, producer/consumer signatures and schema versions, tested dependency pins, cycle check, shared-file check, storage-write model and merge/integration approval. Missing inventory is not evidence of no workers. Conditional independence is not permission to launch.

### Repository-Local Work Handoff

This document is ready as a reviewed umbrella input to execution planning, not as an approved local execution Plan. `/cg-work` executes an approved saved Plan, validates its contract, creates an execution report and active-state record, and gates phase completion on executed evidence (`.kilo/commands/cg-work.md:32-62,65-93,115-120,174-187`). A prose package work order or selection of this umbrella in another checkout does not satisfy that contract.

Before the first package change, the user must separately authorize preparation and execution of a saved Plan in that package's own repository/session, under that repository's instructions. Proposed canonical location is `.cg-docs/plans/<date>-m2-<package>-<bounded-scope>.md`; no such file is created here. A local Plan must contain:

1. Its verified repository/root, session identity or approved inventory limit, branch/base/current SHA, current dirty files, assigned owner and exact nonconflicting write set.
2. The selected umbrella step/feature IDs and approved contracts/decisions; no automatic approval of D1-D8, R1, or package work is inferred from this review.
3. Only that repository's implementation steps and local phase gates. Cross-repository changes are separate Plans; dependent integration waits for producer evidence at exact tested commits.
4. Incoming observed commits distinguished from tested commits; exact compatible runtime versions, fixture/source pins, API contracts, local test commands and full-suite phase gate.
5. Test setup/teardown inspection, all filesystem/network/shared-storage access, authorized roots, explicit exclusions/skips and containment checks. Targeted `testthat::test_file()` alone is not the full-suite gate. An alternative gate requires direct workflow-compatible approval before implementation; required core evidence cannot be excluded.
6. Exact authorized output paths for code/tests/generated package docs, local `.cg-docs/work-reports/<approved-name>.md`, `.cg-docs/active-state/current.json`, and local Plan progress fields. Report collisions/alternate paths and any roadmap writer/helper dispatch require their own applicable scope. No lifecycle update is authorized in this pipsystem review.
7. Local acceptance evidence, nonempty gaps, stop conditions and return handoff with commits/pins actually tested, changed files, executed commands/results, exclusions and unresolved blockers.

The first downstream unit is contract/API/test-safety preparation and then stamp generic-gap work, not the complete engine. D5/D8 and a safe local suite gate must be resolved for that unit; later survey-specific decisions need only be resolved before their affected units. All mandatory decisions must eventually be resolved for full M2 completion. No tested producer pin exists yet.

**Command handoff:** after the target repository's local Plan and lifecycle scope are directly approved, explicitly select/confirm that saved Plan and invoke `/cg-work phase1` in that repository. Confirm the selected path before any mutation; do not allow most-recent-plan fallback to select this umbrella or an unrelated Plan. Without those inputs, `/cg-work` must halt before report/progress/code writes. The current next action is separately approved repository-local execution planning, not `/cg-work` on this pipsystem file.

Local execution completion never directly changes this umbrella's `completed-phases` or the roadmap. Consolidated milestone evidence and any umbrella progress/roadmap update require separate authorized pipsystem work. This prevents one package's success from completing a cross-repository phase or all nine linked features.

## Testing Strategy

### Document Checks in This Planning Task

- Read the saved canonical Markdown completely; verify actual path/frontmatter, four `## Phase N:` headings, globally numbered steps 1-10, unique R1-R15 IDs and step coverage, all nine exact feature IDs, required contract fields and nonempty Gaps.
- Run installed `cg-render-artifact --validate-only .cg-docs/plans/2026-10-10-m2-walking-skeleton.md` with Python bytecode disabled. The current user approved no-output document validation; this is not an R/package test. Do not render HTML or create reports/index/cache outputs.
- The installed wrapper was located by `Get-Command cg-render-artifact`; its command read confirmed a local Python entry point (`C:/Users/wb384996/.compound-gpid/bin/cg-render-artifact.cmd:53-55`). It is tooling, not package/source behavior evidence. No client release requirement is introduced.
- Read `.kilo/shared/artifact-view.contract.md` after save and verify the canonical path. Expected optional view path is `.cg-docs/views/plans/2026-10-10-m2-walking-skeleton.html`; view bodies are never loaded and no view write is authorized. If validation fails, preserve Markdown/prior views, report the exact error and view state, and use `cg-render-artifact <plan-path>` only as recovery guidance that requires separate HTML scope if it would write a view.
- Final Git branch/HEAD/status/index checks and protected-file hashes must show only this plan newly created by this task. `git diff --check` reports whitespace issues but is not evidence that unchanged pre-existing edits belong to this worker. No staging/commit follows.
- Executed results, including any failure/not-run item, belong in the response handoff, not an extra report or coordination record. Validation does not mark the implementation plan completed.

### Future Acceptance Checks

Local stage evidence and final integration evidence are separate obligations. The L cases below can execute as soon as the named stage and its approved upstream interfaces exist; they must not require a later stage. They do not substitute for T1-T12. Umbrella phase numbers are integration groupings; repository-local Plans must map their own phase numbers to the appropriate L cases and, where applicable, final T cases.

| Local case | Umbrella group | Evidence available at that stage | Must not claim |
|---|---|---|---|
| L-stamp | 1 / Step 2 | Neutral arbitrary-node code/helper/missing-hash, state, graph, unchanged-lineage and historical-metadata regressions against real stamp storage | PIP mean/deflation, complete-run selectivity or release success |
| L-authority | 1 / Step 3 | Pipdata decision delegation and pipload version/format forwarding with simple supplied producer functions, failed-parent handling and actual adapters | A completed survey/mean/release pipeline |
| L-aux | 2 / Step 4 | CPI/PPP/PFW key/metadata/pin validation, repeated auxiliary save/readback, data-neutral commit handling and unchanged-pin recovery | Complete-run T1/T3 or downstream mean/release call counts |
| L-acquire | 2 / Step 5 | Explicit one-survey selection/source versions, download inventory/failure behavior and authorized acquisition evidence | Later calculation or historical release retrieval |
| L-format | 2 / Step 6 | Actual format/validation path, clean-save spies/catalogs and invalid clean no-save behavior | Final downstream/release recovery without executing it |
| L-calc | 3 / Steps 7-8 | Actual deflation/weight contracts, pure mean oracles, independent stamped result, recovery after injected assembly failure | Final real-assembly/release or complete-skeleton scheduling checks |

Every local case also requires its approved safe full-suite gate and declared exclusions. The complete T1-T12 suite below belongs to Phase 4 integration after all producer/consumer stages exist. Final T evidence must run against the pinned actual integrated stages; local/mocked evidence remains labeled separately.

All T1-T12 checks below are **core requirements for M2 completion** at its approved limited runtime scope. None was run for this planning/review task. The test file/command, storage root, fixture identity, R/testthat/dependency versions, producer/consumer SHAs, output evidence path and exit/skip status must be supplied by later approved workers. Mock selection/storage tests do not replace the real-stage/pinned-storage integration checks. Skipping/excluding a core case prevents completion, even when the exclusion is necessary for safety.

| ID | Scenario and expected result | Required evidence / proposed test home | Gate |
|---|---|---|---|
| T1 | Build once, then rerun unchanged. Second and immediate third runs execute no processing/mean/assembly stage and make no artifact/version writes; existing pins remain usable. Read-only source checks are distinguished from rebuild work | Stamp decisions/reasons, per-stage call/save counts, before/after catalog/version inventories, hashes and release pins; pipdata integration | M2 / V7,V12 |
| T2 | Change a CPI value actually consumed by the selected survey. Only its affected resolved-input/deflation/mean/assembly path runs; raw download/clean and an unaffected synthetic control do not. Return to unchanged inputs and converge | Exact changed CPI key/value and consumed map, separate control parent graph, counts and pins; real deflation/storage integration | M2 / V9,V13 |
| T3 | Change an unrelated CPI acronym/year/level or unused input while consumed values stay identical. The source artifact may advance, but no unrelated numerical stage runs. A data-neutral raw-source commit also causes no numerical rebuild | Approved selective mapping mechanism, consumed-versus-source pins, control and zero numerical call counts; no whole-file-parent shortcut | M2 / V7,V13; D7 blocks unresolved mechanism |
| T4 | With identical data, change the mean/deflation body or a known result-affecting helper, constant or rule/YAML input. Stamp detects requested fingerprint changes before execution and selects affected work only | Curated coverage list, before/after requested/saved hashes, package source SHAs, decisions and calls; stamp plus package fingerprint tests | M2 / V2,V14 |
| T5 | Change an unrelated package file/helper. Source SHA records the edit but no blanket calculation rebuild occurs. Exercise saved/requested missing and NA hashes; follow D5's explicit schedule-or-block policy, never silently certify currentness | Fingerprint comparisons, zero unrelated-stage counts and explicit missing-hash reason; stamp and integration | M2 / V2,V14 |
| T6 | Missing output, version snapshot, parent pin or status; deterministic failure unchanged; external failure next analyst run; changed input after deterministic failure. Missing result is eligible only with valid parents; missing parents/failure blocks descendants. No automatic retry; successful unaffected work continues | Persisted neutral state/outcomes, eligibility reasons, call counts, denied-success receipts and next-run behavior; stamp and pipdata integration | M2 / V4,V8 |
| T7 | Save identical values with changed source/module-version/data-type metadata. A new semantic artifact version is retained. Load the older data/metadata by the same pin without loading data for metadata-only access. Module-name change creates another identity; descriptive edits follow approved no-force rule | Version lists, content hashes, typed metadata values, old/new pins, reserved-key rejection and historical data-free read call trace; stamp/pipload | M2 / V5,V11 |
| T8 | A advances, B runs successfully but its content/code/semantic metadata remain identical, C depends on B. B is not a failed save; new input provenance is recorded without overwriting B's old pinned history. The next run is current; C is not unnecessarily built when its approved result-dependency signal is unchanged | Three-node actual storage test, retained pin/receipt, latest execution satisfaction, historical readback and second/third-run counters; stamp | M2 / V3 |
| T9 | Valid simple deflation and mean fixtures, dynamic additional PPP year, independent national/area mappings; population-only changes affect final weights and the national mean when adjustment is used, not welfare arithmetic | Declared units/vintage selections, aligned vectors, explicit population/adjustment pins, analytic expected values and approved tolerance; pipdata/pipster | M2 / V9,V10; production equivalence deferred |
| T10 | Invalid acquisition/format/result data has zero successful data-save calls/versions. After a successful independent mean save, force assembly/registration failure; recovery verifies/reuses the saved mean without rerunning it. If save itself failed or result is missing/corrupt, do not reuse | Save spies plus actual catalogs/receipts, typed failure records, mean invocation count, retained result pin and recovery readback; pipdata integration | M2 / V8,V10 |
| T11 | Register TEST manifest M1, then save newer members/metadata and manifest M2. Retrieval using M1's manifest version returns all original member pins and same-version metadata. Remove a required snapshot in an isolated negative fixture: explicit error, never latest fallback | Full member ledger, original/new hashes/versions, real stamp/pipload historical reads and missing-pin errors; serial release integration | M2 / V11 |
| T12 | Chain/diamond/multi-target topological execution, explicit cycle rejection, obsolete historical reverse edges, failed-parent block, and partial catalog/snapshot publication. Require no out-of-order success, false currentness, or reusable partial artifact | Neutral graph fixtures, exact ordered decisions/calls and serialization/availability checks; stamp plus engine integration | M2 / V2,V4,V6,V14 |

For T2/T3 the unaffected control is a synthetic independent chain with different consumed inputs, not a second downloaded survey. A whole-CPI source version may cause source-inspection work; acceptance concerns correct dependent scheduling, not a false promise that changed source ingestion performs no work. If the chosen semantics cannot satisfy required selective behavior without resolving M1 R1, stop the affected work and obtain D7; do not weaken the test or call M2 complete.

### Deferred Verification

M3: full survey/auxiliary selection, exclusions/removal at scale, all estimates, wider population and spatial cases, target-scale/parallel performance, broad numerical comparison. M4: full targets harvest, lineup/missing-country methods and dependencies. M5: full current-format API-ingestable release, complete schemas, live old-release availability, correction/freeze/atomic multi-writer capture, release-aware pruning and full production equivalence. M6: interface/platform/logging decisions.

Windows/SMB fencing, locking, rename/read integrity and production activation evidence remain unverified. A serial isolated M2 suite does not certify them. If a proposed test uses the Y drive/shared production-like storage or bypasses an existing activation gate, obtain separate safe-runtime evidence/approval first or stop. Deferral is not permission to deploy unsafely.

## Documentation Checklist

- [ ] Exactly nine M2 feature IDs map to proposed phases/owners/work sets, without new features or status writes.
- [ ] Unique R1-R15 requirements map to steps; globally numbered steps and exact phase headings conform to the artifact parser.
- [ ] E1-E11 cover keys/types/nulls/units/formats/pins/signatures/API compatibility; proposed versus known fields are explicit.
- [ ] Adjusted-weight/population dependencies and the current welfare-column/API mismatch are visible.
- [ ] Stamp remains neutral/sole selector; manifest/adapter/log authority reconciliation is explicit.
- [ ] G1-G9 are documentary checks only; M1 R1 stays Open and required selective tests cannot bypass its decision gate.
- [ ] T1-T12 are future checks with expected outcomes/evidence, not test passes; M2 versus deferred verification is clear.
- [ ] Full inherited package SHAs, source-file/line references, approvals and UNKNOWN runtime/inventory fields are retained.
- [ ] Saved Markdown is read back and no-output document validation result is reported in the handoff; no extra output is created.

## Risks & Mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Document gate or harvest `supported` treated as capability success | Premature implementation/completion | Separate G rows, inherited assertions, T rows and actual test pins/results |
| Open R1 inferred from existing projections or partitions | Unapproved algorithm or broad wrong rebuilds | D7 approval gate; consumed/unconsumed controls; no second authority |
| Pipdata manifest remains a second planner | Inconsistent run/skip decisions | Central stamp decision trace; adapt predicates/records on approved route; preserve safeguards |
| Helper/rule fingerprints or NA hashes missed | Outdated means reused | Curated dependency coverage, explicit missing policy, pre-execution comparisons and T4/T5 |
| Unchanged output leaves old parents or corrupts history | Endless rebuild or irreproducible releases | D5 semantics, successful unchanged receipt, old-history readback and T8 convergence |
| Population-weight or PFW/domain dependencies omitted | Wrong national mean or invalidation | E4/E7/E8 mapping, D3, population-only regression and aligned final weights |
| PPP vintages collapse into one year column or API divides twice | Wrong scale/units | D2 explicit vintage mapping; LCU retained for adapter; no pipapi redesign |
| Validation receipt mistaken for quality validation | Invalid survey/results saved | Active pre-save checks, save spies plus catalogs, T10; no row repair by inference |
| Latest sidecar mixed with pinned data | False historical release | Version-aware stamp interface, semantic metadata versions, T7/T11 |
| Shared files, package cycles or unstable pins assumed independent | Conflicts and broken integrations | Conditional parallelism only after fresh work-set/dependency checks; default sequence shared pipdata/stamp files |
| Mocked numerical workers or fixture IO used as real integration | False end-to-end evidence | Actual stage/storage suite at exact pins; mocks/unit checks labeled separately |
| Windows/SMB or incomplete write state accepted without evidence | Unsafe activation or lost pins | Preserve activation gates, reject partial states, use approved serial isolated tests; no production/parallel claims |
| Plan workflow silently creates reports/views/roadmap changes | Protected scope exceeded | Single-file write set, validate-only, no helper starts, separate pending roadmap request |
| Early phase waits for a later pipeline or targeted tests bypass an unsafe full suite | Deadlocked completion or unapproved resource access | Separate L evidence from final T evidence; inspect/approve each local suite gate before implementation |

## Out of Scope

- Implementation, package/external-source reads, R/package tests, pipelines, DLW/API calls, production-data processing and runtime setup in this planning assignment.
- Any present write except this new plan: STATE/REQUESTS, roadmap/design/charter/context/local config, BRAIN, historical evidence, generated configuration/files, .gitignore, package repositories, reports/lifecycle records or HTML views.
- Additional features, worker starts/assignments, inventory/private-state inspection, branch changes, staging, commits, PRs, pushes, merges and obsolete setup cleanup.
- A platform decision, fixed illustrative API, general workflow/dependency-discovery framework, module-free identity, mandatory long results, automatic retry loops and logging relocation.
- M3-M6 expansion and production certification described under Deferred Verification. No full API release or all-survey R1 implementation is hidden in M2.

## Pending Roadmap Request

No operation is authorized or applied. If the user later wants registration after plan review, propose the following exact change for each of the nine feature IDs in `roadmap.json:48-56`, within milestone `m2-walking-skeleton`:

| Field | Observed old value | Proposed value |
|---|---|---|
| `plan` | `null` | `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md` |
| `status` | `idea` | `planned` |

Exact IDs: `close-stamp-gaps-for-skeleton`, `create-engine-skeleton`, `save-cpi-ppp-and-pfw-through-stamp`, `download-one-survey`, `format-and-validate-one-survey`, `deflate-one-survey`, `compute-the-mean`, `register-test-release`, `test-incremental-reruns`.

Expected derived M2 milestone status remains `planned`; no independent milestone status write. Preserve IDs/titles/objectives/schema/arrays/unrelated statuses and links/GitHub fields. M1 R1 stays `idea`, partial M1 integration stays `active` with a null plan. Recheck exact old values first. This pending request needs its own direct approval and verified independent restricted cg-roadmap workflow; no dispatch or identity inference occurs here.

## Completion Contract

This contract describes future M2 implementation evidence. Saving/validating/reviewing this active umbrella completes only the bounded document deliverable, not any implementation row or phase. A repository-local Plan must extract its local L obligations and approved scope; it cannot use this umbrella's cross-repository phase records as its execution target.

### Outcome

After separately approved implementation, one selected GMD survey produces an independently saved mean and a version-pinned test release. Executed evidence shows correct incremental selection, safe recovery, and no unnecessary rebuilds for unchanged or unrelated inputs; no implementation is authorized by saving this plan.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|---|---|---|---|---|
| V1 | 1 | Approved applicable contracts, saved local Plans, exact package/lifecycle write sets, ownership checks, observed upstream commits and safe suite gates | Repository-local Plan approvals and interface evidence; Step 1; tested incoming producer evidence where available | yes |
| V2 | 1 | Neutral stamp fixtures detect requested code/helpers/missing hashes and verify graph order/cycles | L-stamp code and graph subcases; no later PIP stages needed | yes |
| V3 | 1 | Neutral identical-output rebuilds converge; retained pins and historical lineage remain intact | L-stamp three-node lineage and pinned readback | yes |
| V4 | 1 | Neutral missing/failed state follows policy and blocks dependents | L-stamp status subcases | yes |
| V5 | 1 | Neutral semantic metadata changes version; pinned data/metadata agree and metadata-only reads work | L-stamp metadata/version subcases | yes |
| V6 | 1 | Pipdata delegates selection and pipload forwards exact versions/formats using simple supplied producers | L-authority actual adapter and decision trace | yes |
| V7 | 2 | CPI/PPP/PFW save/read back with usable pins; identical cleaned inputs/data-neutral commits create no unnecessary auxiliary version | L-aux local auxiliary checks; no complete-run downstream claims | yes |
| V8 | 2 | Explicit source selection/versions and acquisition/format validation prevent invalid clean saves | L-acquire and L-format source/inventory/save-call/catalog evidence | yes |
| V9 | 3 | Deflation contracts, dynamic welfare_YYYY and adjusted-weight inputs are verified with actual stage/storage | L-calc deflation subcases; final selectivity remains T2/T3 | yes |
| V10 | 3 | Pure supplied-data mean is independently saved and recoverable after injected assembly failure | L-calc pure mean and actual save/recovery subcases | yes |
| V11 | 4 | The test release retrieves original data/metadata pins after newer versions exist; missing pins fail clearly | Pinned release-readback test; T7,T11 | yes |
| V12 | final | The unchanged second run performs no stage work or artifact/version writes | Before/after inventories and execution counters; T1 | yes |
| V13 | final | A consumed CPI change reruns only dependents; an unaffected control stays current; unrelated CPI causes no numerical rebuild | Dependency-specific integration evidence; T2,T3 | yes |
| V14 | final | Relevant code changes are detected; unrelated package edits do not cause blanket rebuilds; all tests identify pins actually tested | Integration regressions and dependency ledger; T4,T5,T12 | yes |
| V15 | final | All core T1-T12 integration checks pass on actual integrated stages; local evidence alone cannot complete M2 | Complete integration results, exact tested-pin ledger, local/full-suite results and exclusion register | yes |

### Constraints

| ID | Phase | Constraint | Check |
|---|---|---|---|
| C1 | final | Stamp remains domain-neutral and the sole rebuild authority | Trace all selection decisions to stamp |
| C2 | final | Pipster has no work selection or file IO; pipload delegates version/hash/parent authority | Package boundary tests |
| C3 | final | Module-bearing identity, version metadata safeguards and current API contracts remain intact | Identity, historical readback and compatibility checks |
| C4 | final | M1 R1 stays Open in this planning task; no platform or illustrative API is adopted | Explicit decision register and implementation approval gates |
| C5 | final | No automatic retry loops or overwrite of historical evidence | Failure/recovery tests and scope review |
| C6 | final | Planning creates only the named Markdown; future package work requires separate approval | Saved-plan readback and Git scope checks |

### Boundaries

- Allowed now: create `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md`, read it back, and run document validation without additional output files.
- Proposed later: the nine existing M2 features, in separately approved package repositories, with synthetic controls and regression fixtures.
- Out of scope now: package implementation/tests/pipelines/data access, helper starts, roadmap operations, coordination edits, branch changes, commits and HTML generation.
- Deferred: all-survey expansion, production API release, broad numerical equivalence, platform selection and production Windows/SMB certification. Deferral never removes production safety gates.
- This plan cannot override permissions, protected-artifact rules or the need for separate future execution/lifecycle approval.

### Iteration Policy

1. Approve the planning document only; keep every implementation phase unstarted.
2. Obtain Andres's decisions on unresolved contracts before the affected implementation.
3. Stabilize and test generic stamp interfaces before dependent package integration.
4. Confirm ownership, write sets and tested pins before considering parallel work.
5. Execute every required acceptance check under later approved scope; do not replace missing results with source assertions.
6. Pause for approval before deviations under `deviation-policy: ask`; never use the plan to expand permissions.
7. Complete a future local phase/feature only when its required evidence passes. Directly approved, recorded exceptions may cover supplemental non-core checks only; no exception may waive T1-T12 or validated one-survey processing, independent mean save, pinned TEST retrieval, unchanged/selective reruns, code detection or required recovery/no-save evidence. Missing core evidence keeps the affected work and M2 blocked/incomplete. Changing this minimum requires a separate explicit scope/policy revision, not an execution exception.

### Blocked-Stop Conditions

- A target-file conflict, denied path or missing permission prevents the planning write; do not overwrite or route around a denial.
- An unresolved contract prevents the affected implementation, including absent survey choices, units, weight inputs, stable generic interfaces or usable dependency pins.
- CPI-selectivity work requires an R1 mechanism that has not been approved. Do not select partitions/projections, weaken T3 or mark M2 complete by inference.
- Required evidence fails or cannot be obtained safely; a required safe runner/runtime/test root is unavailable; missing pins or partial snapshots are not reusable.
- Continuing requires protected edits, additional outputs, worker starts, unsafe shared writes or production activation without direct approval/evidence.
- A deviation under `ask` lacks approval; a Decided policy would be changed; complete durable execution evidence cannot be maintained within the separately approved future scope.
- This umbrella is selected as a `/cg-work` target, the repository-local saved Plan/lifecycle approval is absent, or the safe full-suite gate has not been inspected/approved. Halt before report/progress/code writes.

## Original Planning Handoff Fields

The final response must supply actual saved-file/readback/validation results and these fields. No additional handoff file is authorized.

- Feature/task ID: `m2-cg-plan-2026-10-10`; milestone `m2-walking-skeleton`; all nine existing feature IDs covered.
- Repository, worktree, session ID: pipsystem, verified root above, native session ID UNKNOWN.
- Branch, base/current SHA: main and observed planning SHA above; repeat final current HEAD.
- Approved scope, plan, completed phase: one-file planning only; this plan; no M2 implementation phase completed.
- Worker status: bounded planning worker; other workers/ownership/liveness UNKNOWN; no helper starts.
- Changed files: this plan only by this worker; distinguish the four pre-existing modified files.
- Executed checks and evidence paths: current source/reference/gate/Git reads plus actual saved-plan readback/validator/scope evidence in the response.
- Dependency versions/SHAs actually tested: none; inherited table is source provenance only.
- Checks not run: package/runtime/R tests, pipelines, DLW/API/production calls, numerical equivalence, Windows/SMB/concurrency, external-source refresh and independent roadmap flow.
- Remaining blockers/decisions: D1-D8, nonempty Gaps, no implementation approval, no roadmap-link approval; final document-check result as observed.
- Commit and PR: none.
- Original recommended next action: bounded plan review. That review and plan-only correction are now authorized; the current downstream action is the Repository-Local Work Handoff, not another automatic review or whole-plan implementation from pipsystem.
