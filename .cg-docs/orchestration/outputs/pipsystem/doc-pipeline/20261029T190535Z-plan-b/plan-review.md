# Plan Review: Documentation pipeline (r1)

Route: `/cg-plan-review` run by pip-orchestrator, 2026-10-29. Reviewer:
`cg-plan-critic` subagent (session `ses_e76f20c68ffeEvGTPolSN31h7u`),
read-only. User decision for every finding: fix (user prompt
2026-10-29T17:19:24Z).

| ID | Finding | Decision | Fix in r2 |
|----|---------|----------|-----------|
| P2.1 | Local vs package citations cannot be told apart by file existence (`notes/pipaux.md:7-8,42` cite package-relative `R/utils.R:490-500`). | fix | R3 convention: first path segment that is a package name from `packages.csv` (not pipsystem) = package citation, "not checked"; all others local and checked, existing or not. Fixtures for a missing local file, a package citation and a comma list. |
| P2.2 | The meaning check had no saved baseline. | fix | Coordinator saves `checked.md` in the run folder; meaning mode compares it with the simplified target in both directions. |
| P2.3 | A same-session trial does not test `/pip-doc`, registration or the checker's permission. | fix | Trial 1 in this session with the exact agent bodies; Trial 2 (V5, now required) runs `/pip-doc` in a session started after the files exist. Starting that session needs user confirmation, so V5 may stay open. |
| P2.4 | "Record and continue" contradicted the stop rule. | fix | Iteration Policy separates implementation fixes from document checks; failed checks block later steps and completion. |

Findings requiring revision: 4. Accepted risks: 0. Deferred: 0.

Re-review of r2 (same reviewer): P2.1-P2.4 closed. New P2.5: the iteration policy's blanket stop rule contradicted R2's writer correction round. Fixed in r2: a failed first facts round permits only the writer correction and the second facts check; later failures block.
