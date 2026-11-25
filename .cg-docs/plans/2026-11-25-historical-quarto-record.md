---
date: 2026-11-25
title: "Historical Quarto record for M0, completed M1 work, and early M2"
status: completed
completed-date: 2026-11-25
completed-phases: [1, 2]
execution-report: .cg-docs/work-reports/2026-11-25-historical-quarto-record.md
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "autonomous"
artifact-schema-version: 1
phases: 2
tags: [quarto, evidence, m0, m1, m2]
---

# Plan: Historical Quarto record

## Objective
From `experiments/pip-pipeline.qmd`, let a reader reach the original evidence for 23 items and see what was checked now. Inventory and Plan: 15-25 minutes estimated. Full backfill: 3-5 hours, mostly tracing revisions and checking pages.

## Context
Planning baseline: `/Users/acastanedaa/Developer/pip/pipsystem`, local `main` tracking `origin/docs/m2-machine-migration`, HEAD `58c7d7b34beea2316ec47227a3866977b41faf28`. In `.cg-docs/plans/`, `2026-10-07-m0-m1-design-integration.md` has blob `c1b56faec72bfdaf18168eaa49be98083d453938`; `2026-10-10-m2-walking-skeleton.md` has blob `585a92a14760ca41062031c4af84108b6ddb1204`. A Plan describes intent; use the dated decisions, work reports and handoffs for outcomes.

| Coverage | Items (one page each unless original evidence is missing) |
|---|---|
| M0 (9) | `decide-module-out-of-survey-id`, `decide-decisions-become-data`, `decide-stage-5-output-shape`, `decide-engine-first-interface-later`, `decide-pipster-calculations-only`, `decide-plan-only-mode`, `decide-transient-and-permanent-failures`, `decide-corrections-keep-history`, `update-system-design-with-m0-decisions` |
| M1 done (11) | `harvest-stamp`, `harvest-pipaux`, `harvest-pipdata`, `harvest-pipload`, `harvest-pipfun`, `harvest-pipster-and-wbpip`, `harvest-pipapi`, `write-harvest-findings`, `decide-code-version-rule`, `decide-orchestrator-location`, `decide-pipload-role` |
| M2 Phase 01 (3) | Step 01 contracts and work orders; Step 02 generic stamp; Step 03 pipdata engine (October 10 Plan, lines 252-289). |

M1 remains `in-progress`: row-level change detection is an open decision (roadmap `idea`), and the design update is `active`. M2 Step 01 is a prerequisite, not a roadmap feature; Steps 02 and 03 map to `close-stamp-gaps-for-skeleton` and `create-engine-skeleton`. Keep fixture results separate from integration and live testing. Link later work via the existing M2 index, Step 05 page and dated handoffs; no Step 06 page.

**Implementation preflight, before Step 1:** The reviewed implementation HEAD is `dcfd90671a25fd048162aead88e4674d3ec90e10`, not the planning baseline. Verify the root, local branch, upstream, this HEAD and both historical blobs. Record staged, unstaged and untracked target paths before editing; preserve the existing formatting edit in `experiments/m2/index.qmd` and add Phase 01 navigation without replacing the Phase 02 text. Stop on mismatch or conflicting edits; never move the checkout to the old baseline.

In the verified hub, exclusively create `.cg-docs/orchestration/outputs/pipsystem/historical-qmd/20261125T214856Z-backfill/handoff.md` as `pip-handoff-v2`, `status: running`, per `.cg-docs/orchestration/CONTRACT.md`. If the report path is occupied, stop before writing; do not overwrite or select a different run ID. Update only this run's report at checkpoints and finalize it on every exit after creation, including partial or blocked outcomes.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | Preserve coverage, identity, numbering and status. | Roadmap, two pinned Plans, user |
| R2 | Document what, why, owner, inputs, outputs, pinned evidence, one useful check and gaps. | User; charter lines 24-33 |
| R3 | Link milestone and genuine phase indexes to independent pages from the pipeline QMD. | User; existing M2 index |
| R4 | Verify local navigation and offline renders; report sanitized results without overwriting work. | User; development evidence rules |

## Implementation Steps
The phases below organize this backfill only; they do not define historical phases.

## Phase 1: Trace and write
### 1. Map each item to original evidence
- **Requirements**: R1, R2
- **Tests**: Use `git show <revision>:<path>` to verify each cited passage and compare the index keys with the 23-item coverage list.
- **Files**: `roadmap.json`, `SYSTEM_DESIGN.md`, `HARVEST.md`, `notes/`, `.cg-docs/{brainstorms,plans,work-reports,orchestration/outputs}/`.
- **Details:** Compare approvals with integrated text. For harvests link the package note, its outputs and source SHA (`HARVEST.md:11-45`); the joint note needs both SHAs. For M2 start with the contract decisions, stamp evidence closeout and pipdata engine handoff. Check historical integration numbering against the October 7 Plan.
- **Acceptance criteria**: For each claim, give the owning repository, full commit, path and line range, with offline retrieval via `git -C <repo> show <sha>:<path>`. Cite a commit containing each harvest output separately from its input package pin; disclose relevant dirty files. If an object is unavailable, name the dated report, mark direct verification `NOT RUN` and unsupported facts `UNKNOWN`. Identify recorder separately from accountable owner. Map each of the 23 keys exactly once.

