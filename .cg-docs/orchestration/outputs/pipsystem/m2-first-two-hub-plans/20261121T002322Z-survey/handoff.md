---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T002322Z-survey
status: blocked
updated: 2026-11-21T00:30:37Z
owner: one-survey preflight worker
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: ".cg-docs/plans/2026-11-20-m2-one-survey-acquisition-preflight.md (revision 2), Phase 1 only"
next: "Parent records the V1 block; separately plan the public one-file pipdata acquisition-to-validation seam before rerunning Phase 1."
---

# M2 one-survey acquisition preflight

## Summary

Phase 1, Step 1, **V1 BLOCKED**. The pinned public workflow either selects
a batch or cannot register a direct DLW download as an available, versioned
input to actual GPWG validation. Stopped before contacting any service. No
exception or deviation from the gate. Parent owns the shared lifecycle
records and validated the selected Plan before dispatch.

The smallest missing seam belongs in `pipdata` (`SYSTEM_DESIGN.md:286-290`): a
documented public one-file acquisition-to-validation entry point that accepts
an exact catalog row and expected checksum, registers the verified download
as the versioned raw artifact and durable available acquisition row the
existing validator consumes, and binds validation and cleaning to that same
raw version/hash. Reuse the existing selector and validator; merely exporting
the internal helper would not prove that raw binding. One offline functional
check for the separate package Plan: one selected input reaches the existing
GPWG validator under its exact raw version, with no other input selected.

## Changes

This handoff only. No implementation diff for `review:auto` and no package,
Plan, Git, Qmd, or lifecycle changes by this worker. No scratch was needed.

## Checks run

Read installed `cg-work`, revision 2, charter, coordination and lifecycle
contracts, and all five R skills before the R source review. Read-only Git
verified `pipsystem` `main` at `1821c5526337d03b87a9e61ad934b3c7316c16cf` and
registered `pipdata` (`tools/pipsys/packages.csv:5`) `PROD` at
`c70ae403acde648aff1a49d8d3178ca0202c6064`, unchanged at recheck. `git show`
and `git grep` inspected the committed object, not the worktree: the existing
modified `R/dependency_inputs.R` (B6) was excluded and remained modified.

**Public route check, read-only.** `pipdata` citations below are at that
`c70ae403acde648aff1a49d8d3178ca0202c6064` pin. Dependency citations use the
retained hub archive source, with SHA mappings in
`.tmp/one-survey/resume-20261110-full/pins.tsv:3-6`.

- **Public batch wrappers.** `pipdata_get_gmd(inv_gmd_list, check_missing,
  verbose)` passes `selected_filenames = NULL`; the core selects all matching
  new/missing rows and loops over the result (`R/pipdata_get_gmd.R:801-819,
  1119-1149,1314-1352`; `R/pipdata_dlw_compare.R:232-249`).
  `pipdata_dlw_process()` takes an inventory ID, not a survey selector; it sets
  up the release, delegates to that acquisition wrapper or skips acquisition,
  then validates available candidates from the named inventory without a
  survey filter (`R/pipdata_dlw_process.R:663-685,814-869`). A PowerShell
  assertion over Git's committed `NAMESPACE` and call sites passed: the exact
  helper (`R/pipdata_get_gmd.R:1409-1489`) is not exported, and all three direct
  calls found are tests (`tests/testthat/helper-one-survey-upstream-acceptance.R:249`,
  `tests/testthat/test-m2-one-survey-acquire-format.R:387,463`).
- **Direct public DLW is bounded in code, not a `pipdata` handoff.** `dlw`
  `12faa058b521ef511073a7b21b1b1dd7993c9649` exports `dlw_get_gmd` and
  `dlw_get_data` (`NAMESPACE:4-12`). The former accepts country/year/acronym,
  module, filename, master and harmonization versions; it aborts on zero
  candidates and returns unevaluated calls on multiple candidates. With one
  candidate it invokes `dlw_get_data` for that filename (`R/gmd.R:33-111,124-145,
  196-198`; `R/dlw_server_catalog.R:68-102`). With an existing `local_dir`, the
  latter writes a versioned **pins** board entry (or reads an existing pin if
  `local_overwrite=FALSE`); download writes a temporary `.dta`, parses and
  removes it, writes the converted table and returns the table
  (`R/dlw_get_data.R:20-63,90-116,162-175`). It does not write a `pipdata`
  acquisition row or register a Stamp receipt. In `pipload`
  `ff9a81e386a09fb2531c154f63fd2b91521313c6`, `load_dlw_data()` resolves the
  configured Stamp alias and `pip_read()` requires Stamp version history,
  then calls `st_load()` (`R/load_dlw_data.R:74-87,115-132`;
  `R/pip_read-write.R:92-107`). Naming the same folder is not registration.
