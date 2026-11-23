---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-pfw-predicate-proof
status: completed
updated: 2026-11-19T22:22:37Z
owner: PFW predicate proof
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: The experiment is complete. The unmodified producer remains blocked; any package change needs separate authorization and a region-code contract decision.
---

# Experimental PFW region-code predicate proof

## Summary

**PASS, experimental only.** Replacing just the PFW output validator's
`region_code` predicate in memory removed the blocker on the full 2,542-row
joined `20260401_TEST` fixture. The pinned country-list rule was extracted
directly from `pipaux/R/aux_country_list.R:209-212` and substituted for
`pipaux/R/aux_pfw.R:484-486`; it was not combined with the original list.
The cleaner did not change and `reg_pcn` was untouched. The unmodified producer
still fails as recorded in the [previous proof](../20261119T215954Z-pfw-local/handoff.md).

## Changes

`run.ps1`, `proof.R`, `proof.log`, `candidate.tsv`, and this handoff in the
new run folder; all R runtime files and the experimental store in fresh,
ignored `.tmp/m2pfwfix`. Existing staged inputs were read in place and rehashed
unchanged. No package edits, shared access, network, installs, Git mutations,
or PIP pipeline execution.

## Checks run

- Existing E: reparse checks passed on the exact new paths and existing local
  inputs. Hub main `1821c5526337d03b87a9e61ad934b3c7316c16cf`, pinned pipaux PROD,
  and empty pipaux scoped diff verified before and after. `pipsys` confirmed
  exact destination containment and package registration. Staged PFW Git blob
  matched `83bc9738cd45ad7e60bc14f5ca837b0075f052b1`; staged country-list pin
  `30d540ca6e32d842` matched its SHA256 and object checksum `9211182e995b116f`.
  Source pins are in `proof.R:29-49`. Qualified R 4.5.2 exited 0, with a
  `data.validator` 4.5.3 build-version warning (`proof.log:1-13`).
- **PASS:** raw validation, the full output validator with that one substitution,
  and output key checks ran before save. The one included non-alternative
  Colombia 2010 GEIH income mapping was confirmed before save and after the
  exact-version readback; national coverage and CPI/PPP/POP domain flags `1/1/1`
  (`proof.log:24-28`, `candidate.tsv:2`).
- **PASS:** retained QS2 and exact-version Stamp load had exact columns versus
  the unsaved candidate, restored row names and key, and matching recorded
  content and byte checksums; retained and main SHA256 matched, and a separate
  read-only shell rehash confirmed the retained SHA256. Stamp sidecar readback
  verified the full candidate code, adjusted predicate, source identity,
  `experimental_not_authoritative` marker and candidate code hash.

| Candidate record | Value |
|---|---|
| Version | `1ebf03aaca5d5721` |
| Retained payload | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/m2pfwfix/store/pfw.qs2/versions/1ebf03aaca5d5721/artifact` |
| SHA256 | `26081660861c65136572788e708d0f7d632366ade5df82005a09d12a4540a263` |
| Stamp content checksum | `fc3469e631532ca2` |
| Stamp byte checksum | `9e2cd4344a16a36d` |
| Stamp candidate code hash | `e3001714a0728edb` |

## Gaps

- The code substitution was hypothetical; it neither approves a region-code
  contract nor makes the local candidate authoritative. No GPWG module selection,
  `pipdata` consumer or B6 run, survey, or release acceptance was tested here.
