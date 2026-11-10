---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-commit-verification
status: completed
updated: 2026-11-10T22:34:51Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: User submits resume-prompt.md in pipsystem Code mode to start the fresh original-Plan attempt; no pipeline execution by pip-orchestrator.
---

# Corrected pipfun revision and survey resumption

## Summary
Read-only Git verified pipfun on PROD at `7d534516a8c17c33d537681610eccd4c29211762`, with a clean index/worktree and one commit ahead of the local origin/PROD tracking ref. The commit contains only the reviewed cache fix and focused tests. The original survey Plan remains incomplete; no experiment was run here.

## Changes
Created this coordination report and `resume-prompt.md` with external setup card and separate copyable task. No package, runtime, Plan, active-state, source-pin or Git mutations made by this review. Existing pipsystem changes preserved.

## Checks run
- Read updated package handoff `outputs/pipfun/practical-integration-tests/20261110T152620Z-cache-fix/handoff.md:67-94` (paths relative to `.cg-docs/orchestration/`). It reports a local commit and no push.
- `git status --short --branch`, `git rev-parse HEAD`, `git log --oneline -3`, `git show --stat --oneline HEAD`, complete committed two-file patch and `git show --format= --check HEAD` inspected in pipfun. Whitespace check passed.
- Read original Plan and installed Work command. Read current experiment setup/launcher. `setup.R:17` still pins the old pipfun SHA and `:24` limits installation to stamp/pipfun. A pin-only change would not complete original setup.
- Read package review evidence: original working-tree tests support the bounded NULL-vintage fix; no fresh committed-snapshot installation is inferred.
- Verified commit parent `0c6a78d9884ed0965a524311537eec2a5095d60b`. Committed blobs are `074edd712fb2682a76d284a2b2809fc2e27c9052` for R/pip_create_globals.R and `dda1e7066823cb7518c90e9a48e9c314d0b7ebd3` for the test file, exactly matching independent testing-review handoff line 44.
- Prepared the original-Plan resumption rather than another design Plan. The prompt explicitly proposes a new recorded correction budget when submitted; no budget or pin changed in this review.
- Read both saved artifacts back; verified setup labels, original Plan revision, exact SHA, complete report path, review agents, nonempty Gaps and exclusion boundaries. No R/test commands executed.

## Gaps
- Committed-snapshot installation, downstream pipaux installation, survey validation/cleaning, exact-version data/metadata readback and malformed-input rejection remain unexecuted in this review.
- Existing non-NULL-vintage directory creation and legacy test isolation limitations remain as recorded in the package review; they do not invalidate the bounded cache fix but do not grant write-safety assurance.
- Remote state was not fetched; ahead count is against the local tracking ref, and absence of a push is worker-reported, not an audit of remote history.
