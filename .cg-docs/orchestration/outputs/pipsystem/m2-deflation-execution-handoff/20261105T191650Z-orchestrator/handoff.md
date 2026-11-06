---
schema: pip-handoff-v2
project: pipsystem
task: m2-deflation-execution-handoff
run: 20261105T191650Z-orchestrator
status: completed
updated: 2026-11-05T19:16:50Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 6e7e225ad97494bab11e5c4354dc6c6e1ab3f398
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-05-m2-deflate-one-survey-approved-contract.md revision 2
next: User sends the task block to the existing pipdata Code session; no worker or execution was started here.
---

# Where to authorize whole-Plan execution

## Summary
User says they are ready to execute cg-work and asks where authorization goes. Their decision is accepted; no repeat choice between execution/hold is needed. The package worker's previous task explicitly stopped before implementation, so it need not display a pending approval question. Send the direct execution instruction to that existing pipdata Code session; a message to this coordinator is not automatically delivered there. No new session/worktree is required.

## Changes
Only this new handoff. No package code, Plan, config, Git state or previous records changed by the coordinator. No execution, package tests/loads, new worker/session, schedule or publication started. Existing uncommitted worker/monitor reports remain.

## Checks run
- Actual clock 2026-11-05T14:16:50-05:00 / 2026-11-05T19:16:50Z (ET).
- Fresh package Git: E:/PovcalNet/01.personal/wb384996/PIP/pipdata, existing default/current PROD (origin/HEAD -> origin/PROD), HEAD 5680d7848dccb5fb2563129bbcd25809093d52bd. Only owned successor Plan untracked; no source conflict observed.
- Read all current successor lines: now revision **2**, not the revision 1 observed in the earlier monitoring outcome. Actual saved Git blob e7a4cbae27979e732d5790fd4a5a79a8bdb2975f matches the newer original r2 review.
- Reread original worker handoff and plan-critic-r2-review-and-verify.md in outputs/pipdata/m2-deflation-plan-alignment/20261105T161435Z-proposed/. The newer review identified two P1 ordering conflicts in r1; both fixed in r2, 0 open and 0 new P1/P2/P3. Worker-reported parser/whitespace checks passed; this coordinator did not rerun them or package tests.
- R2 explicitly permits separately authorized Step 1 entry/runtime/lifecycle preparation while execution-gate remains blocked, gates Step 2 on actual Step 1 evidence and performs acceptance review/verify before completion. Do not ask the worker to bypass or edit execution-gate.
- Read package-installed cg-work.md completely and cg-review.md scope/routing/verify portions plus full review-routing.contract.md. Work frontmatter edits are restricted to status/completed-date/failing-steps/completed-phases/current-phase/execution-report. Auto routing uses eight standard agents for data/architecture, adding learnings/adversarial only for full; verify is light-only. R2 fixes review ordering without editing installed commands.
- Root main 6e7e225ad97494bab11e5c4354dc6c6e1ab3f398; prior worker/monitor records dirty and newer r2 review untracked. Root/.tmp/pipsys on E, no links shown. Existing pipsys check-path returned inside/exit 0 before this new handoff.

## Setup — for the user, outside the task block

- **Project Name:** pipdata
- **Branch:** Default/current — PROD; existing
- **Worktree Requirement:** No — reuse E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Model Family Recommendation:** Powerful (Sol/Opus) — cross-package calculation, request-proof and contained-runtime implementation
- **Effort:** high
- **Target Project:** pipdata — E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Target Environment:** Existing PROD checkout at E:/PovcalNet/01.personal/wb384996/PIP/pipdata; no new branch/worktree or switching
- **Target Agent:** Code mode — reuse the session that prepared/reviewed the Plan

Copy only the following task block. Model/effort are user setup advice, not task instructions. Estimate 20-45 minutes for implementation/tests/review after preflight; genuine dependency/runtime blockers can extend it. No deadline is implied.

## Task block

