---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T153507Z-stamp
status: partial
updated: 2026-11-21T16:00:15Z
owner: Diagnose and unblock Stamp install
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 4
next: Coordinator dispatches the pending full review of the retained scratch harness, then records V1-V3 and the review in parent-owned lifecycle evidence.
---

# M2 auxiliary runtime diagnosis

## Summary

The R stall is resolved. Restoring `PROCESSOR_ARCHITECTURE=AMD64` in the
isolated Windows child environment made the `rlang` exit control pass. The
normal staged install and a fresh installed-load identity check passed for
the exact pinned Stamp archive. V1, V2 and V3 passed in order in one private
`20260401_TEST` store. The proof child exited 0; no owned child remained.
Execution is complete; independent full review remains pending.

## Changes

Only this handoff and fresh ignored `.tmp/m2-aux-save/20261121T153507Z-diagnosis/`.
The latter holds the diagnostics, scripts, verified archives, installed library,
inputs, receipts and private store. No package repo or Git mutations, no Plan,
Qmd, work report or active-state edits, no release pipeline, security-setting
changes, downloads, shared/credential access, package sessions or pickup.

## Checks run

Log and manifest paths below are relative to the new ignored run root.

- Canonical r4 Plan validation passed. Hub `main`
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`, Stamp `ready_cran`
  `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`, and pipaux `PROD`
  `43019562c0fad92038124fd6603257c8e0660997` were verified before children;
  hub and Stamp HEADs and pipaux scoped status were rechecked at the end.
  The pipaux review commit `5f5e8531592ca7668b33bbd23564ef90f1c8c688`
  matched PROD for `R/`, tests, `DESCRIPTION` and `NAMESPACE` and supplied
  the actual install archive. pipfun source was
  `7d534516a8c17c33d537681610eccd4c29211762` (also checkout HEAD);
  pipload source `4ef0d90a974cb6ff0725da69373bde421dd04ad5` was archived,
  not its checkout HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`.
- Fresh local fixed NTFS E: destinations, no reparse-point ancestry, ignored
  run root. Per-child `log/*.pre.json` records the resolved write targets,
  environment and exact core R binaries. The proof used standard-only E:
  R 4.5.2 and its private `ok` library, with no user/site or ambient library
  fallback. Original C: R binaries served as read-only controls. The full
  Stamp/PIP shutdown/proof path used E: R. `*.result.json` records owned
  process-tree cleanup after bounded waits.

### R stall controls

| Control | Executed result |
|---|---|
| Plain R and Rscript, stock R 4.5.2, E: write roots | Both reached `.Last` and exited 0 (`log/system-*-base.*`). |
| Historical E: runtime | Core executables and `R.dll` hash-matched stock. Both frontends exited 1 before the probe; `library/base/R/Rprofile:219-230` contains a hook that tries `/logs/child-startup.log` without its historical environment. The open failed; the historical runtime was not used for proof (`log/local-*-base.err`). |
| Fresh standard-only E: runtime | 2,278 component files plus the two frontends were copied and byte-compared. Base exited 0; matched `rlang` import still timed out under the stripped environment (`log/mirror-*.result.json`). An earlier broader mirror timed out during copy and was not used. |
| Individual imports and shutdown | Six imports exited 0; `cli`, `rlang` and all eight together reached `.Last` but stalled. Direct Rterm, explicit `quit(runLast = FALSE)`, namespace unload and a dedicated console did not clear the stall. Direct timeout tree showed owned Rterm and `conhost.exe`; no unrelated processes were stopped (`log/import-*.out`, `log/exit-*.result.json`, `log/console-*.result.json`). |
| Tiny normal source-package install vs exact Stamp | Tiny install exited 0 (1.53s). Stamp normal install stalled after `byte-compile and prepare package for lazy loading` at 75s; `--no-byte-compile` independently stalled at `preparing package for lazy loading` at 35s (`log/small-normal*`, `log/stamp-normal*`, `log/stamp-no-byte-compile*`). |
| Environment discrimination | On E: `rlang` exited 0 with `PROCESSOR_ARCHITECTURE=AMD64` alone; `OS`, `PATHEXT` and `NUMBER_OF_PROCESSORS` separately did not fix it. All eight exited 0 with the safe scalar set (`log/scalar-*.result.json`, `log/recovery-imports.*`). |
| Exact normal Stamp install and loaded identity | In fresh `ok`, the ordinary staged install, including both installer load checks, finished at 5.72s, exit 0. The separate installed-load process rehashed archive plus four installed files, checked private namespace path/version, called `st_hash_obj()`, and exited 0. See `log/recovery-stamp-normal.err:1-15`, `log/recovery-stamp-loaded.*`, `installed-stamp.sha256:1-5`. The install's missing help CSS warning was nonfatal; the stock CSS was staged before later installs. |

