---
date: 2026-10-07
title: "Integrate M0 Design Outcomes and Approved M1 Findings"
status: completed
completed-date: 2026-10-07
scope: "Standard"
brainstorm: ".cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md"
language: "R"
estimated-effort: "small"
deviation-policy: "strict"
artifact-schema-version: 1
phases: 2
execution-report: ".cg-docs/work-reports/2026-10-07-m0-m1-design-integration.md"
completed-phases: [1, 2]
tags: [documentation, m0, m1, design, approvals, roadmap, m2-gate]
---

# Plan: Integrate M0 Design Outcomes and Approved M1 Findings

## Objective

Integrate all eight selected M0 outcomes and approved M1 decisions R2, R3, and R4 into `SYSTEM_DESIGN.md`. Preserve R1 and other unapproved Open items, reconcile existing roadmap features through `@cg-roadmap` only, and verify the approved nine-feature M2 start gate. This is documentation work in `pipsystem`, not pipeline implementation or permission to start M2.

## Context

### Baseline and Authority

- Local planning date: 2026-10-07; user request received 2026-10-08 UTC.
- Current branch: `docs/pre-harvest-documentation-reuse`. Stay on it.
- Project HEAD at planning: `c6328b85bfbfe99d36e52f6c9d0e13cd8114510f`. Initial `git status --short` was empty.
- This plan is the only new documentation file authorized in this planning session. No design, charter, roadmap, historical evidence, or unrelated plan is edited during planning.
- The user approved saving and reviewing this plan. The first approval prompt was dismissed; it supplied no approval. The subsequent answer was `Save and review plan`, with exact Decided and charter wording changes kept pending approval for `/cg-work`.
- The decision records approve outcomes. They do not prove implementation, change roadmap statuses, or authorize unlisted charter changes.
- `SYSTEM_DESIGN.md:14-18` requires explicit approval for Decided edits. `compound-gpid.md:26-33` remains authoritative until a separately approved, bounded charter change is applied.
- `/cg-plan --no-html deviate:strict` requires source validation without HTML. The plan-review request authorizes revisions to this new plan only, not integration execution.

### Sources and Selected Outcomes

All line ranges below refer to the pre-execution documents at the project HEAD above. After edits, locate sections by their headings, not stale line numbers.

| Source | Relevant content | Use |
|---|---|---|
| `.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md:117-142` | Five approved outcomes; table-based feedback; minimal design | Engine-first, correction history, revised failures, calculation-only pipster, plan-only mode |
| `.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md:167-246` | Three remaining outcomes and metadata safeguards | Module-bearing artifact identity, generated selections, independently saved estimates and separate assembly; preserve five earlier approvals |
| `.cg-docs/brainstorms/2026-10-07-m1-code-orchestration-and-storage-decisions-confirmed.md:132-169` | Confirmed R2/R3/R4 and residual limits | Automatic fingerprints, orchestration in pipdata, pipload access adapter, single stamp rebuild authority |
| `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:46-76,151-174` | Existing feature meanings and exact nine-feature gate | Roadmap reconciliation and M2 start-gate verification |
| `HARVEST.md:9-49,51-78` | Full SHA mapping, completed outputs, inspection-only limits | Harvest completion evidence, not runtime success |
| `notes/FINDINGS.md:9-45,49-84,86-117` | Fifteen Open questions, four proposals, contradictions, gaps | Preserve unapproved R1; distinguish superseded proposals from selected outcomes |
| `notes/stamp.md:9-35,66-101`; `tables/stamp_fit.csv:2-16` | Metadata, code hashes, planning, partitions, release and concurrency limits | Keep capability gaps explicit; do not change historical fit classifications |
| `notes/pipdata.md:58-60,75-95,99-127` | Selection limits, curated fingerprints, existing planner authority | Record current/target mismatch without endorsing a second planner |
| `notes/pipload.md:34-49,59-63` | PIP access, metadata artifacts, format and snapshot limits | Keep adapter ownership separate from storage correctness |
| `notes/pipster_wbpip.md:25-29,40-87,97-103`; `notes/pipapi.md:43-71,94-129` | In-memory results, incomplete calculations, wide API inputs | Preserve independent internal results and current release compatibility |
| `roadmap.json:5-57` | M0/M1 feature IDs and statuses; M2 fields | Existing-record reconciliation only; no new dependency fields |
| `.cg-docs/archive/charter-history.md:3-13` | Existing Current Focus archive format | Append history; never replace earlier entries |

The earlier M1 capture without `-confirmed.md` is historical, not the canonical decision source. Its validation issue must not be repaired by this task. The harvest proposals for module-free identity, mandatory long tables, explicit code labels, and separate pipsystem orchestration are not the selected outcomes.

### Inherited Package Provenance

No package repository needs to be read or changed for this task. Package facts are inherited harvest evidence at the SHAs below, not newly checked package HEADs. Preserve their note and source-file/line citations when adding evidence to the design.

| Key | Package | Harvested SHA |
|---|---|---|
| S | stamp | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| A | pipaux | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` |
| Dp | pipdata | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| L | pipload | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| F | pipfun | `0c6a78d9884ed0965a524311537eec2a5095d60b` |
| P | pipster | `828064e406e07e711c34d2ba725746e367d35f9b` |
| W | wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` |
| I | pipapi | `280af151d05902a550d5dea18cd4bf1a3d013239` |

The harvest's D key is the earlier project-document SHA `84c384f78ed44bcb96bb19c6d364519df5b5db6f`, not pipdata. Never attribute new integration text to that historical SHA. Source/test inspection is not an executed test pass (`HARVEST.md:41-49`).

### Brain and Prior Work

The bounded Brain query returned the first M0 record and existing roadmap feature references. They confirm sequencing, not later approval. The follow-up M0 and confirmed M1 records control their selected outcomes. No local `BRAIN.md` exists; the solution directories contain `.gitkeep` only. The sole existing plan, `2026-08-21-pre-harvest-documentation-reuse.md`, is unrelated and remains untouched; only its title/status metadata was read.

### Charter Conflict

Approved R3 places release orchestration in pipdata. The charter constraint at `compound-gpid.md:31-33` and the Decided boundary at `SYSTEM_DESIGN.md:194` still say PIP concepts live in pipsystem. Do not silently interpret this constraint away. Step 1 must obtain separate approval for the exact charter replacement in the Approval Register. If approval is unavailable or declined, stop before integration edits and roadmap writes. A saved plan is not that approval.

