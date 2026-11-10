---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T230333Z-followup-plan-review
status: completed
updated: 2026-11-09T23:04:27Z
owner: cg-plan-critic independent review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md, saved 2026-11-09 revision
next: Coordinator consumes this review; separate user approval is required before any execution.
---

# Independent follow-up Plan review

## Summary
No significant issues found. Plan is well-structured and ready for implementation, subject to separate execution approval. No actionable findings: P0 0, P1 0, P2 0, P3 0. This is Plan readiness, not harness verification, diagnostic confirmation or completion of the original Plan.

Reviewed the saved follow-up independently against the actual two scripts, prior seven open findings, original Plan/Work Report, retained error and exact pipaux/pipfun source objects. The follow-up has a bounded repair stage and a separately evaluable diagnosis stage, preserves the original failed evidence and does not require fixing packages to complete its own diagnostic outcome.

In this report, `Plan` means `.cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md`; `Prior review` means `.cg-docs/reviews/2026-11-09-installed-package-one-survey-example-review.md`. Citations below refer to the saved versions read for this review.

## Changes
Only this new handoff report, created at review start and finalized here. No Plan, scripts, package repositories, active-state, prior reports, roadmap or Git modifications. Existing tracked dirt was left untouched: `.cg-docs/active-state/current.json` and `.gitignore`, as shown by read-only `git diff --name-only`; staged diff names were empty. Other untracked content was not exhaustively enumerated and was not modified by this reviewer.

## Checks run
### Seven-finding coverage and minimal verification

These are planned fixes/checks, not findings closed by this review. All seven remain open in the original execution evidence until a separately approved attempt proves the repairs.

| Open finding | Verified existing boundary | Minimal fix and check required by saved Plan | Assessment |
|---|---|---|---|
| P1.1 | `run.ps1:17-21` enumerates only selected destinations; `setup.R:12-18` writes base-library before `:28-34` path validation. Prior review:26-27 also identifies nested/file links. | Plan:38 requires pre-write checks including logs and recursive targets; :39 requires actual redirected-target rejection using E-only targets; V1 at :72. | Checkable coverage of the real write boundary, not just a final prefix assertion. |
| P1.2 | `setup.R:20-23` mutates the parent's `.Library`; :105-108 launches a separate R installer without establishing that mutation in its startup. | Plan:38 requires restrictions in actual installation processes before dependency resolution and retained child library/namespace paths; :39 requires a real declared missing-dependency control and one successful pinned install/load; V2 at :73. | Addresses the process boundary directly. No parent-only library evidence can satisfy it. |
| P1.3 | `setup.R:58-66` reuses extraction destinations; :89 copies onto an existing library. | Plan:37-39 requires a new empty attempt/library and rejection of populated destinations, including stale/nonempty checks; V3 at :74. | Fresh destinations remove the overlay mechanism without deleting prior evidence or inventing a source-validation framework. |
| P2.1 | `setup.R:50-53` tests inventory existence, although :99-100 writes inventory before installation. | Plan:39 requires behavioral checks first and a failing baseline; :40 requires regression coverage of every finding and forbids success based only on inventory existence or Version; V3 at :74. | The usable-package behavior replaces the existence-only baseline. |
| P2.2 | `setup.R:114-125` reads inventory but does not bind its required pins/completion to the currently loaded package; :131-133 saves that unvalidated inventory. | Plan:38 binds successful-install receipts, pins and exact loaded paths to current inventory; :39 exercises stale/incomplete inventory; :40 rejects weak provenance evidence; V3 at :74. | Current-install receipt/path checks are sufficient; no general schema or dependency system is needed. |
| P2.3 | `setup.R:117-118` checks a final helper and fabricated absent namespace, not installer resolution or pre-write launch behavior. | Plan:39 exercises actual declared missing dependencies without fallback and actual redirected-output rejection; V1/V2 at :72-73. | Both negative controls now target the failing boundary rather than a proxy. |
| P2.4 | `run.ps1:23-43` changes process variables and :44-50 has no restoration block. | Plan:38 restores prior/unset environment in finally; :39 checks successful and failed children; V1 at :72. | Explicitly includes unset values and both exit paths. |

Script paths in the table are under `experiments/one-survey/`.

### Diagnosis feasibility, isolation and outcome

