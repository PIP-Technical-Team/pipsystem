---
date: 2026-11-03
title: "Concise, prerequisite-first /pip-next decision brief"
status: completed
completed-date: 2026-11-03
execution-report: .cg-docs/work-reports/2026-11-03-pip-next-concise-decision-brief.md
completed-phases: [1]
scope: Standard
brainstorm: null
language: R
estimated-effort: small
deviation-policy: autonomous
artifact-schema-version: 1
revision: 2
phases: 1
tags: [coordination, commands, pipsys, evidence]
---

# Plan: Concise, prerequisite-first /pip-next decision brief

## Objective
Make default chat a roughly 150-250-word development decision brief, allowing material caveats, while retaining the complete saved assessment. Select the earliest unproven prerequisite for the next useful end-to-end result, not the easiest isolated task.

## Context
User approved this completion contract on 2026-11-03; this does not authorize implementation. Task specification: `.cg-docs/orchestration/outputs/pipsystem/pipdata-upstream-review/20261103T152032Z-orchestrator/pip-next-session-prompt.md:9-25`. Current command mandates seven output sections (`tools/pipsys/kilo/commands/pip-next.md:111-154`); the general verbatim-output rule is `ORCHESTRATOR.md:78-87`. Standalone command contracts remain unchanged. Installer copies every source definition into `.kilo/` (`tools/pipsys/pipsys.R:899-919`). Evidence checkout HEAD: `23476ec536457feb41973e262417e8df3010a648`; inspected files include dirty/untracked work, not only committed content. Previous plan is reference only: its observed frontmatter says completed, revision 2, despite the supplied revision-3 description. No matching Brain topic or related brainstorm/solution title was found. No package repository was read.

## Working Principles
Minimal first: smallest working revision; safeguards only against almost-irreversible harm, otherwise Later; one functional check per change; installed tools first, no new dependency; Plan about two pages. Proceed autonomously within approved scope; ask for protected/scope changes or almost-irreversible actions. Preserve all existing dirty work. All writes, child temporary files, caches and logs must resolve to E:. Human times ET; records UTC. Remain on existing main; no Git mutation.

## Requirements
| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Chat names one observable recommended result, why now, owner, actual blocker/decision, supported parallel work and report link, using plain stage names and normal Next/Need from you fields. No default long prompt when this session can continue. | Task specification:13 |
| R2 | Save full SHAs, source citations, task matrices, gate codes, verbatim stdout/stderr and exit statuses, coverage/gaps and useful complete prompts in the report. Surface material failures in chat; never claim an unsaved report exists. | Task specification:11-13,17 |
| R3 | Prefer earliest unproven prerequisite; distinguish code present, worker-reported local checks, producer-consumer integration, real-source validation and deployment. Do not invent missing implementation when upstream is proven. | Task specification:15 |
| R4 | Scope the raw-output exception only to /pip-next, consistently across coordination rules; standalone information commands keep their output behavior. | Task specification:11 |
| R5 | Preserve input-before-shell validation, current-checkout ROOT, registry lookup, fresh original evidence, ref/integration checks, UNKNOWN, supported parallel boundaries, E-only containment and assessment-only limits. | Task specification:17 |
| R6 | Update existing fixtures/tests, exercise behavioral cases, install generated definitions through pipsys and verify parity; distinguish deterministic checks from sampled model behavior. | Task specification:19 |

## Implementation Steps
## Phase 1: Revise, exercise and install
### 1. Revise decision and output contracts
- **Requirements**: R1, R2, R3, R4, R5
- **Files**: `tools/pipsys/kilo/commands/pip-next.md`, `ORCHESTRATOR.md`, pip-orchestrator block of `kilo.json`, coordination sections of `AGENTS.md` and `.cg-docs/orchestration/CONTRACT.md`.
- **Details**: Establish the per-file baseline and overlap before edits, then revise command/rules and coupled tests together. Separate concise chat from complete saved assessment; report-first evidence preservation without suppressing material chat caveats. Explain prerequisite-first ranking generically, without hardcoding today's recommendation. Keep proven independent work parallel or conditional according to actual evidence. Add only the command-specific output exception; do not edit standalone definitions or client settings.
- **Test Scenarios**: ordinary recommendation; waiting/UNKNOWN; information-command failure; no confirmed parallel work; report-save failure.
- **Tests**: coupled contract assertions and sampled frozen output checks from Step 2.
- **Acceptance criteria**: all rule locations agree; complete evidence remains available; chat contains the actionable result and no default raw-output dump.

