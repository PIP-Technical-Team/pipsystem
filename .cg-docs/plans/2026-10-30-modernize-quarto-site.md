---
date: 2026-10-30
completed-date: 2026-10-30
title: "Modernize pipsystem Quarto review site presentation"
status: completed
scope: "Standard"
brainstorm: ".cg-docs/brainstorms/2026-10-30-modernize-quarto-site.md"
language: "R"
estimated-effort: "medium"
deviation-policy: "ask"
artifact-schema-version: 1
phases: 2
completed-phases: [1, 2]
execution-report: ".cg-docs/work-reports/2026-10-30-modernize-quarto-site.md"
plan-revision: "r2"
tags: [quarto, site, pipsys, scss, ojs, aos]
---

# Plan: Modernize pipsystem Quarto review site presentation

## Objective

Overhaul the local `pipsystem` Quarto review website (`site/`) into a modern light/dark web-application interface with custom Bootstrap 5 SCSS styling (`Inter` and `JetBrains Mono` typography, glassmorphism surfaces, elevated cards/buttons, sticky-header tables), progressive AOS scroll animations, a hero/grid/callout landing page (`site/index.md`), and Quarto-native `{ojs}` interactive charts with R-inlined JSON data on `gen/overview.qmd`, `gen/roadmap.qmd`, and `gen/map.qmd`. All existing factual tables, citations, `file:///` source links, New York time-zone formatting, mandatory nonempty `Gaps` sections, and `E:`-only storage redirections remain intact.

Approval: the user prompt of 2026-10-30T15:19:51Z authorizes creating this 2-phase Plan from `.cg-docs/brainstorms/2026-10-30-modernize-quarto-site.md` on existing branch `feat/modernize-quarto-site` without roadmap registration, running `/cg-plan-review`, fixing all review findings, and preparing the sequential `/cg-work review:auto` handoff.

Revision `r2` resolves all eight `/cg-plan-review` (`@cg-plan-critic`) findings:
- **P1.1**: Use Quarto 1.8.27's actual body color-mode classes (`body.quarto-light` and `body.quarto-dark`) in `site/custom.scss` instead of `[data-bs-theme]` alone.
- **P1.2**: Keep `gen/overview.md` and `gen/roadmap.md` link targets in Phase 1 so Phase 1 renders with zero broken links, and switch those links to `.qmd` in Phase 2 alongside `build_site()`.
- **P2.1**: Serialize `"UNKNOWN"` and `"-"` counts as JSON `null` (`na = "null"`), never coercing unknown facts to `0`; omit `null` rows from chart bars and list omitted packages in a chart caption and `## Gaps`.
- **P2.2**: Document that Quarto's `{ojs}` runtime (`quarto-ojs-runtime.js:256,2864-2867`) loads `Plot` and `Inputs` from `cdn.jsdelivr.net` in the browser; inline JSON avoids `file:///` CORS data fetches, while offline viewing falls back to the complete Markdown tables below the charts.
- **P2.3**: Extract shared `overview_data(root, ho)` and `roadmap_summary_data(root)` helpers in `tools/pipsys/pipsys.R` so `report_overview()` (CLI) and `overview_page()` (site) share one data collection pass without running Git twice or parsing Markdown.
- **P2.4**: Derive `roadmap_page()` status filter options dynamically from observed statuses in `roadmap.json` (`["All", ...new Set(roadmap_data.map(d => d.status))]`) so `"active"` (`roadmap.json:39,49`) is included.
- **P2.5**: Emit mandatory nonempty `## Gaps` sections on `roadmap_page()` and `map_page()` (including missing-file paths) as well as `overview_page()`.
- **P2.6**: Replace the single directory timestamp check in `V5` with a pre-run vs post-run recursive file-tree timestamp/count comparison on `C:/Users/wb384996/AppData/Local/quarto` plus existence checks on `Roaming/quarto` and `Local/deno` and verification of `TEMP`/`TMP`/`TMPDIR`/`LOCALAPPDATA`/`APPDATA`/`DENO_DIR` redirections to `E:`.

**Minimal first** (`AGENTS.md`, "Working Principles"): build the smallest version that works end to end; add a safeguard only against an almost-irreversible failure and put other ideas under Later; one check per change shows it works; use installed tools (`Quarto 1.8.27`); keep the Plan to about two pages.

## Context

