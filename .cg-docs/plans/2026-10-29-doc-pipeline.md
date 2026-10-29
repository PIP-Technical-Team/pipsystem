---
date: 2026-10-29
title: "Documentation pipeline: writer, checker, simplifier"
status: completed
completed-date: 2026-10-29
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "autonomous"
artifact-schema-version: 1
plan-revision: "r2"
execution-report: ".cg-docs/work-reports/2026-10-29-doc-pipeline.md"
tags: [documentation, agents, commands, pipsys, citations]
---

# Plan: Documentation pipeline: writer, checker, simplifier

## Objective

`/pip-doc <target.md> <sources...>` produces a cited, checked and plain-language document in pipsystem through fixed steps: a writer drafts it with a file:line citation for every fact, a checker compares every claim with its source, a simplifier shortens the text without changing facts, the checker confirms the meaning was kept, and a script confirms the required headings and the citations. The same structure every time comes from the fixed steps, narrow agents and saved outputs.

Approval: user prompt 2026-10-29T17:19:24Z, step 5 ("Plan B, documentation writer, checker and simplifier"), with the Plan A route; questions only on the Autonomy list. No branch; no roadmap registration. Revision r2 fixes the four `/cg-plan-review` findings (P2.1 citation scope, P2.2 saved baseline for the meaning check, P2.3 fresh-session trial, P2.4 stop rule); record in `.cg-docs/orchestration/outputs/pipsystem/doc-pipeline/20261029T190535Z-plan-b/plan-review.md`.

**Minimal first** (`AGENTS.md`, "Working Principles"): smallest version that works end to end; safeguards only against almost-irreversible failures, other ideas under Later; one check per change shows it works; installed tools only; about two pages.

## Context

- Design proposal: earlier session `ses_e78279414ffeTlRWrKrGY33g1z` (five numbered steps; writer and simplifier share one style source; "reuse `pl-clear-technical-communication` natural prose").
- Style source to reuse, read-only: `E:/PovcalNet/01.personal/wb384996/kilo-config/skills/pl-clear-technical-communication/references/natural-prose.md` (12 lines).
- Agent format: `.kilo/agents/cg-*.md` (YAML `description`, `mode: subagent`); YAML rules in skill `cg-skill-yaml-frontmatter-lint` (quoted description, ASCII only, no BOM).
- `.kilo/` is gitignored (`.gitignore:2`): agent and command text is in this Plan.
- Citation checker to reuse: `check_citations()` in `tools/pipsys/pipsys.R` (Plan C).
- Project rules: no fabrication, every fact file:line or UNKNOWN, Gaps never empty (`AGENTS.md`).

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Three subagents: `pip-doc-writer` (drafts from named sources, cites file:line for every fact, writes UNKNOWN when no source supports a fact, ends with a non-empty Gaps section), `pip-doc-checker` (read-only; returns a fixed table `claim | verdict | evidence` with verdicts `supported`, `unsupported`, `wrong`, `uncited`; mode `facts` or `meaning`), `pip-doc-simplifier` (plain language from the natural-prose reference; may not add, remove or change a fact or citation). | design proposal |
| R2 | `/pip-doc` runs the steps in order: writer; checker (facts); writer fixes, at most two checker rounds; the coordinator saves the checked text as `checked.md` in the run folder; simplifier rewrites the target; checker (meaning) compares `checked.md` with the simplified target in both directions (added, removed or changed facts, qualifications and citations); script check. It saves each checker table and a pip-handoff-v2 report under `.cg-docs/orchestration/outputs/pipsystem/doc-<slug>/<UTC-run-id>/`. If problems remain after the second facts round, or the meaning check finds any change, it stops: no later step runs and the handoff is `blocked`. | design proposal; `AGENTS.md` handoff rule; review P2.2, P2.4 |
| R3 | `pipsys.cmd check-doc <file>` exits 0 only if: the file is inside pipsystem; it has a `## Gaps` section with at least one non-empty line; every local citation is valid. Citation scope convention: a citation `<path>:<N[-M][,...]>` whose first path segment is a package name from `tools/pipsys/packages.csv` other than `pipsystem` (for example `pipdata/R/utils.R:12`) is a package citation, listed as "not checked"; every other citation is local, resolved against the pipsystem root whether or not the file exists, and checked with `check_citations()`. | design proposal step 5; review P2.1 |
| R4 | The target document is inside pipsystem; agents write nothing else except the run folder. | `AGENTS.md` rule 1 |

## Implementation Steps

### 1. check-doc subcommand
- **Requirements**: R3, R4
- **Files**: `tools/pipsys/pipsys.R`, `tests/pipsys/test-pipsys.R`
- **Details**: `extract_citations(lines)` finds `` `path:lines` `` and bare `path:lines` tokens; `check_doc(file, root)` builds a citation table and calls `check_citations()`; fixed report Summary, Problems, Not checked, Gaps; `main()` gains `check-doc`.
- **Test Scenarios**: valid doc passes; missing Gaps; empty Gaps; citation beyond file end; missing local file (`notes/nope.md:1`); package citation (`pipdata/R/utils.R:490-500`) listed as not checked; comma list (`notes/x.md:1,3-4`); file outside pipsystem refused.
- **Tests**: `tests/pipsys/test-pipsys.R`
- **Acceptance criteria**: tests pass; `check-doc` on `notes/pipaux.md` runs and its result is recorded (notes use bare package paths such as `R/utils.R:490-500`, which this convention treats as local, so problems are expected and are not fixed here).

