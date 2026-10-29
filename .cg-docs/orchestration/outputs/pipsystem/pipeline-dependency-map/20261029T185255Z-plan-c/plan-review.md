# Plan Review: Pipeline dependency map as data (r1)

Route: `/cg-plan-review` run by pip-orchestrator, 2026-10-29. Reviewer:
`cg-plan-critic` subagent (session `ses_e76fcd4cbffeQqDUPhXOXuLOMJ`),
read-only. User decision for every finding: fix (user prompt
2026-10-29T17:19:24Z).

| ID | Finding | Decision | Fix in r2 |
|----|---------|----------|-----------|
| P2.1 | One `status` and one citation per row cannot describe rows that mix Decided target, harvested current code and Open mechanisms (`notes/pipdata.md:71`; `SYSTEM_DESIGN.md:194-203`). | fix | One file of claims, one claim per row, each with its own status and citation; a second citation is a second row. |
| P2.2 | UNKNOWN rows had no valid citation form; the check required a file and line for every row. | fix | `unknown` rows: value UNKNOWN, empty citation fields; all other rows need both; fixtures for both cases. |
| P2.3 | The check did not prove exactly ten unique stages. | fix | `check-map` requires stage ids 1-10 exactly once; missing and duplicate fixtures. |
| P3.1 | Tables-only fallback contradicted the required flowchart evidence. | fix | Fallback removed; V3 defines the rendered evidence (`mermaid` element, edge text, Mermaid script). |

Findings requiring revision: 4. Accepted risks: 0. Deferred: 0.
Side ideas: none beyond the Plan's Later list.

Re-review of r2 (same reviewer): P2.1-P3.1 closed. New P3.2: a second citation row for a stage name conflicted with the once-per-stage rule. Fixed in r2: completeness counts distinct name values (repeated identical names allowed, different names fail).
