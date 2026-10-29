Facts check round 1 of trial 1c (pip-doc-checker body, general subagent, 2026-10-29). Full table: 97 rows; 87 `supported`. Rows that are not `supported` (verbatim):

| # | claim | verdict | evidence |
|---|---|---|---|
| 21 | `overview` shows one row per configured package. | unsupported | Cited `tools/pipsys/pipsys.R:958-969,993-996` shows row fields and output, not iteration over configured packages. |
| 36 | The documentation workflow runs a writer. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:28`: "Writer. Subagent `pip-doc-writer`" |
| 38 | The workflow runs a simplifier. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:36`: "Simplifier. Subagent `pip-doc-simplifier`" |
| 39 | The workflow runs a meaning checker. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:37-38`: "Checker, meaning ... BEFORE ... and AFTER TARGET" |
| 40 | The workflow runs `check-doc`. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:42-43`: `pipsys.cmd check-doc "<TARGET>"` |
| 41 | The workflow writes the target document. | unsupported | Cited `tools/pipsys/kilo/commands/pip-doc.md:20-27,30-46` names TARGET but omits the writer invocation at line 28. |
| 42 | The workflow's run directory uses the documented project, slug, UTC timestamp, and `-pip-doc` suffix. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:20-22`: `outputs/pipsystem/doc-<SLUG>/<UTC time as yyyyMMddTHHmmssZ>-pip-doc` |
| 43 | The workflow saves a handoff in the run directory. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:26-27`: "Create RUN and `RUN/handoff.md`" |
| 45 | The workflow saves an exact checked copy in the run directory. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:35`: "Save an exact copy of TARGET as `RUN/checked.md`." |
| 46 | The workflow saves script-check output in the run directory. | broad | Narrow to `tools/pipsys/kilo/commands/pip-doc.md:42-43`: "save its output as `RUN/check-doc.md`" |

summary: supported 87, broad 8, unsupported 2, wrong 0, uncited 0

Note: the coordinator saved the ten non-supported rows verbatim and the summary line; the 87 supported rows were returned by the checker and are not repeated here.
