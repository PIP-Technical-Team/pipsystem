---
schema: pip-handoff-v2
project: pipsystem
task: orchestrator-self-maintenance
run: 20261121T133329Z-decision-preference
status: completed
updated: 2026-11-21T13:35:12Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: Use the preference in this conversation; the edited configuration loads on the next project reload.
---

# Decision preference and pros/cons tables

## Summary

The user requested that routine decisions follow the recommendation and that
any choice put to the user include a pros and cons table.

## Changes

Added the decision rule to `AGENTS.md`, `ORCHESTRATOR.md`, the
`pip-orchestrator` prompt in `kilo.json`, and `CONTRACT.md`. Kept protected
decisions and required approval gates. No Git mutation.

## Checks run

Verified the hub checkout and reviewed the four files' existing uncommitted
edits before changing them. Kilo validated the updated config; independent
PowerShell JSON parse, prompt text assertion, and `git diff --check` passed.

## Gaps

No project reload or new session was performed. The new files are saved;
the conversation can already follow the user's direct preference.
