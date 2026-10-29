# CLI Reference

<!-- cg:auto:all-commands -->
## Do I Need A Command?

**Not for ordinary coordination.** Select the `pip-orchestrator` agent in Kilo
and send a normal message, such as:

> Refresh the handoffs and explain what needs my attention.

There is no required `pipsystem` terminal command or helper invocation for
reading reports, getting a status summary or preparing next-session prompts.
See [Usage](usage.md) for more example messages.

## Optional Task Workflows

Some prepared prompts may name a Compound GPID workflow for the working
session. These do not start work by themselves:

| Workflow | When it is relevant |
|---|---|
| `/cg-brainstorm --no-branch` | Requirements or design choices need discussion. |
| `/cg-plan` | Requirements are clear enough to prepare a plan. |
| `/cg-work` | Implement an approved plan and phase in the actual target repository. |
| `/cg-review --report-only` | Review work without editing the reviewed source. A saved review/handoff is still required. |

The target working session must inspect its installed command contract and
include all required report/lifecycle files in the approved scope. This list
is not proof that the command is available or identical in every repository.
Do not run a `pipsystem` umbrella plan as package-local implementation work.

Sources: [ORCHESTRATOR.md](../ORCHESTRATOR.md), lines 20-30, 83-95 and 218-252;
[Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 72-82.
<!-- cg:auto:end -->

<!-- cg:auto:full-options -->
## Approval Still Matters

A proposed prompt or command name is not execution approval. You choose the
task and authorize its exact scope. Branch/worktree changes, package writes,
roadmap changes and Git publication require their applicable separate approval.
The orchestrator itself does not execute those operations.

Do not use the retained helper CLI as an everyday shortcut. The simple
workflow is to read saved reports and advise, not activate the deferred
registry/state machinery.

## Keeping This Wiki Useful

This is a repository wiki: ordinary Markdown files under `wiki/`, linked from
the root [README](../README.md). It is not a separately published GitHub Wiki
site or an automatic monitoring service.

For future documentation tasks, prefer a short, plain-language page or section
with an example and links to the current authoritative files. Keep changing
project status in handoffs; use the wiki for stable working instructions.
When rules change, update the relevant guide rather than copying old status
claims into it.

The [Wiki Manifest](_wiki.yml) lists pages and their ownership. Existing guide
sections use `cg:auto` comment markers; content outside those markers is
user-owned and must be preserved. New pages/managed sections should be added
to the manifest, linked from the Home page and checked for broken links.
Manual-owned pages must not be rewritten by wiki automation. Update the
manifest's `lastUpdated` when a documentation update is completed.

## Gaps

- This is not a complete inventory of every tool installed in every PIP
  repository. A target session checks its own available workflows.
- The wiki does not implement or authorize a pipeline, worker start, source
  change, commit or push.

Sources: [ORCHESTRATOR.md](../ORCHESTRATOR.md), lines 32-45, 96-116, 218-252
and 365-431; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md),
lines 13, 23 and 72-86; [Wiki Manifest](_wiki.yml), lines 1-50.
<!-- cg:auto:end -->

← [Home](README.md)
