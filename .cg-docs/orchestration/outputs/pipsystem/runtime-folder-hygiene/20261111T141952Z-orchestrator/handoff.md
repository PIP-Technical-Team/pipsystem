---
schema: pip-handoff-v2
project: pipsystem
task: runtime-folder-hygiene
run: 20261111T141952Z-orchestrator
status: completed
updated: 2026-11-11T14:22:50Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 506d8aa80230a32f6f6beee478c98a65488aa74e
plan: NONE
next: Folder hygiene and renv assessment are complete; no renv trial is recommended for this request.
---

# Generated runtime folder hygiene

## Summary

The user requested folder-wide Git exclusions after the pending-file count
grew beyond 9,000, and a recommendation on whether to try renv.

Initial Git inventory: 9,848 untracked files. Of those, 9,833 are under
`.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix/runtime/`.
The prior rule excluded only pipfun runtime folders, not other packages.

Folder-wide exclusions are now verified: normal Git inventory fell to 17
untracked source/record files, including this task's two handoffs. No
generated runtime/scratch/virtual-environment files remain visible. The
existing files are preserved on disk. No renv dependency or activation was
introduced because it would not solve this Git-visibility problem.

## Changes

- Before editing, `.gitignore` had no uncommitted changes.
- Replaced run/task-specific scratch rules with root `/.tmp/`.
- Replaced the pipfun-only runtime rule with
  `/.cg-docs/orchestration/outputs/**/runtime/`, covering whole runtime
  directories for every package, task and run.
- Added root `/.venv/` for the existing local Python environment. Git lists
  no tracked files there. Removed the now-redundant pipsys scratch exception.
- Source, tests, Plans, reviews and handoffs stay outside these exclusions.
- No generated files were deleted or moved. No other session's files were
  edited, and no package repository or client configuration was changed.
- A bounded renv assessment is delegated separately; no installation,
  activation, package execution or dependency change is authorized by that
  research assignment.

## Checks run

- Verified expected root/main, full HEAD, current `.gitignore`, and pending
  Git path groups. The checkout contains unrelated survey work; preserve it.
- `git ls-files -- .tmp` reports no tracked scratch files.
- The only tracked output-runtime path is an existing historical `.gitkeep`
  under the pipeline-docs-site task. An ignore rule does not remove tracked
  files; keep this intentional placeholder.
- Five positive Git ignore probes passed: root scratch, root virtual
  environment, actual pipdata and pipfun runtime paths, and a future-package
  runtime path. These test folder-wide behavior without creating fixtures.
- Seven negative probes passed: representative experiment source, tests,
  Plan, review and handoff paths remain visible. `--no-index` checks prevent
  tracked status from hiding a rule error.
- `.gitignore` whitespace check passed. The Git index remains empty.
- After edits, Git reports 17 untracked files: the 15 original non-runtime
  source/record files plus the two handoffs for this request. Zero untracked
  scratch, virtual-environment or output-runtime paths remain visible.
- The pipdata runtime now contains 9,835 ignored files, including two that
  were already ignored before this change; 9,833 were newly removed from
  normal Git status. The recorded baseline count was 9,848 untracked files.
- Final repeat confirmed 17 untracked files, zero generated paths visible,
  a clean `.gitignore` whitespace check, and unchanged HEAD
  `506d8aa80230a32f6f6beee478c98a65488aa74e` at 2026-11-11T14:22:50Z.

## renv Decision

Do not introduce renv for this request. The conditional trial was contingent
on recommending it as a useful alternative; this assessment does not.

- renv provides project package libraries, version recording/restoration,
  and a shared package cache. It does not manage the R interpreter,
  arbitrary test outputs or every temporary/cache write.
- The current harness already has dedicated libraries and exact ecosystem
  source pins. Its inventories are not portable restore lockfiles; fresh
  machine restoration could be a later reason to evaluate renv.
- This harness deliberately bypasses normal profile startup and rejects
  redirected package paths. Normal activation/cache linking would require
  deliberate integration rather than a drop-in replacement. E:-only
  cache/temp/output configuration would still be necessary.
- Reference: `../20261111T141952Z-renv-assessment/handoff.md`, including
  citations to current experiment sources and official renv documentation.

Later: reconsider renv for a demonstrated dependency-restoration need, not
to remove generated paths from Git status. No runtime architecture rewrite,
retention cleanup, new framework or further safeguard is proposed here.

## Gaps

- Ignore rules do not delete generated files or reduce their disk use.
- No renv trial, package installation, R/pipeline execution or fresh-machine
  dependency-restoration test was run. The recommendation uses bounded
  source/documentation inspection, not an execution certification.
- No commit/push is performed for this new request without task-specific
  authorization. Existing development work remains outside this edit.
