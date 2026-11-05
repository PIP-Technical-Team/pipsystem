---
date: 2026-11-02
title: "Make the review site show current focus, next actions, and task context"
status: completed
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: autonomous
artifact-schema-version: 1
plan-revision: r2
execution-report: .cg-docs/work-reports/2026-11-02-site-focus-and-navigation.md
completed-phases: [1, 2]
phases: 2
tags: [pipsys, website, focus, roadmap, filters]
---

# Plan: Site focus and navigation

## Objective

Put current focus and recorded next actions first. Explain milestones, package roles, and tasks, and make the main site tables searchable and filterable. The user approved this completion contract, a follow-up to the completed site-modernization Plan, and full execution with review on 2026-11-02. Stay on `main`; no commits or roadmap registration.

**Minimal first:** smallest end-to-end version; safeguards only for almost-irreversible data/work/history loss, wrong numbers published, private data exposure, or production/shared-branch changes. Defer reversible hardening to Later. One working check per change; reuse installed tools; keep this Plan about two pages.

## Context

- Baseline `main` SHA: `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`. Preserve all pre-existing dirty paths; inspect status before editing. Only pipsystem is writable.
- `tools/pipsys/pipsys.R:1106-1281,1424-1476` generates summary pages, but omits focus and milestone objectives; chart filtering does not filter tables. `site/index.md:5-49` is navigation only.
- `roadmap.json` owns feature IDs/titles/status/Plan links and milestone objectives. `SYSTEM_DESIGN.md:284-309` owns target package roles; `compound-gpid.md:35-40` holds recorded focus. Old strategy descriptions conflict with later decisions (`SYSTEM_DESIGN.md:355-357`); never copy them uncritically.
- Reuse recorded `/pip-next` assessment sections, not its execution logic (`tools/pipsys/kilo/commands/pip-next.md:111-153`). Assessment completion is not implementation completion. No readiness inference from roadmap flags.
- Brain query selected the prior modernization Plan; its execution report `2026-10-30-modernize-quarto-site.md:42` records the actual classic-script/inline-data solution for local file viewing. Do not restore `{ojs}` modules.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Homepage and overview lead with charter focus and the latest completed global next-action assessment, clearly separated, dated, linked, and labeled recorded/not reassessed. Show recommendation, blockers, parallel options, and action owner where recorded; absent values are explicit. | User feedback; approved contract |
| R2 | Show every milestone's objective/status/progress in source order and all target package roles/boundaries, including pipsystem, Open wbpip, and out-of-scope piptm. | roadmap.json; SYSTEM_DESIGN.md section 10; charter |
| R3 | Every existing feature has a concise purpose, expected result, involved packages, and cited source; use feature IDs to join a small companion CSV without duplicating status, scope, or priorities. | User feedback; approved contract |
| R4 | Main roadmap, overview, handoff, map, and package-status tables offer text search and relevant status/milestone/package filters, reset, result counts, and consistent text-labeled status colors in both themes. Filters combine and handle multi-package tasks. | User feedback; approved contract |
| R5 | New controls work offline over file:// without external libraries; full static data remains readable without JS. Preserve CLI output, factual caveats, sources, time zones, and generated boundaries. | Existing site contract; prior implementation lesson |

## Phase 1: Decision-focused content

### 1. Surface focus, next actions, milestones, and roles
- **Requirements**: R1, R2, R5
- **Files**: `tools/pipsys/pipsys.R`, `site/index.md`, `site/_quarto.yml`, `tests/pipsys/test-pipsys.R`.
- Generate a reusable focus fragment for inclusion on the homepage and overview. Copy the charter's Current Focus section with source context, not an inferred live state. Read only `outputs/pipsystem/pip-next-global/*/handoff.md` for global advice. Select the latest completed assessment with a parseable updated time, then run-ID tie-break; running/partial or undated reports are never advice. List invalid dates in Gaps; if none qualify, use missing-advice fallback. Display named recommendation/blocker/parallel sections when present; otherwise labeled Summary/next fallback and source link. Preserve full next-action text for this site path; do not change the CLI's truncated schema. Do not label the assessment author as the action owner. Show assessment time separately from build time and always state no reassessment occurred. Missing advice says to run `/pip-next`; missing focus/roles produce an explicit gap, not a guessed recommendation.
- Expose milestone IDs/objectives with existing counters in a site-only projection, preserving CLI schemas. Surface the canonical package-responsibility table, plus pipsystem's coordination role from the charter, with source links and target/not implementation labels.
- **Tests**: `tests/pipsys/test-pipsys.R`.
- **Acceptance criteria**: fixtures cover completed versus newer running assessment, missing assessment/sections, full next text, source links and separate timestamps; milestone objectives remain ordered; package labels preserve Open/out-of-scope; CLI formatting is unchanged.