```text
/cg-work review:auto deviate:auto

I authorize execution of the whole reviewed Plan, revision 2:
E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-05-m2-deflate-one-survey-approved-contract.md

Use this exact Plan, not whichever Plan sorts newest. Before progress writes, validate it with the installed artifact workflow. Expected pre-start source blob is e7a4cbae27979e732d5790fd4a5a79a8bdb2975f. Verify repository/checkout E:/PovcalNet/01.personal/wb384996/PIP/pipdata, existing PROD branch and audited base 5680d7848dccb5fb2563129bbcd25809093d52bd; report material drift or mismatch rather than silently switching/creating environments. Preserve the owned untracked Plan and unrelated work.

Act as the single execution owner and record the actual owner/base/branch. This instruction covers both steps, Plan-scoped runtime/lifecycle outputs, tests, required reviews, fixes and verification. Start with Step 1 entry checks and bounded runner/source/store preparation; advance to Step 2 only after its prerequisites pass. Do not wait for preflight results before performing the preparation that produces them. Do not flip execution-gate or alter non-permitted Plan fields. No routine stage-by-stage authorization is needed.

Read the original r2 review:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/m2-deflation-plan-alignment/20261105T161435Z-proposed/plan-critic-r2-review-and-verify.md

Keep all fixed D1-D3/D8 decisions. Prove V1-V7 through actual execution: contained parent/child sources, actual same-store pins, numerical/dynamic-year/LCU/row/weight controls, request mutations, invalid no-save and exact payload/semantic-metadata readback. Run every block in the six selected files, including restart/junction; no exclusions, weakened assertions or historical-pass substitutes.

You may run tests and route-selected reviewers without asking: cg-code-quality, cg-testing, cg-documentation, cg-version-control, cg-reproducibility, cg-performance, cg-architecture and cg-data-quality; add cg-learnings-researcher/cg-adversarial only if the installed auto route requires full. Apply statistical/dependency emphasis as appropriate. Complete the acceptance review inside Step 2 before V7/completion, fix every applicable finding including P3 within the Plan's budgets, rerun affected checks and finish /cg-review mode:verify. Reuse that exactly-once dispatch at the later work-command handoff. Do not mark completion with missing evidence.

Minimal first: smallest end-to-end result; safeguards only against almost-irreversible harm, reversible extras Later; one functional check per change; installed tools first/dependencies only when worthwhile; any Plan about two pages. Other authorized reversible work proceeds without asking. Pause for genuine material or protected/scope decisions, almost-irreversible actions, denied permissions, irresolvable required checks or exhausted correction budgets—not routine continuation.

Use only the Plan's declared source/test/docs/runtime/lifecycle sets. All files/temp/home/cache/log/library and child-process outputs remain on resolved E paths; inspect hooks before loading. No C fallback, dependency-package edits, shared install, production access, roadmap/design change, Git mutation or branch/worktree creation. This grants no commit/push/merge permission.

After entry checks and Plan validation, create status running and checkpoint/finalize a pip-handoff-v2 report at:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/m2-deflation-work/20261105T191650Z-code/handoff.md

Check that destination with the existing pipsys check-path before writing. This exact central handoff and its support evidence are explicit additional report outputs; retain the Plan's package-local execution/review reports too. Record exact commands/counts, artifact pins, loaded-source identities, review paths/findings and nonempty Gaps. Report blocked/no-change honestly; no chat-only completion.

Estimate: 20-45 minutes after preflight, not a deadline.
```

## Gaps
This is a prepared execution handoff, not executed work. Future loaded-source compatibility, finished runner, new artifact pins, final adapter closure and numerical/runtime/review evidence remain unperformed until the package session proceeds. Newer r2 review supersedes r1 review-only closure for execution targeting. No package tests, implementation, session start, Git publication or configuration reload was performed by this coordinator. The user must send the task block to the package session; no hidden approval dialog or automatic cross-session transmission exists.
