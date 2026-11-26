---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T133329Z-verify-pipdata-r2
status: completed
updated: 2026-11-21T13:43:28Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-21-m2-public-one-file-dlw.md r2
next: Coordinator receives closure; Step 1 remains stopped pending authoritative checksum evidence.
---

# Independent closure review: pipdata M2 r2

## Summary

All five r1 findings are **closed in the Plan text**. No finding was
reopened. The authoritative DLW checksum contract remains **UNKNOWN**;
the Plan now correctly makes it a stop before implementing the write path.

## Closure evidence

Line references below are to `2026-11-21-m2-public-one-file-dlw.md` r2.
The five prior findings are in the [r1 review](../20261121T133329Z-review-pipdata-r1/handoff.md#L26-L120).

| Finding | Disposition and r2 evidence |
|---|---|
| P1.1 — Exact receipt controls validation reuse | **Closed.** Lines 91–98 require revalidation unless durable validation identifies the same artifact/version/hash, require that match again for final eligibility, and forbid filling the receipt from latest. Lines 104–106 and 148 require the same-checksum/different-receipt case and a newer raw version. |
| P2.1 — Authoritative source checksum first | **Closed in writing.** Lines 65–67 and 147 require authoritative evidence for the digest algorithm, exact byte range or representation, and encoding; a fixture cannot establish the contract. Lines 76–77 separate the digest from the Stamp object hash; lines 167–171 retain the stop and NOT RUN policy. |
| P2.2 — Bind verified bytes to the registered object | **Closed.** Lines 70–76 require fresh-call state, non-persisting transport or non-reader-visible E: scratch, and proof that the registered object came from the verified bytes. Lines 80–84, 114–117 and 147 require verification before the normal raw write, a real exact readback of expected parsed values, and no validation or eligibility for bad bytes. |
| P2.3 — Distinguish exact and legacy clean paths | **Closed.** Lines 98–108 require explicit exact-route provenance through normalization or handoff, a hash check before clean work, no inference from legacy columns, and both a correct-version/wrong-hash no-output check and an unmarked legacy control. |
| P3.1 — Preserve the export regression gate | **Closed.** Lines 88–90, 108–110 and 149 keep the acquisition, validation, API and affected fingerprint gates and permit only the new stage export in the exact-export assertion, leaving other API and S3 assertions intact. |

## Changes

This handoff only, from running to completed. No Plan edit, code change,
Git mutation, or write outside E:.

## Checks run

- Read r2 (revision at line 4) against the five original findings only.
  The fixes stay within the single slice, focused checks and installed-tool
  constraints (`:46–48,112–117,134–136,162–165`); no added requirement.
- Read-only Git verified the same roots and branches, hub `main`
  `1821c5526337d03b87a9e61ad934b3c7316c16cf` and registered `pipdata` `PROD`
  `c70ae403acde648aff1a49d8d3178ca0202c6064` (`tools/pipsys/packages.csv:2,5`),
  and rechecked both HEADs before finalization. No unstaged B6 contents or
  new R source were read.
- The exact handoff was absent before creation. Its closest existing
  ancestor resolved on fixed E:, with no E: SUBST and no reparse points in
  the path ancestry. After creation, the file resolved to the requested
  full E: path, and all path components still passed the reparse check.

## Gaps

Authoritative checksum evidence is still UNKNOWN
([survey preflight](../20261121T002322Z-survey/handoff.md#L138-L150); r2
lines 65–67, 167–169, 173–177). Closure establishes the requirements and
stop, not the checksum method, fresh-byte/parsed-object binding, runtime
pins, or exact read behavior. V1–V3 are NOT RUN. No R, tests, live DLW or
private data access; this review does not authorize execution.
