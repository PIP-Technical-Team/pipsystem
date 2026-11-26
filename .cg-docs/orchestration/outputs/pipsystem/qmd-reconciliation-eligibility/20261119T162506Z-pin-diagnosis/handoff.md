---
schema: pip-handoff-v2
project: pipsystem
task: qmd-reconciliation-eligibility
run: 20261119T162506Z-pin-diagnosis
status: completed
updated: 2026-11-19T16:38:35Z
owner: code-pin-diagnosis
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE
next: Pointer-only reconciliation is blocked for all six tested snapshots. Preserve the share; a separate recovery route needs trusted historical byte evidence or newly produced and validated snapshots.
---

# Corrected Stamp Retry: Pinned Metadata Refusal

## Summary

The user-run retry `shared-219d077f900f` used the corrected Stamp build and
passed the original path-binding gates. All six dry-runs then stopped at
`Pinned metadata and catalog disagree.` This is a different, later error.
The sampled catalog SHA256 was unchanged during the run and matches the old
run's recorded value. None of the six measures is eligible based on this run.

The subsequent user-run diagnostic `pin-diagnosis-e602bdea0368` observed all
six rows. The sidecar paths differ from the expected paths only in slash
spelling. The format, recorded object hash and size comparisons matched for
all six. None has a usable persisted file checksum. Correcting path comparison
alone would still leave all six blocked by the required checksum check.

## Changes

- Added `read-pins.R` and a separate, explicit `-RunSharedPinDiagnosis` mode
  to the existing launcher. No switch is the local default, and the two
  shared switches are mutually exclusive. The diagnostic does not call
  `st_init()` or `st_reconcile_latest()`. It reports booleans from catalog,
  legacy JSON sidecar, and filesystem-size reads, not raw metadata or data.
- No Qmd, Stamp source or library change, agent shared lookup, catalog
  repair, Git mutation, install, or pipeline execution.

## Checks run

- `../20261118T224533Z-guarded-launcher/shared-219d077f900f.log:1-4,6-23`:
  corrected build, exact review-cell hash and aux-only prerequisites passed;
  all six rows FAIL at pinned metadata. Catalog hash unchanged,
  `102fc6763dd50a13e8ce935455f4638d247cf247e75f37940f05e6304191d07f`.
- Matching `*-process.json:2-13` records shared mode and R exit 1; the
  `*-origins.tsv:22` identifies the exact checkout-local Stamp installation.
- Reviewed `.tmp/sq1/stamp/R/execution_state.R:343-397`,
  `R/reconcile_latest.R:195-246` and `R/format_registry.R:500-553` in the same
  staged tree. Source base `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d` plus
  uncommitted manifest `5c9fd6893d259bdf8613641fb2762ffeca40df27534d675220547d73d1ed5546`.
  The message combines checks of the sidecar path spelling, format, content
  hash, and recorded vs actual sizes. It precedes the persisted byte checksum,
  parent and current-artifact consistency checks.
- Prior exact-version readback compared object content hashes to catalog and
  sidecar (`retained-candidate-validation/20261117T192911Z-clean-context/runs/`
  `ea662384aa01/candidate-results.tsv:2-7`), not path or size equality.
- `../20261118T224533Z-guarded-launcher/local-06082f790966.log:54-93`:
  local-only run exit 0, prior guards/Qmd assertions pass. A synthetic QS2
  snapshot gives `noop`; rewriting only its JSON path separators reproduces
  the exact retry error. The probe sees only `path_exact = FALSE`, with
  `path_slashes_equal = TRUE` and other booleans TRUE. Store bytes and tree
  stayed unchanged across the diagnostic and refused dry-run. The active
  package image and Qmd source digest are unchanged.
- Windows PowerShell parser passed. Neither user-only switch was invoked by
  the agent.
- `../20261118T224533Z-guarded-launcher/pin-diagnosis-e602bdea0368.tsv:2-7`:
  every row was observed; `path_exact` and `byte_checksum_recorded` were FALSE;
  `path_slashes_equal`, format, recorded content-hash equality and both file
  size comparisons were TRUE. The content-hash flag compares two metadata
  records, not the payload or its bytes. The matching process receipt records
  R exit 0 (observations complete, not an eligibility PASS), and the log
  at lines 1-5 records the qualified archive, unchanged sampled catalog digest
  and that no alias setup, payload read, reconciliation, apply or survey ran.
- `.tmp/sq1/stamp/R/reconcile_latest.R:223-224` requires a checksum for this
  operation. `.tmp/sq1/stamp/R/execution_state.R:379-397` rejects the exact-path
  mismatch before refusing a missing usable persisted checksum; the latter
  is an independent blocker established from the diagnostic and code, not a
  newly executed dry-run error.

## Setup

- **Project Name:** pipsystem auxiliary metadata diagnosis.
- **Suggested Session Name:** Auxiliary Pin Metadata Diagnosis.
- **Branch:** current `main`; existing.
- **Worktree Requirement:** No; existing checkout `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`.
- **Model Family Recommendation:** Standard, for result interpretation.
- **Effort:** medium.
- **Target Project:** pipsystem, `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`.
- **Target Environment:** existing `main` checkout, Windows PowerShell with an isolated R child.
- **Target Agent:** Code mode for interpretation; shared execution is user-only.

```powershell
& "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/20261118T224533Z-guarded-launcher/run.ps1" -RunSharedPinDiagnosis
```

The `pin-diagnosis-<id>` outputs are saved beside the earlier dry-run logs.
Exit 0 means all six rows were observed, not that eligibility passed. This
probe expects the catalog state to provide legacy JSON sidecars only, as
expected from the approved pins' historical JSON-presence and QS2-absence flags
(`../../aux-reconciliation-proposal/20261117T223822Z/version-metadata.tsv:5,10,14,18,22,26`).
It marks rows `UNAVAILABLE` if it cannot inspect them. A changed sampled catalog
SHA256 aborts; the log records the verified digest. No payload contents or byte
checksums are read or verified; the checksum column indicates presence only.

## Gaps

- No trusted historical byte checksum or authoritative recovery copy has been
  identified for these pins. Hashing today's files would record present bytes,
  not independently verify them against a historical baseline. Do not backfill
  the sidecars, bypass the checksum gate or apply a pointer change on this basis.
- Prefer a read-only recovery assessment for exact versions and trusted
  provenance; if unavailable, assess regenerating new snapshots in isolation
  from approved sources, with checksums recorded at save. Any shared recovery
  or promotion remains separately scoped and unauthorized. No further package
  build or unchanged dry-run is called for by these observations.
- A field-level metadata read cannot certify payload bytes, provenance,
  current-artifact agreement, or survey readiness. No apply was attempted.
  Package/test suite, vignette and rendered Qmd reruns are out of scope for
  this metadata diagnostic; no Stamp package code changed.
