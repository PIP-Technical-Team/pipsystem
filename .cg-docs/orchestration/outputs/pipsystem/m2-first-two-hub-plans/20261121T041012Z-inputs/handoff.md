---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T041012Z-inputs
status: blocked
updated: 2026-11-21T04:16:26Z
owner: Stage offline auxiliary prerequisites
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 2
next: Parent records the two staged CSVs and keeps V1 blocked pending an eligible local catalog or a separately approved Plan change for a new local country-list pin.
---

# M2 offline auxiliary prerequisites

## Summary

Both required release metadata CSVs were staged from anonymous public GitHub
commits. The byte and `20260401_TEST` / PPP 2021 metadata checks passed.
Plan r2 V1 is still **BLOCKED**: no eligible already-local Stamp catalog was
found to bind country-list `30d540ca6e32d842` to the verified payload in the
actual TEST aux alias. V2 and V3 are **NOT RUN**. No installed receipts exist.

## Changes

- This handoff (running, then final) and exactly two files in the fresh ignored
  `.tmp/m2-aux-save/20261121T041012Z-inputs/`: `releases.csv` and
  `ppp_vintage.csv`.
- No package session or pickup, R, build, install, Stamp save, catalog change,
  fixture substitution, lifecycle or Plan edit, Git mutation, credential
  access, or access to shared storage or production systems.

## Checks run

### Source pins and containment

Read-only Git verified the hub's registered root, `main` and full HEAD shown
above before and after staging. Both new run paths were initially absent. The
paths and all existing ancestors were checked through fixed drive `E:` without
reparse points; both staged files are ignored (`.gitignore:36`). Curl disabled
its config file and sent no Authorization or Cookie headers, with no transfer
files or disk cache: initial response bodies were discarded and immutable JSON
was processed in memory. Process-local `TEMP`, `TMP`, `TMPDIR` and XDG
cache/state/data were pointed at the verified E: scratch during staging and
checkback. The handoff was patched directly on E:. Scoped Git status showed
only this new handoff directory and the pre-existing untracked Plan.

