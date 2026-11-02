---
date: 2026-10-30
title: "Modernize pipsystem Quarto review site presentation"
status: decided
scope: "Standard"
artifact-schema-version: 1
chosen-approach: "Approach 1: Quarto-Native Dual Theme (custom.scss) + Generator-Emitted {ojs} .qmd Pages"
tags: [quarto, site, pipsys, scss, ojs, aos]
---
<!-- Valid status values: decided, in-progress, abandoned -->

# Modernize pipsystem Quarto review site presentation

## Context

The local `pipsystem` review site (`site/`, built and rendered by `tools\pipsys\pipsys.cmd site` via `tools/pipsys/pipsys.R:1140-1255`) currently uses a minimal 12-line `site/_quarto.yml` (`project: type: website`, `sidebar: contents: auto`, `toc: true`) with default Quarto styling and a plain bulleted `site/index.md`.

Every page under `site/gen/` is deleted and regenerated on each `pipsys.cmd site` run (`tools/pipsys/pipsys.R:1108-1124`). The generator currently writes plain `.md` files for `overview.md`, `handoffs.md`, `roadmap.md`, `design.md`, 11 package status pages (`gen/status/<package>.md`), and 61 copied Plans (`gen/plans/<project>/<file>.md`), plus one `.qmd` file (`gen/map.qmd`) containing a `{mermaid}` flowchart and claims table from `tables/pipeline_map.csv`. Quarto `1.8.27` is installed on `E:\` (`E:/PovcalNet/01.personal/wb384996/tools/quarto-1.8.27/bin/quarto.exe`) and bundles Bootstrap 5 SCSS compilation, light/dark color-mode toggling, and the Observable JS runtime (`share/formats/html/ojs/quarto-ojs-runtime.min.js`).

The goal is to overhaul the presentation of `site/` so it looks and behaves like a modern custom web application while keeping Quarto as the generator and preserving all existing factual tables, `file:///` source links, New York time-zone formatting, `Gaps` sections, and `E:\`-only storage rules.

## Requirements

- **R1 — Custom SCSS theme and typography (`site/_quarto.yml`, `site/custom.scss`)**:
  - Enable Quarto light and dark mode (`cosmo` base with `site/custom.scss` using `[data-bs-theme="light"]` and `[data-bs-theme="dark"]` custom properties).
  - Configure modern typography (`Inter` for UI/body/headings and `JetBrains Mono` for code/SHAs/paths via Google Fonts, with system sans/mono fallbacks when offline).
  - Define custom color palettes, glassmorphism surfaces (`backdrop-filter: blur(12px)`, translucent borders), modern card/button hover-lift styles, styled Callout blocks, and clean sticky-header data tables.
- **R2 — Progressive AOS scroll animations (`site/assets/aos-init.html`)**:
  - Integrate AOS (`aos.css` and `aos.js` via `cdn.jsdelivr.net`) through `site/_quarto.yml` (`include-in-header` / `include-after-body`).
  - Attach `data-aos="fade-up"` dynamically in JavaScript to `.card`, `.callout`, `.cell-output-display`, and `section.level2` **only** when `typeof window.AOS !== "undefined"` and `prefers-reduced-motion: reduce` is not active (`AOS.init({ duration: 450, easing: "ease-out-cubic", once: true, offset: 24 })`), ensuring pages never render invisible (`opacity: 0`) offline.
- **R3 — Interactive `{ojs}` charts on generated summary pages (`tools/pipsys/pipsys.R`, `tests/pipsys/test-pipsys.R`)**:
  - Update `build_site()` in `tools/pipsys/pipsys.R` to emit `gen/overview.qmd`, `gen/roadmap.qmd`, and `gen/map.qmd` with Quarto `{ojs}` (`//| echo: false`) charts using bundled `Plot` and `Inputs`.
  - Inline the chart datasets as JSON literals inside each `.qmd` page using `jsonlite::toJSON()` so interactive charts work when `site/_site/index.html` is opened directly via `file:///` (avoiding browser CORS blocks on local `fetch()`).
  - Charts to include:
    1. `gen/overview.qmd`: Package activity bar chart (`open_plans` and `uncommitted` counts per package) and milestone completion progress bars (`done` vs total features).
    2. `gen/roadmap.qmd`: Stacked bar chart of roadmap features by status (`done`, `in-progress`, `planned`, `idea`) across M0–M6, plus an interactive status/milestone filter.
    3. `gen/map.qmd`: Stage-by-status bar chart (`decided`, `harvested`, `open`, `unknown` across stages 1–10) alongside the existing `{mermaid}` flowchart.
  - Keep all existing Markdown tables, citations, and `Gaps` sections intact below the charts. Keep the 11 package status pages (`gen/status/*.md`) and 61 copied Plan pages (`gen/plans/*/*.md`) as fast-rendering `.md` files.
