---
schema: pip-handoff-v2
project: pipsystem
task: instruction-setup-review
run: 20261126T012230Z-commit-retire-pickup
status: completed
updated: 2026-11-26T01:30:00Z
owner: Claude Code (Opus 5.5), VS Code, macOS
repo: /Users/acastanedaa/Developer/pip/pipsystem
branch: main
head: 77c75c47e6bcb55137b963635ec3a2e857ce6762
plan: NONE (user instruction in chat, 2026-11-25)
next: User reloads the VS Code window so Kilo loads the new commands; decides on push
---

# Commit the review and retire pip-pickup

## Summary
Follow-up to run `20261125T225410Z-review`. The user told me to commit the
16 review files, retire pip-pickup and remove the temp worktree. All three
are done. Package work is now only by direct edits from pipsystem (the agent
or an internal subagent); there is no package-session pickup. Nothing is
pushed.

## Changes
- Commit 77c75c47e6bcb55137b963635ec3a2e857ce6762: the 16 review files plus
  the run `20261125T225410Z-review` handoff.
- Second commit (this run, SHA reported in chat): pickup retired.
  - Deleted `tools/pipsys/kilo/global/pip-pickup.md`.
  - CONTRACT.md: "Package Assignment Pickup" replaced by a short "Internal
    Package Work" section (the internal-Task rule it held); Gaps notes the
    retirement and that old `assignment.md` files are records.
  - ORCHESTRATOR.md "Dispatch and return": items 1-3 (assignment.md,
    `/pip-pickup` dispatch) removed; the verification of the exact run's
    handoff kept as a paragraph.
  - AGENTS.md: package work is direct edits only; `pickup-path` dropped
    from the pipsys Rule; `outputs_dir()` citation now
    `tools/pipsys/pipsys.R:180-182`.
  - kilo.json description and pip-next.md saved-prompt rule: no fallback.
  - pipsys.R: `pickup-path` subcommand, usage line and `pickup_path()`
    removed. tests/pipsys/test-pipsys.R: its pickup test removed.
- Temp worktree /Users/acastanedaa/temp/pip-instruction-review/wt removed
  (`git worktree remove --force`) after `cmp` showed each of its 16 edited
  files identical to 77c75c4; the folder and its two logs deleted.

## Checks run
- Start: Git root /Users/acastanedaa/Developer/pip/pipsystem, branch main,
  HEAD 8a140d151dd4c167722a6e07f220d72cd242bf4c.
- `git grep -i pickup` over AGENTS.md, ORCHESTRATOR.md, kilo.json,
  CONTRACT.md, tools/, tests/: only the retirement note in CONTRACT Gaps.
- `install-kilo` ok; `status pipsystem`, `handoffs pipsystem` exit 0;
  `pipsys.R bogus` prints the usage without pickup-path, exit 1.
- test-pip-next.R: 11 tests, 0 failures. test-pipsys.R (macOS): 38 tests,
  1 failure + 13 errors (before: 1 + 14; the removed pickup test was one of
  the Windows-fixture errors).
- Windows: NOT RUN.

## Gaps
- A Windows machine may still hold an installed global `pip-pickup`
  command in Kilo's global commands folder; delete it there by hand (UNKNOWN
  whether one exists).
- `.cg-docs/plans/2026-11-18-package-assignment-dispatch.md` and old runs
  with `assignment.md` describe pickup; left as historical records.
- Not pushed. The Brain files, experiments/, .Rprofile, dev-library and
  m2-step06 files from another session stay uncommitted and untouched.
- The Gaps of run `20261125T225410Z-review` still apply (Windows tests,
  stale docs, charter edits, Claude Code port), except the pickup item and
  the temp worktree, which this run closes.
