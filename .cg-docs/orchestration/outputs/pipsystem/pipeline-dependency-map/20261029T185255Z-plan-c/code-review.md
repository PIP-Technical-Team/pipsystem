# Code Review: Pipeline dependency map (review:auto, mode data-risk)

Run by pip-orchestrator, 2026-10-29. Mode `data-risk` (the map documents
welfare, deflation and estimate dependencies,
`.kilo/shared/review-routing.contract.md:58`). The eight standard roles were
consolidated into three read-only subagents (work report D5). User decision:
fix all findings, including P3.

| ID | Sev | Reviewer | Finding | Fix |
|----|-----|----------|---------|-----|
| DQ-1 | P2 | data-quality | Edges 1->3, 1->4, 2->3, 2->9, 4->6 lacked evidence for both ends | Both-side citations for every edge; 2->9 and 4->6 removed (facts kept as stage 9 and stage 6 input claims). |
| DQ-2 | P2 | data-quality | Stage 4 outputs mixed two claims | Split: columns (`notes/pipdata.md:71`), alias (`:107`). |
| DQ-3 | P2 | data-quality | Stage 2 outputs changed column-name case | `FileName`, `Checksum`, `Module`, `data_available`. |
| DQ-4 | P2 | data-quality | Stage 1 entry-point note overclaimed order | Reworded to `notes/pipaux.md:44,57`. |
| DQ-5 | P2 | data-quality | Wrong evidence class passed | `check_map` requires decided/open -> `SYSTEM_DESIGN.md`, harvested -> `notes/*.md`; tests. |
| DQ-6 | P2 | data-quality | Citation containment lexical only | `check_citations` calls `inside_root()`; junction test. |
| CQ-1 | P2 | code+tests | `map_page` crashed with zero edges | Links only when edges exist; stage-only test. |
| CQ-2 | P2 | code+tests | Trailing separators passed (`1,`, `,`) | Whole-list regex before splitting; tests. |
| CQ-3 | P2 | code+tests | Negative tests did not check row and message; no-owner case missing | Each case asserts row, message and count; registered package with no stage -> none; owned set exact. |
| CQ-4 | P3 | code+tests | Edge label could reach 41 characters | Hard cap 40, then word boundary; long-token test. |
| RV-0 | - | reproducibility+VC | No findings | None. |

Verify round: data-quality re-check: all six data findings verified, no new
findings. Code-quality re-check: all four code findings and the two added checks verified, no new findings.