The exact Stamp source archive SHA-256 was
`96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586`.
It is the qualified development archive, not reconstructed from the registered
checkout. No byte-compile or test-load option was disabled for the successful
normal install. Fresh installed build bytes are recorded as generated, not
assumed identical to the historical installation.

### Installed proof

`sources-verified.tsv:2-4` records the three freshly generated Git archives
and their hashes. All three normal installs exited 0. `input.tsv:2-7`
records the six independently rechecked SHA-256s and five Git blob hashes.
`dependencies.tsv` and `dependency-copies-all.tsv` record 114 dependency
entries and 6,479 verified file copies; `origins-before-save.tsv` and
`origins-after-pop.tsv` record actual loaded origins and versions. The
pre-save package search check included pipload; its namespace loaded on use.

Normal `pipfun::setup_working_release()` set the TEST release and registered
alias `aux`. Only pipfun source-fetch functions `get_file_info_from_gh()` and
`download_from_gh()` were bound process-locally to five pinned locators;
unknown requests fail. No parser, producer, validator, alias, writer, receipt
or reader was substituted. No CPI or PPP artifact was regenerated. The
first three proof attempts stopped before any artifact write on harness
origin checks (base namespace API, standard-package allowlist, and normalized
package-version strings); each setup and log is retained separately. The
successful attempt used a fresh store. `log/aux-proof-test.out:6-31` and
`log/aux-proof-test.result.json:1-10` are the proof evidence.

Store: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/m2-aux-save/20261121T153507Z-diagnosis/store-test`.
Alias `aux` resolves to `aux_repository/aux_data/20260401_TEST` in that store.

| Check | Artifact | Exact TEST version | File checksum | Object hash | Assertion |
|---|---|---|---|---|---|
| V1 PASS | `country_list.qs2` | `0ff89ac514d47926` | `ea2584dcc9d60f5a` | `9211182e995b116f` | Detached source object hash matched; one real writer receipt became catalog current; default and exact readback matched the source object hash. The original version `30d540ca6e32d842` remains source provenance only. |
| V2 PASS | `pfw.qs2` | `a2d11c48b1e34926` | `9e2cd4344a16a36d` | `fc3469e631532ca2` | Normal `aux_pfw(action = "update")`; exact readback had exactly one included, non-alternative COL 2010 GEIH income mapping with national CPI/PPP/POP domains. |
| V3 PASS | `pop.qs2` | `0a23a91ddd57c602` | `b4157c9317be2e4e` | `cb4509fb588f1f23` | Normal `aux_pop(action = "update")` ran only after V2 passed; exact readback had one finite, positive COL/2010/national key. |

All three receipt checks matched the stored same-version file checksum to
both current and retained bytes, and checked the exact readback object's hash
against the catalog and exact-version sidecar. File checksums are Stamp's
SipHash-13 values, not the source archive SHA-256.

### Review handoff for coordinator

The reviewable implementation is the ignored `run.py` and `aux-proof.R`, plus
the smaller diagnostic probes in that same run root. No tracked implementation
diff exists. The worker has no internal Task dispatch capability. Route the
retained implementation through the requested full review: cg-code-quality,
cg-testing, cg-documentation, cg-version-control, cg-reproducibility,
cg-performance, cg-architecture, cg-data-quality, cg-learnings-researcher,
and cg-adversarial. Check Windows child containment and cleanup, offline
fetch-only substitution, provenance and version/hash binding, and the serial
V1-V3 assertions using source and redacted logs. Do not start package sessions,
open data payloads, change protected files, or write to the retained store.

## Gaps

- The omitted environment variable was isolated as a sufficient fix for the
  observed `rlang` exit control; the lower-level native Windows mechanism is
  UNKNOWN. Path and child-process receipts are not an OS-wide write trace.
- Full independent review remains pending with the coordinator. No live or
  shared store, broader release pipeline, downstream survey acquisition, or
  cross-machine reproducibility was tested by this worker.