- Brainstorm: `.cg-docs/brainstorms/2026-10-30-modernize-quarto-site.md` (status: `decided`, scope: `Standard`, Approach 1).
- Charter (`compound-gpid.md:10-39`): `pipsystem` is the design and evidence workspace; package repositories are read-only; every documented fact traces to a file and line or `UNKNOWN`; `Gaps` sections are mandatory and never empty. This UI task does not alter `SYSTEM_DESIGN.md`, `roadmap.json`, or M2 implementation.
- Site generator (`tools/pipsys/pipsys.R:1140-1255`, Plan A `.cg-docs/plans/2026-10-29-pipsystem-info-tools-v1.md`): `build_site()` resets `site/gen/` (`reset_gen_dir()`, `:1108-1124`), generates `overview`, `handoffs`, `roadmap`, `map.qmd`, `design.md`, 11 package status pages, and 61 Plan copies, sets `LOCALAPPDATA`, `APPDATA`, and `DENO_DIR` to `.tmp/pipsys/quarto-home/{local,roaming,deno}` on `E:`, and runs `E:/PovcalNet/01.personal/wb384996/tools/quarto-1.8.27/bin/quarto.exe render site`.
- Quarto 1.8.27 mechanics on `E:`:
  - Color-mode toggle (`share/formats/html/templates/quarto-html-before-body.ejs:5-14` and `share/formats/html/bootstrap/dist/scss/_light-dark.scss:1-5`) switches `body.quarto-light` and `body.quarto-dark` classes on `<body>`.
  - `{ojs}` runtime (`share/formats/html/ojs/quarto-ojs-runtime.js:256,2864-2867`) is bundled locally, while `Plot` and `Inputs` resolve from `https://cdn.jsdelivr.net/npm/` in the browser. Inlining JSON data in `.qmd` cells avoids `file:///` CORS blocks on local data fetches; if a browser is offline, the Markdown tables below the charts remain readable.
- Existing tests (`tests/pipsys/test-pipsys.R:405-584`): test `report_overview()` CLI output (`:442-488`), `map_page()` Mermaid output including `expect_false(any(grepl("-->", page, fixed = TRUE)))` on stage-only maps (`:432-440`), `copy_page()`, and `reset_gen_dir()`.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | `site/_quarto.yml` and `site/custom.scss` provide a dual light/dark Quarto theme (`light: [cosmo, custom.scss]`, `dark: [slate, custom.scss]`) with `/*-- scss:defaults --*/` and `/*-- scss:rules --*/`, `Inter` and `JetBrains Mono` fonts with system fallbacks, `body.quarto-light` and `body.quarto-dark` glassmorphism custom properties (`backdrop-filter: blur(12px)`), elevated card/button hover styles, styled callouts, and sticky-header tables. Keep `embed-resources` unset so offline builds never fetch CDN URLs. | Brainstorm R1; Review P1.1 |
| R2 | `site/assets/aos-head.html` and `site/assets/aos-body.html` load Google Fonts and AOS (`aos.css`, `aos.js`) via CDN, sync `data-bs-theme` with `body.quarto-dark`/`quarto-light`, and attach `data-aos="fade-up"` to `.card, .callout, .cell-output-display, section.level2` in JS only when `typeof window.AOS !== "undefined"` and `prefers-reduced-motion: reduce` is false, preventing invisible (`opacity: 0`) content when offline. | Brainstorm R2; Review P1.1 |
| R3 | `site/index.md` presents a `.hero-banner` section, a responsive 6-card Quarto CSS grid (`.grid` with `.g-col-12 .g-col-md-6 .g-col-lg-4 .card .pip-card`) linking to Overview, Pipeline Map, Roadmap, Handoffs, System Design, and Package Status & Plans, plus styled Callout blocks (`::: {.callout-note}`, `::: {.callout-tip}`). Phase 1 links target `gen/overview.md` and `gen/roadmap.md`; Phase 2 updates them to `.qmd` alongside `build_site()`. | Brainstorm R4; Review P1.2 |
| R4 | `tools/pipsys/pipsys.R` factors out `roadmap_summary_data(root)` and `overview_data(root, ho)` (preserving CLI `report_overview()` output), adds `overview_page(root, ho)` and `roadmap_page(root)`, updates `map_page(root)`, and writes `gen/overview.qmd`, `gen/roadmap.qmd`, and `gen/map.qmd` in `build_site()` with Quarto `{ojs}` (`echo: false`) `Plot` charts and `Inputs` controls backed by inline JSON (`jsonlite::toJSON(auto_unbox = TRUE, na = "null")`). Unavailable/unknown counts serialize as `null` (never `0`), roadmap filter options derive dynamically from observed statuses (including `"active"`), all three pages emit nonempty `## Gaps` sections (including on missing-input paths), and `map_page()` never emits `-->` outside Mermaid edges. | Brainstorm R3; Review P2.1-P2.5 |
| R5 | `tests/pipsys/test-pipsys.R` covers `overview_page()` (including known-branch/`uncommitted = "UNKNOWN"` and unconfigured packages as JSON `null`), `roadmap_page()` (including `"active"` status and missing `roadmap.json`), `map_page()` (including nonempty `## Gaps` and no `-->` when edges are absent), and `build_site(render = FALSE)`; `tools/pipsys/pipsys.cmd site` exits 0 with verified `E:` redirections and unchanged `C:` Quarto state. | Brainstorm R5; Review P2.1-P2.6 |

