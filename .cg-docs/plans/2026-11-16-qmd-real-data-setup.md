---
date: 2026-11-16
title: "Manual real-data setup for COL 2010 GEIH"
revision: 1
status: completed
completed-date: 2026-11-16
scope: Lightweight
brainstorm: null
language: R
estimated-effort: small
deviation-policy: autonomous
artifact-schema-version: 1
execution-report: .cg-docs/work-reports/2026-11-16-qmd-real-data-setup.md
tags: [qmd, real-data, setup, read-only]
---

# Plan: Manual real-data setup for COL 2010 GEIH

## Objective
Add the first real-data setup cell to `experiments/pip-pipeline.qmd`, without
running the pipeline or changing the existing isolated synthetic checks.

## Context
The user approved this setup-only scope, its review and implementation on
existing `main` on 2026-11-16. Keep this checkout; no branch/worktree or Git
mutation. Source files are already untracked; preserve their current contents
as a task-local test baseline before editing. The completed offline Qmd Plan
stays closed. Its isolation and numerical/exact/invalid assertions still apply.
Prior findings: `.cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md:51-74`.
The local Brain query selected that Plan; no remote knowledge pull is needed.

## Working Principles
Minimal first: (1) smallest working setup slice; (2) safeguards only for almost-
irreversible loss, wrong published numbers, private-data exposure or production/
shared-branch harm; otherwise Later; (3) one functional check per change;
(4) installed tools and only worthwhile dependencies; (5) Plan about two pages.
Autonomy: proceed within this scope; ask only for almost-irreversible actions,
protected/Decided or charter/roadmap scope changes, Git mutations, or deletion
of non-generated files. Approval covers review, safe fixes and verification.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | Show release `20260401`, identity `TEST`, main `//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2`, survey `COL_2010_GEIH_V04_M_V01_A_GMD_GPWG`, PIP ID `COL_2010_GEIH_INC_GPWG` | User decisions; discovery handoff `20261116T194917Z-col-geih` |
| R2 | Configure only process-local `pipfun.main_dir` and parent `PIP_ROOT_DIR`; check directory existence and print actual results | Approved setup-only contract |
| R3 | Manual real setup is not executed by the default synthetic render; initialization/aliases/processing remain NOT RUN | Approved contract; no shared writes |
| R4 | Preserve every pre-existing synthetic R chunk and assertion exactly; clearly distinguish synthetic from real acceptance | Original completed Plan; user direction |

## Implementation Steps
### 1. Add focused setup checks before the new cell
- **Requirements**: R1, R2, R3, R4
- **Files**: `experiments/one-survey/check-qmd.R`
- **Tests**: focused checker against the unchanged Qmd; red log
- Capture pre-edit Qmd chunks and checker in ignored E:-local test artifacts.
  Add checks requiring the new named manual cell, exact selected values,
  process-local paths and successful directory-existence assertions. Restore
  session settings after testing the cell. Exercise missing-directory failure
  without shared writes. Establish a failing baseline for the missing cell.
- **Acceptance**: new test fails before implementation; old tests stay intact.

### 2. Add the manual cell, verify and review
- **Requirements**: R1, R2, R3, R4
- **Files**: `experiments/pip-pipeline.qmd`
- **Tests**: focused checker, exact original-chunk comparison, scoped review
- Put a short real-data section first, with a visibly manual `eval: false` R
  cell. Keep selected values and folder checks visible, with descriptive names,
  comments and spacing. Set only the two session path settings. Do not load a
  pipeline namespace or call release/storage setup. Directory existence is not
  proof of data-read/write access; say so. Keep unexecuted stages explicit.
- Relabel the remaining narrative as the isolated synthetic acceptance example;
  retain its R chunks byte-for-byte. No new runner/mode/parameter framework.
- Run the focused checker and exact original-chunk comparison in an isolated
  R child using installed dependencies; redirect temp/home/cache/logs into E:.
  Review only this task delta. Fix all supported findings including P3, then
  finish a light verification pass. No pipeline or full synthetic rerun.

## Testing Strategy
The existing base-R focused checker is the test surface; no dependency is added.
Use the installed R executable and existing private dependency library only.
Keep baseline, red/green logs and comparison evidence in
`.tmp/qmd-real-data-setup/20261116T202500Z/`. A directory check earns only a
directory-existence result, never release or survey acceptance.

## Documentation Checklist
Qmd distinguishes manual real setup, isolated synthetic evidence and NOT RUN
stages. Save Plan review, work/review reports and a pip-handoff-v2 result.

## Risks & Mitigations
| Risk | Minimal response |
|---|---|
| Manual cell accidentally runs during synthetic rendering | Require explicit per-cell `eval: false` |
| Existing untracked work is overwritten | Compare every original R chunk with the pre-edit baseline |
| Share unavailable or existence confused with write access | Report actual failed check; do not create folders or claim write permission |

## Out of Scope
Downloads; household data; package edits/installs/pins; release/stamp initialization;
pipeline execution; shared writes; B6; full-release processing; roadmap/design/
instruction changes; commits/pushes/merges. No new sessions or worktrees.

## Completion Contract
### Outcome
The Qmd has an executable manual real-data context cell for the chosen GPWG
survey, with tested folder configuration and unchanged isolated synthetic code.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | All R chunks parse; new test has a recorded failing baseline | Focused checker; red log | yes |
| V2 | Actual new cell passes exact context/path/existence checks; missing-folder case fails without claiming PASS | Focused checker; green log | yes |
| V3 | All old chunks unchanged; existing error/NOT RUN, fixture and instruction tests still pass | Baseline comparison and focused checker | yes |
| V4 | Plan critique fixed; scoped code/testing review and final verification converge | Plan review; code review; verify review | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | Only Qmd/checker source plus normal task artifacts; preserve mixed-owned work | Task baseline and source diff |
| C2 | No shared writes, namespaces/pipeline calls, data copying, package/Git mutations | New-cell inspection, executed checker, task command record |
| C3 | All agent writes in this E: checkout | Existing path-containment check and process-local redirects |

### Boundaries
Allowed: the two named source files and task-local Plan/review/work/handoff records.
Use a named active-state snapshot; do not overwrite mixed-owned `current.json`.
No new roadmap linkage or milestone completion is claimed by this setup slice.

### Iteration Policy
1. Validate the saved Plan; review it and fix all findings before source edits.
2. Up to two targeted corrections per failed required check; rerun affected tests.
3. Resolve all in-scope review findings; final verify has no suppression unless
   supported by fixed finding IDs. Record reversible deviations within this scope.

### Blocked-Stop Conditions
Stop if a required check still fails after its budget, safe execution/reporting
is unavailable, or completion needs a pipeline run, shared write, installation,
package change, protected/scope decision or broader implementation.

## Later
Working-release/alias initialization, real auxiliary inputs, bounded single-survey
acquisition and processing need their own subsequent Qmd steps and evidence.
