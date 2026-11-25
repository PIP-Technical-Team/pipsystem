---
schema: pip-handoff-v2
project: pipsystem
task: historical-qmd
run: 20261125T214856Z-backfill
status: completed
updated: 2026-11-25T22:53:45Z
owner: cg-work
repo: /Users/acastanedaa/Developer/pip/pipsystem
branch: main
head: dcfd90671a25fd048162aead88e4674d3ec90e10
plan: .cg-docs/plans/2026-11-25-historical-quarto-record.md (preflight blob ac0c4de102eb3850d7cb94281f124170e4ee0303)
next: Implementation and standard review are complete; no publication is authorized.
---

# Historical Quarto record

## Summary

The canonical Plan validated. The checkout and both historical Plan blobs match the preflight pins.

Phase 1 accounts for 23 distinct keys in 23 records: `experiments/m0/index.qmd` (9 decisions and integration records), `experiments/m1/index.qmd` (8 harvest/findings records and 3 decisions), and `experiments/m2/phase-01/index.qmd` (Steps 01-03). No missing-source entry replaced a page. M1 remains in progress: the row-level decision is `idea` and the M1 design update is `active`. M2 Step 01 is a prerequisite, while Steps 02 and 03 are linked to the two `done` roadmap features.

Phase 2 added the path from the pipeline overview and the return routes. The offline render and link checks passed for all 29 pages.

## Changes

No staged paths at preflight. The existing unstaged path is `experiments/m2/index.qmd` (formatting-only). Preflight untracked paths: `.cg-docs/brainstorms/2026-11-25-m2-step06-format-validate.md`, `.cg-docs/orchestration/outputs/pipsystem/m2-step06-format-validate/20261125T214856Z-start/handoff.md`, and the selected Plan. No Git writes.

Backfill scope: 26 new QMDs under `experiments/m0/`, `experiments/m1/`, and `experiments/m2/phase-01/`; navigation-only edits to `experiments/pip-pipeline.qmd` and `experiments/m2/index.qmd`; this handoff, the work report, Plan progress metadata, and the active-state pointer. The earlier index formatting and Phase 2 text are preserved. A concurrent Step 06 Plan and Plan-review handoff appeared under `.cg-docs/`; this run did not modify them. Step 05, package code, tests, design and roadmap are unchanged.

## Checks run

- `cg-render-artifact --validate-only .cg-docs/plans/2026-11-25-historical-quarto-record.md`: PASS.
- `git rev-parse --show-toplevel HEAD @{upstream}` and `git status --short --branch --untracked-files=all`: expected root, above HEAD, `main` tracking `origin/docs/m2-machine-migration` at `58c7d7b34beea2316ec47227a3866977b41faf28`.
- `git rev-parse HEAD:.cg-docs/plans/2026-10-07-m0-m1-design-integration.md HEAD:.cg-docs/plans/2026-10-10-m2-walking-skeleton.md`: `c1b56faec72bfdaf18168eaa49be98083d453938` and `585a92a14760ca41062031c4af84108b6ddb1204`.
- `quarto --version`: 1.9.37.
- Phase 1 Python coverage check matched all 23 Plan keys to unique index entries and checked the required fields. Dated claim-specific comparisons and full source revisions are on each page; the historical M2 reports are not new runtime checks.
- Offline full-suite gate (`testthat::test_dir("tests/pipsys")`): 524 passed assertions, 12 failed assertions and 14 errors. The same cases failed before the documentation edits. User accepted this baseline-only exception; no Plan evidence was waived.
- Pinned reads: all eight historical package source commits were available. The M1 records identify current checkout SHAs, historical input pins and the hub output commit separately. The M1 harvest verification retrieved 149 package line ranges, 15 fit rows and 15 findings rows. Early M2 checked delivered contracts against the `stamp` producer pin and `pipdata` delivery pin, without loading a package.
- `quarto render <page> --no-execute`: 29 of 29 PASS. The scratch `_quarto.yml` set `project.type: website`, `project.output-dir: .`, and an explicit `project.render` list: `experiments/pip-pipeline.qmd`, all QMDs under `experiments/m0/`, `experiments/m1/` and `experiments/m2/phase-01/`, `experiments/m2/index.qmd`, and `experiments/m2/phase-02/step-05-download-one-survey.qmd`. Each render ran from the scratch project root with network access denied by macOS `sandbox-exec`. Staged only those source files and their 27 local evidence files, preserving relative paths. The temporary render tree was removed after checking.
- Python standard-library `HTMLParser` and relative URL resolution: 23 of 23 records and all indexes reachable from the overview and able to return; 562 local navigation hrefs including 496 valid fragments, and 110 local source-evidence hrefs to 27 files. Existing Step 05 was a forward-only check; it has no return link and was not changed. Two external hrefs were not fetched or counted as offline passes. Scans of QMD, HTML and copied evidence text found no credential-pattern matches; no survey data files were staged.
- Standard auto-review checked scope, evidence and safety. The P1 concern about reproducing HTML navigation is addressed by the exact scratch configuration above. The final render and link checks were rerun after clarifying the pipdata validation boundaries, corrected M2 candidate identity and limits, and M0 attribution.
- `git diff --check`, scope and pinned HEAD checks passed. No R code changed. No survey, shared storage, pipeline stage or production service was run.

## Gaps

Standalone Quarto rendering does not convert cross-page QMD links to HTML. The verified output used a scratch website project only; this backfill does not add site infrastructure or publish output. Package execution, live acceptance, numerical equivalence and deployment were not checked. The separate pre-existing R test failures remain open.