### 2. Extend and exercise existing cases
- **Requirements**: R1, R2, R3, R4, R5, R6
- **Files**: `tests/pipsys/test-pip-next.R`, `tests/pipsys/fixtures/pip-next-cases.json`; task-owned evidence artifacts. Avoid editing already-dirty `tests/pipsys/test-pipsys.R` and `tools/pipsys/pipsys.R`; run existing tests without replacing their changes.
- **Details**: Update obsolete output expectations, including literal-output-error placement in the saved report. Preserve all existing case IDs. Add downstream-ready/upstream-unproven, mocked transport without real validator success, upstream already proven, concise-chat/complete-report, and unchanged standalone-output checks. Run the exact revised command against frozen evidence using internal general subagents. Give each assessment subagent only the revised command, simulation instructions, arguments, common evidence and case evidence; withhold required/forbidden conclusions and all explanatory answer-key text. The coordinator evaluates the returned output against the withheld oracle afterward and saves outputs, supplied-input records and verdicts. Simulation makes no real assessment/source writes and runs no package code. Assert approximate length only for ordinary valid assessments; material caveats may exceed it. Contract text checks alone are insufficient behavioral evidence.
- **Test Scenarios**: happy path; stale/conflicting evidence; mocks versus integration/live-source claims; upstream proven; invalid input; source error; overlap and unknown ownership.
- **Tests**: pre-install source inspection and frozen behavioral exercises only; save per-case verdicts. Do not run either complete test file, including installed-parity assertions, until installation in Step 3. Use installed R for those post-install checks, with process-local TEMP/TMP/TMPDIR and any cache/log destinations E-contained.
- **Acceptance criteria**: old and new cases are covered; priority, evidence strength and chat/report separation satisfy their oracles without executing recommended work.

### 3. Install, review and verify
- **Requirements**: R4, R5, R6
- **Files**: generated `.kilo/` definitions through installer only; task-owned workflow reports.
- **Details**: After pre-install exercises, check all installer destinations and source/installed differences before its all-definition copy; stop if it would overwrite someone else's installed-only work. Run `tools\pipsys\pipsys.cmd install-kilo`, then `testthat::test_file('tests/pipsys/test-pip-next.R')`, `testthat::test_file('tests/pipsys/test-pipsys.R')` and byte parity checks. Follow `/cg-work review:auto deviate:auto` review routing, resolve every applicable finding including P3, reinstall after source changes, rerun affected checks and finish `/cg-review mode:verify`. Record "source revised and installed; client activation pending reload" unless activation is actually observed: file copying does not prove active instructions. Coordination rules and commands require configuration/window reload or a fresh session (`ORCHESTRATOR.md:222-246`); do not start a session or change client settings to demonstrate activation.
- **Test Scenarios**: successful install; parity mismatch; installed-only overlap; unchanged standalone definitions.
- **Tests**: V1-V5 below; retain executed results and review evidence.
- **Acceptance criteria**: required checks pass before this single phase completes, all findings close, task-owned evidence is durable and unrelated dirty work is preserved. Final status distinguishes source/install verification from observed or pending client activation; reload is a disclosed activation step, not an invented test pass.

## Testing Strategy
Use existing testthat/JSON fixtures, not a framework. Establish per-file baseline and overlap before edits. Distinguish executed deterministic contracts, simulated model assessments and actual package integration; this task proves no live DLW, operational deployment or real pipeline success. After execution approval, check containment before creating the requested unique running/checkpoint/final `pip-handoff-v2` under `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel/handoff.md`; if occupied, use a new UTC run. Include full SHA, Plan revision, approval evidence, Checks run, nonempty Gaps and remaining owner. Plan-only permissions currently prohibit creating that report.

## Documentation Checklist
Command usage/output instructions and all four coordination-rule locations agree. Record test limits, approval gates, excluded dirty paths, source/installed parity and client activation status/required reload in task reports. Do not update unrelated docs/wiki/site files.

