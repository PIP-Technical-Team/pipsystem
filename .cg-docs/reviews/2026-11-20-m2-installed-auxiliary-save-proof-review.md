---
date: 2026-11-21
depth: full
type: standard
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md
findings:
  P1.1: fixed
  P1.2: open
  P1.3: open
  P2.1: fixed
  P2.2: open
  P2.3: open
  P2.4: open
  P2.5: open
  P3.1: open
  P3.2: open
---

# Review: M2 installed auxiliary save proof, Run 3

## Scope and outcome

All ten reviewers on the full route returned usable findings or an explicit
no-issue result. Install and path handling triggered the full route; the
review covers only the two retained scratch scripts (`run.py`, `aux-proof.R`)
under `.tmp/m2-aux-save/20261121T153507Z-diagnosis/`, their controls, and the
bounded r4 execution evidence. No package implementation was changed or
qualified for merge. No P0. Of ten consolidated findings, two were corrected
in the records. The other eight apply before or upon future harness reuse;
the retained diagnostic harness and store were not changed or relaunched.

## Findings

### P1 — provenance and conditions before rerun

- **[P1.1]** [reproducibility] `input.tsv:5-6`, `run.py:542-561`: the two
  POP commit fields disagree with the original staging receipt even though
  the blobs agree. **Fix**: the work report corrects the provenance to
  `639613e9032e61c45b3f1dd8208cff0587d1b624`, the exact commit recorded
  by the [original acquisition](../orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-local/handoff.md#L53-L60).
  Independently rehashed both Run 3 copies and matched their Git blobs to
  the original staging log and the POP sidecar. This verifies byte continuity
  and the original staging record, not a new remote lookup. Do not carry
  forward the transcribed commit in the raw Run 3 manifest.
- **[P1.2]** [safeguards] `run.py:60-77,297-315,435-461` and
  `aux-proof.R:79-83,119-149`: path checks and a Job Object are not a
  filesystem access boundary. **Fix before reuse**: use a fresh single-owner
  E: root, non-reparse ancestry and absent output leaves, before setup.
  Preserve this run tree. No historical overwrite or escape was established.
- **[P1.3]** [safeguards] `run.py:80-116,224-249,294-307` and
  `aux-proof.R:103-157`: a restricted child environment and fetch-only
  substitution do not enforce offline operation. **Fix before reuse**: use
  existing runtime isolation that excludes shared and production writes,
  credentials and live fetch; do not rerun if it cannot be verified. The
  historical result is not an OS-wide write or network trace.

### P2 — bounded replay quality

- **[P2.1]** [quality, documentation] `run.py:399-411,494-503,529-564,648-659`:
  stage menu omits prerequisite order; `proof-live` was offline. **Fix**:
  the work report records the executed sequence and explains the label;
  it is a record, not a command to run using the existing tree.
- **[P2.2]** [architecture, reproducibility, version control, learnings,
  safeguards] `run.py:283-296,434-471,507-521,576-631`, `aux-proof.R:50-83`:
  overlaid extraction and partial fingerprint lists can weaken a resumed
  proof. **Fix before reuse**: build and prove in one fresh root; attest the
  base R startup profile and complete installed build fingerprints if
  supporting resumed proof. No drift was demonstrated in Run 3.
- **[P2.3]** [quality, testing, version control, reproducibility]
  `run.py:613-631`, `aux-proof.R:79-83,157,240`: retries can replace fixed
  origin TSV files. **Fix before further retries**: make these outputs
  attempt-specific. The retained successful attempt has both records.
- **[P2.4]** [safeguards] `aux-proof.R:162-204` tests non-skipped state with
  `!isTRUE`, which accepts a missing or malformed flag. **Fix if reused**:
  assert the pinned receipt contract's explicit new-write state. This run
  independently has a fresh-store save sequence and matching version records.
- **[P2.5]** [safeguards] `run.py:119-129,198-214,247-280,314-315,589-593`:
  exception branches can leave process cleanup unconfirmed. **Fix if
  reused**: make diagnostics best effort, close handles independently, and
  record confirmed or unknown cleanup. Run 3's successful proof has exit 0
  and zero owned processes; this does not exercise exception branches.

### P3 — later harness maintenance

- **[P3.1]** [quality, testing] `run.py:543-562,629-633`,
  `aux-proof.R:220-248`: count actual hash checks and distinguish proof PASS
  from process exit; show active and unattempted phases on failure if
  automated. The coordinator checked actual hashes, ordered PASS markers
  and normal exit for this run. No rerun needed.
- **[P3.2]** [architecture, reproducibility, performance, documentation]
  `run.py:3-18,338-387,648-659`: if maintained, record Python identity,
  separate diagnostics from offline proof, and avoid repeated staging when
  a qualified build can be retained safely. Existing Qmd is absent; the work
  report links its designated fallback and the executed Run 3 proof.

## Review evidence

- [Testing](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-testing/handoff.md),
  [documentation](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-documentation/handoff.md),
  [version control](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-git/handoff.md),
  [reproducibility](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-repro/handoff.md),
  [performance](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-performance/handoff.md),
  [architecture](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-architecture/handoff.md),
  [data quality](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-data-quality/handoff.md),
  and [safeguards](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T160214Z-safeguards/handoff.md)
  saved lane handoffs. Quality and learnings returned directly to the
  coordinator and are consolidated above. Testing and data quality found
  no issue blocking the bounded V1–V3 checks.

## Gaps

Review scope is historical development evidence. No second run, OS-wide
write audit, cross-machine portability claim, maintained runner, live survey,
or validation of the separate DLW integrity contract.
