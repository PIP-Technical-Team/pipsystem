# AGENTS.md

## Read first

1. `compound-gpid.md`: objective, deliverables, constraints, current focus.
2. `SYSTEM_DESIGN.md`: how the system is supposed to work. Every statement is marked Decided or Open.
3. `HARVEST_BRIEF.md`: what to extract from the packages, and in what schema.

## Rules

* **`pipsystem` is the only writable folder**, except for the user-approved `pip-orchestrator` Git operations described below. Every other workspace folder is otherwise a read only source. Never edit, create, delete, format, stage, or commit anything there outside that exception.
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

All orchestrators remain in this main pipsystem checkout. Ordinary coordination
discovers and reads shared handoffs, explains last-known stages/blockers and
drafts next-session prompts with exact report paths. Use bounded Read directory
and file access within the central output root. No helper execution, registry
ownership, activation, task registration or schema validation is required for
reading or advice. Identify missing facts without refusing useful bounded advice.
Refresh from saved files on start, before prompts, after handoff review, on
status requests and on scheduled callbacks for user-confirmed work. When the user
says a proposed prompt is running or executed, estimate its duration and use
native scheduling/wakeup tools to check its assigned handoff and evidence files;
follow the lifecycle in ORCHESTRATOR.md. Scheduled reads establish only observed
saved evidence, never worker liveness, unwritten progress or continuous monitoring.
Canonical shared-state mutation, ownership locks/revisions and formal intake are
deferred; preserve their helper, tests, records and history without modifying or
executing them. Coordination does not authorize implementation, worker starts,
Git mutations, roadmap or new source access. pip-orchestrator may invoke Git in
any directory; non-Git shell commands stay denied. Git mutations still require
the user's instruction for that operation, not another worker session. This
Git-only exception permits its approved Git effects outside pipsystem, not
ordinary package editing. Keep E:-only storage and sensitive-content boundaries;
do not use Git to bypass them. Preserve the user's auto-approve ON preference.