### 2. Agents
- **Requirements**: R1, R4
- **Files**: `.kilo/agents/pip-doc-writer.md`, `.kilo/agents/pip-doc-checker.md`, `.kilo/agents/pip-doc-simplifier.md`
- **Details**: `mode: subagent`; quoted ASCII descriptions. The checker frontmatter sets `permission: { edit: deny, bash: deny }`. Each prompt states its inputs, its single output (file path or returned table), the storage rule (E: only), and the no-fabrication rule. Writer and simplifier read the natural-prose reference.
- **Test Scenarios**: frontmatter parses as YAML; descriptions quoted and ASCII.
- **Tests**: `Rscript --no-init-file -e` YAML parse of the three frontmatters; a fresh-session load is V5.
- **Acceptance criteria**: three files parse; Kilo reports no config validation error when they are written.

### 3. /pip-doc command and trial runs
- **Requirements**: R2
- **Files**: `.kilo/commands/pip-doc.md`; trial output `docs/pipsys-tools.md` and its run folder
- **Details**: the command lists the numbered steps of R2 with the `task` tool calls (subagent names, inputs, output paths) and the stop rule. Trial subject: the pipsys tools, from `tools/pipsys/pipsys.R`, the two Plans and `site/index.md`. Trial 1 (this session): pip-orchestrator follows the command steps and dispatches `general` subagents whose instructions are the exact bodies of the three agent files (tests the prompts and the step logic; the new agents are not registered in a running session). Trial 2 (V5): `/pip-doc` itself in a session started after the files exist, to show registration, named dispatch and the checker's read-only permission. Starting that session needs the user's confirmation (Agent Manager rule), so V5 may stay open.
- **Test Scenarios**: trial 1 completes all five steps; trial 2 records the dispatched agent names and a refused edit by the checker, if attempted.
- **Tests**: `tools\pipsys\pipsys.cmd check-doc docs/pipsys-tools.md`
- **Acceptance criteria**: trial document exists; facts and meaning tables and `checked.md` are saved; final facts table has no `unsupported`, `wrong` or `uncited` row and the meaning table reports no change; `check-doc` exits 0.

## Testing Strategy

Unit tests as in Plan A. End to end: the trial run of step 3.

## Documentation Checklist

- Usage comment in `pipsys.R` lists `check-doc`.
- The trial document is itself the user documentation of the pipsys tools.

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| The checker approves an unsupported claim | It must quote the evidence line for `supported`; `check-doc` catches missing or out-of-range citations. Meaning checks remain judgment (Gaps). |
| The simplifier drops a fact | Meaning-mode checker compares the two versions claim by claim. |
| Agents write outside pipsystem or on C: | Prompts name the only allowed paths; checker cannot edit. |
| Agent and command files are untracked | Text is in this Plan. Later: track `.kilo` files in Git. |

## Out of Scope

Publishing, a style skill of its own, separate OS processes (`kilo run`), documents outside pipsystem, rewriting existing notes.

**Later:** check that a cited line says what the claim says (beyond existence); package-path citations checked at the recorded SHA; a new `pl-` style skill if the natural-prose reference is not enough.

## Completion Contract

### Outcome

`/pip-doc` and three subagents exist; `check-doc` passes its tests; a trial document about the pipsys tools went through all five steps with a saved `checked.md`, a clean facts table and a no-change meaning table, and `check-doc` exits 0 on it; `/pip-doc` itself ran in a session started after the files existed.

Completed 2026-10-29T20:57:28Z. V5 closure: `.cg-docs/orchestration/outputs/pipsystem/doc-pipeline/20261029T205612Z-v5/handoff.md`. Expanded command input and all three named agents observed; checker has no file-write tool exposed, and the requested probe created no file. Fresh `/pip-doc` run: `.cg-docs/orchestration/outputs/pipsystem/doc-handoffs/20261029T204648Z-pip-doc/handoff.md`. Earlier trial exceptions remain recorded in the work report.

### Verification Surface

| ID | Evidence Required | Command/Artifact | Required |
|----|-------------------|------------------|----------|
| V1 | Unit tests pass | `testthat::test_file('tests/pipsys/test-pipsys.R')` | yes |
| V2 | Agent frontmatters parse; quoted ASCII descriptions | YAML parse command | yes |
| V3 | Trial 1: `checked.md`, facts table and meaning table saved; final facts table has no `unsupported`, `wrong`, `uncited`; meaning table reports no change | run folder | yes |
| V4 | `check-doc docs/pipsys-tools.md` exits 0 | `tools\pipsys\pipsys.cmd check-doc docs/pipsys-tools.md` | yes |
| V5 | Trial 2: `/pip-doc` runs in a session started after the files exist; named agents dispatched; checker read-only | that session's handoff | yes |

### Constraints

| ID | Constraint | Check |
|----|------------|-------|
| C1 | No fabrication in the trial document | V3, V4 |
| C2 | Plan A and C behaviour unchanged | V1 |
| C3 | Writes only in pipsystem on E: | `git status`; prompts |

### Boundaries

- Allowed: the files named in the steps and the trial run folder.
- Out of scope: see Out of Scope; protected design, roadmap and charter files; `kilo-config` (read only).

### Iteration Policy

1. Deviation policy `autonomous`: make a justified deviation and record it.
2. Implementation steps: at most two fix attempts per failing step, then record it; only independent steps may continue.
3. Document checking inside `/pip-doc`: a failed first facts round permits only the writer correction and the second facts check. Problems left after the second facts round, or any failed meaning check, block every later step of that run and mark its handoff `blocked`.
4. A failed required V row blocks completion; the Plan ends `blocked` with the open rows named.
5. Fix all review findings P0-P3 within scope; rerun affected checks.

### Blocked-Stop Conditions

- The trial needs a source outside pipsystem that cannot be read.
- Subagents cannot be given the checker's read-only permission.
