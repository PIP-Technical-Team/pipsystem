---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-ppp-local
status: completed
updated: 2026-11-19T22:13:16Z
owner: PPP local producer worker
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: Coordinator has local PPP evidence for the M2 input boundary; no vintage selected.
---

# Isolated TEST PPP producer

## Summary

Local PPP producer proof passed for `20260401_TEST`, targeting the national PPP
input needed by Colombia 2010 GEIH income GPWG. One producer invocation saved
the PPP table and its vintage inventory. Read-only verification confirmed both
exact versions. Both 2021 candidate tags remain: `2021_v1_v1`, `2021_v1_v2`.

## Changes

This handoff, `run.ps1`, `rebuild.R`, `verify.R`, two logs and `candidate.tsv`
are in this run folder. The raw payload, local Stamp store and process
temp/home/cache are only in ignored `.tmp/m2ppp`. No package edits or Git
mutations; both requested HEADs were rechecked and `pipaux` stayed clean.

## Checks run

- Verified the `pipaux` registry entry (`tools/pipsys/packages.csv:4`), existing
  `PROD` checkout, exact HEAD and empty scoped diff for `R/aux_ppp.R` and
  `R/validation_report.R`. Verified hub `main` at
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`; left existing edits untouched.
- Checked literal run and scratch paths with `experiments/one-survey/paths.ps1`;
  verified both were fresh and scratch was Git-ignored. Created only scratch
  temp/home/cache directories to run the qualified R 4.5.2 `pipsys.R check-path`.
  It accepted the exact handoff and scratch destinations before report/data writes.
- Staged only the immutable raw `PIP-Technical-Team/aux_ppp` `ppp.csv` at TEST
  commit `ab55d3ff0d6efddf8b06f1ee8886fc6c08c63c19`, anonymously via HTTPS.
  The 113504 bytes matched Git blob `5f0de04df833c01c85fe91069d243740202188bd`;
  SHA-256 `7f6debdafb0dbcd687abd5061af3c413cc19fce1f29ad28807aa53c853dba4ea`.
- The existing `.tmp/cp26/inputs/country_list.qs2` (`30d540ca6e32d842`, CPI
  pilot `inputs.tsv:3`) matched SHA-256
  `1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f`.
- R 4.5.2 `--vanilla` used the CPI pilot's explicit libraries and fingerprinted
  Stamp archive (`rebuild.log:1-7`). `rebuild.R` verified both `pipaux` source
  file SHA-256s and the existing country-list object hash `9211182e995b116f`.
  It extracted the pinned transformation and validators without starting PIP
  packages. Only acquisition and save boundaries were adapted (`pipaux`
  `R/aux_ppp.R:194-218,247-281,287-315`). Both upstream validators passed.
- The initial readback harness exited 1 on its whole-R-object comparison with
  the pre-save adapter object. The exact error remains in `rebuild.log:10-13`.
  Stamp adds `stamp_pk` at save time, and the retained readback includes that
  attribute (Stamp source inspected at `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`,
  `R/IO_core.R:325-332`, `R/schema_pk.R:291-295`; `verify.log:2-11`).
- The read-only check exited 0. For each explicit version, the direct QS2
  decode and `st_load_version()` agreed on column names, types, values and row
  order, and the restored key matched the sidecar. Both object hashes matched
  the recorded content hash (`candidate.tsv:2-3`); retained bytes matched the
  recorded SipHash checksum and the local current copy's SHA-256. Both sidecars
  carried the verified raw blob, commit, SHA-256 and country-list pin.
- An independent base-R CSV parse found one national `COL` source row and two
  2021 cells. Both retained key/value pairs matched exactly, including bitwise
  numeric equality; both were finite and positive. The 2021 tags matched the
  full set of matching source columns in the retained inventory (`verify.log:12-13`).

| Artifact | Local version | Rows | Recorded byte checksum | Recorded object hash |
|---|---|---:|---|---|
| `ppp.qs2` | `404c83141bb0ab87` | 1953 | `d822a0e4e703a9a8` | `aa34b27b5f7c6720` |
| `ppp_vintage.qs2` | `72ea2037d77f5728` | 9 | `9a02a8729fd074e9` | `9ab992cf5c00697d` |

`candidate.tsv:2-3` records the exact E: retained payload paths and SHA-256s.

## Gaps

- Cell-level source comparison was limited to national Colombia's two 2021
  PPP entries. This is not a GEIH survey or `pipdata` execution result.
- No vintage was selected. No shared-store access or mutation, release startup,
  promotion, release acceptance, or PIP pipeline execution was attempted.
