---
schema: pip-handoff-v2
project: pipsystem
task: aux-catalog-reconciliation
run: 20261117T152428Z-planning
status: completed
updated: 2026-11-17T16:04:14Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md revision 2
next: User reviews revision 2 and may separately authorize local diagnostic execution; no shared repair or version choice is authorized.
---

# Auxiliary catalog reconciliation planning

## Summary
Saved and formally reviewed canonical Plan revision 2 after explicit contract
approval. Artifact validation PASS. Initial review found one P2; corrected and
verified fixed, with no supported remaining/new P0-P3, suppressions or deferrals.
Plan is ready for user review, not executed. Fixed release 20260401/TEST/PPP2021
and COL_2010_GEIH_V04_M_V01_A_GMD_GPWG unchanged. Existing main retained;
no branch/worktree, stash, Git mutation, package/Qmd/rule/roadmap or shared change.

## Changes
Owned files: canonical Plan revision 2, formal Plan-review report, this handoff
and earlier contract-preview-review.md. Files remain uncommitted. Original mixed
work is preserved; no package/Qmd/rule/roadmap/shared or runtime files changed.

## Checks run
- Read installed cg-plan/cg-plan-review and context-loading contract.
- Root main and full HEAD above verified read-only.
- cg-plan Step 4 requires approval of the concrete completion contract before
  saving a Plan. That approval has not been given; active goal disables questions.
  Research and a clearly unapproved contract preview can proceed; do not silently
  save or execute an approved-looking canonical Plan.
- Existing R skills loaded in this conversation remain in use for source review.
- Directory listing of .cg-docs/plans confirmed no exact related saved Plan.
  Completed 2026-11-09-one-survey-harness-repair-and-diagnosis.md is a pattern,
  not the same task. 2026-11-16 initialization remains completed and unchanged.
- Bounded cg-index query found generic design/ownership decisions, no direct
  catalog recovery recipe; query warned its scanner skips orchestration outputs.
  Those recent original handoffs were read directly, not treated as Brain proof.
- Preview critique by cg-plan-critic: no supported P0-P3 structural findings;
  zero corrections/accepted risks/deferrals. Saved contract-preview-review.md.
  This is not formal saved-Plan review and grants no approval. Reviewer additionally
  read archived pipaux/R/zzz.R, SHA01ff827340a9759dc3d4ef18d31f4e3ba26ff2be.
- Final status/diff check left main/mixed-owned files unchanged. git diff --check
  exited successfully with existing LF/CRLF warnings on unrelated tracked files;
  no formatting or staging attempted. New report files remain uncommitted.

