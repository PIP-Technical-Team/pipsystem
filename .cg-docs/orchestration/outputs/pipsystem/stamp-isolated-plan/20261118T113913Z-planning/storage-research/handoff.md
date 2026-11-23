---
schema: pip-handoff-v2
project: pipsystem
task: stamp-isolated-plan
run: 20261118T113913Z-planning/storage-research
status: completed
updated: 2026-11-18T11:43:14Z
owner: explore researcher; coordinator persisted source findings
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-18-stamp-catalog-latest-reconciliation.md
next: Review source-backed additive reconciliation requirements; no execution.
---

# Submitted0.1.1 storage and lock recheck

## Summary
No public reconciliation export in0.1.1. Existing integrity/atomic-write/lock
helpers can be reused inside the owning package, but do not cover every narrow
repair precondition. Never reuse version upsert to repair a pointer.

## Changes
No worker execution, commands, source edits or file writes; coordinator saved
this summary. No private external-call workaround or namespace patch.

## Checks run
S=E:/PovcalNet/01.personal/wb384996/Rpackages/stamp, ready_cran current
db1b29cd248a3a6cb737c71db176ae6bd76d2a1d, package code matches submitted
56a1474f0fa251bcf655c78eb10e4ebae76d5611, not old runtime95890411.
- NAMESPACE:4-42 has no public reconciliation function.
- R/execution_state.R:335-415 .st_execution_validate_pin with require_checksum=TRUE
  validates binding, retained metadata/hash and recorded original parents.
  Format comparison occurs only if pointer already equals target (:370-371),
  inadequate by itself when repairing a stale pointer.
- .st_execution_current(:418-431) compares current payload and required-sidecar
  byte hashes but ignores extra current sidecar forms. Preserve full provenance;
  add only missing coherence checks, do not silently normalize conflict away.
- Existing helpers do not independently establish n_versions coherence, unique
  chronological maximum, or all code_hash/created_at equality. Those gates must
  be explicit in the new operation.
- R/version_store.R:287-302 st_versions drops invalid timestamps from returned
  view and sorts ties by ID. Do not use that to fake unique chronology; inspect
  history consistency and reject ambiguity without editing rows.
- R/version_store.R:860-865 upsert increments n_versions. It is not pointer-only.
- Effective filelock availability must be required before nesting existing
  artifact then catalog .st_with_lock calls; the legacy fallback stays unchanged.
  Re-read gates while held and mutate only the exact pointer using existing
  atomic catalog writer. No user caller should invoke private helpers.

## Gaps
No runtime validation of proposed methods or test suite. Historical main/snapshot
coherence is not a fresh proof. Scope/API name remains proposed; dry-run, apply,
no-op/conflicts and lock failure must be implemented/tested only after separately
approved isolated setup and execution. All shared paths remain untouched.
