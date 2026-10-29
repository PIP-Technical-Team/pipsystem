| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | A handoff records what an agent did. | broad | `.cg-docs/orchestration/CONTRACT.md:48-49`: “What was done and the result.” |
| 2 | A handoff records its result. | broad | `.cg-docs/orchestration/CONTRACT.md:49`: “What was done and the result.” |
| 3 | A handoff records its checks. | broad | `.cg-docs/orchestration/CONTRACT.md:54-55`: “Commands or checks and their results.” |
| 4 | A handoff records what remains open. | broad | `.cg-docs/orchestration/CONTRACT.md:57-58`: “Limits, unknowns and open decisions. Never empty.” |
| 5 | The contract covers development coordination for PIP packages. | supported | `.cg-docs/orchestration/CONTRACT.md:9`: “This contract covers development coordination for the PIP packages” |
| 6 | The contract does not cover pipeline execution. | supported | `.cg-docs/orchestration/CONTRACT.md:9-10`: “not pipeline execution.” |
| 7 | Reports belong at the stated absolute hub path plus `outputs/<project>/<task-id>/<run-id>/handoff.md`. | supported | `.cg-docs/orchestration/CONTRACT.md:12`: absolute hub path; `:18`: “outputs/<project>/<task-id>/<run-id>/handoff.md” |
| 8 | `project` is a package or repository slug. | supported | `.cg-docs/orchestration/CONTRACT.md:21`: “package or repository slug” |
| 9 | `pipdata` and `pipsystem` are example project slugs. | supported | `.cg-docs/orchestration/CONTRACT.md:21`: “such as `stamp`, `pipdata`, `pipsystem`.” |
| 10 | `task-id` is a stable slug for one piece of work. | supported | `.cg-docs/orchestration/CONTRACT.md:22`: “stable slug for one piece of work.” |
| 11 | `run-id` is a UTC timestamp plus a label. | supported | `.cg-docs/orchestration/CONTRACT.md:23`: “UTC timestamp plus a label” |
| 12 | `20261029T162630Z-code` is an example run ID. | supported | `.cg-docs/orchestration/CONTRACT.md:23`: “such as `20261029T162630Z-code`.” |
| 13 | Each attempt gets one run ID. | supported | `.cg-docs/orchestration/CONTRACT.md:23-24`: “One per attempt.” |
| 14 | Evidence belongs in the same run folder. | supported | `.cg-docs/orchestration/CONTRACT.md:26`: “Supporting files (evidence, reviewer reports, logs) go in the same run folder.” |
| 15 | Reviewer reports belong in the same run folder. | supported | `.cg-docs/orchestration/CONTRACT.md:26`: “Supporting files (evidence, reviewer reports, logs) go in the same run folder.” |
| 16 | Logs belong in the same run folder. | supported | `.cg-docs/orchestration/CONTRACT.md:26`: “Supporting files (evidence, reviewer reports, logs) go in the same run folder.” |
| 17 | A new attempt gets a new run folder. | supported | `.cg-docs/orchestration/CONTRACT.md:66`: “A new attempt gets a new run folder.” |
| 18 | Another run's report must never be overwritten. | supported | `.cg-docs/orchestration/CONTRACT.md:66`: “Never overwrite another run's report.” |
| 19 | The report is created at the start. | supported | `.cg-docs/orchestration/CONTRACT.md:61`: “Create the report at the start” |
| 20 | The initial report status is `running`. | supported | `.cg-docs/orchestration/CONTRACT.md:61`: “with `status: running`.” |
| 21 | The report is updated at checkpoints. | supported | `.cg-docs/orchestration/CONTRACT.md:61-62`: “Update it at checkpoints” |
| 22 | The report is updated before stopping. | supported | `.cg-docs/orchestration/CONTRACT.md:61-62`: “Update it at checkpoints and before you stop.” |
| 23 | The handoff uses the `pip-handoff-v2` format. | supported | `.cg-docs/orchestration/CONTRACT.md:28`: “Handoff Format (`pip-handoff-v2`)” |
| 24 | The listed fields form the YAML frontmatter. | supported | `.cg-docs/orchestration/CONTRACT.md:31-44`: `---` delimits the illustrated schema-through-next field block. |
| 25 | `schema` identifies the format. | supported | `.cg-docs/orchestration/CONTRACT.md:32`: “schema: pip-handoff-v2” |
| 26 | `project` identifies the project. | supported | `.cg-docs/orchestration/CONTRACT.md:33`: “project: pipdata” |
| 27 | `task` identifies the task. | supported | `.cg-docs/orchestration/CONTRACT.md:34`: “task: m2-engine-work” |
| 28 | `run` identifies the run. | supported | `.cg-docs/orchestration/CONTRACT.md:35`: “run: 20261029T162630Z-code” |
| 29 | Accepted statuses are `running`, `blocked`, `partial`, `completed`, `cancelled`, and `no-change`. | supported | `.cg-docs/orchestration/CONTRACT.md:36`: “running \| blocked \| partial \| completed \| cancelled \| no-change” |
| 30 | `updated` records a timestamp. | supported | `.cg-docs/orchestration/CONTRACT.md:37`: “updated: 2026-10-29T16:40:00Z” |
| 31 | `owner` names the session label. | supported | `.cg-docs/orchestration/CONTRACT.md:38`: “owner: <session label>” |
| 32 | `repo` records the repository path. | supported | `.cg-docs/orchestration/CONTRACT.md:39`: “repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata” |
| 33 | `branch` records the branch. | supported | `.cg-docs/orchestration/CONTRACT.md:40`: “branch: <branch>” |
| 34 | `head` records the full commit SHA. | supported | `.cg-docs/orchestration/CONTRACT.md:41`: “head: <full commit SHA, or UNKNOWN>” |
| 35 | `UNKNOWN` is allowed for `head`. | supported | `.cg-docs/orchestration/CONTRACT.md:41`: “or UNKNOWN” |
| 36 | `plan` records the Plan path and revision. | supported | `.cg-docs/orchestration/CONTRACT.md:42`: “plan: <Plan path and revision, or NONE>” |
| 37 | `NONE` is allowed for `plan`. | supported | `.cg-docs/orchestration/CONTRACT.md:42`: “or NONE” |
| 38 | `next` states the next action. | supported | `.cg-docs/orchestration/CONTRACT.md:43`: “next action and who does it” |
| 39 | `next` states who performs the next action. | supported | `.cg-docs/orchestration/CONTRACT.md:43`: “next action and who does it” |
| 40 | `next` is one line. | supported | `.cg-docs/orchestration/CONTRACT.md:43`: “one line” |
| 41 | The report has a title before its sections. | supported | `.cg-docs/orchestration/CONTRACT.md:46-48`: “# <Title>” precedes “## Summary”. |
| 42 | The report includes four sections. | supported | `.cg-docs/orchestration/CONTRACT.md:48,51,54,57`: “Summary”; “Changes”; “Checks run”; “Gaps”. |
| 43 | Summary states what was done. | supported | `.cg-docs/orchestration/CONTRACT.md:48-49`: “What was done and the result.” |
| 44 | Summary states the result. | supported | `.cg-docs/orchestration/CONTRACT.md:49`: “What was done and the result.” |
| 45 | Changes lists files changed. | supported | `.cg-docs/orchestration/CONTRACT.md:51-52`: “Files changed and commits made, or NONE.” |
| 46 | Changes lists commits made. | supported | `.cg-docs/orchestration/CONTRACT.md:52`: “Files changed and commits made, or NONE.” |
| 47 | Changes allows `NONE`. | supported | `.cg-docs/orchestration/CONTRACT.md:52`: “or NONE.” |
| 48 | Checks run lists commands or checks. | supported | `.cg-docs/orchestration/CONTRACT.md:54-55`: “Commands or checks and their results.” |
| 49 | Checks run lists their results. | supported | `.cg-docs/orchestration/CONTRACT.md:55`: “Commands or checks and their results.” |
| 50 | Checks run names required checks that did not run. | supported | `.cg-docs/orchestration/CONTRACT.md:55`: “Name required checks that did not run.” |
| 51 | Gaps includes limits. | supported | `.cg-docs/orchestration/CONTRACT.md:57-58`: “Limits, unknowns and open decisions.” |
| 52 | Gaps includes unknowns. | supported | `.cg-docs/orchestration/CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 53 | Gaps includes open decisions. | supported | `.cg-docs/orchestration/CONTRACT.md:58`: “Limits, unknowns and open decisions.” |
| 54 | Gaps must never be empty. | supported | `.cg-docs/orchestration/CONTRACT.md:58`: “Never empty.” |
| 55 | Each fact must trace to a file and line, a command result, or a SHA. | supported | `.cg-docs/orchestration/CONTRACT.md:63`: “Each fact traces to a file and line, a command result or a SHA” |
| 56 | A fact lacking that evidence must be marked `UNKNOWN`. | supported | `.cg-docs/orchestration/CONTRACT.md:63-64`: “or is marked UNKNOWN.” |
| 57 | Reports must not include credentials. | supported | `.cg-docs/orchestration/CONTRACT.md:65`: “No credentials, production data or raw conversations.” |
| 58 | Reports must not include production data. | supported | `.cg-docs/orchestration/CONTRACT.md:65`: “No credentials, production data or raw conversations.” |
| 59 | Reports must not include raw conversations. | supported | `.cg-docs/orchestration/CONTRACT.md:65`: “No credentials, production data or raw conversations.” |
| 60 | Report timestamps use UTC (`Z`). | supported | `.cg-docs/orchestration/CONTRACT.md:69`: “Timestamps in reports and run IDs are UTC (`Z`).” |
| 61 | Run IDs use UTC (`Z`). | supported | `.cg-docs/orchestration/CONTRACT.md:69`: “Timestamps in reports and run IDs are UTC (`Z`).” |
| 62 | Times shown to people use New York time. | supported | `.cg-docs/orchestration/CONTRACT.md:69-70`: “messages to people show them in New York time” |
| 63 | The specified time zone is `America/New_York`. | supported | `.cg-docs/orchestration/CONTRACT.md:70`: “(`America/New_York`, "ET")” |
| 64 | Displayed times are labeled `ET`. | supported | `.cg-docs/orchestration/CONTRACT.md:70`: “(`America/New_York`, "ET")” |
| 65 | `tools\pipsys\pipsys.cmd handoffs` reads v2 handoffs. | supported | `.cg-docs/orchestration/CONTRACT.md:91-92`: “reads v2 and v1 handoffs” |
| 66 | `tools\pipsys\pipsys.cmd handoffs` reads v1 handoffs. | supported | `.cg-docs/orchestration/CONTRACT.md:91-92`: “reads v2 and v1 handoffs” |
| 67 | `/pip-handoffs` is the named handoff-reading command counterpart. | supported | `.cg-docs/orchestration/CONTRACT.md:91`: “`tools\pipsys\pipsys.cmd handoffs` (`/pip-handoffs`)” |
| 68 | Older reports show `UNKNOWN` status. | supported | `.cg-docs/orchestration/CONTRACT.md:92`: “older reports show UNKNOWN status.” |
| 69 | Invalid-YAML v2 frontmatter is read line by line. | supported | `.cg-docs/orchestration/CONTRACT.md:92-93`: “v2 frontmatter that is not valid YAML is read line by line” |
| 70 | Multi-line fields show `UNKNOWN` under that fallback. | supported | `.cg-docs/orchestration/CONTRACT.md:93`: “multi-line fields then show UNKNOWN.” |
| 71 | v1 reports remain readable. | supported | `.cg-docs/orchestration/CONTRACT.md:67`: “v1 reports (initial JSON block and ten headings) stay readable.” |
| 72 | `templates/handoff.md` is the v1 template. | supported | `.cg-docs/orchestration/CONTRACT.md:85`: “`templates/handoff.md` is the v1 template” |
| 73 | The contract's v2 format replaces that template. | supported | `.cg-docs/orchestration/CONTRACT.md:85`: “the format above replaces it.” |
| 74 | Prompts assigning work to another session include the exact absolute report path. | supported | `.cg-docs/orchestration/CONTRACT.md:77-78`: “the exact absolute report path and format.” |
| 75 | Those prompts include the report format. | supported | `.cg-docs/orchestration/CONTRACT.md:77-78`: “the exact absolute report path and format.” |
| 76 | Workers in other repositories receive the format only through their prompts. | supported | `.cg-docs/orchestration/CONTRACT.md:94`: “Workers in other repositories see this format only through their prompts.” |
| 77 | The listed paused-workflow records and helper must not be used. | supported | `.cg-docs/orchestration/CONTRACT.md:82-84`: Listed artifacts “belong to a paused formal workflow. Keep them. Do not use or update them.” |
| 78 | The listed paused-workflow records and helper must not be updated. | supported | `.cg-docs/orchestration/CONTRACT.md:84`: “Do not use or update them.” |

summary: supported 74, broad 4, unsupported 0, wrong 0, uncited 0
