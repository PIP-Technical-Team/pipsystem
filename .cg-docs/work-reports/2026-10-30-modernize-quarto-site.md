# Execution Report: Modernize pipsystem Quarto review site presentation

- **Plan reference**: `.cg-docs/plans/2026-10-30-modernize-quarto-site.md`
- **Branch**: `feat/modernize-quarto-site`
- **Active deviation policy**: `autonomous` (stored `ask`; runtime override `deviate:auto`)
- **Review mode**: `review:auto`
- **Started**: `2026-10-30`
- **Completed**: `2026-10-30`

## Pre-Run vs Post-Run `C:` Baseline

- `C:\Users\wb384996\AppData\Local\quarto`:
  - Pre-run: recursive file count = `19`, max `LastWriteTimeUtc` = `2026-10-30T14:42:04.4589537Z`
  - Post-run: recursive file count = `19`, max `LastWriteTimeUtc` = `2026-10-30T14:42:04.4589537Z`
- `C:\Users\wb384996\AppData\Roaming\quarto`:
  - Pre-run: exists = `False`
  - Post-run: exists = `False`
- `C:\Users\wb384996\AppData\Local\deno`:
  - Pre-run: exists = `True` (pre-existing prior to run), recursive file count = `17`, max `LastWriteTimeUtc` = `2026-10-30T14:42:14.9576987Z`
  - Post-run: exists = `True`, recursive file count = `17`, max `LastWriteTimeUtc` = `2026-10-30T14:42:14.9576987Z`

## Completed Steps / Phases

- Initialized execution report and active-state handoff (`2026-10-30`).
- **Phase 1: Theme, Scroll Animations, and Landing Page** (`2026-10-30`):
  - Step 1: Created `site/custom.scss`, `site/assets/aos-head.html`, `site/assets/aos-body.html`, and updated `site/_quarto.yml`.
  - Step 2: Updated `site/index.md` with `.hero-banner`, 6-card `.grid` (`.pip-card`), and `.callout-note`/`.callout-tip` blocks.
  - Verified `V1` via `tools\pipsys\pipsys.cmd site` (exit code 0).
- **Phase 2: Generator `{ojs}` Interactive Charts and Verification** (`2026-10-30`):
  - Step 3: Added `roadmap_summary_data()`, `overview_data()`, `ojs_cell()`, `overview_page()`, and `roadmap_page()`, and updated `map_page()` and `build_site()` in `tools/pipsys/pipsys.R`; switched `gen/overview.qmd` and `gen/roadmap.qmd` links in `site/_quarto.yml` and `site/index.md`.
  - Step 4: Added unit tests in `tests/pipsys/test-pipsys.R` (`215` assertions passing, `0` failures) after red-phase verification, then verified `V2`, `V3`, `V4`, and `V5`.
- **Review & Convergence (`review:auto` + `/cg-review mode:verify`)** (`2026-10-30`):
  - Ran 8-agent `standard` (`data-risk` emphasis) review (`.cg-docs/reviews/2026-10-30-modernize-quarto-site-review.md`): 0 P0, 0 P1, 2 P2, 4 P3.
  - Fixed all 4 in-scope findings (`P2.1` table `overflow: hidden` blocking sticky headers in `site/custom.scss`, `P3.1` dynamic `roadmap_statuses` test assertion in `tests/pipsys/test-pipsys.R`, `P3.2` position-independent offline table wording in `tools/pipsys/pipsys.R`, and `P3.3` nonexistent configured package path note in `overview_data()` + test in `tests/pipsys/test-pipsys.R`); recorded `P2.2` (`.gitignore` outside Plan boundaries) and `P3.4` (cross-command snapshot caching deferred to Later) as `skipped`.
  - Reran `V1`–`V5` (`PASS 215, FAIL 0`; `pipsys.cmd site`, `overview`, and `check-map` exit 0; `C:` baseline unchanged).
  - Ran `/cg-review mode:verify` (`.cg-docs/reviews/2026-10-30-modernize-quarto-site-verify-review.md`): 0 findings (`@cg-code-quality` and `@cg-testing` passed).

## Deviations

