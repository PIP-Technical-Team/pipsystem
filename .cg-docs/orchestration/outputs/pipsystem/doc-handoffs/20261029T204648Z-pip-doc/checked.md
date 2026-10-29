# Agent handoffs

A handoff records what was done. `.cg-docs/orchestration/CONTRACT.md:49`
It records the result. `.cg-docs/orchestration/CONTRACT.md:49`
It records commands or checks and their results. `.cg-docs/orchestration/CONTRACT.md:55`
It records limits, unknowns, and open decisions. `.cg-docs/orchestration/CONTRACT.md:58`
The contract covers development coordination for PIP packages, not pipeline execution. `.cg-docs/orchestration/CONTRACT.md:9-10`

## Where to save a handoff

Save the report under `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/<project>/<task-id>/<run-id>/handoff.md`. `.cg-docs/orchestration/CONTRACT.md:12,17-19`

- `project` is a package or repository slug, such as `pipdata` or `pipsystem`. `.cg-docs/orchestration/CONTRACT.md:21`
- `task-id` is a stable slug for one piece of work. `.cg-docs/orchestration/CONTRACT.md:22`
- `run-id` is a UTC timestamp plus a label, such as `20261029T162630Z-code`, with one run per attempt. `.cg-docs/orchestration/CONTRACT.md:23-24`

Keep evidence, reviewer reports, and logs in the same run folder. `.cg-docs/orchestration/CONTRACT.md:26`
Give each new attempt a new run folder; never overwrite another run's report. `.cg-docs/orchestration/CONTRACT.md:66`

## What to write and when

Create the report at the start with `status: running`, then update it at checkpoints and before stopping. `.cg-docs/orchestration/CONTRACT.md:61-62`
Use the `pip-handoff-v2` format. `.cg-docs/orchestration/CONTRACT.md:28-32`

The YAML frontmatter contains these fields: `.cg-docs/orchestration/CONTRACT.md:31-44`

- `schema`, `project`, `task`, and `run` identify the format and work. `.cg-docs/orchestration/CONTRACT.md:32-35`
- `status` accepts `running`, `blocked`, `partial`, `completed`, `cancelled`, or `no-change`. `.cg-docs/orchestration/CONTRACT.md:36`
- `updated` records the timestamp, and `owner` names the session label. `.cg-docs/orchestration/CONTRACT.md:37-38`
- `repo`, `branch`, and `head` record the repository path, branch, and full commit SHA, with `UNKNOWN` allowed for `head`. `.cg-docs/orchestration/CONTRACT.md:39-41`
- `plan` records the Plan path and revision, or `NONE`. `.cg-docs/orchestration/CONTRACT.md:42`
- `next` states the next action and who does it in one line. `.cg-docs/orchestration/CONTRACT.md:43`

After a title, include four sections: `.cg-docs/orchestration/CONTRACT.md:46-58`

- **Summary:** what was done and the result. `.cg-docs/orchestration/CONTRACT.md:48-49`
- **Changes:** files changed and commits made, or `NONE`. `.cg-docs/orchestration/CONTRACT.md:51-52`
- **Checks run:** commands or checks and their results, including required checks that did not run. `.cg-docs/orchestration/CONTRACT.md:54-55`
- **Gaps:** limits, unknowns, and open decisions; never leave it empty. `.cg-docs/orchestration/CONTRACT.md:57-58`

Trace each fact to a file and line, a command result, or a SHA; otherwise mark it `UNKNOWN`. `.cg-docs/orchestration/CONTRACT.md:63-64`
Do not include credentials, production data, or raw conversations. `.cg-docs/orchestration/CONTRACT.md:65`
Use UTC (`Z`) in report timestamps and run IDs. `.cg-docs/orchestration/CONTRACT.md:69`
Show times to people in New York time (`America/New_York`, labeled `ET`). `.cg-docs/orchestration/CONTRACT.md:69-70`

## How to read handoffs

Use `tools\pipsys\pipsys.cmd handoffs` (`/pip-handoffs`) to read v2 and v1 handoffs. `.cg-docs/orchestration/CONTRACT.md:91-92`
Older reports show `UNKNOWN` status. `.cg-docs/orchestration/CONTRACT.md:92`
When v2 frontmatter is not valid YAML, the reader processes it line by line and shows multi-line fields as `UNKNOWN`. `.cg-docs/orchestration/CONTRACT.md:92-93`
The v1 reports remain readable, but `templates/handoff.md` is the old v1 template, replaced by the contract's v2 format. `.cg-docs/orchestration/CONTRACT.md:67-68,85`

When assigning work to another session, include the exact absolute report path and format in its prompt. `.cg-docs/orchestration/CONTRACT.md:74-78`
Workers in other repositories receive the format only through their prompts. `.cg-docs/orchestration/CONTRACT.md:94`
Do not use or update the retained records and helper listed under the contract's paused formal workflow. `.cg-docs/orchestration/CONTRACT.md:80-84`

## Gaps

- UNKNOWN: the contract does not give an example of the handoff command's output or explain its display columns. `.cg-docs/orchestration/CONTRACT.md:91-93`