## Requirements

In this section and step metadata, R1-R12 are plan requirement IDs required by the artifact schema. Elsewhere, R1-R4 mean the M1 recommendation IDs unless prefixed with `plan requirement`. M1 R1 remains unapproved; plan requirement R1 is the eight-outcome integration requirement, not approval of M1 R1.

| ID | Requirement | Source |
|---|---|---|
| R1 | Integrate all eight selected M0 outcomes, not the rejected proposals | Both M0 records; user request |
| R2 | Integrate confirmed M1 R2/R3/R4 only | Confirmed M1 record:136-142; user request |
| R3 | Preserve unapproved M1 R1, other Open policies, and unresolved implementation gaps | User request; FINDINGS:49-60,110-117 |
| R4 | Keep module-bearing artifact identity and result-relevant version metadata | M0 follow-up:169-190 |
| R5 | Keep independent saved estimate outputs, separate assembly, and current API contracts | M0 follow-up:206-223 |
| R6 | Present exact Decided changes for approval and resolve the charter conflict explicitly | SYSTEM_DESIGN:16-18; user request |
| R7 | Update existing roadmap features through cg-roadmap only; keep IDs/counts; never complete all M1 | User request; roadmap writer contract |
| R8 | Verify exactly nine M2 gate features, without adding M1 R1 or all-M1 completion to that gate | Approved strategy:155-170 |
| R9 | If Current Focus changes, archive replaced text first and update last-reviewed with it | User request; charter history convention |
| R10 | Preserve historical records, SHA provenance, source references, and nonempty gaps | Charter:27-28; user request |
| R11 | Documentation only; current branch; no code/tests/config/unrelated-plan changes, commit, or push | User request |
| R12 | Validate without HTML, run plan review, and address every finding in this plan before handoff | User request; artifact-view contract |

## Implementation Steps

## Phase 1: Approved Documentation Integration

### 1. Confirm the Bounded Edit Set and Approvals

- **Requirements**: R1, R2, R3, R6, R9, R10, R11, R12
- **Files**: read this plan, `SYSTEM_DESIGN.md`, charter, decision records, strategy, relevant notes, and targeted roadmap fields. At execution only, before integration approval, permit the standard plan-linked work report, its `execution-report` pointer and the six allowed plan progress fields, and the compact `.cg-docs/active-state/current.json` lifecycle record. No integration document or roadmap write is authorized by this allowance.
- **Details**: validate this plan before mutations. Record `git status --short`, `git diff --name-only`, and `git branch --show-current`; preserve concurrent changes. Re-read the listed source sections and confirm that their meanings and the target Decided text have not changed. Create the standard `.cg-docs/work-reports/<execution-date>-m0-m1-design-integration.md` using the report identity/resume/collision rules, write its pointer in this plan, and record approvals/evidence there. Permit only `status`, `completed-date`, `failing-steps`, `completed-phases`, `current-phase`, and `execution-report` as execution-time plan frontmatter writes. Maintain the compact active-state pointer at report-created, phase-boundary, blocked-stop, and completion events, including an approval-blocked preflight. Store paths, IDs, status and short summaries only, not document bodies or raw outputs. These are required workflow records, not system configuration. Follow `.kilo/commands/cg-work.md:14-15,142-150,204-218` and `.kilo/shared/active-state.contract.md:44-66`; validated autopilot children return cursor-update requests instead of directly writing active-state. Do not add a separate validator, approval document, review artifact, or optional active-state snapshot.
- Present the full Approval Register below. Ask for explicit approval of the five existing Decided replacements and the bounded translations of approved Open outcomes. Ask separately for the charter constraint replacement. Record any exact amendment and its approval before applying it; a semantic change needs a revised plan under strict policy.
- Ask separately whether to apply the stated conditional Current Focus after the gate passes and whether to correct the existing module-decision title. A declined optional Focus/title edit means preserve that field, not invent another wording. A declined required Decided/constraint approval blocks integration.
- Do not link this plan to roadmap features during planning. At execution, if linking is confirmed, link only `{m0-settle-the-design, update-system-design-with-m0-decisions}` through cg-roadmap after approval preflight. Do not link the still-partial M1 design-update feature to this plan: generic whole-plan completion must not mark it done.
- **Test Scenarios**: approved exact edit set; dismissed/declined charter approval with report/pointer/compact blocked-state records but no integration writes; changed baseline; concurrent unrelated edits; unchanged optional Focus/title; missing plan validator.
- **Tests**: executed artifact reads and plan validation; Git status/diff/branch probes. No package tests or pipeline runs.
- **Acceptance criteria**: required approvals have explicit records, the charter conflict has an approved bounded resolution, and the working branch/boundaries match. Otherwise report blocked before integration mutation.

### 2. Integrate the Design and Approved Runtime Boundary

- **Requirements**: R1, R2, R3, R4, R5, R6, R10, R11
- **Files**: `SYSTEM_DESIGN.md`; only the specifically approved sentence in `compound-gpid.md`. No other charter section changes in this step.
- **Details**: make small in-place edits at the locations in the Integration Matrix. Apply the exact approved Decided replacements, replace the rejected active proposals, and retain the business survey definition. Add source references to the decision records, plus inherited note/source/SHA evidence where capability facts are stated. Separate target policy from current implementation.
- Keep the existing charter objective, deliverables, portability, read-only package boundary, and other constraints. Apply the approved final-sentence replacement for the stamp/domain constraint without regenerating the charter. If that approval is missing, this step must not start.
- Synchronize sections 3.3, 4, 5, 6, 7, 8, 9, 10, and the section 12 Open-question register. Include an explicit nonempty Gaps subsection in the design, not a new gaps file. Keep a short historical-reference note identifying which active proposals were rejected, with links to the unchanged records.
- **Test Scenarios**: module switch means another artifact identity; identical data with changed result-relevant metadata still requires a version; latest metadata cannot replace pinned historical metadata; changed selection rules with unchanged choices do not mandate global recalculation; assembly failure preserves successful unchanged estimates; fingerprints do not imply code-only scheduling works; pipdata reuse does not approve its current planner.
- **Tests**: use Read/Grep tools to verify the Integration Matrix and Open Register against the edited design. Inspect the actual diff and record pass/fail for each row; an unexecuted narrative claim is insufficient.
- **Acceptance criteria**: all 11 selected decisions and supporting safeguards are present, rejected proposals are not active, only approved Decided/charter text changes, and the Open Register and capability limits remain explicit. Phase 1 cannot be complete before these checks pass.

