---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-pop-local
status: blocked
updated: 2026-11-19T22:12:32Z
owner: Validate local population snapshot
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: M2 coordinator traces the failing uniqueness check before proposing a fix or rerun.
---

# M2 local population producer proof

## Summary

**FAIL.** The pinned `pipaux` function `aux_pop_update` stopped at the main workbook's
raw uniqueness check. The unchanged validator aborted with:

> Description of invalid cases for POP main raw data validation, no duplicate
> records in key variables

That check covers `(country_code, year, pop_data_level)` across the transformed
main workbook before the special-case overrides or country-list filter
(`pipaux` `R/aux_pop.R:74-117,156-161,293-321`). No population candidate exists.
For `20260401_TEST`, the exact national COL 2010 population input for GEIH income
GPWG is still unverified. Bounded `pipdata` deflation selects and validates
population before its national unchanged-weight return (`R/pd_deflation.R:116-119,131-141`).

## Changes

- This run folder contains `handoff.md`, `run.ps1`, `proof.R`, and two small logs.
- Raw input bytes are retained only in ignored `.tmp/m2pop/inputs`; runtime
  scratch is also under `.tmp/m2pop`. No payload rows are recorded here.
- No package edits, commits, shared I/O, authentication, installs, PIP package
  startup, PIP pipeline, scheduling, promotion, or permission changes.

## Checks run

- **PASS, checkout and write scope.** `tools/pipsys/packages.csv:2,4,5,8`
  registers the checkouts. Read `pipaux`'s `compound-gpid.md` and
  `compound-gpid.local.md`; `PROD` stayed clean at the HEAD above, including the
  scoped source diff. Hub `main` stayed at `1821c5526337d03b87a9e61ad934b3c7316c16cf`.
  The reader reference was `pipfun` PROD `7d534516a8c17c33d537681610eccd4c29211762`
  (`R/get_from_gh.R:167-178`, `R/load_from_gh.R:61-74`). The consumer reference
  was `pipdata` PROD `53a76e379c81a3ac70b39925954981ae6a691459`.
  E: is fixed. Direct `pipsys.R check-path` and the existing `paths.ps1` reparse
  and hard-link checks passed for the exact destinations; `git check-ignore`
  confirmed exclusion of both raw files and the reserved scratch store path.
- **PASS, pinned inputs.** Anonymous raw HTTPS at commit
  `639613e9032e61c45b3f1dd8208cff0587d1b624` returned two files. `git hash-object
  --no-filters` verified `pop.xlsx` blob `3326203c0ce359852633cf9da6bd49d24676723b`
  and `spop.csv` blob `da1c247e66623145a8ebcee6a8046630c1e00b48`.
  `proof-retry.log:2-3` records both SHA-256 values alongside the blobs.
  The staged CPI-pilot country-list retained pin `30d540ca6e32d842` matched
  SHA-256 `1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f`
  and object hash `9211182e995b116f` (`proof-retry.log:15`, CPI `inputs.tsv:3`).
- **FAIL, exact producer.** An initial setup pass stopped before entering the
  producer due to an overly broad adapter call match (`proof.log:15-18`). The
  corrected adapter narrowed that match and reused the same verified bytes.
  The producer was entered once; only acquisition and save bindings changed
  in memory. The unchanged main raw validator aborted with R exit 1
  (`proof-retry.log:21-33`). R 4.5.2 used the CPI-pilot E: libraries; actual
  `Sys.Date()` was `2026-11-19`, giving the unchanged year ceiling `2026`
  (`proof-retry.log:4-5`; filter application was not reached).
- **PASS, no output on rejection.** Filesystem check confirmed neither
  `.tmp/m2pop/store` nor `candidate.tsv` exists. There is no retained path,
  version ID, output content hash or file checksum to use.

## Gaps

- **NOT RUN:** special-case validation, overrides, year filtering, output
  validation, save/readback/checksums, and the exact positive national COL 2010
  check including raw comparison. The failure does not identify whether that
  particular target key was affected. Do not use an isolated raw cell as a
  substitute for the validated population artifact.
- The cause of the uniqueness-check rejection is **UNKNOWN** in this proof.
  The validation message alone does not establish duplicate keys in the source
  workbook. The coordinator is checking the validator's evaluation separately;
  no package or source-data change was attempted.
- No shared-release or survey acceptance. CPI, PFW, and PPP are outside this proof.
