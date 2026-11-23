---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-pop-qualified-proof
status: completed
updated: 2026-11-19T22:25:40Z
owner: Validate local population snapshot
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: No further experiment in this scope. Coordinator has the experimental candidate identity and checksums.
---

# M2 namespace-qualified population proof

## Summary

**PASS, experimental only.** The three full validators passed unique and
duplicate controls with `assertr::is_uniq(...)` and no `all()` wrapper. One
offline `aux_pop_update` run then produced 43,737 rows for `20260401_TEST`.
Exact retained readback has one finite, positive national `COL / 2010` key
and the intended reporting levels: `national`, `rural`, and `urban`.

## Changes

- This run contains `handoff.md`, `proof.R`, `run.ps1`, `proof.log`, and the
  small `candidate.tsv` receipt. The store and other runtime writes are under
  ignored `.tmp/m2popq`; no input/output payload rows appear here.
- `proof.R:4-21` verifies and reuses the prior harness in memory and qualifies
  only the three `is_uniq` calls from pinned `pipaux` `R/aux_pop.R:312,412,453`.
  The amended expressions are bound into the candidate code fingerprint
  `742e242e22b2688a`, recorded with upstream HEAD and the experimental flag
  in write metadata. WDI and all other transformation, join, and validation
  rules stayed as pinned; only approved local I/O adapters were used.
- No package edits, Git mutation, network, installation, shared access,
  PIP-package startup, or pipeline execution. The original unmodified proof
  and the failed unqualified `all()` experiment remain separate and unchanged.

## Checks run

- **PASS, paths and input pins.** Exact E: paths passed `pipsys.R check-path`
  and `paths.ps1` reparse/hard-link checks. `pipaux` PROD stayed at the HEAD
  above with empty scoped diff; hub `main` stayed at
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`. The three existing staged input
  SHA-256 values matched before and after; country-list retained pin
  `30d540ca6e32d842` also matched the recorded object hash (`proof.log:2-6`).
  SHA-256 comparison confirmed the prior failed experiment files were unchanged.
- **PASS, one functional proof.** Each full validator accepted distinct
  composite keys and rejected an actual duplicate before the sole producer
  run. All three validators passed on the staged inputs and output
  (`proof.log:7-10,22-23`). R 4.5.2 used the existing CPI-pilot E: libraries;
  actual `Sys.Date()` was `2026-11-19`, applying the unchanged `2026` ceiling
  (`proof.log:4-5`). The two build-version warnings did not interrupt the
  run (`proof.log:28-32`).
- **PASS, exact readback.** Exact-version Stamp load and direct retained QS2
  read matched the recorded content hash; retained bytes matched the
  recorded byte checksum and separate PowerShell SHA-256. The reloaded
  key was unique and had exactly one finite positive national `COL / 2010`
  row; those Colombia rows had exactly `national`, `rural`, and `urban`
  reporting levels (`proof.log:26-33`, `candidate.tsv:2`).

| Candidate receipt field | Value |
| --- | --- |
| Local version | `5b6239b8a683e66b` |
| Retained path | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/m2popq/store/pop.qs2/versions/5b6239b8a683e66b/artifact` |
| Retained SHA-256 | `df27d9e660fcd92daa219e104f07286d0688e12e7674701e1736668e3956c83c` |
| Recorded byte checksum | `b4157c9317be2e4e` |
| Recorded object checksum | `cb4509fb588f1f23` |
| Amended code fingerprint | `742e242e22b2688a` |

## Gaps

- This is a locally generated experimental candidate from amended source, not
  a standard `pipaux` artifact or evidence of installed-package, official
  release, or survey acceptance. No wider validation or additional experiment
  was run. The failed unqualified `all()` experiment remains in
  `../20261119T215954Z-pop-predicate-proof/handoff.md`.
