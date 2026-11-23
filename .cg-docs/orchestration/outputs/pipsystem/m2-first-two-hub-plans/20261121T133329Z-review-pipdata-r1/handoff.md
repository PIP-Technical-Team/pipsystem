---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T133329Z-review-pipdata-r1
status: completed
updated: 2026-11-21T13:40:25Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-21-m2-public-one-file-dlw.md r1
next: Parent coordinator takes up the r1 findings on receipt of this review; no implementation in this run.
---

# Compound GPID Plan review: pipdata M2 r1

## Summary

**Revise r1 before implementation: 1 P1, 3 P2, 1 P3.** The single-file
stage fits both charters and has a bounded DLW request candidate, but the
current validation reconciliation can make an older receipt look eligible
without calling the exact reader. The authoritative DLW checksum definition
is also still unknown; r1 correctly stops on that gap.

## Findings

Plan line references below are to `2026-11-21-m2-public-one-file-dlw.md` r1.

- **[P1.1]** [cg-plan-critic] Step 2, Plan lines 85–95 and 132–134 — Gate
  exact validation before legacy reuse.
  **Issue:** An exact worker alone won't prevent reuse of an old validation
  result for the same source filename and checksum.
  **Evidence:** `pipdata/R/pipdata_dlw_compare.R:749–780` retains rows by
  `survey_id`/`Checksum` and removes them from candidates.
  `R/pipdata_validate_gmd.R:1299–1305,1538–1555` reconciles *before* applying
  the selection. `R/pipdata_get_gmd.R:1471–1480` accepts a retained valid/Yes
  row without comparing its receipt.
  **Impact:** The exact worker can be skipped and a different raw version
  can become clean-eligible, even with a correct loader.
  **Fix:** On the exact route, revalidate the selected receipt rather than
  retaining its old row, or reuse only durable, verified evidence for the
  same source identity/checksum and raw artifact/version/hash. Return a
  clean row only from the successful persisted selected result matching that
  receipt; no fallback to prior results. Leave unrelated rows and legacy
  reconciliation alone. Add a pre-existing same-checksum, different-receipt
  row to the planned V2 fixture.

- **[P2.1]** [cg-plan-critic] Step 1, Plan lines 39–44, 65–78, 132 and
  152–154 — Make the checksum definition the first gate.
  **Issue:** The Plan says verify the contract but does not specify the
  evidence that establishes what `Checksum` means.
  **Evidence:** `pipdata/R/pipdata_dlw_compare.R:83–95,121–164,1262–1270`
  treats it as catalog text and compares the two pins; the survey preflight
  (`20261121T002322Z-survey/handoff.md:138–150`) explicitly found no digest
  definition. The DLW candidate evidence
  (`20261121T041012Z-unblock/handoff.md:71–78`) shows byte access, not a
  definition.
  **Impact:** A synthetic catalog with a self-chosen digest can pass while
  the actual public contract is unsupported.
  **Fix:** At the start of Step 1, require an approved authoritative source
  for the digest algorithm, exact byte representation and checksum encoding
  or normalization. Use an independently expected digest in V1; keep it
  separate from the Stamp object hash. If authority is unavailable, apply
  the existing stop and leave dependent checks NOT RUN; do not guess or
  use live/private inputs to infer the contract.

- **[P2.2]** [cg-plan-critic] Step 1, Plan lines 65–78 and 132 — Bind the
  bytes to the parsed object before publishing to Stamp.
  **Issue:** Checking an environment buffer and obtaining a table are not
  by themselves proof that the table came from those bytes; reusing the
  legacy worker can also write a pins entry before the check.
  **Evidence:** `pipdata/R/pipdata_get_gmd.R:511–526,560–565` supplies an
  existing `local_dir`, then marks a successful call available. Survey
  preflight `:68–83` traces DLW's pins write and establishes it is not a
  Stamp receipt. The old focused test has a DLW mock that writes Stamp
  itself (`tests/testthat/test-m2-one-survey-acquire-format.R:425–441`).
  **Impact:** A mismatched table or pre-verification write can slip through,
  or a test can bypass the new acquisition boundary entirely.
  **Fix:** In Step 1, use the supported one-file request in non-persisting
  mode if the pin supports it, otherwise isolate transport scratch on E:.
  Use the parser output from that verified byte buffer, or prove the pinned
  synchronous request parses that same buffer and returns its object. Only
  then call the normal writer and publish availability after the verified
  receipt. In V1, stub transport/catalog only, use a distinctive synthetic
  payload, and assert that its expected parsed values are read back from
  the receipt's exact version. A mismatch must produce no registered raw
  version or new eligible row. Do not alter the legacy worker defaults.

