---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:29:16Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: NONE
next: Reuse the existing stage examples in a narrow acceptance completion-contract preview; do not execute exploratory scripts.
---

# Vignettes, scripts and package-root review

## Summary
The user's recollection is correct: the package already has a clear preliminary upstream workflow. All three tracked vignette Rmd sources were read in full, as were the package root guidance/configuration and all 15 historical R scripts. The useful starting point is the single-survey transformation sequence, not a new scheduler or full rewrite. Historical logs also show cleaning runs existed before the new M2 path. None of this proves present full integration or a live execution at the current SHA.

## Useful existing examples
All short paths below are in E:/PovcalNet/01.personal/wb384996/PIP/pipdata at the full SHA above.

| Example | Reuse | Limit |
|---|---|---|
| vignettes/articles/PIP-data-pipeline.Rmd:25-43,64-144 | Clear order: acquire/validate, processing, then deflation; explicit release/options | Every chunk is eval=FALSE; no current execution evidence |
| vignettes/articles/PIP-data-pipeline.Rmd:150-246 | Explicit separation of opt-in recipes, TEST identity, guarded exact parents and single root | The page itself says production worker adapters are absent; do not pass existing workers directly or treat generic arithmetic as real cleaning |
| vignettes/articles/PIP-data-pipeline.Rmd:270-275 | Existing single-survey composition: inv_dlw_load, pd_cpfw_merge, pd_dlw_clean, pd_aux_attr, save | Example bypasses some newer strict fences/receipts. Preserve actual current valid-status/post-format checks; pin input/output rather than claim exact provenance from current selectors |
| vignettes/articles/Processing-Data.Rmd:142-238,273-315 | Detailed manual loader, class/attribute setup, PFW matching, cleaning and metadata flow; good explanation/reference | It contains a bulk loop and uses different variables/old helper names in places; not a ready isolated runner |
| vignettes/articles/Validating-Data.Rmd:52-159 | Offline validation with supplied data/table, specification inspection, accumulator report, per-module wrapper examples | Most detailed module wrappers are now deprecated and the page is eval=FALSE; use the real current engine/spec and exact expected result, not a mocked success |
| Pipdata_script.R:34-63,85-115 | Existing analyst exploration of stage order and one-object CPI/PPP/pop behavior | Executable script also updates packages, runs forced bulk work, mutates options/releases and repairs storage; do not source wholesale |
| log_reports/log_report.md:3-18 | Historical June 28 report records 1,570 surveys processed, 1,423 cleaned, 147 failed and four auxiliary change categories | Historical worker-generated summary, no bound Git/runtime SHA; not current pass or new stamp-authority acceptance |

