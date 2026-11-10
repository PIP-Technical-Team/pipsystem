---
date: 2026-11-09
title: "One-survey harness repair and package diagnosis"
status: completed
completed-date: 2026-11-10
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "autonomous"
artifact-schema-version: 1
execution-report: .cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md
failing-steps: []
tags: [integration, isolation, diagnosis]
---

# Plan: One-survey harness repair and package diagnosis

## Objective
Repair the seven open harness findings and produce an owner-actionable diagnosis of the preserved pipaux installation failure, without changing package repositories. Completing this follow-up does not complete the original survey Plan.

## Context
User approved this contract and fresh budget for saving/review, not execution. Stay in existing `main` at `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`; preserve changes; no branch/worktree or Git mutations.

Prior Plan: `.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md`. Seven open findings: corresponding `-review.md:26-45` under `.cg-docs/reviews/`. Failure: `.tmp/one-survey/logs/install-pipaux.log:7-11`. Corresponding Work Report records all seven full SHAs; archive pins/install exits are not runtime provenance.

Exact Git-object inspection: pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, `R/zzz.R:1`, calls globals at installation; pipfun `0c6a78d9884ed0965a524311537eec2a5095d60b`, `R/pip_create_globals.R:14-17,33-38,228-238`, documents nonexistent-path returns but lists an absent cache for vintage=NULL. Reduced reproduction remains unexecuted. Original V1/V5 failed; V2-V4 not run.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | Pre-write E-checkout confinement and restored caller environment | P1.1, P2.4; mandatory storage rule |
| R2 | Actual installation-child library isolation and fresh exact-snapshot provenance | P1.2, P1.3 |
| R3 | Behavioral baseline, real failure controls and current-install provenance | P2.1-P2.3 |
| R4 | Minimal package diagnosis, full review and honest original-Plan status | Approved follow-up contract |

## Implementation Steps
### 1. Repair and verify the harness
- **Requirements**: R1, R2, R3
- **Files**: `experiments/one-survey/run.ps1`, `setup.R`; small test/child-bootstrap helper only if needed; fresh `.tmp/one-survey/<new-run-id>/`.
- **Details**: Use a new empty attempt directory and dedicated library; reject populated/redirected destinations before any write, including logs and recursive targets. Restore prior/unset caller environment in finally. Inspect hooks and set E-only temp/home/R/cache/log roots before children. Reuse the original seven full SHAs and record copied dependency versions/origins; no downloads, moving refs or load_all. Establish library restrictions inside actual installation processes before dependency resolution, not parent .Library alone; retain child library/namespace paths. Bind successful-install receipts, pins and exact loaded paths to current inventory. Partial inventory is not success.
- **Tests**: Behavioral checks first; record failing baseline. Exercise actual pre-write rejection with E-only redirected targets, actual declared missing dependencies without fallback, stale/nonempty destinations, stale/incomplete inventory, and environment restoration after successful/failed children. Install/load one clean pinned package through the actual restricted child with recorded dependency paths; no full ecosystem installation required. Use installed tools/direct assertions. Pester, if chosen, requires its safety skill and canonical runner through an available authorized execution tool.
- **Acceptance**: Every R1-R3 check passes with saved evidence, each of the seven findings has a specific regression check, and no reported provenance or isolation success depends only on inventory existence or Version strings.

### 2. Diagnose the package boundary and review
- **Requirements**: R4
- **Files**: Minimal diagnostic script under `experiments/one-survey/` if needed; new runtime logs; follow-up Work/Review Reports and requested existing `20261109T210857Z-code/handoff.md`.
- **Details**: After step 1 passes, use clean isolated installed pipfun and recorded dependencies for the smallest fresh-root diagnostic. Inspect hooks first; record call, arguments, source/installed provenance, diagnostic and downstream state. Do not patch packages/namespaces, precreate the missing cache, supply fake vintages or evade the boundary. Separate source-supported from runtime-confirmed cause; propose owner direction. Reproduced error is diagnostic evidence, NOT original V1 or survey rejection. If not reproduced, retain/explain the mismatch rather than forcing an error.
- **Tests**: Save diagnostic/limits and original unexecuted status. Run all ten full-review roles, correct applicable P0-P3 within budget, rerun affected checks and finish light `/cg-review mode:verify`.
- **Acceptance criteria**: Verify all seven harness findings fixed. Required unavailable checks/review or unresolved findings block. Retain original failed evidence.

