---
schema: pip-handoff-v2
project: pipsystem
task: cpi-rebuild-pilot
run: 20261119T202215Z-release-inputs
status: completed
updated: 2026-11-19T20:30:01Z
owner: code
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: CPI-only pilot complete. Keep the candidate local and leave the shared release unchanged. Any expansion to other measures or promotion is separate work.
---

# CPI Pilot: 20260401_TEST Inputs

## Summary

`20260401_TEST` is the fixed working release for this effort. Branch and catalog
identifiers below identify bytes within that release, not another release
selection. This follow-up addresses the missing inputs in the previous
`pipaux/cpi-rebuild-pilot/20261119T165401Z-local/handoff.md:18-22`.
One new local CPI snapshot, `b857f991a3c4579f`, passed the CPI validators,
the 2021 value comparison, exact-version readback, and byte-checksum verification.

## Changes

- Added a confined staging launcher. No package or shared writes, release
  setup, installs, credentials, Git changes, or publication.
- Added `rebuild.R` in this bundle. It verifies the staged input hashes and
  reuses the pinned CPI transformation and validator definitions. It adapts
  only the three I/O calls in the local script (raw CPI, country list, save),
  not the validations or package code. It uses a single fresh local Stamp
  store `.tmp/cp26/store` with checksums enabled. No PIP package startup.

## Checks run

- At pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, `R/aux_cpi.R:25-33,
  135-137,163-183` identifies the release branch, raw CPI and country-list use.
- At pipfun `7d534516a8c17c33d537681610eccd4c29211762`, `R/load_from_gh.R:18-24,
  55-59` identifies the source file; `R/get_from_gh.R:167-174` uses readr for CSV.
- At pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6`, `R/load_aux_data.R:25-37,
  60-66` resolves the release's country list; `R/pip_read-write.R:92-107` calls
  Stamp. Corrected Stamp staged source (`db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`
  plus manifest `5c9fd6893d259bdf8613641fb2762ffeca40df27534d675220547d73d1ed5546`),
  `R/IO_core.R:650-675,714-715`, reads the current file without a version arg.
- Unauthenticated GitHub read resolved `PIP-Technical-Team/aux_cpi` branch
  `20260401_TEST` to commit `7e96f769859bad9f8d98b8aa0e67250bf1b3e7a3`,
  `cpi.csv` blob `adb5a6fdac90e0842e1989a76c9ede023d9e860d` (536046 bytes).
  The exact shared release catalog, country-list main file and versions
  directory exist. These were read-only existence checks, no shared alias setup.
- `stage.log:2-11`: the first read stopped because the catalog pointer
  `b5ff7ff6f5d8e9d6` has no retained payload at its expected path. The normal
  CPI loader reads the main country-list file, not a requested exact pin.
  `stage-20261119-152627-266.log:1-6` records the unique byte-identical retained
  copy `30d540ca6e32d842`, verified against main and the catalog's object hash.
  The sampled catalog SHA256 was unchanged. Both staged files and their
  exact references and SHA256 values are in `inputs.tsv:2-3`. No pointer moved.
- `rebuild.log:12-13`: first local attempt stopped at the source adapter's
  check for exactly one country-list call, before saving. The adapter was
  narrowed to the CPI country-list call, not the separate public load wrapper.
- `rebuild-20261119-152837-905.log:10-22`: R 4.5.2, exit 0. The CPI validators,
  primary key, and raw-to-output comparison for the 2021 CPI column passed.
  Exact retained readback passed validation and matched both the stored object
  hash and the recorded file checksum. Two existing libraries (`data.table`
  and `data.validator`) emitted R 4.5.3 build-version warnings under R 4.5.2.
- `candidate.tsv:2`: 10,228 rows, exact local pin `b857f991a3c4579f`, persisted
  byte checksum `131b3fe928e817b7`. Independent PowerShell file SHA256 matched
  the receipt. `git check-ignore` confirmed both staged files and the retained
  data output are ignored; pipaux HEAD and inspected source were unchanged.
- `experiments/pip-pipeline.qmd:169-182` distinguishes the failed shared
  eligibility run from the successful local pilot. Only prose changed.
  The guarded launcher local run `local-d71f09e57510.log:55-87` exited 0 and
  passed the Qmd checks, including the exact manual cell binding and the four
  source-change refusal controls. No full Qmd render or shared rerun.

## Gaps

- Pilot-only candidate. Its new checksum does not supply historical byte
  evidence for the old pins. The stale country-list pointer was not repaired.
- Does not certify production `pipaux` startup or the networked updater, nor
  numeric equivalence to the historical CPI artifact. Only CPI was rebuilt.
- No shared reconciliation/repair, release promotion, or survey acceptance.