## Risks & Mitigations
| Risk | Mitigation |
|------|------------|
| Short output hides uncertainty or command failure. | Keep material caveats in chat and exact failed output/status in report; test failure cases. |
| Reviewed downstream work displaces an unproven upstream connection. | Compare prerequisite evidence strength; test both upstream-unproven and upstream-proven cases. |
| Static assertions are mistaken for model or pipeline proof. | Save sampled behavioral verdicts separately and explicitly limit claims. |
| Installer or edits overwrite concurrent work. | Inspect overlap and all-definition install destinations; preserve conflicting work and stop when inseparable. |

## Out of Scope
Package files/tests, pipeline/live DLW/production access, shared-library installs, roadmap, charter, SYSTEM_DESIGN, site, client/global settings, Git mutation, visible workers/worktrees, unrelated task reports. Later: broader evaluation infrastructure and other reversible robustness work.

## Completion Contract
### Outcome
The revised /pip-next definition is installed and sampled exercises produce the concise decision brief described in R1, rank the earliest unproven prerequisite without confusing evidence strength, and link a complete saved assessment. Standalone information output remains unchanged; activation in the client is explicitly reported as observed or pending reload, never inferred from file parity.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|----|-------------------|------------------|----------|
| V1 | Existing/updated deterministic contracts pass after installation, preserving validation, freshness, containment and assessment-only limits. | Both targeted testthat files named in Step 3; E-contained runtime. | yes |
| V2 | Existing and new priority/evidence cases satisfy conclusions withheld from assessment subagents. | Saved supplied-input records, frozen outputs and coordinator verdicts against the withheld oracle; simulations labeled. | yes |
| V3 | Concise chat and complete saved output separate correctly; material failures remain visible. | Global/scoped frozen output checks, including failed information output and save failure. | yes |
| V4 | Standalone definitions remain unchanged; generated copies match source; installation is distinguished from client activation. | Baseline comparisons, coupled assertions, install-kilo, byte parity checks and explicit observed/pending activation status with reload guidance. | yes |
| V5 | All Plan and implementation findings including P3 are resolved; final verification passes. | Plan-review record, routed review and /cg-review mode:verify evidence. | yes |

### Constraints
| ID | Constraint | Check |
|----|------------|-------|
| C1 | Preserve existing dirty work and other reports. | Recheck status/overlap before edits; compare owned changes with baseline. |
| C2 | Only /pip-next relocates raw information output from chat. | All rule locations and unchanged standalone definitions. |
| C3 | Assessment remains non-executing, evidence-based and checkout-aware. | Existing validation, ROOT, registry, ref, UNKNOWN and containment tests. |
| C4 | Every direct/indirect write remains on E:. | Resolve destinations; set temporary/cache/log paths before processes. |
| C5 | Saving, review and execution approvals remain separate. | Record approvals; no implementation before execution authorization. |

### Boundaries
- Allowed after execution approval: command/rule changes named above, coupled tests/fixtures, generated installer copies and task-owned workflow artifacts.
- Out of scope: every item in Out of Scope; no broadening through autonomous deviation.

### Iteration Policy
1. Contract approval permits saving and validating this Plan only.
2. Review this Plan and resolve all findings including P3 before requesting execution approval; acquire stage-appropriate write authority for review artifacts and revisions.
3. After execution approval, execute the single phase in order with review:auto: baseline, revise command/rules and tests, pre-install exercises, overlap check, install, full tests/parity and review/verification; do not request routine step approvals.
4. Correct failures within scope and rerun affected checks, with two correction rounds per review stage; stop with evidence if required checks/findings remain unresolved.

### Blocked-Stop Conditions
- Unsafe path, conflicting ownership, or required protected/out-of-scope change.
- Required validation, tests, installation parity or durable reporting fails within the correction budget.
- Required review artifacts cannot be saved under that stage's permissions.
- Completion would present simulated/reported checks as actual integration or live-source validation.

## Gaps
Implementation, behavioral exercises, installation and reviews have not run. Existing dirty/untracked content is not fully represented by HEAD. The old Plan revision discrepancy is unresolved and is not execution authority. Actual model compliance remains sampled, not guaranteed.

## Plan Review Revisions
Revision 2 addresses the read-only critique from 2026-11-03: P2.1 uses one phase and moves complete tests/parity after installation; P2.2 withholds the oracle from assessment subagents and records their supplied inputs; P3.1 separates installation from observed client activation and discloses reload requirements. User authorized these Plan edits only; implementation remains unapproved. Original findings are in this session's critique; no separate review report was permitted at that stage.
