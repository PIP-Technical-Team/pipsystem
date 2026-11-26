---
date: 2026-11-12
title: "Readable script-first pipeline Qmd"
revision: 1
status: completed
completed-date: 2026-11-13
execution-report: .cg-docs/work-reports/2026-11-13-script-first-pipeline-qmd.md
scope: Standard
brainstorm: null
language: R
estimated-effort: small
deviation-policy: ask
artifact-schema-version: 1
tags: [pipeline, quarto, readable-r, acceptance]
---

# Plan: Readable script-first pipeline Qmd

## Objective
Create `experiments/pip-pipeline.qmd`: the single human-readable entry to the
pipeline's development checks. First deliver the offline one-survey example,
not a new execution engine or full ecosystem certification.

## Context
User approved script-first evidence, Qmd, the readability rules and this bounded
completion contract on 2026-11-12. Example first; B6 remains openly deferred,
not waived. The original survey Plan and its unfinished gates remain unchanged.
Use `pipdata/vignettes/articles/PIP-data-pipeline.Rmd:17-94` as a narrative model;
its `eval=FALSE` at5-13 makes it illustrative, not executed proof. Inspected
pipdata HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40; that article and package
fixes are dirty working-tree evidence. This Plan changes no package source pins.
Assertion baseline (ORACLE): `experiments/one-survey/scenario.R` at commit
`e9c71e3190f1ce88a017ae25af7c373a64c655a2:123-179`, not the mixed-owned current
file. Its working-tree counterpart was lines207-292 at review time.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | One Qmd shows public calls, package ownership, inputs and expectations | User; article17-94 |
| R2 | Executed PASS/FAIL/NOT RUN, never historical or illustrative success | Approved contract; AGENTS.md:14 |
| R3 | Preserve paired values, saved exact pins and genuine invalid/no-output check | Original Plan V2-V4; committed ORACLE above |
| R4 | Readable R and durable project instructions | User style requirements; existing R skills |

## Implementation Steps
### 1. Draft the readable Qmd before expanding helpers
- **Requirements**: R1, R2, R3
- **Files**: `experiments/pip-pipeline.qmd`; minimal changes/additions only
  under `experiments/one-survey/` for setup/fixtures.
- **Tests**: Inspect visible public calls and compare unchanged scenario assertions;
  parse extracted R chunks, then execute/render through step 2's isolated child.
- Start with a short purpose/limits paragraph and parameter/run identity. Show
  working-release setup, auxiliary inputs, acquisition/validation, cleaning and
  metadata/storage, exact readback, and checks in logical commented chunks.
  Keep the actual public calls visible, not hidden in `source(scenario.R)` or
  a generic stage dispatcher. `pd_process_data()` already composes clean,
  metadata and storage; do not invent a separate metadata orchestration API.
- Reuse inspected installation/environment/path checks. Isolate table fixtures
  and external transport substitutions in a plainly named support script only
  if needed. Disclose synthetic catalog/download and fixture-only auxiliaries.
  Do not copy `metapip` upgrades, live DLW or M2 recipe examples from the article.
- Show expected and actual paired welfare365,730,1095,1460 ->1,2,3,4 and weights
  10,20,30,40; saved clean/meta versions and exact reads; survey/CPI1.4/PPP1.6,
  total weight100. The missing-weight survey must complete invalid classification
  with its diagnostic and have no clean/meta artifact. Error/no-work is not rejection.
- Use a small in-memory result table and explicit local error handling, not a
  runner framework. A real step error records FAIL with its actual message;
  dependent chunks become NOT RUN; show the summary even on a package blocker.
  Global `eval=FALSE`, cached/frozen results or old logs must not simulate execution.
- Preserve all existing files/evidence and the current seven full SHAs in
  `setup.R:9-22`; no dirty package installation, `load_all()`, ambient library or
  downloads. Installed-package acceptance takes precedence over the testing
  skill's general development-time `load_all()` example.
  The initial unchanged-pin run may reproduce the known context blocker: this
  proves truthful reporting, NOT a passing original survey. Later stages are NOT RUN.

### 2. Verify the document and persist the style rules
- **Requirements**: R2, R3, R4
- **Files**: entry/support files above; coordination
  sections of `AGENTS.md`, `ORCHESTRATOR.md`, `.cg-docs/orchestration/CONTRACT.md`,
  and only the `pip-orchestrator` prompt text in `kilo.json`.
- **Tests**: Isolated Quarto render/console and NOT RUN summary; parse modified
  JSON; compare four intended instruction excerpts; independent review/verify.
