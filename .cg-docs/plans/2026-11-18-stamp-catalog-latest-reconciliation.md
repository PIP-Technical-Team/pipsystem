---
date: 2026-11-18
title: "Stamp: additive catalog-latest reconciliation"
status: completed
completed-date: 2026-11-18
execution-report: "E:/PovcalNet/01.personal/wb384996/Rpackages/stamp/.kilo/worktrees/feat-catalog-latest-reconcile-33bd6bef6c270bbc/.cg-docs/work-reports/2026-11-18-stamp-catalog-latest-reconciliation.md"
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "ask"
artifact-schema-version: 1
revision: 1
tags: [stamp, catalog, compatibility, cran-isolation]
---

# Plan: Additive Catalog-Latest Reconciliation

## Objective
Add one explicit public metadata-reconciliation operation without changing existing
user code, data/history or submitted CRAN source. No automatic repair or new active-
selection model. This approved planning contract is not implementation permission.

## Context
Use SUBMITTED0.1.1 package-input commit
`56a1474f0fa251bcf655c78eb10e4ebae76d5611`, not old checked0.1.0 SHA95890411.
CRAN-SUBMISSION:1-13 records archive SHA256
`d74adf7e861b03a9a6850280e56f9f1a94578273811d9cd908e827412036d1f1`;
publication/email status UNKNOWN, no accepted CRAN release is claimed.
Current ready_cran HEADdb1b29cd248a3a6cb737c71db176ae6bd76d2a1d differs from
the base only in submission docs. Preserve that checkout, archive and all libraries.

The approved six TEST pins are unique newest recorded/retained versions; stale
artifact pointers alone name missing snapshots. Evidence and exact pins remain in
`.cg-docs/orchestration/outputs/pipsystem/aux-reconciliation-proposal/20261117T223822Z/`.
Main-byte/full-provenance coherence is NOT freshly proved. No shared call is needed
to implement/test this domain-agnostic capability. PPP2021 vintage stays unselected.

## Requirements
| ID | Requirement | Source |
|---|---|---|
| R1 | Explicit pointer-only operation, target already unique chronological latest; effective locks/rechecks/no-op | Approved contract V2/C2-C4; source research |
| R2 | Existing API/state/lifecycle/serialization and submitted artifact untouched | Revised contract V3/C5; submitted lifecycle tests |
| R3 | Public docs/tests, isolated ownership and truthful evidence; no deployment/shared application | Contract V1/V4 and user isolation instruction |

## Execution Setup Gate
Planning stays in pipsystem/main. Future package execution needs explicit approval
to **create branch `feat/catalog-latest-reconcile` and a separate git worktree** at
`E:/PovcalNet/01.personal/wb384996/Rpackages/stamp-latest-reconcile`, starting from
the exact56a1474 commit. Nothing is created by this Plan save. Reverify source,
clean destination and branch availability; never switch/edit ready_cran or remove
an existing path. Execution must be in the approved package workspace, not through
pipsystem's write permissions. No Agent Manager session, commit, push or merge implied.
Preflight must identify existing R>=4.1, testthat>=3.1.5, filelock, pkgload/roxygen2
and package dependencies/harness tools with explicit E: development libraries;
missing tools stop, never trigger installation or silent library fallback.

## Implementation Steps
### 1. Add the opt-in operation and focused regression tests
- **Requirements**: R1, R2
- **Files**: New R/reconcile_latest.R and tests/testthat/test-reconcile-latest.R
  in the authorized Stamp worktree; no production store or old runtime file.
- **Details**: Proposed NEW API `st_reconcile_latest(path, version_id,
  expected_previous_id, alias = NULL, dry_run = TRUE)`. All three identity inputs
  are explicit; no mutable version selectors. Return a plain result list identifying
  artifact/store, observed prior/target IDs, checks, dry_run and action
  (would_update/updated/noop). Do not fabricate an execution receipt.
  Resolve one artifact/row, reject invalid/tied chronology, missing retention,
  wrong format/count or inconsistent historical hashes/size/proof. Validate recorded
  code/created-at metadata, parents, main payload and all current required sidecars
  against the target; extra conflicting current sidecar forms must not be ignored.
  Reuse0.1.1 integrity helpers where sufficient, add only missing checks. Never
  upsert a version to repair the pointer: it increments counts/creates history.
  Dry-run is advisory/read-only, no lock files or future-prestate guarantee.
  Apply requires usable filelock and effective existing artifact-then-catalog
  writer locks; re-read/recheck gates while held, no unlocked fallback. Change
  only artifacts.latest_version_id via the existing atomic catalog writer.
  If current pointer already equals target and all gates hold, return unchanged
  noop even on retry with the original expected prior ID. Otherwise expected prior
  must still match before mutation. Preserve every other field/row/retained byte.
- **Tests**: Red first, one package-owned synthetic fixture: latest valid B matches
  main, pointer names missing older A. Public dry-run changes nothing; apply aligns
  query/latest/exact/main; repeated apply is byte-unchanged noop. Reject invalid
  target, tied/invalid times, metadata/count/main mismatch, wrong prestate and
  unavailable/failed locking before mutation; snapshots/history/parents unchanged.
  Synthetic fixture setup is package-owned, not an external production patch.