## Testing Strategy
One functional check per demonstrated boundary; no new framework/matrix. Assess paths/hooks before processes; no completion from static inspection alone. Canonical Markdown governs. Report unavailable tools; never bypass Pester safety.

## Documentation Checklist
Record pins/dependencies, child paths, receipts, finding-to-check mapping, diagnosis, correction counts and nonempty Gaps. Create follow-up Work Report before execution; update it, active-state and requested existing handoff at checkpoints/exit. Preserve prior evidence; reviewer attempts use distinct run folders.

## Risks & Mitigations
| Risk | Response |
|---|---|
| R installer cannot enforce restricted child lookup with installed tools | Stop before claiming isolation; no shared R edits or ambient fallback |
| Old runtime links/source contents affect a new attempt | Fresh destinations and actual pre-write rejection; preserve old evidence |
| Diagnostic requires package changes or is confused with original success | Read-only owner diagnosis; keep original evidence gates failed |

## Out of Scope
Package edits, new pins/downloads, production/shared state, charter/roadmap/design changes, commits/pushes/merges, original survey scenario execution, live DLW, deflation, mean, incremental certification and historical selection after a later save.

## Completion Contract
### Outcome
The seven harness findings are verified fixed in a fresh isolated attempt, and the pipaux/pipfun boundary has an owner-actionable diagnosis. The original survey Plan remains blocked pending its own separately approved resumption and evidence.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Pre-write redirected-target rejection and caller restoration on success/failure | Executed harness checks and logs | yes |
| V2 | Actual installer-child paths, missing declared dependency failure, one usable exact-snapshot package | Child/install/load evidence | yes |
| V3 | Fresh-source/reuse checks, current-install receipts, behavioral baseline and stale-inventory rejection | Finding-to-check evidence table | yes |
| V4 | Minimal isolated diagnostic result, SHA-linked owner direction and original-Plan limits | Diagnostic log and Work Report | yes |
| V5 | Seven findings verified fixed, full route, affected reruns and final light verification | Full and Verify Review Reports | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | All direct/indirect writes resolve inside pipsystem on E:; no old evidence overwritten | Pre-write checks, child environment and fresh paths |
| C2 | Same recorded source SHAs; one dedicated library; no ambient contributed fallback/downloads | Current inventory, receipts, actual child paths |
| C3 | No package/shared/protected/Git changes or original completion claim | Status, source and report checks |

### Boundaries
- Allowed: bounded harness repairs/tests, new isolated runtime, read-only package diagnosis and required reports.
- Excluded: all Out of Scope actions. A diagnostic error is not an accepted exception to the original contract.

### Iteration Policy
1. Execute these two steps sequentially only after separate execution approval; no routine step confirmation. Autonomous deviations stay within boundaries and are recorded.
2. Fresh budget: at most two targeted correction attempts per step, including review-driven functional corrections. Record the first package diagnostic result; never silently reset the budget.
3. Minimal first: smallest complete harness/diagnosis, one functional check per change, installed tools; add dependencies only when they save more work than they cost. Safeguards only for almost-irreversible harm. Keep this Plan about two pages; defer unrelated ideas.

### Blocked-Stop Conditions
- Unresolved/unsafe output paths or inability to establish actual installation-child isolation.
- Package changes, additional scope/approval or unavailable required tools/review are needed.
- Required checks/findings remain unresolved after the per-step correction budget, or required reports cannot be saved.

## Gaps
The repair mechanism and install-child path evidence have not been implemented or executed. The reduced package call is still unexecuted; source evidence does not certify runtime cause. This saved contract is approved for review only, not execution, package repair or original-Plan completion.
