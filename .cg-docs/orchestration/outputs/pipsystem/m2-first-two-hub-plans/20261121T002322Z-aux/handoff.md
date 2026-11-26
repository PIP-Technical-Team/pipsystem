---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T002322Z-aux
status: blocked
updated: 2026-11-21T00:30:13Z
owner: Run installed auxiliary checks
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 2
next: Parent records the blocked run; resume V1 only once qualified offline inputs and the pinned country-list catalog are staged.
---

# M2 installed auxiliary save proof

## Summary

V1 blocked before build, install, or R startup. The normal TEST initializer
requires `releases.csv` and `ppp_vintage.csv`; no pinned local copies or supported
offline alternative were found in the scoped evidence. The three staged measure
inputs and the country-list bytes matched their pins. No PFW or population
version or receipt was produced for the survey Plan.

The run used revision 2 and `deviate:auto`; no deviations, corrective attempts,
or accepted exceptions. Parent owns the Plan, execution report, active state,
roadmap and acceptance notebook. No implementation diff needs review.

## Changes

This handoff only (running, checkpoint, blocked). The authorized scratch run
root remains absent. No package or lifecycle edits, Git mutation, deletions,
network calls, shared/test release access, or credential access. The Qmd is
absent and was not restored; the Plan's historical link is the
[notebook checkpoint](../../m2-checkpoints/20261119T232046Z-sync-publish/handoff.md#L31-L56).

## Checks run

| Plan check | Result |
|---|---|
| V1 | **BLOCKED:** offline TEST prerequisite not met. Source/path and byte subchecks below ran; no runtime qualification. |
| V2 | **NOT RUN:** installed PFW save, new version receipt, retained byte checksum, exact readback and COL 2010 GEIH income mapping. |
| V3 | **NOT RUN:** V2 did not pass. Installed population save, new version receipt, retained byte checksum, exact readback and finite positive COL/2010/national key. |

- **Offline setup:** `pipfun` PROD `7d534516a8c17c33d537681610eccd4c29211762`
  matches the inspected files. `R/working_release.R:79-119` resolves even an
  explicit TEST release through `get_pip_releases()`; `R/release_management.R:415-431`
  calls GitHub for `releases.csv` rather than using pre-existing `.pipenv`
  state. `R/pip_create_globals.R:165-190,460-464` and `R/pip_create_vintage.R:103-110`
  require the `aux_ppp` `DEV` `ppp_vintage.csv` for this initializer's naming
  path even with `create_dir = FALSE`. The public `set_pip_folders()` returns
  paths, not initialized working-release state (`R/working_release.R:258-283`);
  `setup_working_release()` registers and stores that state at `:128-158`.
  `pipaux` takes the release/folder/alias state at load (`R/zzz.R:29-58`). No
  supported offline alternative was identified at these pins. Targeted filename
  searches in the hub and ignored `.tmp`, `git ls-files` for the two CSVs, and
  searches of staged evidence found neither required byte pin. The earlier
  [sandbox](../../qmd-working-release/20261116T215847Z-code/handoff.md#L107-L119)
  names both routes but explicitly does not claim retained immutable metadata.
  Generated `ppp_vintage.qs2` is not the source CSV. **No package call was
  attempted**, so there is no observed runtime condition to report.
- **Country list:** the local isolated pilot input matched the recorded SHA-256
  for `30d540ca6e32d842`; the earlier object hash was `9211182e995b116f`.
  The [CPI pilot](../../cpi-rebuild-pilot/20261119T202215Z-release-inputs/handoff.md#L51-L59)
  staged two payloads only, not a catalog for this retained version. Its
  recorded current catalog pointer was a different version without its retained
  payload. No eligible local catalog for the exact country pin was identified
  in the staged evidence. PFW and POP use the unchanged default
  `load_aux_data()` (`pipaux/R/aux_pfw.R:151-167`, `R/aux_pop.R:156-161`);
  exact resolution in the new TEST aux alias and its bytes are **NOT RUN**.
- **Runtime candidates:** read-only Git confirmed `pipaux` PROD
  `43019562c0fad92038124fd6603257c8e0660997` and archive commit
  `5f5e8531592ca7668b33bbd23564ef90f1c8c688`; commit-to-commit diff names only
  `compound-gpid.local.md`. The staged Stamp archive matched the Plan SHA-256
  below. Historical `.tmp/one-survey/qmd-acceptance-20261113/` `sources/*.tar`
  commit headers agree with `pins.tsv:3-4,7`: pipfun at the SHA above,
  pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5` (locally available and
  declared in `pipaux/DESCRIPTION:68`), and **older** pipaux
  `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` (excluded for this run).
  Registered pipload PROD HEAD was `ff9a81e386a09fb2531c154f63fd2b91521313c6`,
  not the historical archive. The archive candidate exports `load_aux_data`,
  `pip_read`, and `pip_write` (`NAMESPACE:17,45,47`); no runtime compatibility
  is claimed. The historical runtime inventory used R 4.5.2 and Stamp 0.1.0,
  not the Plan's Stamp candidate. No new pipaux archive was built; dependency
  closure, installed origins and clean namespace load are **NOT RUN**.
- **Containment and focused checks:** before/after hub `main` HEAD matched the
  header; pipaux stayed on the expected `PROD` HEAD with only its pre-existing
  untracked `.tmp/`. Worker scoped status added only this handoff beside the
  parent-owned Plan. Parent's execution report records canonical Plan validation
  PASS. Handoff and scratch path ancestry checked on E:; the reserved scratch
  path is ignored (`.gitignore:36`). Full pre-child runtime path checks
  (`PIP_ROOT_DIR`, `main_dir`, legacy output, startup, temp, home, cache,
  library and logs), the source-fetch binding, any CPI/PPP setup staging, empty
  target-ID checks and functional assertions are **NOT RUN**. The indexed
  `test-pfw.R`, `test-pop.R`, `test-country_list.R` and
  `test-m2-stamp-cpi-ppp-pfw.R` were not run; they are not substitutes for
  the installed acceptance checks.

### Preflight byte manifest

`Get-FileHash -Algorithm SHA256` matched the recorded stage receipts; the three
measure inputs also matched `git hash-object --no-filters` independently.
Paths below are hub-relative; no data rows were opened or reported.

| Staged file | Verified SHA-256 | Git blob if applicable |
|---|---|---|
| `.tmp/m2pfw/pfw.dta` | `5d80c203fb709e9568f4f4b9db1973254b7021fbe36c06d2f47c5f7bebcb0f45` | `83bc9738cd45ad7e60bc14f5ca837b0075f052b1` |
| `.tmp/m2pop/inputs/pop.xlsx` | `4d5febb535435d55de1eae4ad011f5b3d8282b0508dec9d06884e97b65277708` | `3326203c0ce359852633cf9da6bd49d24676723b` |
| `.tmp/m2pop/inputs/spop.csv` | `21e9dcee0bc5c75347fe9569066d9815f25f0d6d151cec509aea0706776d0098` | `da1c247e66623145a8ebcee6a8046630c1e00b48` |
| `.tmp/cp26/inputs/country_list.qs2` | `1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f` | n/a |
| `.tmp/sq1/stamp_0.1.1.tar.gz` | `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586` | n/a |

## Gaps

- To resume, the hub needs approved local immutable copies of both required
  metadata files with provenance and hashes (or a supported offline TEST
  initializer), plus the eligible country-list catalog for the known retained
  bytes. Do not query a release store, fake metadata, or edit private runtime
  state in this scope.
- Current pinned dependency compatibility, resolved runtime write roots,
  exact alias/catalog binding, and all installed save/readback evidence remain
  unverified. No automatic retry is scheduled.