- Record the Qmd as the canonical executable acceptance narrative; generated
  HTML/logs/reports support it, not override executed facts or design/roadmap.
  Package implementations/unit tests remain in their owning repositories;
  `pipdata` orchestrates releases and `stamp` decides reruns (SYSTEM_DESIGN:186,307).
- Require relevant existing skills before writing/reviewing R: shared, technical,
  data.table, collapse and testing as applicable. Use informative comments,
  descriptive names, blank lines, multiline calls, one statement per line and
  roughly80 columns. Favor `|>` for legible data flow, not forced side-effect pipes.
- Locate installed Quarto first: not on PATH or at checked Program Files path
  during planning. No install authorized. Before starting Quarto/R, validate and
  redirect every direct/indirect render/support/temp/home/cache/log output inside
  this E: checkout; reuse the private child runtime and existing environment helper.
- Render the Qmd in a fresh isolated R process, with current approved source
  pins and a fresh store. Show actual run identity/packages and source-to-result
  correspondence. Verify successful preflight/fixture checks, actual failure
  message at a blocked step and NOT RUN downstream if the package path fails.
  Do not mark original V2-V4 passed unless ALL original assertions actually run.
- Parse R chunks/support code and modified JSON, inspect the rendered result and
  review style/instruction consistency. Test any new reporting behavior before
  implementation with a failing baseline; no Pester invocation. Run route-aware
  review, fix all applicable P0-P3 within budget, finish light mode:verify.

## Testing Strategy
V1-V4 are the functional checks. Preserve mixed-owned scripts; report prior
dirty paths separately. No blanket reformat or new independent checker.

## Documentation Checklist
Qmd exposes fixture limits and B6; later stages remain NOT RUN. Instruction
changes take effect only after reload/fresh session.

## Risks & Mitigations
| Risk | Minimal response |
|---|---|
| Quarto unavailable | Deliver source draft; block render evidence, never silently install |
| Known source-pin failure | Record actual FAIL/NOT RUN, no package fix or false survey pass |
| Dirty existing helpers | Inspect/diff before edits, preserve ownership and earlier evidence |

## Out of Scope
Package fixes/commits/pin changes, B6 repair or waiver, original Plan completion,
charter/Decided/roadmap changes, full suite/production/live services, deflation,
means, incremental certification, new framework/installer/skills, deleting files.

## Completion Contract
### Outcome
Readable Qmd plus minimal support and durable style rules. Document completion
is not pipeline acceptance.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Clear sections/calls/ownership and human-readable R | Qmd plus reviewed source diff | yes |
| V2 | Fresh isolated render with actual checks and truthful blocked NOT RUN path if needed | Qmd HTML and same-run console/result summary | yes |
| V3 | Paired numeric, exact saved-version and classified-invalid/no-output expectations preserved; result never inferred | Compare the immutable ORACLE above with visible Qmd checks | yes |
| V4 | Same script-first/style rule in all four instruction surfaces; valid JSON; review fixes verified | Intended diffs, JSON parse and final verify report | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | All child/output writes in E: checkout; isolated existing exact pins | Actual renderer/R paths and package provenance |
| C2 | No package, original Plan-body/pin, Git or shared/production edits | Scoped status/diff and preserved original evidence |
| C3 | Qmd records execution; never replaces package orchestration or stamp planner | Visible calls and current-run summary review |

### Boundaries
Allowed: named entry/helpers/instruction sections and this Plan's normal reports.
Excluded: all Out Of Scope items. Implementation belongs to Code mode; this
orchestrator plans/reviews but does not execute the PIP pipeline.

### Iteration Policy
1. Draft the readable entry first; add helpers only when necessary.
2. Each change gets one functional check; maximum two targeted corrections per step.
3. Preserve blockers, no expectation weakening; ask for material deviations.

### Blocked-Stop Conditions
Stop affected verification if installed Quarto/private dependencies or safe E:
render paths cannot be established, or after two failed corrections. Keep draft
and FAIL/NOT RUN visible; never call an unrendered document complete. Package
blockers may be rendered honestly without accepting original pipeline gates.

## Minimal First
Smallest complete example; safeguards only for almost-irreversible failures
(irreplaceable work/history/data loss, external wrong numbers, credentials/private
data, production/shared branches). Otherwise park under Later. One functional
check/change; installed tools, dependencies only worth their cost; Plans about two pages.

## Later
B6 diagnosis, broader refresh/M2 certification and later pipeline stages remain
separate work. Do not add dashboards, a registry, a generic runner or more scaffolding.
