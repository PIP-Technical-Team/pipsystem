# Auxiliary Recovery Pilot

## Result

The isolated CPI rebuild for `20260401_TEST` passed. It produced one new
local snapshot, not a replacement for a historical version. The pilot did not
write to the shared store.

## Evidence

- The reconciliation API and Windows path-binding regression tests are in
  [the Stamp feature commit](https://github.com/randrescastaneda/stamp/commit/ee6be3fcd02a8047bb17fcc4a95bc71c81c561db).
  Qualification of the matching development source passed 4,465 assertions
  across 40 installed test contexts, with no failures, errors, warnings or
  skips (`suite.log:1280-1281`, retained locally). This was not a release or
  CRAN check.
- The guarded shared dry-run got past catalog path binding but all six
  targets failed pinned-metadata validation. A separate read-only diagnostic
  found that slash spelling accounted for the path discrepancy. The recorded
  format, content-hash and size comparisons matched. None of the targets had
  a usable persisted file checksum. The diagnostic observed all six rows;
  it did not establish eligibility or verify the retained payload bytes
  (`shared-219d077f900f.log:6-23`, `pin-diagnosis-e602bdea0368.tsv:2-7`,
  retained locally).
- The CPI pilot used the release's pinned raw CSV and the retained country
  list that matched the release's current file byte for byte. It ran the
  existing CPI transformation and validators with local input and output
  adapters. Primary-key checks, the comparison of output 2021 values to the
  raw CSV, exact-version readback and verification of the checksum recorded at
  save all passed. Two installed dependencies warned that they had been built
  under a newer R patch version than the one running the pilot
  (`rebuild-20261119-152837-905.log:10-22`, retained locally).

## Gaps

- The new CPI checksum is not historical byte evidence for the old snapshot.
  The pilot does not establish historical numeric equivalence or validate the
  other five measures, the networked updater, or survey execution.
- The operational notebook and launchers, exact run receipts and data remain
  local. This public checkpoint documents the outcome without exposing local
  storage configuration or distributing data.