## Phase 2: Roadmap Reconciliation and Gate Verification

### 3. Reconcile Existing Roadmap Features Through cg-roadmap

- **Requirements**: R7, R8, R10, R11
- **Files**: `roadmap.json` through cg-roadmap only; execution report evidence. Never apply_patch roadmap.json or patch agent-manager UI state.
- **Details**: after Phase 1 verification, dispatch the exact existing milestone/feature IDs in the Roadmap Reconciliation table. Give the writer decision-record or harvest-output evidence for each done request. The writer parses the full JSON internally and preserves unrelated fields; the coordinator reads only relevant IDs, titles, statuses, links, and counts.
- Use valid feature statuses `idea`, `planned`, `active`, `done`; `in-progress` is a milestone status, not a feature status. Link operations set `planned`, so perform any confirmed M0 integration link before its final done write. Preserve unrelated existing plan links and never overwrite them based on title matching.
- Keep M1 R1 unchanged/uncompleted and M1 design integration `active`. The latter records completed R2/R3/R4 integration with R1 still outstanding; record this limit in the execution report and design, not unsupported JSON fields.
- If the title correction was approved, change only the title of `decide-module-out-of-survey-id` to `Decide module-bearing artifact identity`. Keep its ID; it remains the same strategy gate feature, not a new feature.
- Milestone statuses are derived by the writer. Do not set them independently. Expected M0 is 9/9 done; M1 is 11/13 done with its design-update feature active, so M1 is in-progress, not done. M2-M6 features and all feature/milestone counts remain unchanged.
- **Test Scenarios**: writer unavailable; invalid JSON; missing/duplicate ID; stale status; confirmed link resetting status; unrelated concurrent roadmap edit; title correction with a stable ID; generic completion trying to mark M1 integration done.
- **Tests**: retain writer results; execute a targeted Read of the updated roadmap, compare every requested status with the table, and inspect the roadmap diff for ID/count/unrelated-field preservation. Correct failed writes through the writer only.
- **Acceptance criteria**: exact requested records match, no feature is added/deleted, all 66 feature IDs and seven milestone IDs are preserved, and M1 is not complete. Missing IDs or authority/permission failures block rather than trigger fallback direct writes.

### 4. Verify the Nine-Feature Gate and Final Documentation Scope

- **Requirements**: R3, R7, R8, R9, R10, R11, R12
- **Files**: targeted roadmap records, `SYSTEM_DESIGN.md`, execution report; only if Focus approval exists, `compound-gpid.md` and `.cg-docs/archive/charter-history.md`.
- **Details**: execute a fresh targeted roadmap Read after writer completion. Match all nine unique IDs in the Gate Checklist and require each status to be done and backed by its decision/harvest evidence. Report the count and each row. Do not infer satisfaction from approval alone, from milestone status, or from the M2 feature count.
- If the gate passes and the exact Focus was separately approved, append the complete replaced Focus text and its prior last-reviewed to the existing archive before editing. Record the execution date, source section, reason, this plan, and the approving decision. Then update Focus and last-reviewed together, using the local execution date. Preserve all earlier archive entries. If Focus was declined, leave it and its review date unchanged and record the executed no-change check.
- If the gate does not pass, do not claim readiness or apply the gate-passed Focus. Record the failed member(s) and stop. Other M0/M1 work can remain unresolved without becoming extra members of the nine-feature gate.
- Validate the final plan source with validate-only, record the documentation checks and constrained diff, and leave a handoff for later M2 planning. Required stamp capability gaps must close before M2 finishes, in stamp's own authorized repository session, not here.
- **Test Scenarios**: one gate member not done; duplicate/missing member; harvest completed with UNKNOWN answers; title changed but ID preserved; R1 still Open while nine gate members pass; declined Focus; Focus proposed before gate passes; preserved old archive entries.
- **Tests**: executed reads/searches, writer results, plan validation, `git diff --check`, scoped diffs, final `git status --short`, and final branch read. No R, Pester, package tests, API calls, setup, or deployment commands.
- **Acceptance criteria**: all required Verification Surface rows pass. The gate is reported as 9/9 only after its fresh status/evidence check. No implementation, commit, push, or automatic HTML follows. This plan completes its bounded integration scope without completing the M1 design-update feature.

## Integration Matrix

The outcome wording below is the bounded target text for approval at Step 1. Supporting details marked Open are not permission to select their mechanisms.