## Source research (static, no package execution)
All S references below are under checked archive
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources/stamp`,
SHA `95890411e8bf9db842593c2b0ab68ec4f2a66b25`. No current external stamp
repository read; inherited archive provenance, not newly verified installation.

- Source does not support asserting a first-save-pointer upsert bug:
  S/R/version_store.R:834-874 captures incoming new_vid before data.table
  assignment. Existing tests assert v1-to-v2 advancement:
  S/tests/testthat/test-audit-versions.R:18-29 and test-catalog-query.R:174-189.
- Main/sidecar precede snapshot/catalog publication (S/R/IO_core.R:419-531).
  A failed later stage can leave main ahead of committed catalog. This does not
  alone explain absent previously committed snapshots or prove observed cause.
- Pruning deletes files before removing rows/publishing catalog
  (S/R/retention.R:344-352,375-431), while protecting chronological newest
  (:186-214). Interruption is a hypothesis, not established history.
- st_latest sorts version rows, while st_catalog_query follows artifact pointers
  (S/R/version_store.R:302-337,1546-1568). Neither repairs the pointer.
- st_rebuild(plan,rebuild_fun=NULL,dry_run=FALSE) executes builders then st_save
  (S/R/rebuild.R:274-277,307-332,420-460,1138-1194). The catalog-integrity error
  hint at S/R/version_store.R:1568 misleadingly recommends it as catalog repair.
- st_restore(file,version="oldest",verbose=TRUE,alias=NULL,...) reads a selected
  snapshot then st_save (S/R/IO_core.R:1032-1083). It is not pointer promotion;
  it may overwrite main/create history/apply retention and does not automatically
  replay historical provenance. Unchanged-save handling validates current latest
  and may fail on missing retention (S/R/IO_core.R:410-417,1429-1438).
- No dedicated supported non-destructive reconciliation export found in
  S/NAMESPACE:4-42. Troubleshooting S/vignettes/stamp-directory.Rmd:713-739 offers
  history-losing catalog deletion or unspecified advanced maintainer migration.
  Neither is an approved remedy. No deletion, restore, rebuild, save or repair run.

## Proposed completion-contract preview — NOT APPROVED, NOT A SAVED PLAN
Proposed canonical path after approval:
`.cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md`, revision 1.
Scope assessment: Lightweight, two steps, no phases. Existing main only.

### Outcome
Produce a decision-ready diagnosis separating current pinned-package version
handling from the shared store's history, plus evidence/authority gates for a
later recovery. This does not repair storage or establish auxiliary readiness.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Exact existing runtime/library/namespace provenance and E-only local paths before package use | Reused private verification support and fresh run logs | yes |
| V2 | One synthetic artifact, two changed public saves in a new E-only store; differing returned IDs, catalog latest v2, documented timestamp/ID latest semantics, both exact payloads and sidecar hashes correct; repeated readbacks in a fresh R process | Small public-API diagnostic script and actual results; no production payload copies | yes |
| V3 | Six-artifact decision matrix separates catalog pins, observed physical retention, main-sidecar-matching candidates and UNKNOWN authority/cause; no candidate silently selected | Cited diagnostic report and recovery-options table | yes |
| V4 | Scoped review/verification resolves all supported P0-P3 and confirms no prohibited mutations | Review records, touched-file diff and report | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | No shared writes, producers, repairs, household data, package/Qmd/rule/roadmap changes or Git mutations | Allowed write set and commands reviewed; no shared action proposed as executed |
| C2 | Public APIs only; no namespace/internal-state/catalog/data patches, installs or ambient library fallback | Diagnostic source and namespace origins |
| C3 | 20260401/TEST/PPP2021 and existing shared selections remain unchanged; synthetic fixture is clearly separate | Context and per-artifact evidence matrix |

### Boundaries
- Step 1: minimal local public save/version/readback diagnostic, using installed
  checked stamp and explicit local alias, retain_versions=Inf, fresh E: roots,
  independently defined synthetic inputs and existing verification support.
- Step 2: evidence-backed decision dossier. Distinguish recovering the currently
  selected missing snapshots from selecting different retained versions; list
  authority evidence and supported-method evidence required for each. If neither
  is established, state that clearly rather than inventing a repair recipe.
- Allowed writes: fresh diagnostic script/results under pipsystem run artifacts,
  work/review/handoff records and allowed Plan status fields only. Existing mixed
  work is preserved. Package unit tests/implementations stay in package repos.
- Out: execution of the recovery, choosing intended versions, changing pointers,
  st_rebuild/st_restore on the share, pruning/deletion, source fixes, data copying,
  producer refreshes, pipelines and broader hardening. No immediate package handoff
  unless a package defect or missing API is supported by the diagnostic evidence.
- Minimal first: smallest complete slice; safeguards only for almost-irreversible
  harm (other ideas Later); one functional check/change; installed tools and only
  worthwhile dependencies; Plan about two pages. No new framework or failure-
  injection suite; local retain_versions=Inf is fixture control, not store policy.

### Iteration Policy
1. At most two targeted local diagnostic-harness corrections; rerun affected checks.
2. Never weaken returned-ID/readback/hash assertions or patch package internals.
   A local package invariant failure is a blocker, not a passing diagnostic.
3. If local invariants pass, report only that current behavior did not reproduce
   the observed divergence; this does not establish historical cause.
4. Resolve supported scoped review findings including P3 within the same boundary;
   finish light verification. No acceptance of missing required evidence by default.

### Blocked-Stop Conditions
- Wrong runtime, unsafe paths or missing contributed dependency; no fallback/install.
- Required local behavior fails or remains inconclusive after harness budget;
  save exact evidence and an owner-actionable blocker without changing package code.
- Progress requires selecting authoritative release versions, unsupported migration,
  shared mutation, production-data copies, package edits or other protected action.
- Report/review evidence cannot be saved. No claim of Plan or data readiness.

### Deviation policy
`ask` (command default; no runtime flag supplied). Safe reversible work within the
approved boundary proceeds; a boundary change pauses and is recorded.

### Authority gates
Approving this contract permits only saving/reviewing the canonical Plan. Plan
execution is a separate instruction. Even subsequent diagnostic execution will
not authorize choosing six authoritative versions or mutating shared storage;
those require a later explicit decision supported by evidence. Preserve existing
catalog selections unless that decision is made.

## Preapproval gaps (historical; resolved as noted below)
- Cause of catalog divergence and intended authoritative versions are UNKNOWN.
- No canonical Plan, formal saved-Plan review, artifact validation or execution
  exists yet. Preview critique, if performed, is not formal cg-plan-review.
- A user contract-approval gate may block full goal completion; not a time wait.
- Gate is now the actual blocker: cg-plan.md:195-207 forbids saving the canonical
  Plan before approval of this concrete contract. Goal instructions disable
  questions and do not supply that approval. No scheduled wait can resolve this.
  Present the preview and approval requirement; do not claim the full reviewed-
  Plan goal complete. Source research and preview critique are complete.

## Resume after contract approval — 2026-11-17T15:54:48Z
The user explicitly approved the presented completion contract. This resolves
the historical gate above for saving and formal review only, not execution.
Existing main/HEAD reverified unchanged. Canonical revision 1 saved at the path
in frontmatter, preserving approved two-step diagnosis and authority boundaries.
Validation and formal Plan review now proceed; no diagnostic or repair run.

### Canonical validation checkpoint
First validation rejected compressed headings/step labels (10 schema errors).
Second rejected requirement tokens R2. and R1. with trailing punctuation (2
errors). Corrected only section/metadata labels and punctuation; no contract
scope change. Third automatic validation PASS: `HTML disabled; validated`.
Existing model-advisory multiline-frontmatter parser warning is unrelated; no
config edit attempted. HTML is not opted in; no missing view is a current failure.
Formal cg-plan-critic review of saved canonical revision 1 is running, separate
from the earlier preview critique. No implementation checks were executed.

### Formal review correction checkpoint
Initial saved-Plan review returned one P2, no P0/P1 or additional P3. P2.1:
the reused private base-runtime startup audit would append to the old run log
or fail its library-root check if ONE_SURVEY_ROOT were moved. Canonical revision
2 now specifies a task-local R-home copy, changing only its copied audit block
for new-run logging and original-read-only-contributed/copied-base origins.
No original runtime or contributed namespace is edited; receipt verification
stays anchored to its original source. This corrects the approved fresh-run
boundary rather than widening it. Public hash assertions clarified as content_hash.
Revision 2 automatic validation PASS, HTML disabled as configured; formal critic
follow-up requested, not yet assumed passed. Review record:
`.cg-docs/reviews/2026-11-17-auxiliary-version-retention-diagnosis-plan-review.md`.

### Planning-stage capability advisory
Capability needed: R public version/hash semantics, dependency-aware local
runtime orchestration and truthful diagnostic evidence. Strong option: Powerful
family, high effort. Economical option: Standard family, high effort for this
bounded two-step slice. The user chooses the model and effort; these are task
suggestions, availability can differ by platform/date, and no selection or client
setting was changed. This is advice, not an execution or dispatch configuration.

## Final planning result
Canonical revision 2 and formal review are complete. P2.1 verified fixed at Plan
level; no supported new/remaining P0-P3. Final automatic artifact validation PASS.
No accepted risks or deferred findings; no roadmap side-idea writes. The Plan
remains status active because diagnostic execution has not been authorized or
started; planning completion is not Plan-implementation completion.

Final owned paths:
- `.cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md` (revision 2).
- `.cg-docs/reviews/2026-11-17-auxiliary-version-retention-diagnosis-plan-review.md`.
- This handoff and contract-preview-review.md under this run.

## Gaps
- V1-V4 implementation evidence is NOT RUN. No runtime was copied, no copied
  audit changed, no local synthetic stamp saves/reads or package tests executed.
- Shared catalog/snapshots remain unchanged and processing remains blocked.
  Historical cause, intended authoritative versions and non-destructive recovery
  method remain UNKNOWN; local diagnostic success would not prove historical cause.
- Exact roadmap association not established; no roadmap changes permitted or made.
- Parser multiline-config and existing LF/CRLF warnings noted, not repaired.
- User contract approval covers saving/formal review only. Local diagnostic
  execution needs a separate instruction; authoritative versions and any shared
  mutation need later evidence-backed explicit decisions. No automatic repair.

### Roadmap boundary
The user explicitly excludes roadmap changes. No registration/link/status write
or side-idea dispatch occurs. Root roadmap.json exists, but exact-link search
could not be established: content-search returned no searchable file and the
optional terminal count failed because rg is not installed. No match or absence
is inferred; optional linking is not a Plan validation/execution prerequisite.
No installation or alternate broad roadmap read attempted.
