---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-data-quality
status: completed
updated: 2026-11-21T16:06:02Z
owner: Data quality review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 4
next: Coordinator can incorporate this data-quality result when consolidating the full review.
---

# M2 auxiliary proof data-quality review

## Summary
No P0–P3 data-quality findings; fix and disposition: `none`. The retained
execution evidence supports the three checks in Plan r4:148–152. All ran in
the `aux` alias of the private `store-test/aux_repository/aux_data/20260401_TEST`.

## Changes
This handoff only; no commits.

## Checks run
Confirmed the hub root, `main`, and full HEAD before both writes. The exact
report path was fresh at creation and resolved on E: without reparse points
before finalization. Loaded all five R skills before reviewing R. Evidence
references below are relative to `.tmp/m2-aux-save/20261121T153507Z-diagnosis/`
unless otherwise stated.

- **V1** — `aux-proof.R:124–165,168–220` verifies the actual TEST alias, a new
  `country_list.qs2` receipt `0ff89ac514d47926` at that artifact path, and the
  same ID in the alias catalog (current) and version index (retained). It checks
  the current file and exact `versions/<id>/artifact` bytes against stored
  SipHash-13 `ea2584dcc9d60f5a`. Default and exact reads both match pinned
  object hash `9211182e995b116f`. `30d540ca6e32d842` is source provenance only.
  See `input.tsv:7`, `log/aux-proof-test.pre.json:58–75`, and
  `log/aux-proof-test.out:6–15`.
- **V2** — `aux-proof.R:168–208,222–232` requires a new PFW receipt
  `a2d11c48b1e34926`, the same path and checksum binding, and the real exact
  read before asserting one included, non-alternative national COL/2010/GEIH
  income row with the three national domain codes. The log records
  `9e2cd4344a16a36d` (file) and `fc3469e631532ca2` (object), then `V2 PASS`
  (`log/aux-proof-test.out:15–22`).
- **V3** — `aux-proof.R:168–208,234–241` runs only after the V2 assertion passes.
  It requires the new population receipt `0a23a91ddd57c602`, the same binding,
  and the exact read with one finite, positive COL/2010/national key. The log
  records `b4157c9317be2e4e` (file) and `cb4509fb588f1f23` (object), then
  `V3 PASS` (`log/aux-proof-test.out:22–31`). The process receipt records exit 0
  and zero owned processes remaining (`log/aux-proof-test.result.json:3–9`).

For all three, compared the logged metadata to the current and exact sidecars
in the named TEST alias (each JSON:2,6,8); the artifact paths and both hashes
agree with the worker handoff `../20261121T153507Z-stamp/handoff.md:98–110`.
The archived reader source forwards the exact ID and alias to Stamp
(`sources/pipload/R/load_aux_data.R:64–82`, `R/pip_read-write.R:119–134`;
pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5`). The archived producers use
the normal country-list read and return the save result
(`sources/pipaux/R/aux_pfw.R:151–167,225–236`, `R/aux_pop.R:156–161,194–204`;
pipaux `5f5e8531592ca7668b33bbd23564ef90f1c8c688`; archive pins in
`sources-verified.tsv:2–4`).

## Gaps
Read-only evidence review: no R launch, catalog decode, payload inspection,
or independent rehash of artifact bytes. Each artifact has one TEST version;
this run does not test selecting a non-current version in a multi-version store.