| Outcome | Design locations | Exact target policy and retained limit | Approval source |
|---|---|---|---|
| M0-01 Module identity | Section 4; section 12 item 5 | **Decided. Module-bearing artifact identity.** Survey identity remains country, year ID, survey acronym, and welfare type. Internal artifact identity also includes module, for example `PHL_2023_FIES_CON_GPWG`. A HIST-to-GPWG switch creates another artifact identity, not a version of one module-free identity. No alias or cross-module history mechanism is selected. Remove the active module-free Proposal at baseline lines 135-141. | M0 follow-up:169-174 |
| M0-02 Decisions become data | Section 3.3; section 12 item 6 | **Decided. Resolved selections become data.** Generate and version a selection table containing the selected full module-bearing survey ID and data type. Existing rules and explicit survey choices are inputs; the generated table is not hand-edited. PFW retains survey inclusion and settings. Compare additions, exclusions, and module switches by resolved selection row. Changed rules with unchanged choices do not alone mandate recalculation of every survey. R1's invalidation mechanism and missing survey-choice policies/input locations stay Open. | M0 follow-up:192-204 |
| M0-03 Stage 5 output | Stage 5 output paragraph; section 12 item 9 | **Decided. Independent estimate results and separate assembly.** Each estimate returns a list or data.table under a defined output contract. A separate storage layer independently saves and versions each successful result through stamp before reuse. Combining, appending, or joining saved outputs is separate work with its own inputs and outcome. Assembly failure must not discard or recompute successful unchanged estimates. Actual estimate dependencies still apply. Reject the mandatory long-table proposal. API-bound files retain current required names, shapes, keys, and units. Exact result contracts, physical storage, and assembly granularity remain Open. | M0 follow-up:206-223 |
| M0-04 Engine first | Section 9 engine paragraph | **Decided. Engine first, interface later.** Plain R functions hold execution logic. Interface choice and implementation are deferred. Define analyst workflows and required feedback during engine design. Exact signatures stay Open; illustrative `run(release, scope, mode)` is not a fixed API. Coordination location is the approved R3 decision below. | First M0:124; follow-up:229 |
| M0-05 pipster boundary | Section 10 pipster row and proposal | **Decided. pipster does calculations only.** Calculation functions receive data and return results. A separate layer selects estimates from a data list, supplies inputs, and saves results through stamp. pipster does not select work, read files, or save outputs. The separate layer is pipdata coordination under R3; do not create another package solely for it. | First M0:127; follow-up:208-211,235; confirmed M1:137 |
| M0-06 Plan-only | Section 9 plan-only paragraph | **Decided. Plan-only mode.** Use normal planning logic to return an R data.table of selected work and selection reasons without stage execution or changes to pipeline state. It is a preview, not a stored execution commitment. No automatic Markdown export is selected. Exact columns remain Open. | First M0:102-107,128 |
| M0-07 Failure policy | Sections 6 and 7; section 12 item 14 | Apply D2 in the Approval Register; replace the automatic transient-retry proposal with the same policy. Failure records supply status; stamp selects work; logs record events. Keep classification, generic status integration, and interaction with Force mode Open. Do not infer an override or retry loop. | First M0:98-101,126,140-142; follow-up:232-234 |
| M0-08 Correction history | Section 8 correction paragraph; section 12 item 15 | **Decided. Corrections keep history.** Preserve replaced artifact versions and dated release-version references so prior and corrected online states can be identified. Do not change the correction window or frozen-release rules. Capture, historical retrieval, and release-aware retention mechanisms remain Open. | First M0:125; follow-up:230-231 |
| M1-R2 Code rule | Section 6 code versions; section 12 item 4 | **Decided. Automatic calculation fingerprints.** Fingerprint each independently run calculation and its known result-affecting dependencies. Record exact source SHAs separately. Manual version-label bumps, whole-package-SHA blanket invalidation, and general dependency discovery are not selected. Planning must compare the requested fingerprint before execution. Fingerprint coverage, missing/NA hash policy, and code-only scheduling integration remain Open. | Confirmed M1:136,140,142,162-165 |
| M1-R3 Orchestration | Section 5 stage 8 package; section 10 pipdata/Orchestrator rows and location paragraph; section 12 item 10 | **Decided. Orchestration in pipdata.** Keep release coordination separate from processing functions, with one public existing-package entry point and platform-independent logic. stamp remains the single rebuild authority. Reconcile pipdata's current manifest/planner; processing reuse is not approval of its currentness rules. Stage 8's target package and Orchestrator location become pipdata. Do not fix an exact entry-point signature or choose a platform. Requires the separately approved charter boundary and D3/D5 replacements. | Confirmed M1:137,139,166-168 |
| M1-R4 Access | Section 10 pipload row; section 12 item 12 | **Decided. pipload is the PIP-aware access adapter.** Reuse PIP lookup and I/O functions; delegate versions, hashes, and parents to stamp. pipload does not make independent rebuild decisions. Format compatibility and version-pinned metadata access remain Open; a separate QS2 metadata artifact is not a stamp custom sidecar. | Confirmed M1:138,167; FINDINGS:80-84 |

Additional approved safeguard in section 4:

> **Decided. Version metadata safeguards.** Within one artifact identity, changes to recorded module-version, source-version, or data-type fields must be preserved as a new artifact version even when data values are identical. Historical data must use metadata from the same pinned artifact version, never the latest sidecar substituted for it. A module-name change changes artifact identity and must not overwrite the old module's history. Descriptive metadata edits need not create versions.

Source: M0 follow-up:176-190. The exact save/read mechanisms stay Open; no forcing of every unchanged save is selected.

Additional approved feedback in section 7 uses D4 below. Add a minimal design principle in section 9: **Decided. Smallest complete solution first.** Add features in small steps; no general framework is selected. Source: first M0:42-45,88-90 and follow-up:101-102,238-239.

## Approval Register

### Existing Decided Statements: Exact Replacements Pending

No row below has wording approval from this planning session. Ask for it at Step 1; source outcome approval is not permission to silently change a different constraint.

| ID | Baseline location | Current text | Exact proposed replacement | Status |
|---|---|---|---|---|
| D1 | SYSTEM_DESIGN:127 | **Decided. No versions in the PIP ID.** Versions are managed by `stamp`. Each release is linked to specific `stamp` versions of each survey. | **Decided. No versions in the module-bearing PIP artifact ID.** Versions are managed by `stamp`. Each release is linked to specific `stamp` versions of its module-bearing survey artifacts. | Pending exact approval |
| D2 | SYSTEM_DESIGN:192 | **Decided.** Anything reruns when any of its inputs changed, or when it failed last time. | **Decided. Rebuild and failure policy.** Artifacts are eligible to rerun when an input or rule changes. In incremental mode, successful unchanged work is skipped. An unchanged deterministic failure waits for analyst review and an input or rule change. An external service failure is eligible on the next analyst-started execution. There are no automatic runs or retry loops. | Pending exact approval; outcome approved in first M0:98-101,126 |
| D3 | SYSTEM_DESIGN:194 | **Decided. `stamp` stays domain agnostic.** It knows artifacts, hashes, parents, and versions. It never learns what a survey, a CPI series, or a release is. PIP concepts live in `pipsystem`. | **Decided. `stamp` stays domain agnostic.** It knows artifacts, hashes, parents, and versions. It never learns what a survey, a CPI series, or a release is. PIP-specific runtime concepts live in the PIP packages. Release orchestration lives in `pipdata`; `pipsystem` is the design and evidence workspace. | Pending exact approval and matching charter approval |
| D4 | SYSTEM_DESIGN:215 | **Decided.** At the end of every run, a report lists every success and failure, so the analyst can see exactly where problems are. | **Decided. End-of-run feedback.** At the end of every run, return an R `data.table` with a short summary, attempted-work outcomes, failure details, and blocked work. Keep persistent run records separate. Automatic Markdown export is deferred; exact columns remain Open. | Pending exact approval; feedback approved in first M0:133-138 |
| D5 | SYSTEM_DESIGN:282 | pipdata owns Download, formatting, validation, deflation, ALL module for Table Maker; must not own Calculations of indicators; status Decided | The exact Markdown row below | Pending exact approval; R3 outcome approved |

