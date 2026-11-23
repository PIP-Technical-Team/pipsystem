---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-performance
status: completed
updated: 2026-11-21T16:04:58Z
owner: performance review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: Coordinator incorporates the performance result in the full review; no performance fix or rerun is required.
---

# M2 auxiliary-save performance review

## Summary

No P0–P2 findings and no material performance issue in the bounded R proof.
One P3 advisory: keep one-time setup out of a repeat proof.

**[P3]** `.tmp/m2-aux-save/20261121T153507Z-diagnosis/run.py:338–387,434–465,529–563,613–633` — Cold staging costs substantially more I/O than the proof launcher alone.

- **Issue:** Staging walks, copies, and rehashes the standard R runtime and
  dependency files. The prior Stamp handoff records 2,278 mirror component
  files plus two frontends and 6,479 verified dependency-file records
  (`../20261121T153507Z-stamp/handoff.md:64,79–85`). The existing proof path
  already bypasses staging and installs, rechecking the pins before its one
  proof child.
- **Impact:** Low for this one-off proof; replaying setup adds thousands of
  file operations. The 120-second proof limit applies to the child-tree wait,
  not to launcher preflight (hashes and nine Git queries) or timeout cleanup
  (`run.py:119–133,249–265,290–315,613–633`). No end-to-end time was inferred.
- **Fix (`advisory`):** No edit. If a future rerun is authorized and staging
  remains qualified, use the existing proof-only path with a fresh private
  store and log label. Do not replay diagnosis or installs solely for review.

The R proof checks three receipts serially. Checksum reads of current and
retained bytes, exact-version object reads, and the separate country-list
default read each establish distinct evidence; do not drop them to save I/O
(`.tmp/m2-aux-save/20261121T153507Z-diagnosis/aux-proof.R:168–241`).

## Changes

This report only. No source changes or Git mutation.

## Checks run

- Verified the checkout root, `main`, and full HEAD before review; rechecked
  branch and HEAD before finalization. Verified the fresh report destination
  and all three review paths resolve on E: without reparse-point ancestry.
- Loaded all five required R skills before reading the proof. Statically
  traced staging, child preflight and deadline, and serial receipt checks.
  No source edits, data payload access, or launcher/proof executions.

## Gaps

- No launcher end-to-end timing, per-stage I/O, or peak memory was measured.
  V1–V3 and child exit are prior evidence only
  (`../20261121T153507Z-stamp/handoff.md:20–25,92–109`), not rerun here.
