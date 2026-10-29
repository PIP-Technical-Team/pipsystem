---
date: 2026-10-29
title: "Pipeline dependency map as data"
status: completed
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "autonomous"
artifact-schema-version: 1
plan-revision: "r2"
execution-report: ".cg-docs/work-reports/2026-10-29-pipeline-dependency-map.md"
tags: [pipeline, dependencies, invalidation, tables, pipsys, site]
---

# Plan: Pipeline dependency map as data

## Objective

Record the PIP pipeline as one data file of claims: its ten stages, the links between them, what each link carries and what change invalidates it. Each claim is one row with its own status and its own file-and-line citation, or says UNKNOWN. A script check proves the file is complete and the citations exist, and the local site and `/pip-status` show the map. This is a first, evidence-only version of the charter deliverable "a dependency graph with an explicit invalidation model" (`compound-gpid.md:18`).

Approval: user prompt 2026-10-29T17:19:24Z, step 5 ("Plan C, pipeline dependency map as a data file"), with the Plan A route (`/cg-plan deviate:auto`, `/cg-plan-review`, fix all findings, `/cg-work review:auto deviate:auto`); questions only on the Autonomy list. No branch; no roadmap registration (a scope change, asked separately). Revision r2 fixes the four `/cg-plan-review` findings (P2.1 per-claim provenance, P2.2 UNKNOWN form, P2.3 stage completeness, P3.1 Mermaid rule); record in `.cg-docs/orchestration/outputs/pipsystem/pipeline-dependency-map/20261029T185255Z-plan-c/plan-review.md`.

**Minimal first** (`AGENTS.md`, "Working Principles"): smallest version that works end to end; safeguards only against almost-irreversible failures, other ideas under Later; one check per change shows it works; installed tools only; about two pages.

## Context

- Stages: `SYSTEM_DESIGN.md:145-156` (ten stages, owner, output), stage rules `:158-182`, dependency and rebuild rules `:184-205`.
- Harvested code facts with package SHAs: `notes/*.md` (for example `notes/pipaux.md:42-55`, `notes/pipdata.md:34-54`, `notes/pipster_wbpip.md:19-25`, `notes/pipapi.md:28-60`). Target and current state can differ (for example `notes/pipdata.md:71`, current welfare column names), so each claim keeps its own status.
- Existing table convention: `tables/stamp_fit.csv` (`evidence_file`, `evidence_line`, `notes`).
- No pipeline map data file exists yet (read-only search, 2026-10-29).
- The M2 Plan (`.cg-docs/plans/2026-10-10-m2-walking-skeleton.md`, active) has E1-E11 contracts marked PROPOSED (`:154`). This map does not adopt, change or replace them.
- `pipsys` (Plan A) builds the site and the status report: `tools/pipsys/pipsys.R`.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | One file, `tables/pipeline_map.csv`, one claim per row: `kind` (`stage` or `edge`), `id` (stage `1`-`10`, edge `3->4`), `field`, `value`, `status`, `evidence_file`, `evidence_line`, `notes`. Stage fields: `name`, `owner`, `outputs`, `inputs`, `entry_point`. Edge fields: `carries`, `granularity`, `invalidated_by`. A second citation for the same claim is a second row. | user request; review P2.1 |
| R2 | `status` is `decided` (a Decided line in `SYSTEM_DESIGN.md`), `harvested` (a note line that cites package code with a SHA), `open` (an Open line), or `unknown`. `unknown` rows have `value` UNKNOWN and empty `evidence_file` and `evidence_line`; every other row has both. No inferred claims. | `AGENTS.md` "No fabrication"; P2.2 |
| R3 | `pipsys.cmd check-map` exits 0 only if: required columns exist; `kind`, `field` and `status` values are allowed; stage ids are exactly 1-10, each with exactly one distinct `name` value (several rows citing the same name are allowed; two different names fail); edge ends are stages 1-10; every edge has a `carries` row; the R2 citation rule holds; each `evidence_file` exists in pipsystem and each `evidence_line` (`N`, `N-M`, comma-separated) is within the file. It prints Summary, Problems and Gaps. | Minimal first rule 3; P2.3 |
| R4 | The site has a "Pipeline map" page: a Mermaid flowchart of the edges (label = first `carries` value, cut to 40 characters) and the claims table. `/pip-status <package>` gains a "Pipeline stages" section listing the stages whose `owner` claim names the package. | user request; P3.1 |
| R5 | No change to `SYSTEM_DESIGN.md`, the M2 Plan, `roadmap.json` or package repositories. Evidence found for an Open item is listed in the work report as a proposal. | `AGENTS.md` rules |

## Implementation Steps

### 1. Fill the map
- **Requirements**: R1, R2, R5
- **Files**: `tables/pipeline_map.csv`
- **Details**: Read `SYSTEM_DESIGN.md` sections 5-7 and the notes. Stage `name`, `owner`, `outputs` come from `:145-156` (`decided`). `inputs` and `entry_point` come from notes (`harvested`) or are `unknown`. Edges only where a line states or a note shows the link (for example stage 3 to 4, `notes/pipdata.md:34-54`; stage 8 holds outputs of stages 1, 5, 6, `SYSTEM_DESIGN.md:178`). `invalidated_by` cites section 6 (`:186-203`); row-level invalidation is `open` (`:194-199`). Packages are not read; the notes carry the SHAs.
- **Test Scenarios**: covered by step 2.
- **Tests**: `tools\pipsys\pipsys.cmd check-map` on the real file.
- **Acceptance criteria**: `check-map` exits 0; ten stages; every edge has `carries`.

