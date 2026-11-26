---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T133329Z-verify-aux-r4
status: completed
updated: 2026-11-21T13:43:28Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md r4
next: Parent records closure when this review returns; V1–V3 still need an authorized run.
---

# M2 installed auxiliary save proof — r4 closure review

## Summary
Both findings are closed in the saved Plan (revision 4 at line 4). This is
written-plan verification, not a runtime PASS.

- **P2.1 — Closed.** Step 1 binds the writer-assigned TEST pin to the actual
  private aux alias (r4:82–85). It requires that alias's catalog to mark the
  receipt version current, both the current file and retained snapshot to
  match its stored checksum, and both unchanged reads to match the pinned
  object hash (r4:89–95). V1 requires the same evidence (r4:150). This closes
  the gap in `../20261121T133329Z-review-aux-r3/handoff.md:22–36` and matches
  the check in `../20261121T041012Z-inputs/handoff.md:125–135`.
- **P2.2 — Closed.** Step 1 enables stored file checksums in the private
  runtime before any save and keeps them on, before the one normal
  `pipload::pip_write()` registration (r4:79–84). Step 2 uses the stored
  checksum rather than enabling it after registration (r4:98–105); PFW
  still precedes population and the same store is retained (r4:106–111,
  151–152). This closes `../20261121T133329Z-review-aux-r3/handoff.md:38–48`.

## Changes
This handoff only, written first as running. No Plan, package or Git changes.

## Checks run
Read saved r4 and compared its Step 1, Step 2 and V1 terms with exactly the two
findings in the r3 review. Read-only Git confirmed the stated checkout, branch
and HEAD before both report writes. Verified the exact handoff and run directory
were fresh before creation and the report resolved on fixed E: without reparse
points before finalizing.

## Gaps
No R or live access. Offline setup, country-list registration and both reads,
and the installed V2/V3 saves and readbacks remain unverified by this review.
