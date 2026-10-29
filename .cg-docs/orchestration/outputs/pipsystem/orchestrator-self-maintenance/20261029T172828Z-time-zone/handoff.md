---
schema: pip-handoff-v2
project: pipsystem
task: orchestrator-self-maintenance
run: 20261029T172828Z-time-zone
status: completed
updated: 2026-10-29T17:31:00Z
owner: pip-orchestrator (session ses_e78279414ffeTlRWrKrGY33g1z)
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: a0eb61f8e00275b242e91b5ae8f42d7039d46abf
plan: NONE (user request 2026-10-29T17:28:28Z: "change the time zone to Eastern standard time (NY time)")
next: Plan A status script and site show times in New York time; check at the scheduled follow-up
---

# Time Zone: New York Time For People, UTC In Files

## Summary

Times shown to people (chat, status commands, site) use New York time
(`America/New_York`, "ET"). On 2026-10-29 New York is on EDT (UTC-4); EST
(UTC-5) starts on 2026-11-01. Files, run IDs and tool arguments keep UTC, so
existing and new records sort in one order, and the repeated hour on
2026-11-01 (1:00-2:00 a.m. happens twice in New York) cannot make a timestamp
ambiguous.

## Changes

- `ORCHESTRATOR.md`, Tools section: added the time-zone rule.
- `.cg-docs/orchestration/CONTRACT.md`, handoff rules: added the UTC-in-files,
  ET-for-people rule.
- Note for session `ses_e775390f8ffe4GUSm1QzDyITAg` (so Plan A shows ET): the
  first send at 2026-10-29T17:31Z was refused (pending permission request);
  resent and accepted at 2026-10-29T17:36Z (queued behind active work).

## Checks run

- Read both target passages just before editing: no changes by the other
  session. Both edits applied.

## Gaps

- Global `AGENTS.md` is not changed (the running session edits it now). Other
  projects still show whatever their agents choose.
- The running session loaded its rules before this change. It gets the rule
  only through the queued note, which arrives after its current turn.