- **Acceptance criteria**: Focused public-outcome tests pass; no automatic invocation
  added to load/init/read/save; legacy helpers/signatures/defaults remain untouched.

### 2. Document, run compatibility checks and review
- **Requirements**: R2, R3
- **Files**: R/reconcile_latest.R roxygen, generated man/st_reconcile_latest.Rd,
  NAMESPACE (one new approved export only), NEWS.md unreleased entry; test evidence.
- **Details**: Public-only runnable example uses a temporary synthetic already-
  coherent store/dry-run, not a recipe for editing catalogs. Restore prior options,
  cwd, graphics, aliases and unrelated builders; never export internal state.
  No DESCRIPTION/version, CRAN-SUBMISSION, cran-comments, submitted tarball or
  installed-library change. Source-only development is not a qualified live tool.
- **Tests**: Run focused then full package suite in fresh isolated R subprocesses
  using existing safe package harness patterns. Redirect temp/home/cache/output
  to fresh short E: paths BEFORE startup; record tools/libraries/origins, no ambient
  fallback or dependency install. Existing installed-check harness may need a
  disposable under-test installation: this requires explicit test-only approval
  at execution setup; never infer permission to install into existing libraries.
  Without an authorized safe full-suite route, block V3 rather than weaken it.
  Reuse test-audit-state-schema.R lifecycle/error-cleanup, alias/builder,
  metadata-formal and serialization/default-off regressions; explicitly compare
  graphics too (helper-opts.R does not restore them). Execute the new example with
  existing default alias and unrelated builder, before/after state checks.
- **Acceptance criteria**: Full applicable suite/example and old public behavior
  checks pass. Route-aware review resolves supported P0-P3; final light mode:verify.

## Testing Strategy
One focused fault-fixture, full existing suite and public example/state regressions.
Recorded0.1.1 CRAN checks are historical, never current-run PASS. No shared/pipeline
or real payload testing. Missing safe tooling/test-install approval blocks, no install.

## Documentation Checklist
Document exact inputs/return/actions, dry-run limits, locking prerequisite, fail-
before-write and metadata-only scope. Explain intentional approved store-selection
changes separately from unchanged API behavior. No claim of data/source correctness.

## Risks & Mitigations
Unlocked apply/races: require both effective locks and in-lock rechecks. Historical
proof gaps: fail without synthesizing metadata. CRAN/API regression: isolated exact
submission base, no legacy changes and full regressions. New latest/prestate: reject,
do not silently retarget. Minimal first: smallest complete slice; safeguards only
for almost-irreversible harm (otherwise Later); one check/change; installed tools/
worthwhile dependencies; Plan about two pages. No migration/retention/audit framework.

## Out of Scope
Shared application, data rewrite, new version/history change, producer/rebuild/
restore/prune, PIP policy, pipeline, package release/version bump/submission, tool
qualification, dependency install/pin/runtime changes, automatic Git/setup actions.

## Completion Contract
### Outcome
A tested/documented additive public pointer-only capability in an approved isolated
development worktree; submitted source and existing users' normal behavior preserved.
### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Authorized isolated base/workspace and existing tool/library facts; frozen submission intact | Preflight/report | yes |
| V2 | Focused red/green dry-run/apply/retry/negative/lock tests; only pointer may change | Package tests/output | yes |
| V3 | Full applicable old suite, compatibility and public-example state checks pass | Fresh child logs | yes |
| V4 | Docs/public API and supported P0-P3 resolved; final verification | Docs/review/handoff | yes |
### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | No shared/production-data/pin/existing-library/Git mutation; synthetic fixture writes and test-only staging explicitly bounded to E: | File/command review |
| C2 | No producer/new version/history/proof/count/timestamp rewrite or namespace patch | Tests/source review |
| C3 | Old public/lifecycle/serialization/locking semantics unchanged; no automatic repair | Full regressions/state checks |
| C4 | Apply under effective artifact-then-catalog locks, fresh gates; no unlocked fallback | Focused tests |
| C5 | Submitted artifact/ready_cran frozen; no branch/worktree action without explicit setup approval | Base/workspace records |
### Boundaries
Only named new worktree source/tests/generated docs and E: evidence after execution
approval. Package-owned synthetic fault fixtures allowed; production patches not.
No PIP-specific state or new general planner. Build/pin/live-tool qualification and
shared application need later approval; shared main/metadata coherence stays unproved.
### Iteration Policy
1. Two targeted correction attempts per step; no assertion/interface weakening.
2. Resolve supported P0-P3 in scope, rerun affected/full checks, final verification.
3. Missing required evidence is not accepted by default; ask before scope changes.
### Blocked-Stop Conditions
Wrong/unauthorized workspace/base; missing safe test tools or required setup/test-
staging approval; failed/absent locks; ambiguous latest, integrity/main/prestate
conflict; failures after budget; unsafe E: routing; required artifact cannot be
saved; old behavior/CRAN snapshot impact; any install/pin/Git/branch/shared action
beyond explicit approval. Preserve exact errors, no partial activation or rollback.