- **D1 (`autonomous`, V5 baseline)**: `C:\Users\wb384996\AppData\Local\deno` already existed before `/cg-work` started (`17` files, max `LastWriteTimeUtc = 2026-10-30T14:42:14.9576987Z`). Under `deviate:auto`, recorded the exact pre-run file count and max `LastWriteTimeUtc` for `Local\deno` alongside `Local\quarto` (`19` files, `2026-10-30T14:42:04.4589537Z`) and `Roaming\quarto` (`False`) and verified in `V5` that all three remained completely unchanged post-run.
- **D2 (`autonomous`, `overview_data` missing-path `note` column)**: When all rows in `packages.csv` had empty paths (as in `make_map_root()`), `overview_data()`'s missing-path return row lacked `note = NA_character_`, causing `table[!is.na(note) & nzchar(note), ...]` to fail when `pipsystem` was absent from `packages.csv`. Added `note = NA_character_` to the missing-path row in `overview_data()`.
- **D3 (user-approved, `file://`-compatible `Plot` charts without `{ojs}` ES module blocker)**: Quarto 1.8.27's `{ojs}` compiler injects `<script type="module" src="../site_libs/quarto-ojs/quarto-ojs-runtime.js">` (blocked by browser CORS on `file://`) and `if (window.location.protocol === "file:") { alert("The OJS runtime does not work with file:// URLs. Please use a web server to view this document."); }`. Per user instruction, replaced `{ojs}` cells with raw HTML (` ```{=html} `) blocks using standard UMD scripts (`d3@7/dist/d3.min.js` and `@observablehq/plot@0.6/dist/plot.umd.min.js` in `site/assets/aos-head.html`) and native HTML `<input type="radio">` / `<select>` controls so all interactive charts and filters work directly on `file://` URLs with zero alerts.

## Accepted Exceptions

- None.

## Evidence Table

| ID | Phase | Evidence Required | Command/Artifact | Required | Status |
|----|-------|-------------------|------------------|----------|--------|
| V1 | 1 | `tools\pipsys\pipsys.cmd site` exits 0; `site/_site/index.html` contains `.hero-banner`, `.pip-card`, `.callout`, and AOS includes with all links resolving; compiled bootstrap CSS under `site/_site/site_libs/bootstrap/` contains `body.quarto-light` and `body.quarto-dark` token rules | `tools\pipsys\pipsys.cmd site`; `Select-String` on rendered HTML/CSS | yes | passed |
| V2 | 2 | Unit tests in `tests/pipsys/test-pipsys.R` pass (0 failures) covering `overview_page()` (`null` for `"UNKNOWN"`/`"-"`), `roadmap_page()` (`"active"` status and missing file), `map_page()` (nonempty `## Gaps` and no `-->` on stage-only maps), and `build_site(render = FALSE)` | `Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"` (`PASS 215, FAIL 0`) | yes | passed |
| V3 | 2 | Full site regeneration and Quarto render exits 0; `site/_site/gen/overview.html`, `roadmap.html`, and `map.html` exist and contain rendered `{ojs}` cells, intact Markdown tables, and nonempty `Gaps` sections | `tools\pipsys\pipsys.cmd site`; `Select-String` on rendered HTML | yes | passed |
| V4 | 2 | CLI `tools\pipsys\pipsys.cmd overview` and `tools\pipsys\pipsys.cmd check-map` exit 0 with unchanged plain-Markdown output | `tools\pipsys\pipsys.cmd overview`; `tools\pipsys\pipsys.cmd check-map` | yes | passed |
| V5 | final | Pre-run vs post-run recursive file count and max `LastWriteTimeUtc` under `C:/Users/wb384996/AppData/Local/quarto` (and pre-existing `Local/deno`) are identical, `C:/Users/wb384996/AppData/Roaming/quarto` does not exist, and `git status --short` shows only intended files in `pipsystem` | PowerShell baseline comparison; `git status --short` | yes | passed |

## Constraints Check

| ID | Phase | Constraint | Check | Status |
|----|-------|------------|-------|--------|
| C1 | 1 | Process-local `TEMP`, `TMP`, `TMPDIR`, `LOCALAPPDATA`, `APPDATA`, and `DENO_DIR` point to `.tmp/pipsys` on `E:` and leave monitored `C:` Quarto/Deno paths unchanged | V5 | passed |
| C2 | 2 | No fabrication (`"UNKNOWN"`/`"-"` counts serialize as `null`, never `0`) and every generated summary page (`overview`, `roadmap`, `map`) has a nonempty `## Gaps` section | V2, V3, V4 | passed |
| C3 | final | No edits to any PIP package repository, `SYSTEM_DESIGN.md`, `compound-gpid.md`, or `roadmap.json` | V5 (`git status --short`) | passed |

## Remaining Uncertainty

- Interactive `{ojs}` charts (`Plot` and `Inputs`) and `AOS` scroll animations load browser runtime assets from `https://cdn.jsdelivr.net/npm/` when viewed with internet access; when viewed offline, `aos-body.html` skips adding `data-aos` so all sections remain visible (`opacity: 1`) and the static Markdown tables below every `{ojs}` block remain readable.

## Final Status

`completed`
