Facts check round 2 of trial 1c (pip-doc-checker body, general subagent, 2026-10-29). Full table: 102 rows; 0 `unsupported`, 0 `wrong`, 0 `uncited`. Rows that are not `supported` (verbatim):

| # | claim | verdict | evidence |
|---|---|---|---|
| 22 | Overview places the roadmap after the package table. | broad | Narrow to `tools/pipsys/pipsys.R:994-995`: `"## Packages"` followed by `"## Roadmap"`. |
| 37 | The workflow runs a factual checker. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:29-30`: "Checker, facts"; `MODE facts` and `DOCUMENT TARGET`. |
| 38 | The factual-checking stage permits at most one correction round. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:30-34`: one writer retry, then block on remaining failures. |
| 45 | The workflow saves checker reports in the run directory. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:30,33,38-39`: `RUN/facts-1.md`, `RUN/facts-2.md`, `RUN/meaning.md`. |
| 49 | `check-map` checks map columns. | broad | Narrow to `tools/pipsys/pipsys.R:537-538`: `setdiff(MAP_COLUMNS, names(map))`; `"missing columns"`. |
| 51 | `check-map` checks stage identifiers. | broad | Narrow to `tools/pipsys/pipsys.R:571-573`: `"stage id '%s' is not 1-10"`. |
| 52 | `check-map` checks edge identifiers. | broad | Narrow to `tools/pipsys/pipsys.R:584-589`: parses `<stage>-><stage>` and checks endpoints. |
| 54 | `check-map` requires edge carries rows. | broad | Narrow to `tools/pipsys/pipsys.R:592-595`: `"edge %s has no carries row"`. |
| 64 | `install-kilo` overwrites matching files. | broad | Narrow to `tools/pipsys/pipsys.R:822-823`: `file.copy(f, dest, overwrite = TRUE)`. |

(The checker's reply has exactly these 9 `broad` rows and no other non-supported row; its own summary line, below, says 11 `broad` and 91 `supported` out of 102 rows, which does not add up: 102 rows = 93 supported + 9 broad. The miscount is the checker's.)

summary: supported 91, broad 11, unsupported 0, wrong 0, uncited 0

Note: the coordinator saved the non-supported rows it could copy and the summary line; the supported rows were returned by the checker and are not repeated here.
