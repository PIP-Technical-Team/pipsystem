| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | A handoff records what was done. | supported | `.cg-docs/orchestration/CONTRACT.md:49`: “What was done and the result.” |
| 2 | A handoff records the result. | supported | `CONTRACT.md:49`: “What was done and the result.” |
| 3 | A handoff records commands or checks. | supported | `CONTRACT.md:55`: “Commands or checks and their results.” |
| 4 | A handoff records the results of commands or checks. | supported | `CONTRACT.md:55`: “Commands or checks and their results.” |
| 5 | A handoff records limits. | supported | `CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 6 | A handoff records unknowns. | supported | `CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 7 | A handoff records open decisions. | supported | `CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 8 | The contract covers development coordination for PIP packages. | supported | `CONTRACT.md:9`: “This contract covers development coordination for the PIP packages” |
| 9 | The contract does not cover pipeline execution. | supported | `CONTRACT.md:9-10`: “not pipeline execution.” |
| 10 | Reports belong under the specified absolute orchestration path, in `outputs/<project>/<task-id>/<run-id>/handoff.md`. | supported | `CONTRACT.md:12`: absolute orchestration hub; `:18`: “outputs/<project>/<task-id>/<run-id>/handoff.md” |
| 11 | `project` is a package or repository slug. | supported | `CONTRACT.md:21`: “`project`: package or repository slug” |
| 12 | `pipdata` and `pipsystem` are example project slugs. | supported | `CONTRACT.md:21`: “such as `stamp`, `pipdata`, `pipsystem`.” |
| 13 | `task-id` is a stable slug for one piece of work. | supported | `CONTRACT.md:22`: “`task-id`: stable slug for one piece of work.” |
| 14 | `run-id` is a UTC timestamp plus a label. | supported | `CONTRACT.md:23`: “`run-id`: UTC timestamp plus a label” |
| 15 | `20261029T162630Z-code` is an example run ID. | supported | `CONTRACT.md:23`: “such as `20261029T162630Z-code`.” |
| 16 | There is one run per attempt. | supported | `CONTRACT.md:23-24`: “One per attempt.” |
| 17 | Evidence belongs in the same run folder. | supported | `CONTRACT.md:26`: “Supporting files (evidence, reviewer reports, logs) go in the same run folder.” |
| 18 | Reviewer reports belong in the same run folder. | supported | `CONTRACT.md:26`: “Supporting files (evidence, reviewer reports, logs) go in the same run folder.” |
| 19 | Logs belong in the same run folder. | supported | `CONTRACT.md:26`: “Supporting files (evidence, reviewer reports, logs) go in the same run folder.” |
| 20 | Each new attempt gets a new run folder. | supported | `CONTRACT.md:66`: “A new attempt gets a new run folder.” |
| 21 | Another run's report must never be overwritten. | supported | `CONTRACT.md:66`: “Never overwrite another run's report.” |
| 22 | Create the report at the start with `status: running`. | supported | `CONTRACT.md:61`: “Create the report at the start with `status: running`.” |
| 23 | Update the report at checkpoints. | supported | `CONTRACT.md:61-62`: “Update it at checkpoints and before you stop.” |
| 24 | Update the report before stopping. | supported | `CONTRACT.md:61-62`: “Update it at checkpoints and before you stop.” |
| 25 | Use the `pip-handoff-v2` format. | broad | Narrower evidence: `CONTRACT.md:28`: “Handoff Format (`pip-handoff-v2`)”; `:32`: “schema: pip-handoff-v2”. |
| 26 | The listed metadata fields are YAML frontmatter. | supported | `CONTRACT.md:31-44`: metadata enclosed in `---`; `:32-43` lists all named fields. |
| 27 | `schema` identifies the format. | supported | `CONTRACT.md:32`: “schema: pip-handoff-v2” |
| 28 | `project` identifies the project. | supported | `CONTRACT.md:33`: “project: pipdata” |
| 29 | `task` identifies the task. | supported | `CONTRACT.md:34`: “task: m2-engine-work” |
| 30 | `run` identifies the run. | supported | `CONTRACT.md:35`: “run: 20261029T162630Z-code” |
| 31 | `status` accepts `running`, `blocked`, `partial`, `completed`, `cancelled`, and `no-change`. | supported | `CONTRACT.md:36`: “running \| blocked \| partial \| completed \| cancelled \| no-change” |
| 32 | `updated` records the timestamp. | supported | `CONTRACT.md:37`: “updated: 2026-10-29T16:40:00Z” |
| 33 | `owner` names the session label. | supported | `CONTRACT.md:38`: “owner: <session label>” |
| 34 | `repo` records the repository path. | supported | `CONTRACT.md:39`: “repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata” |
| 35 | `branch` records the branch. | supported | `CONTRACT.md:40`: “branch: <branch>” |
| 36 | `head` records the full commit SHA. | supported | `CONTRACT.md:41`: “head: <full commit SHA, or UNKNOWN>” |
| 37 | `UNKNOWN` is allowed for `head`. | supported | `CONTRACT.md:41`: “head: <full commit SHA, or UNKNOWN>” |
| 38 | `plan` records the Plan path and revision. | supported | `CONTRACT.md:42`: “plan: <Plan path and revision, or NONE>” |
| 39 | `NONE` is allowed for `plan`. | supported | `CONTRACT.md:42`: “plan: <Plan path and revision, or NONE>” |
| 40 | `next` states the next action. | supported | `CONTRACT.md:43`: “next: <one line: next action and who does it>” |
| 41 | `next` states who performs the next action. | supported | `CONTRACT.md:43`: “next: <one line: next action and who does it>” |
| 42 | `next` is one line. | supported | `CONTRACT.md:43`: “next: <one line: next action and who does it>” |
| 43 | A title precedes the report sections. | supported | `CONTRACT.md:46`: “# <Title>”; `:48`: “## Summary”. |
| 44 | Include the four sections Summary, Changes, Checks run, and Gaps. | broad | Narrower evidence: headings at `CONTRACT.md:48,51,54,57`. |
| 45 | Summary states what was done. | supported | `CONTRACT.md:48-49`: “## Summary”; “What was done and the result.” |
| 46 | Summary states the result. | supported | `CONTRACT.md:49`: “What was done and the result.” |
| 47 | Changes lists files changed. | supported | `CONTRACT.md:51-52`: “## Changes”; “Files changed and commits made, or NONE.” |
| 48 | Changes lists commits made. | supported | `CONTRACT.md:52`: “Files changed and commits made, or NONE.” |
| 49 | Changes may contain `NONE`. | supported | `CONTRACT.md:52`: “Files changed and commits made, or NONE.” |
| 50 | Checks run lists commands or checks. | supported | `CONTRACT.md:54-55`: “## Checks run”; “Commands or checks and their results.” |
| 51 | Checks run includes check results. | supported | `CONTRACT.md:55`: “Commands or checks and their results.” |
| 52 | Checks run names required checks that did not run. | supported | `CONTRACT.md:55`: “Name required checks that did not run.” |
| 53 | Gaps contains limits. | supported | `CONTRACT.md:57-58`: “## Gaps”; “Limits, unknowns and open decisions.” |
| 54 | Gaps contains unknowns. | supported | `CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 55 | Gaps contains open decisions. | supported | `CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 56 | Gaps must never be empty. | supported | `CONTRACT.md:58`: “Never empty.” |
| 57 | Each fact must trace to a file and line, a command result, or a SHA; otherwise mark it `UNKNOWN`. | supported | `CONTRACT.md:63-64`: “a file and line, a command result or a SHA, or is marked UNKNOWN.” |
| 58 | Reports must not include credentials. | supported | `CONTRACT.md:65`: “No credentials, production data or raw conversations.” |
| 59 | Reports must not include production data. | supported | `CONTRACT.md:65`: “No credentials, production data or raw conversations.” |
| 60 | Reports must not include raw conversations. | supported | `CONTRACT.md:65`: “No credentials, production data or raw conversations.” |
| 61 | Report timestamps use UTC (`Z`). | supported | `CONTRACT.md:69`: “Timestamps in reports and run IDs are UTC (`Z`).” |
| 62 | Run IDs use UTC (`Z`). | supported | `CONTRACT.md:69`: “Timestamps in reports and run IDs are UTC (`Z`).” |
| 63 | Times shown to people use New York time, `America/New_York`. | supported | `CONTRACT.md:69-70`: “messages to people show them in New York time (`America/New_York`, "ET").” |
| 64 | Times shown to people are labeled `ET`. | supported | `CONTRACT.md:70`: “New York time (`America/New_York`, "ET").” |
| 65 | `tools\pipsys\pipsys.cmd handoffs` (`/pip-handoffs`) reads v2 handoffs. | supported | `CONTRACT.md:91-92`: “`tools\pipsys\pipsys.cmd handoffs` (`/pip-handoffs`) reads v2 and v1 handoffs” |
| 66 | The same command reads v1 handoffs. | supported | `CONTRACT.md:91-92`: “reads v2 and v1 handoffs” |
| 67 | Older reports show `UNKNOWN` status. | supported | `CONTRACT.md:92`: “older reports show UNKNOWN status.” |
| 68 | Invalid-YAML v2 frontmatter is read line by line. | supported | `CONTRACT.md:92-93`: “v2 frontmatter that is not valid YAML is read line by line” |
| 69 | Multi-line fields show `UNKNOWN` when that fallback is used. | supported | `CONTRACT.md:93`: “multi-line fields then show UNKNOWN.” |
| 70 | v1 reports remain readable. | supported | `CONTRACT.md:67`: “v1 reports (initial JSON block and ten headings) stay readable.” |
| 71 | `templates/handoff.md` is the v1 template. | supported | `CONTRACT.md:85`: “`templates/handoff.md` is the v1 template” |
| 72 | The contract's v2 format replaces the old template. | supported | `CONTRACT.md:85`: “the format above replaces it.” |
| 73 | Prompts assigning work to another session must include the exact absolute report path. | supported | `CONTRACT.md:77`: “the exact absolute report path and” |
| 74 | Those prompts must include the report format. | supported | `CONTRACT.md:77-78`: “the exact absolute report path and format.” |
| 75 | Workers in other repositories receive the format only through their prompts. | supported | `CONTRACT.md:94`: “Workers in other repositories see this format only through their prompts.” |
| 76 | The listed formal records and helper belong to a paused workflow. | supported | `CONTRACT.md:82-84`: listed records and helper “belong to a paused formal workflow.” |
| 77 | Do not use the listed retained records and helper. | supported | `CONTRACT.md:84`: “Keep them. Do not use or update them.” |
| 78 | Do not update the listed retained records and helper. | supported | `CONTRACT.md:84`: “Keep them. Do not use or update them.” |
| 79 | The cited handoff-reader description gives no example command output. | supported | `CONTRACT.md:91-93` describes supported formats and fallback behavior; no example output appears. |
| 80 | The cited handoff-reader description does not explain display columns. | supported | `CONTRACT.md:91-93` describes supported formats and fallback behavior; no display columns are explained. |

summary: supported 78, broad 2, unsupported 0, wrong 0, uncited 0
