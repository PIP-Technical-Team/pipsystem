# AGENTS.md

## Read first

1. `compound-gpid.md`: objective, deliverables, constraints, current focus.
2. `SYSTEM_DESIGN.md`: how the system is supposed to work. Every statement is marked Decided or Open.
3. `HARVEST_BRIEF.md`: what to extract from the packages, and in what schema.

## Rules

* **`pipsystem` is the only writable folder.** Every other workspace folder is a read only source. Never edit, create, delete, format, stage, or commit anything there.
* **Never change a Decided item in `SYSTEM_DESIGN.md`** without explicit approval. If code contradicts it, report the contradiction.
* **When you find evidence for an Open item,** record it with file and line and propose the change. Do not apply it yourself.
* **No fabrication.** Every fact traces to a file and line, or is marked `UNKNOWN`.
* **Gaps sections are never empty.**
* **Record the commit SHA** of every package repository you read.
* **R:** `data.table` and `collapse`.

## Coordinated Agent Outputs

Every agent coordinated for this project must leave a durable file-based result,
regardless of its project, package, repository, worktree, or task type. This
includes research, planning, implementation, review, testing, permitted helper
work, and partial, blocked, cancelled, or no-change outcomes. Chat, tool results,
and session history alone are not a handoff.

The shared output root is the main checkout at
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/`.
Assign each worker an exact absolute path under
`<project>/<task-id>/<run-id>/handoff.md` in its prompt and approved write set.
Use `.cg-docs/orchestration/CONTRACT.md` and its `templates/handoff.md` for
the versioned organization/fields; `ORCHESTRATOR.md` defines agent behavior. Create the report
at the start, update it at material checkpoints, and save it before pausing,
reporting a blocker, or finishing. Include substantive results, artifact paths,
file/line/SHA evidence, checks actually run, next actions, and non-empty Gaps.

Permanent deliverables stay in their separately approved project folders, but
the central report is always required. Save sanitized supporting outputs in the
same assigned run folder when the coordinator cannot read their canonical
location; inaccessible links alone are insufficient. Do not copy credentials,
production data, or raw conversations. Workers own only their assigned output
files, never another worker's files or canonical registry/project-state records.
STATE/REQUESTS are retained historical indexes, not active writable registers.

All orchestrators remain in this main pipsystem checkout. Different designated
sessions may own different projects; one owner per project, checked by the helper
with revision/locking rules. Designation permits routine project coordination,
not implementation, workers, Git, roadmap or new source access. Refresh on start,
before prompts, after intake and on status requests. While activation is blocked,
do not substitute direct state edits or broader shell access for the helper.

Every coordinating prompt must pass this requirement and exact paths onward;
workers in other repositories do not automatically inherit this file. Reporting
does not expand implementation scope or override permissions. If a restricted
agent cannot write a report, its authorized coordinating caller must save an
attributed result in the assigned folder; otherwise stop and report the missing
write authorization. Never accept chat-only completion or bypass a denied write.
