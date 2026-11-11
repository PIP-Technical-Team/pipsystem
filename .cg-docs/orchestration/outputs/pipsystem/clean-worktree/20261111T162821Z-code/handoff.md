---
schema: pip-handoff-v2
project: pipsystem
task: clean-worktree
run: 20261111T162821Z-code
status: completed
updated: 2026-11-11T16:39:06Z
owner: Code mode worktree cleanup
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 5cd51e22eb14939cace0145839f3a0b1d7a87f6e
plan: NONE
next: Publish the final four cleanup/assessment reports; final clean-status and live-remote verification are returned in the reply without another report edit.
---

# Clean Worktree Without Stashing

## Summary

The user still sees over 9,000 pending files and requests a clean worktree
without stashing. The count is real, not a stale editor display or staged
generated files. Initial normal status reports 9,692 entries; the index is
empty. Normal enumeration also reports Windows long-path warnings.

The user explicitly selected `Commit and push (Recommended)` for the
remaining real work on existing main, in logical checkpoints, without
stashing, deletion or history rewrite. That approval covers this cleanup
and preservation pass, not completion of the underlying survey/package work.

All original real source/evidence changes are now committed and pushed.
Only the four cleanup/assessment reports remain for the final record commit.
The final self-SHA, empty-status result and remote comparison are returned
in the reply, avoiding another report-edit/commit loop.

Read-only Git with command-scoped `core.longpaths=true` lists 9,680 untracked
paths. The large group is an additional baseline R/package installation in
`b/` beside `runtime/`, under the pipdata bootstrap diagnostic run. Its
launcher intentionally places temporary attempts beside runtime as well
(`runtime/run.ps1:11-17`); its handoff documents the baseline at `b/` and
short sibling temporary roots (`handoff.md:25,38-39,71-74`). The earlier
runtime-only exclusion did not cover these siblings.

## Changes

- Added a whole-run contents exclusion for
  `.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix/`,
  with an explicit exception for its durable top-level `handoff.md`.
- Preserved prior uncommitted scratch/runtime exclusions and every unrelated
  source/report change. No stash, reset, file deletion, move, package-source
  edit or Git configuration change performed.
- Committed and pushed `2562629bc6d6e0db6046ccbabac5ada6e2db9187`,
  `chore(git): ignore complete generated diagnostic runs`. This includes the
  prior uncommitted folder-wide scratch/runtime exclusions and the new
  whole-run exclusion with the durable handoff exception.
- Committed and pushed `76f739b04eb1e13d85c9c9c7dd551440702b7a1d`,
  `feat(experiments): preserve blocked one-survey execution checkpoint`:
  24 source/Plan/work/review/handoff files. The scenario and reproducer are
  synthetic; blocked numerical/storage/full-green status is retained.
- Committed and pushed `5cd51e22eb14939cace0145839f3a0b1d7a87f6e`,
  `docs(integration): preserve bootstrap fix and unresolved test gates`:
  five durable package/monitor documents only, including the new gate
  monitor record created during cleanup. No baseline/library/temp content.
- The fourth logical checkpoint contains this report, independent publication
  review, and the two earlier runtime-folder-hygiene assessment reports.
  All are durable records, not generated runtime folders.

## Checks run

- Verified root/main/full HEAD, index, Git status groups and worktrees.
- Read current ignore rules, Git-local excludes, generated run directory,
  launcher and durable handoff. No package repository source was read.
- Agent Manager shows the other local one-survey session idle. No session
  or process was started, stopped or instructed by this task.
- The only generated-runtime path already tracked is the historical site
  `.gitkeep`; no generated baseline/library files need to be untracked.
- Ignore checks passed for baseline `b/`, sibling temporary roots, runtime
  and future generated paths inside the run. Its top-level handoff and
  experiment/nested worker source records remain visible.
- After that change, status reports 32 real changes (14 modifications and
  18 new source/record files), without the earlier long-path warnings.
  A separate publication-review handoff is subsequently added for this pass.
- PowerShell parser passed for run.ps1, paths.ps1 and checks.ps1. R parser
  passed for setup.R, scenario.R and reproduce.R with E-only temp/home/cache
  settings. No R package, scenario, test suite or PIP pipeline was executed.
- Read-only path guard accepted the local experiment tree and rejected C:
  output before writes. Hooks directory contains only inactive samples.
- Initial live origin/main matched starting HEAD; the ignore checkpoint
  passed staged whitespace checks and was pushed normally.
- Independent documentary publication review found no confirmed credential,
  private/production payload, raw-conversation, binary or unusually large
  documentary publication blocker. Its required report is
  `../20261111T162821Z-publication-review/handoff.md`.
- Parent separately inspected the subsequently created
  `20261111T163528Z-gate-monitor/handoff.md`: bounded monitoring status,
  no dataset/credential payload, no completion claim. Included with the
  other package-monitor records, not treated as a new implementation pass.
- Staged survey JSON parsed successfully and retained status blocked.
  Explicit staged selections matched intended paths; text/binary and staged
  whitespace checks passed. Each of the first three commits pushed normally.
- Before the final report checkpoint, normal status listed exactly the four
  intended cleanup/assessment reports, with no other modified or new files.

## Preserved Development Caveats

- Survey execution remains blocked. Review completion does not establish
  numerical/storage readbacks or original Plan acceptance.
- Latest pipdata handoff reports a scoped fix, but its affected suite still
  has one failure and one error matching the baseline. That is not all-green
  completion or an immutable corrected package revision.
- Older active-state and monitor next actions remain historical snapshots;
  the latest package handoff supersedes their pre-fix submission gates.
  No historical status, prompt or metadata was silently rewritten.

## Gaps

- Exclusions do not remove files or reclaim disk space.
- No package tests, original survey scenario or pipeline were run for this
  Git-preservation pass; syntax/path/ignore/publication checks are not such
  acceptance evidence. No package repository source was inspected or changed.
- Diagnostic and survey workflows have their own unresolved gates; a Git
  checkpoint must not claim those development workflows are complete.
- A separate monitor remains scheduled and may later write fresh report
  updates. This task neither stops it nor promises a permanently clean
  checkout while other work continues. Final verification is point-in-time.
- Final report self-SHA/push/clean-status evidence is supplied in the reply.
