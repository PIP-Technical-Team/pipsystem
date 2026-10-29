---
schema: pip-handoff-v2
project: pipsystem
task: pipeline-dependency-map
run: 20261029T185255Z-plan-c
status: completed
updated: 2026-10-29T19:14:27Z
owner: pip-orchestrator (session ses_e775390f8ffe4GUSm1QzDyITAg)
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: df37f94b14f1700d1d74d5a1203a620d1e417471
plan: .cg-docs/plans/2026-10-29-pipeline-dependency-map.md (r2, completed)
next: pip-orchestrator builds Plan B (documentation pipeline)
---

# Plan C: Pipeline Dependency Map

## Summary

Done. `tables/pipeline_map.csv` records the ten PIP stages and nine links as
80 claims, one per row, each with its own status (`decided` 46, `harvested`
28, `open` 3, `unknown` 3) and its own citation. Every link is cited on both
sides. `tools\pipsys\pipsys.cmd check-map` checks the file (exit 0); the site
has a "Pipeline map" page with a Mermaid flowchart; `/pip-status` shows the
stages each package owns. The map is evidence only, not a contract; the M2
Plan's contracts stay PROPOSED.

Route: `/cg-plan deviate:auto` (r1), `/cg-plan-review` (4 findings, fixed in
r2; re-review found 1 more, fixed), `/cg-work review:auto deviate:auto`
(mode data-risk, 10 findings, fixed), verify round (no new findings).

## Changes

All uncommitted.

- New: `tables/pipeline_map.csv`; `.cg-docs/plans/2026-10-29-pipeline-dependency-map.md`;
  `.cg-docs/work-reports/2026-10-29-pipeline-dependency-map.md`; this run's
  `plan-review.md` and `code-review.md`.
- Edited: `tools/pipsys/pipsys.R` (pipeline map section, status section,
  `site` writes `gen/map.qmd`, `check-map` subcommand), `tests/pipsys/test-pipsys.R`,
  `site/index.md`, `.kilo/commands/pip-status.md` (description; gitignored).
- Not changed: `SYSTEM_DESIGN.md` (its uncommitted diff is the step 2 rule
  change), the M2 Plan, `roadmap.json`, package repositories.

## Checks run

- V1: `[ FAIL 0 | WARN 0 | SKIP 0 | PASS 140 ]`.
- V2/V3: `check-map` exit 0, 10 stages, 9 edges, no problems.
- V3 (site): render exit 0; `site/_site/gen/map.html` has the Mermaid element,
  edge text and Quarto's Mermaid scripts.
- V4: `status pipdata` lists stages 2, 3, 4, 8, 9.
- V5: protected files unchanged by this Plan; package porcelain counts equal
  the baseline; `C:\Users\wb384996\AppData\Local\quarto` unchanged.
- No package repository was read; package facts come from `notes/*.md`, whose
  SHAs are recorded in those notes.

## Gaps

- `check-map` checks citation existence, range and source class, not meaning;
  meaning was reviewed once (data-quality reviewer).
- Entry points of stages 2, 8, 9 are UNKNOWN; inputs of stages 6, 7 are Open;
  the sources of survey distributions (stage 8) and of the ALL module (stage 9)
  are not stated, so those links are not drawn.
- The eight data-risk review roles ran as three subagents (work report D5).
- Later: check that a cited line still says what the claim says; per-estimate
  edges; entry points from package source with SHAs.
