# Central Development Coordination Contract

Version: `pip-coordination-v2`, 2026-10-29 (rules reset, direct user
approval). It replaces `pip-coordination-v1`, which is in Git history
(commit `a0eb61f`). Reports written under v1 stay valid as history.

## Scope

This contract covers development coordination for the PIP packages, not
pipeline execution. `stamp` decides what reruns, and `pipdata` coordinates
releases (`SYSTEM_DESIGN.md:186,299-307`). The coordination directory is
`.cg-docs/orchestration/` under the registered main `pipsystem` checkout.
`ORCHESTRATOR.md` defines how `pip-orchestrator` behaves. Rules shared by
every agent (Autonomy, Git scope, pipsys, handoffs, development evidence, the
R rule) are in `AGENTS.md`; this file does not repeat them.

## Output Layout

```text
outputs/<project>/<task-id>/<run-id>/handoff.md
```

- `project`: package or repository slug, such as `stamp`, `pipdata`, `pipsystem`.
- `task-id`: stable slug for one piece of work.
- `run-id`: UTC timestamp plus a label, such as `20261029T162630Z-code`. One
  per attempt.

Supporting files (evidence, reviewer reports, logs) go in the same run folder.

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
- Each fact traces to a file and line, or is marked UNKNOWN; a run-time fact traces to the command and result recorded here, with the full SHA.
- No credentials, production data or raw conversations.
- A new attempt gets a new run folder. Never overwrite another run's report.
- v1 reports (initial JSON block and ten headings) stay readable. Tools read
  both formats.
- Timestamps in reports and run IDs are UTC (`Z`). Status tools, the site and
  messages to people show them in New York time (`America/New_York`, "ET").

## Internal Package Work

For authorized package work, the parent sends the worker the checkout path,
branch, full HEAD, scope, checks and exact report path directly. The worker
verifies the checkout, reads its instructions, makes only the authorized
changes there, and writes the v2 handoff here. The parent checks the diff
and test evidence (`ORCHESTRATOR.md`, "Dispatch and return").

## Metadata For User-Facing Commands And Prompts

Follow `ORCHESTRATOR.md`, "Metadata for user-facing commands and prompts": the
nine labels, template, tier table and placement rules. An assignment's Setup
card follows it.

## Final Response Endings And Git Checkpoints

Only `pip-orchestrator` ends conversational finals with **Next:** and **Need
from you:** (`ORCHESTRATOR.md`, "Accurate final response endings"). Its Git
checkpoint cadence is in `ORCHESTRATOR.md`, "Frequent logical checkpoints".
Neither grants authorization.

## Retained Formal Records (Paused)

See `ORCHESTRATOR.md`, "Retained Records". `templates/handoff.md` is the v1
template; the format above replaces it.

## Gaps

- Permissions after the rules reset were tested in a fresh session on
  2026-10-29 (`outputs/pipsystem/orchestrator-self-maintenance/20261029T171953Z-permission-test/handoff.md`).
- pipsys `handoffs` (`/pip-handoffs`) reads v2 and v1
  handoffs; older reports show UNKNOWN status. v2 frontmatter that is not
  valid YAML is read line by line, and multi-line fields then show UNKNOWN.
- The package-session pickup (`pip-pickup`, `pickup-path`) was retired on
  2026-11-25. Older runs under `outputs/` may still hold an
  `assignment.md`; they are records, not instructions.
