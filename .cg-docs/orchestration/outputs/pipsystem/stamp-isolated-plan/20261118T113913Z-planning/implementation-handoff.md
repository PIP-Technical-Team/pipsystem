# Gated Implementation Handoff

**Not execution approval.** Use this task only after the user explicitly approves
isolated branch/worktree setup, local Plan execution and any required disposable
E: under-test package staging. The worktree has NOT been created. Do not paste
the task in the pipsystem workspace or silently create/switch environments.

## Setup
- **Project Name:** stamp
- **Suggested Session Name:** Stamp latest-pointer reconciliation
- **Branch:** feat/catalog-latest-reconcile - proposed new, based on submitted0.1.1 commit56a1474f0fa251bcf655c78eb10e4ebae76d5611
- **Worktree Requirement:** Yes - proposed new E:/PovcalNet/01.personal/wb384996/Rpackages/stamp-latest-reconcile; explicit creation approval still required
- **Model Family Recommendation:** Powerful - storage integrity/locking and compatibility reasoning; Standard/high is an economical alternative
- **Effort:** high
- **Target Project:** stamp - E:/PovcalNet/01.personal/wb384996/Rpackages/stamp-latest-reconcile
- **Target Environment:** Proposed separate git worktree/new branch from submitted0.1.1; protect existing ready_cran checkout and archive
- **Target Agent:** Code mode in the package worktree, not pipsystem

```text
/cg-work E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-11-18-stamp-catalog-latest-reconciliation.md review:auto deviate:ask

Only execute after the user has explicitly authorized and created the isolated
worktree/setup. Verify root
E:/PovcalNet/01.personal/wb384996/Rpackages/stamp-latest-reconcile,
branch feat/catalog-latest-reconcile and submitted base
56a1474f0fa251bcf655c78eb10e4ebae76d5611. Report mismatch; do not create/switch.

Execute both Plan steps and required reviews without routine phase confirmation.
Implement only the proposed additive opt-in reconciliation API, package tests,
generated public docs/export and unreleased note. Preserve all old public
signatures/defaults/returns/errors/serialization/lifecycle and legacy locking.
No repair on load/init/read/save. Effective artifact-then-catalog locks and fresh
in-lock gates are mandatory for new apply. No history/payload/provenance changes.

Existing source checkout ready_cran, submitted archive/version, CRAN-SUBMISSION,
cran-comments, current libraries/pins and all shared data remain untouched.
No installs/downloads, Git mutations, version bump, submission, private/live
namespace patches, source data refresh, pipeline or shared application. Disposable
under-test staging/install is allowed ONLY if explicitly included in execution
approval, fresh E: directories and safe existing harness; no dependency/user/
checked-library install. Otherwise block required V3, never waive it.

Read package instructions/charter and relevant R shared/technical/data.table/
collapse/testing skills first. Set all child temp/home/cache/library/log/output
paths to E: before startup. Preserve mixed work and do not weaken numerical,
exact-version, invalid/no-output or legacy regression assertions. Two targeted
correction attempts per step; supported P0-P3 fixed within scope, then final
/cg-review mode:verify. Scope or irreversibility deviations stop with evidence.

Minimal first: smallest complete slice; safeguards only almost-irreversible harm
(otherwise Later); one functional check/change; installed tools and worthwhile
dependencies only; Plans about two pages. No generic migration/active-selection
framework or new worktree/session beyond this separately approved setup.

Create/checkpoint/finalize pip-handoff-v2 at this exact external evidence path:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/stamp/catalog-latest-reconcile/20261118T113913Z-implementation/handoff.md
Do not overwrite an existing run; if it exists, stop/report before execution.
This file/report path, the canonical Plan's allowed status fields and associated
pipsystem review/work-report/named-state evidence are explicitly permitted external
outputs; no other outside-worktree edits. Include Summary/Changes/Checks run/
nonempty Gaps, full SHAs/dirty-diff facts, actual outputs, PASS/FAIL/NOT RUN.
No credentials, production payloads or raw conversations in reports.

The latest six TEST input IDs and PPP2021 base are already approved for later
planning, but this package task does not apply them or choose a PPP vintage.
No shared mutation/publication authority is granted by this task.
```
