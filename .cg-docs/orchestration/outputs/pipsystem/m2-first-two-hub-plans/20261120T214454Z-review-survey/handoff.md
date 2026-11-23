---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261120T214454Z-review-survey
status: completed
updated: 2026-11-20T21:55:28Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: '.cg-docs/plans/2026-11-20-m2-one-survey-acquisition-preflight.md (revision 1)'
next: Parent to integrate the review findings on return; execution remains unapproved.
---

# M2 one-survey acquisition Plan review

## Summary

Independent review of revision 1: **0 P1, 4 P2, 1 P3**. All package source
cited below is from `pipdata` at `c70ae403acde648aff1a49d8d3178ca0202c6064`.
Plan line references are to the survey Plan unless identified as auxiliary.

- **P2.1 — Bind the checked bytes to the validated and cleaned version**
  (Step 2, lines 85–91). `R/pipdata_validate_gmd.R:593–605,667–688` reads by
  ID, obtains the latest version separately, and copies the candidate catalog
  `Checksum` into the result; `R/inv_dlw_load.R:7–24` subsequently uses the
  validation row's `latest_version_id`. An available/valid row with the catalog
  checksum can therefore appear to prove validation of the download without
  proving that the validator and cleaner read that payload. **Fix:** Require
  one receipt linking the checksum-verified download to the exact local raw
  artifact version/hash read by GPWG validation and then by cleaning. A fresh
  private raw store with one newly materialized version can establish the link;
  if the supported path cannot prove it, stop. Do not compare catalog strings
  in lieu of checking transport bytes.
- **P2.2 — Make the auxiliary handoff a Phase 2 entry gate** (lines 83–98,
  160–165; auxiliary Plan lines 83–89). The serial boundary says to wait, but
  the actionable check follows the download. The auxiliary Plan proves only
  PFW/POP. `R/pd_process_data.R:77–85,118–124` defaults to six measures,
  including GDP/PCE; `R/dependency_execution.R:234–255` selects the latest
  entry per requested measure and fails when one is absent. **Fix:** Before
  Step 2, confirm that the auxiliary writer has exited and the receiving
  runtime resolves the same private store and intended aliases. Name the
  supported measure list for the chosen route and check that its resolved
  IDs, versions and hashes match all required receipts, including retained
  inputs if the route needs them. Do not widen the auxiliary proof or rebuild
  missing inputs to make this pass.
- **P2.3 — Ground the pre-save welfare check in the source period** (Step 3,
  lines 99–107). `R/pd_dlw_clean.R:196–211` always divides by 365 and checks
  finiteness. A test that copies that divisor can pass for a differently
  denominated source; the prior fixture declares annual values (offline Plan
  lines 47–53), not the real file's units. **Fix:** Confirm the pinned file's
  source welfare period in authoritative metadata or documentation and derive
  expected daily welfare and unchanged weights on the approved keys. Require
  that comparison and the clean validation gate before the first save; stop
  if the period is unknown or incompatible with the installed path.
- **P2.4 — Qualify the protected-data destination before download** (lines
  63–75,85–89,119–120,154). E: containment and Git ignore are not evidence
  that the raw and clean copies are in an approved access-restricted location.
  **Fix:** Make approved, access-restricted E: destinations for raw/clean data
  and any payload-bearing diagnostics part of the existing path check before
  download. Keep only sanitized statuses, counts and receipt identifiers in
  exportable evidence. No new storage service is needed.
- **P3.1 — Check the persisted pair, not just same-ID objects** (lines
  102–108,148). `R/pd_metadata_refresh.R:125–140` returns metadata lineage to a
  clean version and hash; `R/save_pip.R:91–127` verifies writer receipts, not
  objects subsequently returned by the reader. **Fix:** In the existing
  readback check, compare both loaded objects to their receipt hashes and
  require the metadata lineage to match the exact clean version/hash (or
  equivalent supported evidence), not just the survey ID.

## Changes

Only this handoff; no Plan, package or Git changes.

## Checks run

- Read the full 179-line saved Plan and `compound-gpid.md:10–40`, including the
  verbatim Objective, Constraints and Current Focus; spot-checked the paired
  auxiliary Plan, M2 umbrella, design rules and cited alignment/inventory and
  offline evidence. Loaded all five R skills before examining R source.
- Read-only `git rev-parse`/`symbolic-ref` matched the expected hub root,
  `main` and full HEAD before review and before finalization. Registered
  `pipdata` was on `PROD` at the pinned SHA; checked cited working-tree files
  against the pin and used object-scoped `git grep` for the helper callers.
- The public `pipdata_get_gmd()` passes `selected_filenames = NULL`
  (`R/pipdata_get_gmd.R:801–811`); `pipdata_dlw_process()` takes an inventory ID
  and delegates to it (`R/pipdata_dlw_process.R:663–685,822–827`). The
  exact-selection helper is internal (`R/pipdata_get_gmd.R:1409–1487`;
  `NAMESPACE:59–65`); pinned search found only test callers. Revision 1
  correctly blocks on an internal-only/unbounded route (lines 65–79); an
  exported GPWG validator alone is not a supported acquisition handoff.
- Reviewed the acquisition checksum/GPWG gate, pre-save clean enforcement,
  versioned pair checking and serial private TEST-store use. The public
  `pd_process_data()` invokes clean and metadata stages and returns without
  executing deflation (`R/pd_process_data.R:146–190`). No change needed to the
  Plan's stop before deflation (lines 131–135).
- Exact report/run folder were absent; existing ancestors through `E:\`
  had no reparse points before creation. `git check-ignore` confirmed the
  intended hub `.tmp/` pattern (`.gitignore:36`), not its suitability for
  protected storage.

## Gaps

- Supported installed one-file DLW-to-pipdata handoff, access, actual filename
  and checksum contract, real source period, and the destination and auxiliary
  runtime bindings remain unverified. The prior inventory did not verify the
  payload. No R, tests, installations, service access or survey/auxiliary
  execution; no Plan, package or Git changes.