| Package | Verified identity and scope |
|---|---|
| pipfun | Local `PROD` HEAD `7d534516a8c17c33d537681610eccd4c29211762`; matches the historical archive commit header. Source inspected at that commit. |
| pipaux | Local `PROD` HEAD `43019562c0fad92038124fd6603257c8e0660997`; review commit `5f5e8531592ca7668b33bbd23564ef90f1c8c688` verified. Commit diff is only `compound-gpid.local.md`; call sites inspected at review pin. |
| pipload | Local `PROD` HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`; candidate `4ef0d90a974cb6ff0725da69373bde421dd04ad5` verified in Git and the historical archive header, and declared in pipaux review `DESCRIPTION:68`. Neither was loaded. |
| Stamp | Registered `ready_cran` HEAD `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`; qualified `.tmp/sq1/stamp_0.1.1.tar.gz` independently matched `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586`. Archive source checked via stdout without extraction. It is a development archive, not vanilla HEAD; qualification [handoff](../../stamp-path-binding-fix/20261119T151908Z-tool-qualification/handoff.md#L20-L29) binds the base and manifest. |

### Release metadata: staged and verified

These are the normal calls, not the older `DEV_v2` helper: pipfun
`R/zzz.R:6`, `R/working_release.R:54-66,79-119`,
`R/release_management.R:415-431`, `R/get_from_gh.R:264-279`,
`R/pip_create_globals.R:184-190,460-464`, `R/pip_create_vintage.R:16-22,103-120`,
and `R/load_from_gh.R:18-24,55-59`; the
[sandbox handoff](../../qmd-working-release/20261116T215847Z-code/handoff.md#L109-L119)
confirms both routes but retained no immutable snapshots.

| Normal GitHub locator (owner `PIP-Technical-Team`) | Anonymous GET status |
|---|---|
| `pip_info`, `releases`, `releases.csv` | Repository API: 200, `private=false`; [`contents?ref=releases`](https://api.github.com/repos/PIP-Technical-Team/pip_info/contents/releases.csv?ref=releases): 200; [raw branch route](https://raw.githubusercontent.com/PIP-Technical-Team/pip_info/releases/releases.csv): 200. |
| `aux_ppp`, `DEV`, `ppp_vintage.csv` | Repository API: 200, `private=false`; [`contents?ref=DEV`](https://api.github.com/repos/PIP-Technical-Team/aux_ppp/contents/ppp_vintage.csv?ref=DEV): 200; [raw branch route](https://raw.githubusercontent.com/PIP-Technical-Team/aux_ppp/DEV/ppp_vintage.csv): 200. |

Staging resolved each branch through GitHub's `git/ref/heads` API, verified the
commit-qualified `contents` path-to-blob mapping, and used the `git/blobs` API
for the actual bytes. Both immutable responses agreed. The Git blob SHA-1 was
computed from the `blob <size>` header, NUL separator and exact bytes. Local
readback with `git hash-object --no-filters` and independent `Get-FileHash
-Algorithm SHA256` matched the in-memory checks; no newline conversion.

| Staged filename | Immutable commit | Git blob | Bytes | Independent SHA-256 |
|---|---|---|---:|---|
| `releases.csv` | [`12fceeb07c61d599129c25581bd5a9ee40c61638`](https://api.github.com/repos/PIP-Technical-Team/pip_info/contents/releases.csv?ref=12fceeb07c61d599129c25581bd5a9ee40c61638) | `a724d7188e81c6e6ff8fc5c9cdb995ad77e4f008` | 409 | `771005ce7c158e18bef45f72b3fd228ce8b5b42aeb9aceb71d2bb3766c8f3b6d` |
| `ppp_vintage.csv` | [`2513d67edc3dd66906d2601202bf2251f0e40897`](https://api.github.com/repos/PIP-Technical-Team/aux_ppp/contents/ppp_vintage.csv?ref=2513d67edc3dd66906d2601202bf2251f0e40897) | `3bfa667b0d0558c0ee8d7f44ef3a95e78a03eeb5` | 121 | `56f2ea3fc4272ce43fb3a614ac3d694051c7d67f39fc68b9a4301d70877b49b8` |

PowerShell CSV checks validated the required headers, exactly one
`20260401`/`TEST` match, and a unique default PPP 2021 tuple using the source's
version normalization and release-then-adaptation maxima (pipfun
`R/release_management.R:499-517`; `R/pip_create_vintage.R:112-120,194-215,274-279`).
No rows emitted; this is a metadata check, not execution of the initializer.

### Country list: verified payload, no eligible local catalog

- `.tmp/cp26/inputs/country_list.qs2` is 6,847 bytes and independently matches
  SHA-256 `1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f`.
  The [CPI pilot](../../cpi-rebuild-pilot/20261119T202215Z-release-inputs/inputs.tsv#L3)
  binds this detached copy to `30d540ca6e32d842` and records object hash
  `9211182e995b116f` (not recomputed here). The pilot built CPI only in
  `.tmp/cp26/store`; its catalog is not the source country-list catalog
  ([handoff](../../cpi-rebuild-pilot/20261119T202215Z-release-inputs/handoff.md#L27-L59)).
- Read-only inventory of the hub and pipaux `.tmp` roots, excluding reparse
  paths and `.git`, `library`, and `sources` trees, found zero paths bearing the
  required retained ID, 218 `catalog.qs2` files (all in the hub), and no
  `catalog.rds`. None of the 218 matched the pilot's sampled catalog SHA-256
  `102fc6763dd50a13e8ce935455f4638d247cf247e75f37940f05e6304191d07f`.
  The eight other `country_list.qs2` files had different hashes. No verified
  detached catalog export was identified. The historical catalog sample would
  not itself prove the default read: its pointer `b5ff7ff6f5d8e9d6` differed
  from the retained payload ([pilot log lines 2-5](../../cpi-rebuild-pilot/20261119T202215Z-release-inputs/stage-20261119-152627-266.log#L2-L5)).
- The qualified Stamp archive uses `<alias-root>/.stamp/catalog.qs2` and an
  artifact-specific `versions/<version_id>` directory (`R/version_store.R:78-111`).
  PFW and population call `pipload::load_aux_data()` without a version
  (pipaux `R/aux_pfw.R:151-167`, `R/aux_pop.R:156-161`); pipload candidate
  `R/load_aux_data.R:15-20,29-81` finds the active aux alias and
  `R/pip_read-write.R:119-134` requires version records before delegating.
  Stamp's default loads the current file, not the retained snapshot
  (`R/IO_core.R:650-675,714-715`, qualified archive). Bare bytes or a log are
  not a catalog-backed exact-version binding.
- Rehashed the existing raw PFW and population inputs without copying them:
  `pfw.dta`, `pop.xlsx` and `spop.csv` matched both recorded SHA-256s and Git
  blob pins in the [blocked handoff](../20261121T002322Z-aux/handoff.md#L100-L112).

### Separate Plan change proposal (not implemented)

If no intact, provenance-backed local catalog becomes available, amend only the
country-list requirement in Step 1 / V1 (Plan r2 lines 74-79, 137). Permit one
normal local `pipload::pip_write()` / `stamp::st_save()` of the already-staged,
hash-verified country-list object under `country_list.qs2` in the actual private
TEST aux alias. Record `30d540ca6e32d842` only as source provenance, not the new
store's pin; keep the writer-assigned local ID. The pipload candidate forwards
the alias to `st_save()` (`R/pip_read-write.R:189-219`); the qualified Stamp
archive allocates a version, commits the snapshot, records it, and returns the
ID (`R/IO_core.R:508-545`). As one check, require the new catalog/current file
to bind to that receipt, compare the retained bytes to the new stored checksum,
and verify the unchanged default read and exact-version read have the expected
object hash. Reserialized bytes may have a different SHA-256 from the original.
Keep subsequent PFW and population checks in that same store, unchanged and
serial. No package changes, new dependencies, fixture, catalog edits, pin
override, or shared access. This proposal requires a separately approved Plan
change; revision 2 has not been altered.

## Gaps

- V1 is blocked on the r2 country-list catalog binding. The search did not
  inspect protected storage, skipped paths, or deserialize binary catalogs;
  there is no eligible local catalog evidenced in the inspected scope.
- Installed dependency compatibility, clean startup and resolved child write
  roots, the approved fetch-only binding (no live fallback), any additional
  setup data, empty target IDs, and the actual TEST alias/default reader have
  not been qualified. No R call was attempted; no runtime error is claimed.
- V2 PFW and V3 population save/checksum/exact-readback are **NOT RUN**. There
  are no same-store auxiliary receipts for the survey Plan. Parent owns any
  lifecycle record or future rerun after the remaining gates are met.
