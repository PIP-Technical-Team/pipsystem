# Plan Review: pipsystem info tools v1 (r1)

Route: `/cg-plan-review` run by pip-orchestrator, 2026-10-29. Reviewer:
`cg-plan-critic` subagent (session `ses_e7736caf5ffeUmriEHI42HMh1t`),
read-only. User decision for every finding: fix (user prompt
2026-10-29T17:19:24Z, "fix all findings").

| ID | Finding | Decision | Fix in r2 |
|----|---------|----------|-----------|
| P1.1 | Quarto state planned in `E:/PovcalNet/01.personal/wb384996/tools/quarto-home/`, outside pipsystem; violates `AGENTS.md` rule 1 and `compound-gpid.md:26`. | fix | State moved to `<repo>/.tmp/pipsys/quarto-home/{local,roaming,deno}`; Boundaries updated. The empty `tools/quarto-home` folders made during step 3 were removed. |
| P2.1 | Copied design and Plan pages keep relative links that break in `site/gen/` (for example `SYSTEM_DESIGN.md:123`; pipdata `.cg-docs/plans/2026-04-27-logging-integration-tests.md:20,44,165-167`, pipdata HEAD `8cde5c5efd4ab87f419661221f202205e5e87214`). | fix | Link policy: relative targets become absolute `file:///` links to the source file; `Source:` line on each copied page; test and V3 check for one `file:///` link. |
| P3.1 | Overview columns undefined. | fix | Ordered column list, unknown-path row form and roadmap summary columns in step 1; test asserts header order and row count. |

Findings requiring revision: 3. Accepted risks: 0. Deferred: 0.
Side ideas: none beyond the Plan's existing Later list; no roadmap change.
