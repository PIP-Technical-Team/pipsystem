---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-pop-predicate-proof
status: blocked
updated: 2026-11-19T22:22:27Z
owner: Validate local population snapshot
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: Coordinator owns any separately authorized diagnostic of the namespace-qualified predicate; this attempt will not rerun.
---

# M2 population predicate diagnostic

## Summary

**FAIL at the known-unique control.** The experimental `popmain_validate_raw()`
rejected the two-row fixture with distinct composite keys before the producer ran:

> Description of invalid cases for POP main raw data validation, no duplicate
> records in key variables

`proof.log:13-28` records R exit 1 and the call to
`validator(unique_keys, detail = FALSE)`. The producer was not called, and
there is no experimental population candidate for `20260401_TEST` or downstream
Colombia 2010 GEIH income GPWG use.

## Changes

- This run contains `handoff.md`, `proof.R`, `run.ps1`, and `proof.log`.
  Runtime scratch was only in ignored `.tmp/m2popfix`.
- Candidate source exists only in memory. `proof.R:8-24` guards and replaces
  three `validate_if(is_uniq(...))` expressions with
  `validate_if(all(is_uniq(...)))`, at pinned `pipaux` `R/aux_pop.R:312,412,453`.
  No WDI, data, join, key definition, or other validation change was made.
  The prior local-I/O harness was SHA-256 verified and reused in memory.
- Neither package files nor prior proof files were edited. No network,
  installs, Git mutation, shared access, PIP startup or pipeline execution.

## Checks run

- **PASS, paths and pins.** The exact E: paths passed `pipsys.R check-path` and
  the existing `paths.ps1` reparse/hard-link checks. Hub `main` remained at
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`; `pipaux` `PROD` remained at the
  HEAD above with an empty scoped diff. No new dependencies were used.
- **PASS, unchanged local inputs.** The pre- and post-run SHA-256 values matched
  the prior proof for `pop.xlsx` and `spop.csv` from `aux_pop` commit
  `639613e9032e61c45b3f1dd8208cff0587d1b624`, and for country-list pin
  `30d540ca6e32d842`. The country-list object hash also matched. See
  `run.ps1:7-11`, `proof.log:2-5`, and the prior proof's `proof-retry.log:2-3,15`.
- **FAIL, first control.** R 4.5.2 and the CPI-pilot E: libraries reached the
  full adapted validator, not a standalone predicate. Its known-unique control
  failed with the message above (`proof.R:26-38`, `proof.log:13-28`). The observed
  `Sys.Date()` was `2026-11-19`; the unchanged ceiling `2026` was recorded,
  but no producer year filtering ran.
- **PASS, no output on rejection.** `.tmp/m2popfix/store` and `candidate.tsv`
  were both absent after the diagnostic.

## Gaps

- The coordinator's standalone scalar predicate accepted unique keys and the
  workbook and rejected true duplicates
  (`pipsystem/m2-aux-inputs/20261119T215954Z-local-boundary/pop-predicate-control.log:11-23`
  under the orchestration outputs). Separate coordinator controls then found
  that qualifying `assertr::is_uniq()` passed the full main validator on the
  unique fixture and workbook and rejected the duplicate fixture, with or
  without `all()` (same directory, `pop-namespace-control.log:21-25`). This
  distinguishes the namespace-qualified control result from the failed
  unqualified scalar experiment; it does not demonstrate producer behavior.
- **NOT RUN:** the duplicate control and the special/output controls, producer,
  retained payload readback and output checksums, and the positive national
  COL 2010 check. No revised candidate or retry was attempted. No release or
  survey acceptance was in scope.