### 2. Write independent records under experiments
- **Requirements**: R1, R2
- **Tests**: Run one pinned-record comparison or one isolated public call on synthetic inputs per page; report missing prerequisites separately.
- **Files**: `experiments/{m0,m1,m2}/`. Use Step 05 as a layout example only. Keep historical numbers where assigned, otherwise use feature IDs.
- **Details:** Check decisions against signed-off text; check harvest claims against pinned source. For executable work reuse one documented public call and a synthetic fixture, recording the expected output, owner and fixture limits. Never run a pipeline or a real-data cell. If the only public call requires either, mark NOT RUN and state why.
- **Acceptance criteria**: Run a public call only if all inputs, storage and service targets are synthetic, local and disposable. No live DLW, mounted survey files, real setup, shared release targets or pipeline entry points. If isolation is uncertain, record `NOT RUN` and why. Record the date, loaded package version and build SHA if known (otherwise `UNKNOWN`); do not infer it from checkout HEAD. On failure retain the sanitized message; dependent checks are `NOT RUN`. Each page stands alone. At phase end checkpoint the 23-key page/gap mapping and outstanding checks in the running handoff.

**Approved sample: M0 / `decide-plan-only-mode`.** An analyst can preview selected work and its reasons without running a stage. Inputs are the normal planning inputs; the output is an R data.table, not a saved execution commitment. Owner: pipsystem design record, recorded by R. Andres Castaneda. Original approval: `.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md:119-128` at `e1175c02d71e836743fc684e3883043163837411`; integrated rule: `SYSTEM_DESIGN.md:268` at `c439cdbbeeb0042b8d8b0ceb636c974363067d65`. Planning check: PASS (read both records and verified the decision lines with `git blame`); runtime NOT RUN. Gap: exact columns remain open; neither record proves runtime state is unchanged.

## Phase 2: Connect and verify
### 3. Link the records from the pipeline overview
- **Requirements**: R1, R3
- **Tests**: Starting at `experiments/pip-pipeline.qmd`, resolve each local link and check each return path.
- **Files**: `experiments/pip-pipeline.qmd`, milestone and documented phase `index.qmd` files. Preserve existing links, including `m2/phase-02/step-05-download-one-survey.qmd`.
- **Tests / acceptance:** Traverse relative links from the entry point to every page and back. An open feature has status text, not a placeholder link. Later work links to an existing record, not a new implementation claim.

### 4. Render offline and record results
- **Requirements**: R2, R3, R4
- **Tests**: Stage only the required sources and safe resources in one fresh scratch tree preserving relative paths; do not copy cached outputs, survey files or secrets. Render the overview, milestone and phase indexes, all records and existing Step 05 offline with `quarto render <page> --no-execute`. Step 05 is navigation-only. Finish all renders before checking links.
- **Acceptance criteria**: Use installed Python's standard library to resolve actual `href`s relative to each containing HTML file. From the overview traverse to every record and back; require navigation targets to be HTML generated in this run and fragments to match destination IDs. Raw QMD, stale HTML and dangling anchors fail. Verify local source-evidence links separately; never fetch or count external URLs as offline passes. Inspect sources and outputs for survey data or credentials. Compare changed paths with preflight; finalize the running handoff with commands, revisions, counts, results and nonempty gaps.

## Testing Strategy
Test the claim the page makes: approval for design, pinned source for harvest, fixture output for executable work. A successful HTML render does not establish that code ran.

## Documentation Checklist
Check title and identity, inputs and outputs, owner, file:lines at revision, dated report versus current check, nonempty gaps, navigation and rendered output.

## Risks & Mitigations
| Risk | Mitigation |
|---|---|
| Older proposal contradicts approval | Cite the dated approval and its integrated decision. |
| Harvest or handoff mistaken for a passing run | Name evidence class, original revision and current result separately. |
| Render opens a survey or discloses sensitive output | Disable execution for renders; isolate synthetic checks; inspect output. |

## Out of Scope
No package changes, live surveys, pipeline runs, roadmap or design edits, new dependencies, new historical phases, Step 06, publication or Git writes. Defer extra checks and site infrastructure.

## Completion Contract
### Outcome
Exactly 23 distinct keys equal linked records plus named missing-source entries, each counted once in the indexes. A gap names the evidence missing and where it was sought; it cannot excuse a broken page or link. A dated fixture `FAIL` or justified `NOT RUN` can complete the documentation of a claim, not establish runtime success. Report `completed` only if V1-V4 pass, including all in-scope renders, routes, fragments, output inspection and finalized handoff. Otherwise report `partial` for unfinished checks or `blocked` when a gate prevents progress.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | All 23 keys accounted for; no empty pages | Coverage list vs linked indexes | yes |
| V2 | Page fields and one claim-specific check | Pinned records or public-call fixture result | yes |
| V3 | Offline renders and local navigation including fragments | Quarto render results and link check | yes |
| V4 | Sanitized results and scope check | Finalized run handoff and changed-path list | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | Correct root, branch, upstream, Plan blobs | Repeat Git preflight before implementation |
| C2 | No invented phases or closures | Compare dated Plans and roadmap |
| C3 | No real-data runs, package edits or publication | Inspect commands, output and changed paths |

### Boundaries
- Allowed after review and approval: documentation, local offline verification and the named report.
- Out of scope: changes listed above; preserve unrelated uncommitted work.

### Iteration Policy
1. Review the Plan and sample before implementation.
2. Complete both phases independently within scope. Fix page and link errors; record package failures without fixing packages.
3. Ask before scope or design changes, real-data runs, publication, deletion or almost irreversible work.

### Blocked-Stop Conditions
- Stop on checkout or pin mismatch. Do not overwrite conflicting edits or another run's handoff.
- Stop dependent checks if a prerequisite is missing or fails. State the reason and continue independent records; do not claim a failed render is complete.
