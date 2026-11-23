---
date: 2026-11-16
title: "Qmd working-release initialization with 2021 PPP"
revision: 2
status: completed
completed-date: 2026-11-16
execution-report: .cg-docs/work-reports/2026-11-16-qmd-working-release-initialization.md
scope: Lightweight
brainstorm: null
language: R
estimated-effort: medium
deviation-policy: autonomous
artifact-schema-version: 1
tags: [qmd, working-release, ppp-2021, sandbox]
---

# Plan: Qmd working-release initialization with 2021 PPP

## Objective
Add the next manual real-data Qmd cell and prove public initialization/readback
in an E:-only sandbox with real release metadata. Do not initialize the share.

## Context
The user approved this slice and required GitHub release/PPP metadata reads on
2026-11-16. Fixed: release `20260401`, identity `TEST`, PPP `2021` for all future
development tests; shared main `//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2`;
survey `COL_2010_GEIH_V04_M_V01_A_GMD_GPWG`, PIP ID `COL_2010_GEIH_INC_GPWG`.
Existing main checkout: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`.
No branch/worktree/Git changes. This follows the completed manual-context Plan;
do not reopen its broad reviews or overwrite mixed-owned untracked work.

Evidence: pipfun `7d534516a8c17c33d537681610eccd4c29211762`, stamp
`95890411e8bf9db842593c2b0ab68ec4f2a66b25`; recorded source traces in
`.cg-docs/orchestration/outputs/pipsystem/qmd-working-release/20261116T211207Z-inspection/handoff.md`.
`setup_working_release()` reads authenticated metadata and creates directories.
`pip_create_globals()` also creates a legacy output directory outside main_dir
even with create_dir FALSE. Aliases are in memory, not a disk registry.

## Working Principles
Minimal first: smallest complete slice; safeguards only for almost-irreversible
loss, wrong published numbers, private-data exposure or production/shared-branch
harm (otherwise Later); one functional check per change; installed tools and
worthwhile dependencies only; Plan about two pages. Ask only for those harms,
protected/Decided or charter/roadmap scope changes, Git mutations or non-generated
deletion. Proceed with reversible in-scope fixes and reviews without phase questions.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | PPP 2021 explicit in real context, real setup, synthetic setup and returned-year checks | User's standing test setting |
| R2 | Visible public initializer and working-release/folder/alias readbacks; real errors FAIL, dependents NOT RUN | Approved slice; canonical Qmd rules |
| R3 | Prove actual initialization with real metadata, first on a fresh E: store and then in a fresh R process on that existing store | Shared target already exists; aliases are session-local |
| R4 | No shared/C: writes, household data, installs, package/pin/Git changes or hidden mock release acceptance | Approved boundaries and storage rule |
| R5 | Preserve other numerical, exact-version and invalid/no-output assertions; manual cells remain skipped by synthetic render | Prior Qmd requirements |

## Implementation Steps
### 1. Add the manual cell and focused source checks
- **Requirements**: R1, R2, R4, R5
- **Files**: `experiments/pip-pipeline.qmd`, `experiments/one-survey/check-qmd.R`
- **Details**: Snapshot the current untracked sources. Add ppp 2021 to the real
  context/oracle; pass/assert 2021 in the existing synthetic release-setup cell.
  Add `real-working-release` with `eval: false`, using public
  `pipfun::setup_working_release()`, `get_wrk_release()`, `get_pip_folders()`,
  `get_pip_aliases()` and stamp alias readback. Pass release, identity, ppp and
  main_dir explicitly; also pass root_dir/out_dir derived from the selected
  main directory's parent so the legacy output destination is visible.
  Check returned and active release values, folders and registered aliases;
  print PASS only after checks, and record actual package errors as FAIL.
- **Test Scenarios**: Missing new cell fails before implementation; source
  oracles require 2021 and manual skip. Make the focused checker truly offline:
  its isolated context-cell success and failure environments supply deterministic
  dir.exists replies (TRUE/FALSE). Retain exact context/path assertions and label
  these source/control-flow checks, never current shared-folder acceptance.
  The checker must not probe the UNC share, start initialization or use GitHub.
- **Tests**: Focused checker, R chunk parsing, current-worktree source comparison
- **Acceptance criteria**: Source checks pass; only the named context/setup
  changes, deterministic checker replies/labels and new cell are permitted.
  Other original numerical, fixture and instruction assertions remain intact.

### 2. Execute sandbox initialization and finish review
- **Requirements**: R1, R2, R3, R4, R5
- **Files**: task-local test harness/logs in `.tmp/qmd-working-release/`; normal
  Plan, review, work-report and handoff artifacts
- **Details**: Code mode executes the exact extracted cell in fresh R children,
  without fixture transport, patched package functions or seeded release rows.
  Retain release/identity/PPP/survey values; replace only the test context's roots
  with a fresh E: sandbox. Never run the shared-target cell or full Qmd renderer.
  Before loading namespaces, redirect temp/home/cache/log/output paths into the
  E: checkout; disable automatic pipfun logging. Set BOTH PIP_ROOT_DIR/legacy
  output roots and main_dir on E:. Root overrides alone are not containment.
  Reuse installed R 4.5.2 and the checked contributed library/receipts under
  `.tmp/one-survey/qmd-acceptance-20261113/`; re-verify actual pipfun/stamp
  namespace origins against the recorded SHAs. Version 1.0.1 alone is not proof.
- **Test Scenarios**: Initial setup on fresh sandbox; repeat in a new R process
  using the same existing directories, with no inherited aliases/state. Use
  required GitHub metadata through existing credentials read-only; do not create,
  replace or print credentials. Record actual failures; do not manufacture rows,
  mock metadata or replace actual public calls to earn initialization PASS.
- **Tests**: Exact cell execution plus public readback assertions in both processes;
  focused checker and source preservation comparison; scoped review and verify
- **Acceptance criteria**: Selected release/TEST/2021 confirmed from returned and
  active state. All nine named folder aliases resolve via `stamp::st_alias_get()`
  to the expected folder roots, with required stamp directories under E:. Allow
  unrelated existing aliases; do not require an undocumented default-alias state.

## Testing Strategy
Use the existing checker for deterministic offline source/negative-reporting
tests only; its directory replies are test doubles, not actual access evidence.
Keep live metadata initialization in a separate disposable harness and fresh R
processes, with no directory, metadata or package-function substitution there.
No package installation, ambient contributed-library fallback or load_all().
Preserve previous runtimes/evidence. Sandbox PASS is NOT shared-store acceptance.

## Documentation Checklist
Qmd shows public calls, ownership, actual PASS/FAIL/NOT RUN and sandbox limits.
Preserve comments, spacing, ~80-column R and legible native pipes where useful.
Record package SHAs, loaded paths, requested targets, actual messages, environment
and outputs. Save pip-handoff-v2 at the assigned Code execution path.

## Risks & Mitigations
| Risk | Minimal response |
|---|---|
| Legacy output or startup/cache writes escape main_dir | E:-contained root_dir/out_dir plus all process-local redirects before namespace loads |
| Same package version labels hide different builds | Re-verify existing private receipts and actual loaded paths; stop if unverifiable |
| Missing credentials/metadata or package failure | Actual FAIL, later checks NOT RUN; no credential changes, mocks or acceptance waiver |

## Out of Scope
Shared initialization/writes; household download/processing; auxiliary producers;
B6; installations; package/pin/design/roadmap/instruction changes; Git mutations.

## Completion Contract
### Outcome
Manual Qmd initialization and explicit 2021 settings are implemented; genuine
public initialization/readback passed only in the E: sandbox, including a fresh
process using existing directories. The shared release remains NOT RUN.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Deterministic offline red/green source checks; chunks parse; PPP/manual skip oracles; no UNC probe | Focused checker and logs | yes |
| V2 | Re-verified installed provenance; actual metadata lookup and sanitized failure evidence if blocked | Runtime/receipt record; live harness log | yes |
| V3 | Exact public cell succeeds on fresh and existing E: stores in separate R processes; release/PPP/folder/alias readbacks correct | Two execution logs and assertions | yes |
| V4 | Other numerical/exact-version/invalid assertions preserved; offline checker stays offline | Baseline comparison, focused checker | yes |
| V5 | Plan critique resolved; scoped implementation review and final verification converge | Plan/code/verify reports | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | Source limited to Qmd/checker plus task-local harness/artifacts | Task baseline and owned diff |
| C2 | All direct/indirect writes on E:, no shared/credential/package/Git changes | Resolve paths; redirects; commands and actual folder/alias roots |
| C3 | Real metadata and public calls earn PASS; no substitute acceptance | Fresh-child execution; no fixture transport or namespace patching |

### Boundaries
Existing main checkout only. Preserve mixed-owned `current.json`; use a named
active-state snapshot. No roadmap registration/scope changes. Recommended review
route: data-risk (reproducible live setup and PPP checks), scoped to this delta:
cg-code-quality, cg-testing, cg-documentation, cg-version-control,
cg-reproducibility, cg-performance, cg-architecture, cg-data-quality. Final light
verification uses cg-code-quality/cg-testing; suppress nothing without fixed IDs.

### Iteration Policy
Two targeted corrections per failed required check; fix all supported in-scope
P0-P3 findings, rerun affected checks and finish verification. Reversible
deviations inside this slice proceed autonomously; do not ask at phase boundaries.

### Blocked-Stop Conditions
Stop with actual FAIL/NOT RUN evidence if budget is exhausted, provenance or E:
containment cannot be established, credentials/metadata are unavailable, or a
package change, installation, new approval or shared write is needed. Never
weaken checks or infer real-survey acceptance from setup success.

## Later
Deliberate user-run shared initialization and real auxiliary/survey steps follow
only after sandbox evidence and the next user-led execution decision.
