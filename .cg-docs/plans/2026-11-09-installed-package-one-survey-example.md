---
date: 2026-11-09
title: "Installed-package one-survey offline example"
status: active
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "autonomous"
artifact-schema-version: 1
phases: 2
execution-report: .cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md
failing-steps: [1]
current-phase: 1
tags: [integration, isolation, survey]
---

# Plan: Installed-package one-survey offline example

## Objective
Build and run one readable offline survey-validation, cleaning, metadata and exact-version storage example against an isolated, recorded set of installed packages. Revision 1; estimated 60-120 minutes excluding approval waits and dependency blockers.

## Context
The current documentation describes `pipdata_dlw_process()` and `pd_process_data()` as supported paths (`pipdata/vignettes/articles/PIP-data-pipeline.Rmd:25-47,248-275`); vignette examples are not executed evidence. Reuse fixture values, not the internal acceptance harness (`pipdata/tests/testthat/helper-one-survey-upstream-acceptance.R:116-183`), at pipdata SHA `13a38280c1eafe7e03a97837cdb57833fbe9d926`. The vignette describes admitting invalid rows (`Processing-Data.Rmd:83-100`), while source filters eligibility and checks formatted output (`R/dependency_execution.R:214-231`, `R/pd_process_data.R:226-248`); runtime behavior remains unverified. The target requires rejection (`SYSTEM_DESIGN.md:209-213`); report an actual failure rather than bypassing the documented path. Existing acceptance runners and previous passes are not current proof. Package execution must be performed by an authorized Code-mode worker, not pip-orchestrator.

Prerequisite: complete plan review and resolve applicable findings before invoking `/cg-work` as the outer execution workflow.

## Requirements
| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Isolated E-only setup with clean, exact Git revisions, dependency provenance and installed-package paths. | User request; charter lines 24-30 |
| R2 | Real documented offline validation, cleaning, metadata, storage and pinned readback; disclose fixture/transport substitutions. | User request; pipdata overview lines 25-47,277-316 |
| R3 | Assert row-aligned values and malformed rejection without downstream output. | User request; design lines 160,209-213 |
| R4 | Review, report, and preserve first package failure without weakening checks. | User request |

## Phase 1: Isolated installation
### 1. Inspect and prepare
- **Requirements**: R1, R4
- **Files**: `experiments/one-survey/setup.R`, revision inventory; optional thin launcher; `.tmp/one-survey/`.
- **Details**: Verify checkout, clean source trees and full SHA of every package read; inspect startup hooks and paths before starting R. Set TEMP, TMP, TMPDIR, home, R and relevant cache/log paths before every child; resolve paths and keep all writes in this checkout. Isolate TEST configuration, stamp aliases, manifests and storage. Install clean recorded snapshots into one dedicated library; copy suitable installed third-party dependencies without changing source libraries and record versions/provenance. No moving branches, unpinned downloads, blanket upgrades, site/user fallback or `load_all()`. Base/recommended R installation libraries may remain read-only.
- **Test Scenarios**: usable installed dependency, missing dependency, dirty source or unsafe path.
- **Tests**: fresh R process reports library paths, versions, SHAs, hooks and resolved runtime roots.
- **Acceptance criteria**: repeatable explicit library setup and evidence; stop rather than use unsafe or unavailable dependencies.

## Phase 2: Example and evidence
### 2. Run the documented path
- **Requirements**: R2, R3
- **Files**: `experiments/one-survey/scenario.R`; optional thin launcher; `.tmp/one-survey/` evidence.
- **Details**: Use the documented exported validation and clean/metadata path and real storage, with only external transport substituted and fixture-only inputs identified. Do not invoke internal workers to evade a broken path or build another orchestrator. Check household/person row correspondence: annual welfare 365,730,1095,1460 becomes 1,2,3,4 daily and person weights remain 10,20,30,40. Read data and metadata using their actual exact saved version IDs; compare expected and actual. For the malformed missing-weight control use a fresh store or distinct identity/checksum, require a completed invalid classification and its missing-weight diagnostic, and show no data or metadata artifact for that identity; execution failure or no-work is not rejection. Use `data.table` and `collapse` where applicable.
- **Test Scenarios**: valid survey, malformed missing-weight survey, documented-path/package failure.
- **Tests**: run the scenario in a fresh isolated R process; save assertions, actual values, receipts, loaded package paths and versions.
- **Acceptance criteria**: every required assertion passes; capture the first failing package boundary as a minimal reproducible call and proposed owner direction, not a pass.