### 2. Explain tasks without creating another roadmap
- **Requirements**: R3, R5
- **Files**: `tables/site_task_context.csv`, `tools/pipsys/pipsys.R`, `tests/pipsys/test-pipsys.R`.
- Add presentation-only columns `feature_id,purpose,expected_result,packages,evidence_file,evidence_line`. Populate all existing feature IDs from current design, HARVEST_BRIEF, linked Plans, and policy-compatible strategy text. Distinguish intended results from delivered results, and target packages from assigned owners. Open mechanisms stay Open. Show existing IDs/titles/status/Plans with these descriptions; link evidence and generated Plan copies where available. New/missing context stays UNKNOWN and is listed in Gaps; never hide the feature or invent its scope.
- **Tests**: `tests/pipsys/test-pipsys.R`.
- **Acceptance criteria**: every current feature has one informative context row and an existing source/line range; missing future context remains visible as UNKNOWN; packages are filterable individually; descriptions do not revive rejected module-free IDs, mandatory long tables, or pipsystem runtime orchestration.

## Phase 2: Table usability and end-to-end checks

### 3. Add local filters and accessible status styling
- **Requirements**: R4, R5
- **Files**: `site/assets/table-tools.js`, `site/assets/aos-body.html`, `site/custom.scss`, `tools/pipsys/pipsys.R`, `tests/pipsys/test-pipsys.R`, browser fixture under `tests/pipsys/` if needed.
- Use a small classic script and explicit generated-table wrappers so copied design/Plan tables are not indiscriminately enhanced. Discover relevant filter values from actual table rows, not a fixed status list. Match text plus all selected dimensions; split semicolon-separated packages for exact package matching. Include labels, reset, visible/total counts and an empty-result message; preserve complete static tables when JS is disabled. No table runtime depends on Plot/AOS or CDN availability.
- Reuse existing roadmap colors: green done, blue active/in-progress, amber planned, gray idea/unknown; add red blocked/failed where actually recorded. Keep status text/legend and distinguish handoff completion from roadmap completion. Use theme-aware badges, not color alone.
- **Tests**: installed-browser fixture and `tests/pipsys/test-pipsys.R`.
- **Acceptance criteria**: real browser executes multi-filter intersection, text matching, multi-package selection, reset, zero-result case and two-table isolation; plain tables remain complete with JS disabled; light/dark labels remain legible.

### 4. Render, review, and close
- **Requirements**: R1, R2, R3, R4, R5
- **Files**: same implementation files; this Plan; execution/review reports and handoff.
- **Tests**: testthat, `tools\pipsys\pipsys.cmd site`, and browser fixture.
- Run testthat, actual Quarto site generation, and installed Chrome headless checks. Before launch verify resolved E: `.tmp/pipsys/browser` parents; set TEMP/TMP/TMPDIR, LOCALAPPDATA and APPDATA beneath it and CHROME_LOG_FILE to its log path. Use `--headless=new --no-first-run --no-default-browser-check --disable-background-networking --disable-component-update --disable-sync --disable-breakpad --disable-crash-reporter --disable-logging`, plus explicit E: `--user-data-dir`, `--disk-cache-dir`, `--crash-dumps-dir`; retain file:// fixture output. No new dependency. Confirm homepage includes generated focus, source links resolve, milestone/task/role sections appear, controls work over file://, and CLI report schemas remain unchanged. Review using `review:auto`; fix all applicable P0-P3 findings, rerun affected checks, finish with `/cg-review mode:verify`.
- **Restart-record exception (P1.1):** preserve the dirty `.cg-docs/active-state/current.json`. Save a compact contract-shaped `active-state.json` in this task's assigned orchestration run instead, including the exact resume command. Record that default shared-pointer discovery is not updated; resume by the Plan path in the execution report/handoff.

