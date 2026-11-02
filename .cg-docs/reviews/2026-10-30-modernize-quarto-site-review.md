---
date: 2026-10-30
depth: standard
type: standard
plan: .cg-docs/plans/2026-10-30-modernize-quarto-site.md
findings:
  P2.1: fixed
  P2.2: skipped
  P3.1: fixed
  P3.2: fixed
  P3.3: fixed
  P3.4: skipped
---

## Review Report

**Review mode**: standard (with `data-risk` emphasis on summary table serialization)
**Files reviewed**: 7
**Findings**: 6 (P0: 0, P1: 0, P2: 2, P3: 4)

### P0 — BLOCKING (immediate remediation required)
None.

### P1 — CRITICAL (must fix before merge)
None.

### P2 — IMPORTANT (should fix)
- **[P2.1]** [cg-code-quality] `site/custom.scss:171` — [safe_auto] Table `overflow: hidden` creates a scrolling ancestor that prevents sticky `thead th` headers from sticking to the viewport on scroll.
  **Why**: Sticky table headers are a stated requirement (`R1`).
  **Fix**: Removed `overflow: hidden` on `table` and applied top corner radii directly to `table thead th:first-child` and `last-child`. (**Status**: `fixed`)
- **[P2.2]** [cg-version-control] `.gitignore:43` — [safe_auto] `.tmp/` is ignored at `.tmp/pipsys/` and `.tmp/pip-orchestration/` rather than `/.tmp/`.
  **Why**: Other subdirectories under `.tmp/` could be untracked.
  **Fix**: Skipped in this run because `.gitignore` is outside the authorized Plan file boundaries (`2026-10-30-modernize-quarto-site.md:172`) and `.tmp/pipsys/` is already ignored. (**Status**: `skipped`)

### P3 — MINOR (nice to have)
- **[P3.1]** [cg-testing] `tests/pipsys/test-pipsys.R:784-788` — [advisory] `roadmap_page()` test verifies `"active"` in JSON and Markdown table but does not assert that `roadmap_statuses` is dynamically derived from `roadmap_data.map(d => d.status)` and bound to `Inputs.select`.
  **Why**: Prevents regression to a static status list.
  **Fix**: Added assertions verifying the dynamic `roadmap_statuses` derivation and `Inputs.select(roadmap_statuses, ...)` binding in `tests/pipsys/test-pipsys.R`. (**Status**: `fixed`)
- **[P3.2]** [cg-documentation] `tools/pipsys/pipsys.R:677,1132,1192` — [safe_auto] `## Gaps` text says "the tables below work offline" even though `## Gaps` appears below the tables.
  **Why**: Position-independent wording avoids confusing readers at the bottom of the page.
  **Fix**: Updated wording to "any tables on this page remain readable offline" across `map_page()`, `overview_page()`, and `roadmap_page()`. (**Status**: `fixed`)
- **[P3.3]** [cg-data-quality] `tools/pipsys/pipsys.R:998-1002` — [safe_auto] Nonempty configured package paths whose directory does not exist set `note = NA_character_` in `overview_data()`, omitting them from `## Gaps`.
  **Why**: `R4` requires missing repository facts to appear in `## Gaps`.
  **Fix**: Set `note = sprintf("path %s does not exist", path)` when `nzchar(path) && !dir.exists(path)` in `overview_data()`, and added a test case in `tests/pipsys/test-pipsys.R`. (**Status**: `fixed`)
- **[P3.4]** [cg-performance] `tools/pipsys/pipsys.R:1360` — [advisory] `build_site()` invokes `repo_info()` and `plan_table()` in both `overview_page()` and the per-package `report_status()` loop.
  **Why**: Pre-existing behavior from Plan A; sharing a snapshot across CLI report functions would alter `report_status()` signatures.
  **Fix**: Deferred under Minimal First rule 2 (recorded for Later). (**Status**: `skipped`)

### ✅ Passed
- `cg-reproducibility`: No issues found
- `cg-architecture`: No issues found