Exact D5 replacement:

```markdown
| `pipdata` | Download, formatting, validation, deflation, ALL module for Table Maker; release orchestration through one public entry point, separate from processing functions | Calculations of indicators; independent rebuild authority | Decided |
```

Preserve the following existing Decided statements verbatim: survey definition at 125, module-not-a-version at 129, stamp rebuild authority at 188, per-estimate dependencies at 190, log-never-decides at 217, release states/correction window at 246-250, fst/performance at 306, and API transition at 301-305. Existing unrelated Decided statements remain unchanged.

### Charter Constraint: Separate Required Approval

At `compound-gpid.md:31-33`, keep the stamp/domain-agnostic sentences and replace only:

> PIP specific concepts live in pipsystem.

With exactly:

> PIP-specific runtime concepts live in the PIP packages. Release orchestration lives in `pipdata`; `pipsystem` is the design and evidence workspace.

Status: **Pending separate explicit approval**. Approval of R3's location does not silently approve this charter edit. Do not use `/cg-strategy` permissions to change constraints. `/cg-work` must perform only this bounded, separately approved documentation edit under its protected-artifact rules. If those rules do not permit the approved edit, stop rather than replace or regenerate the charter.

### Current Focus: Optional and Conditional

Exact proposed Current Focus:

> M0 design decisions and approved M1 decisions R2, R3, and R4 are integrated. The nine-feature M2 start gate is satisfied. Next: plan the M2 walking skeleton. M1 R1 and unresolved capability gaps remain Open. No M2 implementation starts from this documentation task.

Status: **Pending separate explicit approval**. Apply only in Step 4 after the gate is actually 9/9. Archive the complete replaced baseline text below first, retaining previous last-reviewed `2026-10-07`, then update Current Focus and last-reviewed together:

> M0 and M1 in parallel. M0: Andres decides the proposals in SYSTEM_DESIGN.md. M1: one agent per package answers HARVEST_BRIEF.md. Next: M2 walking skeleton, starting when its nine prerequisite features are done.

No approval or a declined Focus change means leave Focus, history, and last-reviewed unchanged; verify and record that result. No other charter field is authorized.

### Existing Feature Title: Optional Correction

Propose changing only the title of existing feature `decide-module-out-of-survey-id` from `Decide module out of survey ID` to `Decide module-bearing artifact identity`. Status: **Pending explicit approval**. Preserve the existing ID and strategy membership whether the title changes or not. If not approved, retain its historical title and record the selected keep-module outcome in design/execution evidence.

## Open Register and Gaps to Preserve

Retain a nonempty design Gaps subsection and synchronize section 12 with the following limits. Policy decisions can be settled while their implementation remains Open.

| Baseline Open item | Post-integration treatment |
|---|---|
| 1. Row-level detection | R1 stays Open. Keep alternatives as proposals and retain S1/A1/D2 evidence. Generated selections do not choose a partition/projection algorithm or create a second rebuild authority. The old pipsystem comparison-step location is an unapproved candidate, not a runtime location decision. |
| 2. Partition as parent | Record source support as inherited evidence, not a new Decided mechanism. Selective invalidation, removed keys, automatic parent inference, unchanged pins, and integration validation remain gaps. |
| 3. Custom metadata | Source supports custom current-sidecar fields and data-free current reads. Metadata-only saving, same-version historical metadata, collision/type rules, and stable access mechanisms remain Open. |
| 4. Code versions | R2 automatic fingerprint policy is Decided. Known dependency coverage, missing/NA saved-hash behavior, and code-only scheduling remain Open. Do not promote explicit-label proposals. |
| 5. Module removal | Rejected; module-bearing artifact identity is Decided. No identity migration, alias system, or new cross-module history mechanism is selected. Metadata safeguards remain required with their mechanisms Open. |
| 6. Selection rule/choices | Generated table policy is Decided. HIST/BIN and competing-survey rules, source inputs, and exact selection schema remain UNKNOWN/Open. Do not adopt legacy HIST-before-BIN ranking. |
| 7. Lineups | Methodology and full inputs remain Open for M4 targets harvest. |
| 8. Missing-data inputs | Cross-country inputs remain Open for M4; do not infer them from wbpip dispatch. |
| 9. Stage 5 shape | Independent list/data.table results and separate saving/assembly are Decided. Exact keys, types, null rules, units, storage and assembly granularity remain Open. Distinguish decile shares from cutpoints. |
| 10. Orchestration | pipdata location is Decided. Existing manifest authority reconciliation and exact entry point remain Open. Platform remains unselected. |
| 11. targets replacement | Remains Open pending M4 harvest. |
| 12. pipload | Adapter boundary is Decided. fst/qs2 compatibility, separate metadata-artifact paths versus sidecars, and pinned metadata integration remain Open. |
| 13. Interface/platform | Both remain Open; no Shiny, Databricks, or hosting decision follows. |
| 14. Failures | Approved policy replaces automatic retries. Classification, Force interaction, persistent failure/status integration, and exact record schema remain Open. |
| 15. Correction history | Retention of replaced versions and dated references is Decided. Atomic capture, historical reads, freeze enforcement and retention mechanisms remain Open. |

Also preserve Open logging relocation at section 7 and detailed analyst workflows, exact engine/table signatures, and output contracts. Keep the current/target contradictions from `notes/FINDINGS.md:86-100` visible: generated GitHub readback, validation/no-save gaps, welfare column names, pipdata planner authority, stamp planner/executor defects, legacy module ranking, and old-release API availability risk. Do not resolve them by changing unrelated Decided requirements.

Implementation gaps must cite their inherited evidence and remain untested here:

- stamp metadata-only/parent-only saves can skip; public current-sidecar readers lack historical selectors (S: `R/IO_core.R:253-269,310-348,630-660`; `R/format_registry.R:319-347`; `R/version_store.R:631-661`; `notes/stamp.md:74-82`).
- stamp staleness does not compare requested code hashes, and transitive planning/unchanged-output lineage have gaps (S: `R/version_store.R:1176-1217`; `R/rebuild.R:311-327,495-518`; `tables/stamp_fit.csv:5-6,10,14-15`).
- pipdata's current manifest/planner is not approval of a second currentness authority (Dp: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`; `notes/pipdata.md:99-118`).
- pipload's exact QS2 metadata artifact is distinct from stamp sidecars, and current PIP loaders have unvalidated fst compatibility (L: `R/pip_inv_enrich.R:219-260`; `R/load_pip_data.R:375-389`; `R/load_aux_data.R:37,61-66`; `notes/pipload.md:40-42`).
- Current API wide files and LCU-to-PPP conversion remain the release boundary until the existing planned API change (I: `R/utils-stats.R:26-60,338-377`; `R/utils-pipdata.R:274-321`; `notes/pipapi.md:43-71,106-129`). Complete production schemas and numerical equivalence remain UNKNOWN.
- Named releases, parallel-write safety, target-scale performance, and complete stage 5-7 calculations are not certified by harvest completion. No tests were executed (`HARVEST.md:41-49,71-78`; `tables/stamp_fit.csv:12-16`).

## Roadmap Reconciliation

Baseline: all listed M0/M1 features are `idea` with `plan: null`. Each later done write needs its listed evidence. Never add unsupported completion/evidence/dependency fields to JSON.

| Milestone ID | Existing feature ID | Target status | Evidence/limit |
|---|---|---|---|
| m0-settle-the-design | decide-module-out-of-survey-id | done | M0 follow-up:169-190; retain ID despite rejected module-free proposal |
| m0-settle-the-design | decide-decisions-become-data | done | M0 follow-up:192-204 |
| m0-settle-the-design | decide-stage-5-output-shape | done | M0 follow-up:206-223; independent outputs, not a long-table approval |
| m0-settle-the-design | decide-engine-first-interface-later | done | First M0:124 |
| m0-settle-the-design | decide-pipster-calculations-only | done | First M0:127 |
| m0-settle-the-design | decide-plan-only-mode | done | First M0:128 |
| m0-settle-the-design | decide-transient-and-permanent-failures | done | First M0:126; revised no-loop policy |
| m0-settle-the-design | decide-corrections-keep-history | done | First M0:125 |
| m0-settle-the-design | update-system-design-with-m0-decisions | done after Phase 1 checks | This plan, approved exact edits, and actual verified design diff |
| m1-know-the-code | harvest-stamp | done | HARVEST:13,32,41-49; notes/stamp; all 15 fit rows |
| m1-know-the-code | harvest-pipaux | done | HARVEST:14,33,41; notes/pipaux A1-A4 |
| m1-know-the-code | harvest-pipdata | done | HARVEST:15,34,41,46; notes/pipdata D1-D4 |
| m1-know-the-code | harvest-pipload | done | HARVEST:16,35,41; notes/pipload L1 |
| m1-know-the-code | harvest-pipfun | done | HARVEST:17,36,41; notes/pipfun F1 |
| m1-know-the-code | harvest-pipster-and-wbpip | done | HARVEST:18-19,37,41; combined P1/P2 note |
| m1-know-the-code | harvest-pipapi | done | HARVEST:20,38,41; notes/pipapi I1 |
| m1-know-the-code | write-harvest-findings | done | HARVEST and FINDINGS complete with all 15 Open rows and nonempty gaps |
| m1-know-the-code | decide-row-level-change-detection | unchanged; not done | R1 remains unapproved; evidence is not a selected mechanism |
| m1-know-the-code | decide-code-version-rule | done | Confirmed M1:136,140; policy decision, not scheduling implementation |
| m1-know-the-code | decide-orchestrator-location | done | Confirmed M1:137,139; pipdata, not separate pipsystem package |
| m1-know-the-code | decide-pipload-role | done | Confirmed M1:138 |
| m1-know-the-code | update-system-design-with-m1-findings | active; not done | Approved R2/R3/R4 integrated; R1 and full M1 design integration remain outstanding |

No M2 feature is changed, activated, linked, or completed. No feature is added, retired, moved, or re-IDed. Whole-M1 completion is forbidden. The harvest/decision features track evidence collection or policy capture, not implementation success.

## Gate Checklist

The authoritative set is strategy:160-168. `roadmap.json` has no structured start-gate fields; do not invent them. The current formal gate is **0/9 done**. This plan's target is **9/9 done after verified writer updates**, not a present readiness claim.

| Gate | Milestone ID | Existing feature ID | Evidence and selected outcome | Required final status |
|---|---|---|---|---|
| G1 | m0-settle-the-design | decide-module-out-of-survey-id | Keep module in artifact identity, follow-up:169-190 | done |
| G2 | m0-settle-the-design | decide-engine-first-interface-later | Plain R engine, first M0:124 | done |
| G3 | m0-settle-the-design | decide-pipster-calculations-only | Calculation-only, first M0:127 | done |
| G4 | m0-settle-the-design | decide-stage-5-output-shape | Independent saved results/assembly, follow-up:206-223 | done |
| G5 | m1-know-the-code | decide-orchestrator-location | pipdata coordination, confirmed M1:137,139 | done |
| G6 | m1-know-the-code | decide-code-version-rule | Automatic fingerprints, confirmed M1:136,140 | done |
| G7 | m1-know-the-code | harvest-stamp | S1-S7 plus 15-row fit CSV; HARVEST:32,41 | done |
| G8 | m1-know-the-code | harvest-pipaux | A1-A4; HARVEST:33,41 | done |
| G9 | m1-know-the-code | harvest-pipdata | D1-D4; HARVEST:34,41 | done |

R1, R4, the design-update features, and remaining M1 harvests are not additional gate members. M2 need not wait for whole-M0/M1 completion. Required stamp gaps must still close before M2 finishes (strategy:170); verifying this start gate does not close those gaps or authorize package code changes here.

## Testing Strategy

### Documentation Checks in This Task

