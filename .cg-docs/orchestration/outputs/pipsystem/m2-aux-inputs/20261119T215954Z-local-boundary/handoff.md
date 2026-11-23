---
schema: pip-handoff-v2
project: pipsystem
task: m2-aux-inputs
run: 20261119T215954Z-local-boundary
status: partial
updated: 2026-11-19T22:39:36Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: Restore the coordination checkout to main without losing concurrent work; then verify corrected producer saves and prepare the authorized one-survey test.
---

# M2 auxiliary inputs for the Colombia survey

## Summary

The local CPI candidate passed the `pipdata` source-function projection for
COL 2010 GEIH. The candidate and pinned raw CSV agree on all four national
price base years; the 2021 value is finite and positive. The verified local
PPP candidate also passes `pipdata` projection for both national 2021
variants; neither is selected. The unmodified PFW and population producer
checks stopped before save. Their experimental corrections provided verified
local snapshots. The joint check passed with the corrected CPI selector and
those experimental snapshots. No shared repair or promotion was requested.

## Changes

Added local probes, launcher, and execution evidence in this run folder. R
scratch and environment writes are under `.tmp/m2ai` on E:. Updated the evidence
in `experiments/pip-pipeline.qmd` without changing executable cells or shared
snapshot pins. Package corrections have their own run folders below.

## Checks run

Confirmed the hub root and HEAD and the fresh E:-contained report path with
`pipsys check-path`. Read-only Git identified `pipaux` PROD at
`01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` (clean) and `pipdata` PROD at
`53a76e379c81a3ac70b39925954981ae6a691459` (existing B6 and vignette edits).

- `probe.R` pins raw CPI, the pilot's retained QS2 bytes and
  `pipdata/R/pd_aux_attr.R` (Git blob `e12b8daf70c8e6527485a2b243036bdc1b971fc4`).
  It runs `filter_aux_data()` and `create_attr()` unchanged from that file,
  without loading `pipdata` or other PIP namespaces. An initial typed SHA-256
  mismatch stopped before reading the snapshot. Corrected against the pilot
  receipt and independent `Get-FileHash`, not by weakening the check.
- `cpi-projection.log:1-4`: qualified Stamp archive, pinned bytes and object
  hash, exact Colombia input selection, and independent raw CSV comparison
  passed. R 4.5.2 and exact library search order verified; shared setup,
  survey processing and deflation did not run.
- `../../../pipaux/m2-aux-inputs/20261119T215954Z-ppp-local/verify.log:2-13`:
  verified local PPP `404c83141bb0ab87` and vintage inventory
  `72ea2037d77f5728` via exact Stamp readback and saved byte/object hashes. The
  first whole-object check failed on added `stamp_pk` metadata; exact columns,
  keys, provenance and recorded hashes then passed without another build.
  `ppp-projection.log:2-6` independently matched the national 2021 raw cells
  through pipdata's source functions: `ppp_2021_01_01_national` and
  `ppp_2021_01_02_national`. The two raw national Colombia factors are
  exactly equal (`ppp-variant-comparison.log:4-7`). The selected version still
  matters for provenance. No installed-package or shared-release check.
- `experiments/one-survey/check-qmd.R` exited 0 under system R 4.5.2 with the
  existing private library, E:-only scratch, test doubles for directory checks
  and no render. The earlier private executable invocation stopped at its
  startup logging before reaching the check script because `ONE_SURVEY_ROOT`
  was absent. Used system R and the private dependencies for the successful
  run; did not change the private executable or profile.
- The anonymous GitHub discovery worker verified the release branch metadata
  without fetching payloads: PPP `ab55d3ff0d6efddf8b06f1ee8886fc6c08c63c19`,
  `ppp.csv` blob `5f0de04df833c01c85fe91069d243740202188bd`; PFW
  `9e0fbb33aefdfb5daecb00f024052fa75741b940`, `pfw.dta` blob
  `83bc9738cd45ad7e60bc14f5ca837b0075f052b1`; population
  `639613e9032e61c45b3f1dd8208cff0587d1b624`, `pop.xlsx` blob
  `3326203c0ce359852633cf9da6bd49d24676723b` and `spop.csv` blob
  `da1c247e66623145a8ebcee6a8046630c1e00b48`. The worker could not write a
  separate handoff or use shell in read-only Explore mode. These identifiers
  were verified against downloaded bytes in the producer jobs.
