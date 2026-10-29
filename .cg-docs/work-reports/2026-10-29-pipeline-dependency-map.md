# Work Report: Pipeline dependency map as data

## Plan Reference

- Plan: `.cg-docs/plans/2026-10-29-pipeline-dependency-map.md` (revision r2)
- Central handoff: `.cg-docs/orchestration/outputs/pipsystem/pipeline-dependency-map/20261029T185255Z-plan-c/handoff.md`
- Plan review: `.cg-docs/orchestration/outputs/pipsystem/pipeline-dependency-map/20261029T185255Z-plan-c/plan-review.md`
- Code review: `.cg-docs/orchestration/outputs/pipsystem/pipeline-dependency-map/20261029T185255Z-plan-c/code-review.md`

## Active Deviation Policy

- Stored: `autonomous`. Runtime override: `deviate:auto` (same value). Review mode: `review:auto`, resolved to `data-risk` (the map documents welfare, deflation and estimate dependencies).

## Baseline

- pipsystem `main` at `df37f94b14f1700d1d74d5a1203a620d1e417471`; Plan A changes uncommitted.
- Package porcelain counts: stamp 3, pipaux 1, pipdata 0, pipster 0, pipload 6, pipfun 0, pipapi 0, wbpip 0.

## Run 1 (2026-10-29)

### Completed Steps

- Step 1: `tables/pipeline_map.csv` filled from `SYSTEM_DESIGN.md` sections 5-7 and `notes/*.md` (no package repository read).
- Step 2: `check_citations()`, `check_map()`, `check-map` subcommand; tests (red phase: 6 failing before the code existed).
- Step 3: `gen/map.qmd` page with a Mermaid flowchart and the claims table; "Pipeline stages" section in `/pip-status`; `site/index.md` link; `/pip-status` description.
- Review (data-risk): 3 reviewers; 10 findings, all fixed; verify round: data-quality confirmed all 6 data findings fixed and code-quality confirmed all 4 code findings plus the two added checks; no new findings.

### Deviations

- D1: the map page is `gen/map.qmd`, not `gen/map.md`. Reason: Quarto 1.8.27 refuses a `{mermaid}` cell in a `.md` file ("You must use the .qmd extension for documents with executable code"); the page has no R or Python cells.
- D2: edges `2->9` and `4->6` are not drawn. Reason (data-quality review): no cited line names their source stage; their facts are stage 9 and stage 6 input claims instead.
- D3: every edge `carries` claim is cited on both sides (one row naming both, or "Producer side" and "Consumer side" rows). Reason: data-quality review; the Plan's one-claim-per-row rule did not say how a link is supported.
- D4: `check-map` also checks the status/source class (decided and open cite `SYSTEM_DESIGN.md`, harvested cite `notes/*.md`) and resolves citations through junctions (`inside_root()`). Reason: data-quality review; R2 defines the classes.
- D5: review consolidated the eight `data-risk` reviewer roles into three subagents (data-quality; code quality with testing, architecture, performance and documentation; reproducibility with version control), to limit cost. Every role was named in a reviewer prompt; no role was dropped.

### Accepted Exceptions

- None.

## Evidence Table

| ID | Status | Evidence |
|----|--------|----------|
| V1 | passed | `[ FAIL 0 | WARN 0 | SKIP 0 | PASS 140 ]`, including the failing fixtures (each asserts its row, message and problem count). |
| V2 | passed | `tools\pipsys\pipsys.cmd check-map`: exit 0; "80 claims: 10 stages, 9 edges. Statuses: decided 46, harvested 28, open 3, unknown 3." Problems: none. |
| V3 | passed | `pipsys.cmd site` exit 0 (63 Plans); `site/_site/gen/map.html` has 1 `class="mermaid"` element, the edge text, and `site_libs/quarto-diagram/mermaid.min.js` and `mermaid-init.js`. |
| V4 | passed | `status pipdata` "Pipeline stages": 2, 3, 4, 8, 9. |
| V5 | passed | `git status --short -- SYSTEM_DESIGN.md roadmap.json .cg-docs/plans/2026-10-10-m2-walking-skeleton.md`: only `SYSTEM_DESIGN.md`, whose diff is the step 2 rule change (lines 319, 323), not this Plan. Package porcelain counts equal the baseline. `C:\Users\wb384996\AppData\Local\quarto` unchanged (2026-03-11). |

## Proposals For Open Items (not applied)

- `SYSTEM_DESIGN.md:194-199` (row-level change detection): current code hashes the whole selected CPI or PPP vector per survey (`notes/pipdata.md:60`); recorded in the map as a harvested `invalidated_by` claim on edge 1->4. No design change proposed beyond the existing Open item.

## Remaining Uncertainty

- Citations are checked for existence, range and source class, not for meaning; the meaning was checked once by the data-quality reviewer.
- Stage 2, 8 and 9 entry points are UNKNOWN; stage 6-7 inputs are Open.
- The map is evidence only, not a contract; the M2 Plan's E1-E11 contracts stay PROPOSED.

## Final Status

completed
