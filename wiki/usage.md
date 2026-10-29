# Usage

<!-- cg:auto:commands -->

## The Everyday Workflow

**Other sessions do the work and leave reports. The orchestrator reads the reports and prepares the next instructions. You stay in control.**

1.  **Ask for an overview.** In the main `pipsystem` checkout, select `pip-orchestrator` and ask it to refresh the saved handoffs. You can ask about all available projects or focus on one project or task.
2.  **Read its summary.** It should explain the last-known stage, blockers, missing evidence and suggested next action, with source file references.
3.  **Ask for instructions for the next task.** The prompt should say what to do, which project/session to use, which files may change, what to check, and exactly where to save the result. It is a proposal, not permission to start work automatically.
4.  **Approve the work and start the appropriate Code session yourself.** Pass it the prepared instructions. Package work belongs in that package's own approved repository, not in `pipsystem`.
5.  **Let the working session save its handoff.** It must update that file at important checkpoints, including before stopping with a blocker, and read it back before claiming the result was saved.
6.  **Return to the orchestrator and ask it to refresh.** It can discover the newly saved report without you supplying its filename. You may also give an exact report path when you want a focused review.

If you want an approved existing Code session to continue a small task, say so explicitly. A suggestion from the orchestrator is not permission to create a new session, branch or worktree. It should not invent another task when the requested work is complete.

Sources: [Orchestrator Rules](../ORCHESTRATOR.md), lines 81-113, 139-184, 200-248 and 277-314; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 17-23 and 68-80. <!-- cg:auto:end -->

<!-- cg:auto:flags -->

## Where Reports Go

Every coordinated session saves its handoff in the **main `pipsystem` checkout**, even when its implementation work belongs to another repository.

The layout, relative to that checkout, is:

``` text
.cg-docs/orchestration/outputs/<project>/<task>/<run>/handoff.md
```

The shared root on this workspace is:

``` text
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/
```

This is a layout illustration, not a destination to use literally. The orchestrator fills in a unique, exact absolute file path in each proposed worker prompt. **You do not need to invent folder names or write the report's JSON metadata by hand.** The working session follows the [Handoff Template](../.cg-docs/orchestration/templates/handoff.md).

## What The Handoff Must Explain

- Which task and session it belongs to, when it was updated and its status.
- What it actually did and which files it changed.
- Where the results and supporting evidence are saved.
- Which checks ran, what happened, and which checks did not run.
- What is blocked, unknown or still unfinished.
- What should happen next, or that no further action is needed.

The template also records Git and scope details. Unknown facts must say `UNKNOWN`; they must not be guessed. A tested content version, a merge commit and the repository's current commit are not automatically the same thing.

Keep the useful detail in the report, not only in chat. A message saying "finished" is not a complete handoff. Blocked, partial, read-only and no-change tasks still need a saved report. Use a separate run folder for a different attempt; never overwrite another worker's report.

If the working session cannot write to its assigned central path, it must say so. An independently authorized caller may save an attributed report; otherwise stop that reporting action. Do not bypass the restriction or pretend the file was saved. Do not change permissions simply to make a report write succeed.

Reports and supporting copies must contain no credentials, production data, private session storage or raw chat transcripts. Use sanitized evidence when the orchestrator cannot read a canonical artifact.

Sources: [AGENTS.md](../AGENTS.md), lines 19-64; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 38-70 and 80; [Orchestrator Rules](../ORCHESTRATOR.md), lines 254-341. <!-- cg:auto:end -->

<!-- cg:auto:examples -->

## Example Messages

These are messages to the orchestrator, not commands that start workers.

### Get A General Update

> Refresh the saved handoffs. In simple terms, tell me where each project stands, what is blocked, and what needs my attention.

### Focus On One Project

> Focus only on pipdata. Read its available handoffs and explain its last-known status. Clearly identify anything you do not know. Do not change files.

### Prepare The Next Instructions

> Based on the latest handoffs, prepare instructions for the next stamp task, if one is needed. Include what the Code session should do, what it should check, and exactly where it must save its handoff. Do not start a session.

### Review A Saved Result

> The stamp session has saved its handoff. Refresh the reports, review its result, and tell me what remains. Distinguish what the worker reported from what the saved evidence actually verifies.

### Find Out Why Something Is Blocked

> Explain the blocker in plain language. Tell me what is missing and whether you need a decision from me or a saved correction from the working session. Give useful advice without inventing facts or starting another task.

## When Something Is Missing

| Situation | What to expect |
|------------------------------------|------------------------------------|
| The session says it finished, but there is no report | The orchestrator identifies the missing handoff; chat alone does not prove completion. |
| A report is old or incomplete | It explains the last-known state and the gaps; it does not refuse all useful advice. |
| Two reports disagree | It keeps the conflict visible rather than picking a winner from folder dates. |
| You do not know the new report's filename | Ask for a refresh; it discovers saved reports within its stated coverage. |
| A directory or file read is denied | It reports the exact coverage gap; it does not bypass the restriction. |
| Nothing else is needed | It says the task is complete rather than inventing another continuation. |

An incomplete or older free-text report can still be useful. Formal task registration, schema validation and the retained helper's activation status are not prerequisites for reading it and giving qualified advice.

## Gaps

- The orchestrator knows what sessions saved, not everything they did in chat.
- Refresh happens while it is active, not through a background watcher.
- Reading a claim that tests passed does not prove those tests ran or establish current-commit release readiness. Missing evidence remains explicit.

Sources: [Orchestrator Rules](../ORCHESTRATOR.md), lines 144-184, 211-248, 329-363 and 423-429; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 15-23 and 60-70. The message wording above is suggested usage, not a new permission grant or approval of any example task. <!-- cg:auto:end -->

← [Home](README.md)