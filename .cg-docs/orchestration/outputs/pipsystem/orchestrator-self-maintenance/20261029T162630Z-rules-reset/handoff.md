---
schema: pip-handoff-v2
project: pipsystem
task: orchestrator-self-maintenance
run: 20261029T162630Z-rules-reset
status: completed
updated: 2026-10-29T16:45:00Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: a0eb61f8e00275b242e91b5ae8f42d7039d46abf
plan: NONE (user-approved self-maintenance)
next: User reloads the project config or opens a fresh pip-orchestrator session; that session tests permissions, then does step 3 (project-wide rules)
---

# Orchestrator Rules Reset

## Summary

Done. pip-orchestrator now has no permission block of its own, so it gets
Code-mode defaults after a reload. Its rules are rewritten in short form with
the Minimal first and Autonomy principles. The coordination parts of
AGENTS.md and CONTRACT.md are shortened to match, and a small handoff format
(`pip-handoff-v2`) replaces the v1 JSON format for new reports.

Approval references (direct user messages in this session):
- 2026-10-29T15:15:52Z: "I prefer exact code-mode defaults"; orchestrator may
  make minimal package changes when necessary; add safeguards only when a
  failure would be almost irreversible.
- 2026-10-29T16:26:30Z: "1. you, 2. yes, 3. yes" to the proposed plan
  (orchestrator carries out the work; checkpoint commit authorized; Minimal
  first also in global AGENTS.md, which is step 3, not this run).

## Changes

- Commit `a0eb61f8e00275b242e91b5ae8f42d7039d46abf` on main, local only, not
  pushed: checkpoint of all 62 pending pipsystem changes before the reset.
  `runtime/` folders excluded.
- Uncommitted after the commit (4 files, 319 insertions, 1632 deletions):
  - `kilo.json`: removed the whole `permission` block of `pip-orchestrator`
    and updated its description. `cg-roadmap` block unchanged.
  - `ORCHESTRATOR.md`: rewritten, 988 to 227 lines. Keeps the coordinator
    role, Compound GPID routes, all-findings Plan sequence, follow-up
    scheduling, Git and roadmap rules. Adds Minimal first, Autonomy and
    Changes in packages. Removes the shell, subagent and read restrictions
    and the formal-workflow detail.
  - `AGENTS.md`: lines 1-18 unchanged; the Coordinated Agent Outputs section
    is replaced by a short version plus a pip-orchestrator section.
  - `.cg-docs/orchestration/CONTRACT.md`: v1 (318 lines) replaced by v2
    (90 lines) with the `pip-handoff-v2` format.

## Checks run

- `git diff --cached --stat` before the commit: 62 files, no `runtime/` path.
- `git commit`: succeeded, `a0eb61f`.
- Kilo config validation after writing `kilo.json`: "Config file validated
  successfully".
- `git diff -U0 -- kilo.json`: hunks only at lines 5-214 of the old file
  (description and pip-orchestrator permission block).
- `git diff -U0 -- AGENTS.md`: one hunk starting at line 21; lines 1-18 unchanged.
- `git diff --stat`: only the 4 intended files changed.
- Readback: ORCHESTRATOR.md (227 lines) and CONTRACT.md (90 lines) read in
  full; AGENTS.md and kilo.json checked through the diffs.
- Live permission probe in this session: reading the pipsystem root folder is
  still denied (`source: agent`). This session has not reloaded the config.
- Not run: any test of the new permissions in a fresh session.

## Gaps

- Effective permissions after reload are UNKNOWN. A Git command with a
  parenthesized pathspec was denied in this session with `source: global`, so
  the global Kilo config may set its own bash rule. If a fresh session cannot
  run shell or Git, compare with Code mode's effective permissions.
- The four rule files are uncommitted. Restore with
  `git checkout a0eb61f -- <file>` if needed.
- Package changes remain proposals until AGENTS.md rule 1,
  compound-gpid.md:26 and SYSTEM_DESIGN.md:319 (a Decided item) are changed.
- `templates/handoff.md` still holds the v1 template; CONTRACT.md marks it as
  replaced.
