| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | A handoff records what was done. | same | BEFORE:3 → AFTER:5; citation unchanged. |
| 2 | A handoff records the result. | same | BEFORE:4 → AFTER:6; citation unchanged. |
| 3 | A handoff records commands or checks and their results. | same | BEFORE:5 → AFTER:7; citation unchanged. |
| 4 | A handoff records limits, unknowns, and open decisions. | same | BEFORE:6 → AFTER:8; citation unchanged. |
| 5 | The contract covers development coordination for PIP packages, not pipeline execution. | same | BEFORE:7 → AFTER:10; scope and citation unchanged. |
| 6 | Reports belong at the specified absolute path ending in `<project>/<task-id>/<run-id>/handoff.md`. | same | BEFORE:11 → AFTER:14; full path and citation identical. |
| 7 | `project` is a package or repository slug, with `pipdata` and `pipsystem` as examples. | same | BEFORE:13 → AFTER:16; examples and citation unchanged. |
| 8 | `task-id` is a stable slug for one piece of work. | same | BEFORE:14 → AFTER:17; citation unchanged. |
| 9 | `run-id` is a UTC timestamp plus a label, exemplified by `20261029T162630Z-code`. | same | BEFORE:15 → AFTER:18; format, example, and citation unchanged. |
| 10 | Use one run per attempt. | same | BEFORE:15 → AFTER:18; moved into a separate sentence; citation unchanged. |
| 11 | Keep evidence, reviewer reports, and logs in the same run folder. | same | BEFORE:17 → AFTER:20; citation unchanged. |
| 12 | Give each new attempt a new run folder. | same | BEFORE:18 → AFTER:21; citation unchanged. |
| 13 | Never overwrite another run's report. | same | BEFORE:18 → AFTER:21; citation unchanged. |
| 14 | Create the report at the start with `status: running`. | same | BEFORE:22 → AFTER:25; status, timing, and citation unchanged. |
| 15 | Update the report at checkpoints and before stopping. | same | BEFORE:22 → AFTER:25; separated into a sentence; citation unchanged. |
| 16 | Use the `pip-handoff-v2` format. | same | BEFORE:23 → AFTER:26; format and citation unchanged. |
| 17 | The listed fields belong in YAML frontmatter. | same | BEFORE:25 → AFTER:28; “contains” becomes “has”; citation unchanged. |
| 18 | `schema`, `project`, `task`, and `run` identify the format and work. | same | BEFORE:27 → AFTER:30; fields and citation unchanged. |
| 19 | `status` accepts `running`, `blocked`, `partial`, `completed`, `cancelled`, or `no-change`. | same | BEFORE:28 → AFTER:31; all six values and citation unchanged. |
| 20 | `updated` records the timestamp. | same | BEFORE:29 → AFTER:32; citation unchanged. |
| 21 | `owner` names the session label. | same | BEFORE:29 → AFTER:32; citation unchanged. |
| 22 | `repo` records the repository path. | same | BEFORE:30 → AFTER:33; citation unchanged. |
| 23 | `branch` records the branch. | same | BEFORE:30 → AFTER:33; citation unchanged. |
| 24 | `head` records the full commit SHA, with `UNKNOWN` allowed. | same | BEFORE:30 → AFTER:33; full-SHA requirement, exception, and citation unchanged. |
| 25 | `plan` records the Plan path and revision, or `NONE`. | same | BEFORE:31 → AFTER:34; alternative and citation unchanged. |
| 26 | `next` states the next action and who does it in one line. | same | BEFORE:32 → AFTER:35; only punctuation changes; citation unchanged. |
| 27 | After a title, include four sections. | same | BEFORE:34 → AFTER:37; count, placement, and citation unchanged. |
| 28 | **Summary** states what was done and the result. | same | BEFORE:36 → AFTER:39; section name, contents, and citation unchanged. |
| 29 | **Changes** lists files changed and commits made, or `NONE`. | same | BEFORE:37 → AFTER:40; alternative and citation unchanged. |
| 30 | **Checks run** records commands or checks and their results. | same | BEFORE:38 → AFTER:41; citation unchanged. |
| 31 | **Checks run** includes required checks that did not run. | same | BEFORE:38 → AFTER:41; qualification and citation unchanged. |
| 32 | **Gaps** records limits, unknowns, and open decisions. | same | BEFORE:39 → AFTER:42; citation unchanged. |
| 33 | Never leave **Gaps** empty. | same | BEFORE:39 → AFTER:42; requirement and citation unchanged. |
| 34 | Trace each fact to a file and line, command result, or SHA; otherwise mark it `UNKNOWN`. | same | BEFORE:41 → AFTER:44; evidence alternatives, qualification, and citation unchanged. |
| 35 | Do not include credentials, production data, or raw conversations. | same | BEFORE:42 → AFTER:45; all prohibited categories and citation unchanged. |
| 36 | Use UTC (`Z`) in report timestamps and run IDs. | same | BEFORE:43 → AFTER:46; timezone, notation, scope, and citation unchanged. |
| 37 | Show times to people in New York time (`America/New_York`), labeled `ET`. | same | BEFORE:44 → AFTER:47; timezone, label, and citation unchanged. |
| 38 | Use `tools\pipsys\pipsys.cmd handoffs` (`/pip-handoffs`) to read v2 and v1 handoffs. | same | BEFORE:48 → AFTER:51; command, alias, versions, and citation unchanged. |
| 39 | Older reports show `UNKNOWN` status. | same | BEFORE:49 → AFTER:52; qualification and citation unchanged. |
| 40 | When v2 frontmatter is invalid YAML, the reader processes it line by line. | same | BEFORE:50 → AFTER:53; “When” becomes “If”; condition and citation unchanged. |
| 41 | Under that invalid-YAML condition, multi-line fields display as `UNKNOWN`. | same | BEFORE:50 → AFTER:53; condition, displayed value, and citation unchanged. |
| 42 | V1 reports remain readable. | same | BEFORE:51 → AFTER:54; separated into a sentence; citation unchanged. |
| 43 | `templates/handoff.md` is the old v1 template. | same | BEFORE:51 → AFTER:54; path, version, and citation unchanged. |
| 44 | The contract's v2 format replaces that old v1 template. | same | BEFORE:51 → AFTER:54; replacement relationship and citation unchanged. |
| 45 | Assignment prompts for another session must include the exact absolute report path and format. | same | BEFORE:53 → AFTER:56; “When assigning” becomes “When you assign”; citation unchanged. |
| 46 | Workers in other repositories receive the format only through their prompts. | same | BEFORE:54 → AFTER:57; “only” qualification and citation unchanged. |
| 47 | Do not use the retained records and helper listed under the contract's paused formal workflow. | same | BEFORE:55 → AFTER:58; prohibition, scope, and citation unchanged. |
| 48 | Do not update those retained records and helper. | same | BEFORE:55 → AFTER:58; prohibition and citation unchanged. |
| 49 | The Gaps item marks as `UNKNOWN` that the contract gives no example of the handoff command's output. | same | BEFORE:59 → AFTER:62; `UNKNOWN` qualification and citation unchanged. |
| 50 | The same `UNKNOWN` Gaps item says the contract does not explain the command's display columns. | same | BEFORE:59 → AFTER:62; qualification and citation unchanged. |

summary: same 50, added 0, removed 0, changed 0