## Testing Strategy

Use process-local TEMP/TMP/TMPDIR on resolved E: `.tmp/pipsys`; retain existing Quarto redirects. Commands: `Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"`; `tools\pipsys\pipsys.cmd site` (600000 ms timeout). Save browser evidence under E: `.tmp/pipsys`.

## Documentation Checklist

Document sources/as-of limits, UNKNOWNs, filter semantics, and nonempty Gaps in generated pages; do not alter dirty unrelated docs.

## Risks & Mitigations

| Risk | Minimal response |
|------|------------------|
| Old advice looks newly verified | Show original assessment time, source and no-reassessment label; exclude incomplete advice. |
| Historical prose contradicts approved policy | Cite current design first; keep Open mechanisms unselected; review description content. |
| Filters fail locally or conceal evidence | Classic local script, explicit wrappers, static fallback, actual browser interaction check. |
| Concurrent edits overlap | Read Git state/diffs before each edit; preserve dirty paths and report unresolved overlap. |

## Out of Scope

No pipeline/package execution, package edits, new roadmap tasks/status changes, design/charter edits, automatic assessment/scheduling, new framework/dependency, public deployment, caching framework, saved filter preferences, or broad validation framework.

## Completion Contract

### Outcome

The locally rendered homepage answers where to focus using dated recorded evidence, explains the complete milestone/package structure, and links to described tasks with usable offline table filters and status labels.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|----|-------|-------------------|------------------|----------|
| V1 | 1 | Content/selection/UNKNOWN/source/CLI tests pass; every existing feature has cited descriptive context | `tests/pipsys/test-pipsys.R` | yes |
| V2 | 2 | Filter/search/reset/empty/multi-package/isolation behavior executes successfully in installed browser; static fallback and both themes checked | E:-contained browser fixture and results | yes |
| V3 | final | R tests and full site render pass; homepage, milestone, roles and task links inspected; CLI output projections unchanged | testthat; `tools\pipsys\pipsys.cmd site`; rendered artifacts | yes |
| V4 | final | All applicable review findings fixed; final verification has no unresolved task findings | saved review/verification reports and handoff | yes |

### Constraints

| ID | Constraint | Check |
|----|------------|-------|
| C1 | E:-only writes, including browser profile/cache and process temp | Record resolved paths and execution environment |
| C2 | No package/protected/roadmap edits or Git mutation; preserve unrelated dirty work | Before/after Git diff and status |
| C3 | Recorded advice is not fresh readiness or execution approval; sources and Gaps stay visible | V1, V3, V4 |

### Boundaries

- Allowed: named implementation files, context CSV, this Plan, `.cg-docs/work-reports/`, `.cg-docs/reviews/`, assigned orchestration run (including task-local active-state.json), E: temp and regenerated gitignored site outputs. The shared active-state pointer stays unchanged.
- Excluded: package repositories, design/charter/roadmap, other tasks' reports, unrelated dirty docs/tests/commands, paused formal records; no commits/pushes/merges/publication.

### Iteration Policy

1. Execute phases sequentially after Plan critique and correction; autonomous deviations only within scope, recorded with impact.
2. Two focused correction attempts per failed required check/finding, then stop with evidence if unresolved.
3. Run routed review, fix all applicable findings including P3, rerun affected checks, and finish with verify mode.

### Blocked-Stop Conditions

- Required verification remains unresolved after the correction budget, a browser cannot run without unsafe writes, a protected boundary needs changing, a material scope/Decided decision is required, or a durable execution report cannot be saved.

## Gaps

- No package readiness is certified by this UI task. Saved assessments can become outdated; the site does not refresh their evidence.
- Plan approval covers execution, not commits, publishing, or a roadmap scope change.
- Revision r2 resolves all critic findings: P1.1 task-local restart record; P2.1 explicit browser output containment; P3.1 dated-assessment eligibility. Source: `outputs/pipsystem/site-focus-and-navigation/20261102T204600Z-plan-critic/handoff.md` under `.cg-docs/orchestration/`.
