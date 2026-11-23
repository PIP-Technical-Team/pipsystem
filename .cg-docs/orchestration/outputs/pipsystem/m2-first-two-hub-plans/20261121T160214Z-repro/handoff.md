---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-repro
status: completed
updated: 2026-11-21T16:06:27Z
owner: reproducibility review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md r4
next: Coordinator retains the reported V1-V3 passes and reconciles the POP source commit before using its provenance downstream.
---

# Installed auxiliary save reproducibility review

## Summary
One material provenance conflict prevents an unqualified reproducibility sign-off. The POP inputs' SHA-256 and Git blob IDs agree with prior evidence, but the source commit recorded for both conflicts with Plan r4's linked source evidence. This does not establish a byte mismatch or invalidate the prior worker's reported saves. No P0 found.

Paths below are relative to `.tmp/m2-aux-save/20261121T153507Z-diagnosis/` unless qualified. “Stamp handoff” means the sibling `20261121T153507Z-stamp/handoff.md`.

### Findings

**[P1]** `input.tsv:5–6`, `run.py:542–561` — POP source commit conflicts with earlier evidence.  
**Issue:** Diagnosis and `20261121T134435Z-aux-r4/input.tsv:5–6` record `639613e9032e61c45b3f1ee8886fc6c08c63c19`; Plan r4's linked `.cg-docs/orchestration/outputs/pipsystem/m2-aux-inputs/20261119T215954Z-local-boundary/handoff.md:69–78` records `639613e9032e61c45b3f1dd8208cff0587d1b624` for the same two Git blobs. The launcher checks the byte SHA-256 and Git blob ID, then copies the commit field without checking it. The two byte SHA-256s and both blob IDs agree with `20261121T002322Z-aux/handoff.md:100–111`.  
**Fix (manual):** Reconcile both commit-to-blob mappings against the original stage receipt; correct only the provenance in coordinator evidence, preserving the raw manifests and historical V3 result. If the mapping cannot be recovered, mark the POP commit UNKNOWN rather than choosing a value by inspection. No payload rerun is needed to reconcile the metadata.

**[P2]** `run.py:283–296,434–465`; Stamp handoff `:63–64` — core R hashes do not pin its startup code.  
**Issue:** The mirror is byte-compared during staging, but only six core binary hashes are checked at launch. The recorded historical control already shows that matching binaries can coexist with a different base `Rprofile` that executes under `--vanilla`, before `aux-proof.R` can check anything. No drift in the actual clean mirror was observed.  
**Fix (safe_auto, future replay only):** Pin the qualified mirror's `library/base/R/Rprofile` at staging and include it in the existing pre-child hash check.

**[P2]** `run.py:354–380,581–610,613–631`; `aux-proof.R:50–83` — installed code is less tightly bound than its source archives.  
**Issue:** Dependency copies are verified while staged and the pipfun/pipload/pipaux archives are rehashed before proof, but the proof does not rehash the installed copies as it does for four Stamp files. Paths and versions cannot distinguish different installed bytes at the same path and version. Extraction also does not require a new package source directory, so archive hashes do not describe any unlisted files in a reused tree. No actual installed-code mismatch was observed.  
**Fix (manual, future replay only):** Use a fresh build/proof root as Plan r4 requires, rather than replaying against this retained installation. Keep the install and proof together; do not upgrade the report to a byte-for-byte replay guarantee.

**[P3]** `run.py:283–307,613–631,648–659`; `aux-proof.R:79–83` — attempt evidence is not all segregated.  
**Issue:** Label-specific JSON logs and stores preserve the recorded attempt, but a later successful proof in the same root can overwrite both unlabelled `origins-*.tsv` files. Plan r4 `:167–171` requires preserving attempts and a fresh run root after a partial save.  
**Fix (advisory):** If pre-save retry support is retained, place the two origin manifests under the same attempt label as its JSON receipts.

**[P3]** `run.py:3–18,24–44,648–659`; `log/aux-proof-test.pre.json:2–8,61–65` — explicit R child environment does not cover Python startup.  
**Issue:** The historical proof records an absolute R executable and the R child's environment, not the Windows CPython version or isolated import mode for the Python launcher. A fresh rebuild also needs local dependency/source records and the stock R runtime; it is not a cross-machine replay recipe.  
**Fix (advisory):** If replay is requested, record the installed Windows CPython identity and isolated launch flags in the attempt record. No new lockfile, tool or dependency is warranted for this one-off proof.

## Changes
This handoff only; no source, Plan, retained output, or Git changes.

## Checks run
- Verified the requested E: hub, `main`, full HEAD before and after, no Plan diff against HEAD, and fresh resolved E: report ancestry. Loaded all five R skills before reading R.
- Runtime/archive records agree: `run.py:29–52,119–133,289–296`, `log/aux-proof-test.pre.json:67–75`, `installed-stamp.sha256:1–5` and Plan r4 `:40–44` agree on the six listed R binary pins and/or the Stamp archive SHA-256 as applicable. `sources-verified.tsv:2–4` agrees with predecessor `sources.tsv:3–5` and the Stamp handoff `:44–49`. The Stamp archive pin is independent of the registered Stamp checkout HEAD. Staging copy records contain 114 dependency entries and 6,479 file rows (`dependencies.tsv:1–115`; `dependency-copies-all.tsv:6475–6480`).
- Child and import controls: `run.py:80–115,217–280,283–315` passes an explicit child environment and working directory, checks paths, and assigns the R process to a bounded Windows job before resuming it. The pre-record shows E: R/library/home/temp/data roots, `--vanilla`, a short explicit PATH including Windows system directories, and `PROCESSOR_ARCHITECTURE=AMD64`; `run.py:486–499` contains the scalar and combined import controls, whose outcomes are reported in the Stamp handoff `:60–68`. `aux-proof.R:25–83,124–157,234–241` checks library order, search origins, loaded dependency versions and R-registered DLL paths, and loads pipaux only after TEST setup. The origin manifests record Stamp 0.1.1, pipaux 0.3.0, pipfun 1.0.1 and pipload 1.0.0 in private `ok`; pipload appears in the after-pop manifest, not the initial loaded set (`origins-before-save.tsv:33–42`; `origins-after-pop.tsv:38–52`).
- Inputs/route: `input.tsv:2–3,7` agrees with `20261121T041012Z-inputs/handoff.md:72–98`; the PFW SHA-256/blob/commit agree with the earlier preflight and joint check cited in P1. `aux-proof.R:86–135` substitutes only five allowlisted source fetch locators, rechecks staged SHA-256 at read, and uses normal setup. `aux-proof.R:139–241` checks private alias and fresh IDs, then performs country-list write, PFW, and POP in order, binding the exact receipt/catalog/readback and checking current plus retained bytes. The source country-list ID is kept distinct from the TEST receipt. The Stamp handoff `:95–110` reports V1–V3 PASS; `log/aux-proof-test.result.json:2–9` corroborates exit 0, no timeout and zero owned processes remaining, not the individual output assertions by itself.

## Gaps
- POP commit-to-blob mapping remains unreconciled. No archive, installed binary, input payload, store artifact, credential or process-stream log was opened or rehashed in this review. No tests, replay, package checkout inspection or cross-machine comparison were run. Historical execution facts beyond the two scoped JSONs and manifests are attributed to the Stamp handoff.
- A fresh replay should reproduce the assertions with the same qualified inputs and code, not necessarily the same newly assigned Stamp version IDs or serialized byte hashes. This review establishes neither fresh replay equivalence nor OS-wide write or network isolation.