## Conflicts and stale guidance
- PIP-data-pipeline.Rmd:111-129 and Processing-Data.Rmd:83-100 describe status valid OR invalid as eligible for processing. Current code has a stricter valid/available gate (engine-review.md:51-56). The example does not override current source or the Decided invalid-input rule.
- README.md:62-74 and the overview/vignette's C2 description assign currentness to pipdata's manifest. The default route does implement that authority, but it conflicts with the target Decided stamp-only rule. The examples are migration evidence, not permission to preserve a second scheduler. An offline stage test may exercise transformations without claiming full scheduler integration.
- README.md:29-46 gives install/update/startup examples. Pipdata_script.R:4 explicitly calls metapip::update_pip_packages; :54,57 force bulk processing/deflation; :183-185 rebuilds a catalog with commit=TRUE. data-raw/rebuild_stamp_catalog.R:10 also does a real catalog rebuild. None of those actions was executed or is part of the acceptance preview.
- compound-gpid.context.md:29 links docs/pipeline_overview.qmd; a package-wide qmd glob found no qmd file. The referenced source is unavailable in this checkout. Ignored docs/ contains generated site copies; tracked Rmd/R/Rd are the authoritative review sources, not generated output timestamps.
- old_files/* and inst/TMP/TMP_dlw_validate_process.R preserve older inventory/release simulations. Several perform network loads, directory copies/renames/deletes or bulk transforms; they are historical examples only, not sources to execute wholesale or new runtime requirements.
- DESCRIPTION:43-49 points at floating package branches, so source checkout alone does not establish execution-library provenance. The acceptance environment must record actual loaded sources; do not install shared packages to make this research work.

## Reusable actual auxiliary-producer seam
A narrow additional upstream read used pipaux PROD 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be, independently checked clean. This was not a full pipaux audit.

pipaux/tests/testthat/test-m2-stamp-cpi-ppp-pfw.R:84-217 builds raw synthetic auxiliary inputs; :224-236 replaces only pipfun::load_from_gh; :238-240 calls real aux_cpi_update, aux_ppp_update and aux_pfw_update; :251-270 reloads actual saved outputs and verifies exact persisted keys; :297-315 verifies sidecar identities/code provenance. This is a concrete way to close the missing producer-to-consumer boundary without live GitHub or a new fixture framework. The updater test is source evidence, not rerun here. Existing fixture values/modules must be aligned explicitly with the survey fixture, not reused blindly.

## Main-review coverage
Specialist source/test/manual/history partitions are listed in the parent handoff and their own per-file manifests. This table records the non-overlapping parent partition.

| Files / category | Method |
|---|---|
| All three vignettes/articles/*.Rmd | Full reads: PIP-data-pipeline (287 lines), Processing-Data (317), Validating-Data (232) |
| Vignette .gitignore | Full read |
| Vignette images/pipeline_flow.png, pd_functions.png | Opened as images; transparency limits label visibility, not used to infer runtime behavior |
| Vignette images/pd_functions.excalidraw | Header plus all text/originalText labels screened across file; layout geometry not semantically audited |
| Pipdata_script.R | Full read (185 lines) |
| README.md, NEWS.md, DESCRIPTION, NAMESPACE | Full reads |
| compound-gpid.md, compound-gpid.context.md, roadmap.json | Full reads; package-local roadmap is historical local scope, not pipsystem roadmap mutation authority |
| .Rbuildignore, _pkgdown.yml, pipdata.Rproj, .vscode/launch.json | Full reads, no rendering or client-settings changes |
| .gitignore | Header/full nonblank-rule grep across 6,360 lines; remaining blank padding not line-by-line read |
| .github/.gitignore, .github/workflows/pkgdown.yaml | Full reads; token variable names are workflow placeholders, no credential values copied |
| LICENSE, LICENSE.md | Full reads |
| data-raw/DATASET.R, data-raw/rebuild_stamp_catalog.R | Full reads; not executed |
| inst/TMP/TMP_dlw_validate_process.R | Full read (298 lines); arbitrary-folder simulation, not canonical acceptance |
| old_files/all_cols_to_attr.R, dlw_change_report.R, dlw_dta_to_qs.R, dlw_get_dta.R, dlw_scan_and_validate.R, dlw_store_release.R, examples.R, helper-mock_funs.R, pd_add_pip_vars.R, release_mgmt.R, speed_testing.R, test-dlw_dta_to_qs.R, test-update_pip_inventory.R, update_dlw_inventory.R, update_pip_inventory.R | All 15 textual historical R files read fully. No current-runtime guarantees inferred |
| old_files/aux_index.rds | Inventoried only; binary not decoded |
| log_reports/log_report.md | Header/summary lines 1-50 and file structure screened only; per-survey log body not copied/audited |
| R/sysdata.rda | Inventoried only; serialized package data not decoded |
| Ignored docs/ | File-name source search only; generated site duplicates not independently reread. No qmd source found |
| Ignored .git/, .tmp/, .Rproj.user/, sessionInfoLog, raw histories and local machine/runtime artifacts | Not reviewed as package source; no credential/private-data traversal |

## Changes
Only this new supporting review. No package work was executed. No package, Plan, roadmap, design, client setting, pipeline or source modification.

## Checks run
Read-only file inspection, image opening, dedicated content/file searches and fresh read-only Git/clock checks. Package tracked inventory contains 480 files; no untracked package files were reported. All R source review is assigned across three non-overlapping partitions, and all test sources across a separate partition; generated/history screening is not described as a full semantic audit. The command source and installed-copy instructions were read only to prepare a separate-session handoff; no installation or tests here.

## Gaps
- Binary fixtures/package data were not decoded; generated docs/images are not runtime evidence. Historical/log screening is not a fresh audit of every past finding or every survey outcome.
- This review neither ran packages nor reproduced numerical/source risks from the other partitions. Actual runtime capability, complete producer-consumer acceptance and live DLW remain unverified.
- The acceptance preview must say which layer it demonstrates: offline real-stage integration first; live transport, full stamp-orchestrated route, incremental reruns, deflation/calculations/releases are distinct later evidence. No claim that the whole M2 pipeline is already connected follows from these vignettes.