Use dedicated Read/Grep tools for source reads, content searches and final field checks. Use terminal commands for Git probes and the installed artifact validator. Record actual outputs and pass/fail in the execution report, not future test promises.

1. Check unique plan requirement IDs R1-R12 and their step coverage; check the 11 Integration Matrix outcomes and both rejected active proposals. Do not confuse plan requirement IDs with M1 recommendation IDs.
2. Compare the five approved Decided replacements and the single approved charter sentence against the diff. Check all other Decided requirements and charter constraints for unintended changes.
3. Compare the 15 Open Register items, other Open items, and nonempty Gaps against the edited design. Verify source path/line and full-SHA provenance through the notes/HARVEST mapping.
4. Execute targeted roadmap reads, verify all 22 existing M0/M1 records against the table, preserve all 66 IDs and seven milestone IDs, and check M2-M6 records/links unchanged. Require correct feature/milestone status enumerations and derived milestone status.
5. Execute the final nine-row gate read; verify membership, uniqueness, evidence and done statuses. Keep the gate result separate from current capability/test status.
6. If Focus changed, read the archive and charter to verify the exact complete replaced text, prior date, append-only history, approved new text, and paired review-date change. Otherwise execute the unchanged-field check.
7. Run `git diff --check`, final status, constrained diffs, and branch verification. Check that execution lifecycle writes are limited to the linked work report, the six allowed plan progress fields and compact current active-state record; they do not authorize system configuration or optional snapshots. Compare historical evidence/unrelated plans/configuration to the execution baseline, not only to a possibly older commit. Do not revert another participant's changes.
8. Validate the canonical plan without HTML before execution and after plan revisions. Safe installed command from pipsystem:

```powershell
& ".\.venv\Scripts\python.exe" -B "C:\Users\wb384996\.compound-gpid\scripts\render_artifact.py" --validate-only ".cg-docs/plans/2026-10-07-m0-m1-design-integration.md"
```

This is the installed `cg-render-artifact --validate-only` entrypoint. `-B` avoids bytecode writes in the external read-only tooling folder. If its known path is unavailable, inspect the installed command entrypoint without editing configuration; if validation cannot run safely, stop. No view write is allowed. Expected optional view path is `.cg-docs/views/plans/2026-10-07-m0-m1-design-integration.html`; it is not generated by this run.

### Future Implementation Checks: Not Run Here

Retain these as unresolved evidence needs only: metadata-only version preservation and historical readback; code-only changes/relevant helpers/NA hashes; unchanged-output lineage refresh; selective invalidation and removed keys; independent estimate saves followed by failed assembly and recovery; API schema/numerical compatibility; failure status/retry eligibility; release capture/retention; concurrency and Windows/SMB safety. This task does not run package tests or turn these scenarios into completed capabilities.

## Documentation Checklist

- [ ] All eight M0 selected outcomes and confirmed M1 R2/R3/R4 are integrated with approval references.
- [ ] Rejected module-free and mandatory long-table proposals are not active design instructions.
- [ ] Survey identity and module-bearing artifact identity are distinct; metadata safeguards remain explicit.
- [ ] Successful estimate results are independently saved before reuse; assembly has separate recovery.
- [ ] Automatic fingerprints are not mislabeled as approved manual labels or complete scheduling.
- [ ] pipdata orchestration, pipload access, and stamp rebuild authority agree with approved charter wording.
- [ ] R1 and all other unresolved policies/capabilities remain Open with nonempty gaps.
- [ ] Historical harvest/brainstorm/strategy records and stamp_fit.csv remain unchanged.
- [ ] Existing roadmap records alone are updated through the sole writer; M1 remains incomplete.
- [ ] Gate checklist contains exactly nine approved IDs, each freshly verified done.
- [ ] Conditional Focus/history/review-date change is separately approved and checked, or is preserved unchanged.
- [ ] Plan review findings and their resolutions are recorded in this plan; validate-only passes; no HTML is written.

## Risks & Mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Harvest proposals treated as approvals | Wrong identity, output shape, code rule or location | Use the later M0 and confirmed M1 decision records; list rejected alternatives explicitly |
| R3 silently changes the charter constraint | Protected boundary violation | Separate exact charter approval; stop before edits if absent; one bounded sentence only |
| Identity/selection edits imply module-free history or R1 approval | Wrong dependencies or unapproved mechanism | Distinguish business survey identity from artifact identity; keep R1 and missing policies Open |
| Independent result policy becomes one combined saved file | Lost recovery and unnecessary recalculation | Require successful per-estimate saves before reuse and separate assembly inputs/outcome |
| Fingerprints/pipdata reuse imply existing scheduling works | Two rebuild authorities or stale reuse | Preserve stamp authority and code-only/current-manifest gaps; no implementation certification |
| Shared plan link auto-completes partial M1 integration | False whole-M1 completion | Link only M0 integration if confirmed; explicitly keep M1 integration active and R1 uncompleted |
| Link operation resets a completed status or IDs drift on rename | Gate fails or wrong feature is counted | Link before done, dispatch exact ID pairs, rename title only, read back all gate records |
| Focus claims readiness before the gate passes | False charter status | Check nine statuses first; archive before optional approved Focus/review-date update |
| Documentation checks are substituted with future test promises | Unsupported completion claim | Record executed reads/diffs/validator results; distinguish future package validation |
| Concurrent edits or stale source lines | Overwrite or incorrect approval scope | Re-read headings and current text; preserve unrelated edits; stop on direct scope conflicts |

## Out of Scope

- Package source or package tests, R/Pester execution, stamp fixes, pipeline/API calls, targets harvest, and M2 implementation.
- System configuration, local adapters, setup/update scripts, .gitignore, dependencies, and hosting selection.
- Module-free identity, mandatory long tables, alias/history frameworks, general dependency discovery, and automatic retry loops.
- New roadmap features/milestones, whole-M1 completion, new dependency fields, GitHub issues, and direct roadmap writes.
- Charter objective/deliverables/other constraints, unrelated existing plans, historical evidence edits, HTML generation, branch changes, commits, and pushes.
- A broader API redesign or premature per-estimate/selection schema and physical-storage design.

## Completion Contract

### Outcome

