---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261120T215701Z-verify-survey
status: completed
updated: 2026-11-20T21:58:58Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: '.cg-docs/plans/2026-11-20-m2-one-survey-acquisition-preflight.md (revision 2)'
next: Parent to record Plan closure; runtime preflight requires separate authorization.
---

# M2 survey Plan revision 2 — closure review

## Summary

All five recorded findings are **closed in the written revision 2 Plan**.
No runtime gate was checked. Line references below are to the survey Plan.

| Finding | Status | Revision 2 evidence |
|---|---|---|
| P2.1 Raw binding | Closed | Lines 97–104 require one receipt linking checksum-verified bytes to the exact local raw version/hash read by GPWG validation and cleaning; an unprovable link fails. |
| P2.2 Auxiliary handoff | Closed | Lines 92–97 require the auxiliary proof to pass and its writer to exit, and verify the same private store, aliases, and route-required measure versions/hashes against receipts before downloading. No rebuild or fallback. |
| P2.3 Welfare period | Closed | Lines 110–116 and 162 require an independently established source period and row-aligned daily welfare and unchanged-weight checks before either save; stop if the period is unknown or unsupported. |
| P2.4 Protected destinations | Closed | Lines 73–80 and 184–185 require approved, access-restricted E: destinations for raw/clean data and payload-bearing diagnostics, not just E: and Git ignore. Lines 133–142 keep evidence sanitized. |
| P3.1 Exact pair | Closed | Lines 117–122 require both exact saved versions, hash verification on the loaded objects, and metadata lineage to the exact clean version/hash. |

## Changes

Only this new handoff, saved as running then finalized. No changes to the
Plan, prior handoff, package files, or Git.

## Checks run

- Matched hub root, `main`, and full HEAD using read-only Git before creation
  and before finalization.
- Verified the report and run folder were absent and existing ancestors through `E:\` were not reparse points.
- Confirmed `revision: 2` at Plan line 4; compared the changed passages and
  verification gates to the five findings in the prior handoff, lines 24–70.
  No broader review, R launch, tests, installs, or live access.

## Gaps

- The supported one-file route, DLW access, approved storage, actual source
  filename/checksum and welfare period, exact auxiliary bindings, and real
  execution evidence remain unverified (Plan lines 183–194). Plan closure
  does not authorize execution or prove acquisition, validation, or readback.
