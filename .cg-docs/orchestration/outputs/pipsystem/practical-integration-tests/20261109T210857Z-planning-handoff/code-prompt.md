# Code mode: first installed-package experiment

## Setup

- **Project Name:** pipsystem
- **Branch:** default/current — `main`; existing
- **Worktree Requirement:** No — existing checkout; `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`
- **Model Family Recommendation:** Standard — bounded scripts and tests, without package redesign
- **Effort:** high
- **Target Project:** pipsystem — `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`
- **Target Environment:** existing `main` branch and existing checkout at `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`; no new branch or worktree
- **Target Agent:** Code mode

Only the fenced task block below is the copyable prompt. No approved saved implementation Plan exists yet. The prompt retains the required completion-contract approval before saving the Plan, then requests review and end-to-end implementation. Estimated duration: 60–120 minutes excluding approval waits and any dependency blocker; estimate only.

## Task

```text
/cg-plan deviate:auto

Verify root/checkout E:/PovcalNet/01.personal/wb384996/PIP/pipsystem, branch main. Stay there; report mismatches without switching or creating environments. Preserve existing changes.

Build and run one readable offline example against installed packages: synthetic survey validation, cleaning, metadata, saving and exact readback. The user confirmed this approach on 2026-11-09. Deflation and one mean come next, not in this first increment. Exclude live DLW, production and incremental-rebuild certification.

Plan: NONE yet. Prepare .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md, revision 1, about two pages. Obtain the required completion-contract approval before saving. Validate it, run /cg-plan-review and fix ALL findings including P3. After that approval and review, execute the entire saved Plan with /cg-work review:auto deviate:auto through tests, fixes and final /cg-review mode:verify. No routine phase confirmations; preserve required command gates.

Read-only inputs in E:/PovcalNet/01.personal/wb384996/PIP/pipdata (observed PROD, 13a38280c1eafe7e03a97837cdb57833fbe9d926; recheck):
- vignettes/articles/PIP-data-pipeline.Rmd, Processing-Data.Rmd and Validating-Data.Rmd.
- tests/testthat/helper-one-survey-upstream-acceptance.R and test-one-survey-upstream-acceptance.R: reuse fixture values, not the internal harness.
Read pipsystem SYSTEM_DESIGN.md and .cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261109T205401Z-assessment/handoff.md. Existing .tmp acceptance runners use load_all() and obsolete branch assumptions; do not copy them. Prior passes are not current proof.

Create experiments/one-survey/setup.R, scenario.R and a small package-revision inventory. Add only a thin PowerShell launcher if needed to set paths before R starts. Generated libraries, snapshots, stores, logs and caches belong under pipsystem/.tmp/one-survey/. No framework, Quarto layer or general installer.

Install required PIP packages from exact recorded Git snapshots into one dedicated library for this combination. Inspect repositories read-only and record every SHA; never install dirty trees or moving branches. Reuse/copy suitable installed third-party dependencies into that library, recording versions/provenance without modifying source libraries. No blanket upgrades, scenario-time installation or silently unpinned dependency downloads.

Use a fresh R process, explicit libraries and no ambient user/site fallback; read-only base/recommended R libraries may remain in the R installation. ALL writes must resolve inside this E checkout, including indirect writes: set TEMP/TMP/TMPDIR and relevant home/R/cache/log paths BEFORE child processes start. Inspect startup hooks. Isolate TEST configuration, stamp aliases, manifests and storage from shared/production state. No shared-library or client-setting changes.

Use real documented processing/storage functions. Substitute only external transport, disclosing substitutes and fixture-only inputs. Prefer exports; expose a broken documented path rather than bypassing it through internal workers or a second orchestrator. Check row-aligned annual welfare 365,730,1095,1460 becomes daily welfare 1,2,3,4, weights stay 10,20,30,40, and data/metadata read back at exact saved versions. Add one malformed-input rejection/no-output control. Record loaded package paths/versions and expected/actual results. Use data.table/collapse where applicable.

Do not edit other packages. Save the first package failure as a minimal reproducer and proposed direction for its owner; never weaken expectations. Captured failure is useful learning, not a pass or completed required verification.

Minimal first: smallest complete example; safeguards only for almost-irreversible failures; one functional check per change; installed tools, dependencies only when worth their cost; Plan about two pages. Ask only for required command approval, almost-irreversible actions, protected/Decided design or scope changes, Git commits/pushes/merges, or non-generated deletion. Otherwise proceed autonomously. No commits, pushes, merges, production/shared changes, charter/roadmap edits or new visible sessions are authorized. Limit harness corrections to two attempts per step; report remaining blockers.

Expected automatic review route full (installation paths): cg-code-quality, cg-testing, cg-documentation, cg-version-control, cg-reproducibility, cg-performance, cg-architecture, cg-data-quality, cg-learnings-researcher and cg-adversarial. Run reviewers, tests, in-scope fixes and reports without asking; resolve all applicable P0-P3 findings and finish mode:verify. Emphasize isolation/numerical correctness; disclose unavailable tools and unexecuted checks.

Create and update this exact handoff at start, checkpoints and exit:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261109T210857Z-code/handoff.md
Use .cg-docs/orchestration/CONTRACT.md pip-handoff-v2 frontmatter and Summary, Changes, Checks run, nonempty Gaps. Save normal Work/Review Reports too. UTC in files, ET in chat; no credentials, production data or raw conversations. Report checks/results, package SHAs, evidence paths, unchanged package repositories and next owner/action. Estimated duration: 60–120 minutes excluding approval waits/dependency blockers.
```