- `pipaux/R/aux_ppp.R:183-218`, `R/aux_pfw.R:151-169,185-234`, and
  `R/aux_pop.R:59-201` support the scoped rebuild inputs. All reuse the country
  list staged in the prior CPI pilot (`inputs.tsv:3`). Population is required
  even for national weights because `pipdata/R/pd_deflation.R:116-119` checks
  the exact population key before the unchanged-weight return. GDP/PCE are
  absent from the bounded transform (`R/pd_deflation.R:131-203`), but the
  six-measure pipeline wrapper is wider (`R/pd_run_pipeline.R:1,536-537`).
- The earlier retained-input check found two national 2021 PPP variants
  (`retained-candidate-validation/20261117T192911Z-clean-context/handoff.md:133-153`).
  The baseline decision fixes 2021 but does not choose a vintage
  (`aux-reconciliation-proposal/20261117T223822Z/proposal.md:3-6`).
- `pipaux/m2-aux-inputs/20261119T215954Z-pop-local/proof-retry.log:21-33`
  records a population validation failure before save. An independent probe
  of the pinned workbook and unchanged reshape found 42,510 rows and **zero**
  duplicate `(country_code, year, pop_data_level)` keys. The unchanged
  validator also rejects a two-row unique-key fixture. A worker's in-memory
  `all(is_uniq(...))` change still rejected the fixture. The full validator
  passed both valid inputs and rejected a real duplicate when the predicate
  used `assertr::is_uniq(...)`; adding `all()` was not necessary
  (`pop-namespace-control.log:11-25`; `pipaux/R/aux_pop.R:312-313`). This
  isolates the unqualified function call in the tested source harness, not
  the installed package or the complete update.
