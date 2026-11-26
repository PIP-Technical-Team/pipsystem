---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-pfw-local
status: blocked
updated: 2026-11-19T22:11:30Z
owner: PFW producer proof
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: Coordinator records PFW as unavailable for the combined M2 input check; any follow-up diagnosis needs a separately scoped task.
---

# Isolated PFW producer proof for 20260401_TEST

## Summary

The pinned TEST PFW passed raw validation but failed output validation after
the country-list join: **`region_code` values within range**. The unchanged
validator aborted before the save call. No local PFW candidate was produced.
This is a producer result for M2, not the pipdata B6 fixture or a pipeline run.

## Changes

This handoff, `run.ps1`, `rebuild.R`, and the two execution logs are in the exact
run folder. Only ignored `.tmp/m2pfw` holds the runtime and staged `pfw.dta`.
No package edits, Git mutations, installs, shared access or live startup.

## Checks run

- Registered `pipaux` PROD checkout and hub `pipsystem` main checked with read-only
  Git. Hub HEAD: `1821c5526337d03b87a9e61ad934b3c7316c16cf`. Scoped diff against
  pipaux HEAD was empty for `R/aux_pfw.R`, `R/validation_report.R`, `NAMESPACE`,
  and `DESCRIPTION`. Git source blobs: `bdf7dec36a773d0d2f686c0c2c778951d84ace48`,
  `0ff34163096ded283817113f2021c97d10584747`, respectively for the two R files.
- Project instructions read. `experiments/one-survey/paths.ps1:1-31` passed on
  the exact destinations before the runtime bootstrap. `pipsys.R:892-897,1590-1598`
  then confirmed the exact handoff and scratch destinations using qualified R
  with temp, home, cache and working directory under `.tmp/m2pfw`. E: is fixed;
  the run and scratch were absent before bootstrap; scratch payload/store paths
  are ignored.
- Existing staged `country_list.qs2` matched SHA256
  `1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f`.
  Version `30d540ca6e32d842` is from the CPI pilot `inputs.tsv:3`; its recorded
  object hash `9211182e995b116f` was recomputed and matched before the join.
- Anonymous HTTPS fetch used only `https://raw.githubusercontent.com/PIP-Technical-Team/aux_pfw/9e0fbb33aefdfb5daecb00f024052fa75741b940/pfw.dta`.
  `git hash-object --no-filters` matched blob `83bc9738cd45ad7e60bc14f5ca837b0075f052b1`
  (2,888,508 bytes; SHA256 `5d80c203fb709e9568f4f4b9db1973254b7021fbe36c06d2f47c5f7bebcb0f45`).
- Qualified R 4.5.2 with the CPI pilot libraries and fingerprinted local Stamp
  (`rebuild-reader.log:1-14`). The raw adapter used the same UTF-8 DTA reader and
  data.table representation as pipfun `7d534516a8c17c33d537681610eccd4c29211762`
  (`R/get_from_gh.R:167-178`, `R/load_from_gh.R:61-71,84-113`). The working R
  file SHA256 pins were matched; only three in-memory I/O call sites were
  redirected (`pipaux/R/aux_pfw.R:153,189-192,225-234`).
- Initial adapter diagnostic: direct QS2 deserialization omitted Stamp's
  original-class restoration and the join hit `could not find function "."`
  (`rebuild.log:12-16`). The local input adapter then applied the qualified
  Stamp reader's existing restoration, without recoding any values or forcing a
  new class. `pipload/R/load_aux_data.R:60-66` and `R/pip_read-write.R:106-107`
  delegate to Stamp (pipload HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`);
  Stamp `R/IO_core.R:714-737` and `R/hashing.R:382-419` show the restoration
  (registered source HEAD `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`; the tested
  development build is independently fingerprinted by `qualified-stamp.R`).
- With the restored staged input, the raw validator returned and the join ran
  (`rebuild-reader.log:14-24`; upstream order `pipaux/R/aux_pfw.R:195-209`).
  **FAIL:** `get_error_validation()` raised:
  ``Description of invalid cases for PFW output data validation, `region_code` values within range``
  (`rebuild-reader.log:25-37`; `pipaux/R/aux_pfw.R:484-486`). The proof stopped
  without changing validation or decision semantics.
- **PASS, no output:** no scratch store and no `candidate.tsv` existed after
  the failure. E: path checks, both HEADs, and the empty scoped pipaux diff were
  rechecked. No source rows are in this report or the logs.

## Gaps

- Offending codes and cause beyond the post-join validation rule are UNKNOWN;
  no further data diagnosis was run. Exact retained readback and output byte /
  object checksums, the Colombia 2010 GEIH income inclusion assertion, and its
  numeric domains are **NOT RUN** because no artifact was saved.
- No GPWG module selection, pipdata integration, live survey, B6 fixture, or
  release acceptance was tested. The source-only consumer reference was
  pipdata `53a76e379c81a3ac70b39925954981ae6a691459`, `R/pd_deflation.R:62-94`.
