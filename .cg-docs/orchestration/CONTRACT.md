# Central Development Coordination Contract

Version: `pip-coordination-v2`, 2026-10-29 (rules reset, direct user
approval). It replaces `pip-coordination-v1`, which is in Git history
(commit `a0eb61f`). Reports written under v1 stay valid as history.

## Scope

This contract covers development coordination for the PIP packages, not
pipeline execution. `stamp` decides what reruns, and `pipdata` coordinates
releases (`SYSTEM_DESIGN.md:186,299-307`). The hub is
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/`.
`ORCHESTRATOR.md` defines how `pip-orchestrator` behaves.

## Output Layout

```text
outputs/<project>/<task-id>/<run-id>/handoff.md
```

- `project`: package or repository slug, such as `stamp`, `pipdata`, `pipsystem`.
- `task-id`: stable slug for one piece of work.
- `run-id`: UTC timestamp plus a label, such as `20261029T162630Z-code`. One
  per attempt.

Supporting files (evidence, reviewer reports, logs) go in the same run folder.

Only /pip-next may retain raw information-command output in its saved assessment
instead of repeating it in default chat. Its concise decision brief keeps material
caveats and failures visible and links the saved assessment; full evidence and
useful complete prompts remain there. The standalone /pip-status, /pip-overview
and /pip-handoffs commands still show their output as printed.

## Handoff Format (`pip-handoff-v2`)

```markdown
---
schema: pip-handoff-v2
project: pipdata
task: m2-engine-work
run: 20261029T162630Z-code
status: running            # running | blocked | partial | completed | cancelled | no-change
updated: 2026-10-29T16:40:00Z
owner: <session label>
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: <branch>
head: <full commit SHA, or UNKNOWN>
plan: <Plan path and revision, or NONE>
next: <one line: next action and who does it>
---

# <Title>

## Summary
What was done and the result.

## Changes
Files changed and commits made, or NONE.

## Checks run
Commands or checks and their results. Name required checks that did not run.

## Gaps
Limits, unknowns and open decisions. Never empty.
```

- Create the report at the start with `status: running`. Update it at
  checkpoints and before you stop.
- Each fact traces to a file and line, a command result or a SHA, or is
  marked UNKNOWN.
- No credentials, production data or raw conversations.
- A new attempt gets a new run folder. Never overwrite another run's report.
- v1 reports (initial JSON block and ten headings) stay readable. Tools read
  both formats.
- Timestamps in reports and run IDs are UTC (`Z`). Status tools, the site and
  messages to people show them in New York time (`America/New_York`, "ET").

## Metadata For User-Facing Commands And Prompts

Every command/prompt offered to the user to run or copy, including same-session
recommendations and saved execution prompts, includes these exact labels:

- **Project Name:** specific project/package context.
- **Branch:** default/current/new, actual name and existing/proposed status;
  current is not necessarily default.
- **Worktree Requirement:** Yes/No for a new git worktree; identify the new or
  existing checkout/worktree and its absolute path. A new branch alone does
  not require a new worktree.
- **Model Family Recommendation:** Powerful (Sol/Opus), Standard
  (Sonnet/Terra) or Small (Luna/Haiku), based on task complexity, not the
  model generating the response. Examples are not availability guarantees.
- **Effort:** low, medium, high or extra high, as task-based advice.
- **Target Project:** project/package name and absolute repository root.
- **Target Environment:** consistent branch, path and new/existing status.
- **Target Agent:** Code mode or pip-orchestrator, as appropriate.

Use the template and tier guidance in ORCHESTRATOR.md. Place the header above
the copyable command/prompt, or immediately after a required line-1 slash
command, before the task body; never embed it in shell syntax. A header can
cover a contiguous block only if all commands share its context/recommendation.
Saved prompts contain the header. Unknown values stay UNKNOWN with the needed
verification named. It is advice, not execution, branch/worktree, Git or
model/provider/variant/client-setting authority. Internal tool calls,
historical examples and verbatim source output are excluded; do not rewrite
historical reports or change information-command output to add headers.

The copyable command starts with its slash command on line 1. The prompt
names the repository root, the branch, the Plan path and revision, the goal
and scope, the check that shows the work functions, what needs the user, the
Minimal first rules in short form, and the exact absolute report path and
format. `ORCHESTRATOR.md` gives the full list.

## Git Checkpoints

For pip-orchestrator tasks with explicit commit authorization, commit each
completed and checked logical stage promptly, rather than accumulating the
whole task's finished changes. A reviewed Plan, verified implementation step,
resolved review/fix set and stable handoff are useful boundaries, not every
edit or transient status update. Push each checkpoint promptly when push is
also authorized; commit permission alone does not authorize push or merge.

Stage only owned task changes, including intended source, tests, docs, Plans
and reports. Preserve unrelated or mixed-owner work; never add secrets,
private data or ignored runtime files to obtain a clean worktree. Report
commit SHAs, push outcomes and remaining dirty paths/owners or blockers.
The final report commit SHA may be returned in the reply without editing
that same report again. This cadence creates no standing Git authorization
and does not weaken the existing safety or approval rules.

## Retained Formal Records (Paused)

`registry.json`, `projects/*`, `control/*`, `views/*`, `templates/*`,
`STATE.md`, `REQUESTS.md` and `tools/pip-orchestration.mjs` with its tests
belong to a paused formal workflow. Keep them. Do not use or update them.
`templates/handoff.md` is the v1 template; the format above replaces it.

## Gaps

- Permissions after the rules reset were tested in a fresh session on
  2026-10-29 (`outputs/pipsystem/orchestrator-self-maintenance/20261029T171953Z-permission-test/handoff.md`).
- `tools\pipsys\pipsys.cmd handoffs` (`/pip-handoffs`) reads v2 and v1
  handoffs; older reports show UNKNOWN status. v2 frontmatter that is not
  valid YAML is read line by line, and multi-line fields then show UNKNOWN.
- Workers in other repositories see this format only through their prompts.
