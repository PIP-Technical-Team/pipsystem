# AGENTS.md

## Read first

1. `compound-gpid.md`: objective, deliverables, constraints, current focus.
2. `SYSTEM_DESIGN.md`: how the system is supposed to work. Every statement is marked Decided or Open.
3. `HARVEST_BRIEF.md`: what to extract from the packages, and in what schema.

## Rules

* **`pipsystem` is the only writable folder**, with two `pip-orchestrator` exceptions described below: Git operations on the user's instruction, and small, reported package changes. Every other workspace folder is otherwise a read only source. Never edit, create, delete, format, stage, or commit anything there outside those exceptions.
* **Never change a Decided item in `SYSTEM_DESIGN.md`** without explicit approval. If code contradicts it, report the contradiction.
* **When you find evidence for an Open item,** record it with file and line and propose the change. Do not apply it yourself.
* **No fabrication.** Every fact traces to a file and line, or is marked `UNKNOWN`.
* **Gaps sections are never empty.**
* **Record the commit SHA** of every package repository you read.
* **R:** `data.table` and `collapse`.

## Working Principles

### Minimal first

1. Build the smallest version that works end to end. Make it robust later.
2. Add a safeguard (extra validation, schema, version pin, checksum, CI job,
   lock, approval step or defensive test) only when the failure it prevents
   would be almost irreversible:
   - loss of data, work or Git history that cannot be restored;
   - wrong numbers released or published outside the team;
   - credentials or private data exposed;
   - changes to production systems or shared remote branches.
   If Git, a rerun or a quick fix can undo the failure, do not add the
   safeguard. Write the idea under "Later" and move on.
3. A check that shows the feature works is not a safeguard. Each change
   gets one.
4. Use tools that are already installed. Add a dependency only when it
   saves more work than it costs.
5. Keep a Plan to about two pages. If it is longer, split it.

Apply these rules to your own work, and write them into every Plan and
prompt you prepare.

### Autonomy

Do not ask before doing anything that can be undone. Ask only before:

- the almost-irreversible actions in Minimal first rule 2;
- changing a Decided item in `SYSTEM_DESIGN.md` (Andres approves those);
- changing project scope: charter text, or adding, removing or re-scoping
  roadmap milestones and features;
- commits, pushes, merges, or deleting files that are not generated.

When you must ask, ask once, give your recommended answer, and keep doing the
independent work. When a step fails, fix it within the task. Stop only when
the fix needs one of the decisions above or the user stops you.

## Coordinated Agent Outputs

Only /pip-next may retain raw information-command output in its saved assessment
instead of repeating it in default chat. Its concise decision brief keeps material
caveats and failures visible and links the saved assessment; full evidence and
useful complete prompts remain there. The standalone /pip-status, /pip-overview
and /pip-handoffs commands still show their output as printed.

Every agent coordinated for this project saves a file-based result, also for
blocked, cancelled or no-change outcomes. Chat alone is not a handoff.

Save it at the exact absolute path given in your prompt, under
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/<project>/<task-id>/<run-id>/handoff.md`.
Use the format in `.cg-docs/orchestration/CONTRACT.md`. Create the report at
the start, update it at checkpoints, and save it before you stop. Use a new
run folder for a new attempt, and never overwrite another run's report. Do
not copy credentials, production data or raw conversations into it.

Workers in other repositories do not read this file, so every prompt repeats
the report path and format.

Every user-facing command or prompt offered to run/copy, including same-session
recommendations and saved prompt artifacts, includes an external setup card:
**Project Name**, **Branch**, **Worktree Requirement**, **Model Family
Recommendation**, **Effort**, **Target Project**, **Target Environment**, and
**Target Agent**. Use the exact labels and template in ORCHESTRATOR.md.
Branch names the actual default/current/new branch and existing/proposed
status. Worktree Requirement says Yes/No for a new git worktree and gives the
absolute target path; a new branch does not imply a new worktree. Retain the
target fields' repository root, environment/status and agent information.

Recommend Powerful (Sol/Opus), Standard (Sonnet/Terra) or Small (Luna/Haiku)
and effort low, medium, high or extra high based on task complexity, not the
responding model. This is user setup advice, not a model/provider/variant or
client-setting change. Render the external setup card above and outside the
copyable task block. Model family and effort stay outside that task block;
do not ask the worker to change or infer them. Inside, keep task instructions
and a short check of the expected root/branch/checkout, without silently
switching or creating environments. A required slash command stays on line 1
of the task block; never mix metadata into shell syntax. Shared cards cover
only contiguous commands with the same context/recommendation. Saved artifacts
have an external Setup section and a separate fenced task block. UNKNOWN
stays explicit. Setup grants no execution, branch/worktree or Git approval.
Internal tool calls, historical examples and verbatim source output are
excluded; preserve information-command output.

Every conversational final ends with **Next:** and **Need from you:**. Next
names the real next stage, owner, status and resumption trigger. Need from you
names the actual pending decision/approval/setup action, or "Nothing" only if
none is outstanding for that next step. An unresolved proposal needs choices
such as adopt it, keep the current setup or suggest an alternative; finishing
the explanation does not settle it. Do not claim nothing is needed while a
decision, reload or required handoff is pending. Do not invent work for a
completed informational request or re-ask an approved choice. Check that doing
exactly what Need from you says would enable Next; otherwise correct the pair.

## pip-orchestrator

`pip-orchestrator` (rules in `ORCHESTRATOR.md`) coordinates the project from
this main checkout. It has the same permissions as Code mode. It reads every
package and handoff, plans and drives work through Compound GPID, and saves
its own handoffs. It does not run the PIP pipeline.

- **Git:** read-only Git in any repository at any time. Commits, pushes and
  merges only on the user's instruction, also outside pipsystem. This is the
  exception named in the first rule above.
- **Git cadence:** when the task has commit authorization, checkpoint each
  completed, verified logical stage promptly, including its intended Plans,
  tests, docs and reports. Push each checkpoint when push is also authorized.
  Do not wait until task end, commit every edit, or stage others' changes just
  to clear the worktree. Report SHAs, push status and excluded dirty paths.
  Task-specific authorization still applies; this rule grants none by itself.
- **Package files:** it may make a small change in a package repository
  when the change unblocks work. It first checks that the file has no
  uncommitted changes, and it reports every package change. Details are in
  "Changes in packages" in `ORCHESTRATOR.md`; the Decided rule is
  `SYSTEM_DESIGN.md:319`.
- **Its own rules:** it may change `ORCHESTRATOR.md`, its block in
  `kilo.json`, and the coordination parts of this file and `CONTRACT.md`
  when the user asks for a specific change.
- **Paused formal workflow:** the registry, project states, requests and
  helper under `.cg-docs/orchestration/` and `tools/` stay in place, unused.