pip-orchestrator always has standing read-only access to Compound GPID files in
any project/repository/worktree, including future projects, without a package
allowlist or per-project/per-Plan approval. This covers project-local
compound-gpid.md/context/local files, AGENTS.md, roadmap.json and kilo.json as
workflow/policy reference; installed .kilo/ commands, agents, instructions,
shared contracts, skills/resources and named adapter reference files; managed
.compound-gpid/** installations; and .cg-docs/** artifacts, including canonical
Plans, reviews and work reports. Use bounded Read at known relevant roots, not
drive/parent scans. Ordinary handoff discovery remains at the central outputs
root in this main checkout. These reads grant no command execution, tests,
worker starts, package/source access beyond the named scope, or writes outside
the existing exceptions. Global configuration, credentials, private/native Kilo
state, raw transcripts, production data and derived-view body restrictions stay
protected. A saved permission rule does not prove live reload or override a
client denial. Follow Compound GPID Reference Access in ORCHESTRATOR.md.

pip-orchestrator must use Compound GPID by default for coordinated task prompts.
Start each copy-ready prompt with the actual slash-command invocation, not a
buried command reference: `/cg-brainstorm --no-branch` for unresolved material
choices, `/cg-plan` for structured planning, or `/cg-light-work` only for work
that qualifies for the installed small, low-risk workflow and needs no separate
brainstorm/planning session. Use `/cg-work` for an approved local saved
Plan/revision/phase and the appropriate verified Compound GPID command for other
stages. Preserve the command's approval, validation, review, lifecycle and
evidence gates; reporting instructions supplement rather than replace them.
State a concrete strong reason and the already-authorized route before any
exception. Ordinary bounded read/advice, directly approved Git operations and
approved self-maintenance keep their existing narrow procedures. This does not
grant command execution, worker starts, additional writes or permissions; a
missing contract or denied required action blocks the affected task, not a
silent informal fallback. Follow Compound GPID First in ORCHESTRATOR.md.

For new coordinated implementation Plans, the user's default sequence is
`/cg-plan` -> `/cg-plan-review` -> address ALL findings in the canonical Plan
-> `/cg-work`. Planning assignments must prepare an executable local Plan with
resolved material choices, complete source/test/docs/lifecycle/report/runtime
scope, pins and safe acceptance checks. Record and verify every review
correction, revalidate the saved Plan, and return its exact revision and direct
work command. A clean critic result or schema pass alone is not readiness.
The installed review command stays read-only; its independently authorized outer
Code caller applies Plan/report corrections, or uses the authorized revision
route. Explicitly requesting work on the reviewed, covered scope is execution
approval, normally for the complete approved Plan unless the user limits it,
not a reason for another generic approval checklist. Preserve native
phase/deviation controls, live permissions and substantive safety/test gates;
unresolved material decisions must be settled before calling a Plan work-ready.
Branch operations still need explicit instruction; commits/pushes and unrelated
work are not implied. The user's existing package session may continue through
the stages. Follow Work-Ready Plans And Review in ORCHESTRATOR.md.

pip-orchestrator generates implementation handoffs using the global End-to-End
Plan Execution policy and End-to-End Work Handoffs And Bounded Autonomy in
ORCHESTRATOR.md. Give one instruction for all remaining approved phases in order,
starting at the first incomplete phase; advance after each phase's evidence
passes, without routine phase-by-phase authorization. Use the target-verified
`/cg-work review:auto deviate:auto` controls for bounded reversible choices unless
the user specifies otherwise; include `/cg-fix-triage P0 P1 P2 P3` for all applicable saved
findings including P3, affected retests/regression checks, and final
`/cg-review mode:verify` within the Plan's iteration budget. Preserve mandatory
framework gates and report any verifier fallback honestly.

Every work prompt explicitly names review/test/diagnostics agents and their
tool/read/write boundaries, the authorized outer reporting/fixing caller, exact
absolute Plan/execution/review/resolution/verification/active-state/rendered and
central report paths, bounded E: runtime/test/temp/cache outputs, permitted
lifecycle fields, checks and correction budget. Include these in the proposed
permission/write-set bundle; reviewers keep their own restricted permissions.
Do not let workers infer delegation, lifecycle writes or Git staging from a
command name. The independently authorized worker, not pip-orchestrator, invokes
the specified reviewers. Branch/Git operations must be named and directly
authorized; publication is not implied by work/review approval.

Within approved scope and live permissions, develop, test, review, fix and verify
safe reversible changes without asking for repeated approval. Research facts,
record safe implementation choices and resolve recoverable failures within the
authorized budget. Do not invent blockers for routine details or tracking gaps.
Irreversible/destructive or externally consequential operations need their exact
authorization; reversibility does not override mandatory material decision,
scope/design/safety, permission, roadmap, Git or self-maintenance rules. Stop only
the affected action for a real boundary/denial, unsafe ownership or dependency,
unresolved material choice, required check that cannot be safely run/resolved,
exhausted correction budget or user stop; keep independent safe work moving.
Never weaken checks, skip findings or claim completion without required evidence.
This changes handoff/continuation policy, not pip-orchestrator's tool permissions,
worker-start authority, workspace/privacy boundaries or deferred shared state.

In addition to the Git exception, pip-orchestrator may maintain its own rules
with explicit user approval. Follow the User-Approved Self-Maintenance section in
ORCHESTRATOR.md. It may edit ORCHESTRATOR.md, its own agent block in kilo.json,
and only its coordination rules in AGENTS.md and the central CONTRACT.md, plus
its unique maintenance handoff. Approval is per change, not standing permission
to expand authority. Unrelated tools, files, package writes, roadmap operations,
and deferred shared-state operations remain outside this exception.

Every coordinating prompt must pass this requirement and exact paths onward;
workers in other repositories do not automatically inherit this file. Reporting
does not expand implementation scope or override permissions. If a restricted
agent cannot write a report, its authorized coordinating caller must save an
attributed result in the assigned folder; otherwise stop and report the missing
write authorization. Never accept chat-only completion or bypass a denied write.
