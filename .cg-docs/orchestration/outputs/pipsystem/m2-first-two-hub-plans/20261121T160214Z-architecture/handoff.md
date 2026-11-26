---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-architecture
status: completed
updated: 2026-11-21T16:05:25Z
owner: architecture review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md r4
next: Coordinator integrates the full review and records the bounded auxiliary evidence without advancing the blocked survey route.
---

# M2 auxiliary route architecture review

## Summary
No P0 or P1. One P2 provenance gap for fresh reuse and one deferred P3.
No evidence that either affected the retained run. Its existing stdout and
process receipt record V1, V2 and V3 in order, exit 0, no timeout, and no
owned child remaining (`log/aux-proof-test.out:6–31`,
`log/aux-proof-test.result.json:2–9`). Paths to scripts and logs below are
relative to `.tmp/m2-aux-save/20261121T153507Z-diagnosis/`.

## Findings

**P2 — `safe_auto`, before authorized reuse — `run.py:576–633`; `aux-proof.R:33–75`.**
The source archive manifest is written before extraction and installation,
and the proof rechecks archive hashes and installed Stamp files but not the
installed `pipfun`, `pipload`, or `pipaux` code. The R checks establish the
loaded directory, not which build supplied that code. Extraction can also
overlay an existing `sources/<package>` directory. For the next authorized
fresh run, require an unoccupied extraction target and extend the existing
Stamp fingerprint pattern to the three successful installs. Check that
fingerprint once at proof entry. The retained three install receipts show
exit 0 (`log/aux-install-*.result.json:3–7`); no installed mismatch was
observed, and the retained evidence should not be edited or rerun for this.

**P3 — `advisory`, defer — `run.py:320–335,399–521,529–633,648–659`.**
The 659-line scratch launcher puts diagnostic controls, package setup, and
acceptance under one stage menu; `proof-live` runs the offline TEST lane.
If promoted into a maintained tool, separate the diagnostic commands from
the qualified offline proof entry point. Do not refactor historical evidence.

## Route and downstream boundary

- The hub drives the proof, not the pipeline. Only `pipfun`'s two GitHub
  fetch functions are substituted, with unlisted locators rejected.
  Installed `pipfun` initializes TEST before `pipaux` loads; `pipload`
  registers country-list and reads exact versions; `pipaux` produces PFW,
  then POP; Stamp provides aliases, catalog, retained versions and hashes.
  No producer, validator, writer or reader is replaced in the harness
  (`aux-proof.R:96–158,168–241`; `SYSTEM_DESIGN.md:284–309`).
- The [Stamp handoff](../20261121T153507Z-stamp/handoff.md#L95-L110)
  records the private `store-test`, `aux` alias, exact TEST IDs and byte and
  object hashes. The original country-list ID is provenance only. Survey
  Phase 2 must independently verify the same store and its complete required
  parent set after the auxiliary writer has exited. Nothing here regenerates
  CPI/PPP, clears the public one-file survey route gate or establishes the
  DLW checksum contract (survey Plan r2:63–104,173–176;
  [DLW handoff](../20261121T153507Z-dlw/handoff.md#L18-L26)).
- Scratch execution evidence, this review, and coordinator-owned lifecycle
  state are separate. The [Stamp handoff](../20261121T153507Z-stamp/handoff.md#L16-L33)
  is partial for independent review, not a failed save. The Plan-linked
  execution report still has an open Run 3 entry (auxiliary work report:62–77).
  The coordinator records the accepted result and Qmd link or checkpoint
  fallback after aggregating the reviews (auxiliary Plan r4:13,123–127).

## Changes
Only this fresh, resolved E: v2 report, from running to final. No source,
Plan, store, lifecycle, or Git mutations.

## Checks run
Loaded all five required R skills before reading R. Checked the scoped
source, Plan r4, retained handoff, and downstream/lifecycle references.
Cross-checked existing PASS markers and exit receipts only. Read-only Git
confirmed the checkout, `main`, and full HEAD before and after review;
verified the destination was initially absent and has no reparse ancestry.

## Gaps
No payload inspected, launcher or R executed, or store rehash performed.
Independent evidence for fresh installed-build binding is absent for the
three PIP packages; no mismatch was observed. Broader review integration,
remaining survey parents, and the independent DLW integrity gate are not
closed by this review.
