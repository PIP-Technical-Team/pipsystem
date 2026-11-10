---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T210857Z-planning-handoff
status: completed
updated: 2026-11-09T21:11:00Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: NONE
next: User starts Code mode in the existing pipsystem main checkout with code-prompt.md and approves its concrete completion contract when presented; that session then plans, reviews and implements the baseline.
---

# Installed-package experiment implementation handoff

## Summary

The user confirmed the proposed scripts-first approach and asked whether implementation belongs in another Code mode session, requesting its prompt. Recommended target: Code mode in the existing pipsystem main checkout. No Agent Manager session or worktree is started.

The installed planning workflow requires a completion-contract preview and user approval before saving a Plan (`.kilo/commands/cg-plan.md:193-211`). The earlier confirmation approved the approach, not a not-yet-presented completion contract. Therefore this handoff must start with planning rather than claim an approved, reviewed Plan or start `/cg-work` directly. No canonical Plan is created or reviewed in this session.

## Changes

- This handoff and its adjacent `code-prompt.md` are the intended new artifacts.
- Saved the complete copyable prompt in `code-prompt.md`, with an external eight-field setup card. It starts with planning because there is no approved saved Plan; it covers Plan review and full implementation after required completion-contract approval. Deflation and mean remain the next increment after baseline evidence.
- No package changes, commits, pushes, branch/worktree creation, charter/roadmap changes, package installation, or scenario execution.

## Checks run

- Read current installed planning, plan-review, work, review-routing, goal-execution and artifact-view contracts.
- Read-only Git: pipsystem main at `f9454707b292a620e25abef17f2e515794020ba7`, default branch origin/main; only the preceding task assessment folder was untracked before this run.
- Read-only Git: pipdata PROD clean at `13a38280c1eafe7e03a97837cdb57833fbe9d926`.
- Read pipdata's prior upstream acceptance Work Report, its runner, and the first 260 helper lines. Historical test-pass claims in that Work Report were not independently rerun.
- Current local runner source has an obsolete feature-branch check (`pipdata/.tmp/one-survey-upstream-acceptance/run.ps1:55`) and loads sources through `pkgload::load_all()` (`runtime.R:37`). It is not an installed-package baseline and must not be copied wholesale.
- Helper source provides four-row annual welfare `365,730,1095,1460` and person weights `10,20,30,40` (`tests/testthat/helper-one-survey-upstream-acceptance.R:122-131`); previous assessed test source checks daily welfare `1,2,3,4` and exact readback (`test-one-survey-upstream-acceptance.R:199-238`).
- Review routing: installation/update paths trigger full review, which includes the standard eight agents plus learnings-researcher and adversarial (`.kilo/shared/review-routing.contract.md:10-14,58-70`).
- Read back the saved prompt and checked external setup fields, first-line command, explicit no-existing-Plan status, target consistency, E-only indirect writes, package read-only boundary, review agents, functional expectations, report path and approval limits. This is a prompt consistency check, not a Plan critique or runtime test.
- Final Git status still showed pipdata clean and only this task's output tree untracked in pipsystem. `git diff --check` returned no tracked whitespace errors; it does not validate these untracked Markdown files.

## Gaps

- No approved saved implementation Plan or Plan review exists for this new experiment. The Code session must obtain the required completion-contract approval, save and validate the Plan, review it, and resolve all findings before implementation.
- Available source/dependency versions beyond pipdata, installed-package setup feasibility, startup hooks, and functional scenario results remain UNKNOWN and require inspection/execution in the Code session.
- The first increment is the offline validation/clean/save/readback baseline. Deflation and one mean follow that evidence; they are not quietly included in baseline completion or claimed as tested.
- pip-orchestrator does not run the pipeline. The new session is for a disposable development experiment, not production execution or a new release orchestrator.
