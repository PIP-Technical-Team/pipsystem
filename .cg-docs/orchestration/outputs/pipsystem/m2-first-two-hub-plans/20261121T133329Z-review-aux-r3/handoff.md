---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T133329Z-review-aux-r3
status: completed
updated: 2026-11-21T13:39:25Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md r3
next: Parent integrates two Step 1 and V1 findings before the auxiliary run.
---

# M2 installed auxiliary save proof — r3 review

## Summary
Two P2 findings in Step 1 / V1. `Plan` is r3; `Inputs` is
`../20261121T041012Z-inputs/handoff.md`.

- **[P2.1] [cg-plan-critic] Step 1 / V1 — Bind the default read to the new TEST version.**
  **Issue:** Plan:88–93,148 verifies the receipt, retained checksum and two
  returned object hashes, but does not require that the new version is current
  or that the current file is the one bound to that receipt.
  **Evidence:** Inputs:108–116,125–135 requires both bindings. The producers
  use unversioned `load_aux_data()`, which resolves the active aux root/alias
  (`pipload/R/load_aux_data.R:29–81`). Stamp loads current bytes on that path
  and a retained snapshot on the exact path (`R/IO_core.R:637–669,714–715`).
  **Impact:** Identical objects can pass both hash checks without proving that
  PFW and POP consume the version just registered in this store.
  **Fix:** In the existing V1 check, require `country_list.qs2` in the actual
  TEST aux alias to have the writer-assigned ID as its catalog current version.
  Match the current file and exact retained snapshot to that version's stored
  file checksum and keep both unchanged loader calls and object hash checks.
  Stamp copies the current bytes into the snapshot (`R/version_store.R:774–803`).

- **[P2.2] [cg-plan-critic] Step 1 / V1 — Enable checksums before the country-list save.**
  **Issue:** Plan:79–93 requires a stored checksum for the Step 1 registration,
  but only Step 2 (Plan:100–103) says to enable file checksums.
  **Evidence:** The pinned Stamp archive defaults `store_file_hash` to `FALSE`
  (`R/aaa.R:205–213`); its normal save records `NA` without that option or a
  modern execution request (`R/IO_core.R:448–468`). The candidate `pip_write()`
  forwards to `st_save()` (`pipload/R/pip_read-write.R:185–221`).
  **Impact:** A valid registration can fail V1 on default settings; enabling
  checksums in Step 2 is too late for that version.
  **Fix:** Move the existing checksum setup to before the Step 1 write and keep
  it enabled for V2 and V3. No second registration or catalog edits.

## Changes
This handoff only, written as running then finalized. No Plan or package edits.

## Checks run
- Read the complete Plan r3, charter sections, Inputs:90–138 and the survey
  preflight Plan's serial handoff (r2:44–45,93–98,173–176). Plan:79–93 correctly
  separates source SHA-256 and object hash from the new TEST ID and its stored
  checksum. The original `30d540ca6e32d842` is provenance only. The Plan bars
  substitution beyond source fetch, and preserves the same-store serial PFW
  then POP gates and survey handoff (Plan:85–87,95–117,145–157).
- Checked candidate source to stdout without extraction or execution: pipload
  archive header `4ef0d90a974cb6ff0725da69373bde421dd04ad5`; Stamp archive
  SHA-256 `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586`
  (development archive; base `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`,
  Inputs:55). Verified the output was fresh before the first write and that
  the report still resolved on fixed E: without reparse points before the update.

## Gaps
Branch and HEAD are supplied, not independently verified; no Git was invoked.
No R, network or shared access. Offline setup, the actual TEST registration,
and V2/V3 save and readback were not run; this review is not runtime evidence.
