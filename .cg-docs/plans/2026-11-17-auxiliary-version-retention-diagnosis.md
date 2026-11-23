---
date: 2026-11-17
title: "Auxiliary version-retention diagnosis and recovery decision"
status: completed
completed-date: 2026-11-17
execution-report: .cg-docs/work-reports/2026-11-17-auxiliary-version-retention-diagnosis.md
scope: "Lightweight"
brainstorm: null
language: "R"
estimated-effort: "small"
deviation-policy: "ask"
artifact-schema-version: 1
revision: 2
tags: [stamp, auxiliary, catalog, diagnosis]
---

# Plan: Auxiliary version-retention diagnosis and recovery decision

## Objective
Produce a decision-ready diagnosis, not a repaired store.

## Context
The user approved this
completion contract on 2026-11-17 for saving/review only; execution needs a separate
instruction. Stay in existing main at E:/PovcalNet/01.personal/wb384996/PIP/pipsystem.

Evidence E: `.cg-docs/orchestration/outputs/pipsystem/qmd-real-auxiliary/20261117T141547Z-inspection/handoff.md`
and its consumer catalog-addendum. All six public metadata-only reads were
user-reported FAIL: `Retained snapshot is unavailable.` Main files are readable;
different retained candidates match their sidecars. Candidates are not authority.
Cause is UNKNOWN. Shared context remains 20260401/TEST/PPP2021 and
COL_2010_GEIH_V04_M_V01_A_GMD_GPWG; no shared action occurs under this Plan.

Checked stamp source S: `.tmp/one-survey/qmd-acceptance-20261113/sources/stamp`,
SHA `95890411e8bf9db842593c2b0ab68ec4f2a66b25`. Upsert captures new_vid
(S/R/version_store.R:834-874); do not assume a first-save-pointer defect.
st_catalog_query follows pointers while st_latest sorts version rows (:302-337,
1546-1568). st_rebuild executes builders (S/R/rebuild.R:420-460); st_restore saves
data (S/R/IO_core.R:1032-1083). Neither is a proven safe index-repair operation.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | Checked runtime/origins, E-only writes, public APIs and no unrelated edits | Approved contract C1-C3 |
| R2 | Minimal independent save/version/readback proof before a defect claim | S/tests/testthat/test-catalog-query.R:174-189; test-audit-versions.R:18-29 |
| R3 | Separate physical candidates, release authority and supported recovery method | E; approved authority gates |

## Implementation Steps
### 1. Diagnose ordinary version handling locally
- **Requirements**: R1, R2
- **Files**: Fresh diagnostic scripts and logs under a new
  `outputs/pipsystem/aux-catalog-reconciliation/<run>/` evidence folder; temporary
  store/home/cache under a new `.tmp/aux-catalog-reconciliation/<run>/` only.
- **Details**: Reuse the installed private R4.5.2 toolchain and safe-path/environment/
  receipt-verification patterns in experiments/one-survey/{paths.ps1,run.ps1,setup.R}.
  Do not run their install/setup/render modes or load unrelated PIP packages.
  The existing runtime's embedded audit couples ONE_SURVEY_ROOT to both library
  paths and logs (its r/library/base/R/Rprofile:219-229). Copy its R home into the
  fresh local temporary run's r/ directory. Adapt only the copied startup-audit
  block to log under that new run and require exactly the original read-only
  contributed library plus the copied base/recommended library. No existing
  runtime, contributed package or namespace is edited. Keep receipt/archive
  verification anchored to the original source runtime, not the new output root.
  Before every child/load, resolve outputs and redirect temp/home/R libraries/
  caches/logs to E:. Verify stamp source/archive/installed receipts and actual
  namespace origins; contributed dependencies must come only from that checked
  original library. Capture new-run startup audit, actual library origins and
  copied R home for both children; no append to old-run logs or ambient fallback.
- **Tests**: Public st_init on a fresh local alias and retain_versions=Inf;
  save one independently defined synthetic artifact twice with changed values.
  Require different returned IDs, catalog pointer equal to the second ID, both
  exact payload readbacks equal to their respective inputs and current/historical
  sidecar content_hash values equal to public st_hash_obj results for their
  respective inputs. Check st_latest against its
  timestamp/ID ordering, recording any tie rather than assuming pointer equivalence.
  Repeat both exact readbacks/metadata checks in a fresh R process on that store.
  Use public APIs only; no namespace, internal-state, catalog or data patches.
