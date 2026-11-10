---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-adversarial
status: completed
updated: 2026-11-09T22:34:10Z
owner: adversarial-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Coordinator triages three P1 harness findings; retain the pipaux stop and do not resume execution under this review authorization.
---

# One-survey adversarial review

## Summary
Read-only adversarial review completed with three P1 findings. The harness does not enforce resolved E-only destinations for all writes, child installations do not inherit the parent's library restriction, and reusable extracted trees are not guaranteed exact snapshots. These are static trigger proofs, not newly executed exploits. No setup, R, tests, package changes or failure bypass were performed. The retained pipaux failure remains the first observed package boundary; no scenario ran.

## Changes
Only this review report was created and finalized. No implementation edits, package edits, dependencies, Git mutations or protected-path changes.

## Findings

- **[P1.1]** [cg-adversarial] `experiments/one-survey/setup.R`:13 — Base-library writes bypass the launcher's resolved-output guard. **Tag: manual**
  **Attack vector**: A preexisting `base-library` directory junction redirects to a directory outside the permitted checkout. The launcher checks the runtime and its enumerated immediate directories (`run.ps1:7-22`), but does not enumerate `base-library`. The R setup sees the junction as an existing directory and copies missing base/recommended packages into it at lines 14-17, before calling `safe_path` at line 34. That later call does not include `base_library` either. Immediate-directory checks also do not protect preexisting linked files such as `logs/setup.log`, written by `Tee-Object` at `run.ps1:47`.
  **Impact**: Existing redirected runtime content can cause writes outside pipsystem, including C:, despite all environment-variable values spelling E: paths. This violates Plan C1 before a final library check could stop it. No actual out-of-checkout write is established by the retained logs.
  **Proof**: Static, not executed: let `.tmp/one-survey/base-library` be a junction to an existing C: directory that lacks `boot`. Launcher validation passes because that destination is not in its directory list; `dir.exists(base_library)` is true; copying the installed `boot` directory at line 16 writes through that junction. Alternatively a preexisting linked `logs/setup.log` is not examined by the launcher's directory checks before log output.
  **Fix**: Before R starts, include the base-library and every actual output target/ancestor in the resolved destination check. For recursive copies/extraction, reject redirected descendants as well, or use a newly created empty runtime child and reject reuse. Do not rely on a later lexical prefix check or an E:-spelled environment value to authorize writes. Keep the correction scoped to this experiment; no generic framework or dependency is needed.

- **[P1.2]** [cg-adversarial] `experiments/one-survey/setup.R`:104 — Install children restore the mixed system library instead of using the parent's restricted base subset. **Tag: manual**
  **Attack vector**: The parent changes its own `.Library` binding at lines 20-23, but starts a separate `R.exe CMD INSTALL` at lines 104-107. Only environment values propagate, not that binding. The launcher sets `R_LIBS` and suppresses user/site libraries (`run.ps1:29`), but these do not remove R's default `.Library`.
  **Impact**: Compilation/lazy loading can resolve packages from the unrecorded mixed installation library when a dedicated-library entry is absent. Thus missing dependencies need not fail closed and the eventual parent's `.libPaths()` check cannot certify which namespaces an installation child used. This violates Plan C2; it does not establish that the observed pipaux failure was caused by fallback.
  **Proof**: Read-only evidence: `C:/Program Files/R/R-4.5.2/library/base/R/Rprofile:134-153` reconstructs `.Library` from R.home and initializes `.libPaths` from `R_LIBS`/user libraries. The actual C: installation directory contains contributed packages including `pipfun`, `pipload`, `pipaux`, `fs` and `data.table`. Static trigger, not executed: if a required dedicated-library package such as `fs` is missing at child startup, the retained C: copy remains an eligible resolver target; lines 20-23 in the already-running parent do not affect the child. The worker explicitly acknowledges this limitation at handoff lines 83-86.
  **Fix**: Apply the restricted `.Library`/library-path bootstrap inside each actual installation R process before dependency resolution (not merely in its parent), while retaining `--library` for the destination. Capture the install process's effective library/namespace locations as the functional evidence. Preserve the first pipaux failure; this finding grants no authorization to rerun or bypass it.

