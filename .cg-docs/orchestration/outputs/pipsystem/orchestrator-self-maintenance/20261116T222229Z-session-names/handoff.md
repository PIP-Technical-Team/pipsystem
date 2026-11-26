---
schema: pip-handoff-v2
project: pipsystem
task: orchestrator-self-maintenance
run: 20261116T222229Z-session-names
status: completed
updated: 2026-11-16T22:30:12Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE (explicit bounded rule maintenance)
next: Use the new naming field in future prompt cards; load saved instruction changes in a fresh session or reload after the current worker finishes. Monitoring continues independently.
---

# Suggested session names in setup cards

## Summary
The user requested a durable suggested session name with every prompt setup
card, alongside project/model/effort/worktree information. Use the exact label
`Suggested Session Name`; meaningful, task-related and at most six words.
This is naming advice, not permission to create/rename a session automatically.

Saved the rule in all four mandated project reference/configuration files.
Functional consistency/JSON checks passed. The running worker was not
interrupted, renamed, reprompted or assigned a new scope.

## Changes
- ORCHESTRATOR.md: new label in required fields and external-card template;
  task-specific, meaningful, at most six words; no automatic session naming.
- AGENTS.md coordination and CONTRACT.md: matching field/limit, external-card
  placement and naming-advice-only rule.
- kilo.json: append the naming preference to the existing orchestrator
  description. Its existing prompt imports ORCHESTRATOR.md, which supplies the
  operative nine-field rule. Preserve the long inline prompt and every other
  model/permission/provider setting unchanged rather than rewrite mixed work.
- Temporary snapshots/test/logs under
  `.tmp/orchestrator-self-maintenance/20261116T222229Z-session-names/`.
- All four already have pending changes. Apply narrow additions; do not replace
  their existing content or claim to own unrelated differences.
- No pipeline, package edits, Git mutations or running-worker changes.

## Checks run
- Read current four reference/config files and targeted Git status on main.
- Inspected actual worker startup checkpoint; independent monitoring wakeup is
  recorded in `qmd-working-release/20261116T222229Z-monitor/handoff.md`.
- Pre-edit snapshots captured the already dirty four files. Red consistency
  check exited 1 before the new label existed. Green check exited 0:
  label/meaning/six-word cap present in all references; JSON parses; resolved
  canonical prompt import provides all nine fields; unrelated JSON settings
  and the existing literal prompt are unchanged.
- Kilo's config-validation result also reported success after the JSON edit.
- Inspected zero-context task diffs against snapshots; only the requested
  naming additions/description changed. Task-only whitespace checks passed;
  Git printed existing LF/CRLF normalization notices. No Git mutation.
- Inspected canonical `tools/pipsys/kilo/commands/pip-next.md:187-194`: it
  delegates metadata to ORCHESTRATOR.md and has no contradictory field list.
  No command/agent definition or installed copy changed, so no install-kilo
  operation was needed.
- Example suggestion `Working Release Initialization` is three words. This
  is not a claim that the existing worker session has that actual title.
- No pipeline/worker tests, package/source edits, client setting changes,
  credentials, installations, C: writes or session/worktree creation.

## Gaps
- Saved configuration changes require reload/fresh session for instruction
  activation. Do not interrupt the active worker to force a reload.
- No separate persistent-memory tool is available; durable project instructions
  and this record will hold the user preference.
- Text/config checks do not independently certify future model behaviour.
  Existing issued prompts are historical records and were not rewritten.
- All changes remain uncommitted with their pre-existing mixed-owned changes;
  no commit/push authority was requested or inferred.