- **Acceptance criteria**: Retain the runnable public diagnostic and executed
  assertion output. Existing stamp unit tests are source references, not a new
  duplicate unit suite here. A failed package invariant blocks; do not patch it.

### 2. Produce the recovery decision dossier and review
- **Requirements**: R3, R1
- **Files**: New run handoff/work/review records only.
- **Details**: Build a six-artifact matrix from E identifying catalog pins,
  retention observations, main-sidecar-matching candidates and UNKNOWN authority
  and cause. Distinguish recovery of selected missing snapshots from choosing
  different retained versions. Record required evidence/owner decisions and
  supported-method gaps; do not invent a repair command. Local PASS means only
  that this diagnostic did not reproduce historical divergence.
- **Tests**: Check six cited rows against E and the Step 1 result; retain review
  findings and verify their resolutions without executing a shared recovery.
- **Acceptance criteria**: Every artifact has a cited row, source/observed/user-reported
  claims stay distinct, and no candidate is promoted. Run route-aware review
  (data-risk for reproducibility-sensitive diagnostic scripts: code-quality,
  testing, documentation, version-control, reproducibility, performance,
  architecture, data-quality); fix supported P0-P3 and finish light mode:verify.

## Testing Strategy
One synthetic end-to-end check plus fresh-process readbacks; no producer, shared
fixture or full Qmd render. No raw shared payload rows or production-data copies.

## Documentation Checklist
The report explains true PASS/FAIL/NOT RUN, links scripts/logs, and separates
observed results from source inference and unresolved release authority.

## Risks & Mitigations
Main-sidecar agreement is not release authority; command names are not repair
proof; local success is not historical cause. Keep these limits explicit.
**Minimal first:** smallest complete slice; safeguards only for almost-irreversible
harm (otherwise Later); one functional check per change; installed tools and only
worthwhile dependencies; Plan about two pages. No failure-injection framework.
Local infinite retention is fixture control, not a new shared-store policy.

## Out of Scope
Shared recovery/version selection, package fixes, pipeline execution, installs,
downloads, Git mutations and production-data copying; see contract boundaries.

## Completion Contract
### Outcome
An evidence-backed diagnosis separates pinned-package behavior from shared-store
history and names unresolved authority/method decisions. No repair/readiness claim.
### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Original contributed receipt/origins, copied base runtime, both new-run startup audits; E-only local outputs | Step 1 child/provenance logs | yes |
| V2 | Two changed public saves, exact payload/sidecar/hash assertions and fresh-process readbacks pass | Step 1 diagnostic and logs | yes |
| V3 | Six cited rows distinguish selected pins/candidates from UNKNOWN authority/cause | Step 2 dossier | yes |
| V4 | Supported P0-P3 resolved, light verification complete, no prohibited mutations | Scoped review and touched-file checks | yes |
### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | No shared writes/repair, producers, household data, package/Qmd/rule/roadmap edits or Git mutations | Allowed-write/command review |
| C2 | Public APIs only; no patches, installs, downloads or ambient library fallback | Script and namespace evidence |
| C3 | Release/PPP and existing shared selections unchanged; preserve mixed work | Evidence matrix and owned delta |
### Boundaries
Allowed: fresh local diagnostic/evidence artifacts, work/review/handoff records
and permitted Plan status fields. Out: recovery execution, authoritative version
selection, pointer changes, deletion/pruning, package fixes, data copying, shared
st_rebuild/st_restore, pipelines, broader hardening. Package implementations and
unit tests stay in their repos. No automatic package handoff without evidence.
### Iteration Policy
1. At most two targeted diagnostic-harness corrections; rerun affected checks.
2. Never weaken assertions or patch package behavior. Failed package invariants
   are blockers, not passing diagnostics or implicitly accepted exceptions.
3. Resolve supported review findings within scope and verify; no missing required
   evidence accepted by default. Deviation policy ask applies to scope changes.
### Blocked-Stop Conditions
Wrong runtime/paths/dependencies; required behavior fails or is inconclusive after
budget; required report/evidence cannot be saved; or progress needs authoritative
version selection, shared mutation, unsupported migration or another boundary
crossing. Preserve exact errors and an owner-actionable handoff, not a success claim.

## Authority Gates and Gaps
Saving/review approval is not execution approval. Even diagnostic execution will
not authorize intended-version choices or shared repair. Those need later explicit
user decisions and a supported method. Cause, authoritative versions, historical
writer/retention events and non-destructive recovery API remain UNKNOWN. Diagnosis
may support a later stamp-package Plan; this Plan does not pre-authorize that work.