- **[P1.3]** [cg-adversarial] `experiments/one-survey/setup.R`:58 — Archive extraction overlays a mutable tree while inventory claims an exact SHA. **Tag: manual**
  **Attack vector**: A previous attempt or manual experiment leaves an extra/edited file in `.tmp/one-survey/sources/<package>`. Setup reuses the directory (lines 58-59) and untars the pinned archive into it (line 66); extraction overwrites matching members but does not remove extra files. The SHA recorded at lines 42-48/99 is then not a guarantee for all source files actually passed to installation at line 106.
  **Impact**: Untracked retained code can be compiled and installed as if it came from the pinned commit, invalidating exact-snapshot provenance and repeatability. The clean Git archive correctly excludes source-repository dirt, but does not exclude dirt already in the extraction destination. No retained-tree contamination is claimed as observed.
  **Proof**: Static, not executed: before a setup rerun, the retained `sources/stamp/R/zz-local.R` contains `.snapshot_marker <- "not in pinned commit"` and is absent from the archive. `git archive` succeeds, extraction leaves this file untouched, and `R CMD INSTALL` consumes the entire directory including it. Inventory still labels stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`. An extra file that redefines an internal function can change behavior, not only add a marker.
  **Fix**: Extract each archive to a new, empty attempt-specific directory and install that directory, or refuse nonempty destinations. Do not silently delete retained evidence to make a rerun look clean. Record the actual extraction location in the inventory. This is a small harness correction, not a package change.

## Checks run
Read-only checks only:
- Loaded clear-technical-communication, R technical and R analytical skills.
- Read approved Plan revision 1, project charter/design/harvest instructions, handoff contract, both implementation files and worker handoff.
- Read `.tmp/one-survey/logs/setup.log:1-29`, `logs/install-pipaux.log:1-11` and `baseline-observed.txt:1-8`. Setup reports five installation exits 0, then pipaux exit 1. The pipaux log records missing `store/pip_ingestion_pipeline/pc_data/cache/clean_survey_data` during lazy loading and removal of the failed pipaux installation. Successful installation with `--no-test-load` is not fresh-process runtime proof.
- Baseline artifact explicitly labels itself observed terminal text, not a captured child log. Its failure is only the missing-inventory assertion (`setup.R:50-53`); it proves neither a successful isolated setup nor a scenario baseline. The worker does not claim otherwise. Once inventory exists, that assertion alone is not a usable-installation check. No separate defect raised for an accurate disclosed limitation.
- Inspected retained pipaux `R/zzz.R:1` and pipfun `R/pip_create_globals.R:228-238`: the first calls globals at source evaluation; the latter lists the absent clean-data directory for null vintage. This supports the worker's owner direction, without reproducing it or reviewing unrelated package behavior.
- Read R's installed base startup source and listed its actual mixed library directory; did not launch R.
- Read-only Git commands confirmed pipsystem HEAD `f9454707b292a620e25abef17f2e515794020ba7`; pipfun HEAD `0c6a78d9884ed0965a524311537eec2a5095d60b`; pipaux HEAD `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`. Retained package sources reviewed correspond to the latter two recorded snapshot identities in setup.R:43,47 and the worker SHA table. No other package source was read by this reviewer. Whole-tree byte equivalence of retained sources was not independently checked.
- Git status showed preexisting active-state modification and untracked task reports/Plan/work report/.tmp/experiments; nothing was staged or committed.
- No setup/R/test command, exploit construction, binary inventory parsing, write audit or package installation executed. All report writes remained inside the requested pipsystem E: run folder.

## Gaps
- Three static harness findings require coordinator triage; none was fixed or dynamically triggered. Tags are manual because execution stopped at a package boundary and the worker reports its two allowed step-1 corrections exhausted (worker handoff:77-80); this review does not authorize further implementation or execution.
- Actual external-write occurrence is UNKNOWN. Reparse-path and library weaknesses are concrete code paths, not evidence that this run wrote to C: or loaded a particular fallback namespace.
- Inventory.rds contents were not decoded because executing R was prohibited. Dependency closure versions, complete child namespace provenance and archive-to-extracted-tree equivalence remain independently unverified.
- First observed package failure remains preserved. Its owner assessment, any package repair, and permission to resume are outside this review. No recommendation bypasses the missing-directory failure.
- Scenario source is absent per worker report, V2-V4 never ran, and V1 is partial/failed. No evidence exists here for validation, row correspondence, storage receipts or pinned data/metadata readback. This review is complete, not the approved implementation Plan or its full verification gate.
- No speculative safeguards, dependencies, charter/design changes, or protected-path cleanup is proposed. The three fixes address demonstrated harness contract failures only.