- **R4 — Structured landing page (`site/index.md`)**:
  - Redesign `site/index.md` using a hero banner section, a responsive 6-card Quarto CSS grid (`.grid` with `.g-col-12 .g-col-md-6 .g-col-lg-4`) linking to Overview, Handoffs, Roadmap, Pipeline Map, System Design, and Status/Plans, and styled Callout blocks (`::: {.callout-note}`, `::: {.callout-tip}`) explaining the generated `gen/` boundary, New York time-zone convention, and `file:///` source links.
- **R5 — Constraints and verification**:
  - `pipsystem` is the only writable repository; all Quarto state and temporary files remain redirected to `.tmp/pipsys/` on `E:\` (`tools/pipsys/pipsys.R:1206-1223`).
  - `tools\pipsys\pipsys.cmd site` and `tests/pipsys/test-pipsys.R` must pass with exit code 0 and zero writes to `C:\`.

## Approaches Considered

### Approach 1: Quarto-Native Dual Theme (`custom.scss`) + Generator-Emitted `{ojs}` `.qmd` Pages
Configure `site/_quarto.yml` with light/dark theme switching backed by `site/custom.scss`, inject Google Fonts (`Inter`, `JetBrains Mono`) and progressive AOS initialization via `site/assets/aos-init.html`, redesign `site/index.md` with Quarto layout containers, `.grid` cards, and Callout blocks, and update `tools/pipsys/pipsys.R` to emit `overview.qmd`, `roadmap.qmd`, and `map.qmd` with inlined JSON data and `{ojs}` `Plot` charts above the existing Markdown tables.

- **Pros**:
  - Uses Quarto 1.8.27's bundled `{ojs}` runtime directly on structured `data.table` objects serialized in R, working over both `file:///` and HTTP.
  - Progressive AOS initialization guarantees full offline readability if CDN assets are unreachable.
  - Preserves all existing Markdown tables, citations, `file:///` links, and `Gaps` sections verbatim below the charts.
  - Quarto renders `gen/overview.qmd` and `gen/roadmap.qmd` to `gen/overview.html` and `gen/roadmap.html`, preserving output URLs.
- **Cons**:
  - Converting `overview` and `roadmap` from `.md` to `.qmd` adds ~1–2 seconds to `pipsys.cmd site` and requires updating `tests/pipsys/test-pipsys.R`.

### Approach 2: `.md`-Only Generator + Client-Side DOM Table Scraper
Leave `tools/pipsys/pipsys.R` untouched (emitting `.md` files) and inject client-side JavaScript in `site/_quarto.yml` that scrapes rendered HTML `<table>` elements in the browser to construct interactive charts above them, alongside `site/custom.scss` and `site/index.md`.

- **Pros**:
  - Zero edits to `tools/pipsys/pipsys.R` or `tests/pipsys/test-pipsys.R`.
- **Cons**:
  - Client-side DOM scraping of rendered HTML table cells (such as splitting `"11/13"` in `features_done`) is brittle and bypasses Quarto's native `{ojs}` cell runtime.

## Decision

Chose **Approach 1: Quarto-Native Dual Theme (`custom.scss`) + Generator-Emitted `{ojs}` `.qmd` Pages** on branch `feat/modernize-quarto-site`. It integrates cleanly with Quarto 1.8.27's native Bootstrap 5 SCSS and `{ojs}` architecture, keeps `file:///` viewing working via R-inlined JSON, prevents blank pages offline via progressive AOS initialization, and leaves the 72 status and Plan pages as fast `.md` files.

## Next Steps

1. Run `/cg-plan` to create a 2-phase implementation Plan from `.cg-docs/brainstorms/2026-10-30-modernize-quarto-site.md`:
   - **Phase 1**: `site/_quarto.yml`, `site/custom.scss`, `site/assets/aos-init.html`, and `site/index.md` (theme, typography, dark/light glassmorphism, progressive AOS scroll animations, and landing page hero/grid/callouts).
   - **Phase 2**: `tools/pipsys/pipsys.R` and `tests/pipsys/test-pipsys.R` (`{ojs}` interactive charts with inlined JSON in `gen/overview.qmd`, `gen/roadmap.qmd`, and `gen/map.qmd`, unit tests, and full `tools\pipsys\pipsys.cmd site` render + `C:\` write verification).