## Phase 1: Theme, Scroll Animations, and Landing Page

### 1. Custom SCSS theme and Quarto configuration
- **Requirements**: R1, R2, R3
- **Files**: `site/_quarto.yml`, `site/custom.scss`, `site/assets/aos-head.html`, `site/assets/aos-body.html`
- **Details**:
  - `site/_quarto.yml`: keep `project: type: website` and `output-dir: _site`; add `navbar` (title `"pipsystem"`, links to Overview `gen/overview.md`, Roadmap `gen/roadmap.md`, Pipeline Map `gen/map.qmd`, Handoffs `gen/handoffs.md`, Design `gen/design.md` — switched to `.qmd` in Phase 2 Step 3) alongside `sidebar: contents: auto`; under `format: html:`, set `toc: true`, `page-layout: full`, `theme: { light: [cosmo, custom.scss], dark: [slate, custom.scss] }`, `include-in-header: assets/aos-head.html`, and `include-after-body: assets/aos-body.html`.
  - `site/custom.scss`: start with `/*-- scss:defaults --*/` defining `$font-family-sans-serif: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;` and `$font-family-monospace: "JetBrains Mono", ui-monospace, SFMono-Regular, Consolas, monospace;`. Under `/*-- scss:rules --*/`, define light/dark CSS custom properties (`--pip-bg`, `--pip-surface`, `--pip-surface-glass`, `--pip-border`, `--pip-accent`, `--pip-accent-soft`, `--pip-text`, `--pip-text-muted`) on `:root, body.quarto-light` and override them on `body.quarto-dark` (matching Quarto 1.8.27's `quarto-html-before-body.ejs` class toggle). Style `.navbar`, `#quarto-sidebar`, `.hero-banner`, `.card` / `.pip-card` (glassmorphism `backdrop-filter: blur(12px)`, subtle border, `translateY(-3px)` hover lift), `.btn`, `.callout`, `table` (sticky `thead th`, row hover, monospace code spans), and `.ojs-chart-card`.
  - `site/assets/aos-head.html`: `<link>` tags for Google Fonts (`Inter:wght@400;500;600;700`, `JetBrains+Mono:wght@400;500`) and `https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css`.
  - `site/assets/aos-body.html`: `<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>` and an inline `<script>` on `DOMContentLoaded` that (a) syncs `document.documentElement.setAttribute("data-bs-theme", document.body.classList.contains("quarto-dark") ? "dark" : "light")` initially and via a `MutationObserver` on `document.body`, and (b) checks `if (typeof window.AOS !== "undefined" && !window.matchMedia("(prefers-reduced-motion: reduce)").matches)` before setting `data-aos="fade-up"` on `.card, .callout, .cell-output-display, section.level2` and calling `window.AOS.init({ duration: 450, easing: "ease-out-cubic", once: true, offset: 24 })`.
- **Test Scenarios**: Quarto compiles `site/custom.scss` in both `light` and `dark` themes; compiled CSS under `site/_site/site_libs/bootstrap/` contains `body.quarto-light` and `body.quarto-dark` custom properties; offline viewing without `window.AOS` leaves elements without `data-aos` so nothing is `opacity: 0`.
- **Tests**: `tools\pipsys\pipsys.cmd site`
- **Acceptance criteria**: `site/_quarto.yml`, `site/custom.scss`, `site/assets/aos-head.html`, and `site/assets/aos-body.html` exist; Quarto renders `site/` with exit code 0.

### 2. Structured landing page
- **Requirements**: R3
- **Files**: `site/index.md`
- **Details**:
  - Replace the bullet list in `site/index.md` with:
    1. `::: {.hero-banner}` containing the heading, subtitle for the PIP incremental build review site, and action buttons linking to `gen/overview.md` and `gen/map.qmd`.
    2. `::: {.grid}` with six cards (`::: {.g-col-12 .g-col-md-6 .g-col-lg-4 .card .pip-card}`): **Overview** (`gen/overview.md`), **Pipeline Map** (`gen/map.qmd`), **Roadmap** (`gen/roadmap.md`), **Handoffs** (`gen/handoffs.md`), **System Design** (`gen/design.md`), and **Package Status & Plans** (`gen/status/pipsystem.md` and sidebar `gen/status` / `gen/plans`).
    3. `::: {.callout-note}` explaining that `site/gen/` is regenerated by `tools\pipsys\pipsys.cmd site` (`/pip-site`) and is local-only (not published); and `::: {.callout-tip}` explaining New York time (`EDT`/`EST`) in generated reports versus original timestamps (`UTC`) and `file:///` source links in copied Plans/design pages.
- **Test Scenarios**: all links resolve during Phase 1 `tools\pipsys\pipsys.cmd site`; `.hero-banner`, `.grid`, `.pip-card`, and `.callout` divs appear in `site/_site/index.html`.
- **Tests**: `tools\pipsys\pipsys.cmd site`
- **Acceptance criteria**: `tools\pipsys\pipsys.cmd site` exits 0; `site/_site/index.html` contains `.hero-banner`, `.pip-card`, `.callout`, and AOS includes with zero broken links.

## Phase 2: Generator `{ojs}` Interactive Charts and Verification

### 3. Generator `{ojs}` charts, shared data helpers, and mandatory `Gaps` sections
- **Requirements**: R3, R4, R5
- **Files**: `tools/pipsys/pipsys.R`, `site/_quarto.yml`, `site/index.md`
- **Details**:
  - Add `roadmap_summary_data(root)`: reads `roadmap.json` once and returns a `data.table` with columns `milestone` (character), `status` (character), `done` (integer), `total` (integer), and `features_done` (`sprintf("%d/%d", done, total)`). `roadmap_summary(root)` returns `roadmap_summary_data(root)[, .(milestone, status, features_done)]`, preserving its exact return schema.
  - Add `overview_data(root = pipsys_root(), ho = handoff_table(outputs_dir(root)))`: runs the package loop (`tools/pipsys/pipsys.R:939-992`) once and returns `list(table = table, roadmap = roadmap_summary_data(root), gaps = gaps)`. Refactor `report_overview(root, ho)` to format `overview_data(root, ho)` into the exact same CLI Markdown lines as before.
  - Add `ojs_cell(lines)` that wraps JS lines in ```` ```{ojs} ````, `//| echo: false`, and ```` ``` ````.
  - Add `overview_page(root = pipsys_root(), ho = handoff_table(outputs_dir(root)))`:
    - Calls `ov <- overview_data(root, ho)`. Parses numeric counts with `to_num <- function(x) fifelse(grepl("^[0-9]+$", x), suppressWarnings(as.integer(x)), NA_integer_)` so `"UNKNOWN"` and `"-"` become `NA_integer_` and serialize via `jsonlite::toJSON(..., auto_unbox = TRUE, na = "null")` as JSON `null` (never fabricating `0`).
    - Emits YAML frontmatter (`title: 'PIP packages: overview'`), timestamp line, an `## Interactive summary` section with an `{ojs}` cell plotting (a) `open_plans` and `uncommitted` bars for rows with non-`null` counts (plus a caption listing any packages omitted because their path or count is `UNKNOWN`) and (b) milestone completion (`done` vs `total` from `ov$roadmap`), followed by `## Packages` (`md_table(ov$table)`), `## Roadmap` (`md_table(ov$roadmap[, .(milestone, status, features_done)])`), and `## Gaps` (`ov$gaps` plus a bullet noting that `{ojs}` charts load `Plot`/`Inputs` from `cdn.jsdelivr.net` in the browser while the tables below work offline).
  - Add `roadmap_page(root = pipsys_root())`:
    - Reads `dt <- roadmap_table(root)`. Serializes `dt` as `roadmap_data` via `jsonlite::toJSON(dt, auto_unbox = TRUE, na = "null")`.
    - Emits YAML frontmatter (`title: Roadmap`), timestamp line, an `{ojs}` cell that derives filter options dynamically (`["All", ...new Set(roadmap_data.map(d => d.status))]`, supporting `"active"`, `"in-progress"`, `"done"`, `"planned"`, `"idea"`) and renders a stacked horizontal bar chart (`Plot.barX`) when `roadmap_data.length > 0`, followed by `## Features` (`md_table(dt)`) and a mandatory nonempty `## Gaps` section (noting that statuses are as recorded in `roadmap.json`, not verified; `{ojs}` requires browser CDN access to `cdn.jsdelivr.net`; and, when `!nrow(dt)`, that `roadmap.json` is missing or has no features).
  - Update `map_page(root)` (`tools/pipsys/pipsys.R:643-676`):
    - Define mandatory nonempty `## Gaps` lines (`- Citations are checked by check-map for existence and line range only, not for meaning.`, `- Evidence-only map, not a contract; the M2 Plan's E1-E11 contracts stay PROPOSED.`, `- Interactive {ojs} chart loads Plot and Inputs from cdn.jsdelivr.net in the browser; the claims table below works offline.`, plus `- tables/pipeline_map.csv not found.` when `is.null(map)`).
    - When `is.null(map)`, return `c(head, "none", "", "## Gaps", "", gaps_lines)`.
    - When `!is.null(map)`, serialize `map[, .(kind, id, status)]` as inline JSON `map_claims` and insert an `{ojs}` cell between the `{mermaid}` block and `## Claims` that renders an interactive stacked bar chart of claims by `status` (`decided`, `harvested`, `open`, `unknown`) across stages `1`–`10` with an `Inputs.select` filter, followed by `## Claims`, `md_table(map)`, and `## Gaps`. Never include `-->` inside the `{ojs}` block.
  - Update `build_site()` (`tools/pipsys/pipsys.R:1151-1166`) to write `file.path(gen, "overview.qmd")` and `file.path(gen, "roadmap.qmd")`, and update `gen/overview.md` -> `gen/overview.qmd` and `gen/roadmap.md` -> `gen/roadmap.qmd` in `site/_quarto.yml` and `site/index.md`.
- **Test Scenarios**: `overview_page()` serializes both unconfigured (`"-"`) and known-branch `uncommitted = "UNKNOWN"` counts as `null` in JSON, never `0`; `roadmap_page()` includes `"active"` in dynamic status data and emits nonempty `## Gaps` whether `roadmap.json` is present or absent; `map_page()` emits nonempty `## Gaps` whether `pipeline_map.csv` is present or absent and contains no `-->` when edges are absent; `report_overview()` CLI output is unchanged.
- **Tests**: `tests/pipsys/test-pipsys.R`; `tools\pipsys\pipsys.cmd site`
- **Acceptance criteria**: `build_site()` writes `gen/overview.qmd`, `gen/roadmap.qmd`, and `gen/map.qmd`, and Quarto renders `site/_site/gen/overview.html`, `roadmap.html`, and `map.html` with exit code 0.

### 4. Unit tests and end-to-end verification
- **Requirements**: R4, R5
- **Files**: `tests/pipsys/test-pipsys.R`
- **Details**:
  - Add unit tests in `tests/pipsys/test-pipsys.R` verifying:
    1. `overview_page()` emits ```` ```{ojs} ````, serializes `"UNKNOWN"` and `"-"` counts as `null` (testing both an unconfigured package and a mocked/unreadable `uncommitted = "UNKNOWN"` row), and includes `## Packages`, `## Roadmap`, and nonempty `## Gaps`.
    2. `roadmap_page()` emits ```` ```{ojs} ````, preserves `"active"` status rows in JSON and table output, and includes nonempty `## Gaps` both when `roadmap.json` exists and when it is missing.
    3. `map_page()` emits ```` ```{mermaid} ````, ```` ```{ojs} ````, `## Claims`, and nonempty `## Gaps` when `tables/pipeline_map.csv` exists, emits nonempty `## Gaps` when `pipeline_map.csv` is missing, and contains no `-->` substring on a stage-only map.
    4. `build_site(root = root, render = FALSE)` writes `site/gen/overview.qmd`, `site/gen/roadmap.qmd`, and `site/gen/map.qmd`.
  - Capture a pre-run baseline of `C:/Users/wb384996/AppData/Local/quarto` (recursive file count and max `LastWriteTimeUtc`), `Test-Path C:/Users/wb384996/AppData/Roaming/quarto`, and `Test-Path C:/Users/wb384996/AppData/Local/deno`, run the unit tests and `tools\pipsys\pipsys.cmd site` with `TEMP`, `TMP`, and `TMPDIR` on `E:`, and verify post-run equality.
- **Test Scenarios**: all unit tests pass; `pipsys.cmd site`, `pipsys.cmd overview`, and `pipsys.cmd check-map` exit 0; post-run `C:` baseline matches pre-run baseline.
- **Tests**: `Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"`; `tools\pipsys\pipsys.cmd site`
- **Acceptance criteria**: 0 test failures; `pipsys.cmd site` exits 0; verified `E:` redirections and unchanged `C:` Quarto/Deno state.

## Testing Strategy

With `TEMP`, `TMP`, and `TMPDIR` set to `E:\PovcalNet\01.personal\wb384996\PIP\pipsystem\.tmp\pipsys`, run `Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"`, `tools\pipsys\pipsys.cmd site`, `tools\pipsys\pipsys.cmd overview`, and `tools\pipsys\pipsys.cmd check-map`. Inspect generated HTML files under `site/_site/` for compiled `body.quarto-light`/`body.quarto-dark` CSS rules, AOS includes, `{ojs}` blocks, and nonempty `Gaps` sections.

## Documentation Checklist

- Top-of-file comment in `tools/pipsys/pipsys.R` updated if needed.
- `site/index.md` documents the generated `site/gen/` boundary, New York time-zone rule, and `file:///` links inside styled Callout blocks.
- `overview.qmd`, `roadmap.qmd`, and `map.qmd` document browser-time CDN usage (`cdn.jsdelivr.net`) in `## Gaps`.

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Custom SCSS variables do not switch on Quarto's theme toggle | Scope color tokens to `body.quarto-light` and `body.quarto-dark` matching Quarto 1.8.27's toggle classes, and mirror `data-bs-theme` in `aos-body.html` (Step 1, P1.1). |
| Phase 1 links break before Phase 2 generates `.qmd` files | Keep `gen/overview.md` and `gen/roadmap.md` links in Phase 1 and switch them to `.qmd` in Phase 2 Step 3 alongside `build_site()` (P1.2). |
| Unknown repository counts (`"UNKNOWN"` or `"-"`) appear as fabricated `0` bars | Serialize non-numeric counts as JSON `null` (`na = "null"`), filter `null` from chart marks, and list omitted packages in a caption and `## Gaps` (Step 3, P2.1). |
| Offline browser viewing cannot fetch `Plot`, `Inputs`, or `AOS` from `cdn.jsdelivr.net` | Attach `data-aos` only when `window.AOS` is defined so content stays `opacity: 1` offline; keep complete Markdown tables below every `{ojs}` chart and document the CDN dependency in `## Gaps` (Steps 1 & 3, P2.2). |
| `map_page()` `{ojs}` code breaks `test-pipsys.R:438` (`!grepl("-->", page)`) | Never use `-->` inside `map_page()` `{ojs}` cells; verify with unit test (Step 4). |

## Out of Scope

- Converting the 11 per-package status pages (`gen/status/*.md`) or 61 copied Plan pages (`gen/plans/*/*.md`) from `.md` to `.qmd`.
- Vendoring `@observablehq/plot`, `@observablehq/inputs`, `AOS`, or font binaries locally into the repository (recorded under **Later**).
- Modifying any PIP package repository, `SYSTEM_DESIGN.md`, `compound-gpid.md`, or `roadmap.json`.

## Completion Contract

### Outcome

`tools\pipsys\pipsys.cmd site` exits 0 and produces `site/_site/index.html`, `gen/overview.html`, `gen/roadmap.html`, and `gen/map.html` with `body.quarto-light`/`body.quarto-dark` `custom.scss` styling, progressive AOS scroll animations, a hero/grid/callout landing page, and interactive `{ojs}` charts backed by inlined JSON (`null` for unknown counts) above intact Markdown tables and nonempty `Gaps` sections, while all `test-pipsys.R` unit tests pass and redirected `E:` temp/cache paths leave `C:` Quarto/Deno directories unchanged.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|----|-------|-------------------|------------------|----------|
| V1 | 1 | `tools\pipsys\pipsys.cmd site` exits 0; `site/_site/index.html` contains `.hero-banner`, `.pip-card`, `.callout`, and AOS includes with all links resolving; compiled bootstrap CSS under `site/_site/site_libs/bootstrap/` contains `body.quarto-light` and `body.quarto-dark` token rules | `tools\pipsys\pipsys.cmd site`; `Select-String` on rendered HTML/CSS | yes |
| V2 | 2 | Unit tests in `tests/pipsys/test-pipsys.R` pass (0 failures) covering `overview_page()` (`null` for `"UNKNOWN"`/`"-"`), `roadmap_page()` (`"active"` status and missing file), `map_page()` (nonempty `## Gaps` and no `-->` on stage-only maps), and `build_site(render = FALSE)` | `Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"` | yes |
| V3 | 2 | Full site regeneration and Quarto render exits 0; `site/_site/gen/overview.html`, `roadmap.html`, and `map.html` exist and contain rendered `{ojs}` cells, intact Markdown tables, and nonempty `Gaps` sections | `tools\pipsys\pipsys.cmd site`; `Select-String` on rendered HTML | yes |
| V4 | 2 | CLI `tools\pipsys\pipsys.cmd overview` and `tools\pipsys\pipsys.cmd check-map` exit 0 with unchanged plain-Markdown output | `tools\pipsys\pipsys.cmd overview`; `tools\pipsys\pipsys.cmd check-map` | yes |
| V5 | final | Pre-run vs post-run recursive file count and max `LastWriteTimeUtc` under `C:/Users/wb384996/AppData/Local/quarto` are identical, `C:/Users/wb384996/AppData/Roaming/quarto` and `C:/Users/wb384996/AppData/Local/deno` do not exist, and `git status --short` shows only intended files in `pipsystem` | PowerShell baseline comparison; `git status --short` | yes |

### Constraints

| ID | Phase | Constraint | Check |
|----|-------|------------|-------|
| C1 | 1 | Process-local `TEMP`, `TMP`, `TMPDIR`, `LOCALAPPDATA`, `APPDATA`, and `DENO_DIR` point to `.tmp/pipsys` on `E:` and leave monitored `C:` Quarto/Deno paths unchanged | V5 |
| C2 | 2 | No fabrication (`"UNKNOWN"`/`"-"` counts serialize as `null`, never `0`) and every generated summary page (`overview`, `roadmap`, `map`) has a nonempty `## Gaps` section | V2, V3, V4 |
| C3 | final | No edits to any PIP package repository, `SYSTEM_DESIGN.md`, `compound-gpid.md`, or `roadmap.json` | V5 (`git status --short`) |

### Boundaries

- **Allowed**: `site/_quarto.yml`, `site/custom.scss`, `site/assets/aos-head.html`, `site/assets/aos-body.html`, `site/index.md`, `tools/pipsys/pipsys.R`, `tests/pipsys/test-pipsys.R`, `.cg-docs/plans/2026-10-30-modernize-quarto-site.md`, `.cg-docs/work-reports/2026-10-30-modernize-quarto-site.md`, `.cg-docs/reviews/**`, `.tmp/pipsys/**`, and regenerated gitignored `site/gen/**`, `site/_site/**`, `site/.quarto/**`.
- **Out of scope**: PIP package repositories, `SYSTEM_DESIGN.md`, `roadmap.json`, `compound-gpid.md`, `.kilo/commands/pip-*.md`, and external deployment/publishing.

### Iteration Policy

1. Execute Phase 1 then Phase 2 sequentially; verify each phase's required `V*` rows before advancing.
2. Active stored policy is `deviation-policy: ask` (or `autonomous` when invoked via `/cg-work review:auto deviate:auto`).
3. Up to 2 focused fix attempts per failing verification check or review finding within the authorized boundaries before halting.
4. Address all review findings (P0–P3) within scope, rerun affected checks (`V1`–`V5`), and finish with `/cg-review mode:verify`.

### Blocked-Stop Conditions

- Quarto 1.8.27 at `E:/PovcalNet/01.personal/wb384996/tools/quarto-1.8.27/bin/quarto.exe` is missing or fails after 2 recovery attempts.
- Any operation writes to `C:` outside the allowed Kilo configuration/runtime directories.
- Completing a step would require modifying a protected file (`SYSTEM_DESIGN.md`, `roadmap.json`, `compound-gpid.md`, or a package repository).
