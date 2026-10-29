# Home

<!-- cg:auto:overview -->
## What This Project Is

`pipsystem` is the workspace for designing the PIP data pipeline, collecting
evidence and coordinating development work. The pipeline goal is simple:
**when data or code changes, rerun only the work affected by that change.**
That is the project aim, not a claim that every planned capability already works.

The `pip-orchestrator` agent helps you manage that work. It reads saved progress
reports, explains what is finished or blocked, and prepares instructions for
the next Code session. It does not run the production pipeline.

A **handoff** is a saved progress report: what a session did, what it checked,
what remains and where to find its results. See [Usage](usage.md) for the full
workflow and example messages.

## Where To Look

| Question | Start here |
|---|---|
| How do I work with the agent? | [Usage](usage.md) |
| What is this project trying to achieve? | [Project Charter](../compound-gpid.md) |
| What has been decided, and what is still open? | [System Design](../SYSTEM_DESIGN.md) |
| What source evidence has been collected? | [Harvest Brief](../HARVEST_BRIEF.md) and [Harvest Record](../HARVEST.md) |
| What are the agent's working rules? | [Orchestrator Rules](../ORCHESTRATOR.md) |
| What must a worker report contain? | [Handoff Template](../.cg-docs/orchestration/templates/handoff.md) |

This wiki is a user guide, not a replacement for approved decisions or agent
permissions. If a guide and an authoritative rule disagree, flag the mismatch
before the affected work. Do not quietly change a decided design item.

Sources: [Project Charter](../compound-gpid.md), lines 10-33;
[System Design](../SYSTEM_DESIGN.md), lines 5-18;
[Orchestrator Rules](../ORCHESTRATOR.md), lines 39-74 and 81-110.
Content reviewed: 2026-10-22.
<!-- cg:auto:end -->

## Contents
- [Usage](usage.md)
- [Configuration](configuration.md)
- [CLI Reference](cli-reference.md)

<!-- cg:auto:setup -->
## Open The Right Session

1. Open the main `pipsystem` checkout in Kilo, on branch `main`:
   `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`.
2. Select **`pip-orchestrator`** for project coordination.
3. If the agent list or instructions are stale, reload the editor's project
   configuration using the controls available in your client.
4. Keep auto-approve **ON**. This does not override an explicitly denied action.

There is no extra helper program or registration step to run before asking for
a status summary or next-session instructions. You do not need a particular
Kilo release for this documented workflow.

Use a **Code session** for separately approved edits, tests or Git operations.
Use **`pip-orchestrator`** to review saved results and advise you. The agent does
not start or manage those Code sessions for you.

Sources: [Orchestrator Rules](../ORCHESTRATOR.md), lines 7-37, 112-116 and
410-431; [Configuration](../kilo.json), lines 4-16 and 137-138.
<!-- cg:auto:end -->

<!-- cg:auto:quick-start -->
## Try This First

Send this to `pip-orchestrator`:

> Refresh the saved handoffs. In simple terms, tell me where each project
> stands, what is blocked, and what needs my attention. Clearly identify
> anything you do not know.

It should read the available reports, name the files behind its summary and
explain the last-known state. It should not guess about work that was never
saved or claim to be watching other sessions in the background.

**The basic cycle:** ask for a summary, choose the next task, approve and start
the appropriate Code session, let that session save its handoff, then ask the
orchestrator to refresh. The [Usage](usage.md) page walks through each step.

## Gaps

- Saved reports are not a live view of other chats. No report means no saved
  evidence was found within the area checked, not proof that no work happened.
- This guide describes the saved rules. It does not certify live client
  permissions, package runtime capabilities or production readiness.

Sources: [Orchestrator Rules](../ORCHESTRATOR.md), lines 81-110, 144-184 and
489-507; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 15-23.
<!-- cg:auto:end -->