- **Documented inventory bridge ruled out.** `dlw_gmd_list(inv_gmd_list)`
  initializes/reconciles the server catalog, and `dlw_gmd_new(update_inventory
  = TRUE)` reconciles the default inventory. Both pass empty worker results;
  the merge defaults to `No` and changes it only for a previously available
  row with identical filename/checksum or a current acquisition worker result.
  Neither scans or imports a local download. `dlw_gmd_match()` only returns
  previously available current rows and never writes; `dlw_gmd_unvalidated()`
  discovers candidates from existing acquisition state
  (`R/pipdata_dlw_compare.R:253-310,920-952,988-1021,1047-1081,1084-1145`).
  The documented bridge is the output of `pipdata_get_gmd()`, not a direct DLW
  output (`vignettes/articles/Validating-Data.Rmd:147-179,210-220`). An
  inventory ID, a manually populated inventory, or an old `Yes` row is not
  evidence of supported import or of the current download.
- **Actual validation and clean/save path traced, not run.**
  `pipdata_validate_gmd()` reads `dlw_gmd_inv` from `dlw_inv`, then reconciles
  current available keys; only the private core can filter by survey ID
  (`R/pipdata_dlw_compare.R:184-190,714-725`;
  `R/pipdata_validate_gmd.R:981-985,1177-1207,1299-1305,1538-1548,1819-1826`).
  The worker loads the raw ID without an explicit version, looks up Stamp
  `dlw` info, runs the GPWG engine and records the latest version/hash plus
  the candidate's catalog `Checksum`. It does not compute the source byte
  checksum or prove that its load used the same version as the info lookup
  (`R/pipdata_validate_gmd.R:569-620,643-688`). The exported table-level
  `dlw_validation_engine(..., module = "gpwg")` runs real GPWG rules but
  only returns diagnostics and appends in-memory report state, not a durable
  `validation_report` / `gmd_valid_inv` pair in `dlw_meta`
  (`R/pipdata_dlw_validation.R:354-367,571-575,595-616`;
  `R/pipdata_validate_gmd.R:924-935`; validation vignette lines 174-179).
  Given a genuine valid/available row, `pd_process_data(inv = ...)` prepares
  the auxiliary inputs and syncs the package recodes to `pip_inv` (which can
  write a version, `R/recode_spec.R:165-217`). Its clean worker reads the row's
  `latest_version_id`, merges PFW, formats and validates before saving to
  `pip`. The wrapper blocks corresponding metadata actions on clean failure
  and returns after metadata, before deflation. Metadata is saved to
  `pip_meta`, with the clean version/hash on the returned receipt. Both use
  versioned `pipload::pip_write()` and check catalog receipts; not proof of
  paired object readback (`R/inv_dlw_load.R:7-24`;
  `R/pd_process_data.R:77-85,111-190,264-306`;
  `R/pd_metadata_refresh.R:80-91,120-140`; `R/save_pip.R:91-128`).

**Read-only runtime checks.** Existing E: shelf `R/win-library/4.5`
`dlw/DESCRIPTION:4,25-34` records the same DLW SHA. Its `pipdata/DESCRIPTION:3,
23-32` records `fb4487471bbb5df521b8906622af3e30ef8947b3`, not the required
pin; the prior private run records `13a38280c1eafe7e03a97837cdb57833fbe9d926`
(`pins.tsv:8`). These are metadata checks, not a claim about every library or
a loaded runtime. No R process, C: fallback, package installation, release
initialization, or alias change. For a later authorized run, `pipdata/R/zzz.R:2-25`
sets a user cache default and initializes logging at load; `pipfun`
`7d534516a8c17c33d537681610eccd4c29211762` release setup resolves metadata,
creates folders and initializes aliases even for an explicit release
(`R/working_release.R:79-119,128-158,469-479`). Thus resolve private E: raw,
clean, inventory, temp, library, legacy-output, cache, and log paths before
launch; E: and Git ignore are not access controls.

**NOT RUN:** DLW authentication, live catalog/current-row verification,
checksum algorithm or byte verification, and runtime path/access approval.
Phase 2 V2/V3: auxiliary writer/store and parent pins, household download,
raw version/hash binding, actual GPWG validation, source welfare-period and
row-aligned clean checks, both saves, and paired exact-version/hash/lineage
readback. No shared storage access, data disclosure, or deflation.

## Gaps

- The public exact acquisition-to-validation seam is absent at the pin.
  A byte-checksum method is UNKNOWN: catalog code normalizes the `Checksum`
  field and checks filename uniqueness, not a digest algorithm
  (`R/pipdata_dlw_compare.R:83-95,121-164`). Copying it is not verification.
- No loaded runtime at the required pin or access-restricted E: data
  destination was verified. Current live filename, versions, checksum,
  authoritative welfare period, exact auxiliary parents, and survey outcome
  remain UNKNOWN. Phase 1 cannot be marked complete.
