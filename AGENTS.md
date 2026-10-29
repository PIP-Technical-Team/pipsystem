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

## pip-orchestrator

`pip-orchestrator` (rules in `ORCHESTRATOR.md`) coordinates the project from
this main checkout. It has the same permissions as Code mode. It reads every
package and handoff, plans and drives work through Compound GPID, and saves
its own handoffs. It does not run the PIP pipeline.

- **Git:** read-only Git in any repository at any time. Commits, pushes and
  merges only on the user's instruction, also outside pipsystem. This is the
  exception named in the first rule above.
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
