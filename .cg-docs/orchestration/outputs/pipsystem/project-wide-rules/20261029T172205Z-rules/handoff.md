---
schema: pip-handoff-v2
project: pipsystem
task: project-wide-rules
run: 20261029T172205Z-rules
status: completed
updated: 2026-10-29T17:30:00Z
owner: pip-orchestrator (session ses_e775390f8ffe4GUSm1QzDyITAg)
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: a0eb61f8e00275b242e91b5ae8f42d7039d46abf
plan: NONE (step 2 of the rules-reset continuation; approved 2026-10-29)
next: pip-orchestrator continues with step 3 (close website Plan r3)
---

# Project-Wide Rules

## Summary

Done. The Minimal first and Autonomy rules are now in pipsystem `AGENTS.md`
and, in a project-neutral form, in the global Kilo `AGENTS.md`. The package
rule now allows small, reported changes by `pip-orchestrator` in all three
places: `AGENTS.md` rule 1, `compound-gpid.md:26` and `SYSTEM_DESIGN.md:319`.

Approval sources:
- Steps 2 wording and global file: user prompt of this session,
  2026-10-29T17:19:24Z ("Project-wide rules (approved 2026-10-29)").
- `SYSTEM_DESIGN.md:319` (Decided item): user reply "approve 319" at
  2026-10-29T17:21:03Z in session `ses_e78279414ffeTlRWrKrGY33g1z`, recorded in
  `outputs/pipsystem/rules-reset-follow-up/20261029T172103Z-orchestrator/handoff.md:20-30`.
  Verified here with `kilo_local_recall` search: user message part
  `prt_188adf086004vCmW65R7ofRBjG` reads "So, 1. approve 319 ...". The peer
  note that pointed to it was not taken as approval by itself.

## Changes

All uncommitted.

- `AGENTS.md`: rule 1 reworded (two `pip-orchestrator` exceptions: Git on
  instruction, small reported package changes). New section "Working
  Principles" (lines 19-54) with Minimal first and Autonomy copied from
  `ORCHESTRATOR.md`. "Package files" bullet (lines 81-85) states the rule.
- `compound-gpid.md:26`: reworded to the same exception, with references.
- `SYSTEM_DESIGN.md:319`: reworded; approval source line added after the
  section 11 list (line 323).
- `ORCHESTRATOR.md`: the two principle subsections replaced by a pointer to
  `AGENTS.md` (one copy, no drift); the "until the three rules change"
  condition removed; Gaps updated with the permission test result.
- `.cg-docs/orchestration/CONTRACT.md`: Gaps line on untested permissions
  replaced by a pointer to the permission-test handoff.
- `C:\Users\wb384996\.config\kilo\AGENTS.md`: new sections "Minimal First"
  (line 20) and "Autonomy" (line 35). The ask-list item for decided items is
  generalized ("an item that the project marks as decided or protected"); a
  closing line keeps the storage rule in force. Not under Git: the previous
  version is saved as `global-AGENTS.before.md` in this run folder (SHA-256
  before edit `88D1756F585B0328FC08447553520652B72127EE3B88ABECB4EC9C2CD8832B43`).

## Checks run

- `git diff -- compound-gpid.md SYSTEM_DESIGN.md`: one changed line in
  compound-gpid.md; one changed line plus one added approval line in
  SYSTEM_DESIGN.md. No other lines touched.
- Readback of `AGENTS.md` (90 lines) in full.
- `grep '^## '` on the global `AGENTS.md`: sections in order Storage,
  Minimal First, Autonomy, End-to-End Plan Execution, Communication, Skill
  Assessment, Final Ending.
- Not run: a fresh session to confirm agents pick up the new global rules.

## Gaps

- The global rules take effect for new sessions; this session already loaded
  the old global file.
- `SYSTEM_DESIGN.md` line references in other files (`:319`) now point to the
  reworded line; the added approval line shifts later line numbers by 2
  (section 12 starts at line 325, was 323). Older citations of lines after
  321 in other files may be off by 2. UNKNOWN how many exist.
- All rule changes since `a0eb61f` remain uncommitted (no commit instruction).