### 3. Review and report
- **Requirements**: R4
- **Files**: plan/work/review reports and requested orchestration handoff.
- **Details**: Within the outer `/cg-work` execution, run automatic full review, tests and in-scope fixes, including code quality, testing, documentation, version control, reproducibility, performance, architecture, data quality, learnings and adversarial reviewers. Finish `/cg-review mode:verify`; report unavailable reviewers or failed checks. Preserve existing unrelated changes; no commits or pushes.
- **Test Scenarios**: clean review, actionable finding, unavailable reviewer.
- **Tests**: review reports and final verification against the completion contract.
- **Acceptance criteria**: all required review gates and checks pass, with evidence and nonempty gaps.

## Testing Strategy
One end-to-end functional example plus one malformed-input control; inspect exact version receipts and row-aligned values rather than sorted independent vectors. Single-version readback does not prove historical pin selection after a later save; that remains UNKNOWN. No prior run counts as proof.

## Documentation Checklist
Record all package SHAs, installed versions and paths, dependency provenance, inputs/substitutes, actual outputs, failures and owner action; retain a nonempty Gaps section in the handoff.

## Risks & Mitigations
| Risk | Mitigation |
|------|------------|
| Shared or external writes | Inspect startup and resolved paths before execution; isolate child environment. |
| Missing pinned dependencies | Stop and report; do not silently download or change shared libraries. |
| Documented path admits invalid data or fails | Record the exact boundary and owner reproducer; never bypass or claim success. |
| Exact historical metadata access is unsupported | Check actual saved pins and surface failure; do not substitute latest metadata. |

## Out of Scope
Deflation and mean, live DLW, production, incremental-rebuild certification, general installer or framework, Quarto, package edits, charter/roadmap edits and Git mutations.

## Completion Contract

### Outcome
A readable offline example runs against one recorded set of installed package revisions, validating and cleaning a synthetic survey, saving data and metadata, and reading each at its exact saved version.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|----|-------------------|------------------|----------|
| V1 | Clean source SHAs, dependency provenance, R version, package paths/versions, hooks and isolated paths | Inventory and setup/run logs | yes |
| V2 | Fresh-process documented real path and disclosed substitutions | Scenario and run log | yes |
| V3 | Row-aligned welfare/weights and exact-version data/metadata readback | Executable assertions and actual values | yes |
| V4 | Completed invalid classification and missing-weight diagnostic, not no-work or execution failure, with no downstream outputs for the fresh control | Validation and before/after storage evidence | yes |
| V5 | Plan review, all applicable P0-P3 corrections, full execution review and final verification | Review and work reports | yes |

### Constraints
| ID | Constraint | Check |
|----|------------|-------|
| C1 | E-checkout-only writes; runtime files under `.tmp/one-survey/`; isolated TEST state | Inspect resolved paths and child environment before writes |
| C2 | Exact clean snapshots, no ambient user/site fallback or unpinned downloads | SHA/status, installed provenance and library-path evidence |
| C3 | No package, production/shared, Decided-design or unauthorized Git changes | Status and configuration evidence |

### Boundaries
- Allowed: requested example, dedicated runtime, inventory and required reports.
- Out of scope: excluded stages and actions listed above.

### Iteration Policy
1. Inspect paths, hooks and sources before installing or running.
2. Correct in-scope harness issues at most twice per step; record justified autonomous deviations.
3. Retain the first package failure and owner direction without weakening expectations.

### Blocked-Stop Conditions
- Unsafe/unresolvable paths, unavailable pinned dependencies or required review/check.
- Broken required documented path or required evidence still failing after the correction budget.
- Required report cannot be saved, or a protected change or additional approval is needed.
- A captured package failure is not a pass or completion of required verification.
