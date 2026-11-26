# Work Report: M2 installed auxiliary save proof

## Plan Reference

`.cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md`: Run 1 used
revision 2; Runs 2 and 3 used revision 4.

## Active Deviation Policy

`autonomous`; review auto. Hub only. Preserve the dirty existing current
state pointer; use a separate workflow pointer for this concurrent run.

## Run 1: 2026-11-21T00:23:22Z

Canonical Plan validation passed; V1–V3 pending.

### Outcome: blocked at V1

The [worker's final handoff](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T002322Z-aux/handoff.md#L38-L98)
records the executed byte and source checks. The coordinator verified the
reported Plan/checkout pins and independently checked the `pipfun` release
initializer calls at `7d534516a8c17c33d537681610eccd4c29211762`.

| Evidence | State | Result |
|---|---|---|
| V1 | Blocked | Three staged input files, retained country-list bytes, the Stamp archive, and `pipaux` source pins matched. No immutable local `releases.csv` or `ppp_vintage.csv`, supported offline initializer, or eligible catalog for the exact retained country list was found in scope. |
| V2 | Not run | No installed PFW save, checksum, or versioned readback. |
| V3 | Not run | No installed population save, checksum, or versioned readback. |

No R startup, build, install, live access, or implementation diff. No
runtime exception occurred or was accepted; the required inputs were absent
at preflight. Review auto did not dispatch without an implementation diff.
The Plan remains active. No Qmd restore or roadmap change.

## Run 2: 2026-11-21T13:44:35Z

Canonical Plan revision 4 validated; both review findings independently
closed in the Plan. The user authorized registering the verified country
list only in the private TEST store. Record original version as provenance,
not a local ID. The metadata CSVs were staged and verified.

### Outcome: blocked at V1

The [worker handoff](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T134435Z-aux-r4/handoff.md#L38-L95)
records six matched staged input SHA-256s, five matched Git blob IDs and
verified local source archives. Windows R 4.5.2 repeatedly stalled while
preparing the exact Stamp 0.1.1 archive for lazy loading. After the owned
child was stopped, the installer emitted
`ERROR: lazy loading failed for package 'stamp'`; the cause remains unknown.
The coordinator cross-checked the direct install and dependency logs and
confirmed the hub and `pipaux` HEADs remained unchanged.

| Evidence | State | Result |
|---|---|---|
| V1 | Blocked | Input pins matched; Stamp installation did not complete. TEST setup, country-list registration, catalog binding and readback were not run. |
| V2 | Not run | No PFW save or receipt. |
| V3 | Not run | No population save or receipt. |

The worker reported the private TEST store stayed empty and no run-owned R
child remained. No package implementation changed. Scratch proof code was
not executed or reviewed as a passing implementation. No retry is scheduled.

## Run 3: 2026-11-21T15:35:07Z

User authorized resolving the prior installer blocker. Canonical revision 4
validated again. The isolated diagnostic changes one factor at a time: plain
R startup/exit, then a contained package install and the pinned Stamp archive.
Do not reuse Run 2's partial installation or repeat its unchanged setup.
Continued to country-list registration, PFW and population only after the
runtime and store checks passed.

### Outcome: V1–V3 passed in one private TEST store

Restoring `PROCESSOR_ARCHITECTURE=AMD64` was sufficient to make the isolated
Windows `rlang` exit control pass. The exact pinned Stamp 0.1.1 archive then
passed the normal staged install, both installer load checks, and a separate
installed identity check. This explains which environment change resolved
the stall, not the underlying Windows mechanism.

| Check | Artifact | TEST version | Stamp file checksum | Object hash |
|---|---|---|---|---|
| V1 PASS | `country_list.qs2` | `0ff89ac514d47926` | `ea2584dcc9d60f5a` | `9211182e995b116f` |
| V2 PASS | `pfw.qs2` | `a2d11c48b1e34926` | `9e2cd4344a16a36d` | `fc3469e631532ca2` |
| V3 PASS | `pop.qs2` | `0a23a91ddd57c602` | `b4157c9317be2e4e` | `cb4509fb588f1f23` |

Use the [worker handoff](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T153507Z-stamp/handoff.md#L77-L109)
for the private store path, the `aux` alias, archive pins, and exact
assertions. Only the source-fetch functions used verified local inputs;
release setup, package producers, versioned writes, and reads were installed
calls. The coordinator independently checked the process receipts, ordered
PASS markers, six input SHA-256s, five Git blobs, four archive SHA-256s,
three exact-version sidecars, and SHA-256 equality between current and
retained bytes for all three outputs. The coordinator did not rerun R or
deserialize outputs; the executed proof supplies the Stamp hash checks.

**POP source provenance correction:** Run 3 `input.tsv:5-6` transcribed an
incorrect commit. Use `639613e9032e61c45b3f1dd8208cff0587d1b624` from the
[original acquisition record](../orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-local/handoff.md#L53-L60)
and its `proof-retry.log:2-3`. Both Run 3 POP input blobs and SHA-256s match
that evidence, and the saved POP sidecar records those same blobs. Neither
the original bytes nor the retained proof records were changed.

**Historical execution sequence:** In the worker's `run.py:399-411,434-471,494-521,529-564,613-633,648-656`,
system staging preceded the standard-only R mirror, normal recovery install,
then auxiliary staging (which includes the three PIP installs). The final
stage label `proof-live` mapped to the **offline** `test` attempt using the
qualified `r-clean` runtime, `ok` library, and fresh `store-test` directory.
The run tree is evidence, not an approved reusable runner.

Full [review and disposition](../reviews/2026-11-20-m2-installed-auxiliary-save-proof-review.md)
is recorded. No finding invalidated the retained functional result after
the provenance correction. Follow-up harness safeguards apply before
future reuse; no rerun is needed to close this bounded proof. The Qmd is
absent on current `main`; the Plan's [reviewed notebook fallback](../orchestration/outputs/pipsystem/m2-checkpoints/20261119T232046Z-sync-publish/handoff.md#L31-L56)
provides context, not the Run 3 pass. No stash restore, roadmap, package,
or shared storage change.

## Gaps

The private TEST result does not prove historical country-list recovery,
live access, all deflation inputs in one store, or a supported real survey
route. No production operation or release pipeline ran. No OS-wide write
trace was taken; the review conditions govern any future harness reuse.
