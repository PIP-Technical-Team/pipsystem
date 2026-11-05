---
schema: pip-handoff-v2
project: pipsystem
task: pip-next
run: 20261102T202426Z-orchestrator-plan-critic
status: completed
updated: 2026-11-02T20:30:30Z
owner: plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-pip-next.md revision 1
next: Coordinator revises Plan revision 1 to address the three P2 findings before implementation.
---

# pip-next Plan critique

## Summary
Review complete: 0 P0, 0 P1, 3 P2, 0 P3 findings. Review only; no implementation performed. The small prompt-only command and existing installer are appropriate; no new runtime planner, scheduler or dependency is needed.

## Findings

- **[P2.1] [cg-plan-critic] Step 1: R6 / assessment write boundary — Required information commands violate the stated output restriction.**
  **Issue**: The assessment may write only its new handoff, yet it must reuse information-command output. Those commands necessarily start R through a wrapper that creates temporary output outside the handoff.
  **Evidence**: Plan `.cg-docs/plans/2026-11-02-pip-next.md:38,45` restricts writes and requires raw source output. `tools/pipsys/kilo/commands/pip-overview.md:5-12` invokes the wrapper. `tools/pipsys/pipsys.cmd:9-18` creates `.tmp/pipsys`, redirects TEMP/TMP/TMPDIR there, and launches Rscript. `tools/pipsys/pipsys.R:19-20` documents these temporary writes. Plan `:57` already recognizes E-contained temporary paths for implementation tests but does not exempt them for command assessment.
  **Impact**: A literal implementation cannot satisfy R6 while following the mandatory source-output convention. A looser implementation silently expands its own write authority.
  **Fix**: Change R6 and the command contract to permit only the new assessment handoff plus process temporary files under the resolved E-contained checkout `.tmp/pipsys`. Keep package/state/site/roadmap edits prohibited. Reuse the existing wrapper; do not add another temporary-output framework.

- **[P2.2] [cg-plan-critic] Step 1: R5 / Risks — Prevent assessment feedback for blockers and recommendations, not just completion.**
  **Issue**: The explicit exclusion covers assessment conclusions as primary completion/approval evidence only. It does not prevent a prior assessment's blocked, in-progress, readiness or next-action conclusion from becoming evidence in the next assessment. The Plan also does not state the project/task identity used for assessment handoffs.
  **Evidence**: Plan `:37` protects package completion and `:63` excludes primary completion/approval evidence, while `:35` requires other task states. `tools/pipsys/pipsys.R:376-402` selects only the newest handoff per project/task; `:1047-1052` uses the latest project handoff for overview status. Current examples show why status scope matters: `.cg-docs/orchestration/outputs/pipsystem/m2-phase-3-local-plans/20261102T191207Z-orchestrator/handoff.md:20-22,30` reports completed planning with execution still blocked, not completed implementation. This is documentary evidence inspected here, not independent verification of package behavior.
  **Impact**: Repeated invocations can perpetuate an obsolete blocker/recommendation or obscure the underlying worker handoff, even while never certifying package completion. Recent assessment timestamps can appear fresher than the primary evidence they merely summarize.
  **Fix**: Save under an assessment-only pipsystem task such as `pip-next-pipdata` or `pip-next-global`, with a unique run ID and explicit assessment-only scope. Define completed as completion of assessment, not assessed work. Exclude prior assessment conclusions as primary authority for every task-state, blocker, readiness, approval and next-action claim; follow their original source citations and reread those sources. Raw information reports stay verbatim and separately labeled, even if they list assessments.

- **[P2.3] [cg-plan-critic] Steps 1-2: frozen behavioral cases / V4 — Exercise the actual command and the highest-risk evidence boundaries.**
  **Issue**: Sending frozen cases to a general subagent does not specify that it must execute the new command definition rather than answer a case synopsis. Isolation from live evidence is unspecified. The case list omits explicit feature/main/local-ref integration distinctions, recursive assessment evidence, and missing blocker/owner or incomplete parallel write-set evidence.
  **Evidence**: Plan `:46` lists the cases; `:52` says to run them through a general subagent; `:57,78` requires functional scenario results, not word-presence checks. The actual information layer cannot supply missing detail by itself: `tools/pipsys/pipsys.R:201-207` records an abbreviated HEAD and `:137-140` resolves pipsystem to the invoking checkout. Existing documentary examples show separate states that must not collapse: `.cg-docs/orchestration/outputs/pipsystem/m2-phase-3-readiness/20261102T135331Z-orchestrator/handoff.md:42-49,60` distinguishes canonical/feature/runtime identities; the later local-plans report `:54,59` records an absent worktree and feature ancestry into a newer local remote-tracking ref while canonical PROD remains behind. These reports are historical scenario inputs, not current verified Git facts.
  **Impact**: V4 can pass on sensible reasoning from a curated synopsis without testing command discovery, evidence selection, self-feedback exclusion, or uncertainty behavior. Global/scoped happy-path live runs do not deterministically exercise these failures.
  **Fix**: Specify a small, dependency-free behavioral protocol: each fixture provides frozen source/tool responses, required conclusions and forbidden claims; the worker follows the exact tracked/installed command body and may not consult unrelated live evidence or execute recommended work; save case IDs, outputs and pass/fail comparisons. Add cases for feature completion without target integration (including missing worktree and stale local tracking ref), a newer assessment contradicting original evidence, and UNKNOWN blocker/owner/write boundaries. Expected results should require targeted verification and conditional parallelism, never invented ownership or readiness. Extend existing stale/conflict cases where possible; do not build a scheduler or general evaluation framework.

## Changes
Only this report created and finalized. No Plan, implementation, installed command, test, package, Git history or branch changed. No commits, pushes or pipeline execution.

## Checks run
- Read entire revision 1 Plan and project charter, design, harvest brief, coordination contract and ORCHESTRATOR.md.
- Read command patterns for pip-overview, pip-status, pip-handoffs and pip-doc; read installer implementation, information readers, wrapper and the full existing test-pipsys.R suite.
- Read installed cg-plan-review and targeted review-routing/light-work contracts; checked local review configuration and context-loading rules.
- Read selected pipsystem-hosted readiness, Plan-only and pipaux handoffs for concrete conflicting/stale/integration evidence examples. Their package claims remain reported, not independently verified.
- Read-only Git confirmed main at the full SHA above; captured pre-existing modified/untracked paths. No package repositories read, so no additional package SHA ledger is required.
- No tests, installer, R process, package load, network request or command behavioral run executed. Review evidence consists of source/Plan inspection.
- Read system clock: 2026-11-02T15:30:30.9164778-05:00 (New York ET), corresponding to this report's UTC update.

## Gaps
- Implementation does not yet exist; this review cannot certify installed command behavior or future LLM outputs.
- Package Git, runtime identities, live remote state and approvals reported by historical handoffs were not independently reverified; findings do not assert them as current facts.
- Plan revisions and all three finding fixes remain the coordinator's work, outside this review-only worker's write authority.