The design contains all eight selected M0 outcomes and approved M1 R2/R3/R4, with R1 and unresolved gaps still Open. Existing roadmap records are reconciled through cg-roadmap and the exact nine-feature M2 gate is verified, without starting M2 or completing the whole M1 milestone.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|---|---|---|---|---|
| V1 | 1 | Every M0 outcome and M1 R2/R3/R4 maps to its approval record and actual design edit | Executed reads and Integration Matrix results in the execution report | yes |
| V2 | 1 | Module-bearing identity, metadata safeguards, independent saved results, separate assembly and current API boundary are retained | Executed Read/Grep of SYSTEM_DESIGN and inspected diff | yes |
| V3 | 1 | Exact Decided and required charter edits have explicit approval and match the approved bounded wording | Approval records, Approval Register comparison and scoped diff | yes |
| V4 | final | R1/other Open gaps remain, and historical evidence is unchanged by this task | Executed Open Register comparison and baseline-scoped historical diff | yes |
| V5 | final | Only existing roadmap records change through cg-roadmap; all IDs/counts/other milestones persist; M1 is incomplete | Writer results, targeted roadmap reads and roadmap diff | yes |
| V6 | final | Exactly G1-G9 are unique, evidence-backed and done after updates | Fresh nine-ID roadmap read and row-by-row gate result | yes |
| V7 | final | Focus/history/last-reviewed are either approved and paired after the gate, or verified unchanged if not approved | Executed charter/archive comparison and approval/no-change record | yes |
| V8 | final | Scope is documentation only, current branch persists, protected paths are preserved and validate-only passes without HTML | git status/diff/branch, git diff --check and actual plan validation output | yes |

### Constraints

| ID | Phase | Constraint | Check |
|---|---|---|---|
| C1 | final | Only pipsystem is writable | Changed-path check; no external writes or bytecode generation |
| C2 | 1 | No unapproved Decided or charter changes | Compare bounded diffs with explicit approvals; no charter regeneration |
| C3 | final | No new features, whole-M1 completion or M2 implementation | IDs/counts/status check and constrained diff |
| C4 | final | Harvest, brainstorm, strategy and unrelated plans remain historical/unchanged by this task | Baseline-scoped diff; preserve concurrent changes |
| C5 | final | Source support is not an executed package-test pass or completed implementation | Check design/report claims against inspection-only evidence and retained gaps |
| C6 | final | --no-html never bypasses validation | Actual validate-only success; no generated view change |

### Boundaries

- Allowed at planning: this new plan and its review-driven revisions only; source inspection and validation.
- Allowed at execution before integration approval: the standard plan-linked work report, its `execution-report` pointer and only the six allowed plan frontmatter progress fields, and the compact `.cg-docs/active-state/current.json` record. Limit these to normal report-created, phase-boundary, blocked-stop and completion lifecycle updates. No design, charter or roadmap integration is allowed before the required approval preflight.
- Allowed at execution after approval: bounded SYSTEM_DESIGN edits, the exact charter sentence, conditional Focus/history/review-date edits, writer-only existing roadmap updates, and the same bounded lifecycle records. No optional workflow snapshot or unrelated report is authorized.
- Out of scope: package implementation/tests, configuration, new features, historical record changes, API redesign, unrelated plans, branch changes, commit, push and HTML.
- All permissions and protected-artifact rules remain in force. This contract cannot override them.

### Iteration Policy

1. Validate the plan and check source state, branch and approvals before integration edits.
2. Apply only approved exact replacements and selected outcomes; strict policy forbids filling gaps with inferred decisions.
3. Execute documentation checks before requesting roadmap done writes. Failed writer requests may be corrected through cg-roadmap only, without adding IDs or weakening required evidence.
4. Keep M1 integration active and R1 uncompleted, including during any generic `/cg-work` completion handling.
5. Read back all nine gate members before any readiness claim or conditional Focus update.
6. Stop and record missing evidence/approval or a required deviation. A revised, approved plan is required before crossing scope; no accepted exception may silently alter protected permissions.
7. Complete this bounded documentation plan only when V1-V8 and C1-C6 have executed evidence. Do not start M2, commit, push, or render HTML automatically.

### Blocked-Stop Conditions

- Missing exact Decided approval or missing charter-conflict resolution before integration.
- Missing or conflicting decision evidence, directly conflicting concurrent edits, or changed outcome requiring plan revision.
- Safe plan validation or any required executed check cannot run or fails without an in-scope correction.
- Roadmap writer unavailable, expected ID missing/ambiguous, invalid JSON, or forbidden fallback direct write.
- Any gate member not done or evidence-backed; no readiness claim or gate-passed Focus may follow.
- Any required strict deviation, protected-boundary crossing, package/configuration change, or inability to maintain the work report.

## Plan Review Record

Initial `/cg-plan-review` completed on 2026-10-07 with cg-plan-critic: **0 P1 / 1 P2 / 0 P3**. The critic read the complete canonical plan and checked decision evidence and installed workflow rules. No review file, package source edit, or runtime test was created. The user requested all findings addressed; none is accepted or deferred.

| Finding | Issue and evidence | Resolution | Status |
|---|---|---|---|
| P2.1 | Strict execution boundary omitted required report-pointer/progress and active-state writes before Step 1; cg-work:14-15,142-150 and active-state contract:59-66 require them | Step 1 and Completion Contract Boundaries now allow only the standard linked report, six permitted progress fields, and compact current active-state record at execution lifecycle points, including blocked approval preflight. Integration approvals remain required; planning/configuration boundaries are unchanged. Testing Strategy checks this bounded allowance. | Addressed and confirmed resolved |

Confirmation `/cg-plan-review` on 2026-10-07 read the full revised plan and returned **0 P1 / 0 P2 / 0 P3**. P2.1 was confirmed resolved. The critic checked approval preflight, bounded lifecycle records, retrospective roadmap reconciliation versus whole-plan completion, and executed nine-ID gate readback. Result: no significant issues; ready for `/cg-work` approval preflight, not approval to apply protected wording. All findings are addressed; none is accepted, deferred, or unresolved.

Validation history: the initial renderer rejected non-schema REQ IDs and trailing punctuation in step mappings. They were changed to unique R1-R12 IDs, with an explicit distinction from M1 recommendation names. Validate-only passed after the schema correction and again after the lifecycle revision. Final source validation remains mandatory after this review-record update. Exact protected wording remains pending approval at execution preflight.