- Exact `git show` inspection independently confirms pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, `R/zzz.R:1`, initializes globals by calling `pipfun::pip_create_globals()`. pipfun `0c6a78d9884ed0965a524311537eec2a5095d60b`, `R/pip_create_globals.R:14-17,33-38,228-238`, documents nonexistent-path returns with `create_dir = FALSE`, defaults `vintage = NULL`, and calls `fs::dir_ls()` on the clean-survey cache in that branch. This supports the suspected boundary without proving a separately executed reduced diagnosis.
- `.tmp/one-survey/logs/install-pipaux.log:6-11` independently confirms the preserved failure during lazy loading, with ENOENT at that cache and removal of the unsuccessful isolated pipaux installation. It is not a malformed-survey rejection.
- The dependency declarations read from those same exact objects place `stamp` in pipfun Imports, but not pipaux. Thus diagnosing installed pipfun does not structurally require successful pipaux installation. Plan:39 explicitly permits a bounded install/load check rather than full ecosystem installation; :45 requires clean isolated installed pipfun and its recorded dependencies. No circular requirement to repair pipaux first is imposed.
- pipfun's exact `R/zzz.R` defines default automatic logging and conditionally initializes its default log in `.onLoad`; this is a real startup effect to inspect before loading. Plan:38,45,50 already require hook inspection, E-only roots and isolated execution. The old reduced script `.tmp/one-survey/reproduce-pipaux.R:3-7` hardcodes the old runtime and reintroduces `.Library`; it is evidence of an unexecuted proposal, not a safe runnable substitute for the new diagnostic. The Plan calls for a fresh-root diagnostic with current provenance rather than reusing it unchanged.
- Step 1 acceptance concerns the repaired harness and its bounded positive/negative controls. A successful subset control must never be labeled a successful complete seven-package installation: Plan:38 says partial inventory is not success, while :39 explicitly says full ecosystem installation is unnecessary. These requirements are compatible: validate complete current receipts for the exercised control, retain uninstalled/failed ecosystem statuses, and keep original V1 failed. No additional Plan requirement is needed.
- Step 2 permits a nonreproducing result if the mismatch is retained/explained (Plan:45). The required outcome is an honest, source-linked owner diagnosis with limits, not an artificially forced error or permission to repair package code. Fresh-root downstream state and the first diagnostic result must be retained (Plan:45,75,91).
- Original/follow-up distinction is explicit in Plan:17,45,63,67,87: the original survey Plan remains blocked pending separate resumption and its own evidence. The original Work Report:24-28 records V1 partial/failed, V2-V4 not run and V5 failed; its :45-47 distinguishes install exits from runtime loading and the unexecuted reduced call. No follow-up diagnostic can replace those gates.

### Scope, phases and correction budget

- Charter `compound-gpid.md:10-33` keeps this an incremental-system design/evidence workspace, packages read-only under this task, exact-SHA evidence mandatory, and runtime ownership in packages. `SYSTEM_DESIGN.md:186-192,274,284-319` keeps rebuild authority with stamp, release coordination with pipdata and the solution minimal. This Plan repairs experiment infrastructure and diagnoses a package boundary, not a new runtime orchestrator or roadmap feature.
- Plan:35-47 supplies a concrete stage handoff: all R1-R3 boundary checks pass before the installed-pipfun diagnostic. V1-V3 capture repair evidence; V4 captures diagnosis; V5 captures the required full review and final verification. Required unavailable tools/reviews remain blockers (:47,94-97), not implicit passes.
- Plan:90-92 preserves separate execution approval and a fresh maximum of two targeted corrections per step, including review-driven functional corrections; no silent reset. That is consistent with the user's approved save/review contract, not continuation under the exhausted original attempt.
- No over-engineering finding: helper only if needed (:37,44), installed tools/direct assertions and no mandatory Pester (:39), no new framework/matrix (:50), one functional check per demonstrated boundary and Minimal first (:50,92). Full ten-role review is an explicit requested completion requirement (:46), not an added recommendation from this reviewer.

### Read-only checks and package-source ledger

- Loaded `pl-clear-technical-communication`, `cg-skill-r-technical` and `cg-skill-r-testing`. No statistical/data.table manipulation was reviewed or written; dialect-specific skills were not needed.
- Read charter, `SYSTEM_DESIGN.md`, `HARVEST_BRIEF.md`, `AGENTS.md`, relevant `ORCHESTRATOR.md` sections and `.cg-docs/orchestration/CONTRACT.md`; followed the report schema at Contract:34-76.
- Read the saved follow-up Plan, original Plan, original consolidated review and Work Report, both current harness scripts, retained pipaux log and old reduced script.
- Read-only Git commands: `git rev-parse HEAD` returned `f9454707b292a620e25abef17f2e515794020ba7`; `git branch --show-current` returned `main`; `git diff --name-only` returned the two tracked dirty paths above; `git diff --cached --name-only` returned no paths. `Get-Date -Format o` supplied the recorded review clock. None of these commands generated a runtime attempt or invoked package code.
- Package source actually read: pipaux at `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` (`R/zzz.R`, `DESCRIPTION`); pipfun at `0c6a78d9884ed0965a524311537eec2a5095d60b` (`R/pip_create_globals.R`, `R/zzz.R`, `DESCRIPTION`). Read with exact-object `git show`, not mutable checkout contents. These are the complete package-source reads for this review; no other package repository source was inspected.
- Original seven-pin inventory was read from `setup.R:42-48` and original Work Report:49-57, not certified as installed runtime provenance. No runtime inventory RDS was decoded.
- No R, installer, setup, Pester, tests, reproducer, runtime creation or artifact-render command was executed. The user-reported prior renderer result was not rerun and is not claimed as an independent functional check. Only direct tool-based edits of this E:-located handoff were made; no command that writes files was run.

## Gaps
- Mandatory execution evidence remains outstanding: actual child restriction implementation/paths, behavioral baseline and regression controls, successful bounded current-pin load, environment restoration, fresh isolated diagnosis, full execution review and final verification. They are Plan gates, not missing Plan requirements or findings closed here.
- The exact child-isolation mechanism with the installed Windows R toolchain is still UNKNOWN until implemented and checked. Plan:58,95 correctly stops if it cannot be established; this source-only review does not certify feasibility of a particular unchosen mechanism.
- Reduced runtime causation is still unconfirmed. Source supports the missing-directory hypothesis; no reduced call was run. Pipfun/stamp/copied dependency runtime compatibility and all hook write destinations remain unverified.
- The prior original failure is retained; original scenario/numerical/readback/rejection evidence remains absent. This follow-up cannot mark the original Plan complete.
- Execution, package edits and Git mutations remain unapproved. This review completes only the requested independent critique and report.
- Optional later work: none proposed. No generic installer, validation framework, audit framework or additional test matrix is needed for this bounded Plan.