### 2. check-map subcommand
- **Requirements**: R2, R3
- **Files**: `tools/pipsys/pipsys.R`, `tests/pipsys/test-pipsys.R`
- **Details**: `check_citations(dt, root)` (reusable by Plan B) and `check_map(root)`; `main()` gains `check-map`; exit 1 when a problem exists.
- **Test Scenarios**: a valid fixture with one `unknown` row passes; each of these fails and names the row: missing column, bad `status`, two different names for one stage, missing stage, edge to stage 11, edge without `carries`, `unknown` row with a citation, known row without a citation, missing file, line beyond the file end, malformed line range.
- **Tests**: `tests/pipsys/test-pipsys.R`
- **Acceptance criteria**: tests pass; `check-map` on the real file exits 0.

### 3. Site page and status section
- **Requirements**: R4
- **Files**: `tools/pipsys/pipsys.R`, `site/index.md`, `tests/pipsys/test-pipsys.R`, `.kilo/commands/pip-status.md` (description only)
- **Details**: `gen/map.md` with a ```` ```{mermaid} ```` block (`flowchart LR`, `S3 -->|"clean welfare"| S4`) and the claims table. Status sections become Repository, Pipeline stages, Plans, Handoffs, Gaps; "none" when the package owns no stage.
- **Test Scenarios**: Mermaid text for a two-edge fixture; status section order; a package with no stage.
- **Tests**: `tests/pipsys/test-pipsys.R`; `tools\pipsys\pipsys.cmd site`
- **Acceptance criteria**: site renders with exit 0; `site/_site/gen/map.html` contains a `mermaid` diagram element with the edge text and loads Quarto's Mermaid script. If Mermaid does not render, the step is not done.

## Testing Strategy

Unit tests as in Plan A (`Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"`, temp folders under `.tmp/pipsys`). End to end: `check-map`, `status pipdata`, `site`.

## Documentation Checklist

- Usage comment in `pipsys.R` lists `check-map`.
- The map page explains the columns, the four statuses, and "evidence-only, not a contract".

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| A row states an inferred link as fact | R2 statuses; `unknown` when no line supports it; review by `cg-data-quality`. |
| The map is read as an approved contract | Map page and Gaps say "evidence-only; M2 contracts stay PROPOSED". |
| Line numbers drift when cited files change | `check-map` catches lines beyond the file end; content drift is Later. |

## Out of Scope

Artifact-level graph (per survey or estimate), executable planner logic, changes to stamp or packages, adoption of M2 contracts, row-level invalidation design, roadmap registration.

**Later:** check that the cited line still says what the claim says; per-estimate edges (roadmap M3 "Per estimate dependencies"); entry points read from package source with SHAs.

## Completion Contract

### Outcome

`tables/pipeline_map.csv` holds the ten stages and their links, one cited or UNKNOWN claim per row; `check-map` exits 0 on it; tests pass; the site map page shows a Mermaid flowchart and the table; `/pip-status` shows "Pipeline stages".

### Verification Surface

| ID | Evidence Required | Command/Artifact | Required |
|----|-------------------|------------------|----------|
| V1 | Unit tests pass, including the failing fixtures of step 2 | `testthat::test_file('tests/pipsys/test-pipsys.R')` | yes |
| V2 | `check-map` exits 0 on the real file; Summary shows 10 stages and the edge count | `tools\pipsys\pipsys.cmd check-map` | yes |
| V3 | Site renders exit 0; `site/_site/gen/map.html` has a `mermaid` element with edge text and Quarto's Mermaid script | `tools\pipsys\pipsys.cmd site` | yes |
| V4 | `status pipdata` shows "Pipeline stages" with the stages whose `owner` claim is pipdata | `tools\pipsys\pipsys.cmd status pipdata` | yes |
| V5 | No change to `SYSTEM_DESIGN.md`, the M2 Plan, `roadmap.json`, package repositories | `git status --short`; package porcelain counts | yes |

### Constraints

| ID | Constraint | Check |
|----|------------|-------|
| C1 | No fabrication: every non-UNKNOWN claim cites a line | V2; data-quality review |
| C2 | Plan A behaviour unchanged except the new status section | V1 |
| C3 | All writes on E: inside pipsystem | Plan A checks still pass |

### Boundaries

- Allowed: the files named in the steps.
- Out of scope: see Out of Scope; protected design, roadmap, charter and M2 Plan files.

### Iteration Policy

1. Deviation policy `autonomous`: make a justified deviation and record it.
2. At most two fix attempts per failing step, then record and continue.
3. Fix all review findings P0-P3 within scope; rerun affected checks.

### Blocked-Stop Conditions

- Most claims would be UNKNOWN without reading package repositories.
- The work needs a change to a Decided item or the M2 Plan.