- **[P2.3]** [cg-plan-critic] Step 2, Plan lines 85–95 and 133–141 — Keep
  the exact mode distinguishable at the public clean boundary.
  **Issue:** The existing inventory fields cannot identify exact-route
  rows; both routes already populate them. An extra column alone also
  won't reach the reader through the current normalization.
  **Evidence:** `pipdata/R/pipdata_validate_gmd.R:667–691` populates version,
  hash and catalog checksum for legacy rows. `R/pd_process_data.R:111–124`
  normalizes the supplied inventory via
  `R/dependency_execution.R:214–231`; `R/pipdata_dlw_compare.R:569–571`
  projects only known columns. `R/inv_dlw_load.R:22–28` reads by version
  then modifies the object; it has no separate hash check.
  **Impact:** A presence-based check tightens batch behavior, while a
  dropped marker silently skips the check on the exact route.
  **Fix:** Specify how the exact receipt's provenance reaches the existing
  public clean path (e.g., one optional exact-route marker preserved through
  normalization). Hash the object at the pinned read, before conversion or
  cleaning; no latest fallback for exact rows. Extend V2 with a correct
  version but wrong recorded hash (no clean work or output) and one unmarked
  legacy row showing unchanged batch behavior. No second inventory engine.

- **[P3.1]** [cg-plan-critic] Steps 1–2, Plan lines 63–64, 94–95 and
  134 — Account for the exact export regression gate.
  **Issue:** The old gate compares the full export set, so a correct new
  stage export by itself fails V3.
  **Evidence:** `pipdata/tests/testthat/test-dependency-api-contract.R:105–139`
  allows only the earlier `pd_run_pipeline` delta and checks S3 registration.
  **Impact:** The regression can be mistaken for an API break or weakened.
  **Fix:** Name this file in V3 and allow exactly the new stage export;
  retain existing signatures, export and S3 assertions. Keep the affected
  clean fingerprint gate (`R/code_fingerprint.R:1–17` and
  `tests/testthat/test-code-fingerprint.R:44–63`).

## Changes

This handoff only (running, then completed). No Plan, source, lifecycle,
configuration or Git mutations, and no writes outside E:.

## Checks run

- Read the complete approved r1 and both charters' Objective, Constraints and
  Current Focus (`pipsystem/compound-gpid.md:10–12,24–40`;
  `pipdata/compound-gpid.md:10–12,18–24`). Reviewed only the relevant prior
  Plan and survey/unblock preflight excerpts. Loaded shared, technical,
  data.table, collapse and testing skills before reading R source.
- `tools/pipsys/packages.csv:2,5,7` and read-only Git confirmed `pipsystem`
  `main` `1821c5526337d03b87a9e61ad934b3c7316c16cf` and registered `pipdata`
  `PROD` `c70ae403acde648aff1a49d8d3178ca0202c6064` at start and finish.
  Source was read from committed blobs; only path status was examined for
  unstaged B6, state and vignette edits. Relevant source/test paths matched
  HEAD and those dirty files supplied no authority. The specified approved
  Plan itself is untracked; it was read as the requested review artifact.
- Verified registered `pipload` `PROD`
  `ff9a81e386a09fb2531c154f63fd2b91521313c6`: exact version delegates to
  Stamp (`R/load_dlw_data.R:54–87,115–132`; `R/pip_read-write.R:92–107,149–185`).
  `pipdata/R/save_pip.R:91–128` verifies raw writer version/hash candidates.
  DLW `12faa058b521ef511073a7b21b1b1dd7993c9649` was consulted only through
  retained preflight citations. The preflight's pinned source supports
  selecting by filename/module/versions with one candidate; the committed
  selector checks matching pins (`pipdata/R/pipdata_dlw_compare.R:1167–1287`),
  but the acquire/validate stage is still private
  (`20261121T002322Z-survey/handoff.md:60–83`). No separate scope issue with
  the stage-only design or use of the normal writer.
- The handoff path did not exist initially; existing ancestors were checked
  for reparse points on fixed E:, with no `subst` mapping. After creation,
  `Resolve-Path` returned the exact requested full path and all components
  again passed the reparse-point check.
- Plan `:99–102,117–121,136–145` limits proof to synthetic fixtures, private
  E: working storage and no live, private survey or shared access. No
  private/unapproved payload, archive or catalog was accessed in this
  review. For any later authorized offline run, check E: paths before R
  starts (including temp/cache/log and aliases); package load initializes
  options/logging (`pipdata/R/zzz.R:2–25`; survey preflight `:124–136`).

## Gaps

Actual checksum definition, loaded runtime pins and supported fresh byte to
parser binding remain UNKNOWN. No R/package loading, installation, tests,
live DLW, access to household data or production/shared storage, or survey
acceptance ran. V1–V3 are NOT RUN. This static review does not authorize
implementation or a scope change.
