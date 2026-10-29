Facts check round 2 of trial 1b (pip-doc-checker body, general subagent, 2026-10-29). Full table: 106 rows; 103 `supported`. Rows that are not `supported` (verbatim):

| # | claim | verdict | evidence |
|---|---|---|---|
| 22 | `/pip-status` reports on one configured package. | unsupported | Cited `tools/pipsys/pipsys.R:854-860,898-910` shows package-specific output, but not configured-package validation. |
| 61 | `check-doc` checks local citation line ranges. | unsupported | Cited `tools/pipsys/pipsys.R:741-769` calls `check_citations`; line-range logic is outside this range. |
| 82 | `site` deletes and recreates `site/gen`. | broad | Narrow to `tools/pipsys/pipsys.R:1121-1122`: `unlink(gen, recursive = TRUE)`; `dir.create(gen, recursive = TRUE)`. |

summary: supported 103, broad 1, unsupported 2, wrong 0, uncited 0

Note: the coordinator saved the three failing rows verbatim and the summary line; the 103 supported rows were returned by the checker and are not repeated here.
