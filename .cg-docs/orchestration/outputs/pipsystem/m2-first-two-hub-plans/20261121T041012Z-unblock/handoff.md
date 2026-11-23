---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T041012Z-unblock
status: partial
updated: 2026-11-21T04:18:43Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: 'Installed auxiliary save proof r2; pipdata one-file follow-up not yet saved'
next: In this hub session, review an explicit private country-list registration change or use an eligible existing catalog; the separate pipdata Plan awaits its save gate.
---

# M2 prerequisite follow-up

## Summary

Staged and verified both offline TEST setup CSVs from immutable public
GitHub inputs. Auxiliary V1 remains blocked on the exact country-list
catalog in Plan r2. Presented the public one-file `pipdata` completion
contract; its save gate was dismissed without approval. No package Plan
or code was saved; no new Agent Manager session, checkout switch, pickup,
production run, or Git publication.

## Changes

This coordinator handoff and the [auxiliary staging record](../20261121T041012Z-inputs/handoff.md)
with two ignored files in `.tmp/m2-aux-save/20261121T041012Z-inputs/`:
`releases.csv` and `ppp_vintage.csv`. No package files changed.

## Checks run

Verified the hub, registered `pipaux` and `pipdata` checkouts, and absence of
handoff and proposed package Plan paths. Both prior V1 checks were blocked.
Local Brain selected the two reviewed hub Plans; retain the exact-version and
TEST isolation gates. Read the completed `pipdata` acquisition Plan
(`pipdata/.cg-docs/plans/2026-10-30-m2-one-survey-acquire-format.md:31-49,129`):
it intentionally left the exact selector internal. Use a follow-up rather
than reopening that completed Plan or changing the hub readiness Plan.

## Auxiliary prerequisites verified

- Independently matched both staged files' SHA-256 and Git blobs to the
  immutable pins in the [staging manifest](../20261121T041012Z-inputs/handoff.md#L57-L88):
  `releases.csv` at `12fceeb07c61d599129c25581bd5a9ee40c61638`;
  `ppp_vintage.csv` at `2513d67edc3dd66906d2601202bf2251f0e40897`.
  Git ignore, resolved E: locations and unchanged hub HEAD verified.
  The worker's CSV assertions checked one TEST release match and one 2021
  default vintage; no initialized runtime was tested.
- The [scoped catalog search](../20261121T041012Z-inputs/handoff.md#L90-L119)
  found no eligible binding for retained `30d540ca6e32d842`. The detached
  payload matched its recorded SHA-256. Recommend changing only Step 1/V1
  to register that verified object through the normal writer in the private
  TEST store, keep the writer-assigned ID as the local pin and the retained
  ID as source provenance, and verify default and exact readback. This is
  a [proposal](../20261121T041012Z-inputs/handoff.md#L121-L138), not an
  executed deviation. An eligible provenance-backed catalog for the
  original version would let the existing Plan proceed without that change.

## One-file implementation evidence

- At `pipdata` `c70ae403acde648aff1a49d8d3178ca0202c6064`, the intended
  source and test paths were clean versus HEAD. Keep the unrelated B6,
  vignette, and lifecycle changes untouched. Target a public stage function,
  not a second release orchestrator. Reuse the exact selector and existing
  GPWG/report/clean path; do not change normal batch defaults
  (`R/pipdata_dlw_compare.R:1167-1264`, `R/pipdata_get_gmd.R:1409-1489`,
  `R/pipdata_validate_gmd.R:569-693`, `R/inv_dlw_load.R:7-24`).
- The retained `dlw` source archive pin is
  `12faa058b521ef511073a7b21b1b1dd7993c9649` (private archive inventory
  `.tmp/one-survey/resume-20261110-full/pins.tsv:6`). At that pin, fresh
  download records `last_raw_data` before parsing; exported environment
  accessors are a candidate for obtaining verified original bytes without
  a new dependency (`R/dlw_get_data.R:48-63,90-116,139-151`,
  `R/dlwenv.R:20-60`, `NAMESPACE:5-20`). Candidate only: no installed proof,
  no assumed digest algorithm, and no acceptance of stale cached bytes.
- `pipload` `ff9a81e386a09fb2531c154f63fd2b91521313c6` exact reader was
  unchanged versus HEAD and accepts `id_name` plus `version`
  (`R/load_dlw_data.R:54-67,115-132`). `pipdata` already has a receipt helper
  that compares attempted and recorded content hashes (`R/save_pip.R:91-128`).

## Gaps

- The r2 country-list catalog, offline initializer binding, runtime
  compatibility and E: child containment remain unverified. No R, build,
  install, PFW/POP save, or retry was run.
- The new package Plan is unsaved; no implementation, offline package
  tests, live DLW, household data processing or deflation ran. Resume Plan
  preparation only when its completion contract is approved, and keep the
  auxiliary and survey acceptance gates separate. No automatic follow-up.