- `pipaux/m2-aux-inputs/20261119T215954Z-pfw-local/rebuild-reader.log:25-37`
  records failure of the unchanged post-join `region_code` output validation;
  no candidate was saved. In the [region diagnostic log](../../../pipaux/m2-aux-inputs/20261119T215954Z-pfw-domain-diagnosis/diagnose.log#L3-L17),
  all 2,434 rejected codes among 2,542 rows pass the country-list rule; the
  only included non-alternative COL 2010 GEIH income row is rejected (`LCN`).
  The cleaner explicitly sources that field from the country list, while
  the PFW validator uses other codes (`pipaux/R/aux_pfw.R:151-167,484-486`,
  `R/aux_country_list.R:205-212`). Proposed: keep the country-list convention
  in `region_code` and align its PFW validation rule, without changing
  separate `reg_pcn`. This is a recommendation, not a region policy change.
  Supporting source-only evidence: `pipapi` DEV
  `280af151d05902a550d5dea18cd4bf1a3d013239`, `R/get_aux_table.R:75-87`
  uses country-list region codes; `R/create_lkups.R:135-160` replaces earlier
  estimate codes in API lookups. This is not full downstream compatibility.
- The [experimental PFW proof](../../../pipaux/m2-aux-inputs/20261119T215954Z-pfw-predicate-proof/handoff.md)
  used the exact country-list predicate in memory without recoding or
  changing `reg_pcn`. Validation and retained readback passed for 2,542
  rows at `1ebf03aaca5d5721`. Its only matching included COL income row
  resolves all three domains to national through `pipdata`; this is not
  evidence that the unchanged PFW producer works.
- The [qualified population proof](../../../pipaux/m2-aux-inputs/20261119T215954Z-pop-qualified-proof/handoff.md)
  passed one rebuild and exact retained readback from pinned local inputs at
  `5b6239b8a683e66b`. Three validator controls accepted unique keys and
  rejected true duplicates. There is one positive COL 2010 national key.
  This is not evidence that the unmodified producer works. The proof logged
  two R dependency build-version warnings (`proof.log:28-31`).
- A separate `pipdata` admission failure is reproducible. The complete
  Colombia CPI vector includes `2005_national = NA`; `pd_deflation_select()`
  checks every value before matching requested keys (`R/pd_deflation.R:52-59`).
  This rejects even a request for the valid `2021_national` entry
  (`pfw-cpi-admission.log:6-20`). A simulation that projects the exact 2021
  key before calling the unchanged selector passed; a request for missing
  2005 still failed (`selected-keys.log:6-12`). The proposed package fix
  admits plain missing values only in the CPI source vector while preserving
  the full shape/name checks and the rejection of NaN, infinity, zero and
  negative values. Exact selected values must still be present and finite
  positive. The projection check is not a saved-output or full deflation
  test and did not select a PPP variant.
- [Joint projection](joint-projection.log#L2-L15) passed the exact national
  COL 2010 GEIH input checks using four pinned local artifacts: experimental
  PFW and population, validated CPI projected to 2021, and both eligible
  PPP2021 keys. The mode read retained QS2 artifacts and checked their hashes
  separately in one clean process; this is not same-store recipe binding.
- [Joint projection after CPI source fix](joint-fixed.log#L6-L16) passed
  the full CPI vector without substituting or filtering any values. The
  requested 2021 key passed and the unavailable 2005 key still failed.
  PFW and population were still the experimental snapshots in this check.
- [Final joint source check](joint-verified.log#L6-L26) exited 0: corrected
  `pipaux` output validators accepted the complete experimental PFW and
  population tables in addition to the exact Colombia input checks. This
  did not regenerate either artifact. Two earlier attempts stopped on LF
  normalization changing the expected source digest and a missing harness
  import (`setDT`), respectively; neither changed package code. The final
  run logged an R build-version warning for `data.validator`.
- Verified both package diffs at the original package HEADs. The
  [pipaux validator fix](../../../pipaux/m2-aux-inputs/20261119T222645Z-validator-corrections/handoff.md)
  touched `R/aux_pop.R`, `R/aux_pfw.R`, and three related test files.
  `pipaux/.tmp/m2-validator-corrections/final.log:4-12` records 55 passing
  expectations, 0 failures, two skips, two build-version warnings, and exit 0.
  The two cleaner cases requiring `pipload` and the Stamp suite did not run.
  [The CPI fix](../../../pipdata/m2-aux-inputs/20261119T222645Z-cpi-admission-fix/handoff.md)
  touched `R/pd_deflation.R` and `tests/testthat/test-pd-deflation.R` only.
  `pipdata` passed 10 bounded test blocks with 82 assertions, including frozen
  calculation and changed component fingerprints. The source-only test did
  not run package startup or Stamp save/no-save integration.
- For subsequent orchestration, `pipdata/R/pd_run_pipeline.R:295-301,346-374`
  requires an initialized E:-only store and exact-version recipe parents.
  The prior bounded synthetic proof saved clean, metadata and PFW parents in
  one store (`tests/testthat/test-m2-engine-authority.R:54-90,98-124`). Separate
  producer stores suffice for local coverage checks, not that recipe's input
  binding. Do not silently reinterpret their artifact IDs as one store.
- The earlier real-survey inventory inspection records clean pin
  `7060d4cad2d1686a` and matching metadata pin `0371212271f5db53`, not
  verified payload bytes or a local copy
  (`../../qmd-real-data-setup/20261116T194917Z-col-geih/handoff.md:67-87`).
  For a real one-survey proof, `pipdata` needs the verified clean input in an
  approved data environment, exact same-store clean/metadata/PFW bindings,
  and one explicit 2021 vintage. Generate metadata outside the recipe with
  `pd_aux_attr()` and the pinned input objects; keep the full CPI vector.
  Verify exact output/receipts and national arithmetic/unchanged weights
  (`pipdata/R/pd_run_pipeline.R:381-398`); keep data rows outside project
  files. The source-only worker could not write its report or run Git.

## Gaps

The hub started on `main` at the recorded starting HEAD. The final Git check
found `feat/auxiliary-recovery-pilot` at
`1408035c46f0ebcee494eb3f2c438611505286d3`. The reflog shows a concurrent
checkout and notebook commit during this task. No branch switch, commit,
merge, or attempt to move the changes was made by this task. The Qmd edits
and untracked evidence were left in place. Do not continue package coordination
from the unexpected hub branch.

Local projections are not package-startup, producer publication or
orchestration evidence. The PFW and population candidates use experimental
code; they are not evidence for an installed producer. PPP vintage selection
follows input verification. No full
auxiliary freeze, historical byte equivalence, real DLW read, survey processing,
deflation, B6 change, or shared release mutation. Other source-only checkout
refs checked: `pipfun` `7d534516a8c17c33d537681610eccd4c29211762`,
`pipload` `ff9a81e386a09fb2531c154f63fd2b91521313c6`, and
`pipster` `828064e406e07e711c34d2ba725746e367d35f9b` (no region references
found in the last two R trees by the scoped search).
