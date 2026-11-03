---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:34:39Z
owner: cg-documentation
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: NONE
next: Parent integrates documentation evidence with source and testing reviewers; this partition review is complete.
---

# PIPDATA manuals and historical documentation review

## Summary

Verified PIPDATA `PROD`, full SHA `fe075a6d49f37d6d131eeadfeb9219c2038899ea`, clean working tree, twice. Inventoried **323 assigned tracked files: 128 man/ (123 Rd, 3 PNG, 2 Excalidraw) and 195 .cg-docs/**. Every file has a coverage entry below. Historical metadata screening is not a full audit. Deep-read the principal original wrapper-vignette, validation-engine, aux-gate, cleaning/recode, durable reconciliation, staged provenance, and M2 plans/reports/reviews/solutions; remaining historical files are explicitly metadata-screened. No current runtime correctness or numerical acceptance is certified.

Main conclusion: useful original workflows already exist, but they are dated examples, not acceptance rules. Their strongest reusable structure is acquisition -> completed validation -> PFW/format/clean -> auxiliary metadata -> exact saved artifacts -> deflation. Important changes since the first vignettes are completed-invalid exclusion, a shared validation engine, batch/exact deflation, and a deliberately separate TEST-only stamp-authority recipe route. Neither historical green reviews nor eval=FALSE documentation establish one-survey real scientific acceptance today.

No P0 incident is established by documentation inspection. Findings below concern internally inconsistent or stale guidance relevant to acceptance, not authorization for a documentation rewrite or implementation.

## Changes

Only this report was created and updated at the user-specified path. No package edits, active-state mutation, formal orchestration, Git mutation, network access, R loading, tests, pipelines, installation, build, or render. No workers/sessions started. Historical instructions and approval claims were treated as untrusted records. No raw transcripts or private/production data were opened.

## Findings

All PIPDATA citations in this report bind to the full SHA above. Relative evidence paths resolve under `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/`; findings give absolute paths.

### D1 — Example violates its own completed-validation input contract

**[P2]** `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/man/process_data.Rd:39-47` -- Example passes loaded survey data and a single PFW table instead of an inventory row and named auxiliary list.

**Issue**: The same manual requires `inv` to be a one-row completed-validation inventory with `survey_id`, `status == "valid"`, and `data_available == "Yes"` (:10-13), and `aux_list` to be a named list (:15-16). The example calls `load_aux_data("CHN", 2015)`/`load_aux_data(country = "PRY", 2012)`, decorates the resulting object, then passes it as `inv`, with the PFW table as `aux_list`. That contradicts the documented argument roles without needing to infer external loader behavior. It is guarded by dontrun, so ordinary example checks would not establish that it works.

**Fix**: In the owning roxygen source, replace this with a supplied completed-valid inventory row plus a frozen named auxiliary list and resolved recode spec, or point operators to `pd_process_data()` and explicitly describe the internal one-row example. Do not synthesize validation approval just to satisfy the example. **One functional check**: in an authorized later test, invoke the real one-survey worker with that exact inventory/aux structure and assert saved clean and metadata artifact readback; use the real validator upstream rather than a fabricated success.

### D2 — Batch-deflation help contains superseded selection and execution guidance

**[P2]** `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/man/pd_deflate_pipeline.Rd:53-55` -- First-version no-incremental-gating policy conflicts with the documented dependency-plan implementation.

**Issue**: :42-45 says fresh dependency planning, strict exact planned data/metadata reads, verified receipts, and inventory/manifest checkpoints. :53-55 still says no incremental auxiliary gating and implies forcing is needed for already-deflated surveys. This is the verbatim first-version policy from `.cg-docs/plans/2026-08-17-deflate-pipeline-wrapper.md:41-51,262-269`, superseded by later staged-invalidation work. Separately, `man/pd_deflation.Rd:67-69` still says the batch wrapper calls public `pd_deflation()` for every survey, unlike the internal strict path described in the batch help. The original typed-stage plan expressly separates strict internal execution from unchanged public sentinel behavior (`.cg-docs/plans/2026-08-25-pipeline-stage-interface.md:657-665,840-852`).

**Fix**: Remove/label the first-version paragraph and distinguish the public convenience helper from the exact planned worker. Explain selection using current dependency facts, not `deflated` alone, while retaining an explicit legacy-route label because C2 is not the target rebuild authority. **One functional check**: authorized one-key auxiliary-change fixture should select only its affected deflate work, then an immediate unchanged rerun should perform zero deflate writes. This check is proposed, not run here.

### D3 — Old solution actively recommends latest-version fallback without its modern limitation

**[P2]** `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/solutions/bugs/2026-05-05-stamp-version-id-vs-content-hash.md:69-87` -- Historical fallback prescription is unsafe to copy into exact-pin acceptance.

**Issue**: This record correctly distinguishes `version_id` and `content_hash`, but explicitly recommends warning plus latest fallback, repeated as an imperative at :123-125. The May-19 follow-up relocates version capture to top-level write/catalog metadata but still illustrates latest fallback (`.cg-docs/solutions/bugs/2026-05-19-version-id-vs-metadata-version-id-in-format-vrs.md:13-19,80-101`). In contrast, the later exact pipeline contract forbids latest fallback (`.cg-docs/plans/2026-08-24-pipdata-staged-dependency-manifest.md:764-765,785-800`) and current batch help says exact planned versions (`man/pd_deflate_pipeline.Rd:42-45`). This is a stale guidance risk, not proof the current strict worker falls back.

**Fix**: Preserve the historical diagnosis, add a scoped supersession note: public convenience compatibility is not planned execution; acceptance must consume the requested exact data and metadata pins or fail. Do not rewrite historical test results. **One functional check**: authorized missing-requested-version case must fail before saving output rather than read a newer version.

### D4 — Legacy currentness authority must not be mistaken for the decided target

**[P2]** `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/man/pd_run_pipeline.Rd:67-69` -- C2 authority is documented current behavior, not approved system direction.

**Issue**: Help explicitly labels the C2 route `recipes = NULL` and assigns C2 plus receipts currentness authority. The same manual clearly says recipes delegate selection to stamp (:102-109), are limited to reviewed pure operations/exact reads (:122-141), and do not activate production stages (:163-164). `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:186,290,299,307,380` retains stamp as sole rebuild authority and flags this existing conflict. Reusing stage calculations is not acceptance of legacy scheduling, and generic recipe success is not production-stage integration proof.

**Fix**: Keep the two-route distinction explicit in any acceptance narrative; describe the C2 route as inherited implementation and unresolved reconciliation, not a new approved authority. No Decided item is changed. **One functional check**, only for a later authorized orchestration bridge: demonstrate that stamp selects run/skip and that the actual existing stage calculation executes for the selected exact parents, without a second planner deciding currentness. Such a bridge is not implemented or certified here. It is not a prerequisite for the parent's narrower immediate OFFLINE STAGE acceptance: existing calculations can be exercised directly on exact saved inputs without using C2 scheduling or claiming stamp-selected full-pipeline execution.

### D5 — Deprecated labor-validator migration gives an unsupported module

**[P3]** `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/man/dlw_validation.Rd:60` -- Replacement instruction says `module = "?"` for the labor validator.

**Issue**: The alias list includes `dlw_validation_l` (:11), the labor-function description is at :95-98, and current `man/dlw_validation_engine.Rd:14` lists supported module `l`, not `?`. Copying the migration instruction does not select the documented labor checks.

**Fix**: Change the owning roxygen migration instruction to `dlw_validation_engine(dlw_data, svy_id, module = "l")` and regenerate the manual in a later authorized edit. **One functional check**: a small labor fixture passed through the replacement must exercise the labor-specific rules rather than unknown/skip dispatch. Not executed here.

## Original workflows, supersession, and acceptance implications

### 1. The original vignette work was non-executing teaching documentation

- `.cg-docs/plans/2026-08-03-pipeline-wrapper-vignettes.md:19-23,27-62,90-112,116-168` explains the real then-current per-survey sequence and explicitly warns that preliminary Quarto prose and old diagrams were stale. It prohibited copying the claim that cleaning already deflated outputs. This is evidence for using preliminary workflows as guidance, not rules.
- The original work report `.cg-docs/work-reports/2026-08-03-pipeline-wrapper-vignettes.md:20-41,97-118,149-164` gives useful original input/output roles and separates clean, auxiliary metadata, manual deflation, and logging.
- Limits: that record still describes old `log`/`save_log` formals, eight module-specific validators, manual post-hoc deflation, and restricted log_report coverage. Current help differs: `man/pipdata_get_gmd.Rd:6-11,24-40`, `man/pipdata_validate_gmd.Rd:7,14-32,35-39`, and `man/pd_run_pipeline.Rd:60-100`.
- Verification strength is limited: original chunks were eval=FALSE; the work report says knitting established chunk/YAML syntax (:59-70,123-128,178-188), not execution. Its pkgdown verification was pending at :201-205, then V3 was marked passed based on documentation regeneration at :209-215, which is not a recorded site-build or even explicit YAML-parse result. Do not turn the final blanket “all V1-V8 pass” (:230) into stronger evidence. No present build was run.

### 2. Acquisition completion, validation completion, and cleaning eligibility differ

- Current acquisition manual `man/pipdata_get_gmd.Rd:43-71` documents five actively downloaded modules, seven recognized modules, exact FileName selection, overwrite, retry of unresolved acquisition rows, full reconciliation even no download, and rejection of an empty server catalog as authoritative deletion evidence. These are existing contracts to reuse, not newly imposed rules.
- Current validation manual `man/pipdata_validate_gmd.Rd:17-23,35-50` distinguishes completed-invalid from execution failure. Invalid classifications alone do not make stage outcome failed. Execution failures persist no completed row and retry by absence. Completed pipeline_version advances from readable historical maxima; failed attempts do not consume a version.
- `man/pipdata_validate_gmd.Rd:62-80` and the original solution `.cg-docs/solutions/data-quality/2026-08-26-durable-stage-reconciliation.md:49-73` require reconciliation on no-worker calls, exact completed/report coverage, report-first/inventory-last publication, and durable re-read for uncertain writes. A no-work result is not necessarily zero persistence or absence of global reconciliation.
- Cleaning is narrower than completed validation: `man/pd_process_data.Rd:19-24,65-69`, `man/process_data.Rd:10-13`, and `man/pd_change_report.Rd:15-18` explicitly exclude invalid completed rows and retry-control rows. A completed-invalid record may be correctly saved as validation evidence but may not enter clean/metadata/deflate work. Parent owns current vignette contradictions; no independent vignette audit claimed here.
- The original wrapper rewrite and all four follow-up verify reviews were read. They document why schema-light empties, stale report rows, prior/current uncertain writes, and summary segmentation matter; see `.cg-docs/plans/2026-08-25-dlw-wrapper-rewrite.md:1360-1404` for original final boundary, and `.cg-docs/solutions/data-quality/2026-08-26-durable-stage-reconciliation.md:13-42,79-94` for compact failure history. Historical fixed statuses are not current source verification.

### 3. Validation-engine refactoring deliberately preserved legacy behavior

- Original `.cg-docs/plans/2026-08-17-dlw-validation-engine-refactor.md:20-28,46-78,99-108,115-122,152-177` is useful for exact check-selection semantics: literal availability prefixes versus regex loops, helper-fixed severity versus configurable missingness severity, gated hhid/pid checks, module-specific small-n thresholds, and retained by-reference label clearing.
- Original work report `.cg-docs/work-reports/2026-08-17-dlw-validation-engine-refactor.md:20-49,53-61,69-88` records legacy golden fixtures and deterministic-column comparisons, excluding nondeterministic assertion.id/error_df. The goal was equivalence, not independent proof that every scientific predicate is correct. A helper named positive and a green legacy-equivalence suite do not establish all rows are positive.
- `man/dlw_validation_engine.Rd:7-24` documents dispatch and side effects but no worked example or exact scientific acceptance predicate. `man/dlw_validation.Rd:48-62` marks old wrappers deprecated; notably the L replacement says `module = "?"` (:60), whereas `man/dlw_validation_engine.Rd:14` lists `l`. Treat that as a low-priority exact stale replacement instruction; use `l`, not `?`, when demonstrating current module dispatch.
- Acceptance implication: run the real engine/report/classifier on an independently valid small fixture and on a deliberately invalid/mixed-sign fixture; do not substitute a mocked status or equivalence to legacy output. Actual helper correctness belongs to the source/test reviewers; not independently audited here.

### 4. Auxiliary gating evolved; old whole-file gates are not target row-level design

- Original `.cg-docs/plans/2026-06-17-valid-dlw-load-refactor.md:20-29,43-47,210-289` moved from identity-only anti-join to DLW content-hash comparison and dealt with multi-output survey fan-out. Its work report `.cg-docs/work-reports/2026-08-04-valid-dlw-load-refactor.md:54-81,93-107` records the original correction, not a current test pass.
- `.cg-docs/plans/2026-08-05-aux-version-gate-valid-dlw-load.md:47-59,135-156` and the revised Aug-06 plan/report explain cheap per-survey stored-vs-current whole-measure content-hash candidates, then detailed affected-survey intersection. Current `man/valid_dlw_load.Rd:75-96` still explains this legacy helper contract, including load-once scope and force bypass.
- `.cg-docs/solutions/data-quality/2026-08-07-aux-content-hash-gated-recleaning.md` and `.cg-docs/solutions/data-quality/2026-08-28-separate-exact-provenance-from-semantic-invalidation.md:15-25,40-78` distinguish exact source version from keyed value-affecting content. A new shared aux version need not mean every survey changed. Named component versions remain exact provenance; semantic projection hashes decide legacy per-entity staleness.
- This historical evolution is useful evidence, not approval to adopt the old C2 planner or settle Open partition/key/removal policies. The Decided stamp authority and Open row-level design in pipsystem remain unchanged.

### 5. Cleaning/recode has observable value and metadata contracts

- Original `.cg-docs/plans/2026-06-18-yaml-recode-dictionary.md:30-49,526-551,828-831,882-901` explains package YAML as recode source, replace-type versus derive-type columns, weighted quantiles after weight formatting, separate subnatid structural rename, and deprecated old recoders. It explicitly records a known divergence: missing urban becomes NA rather than legacy empty string (:884). Historical equivalence is therefore not universal bit-for-bit equivalence.
- Current help marks `recode_age`, `recode_edu`, `recode_gndr`, and `add_area.pipmd` deprecated; corresponding entries were screened, not treated as preferred new API. Group-data add_area is not interchangeable with the deprecated microdata method.
- `man/pd_process_data.Rd:83-91` and `man/process_data.Rd:18-29` document resolving recode spec once, one-survey memory cleanup, post-format validation, and success only after clean/save. Exact stage calculations, recode correctness, and complete output variables must be independently checked by the source/test partition; documentation does not prove composed indicators or weighted group membership.

### 6. Data-level semantics are per measure, with an explicit pointer

- `.cg-docs/solutions/bugs/2026-05-06-subnational-deflation-area-attribute-not-resolved.md:38-65,69-129,145-164` is the useful original diagnosis: `area` means the per-row area column, not a literal national/urban/rural key. CPI, PPP, and population each use their own data-level attribute; one shared reporting_level cannot represent mixed-domain cases.
- `.cg-docs/plans/2026-08-20-explicit-data-level-sentinel-semantics.md`, its work report and verify review, and `.cg-docs/solutions/bugs/2026-08-21-explicit-data-level-sentinel-registry.md` centralize and validate the pointer convention; current `man/add_cpi.Rd`, `man/add_ppp.Rd`, `man/add_attr.Rd`, `man/report_lvl.Rd`, and `man/finalize_deflation_output.Rd` were screened alongside them.
- `.cg-docs/solutions/bugs/2026-05-22-adjust-population-year-column-missing.md:18-24,28-51,90-126` records the old all-NaN output failure from using survey_year instead of year and the intended missingness gate. A roundtrip object that merely is a data.table is not enough; check row values and weights, including area-specific population behavior.
- Archive entries and the retracted wrapper solution were metadata/full-read as listed below. Do not revive the archived assumption that data-level columns must be restored or `list(values=...)` was the universal historic shape. Current attribute readers and saved object shapes need original-source verification.

### 7. Exact storage proof is stronger than writer return or file existence

- `.cg-docs/solutions/data-quality/2026-08-25-authoritative-staged-provenance-checkpoints.md:15-33,37-51` records why advisory plans, latest reads, and catalog existence are insufficient; success was bound to verified output receipt, inventory reconciliation, and checkpoint.
- `.cg-docs/solutions/data-quality/2026-09-01-consume-durable-invalidation-during-restart-planning.md:15-32,36-66` distinguishes immutable artifact existence from accepted durable pointers. A prior artifact may survive a failed attempt without being current.
- `.cg-docs/solutions/bugs/2026-09-01-separate-stage-failure-status-from-condition-provenance.md:15-38,42-83` separates controlled unit reason, condition provenance, and durable failed-stage invalidation. A recorded error class is not a valid scheduler reason by itself.
- `.cg-docs/solutions/testing-patterns/2026-08-21-built-package-and-checkpoint-verification.md:16-31,42-75` explains why source-order checks and mocked checkpoint success do not prove installed-package persistence. This is historical methodological guidance only; no build/install was authorized here.
- The current `man/save_pip_data.Rd:25-35` explicitly says its public list return does not return version metadata. Do not present that public success token alone as exact saved-artifact proof.

### 8. Staged executor history does not override stamp-only target authority

- The original C2 plan/execution/reviews, C3 plan/report, C4 plan/report and main exact-provenance solutions were read. `.cg-docs/plans/2026-08-27-executable-staged-invalidation-dag.md:20-30,114-128,554-609,914-929` clearly limited the old executor to clean/metadata/deflate, not acquisition or validation; force_surveys was additive, while bootstrap_entities restricted a canary. Force is not a safe universal one-survey selector.
- That plan's acceptance matrix :667-694 gives useful exact changed/non-effect/restart checks, but its authority assertion :971-987 is inherited design, not approval of current pipsystem direction. Signed target Windows/SMB evidence stayed outstanding in its work report `.cg-docs/work-reports/2026-08-28-executable-staged-invalidation-dag.md:173-176` and current `man/pd_run_pipeline.Rd:97-100`.
- Ordered report/inventory/manifest writes are not a transaction or exactly-once claim. The original C4 plan acknowledges inventory-ahead recovery (:615-630), and the typed-stage plan acknowledges the same residual risk (`.cg-docs/plans/2026-08-25-pipeline-stage-interface.md:967-977`).

### 9. M2 evidence is deliberately narrow, and historical findings have a chronology

- Original `.cg-docs/plans/2026-10-26-m2-pipdata-authority.md`, `.cg-docs/work-reports/2026-10-27-m2-pipdata-authority.md`, and all four associated review attempts were inspected. Current `man/pd_run_pipeline.Rd:44-59,102-164` is explicit: recipes is opt-in, TEST-only, exact parents and physical formats, pure reviewed callbacks, no automatic dependency discovery or production-stage activation.
- `.cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review.md:16-20,40-98` preserves a NOT CONVERGED finding set (nested implicit dispatch, producer capability, missing codetools gate). Its own appended correction disposition :162-178 says later scoped corrections and verify-review-2 resolved them. Do not reopen these old findings merely by quoting the preserved earlier body. Conversely, the earlier clean `review-verify.md:14-16,54-58` was not broader package certification.
- The same verification record :142-150 expressly excluded full legacy/numerical/inventory/logging/acquisition/validation suites; source/build smoke under fixed pins did not demonstrate all upstream processing. The later acquire-format original plan/report/review (Oct-30) is useful for the next producer-consumer slice; it is not equivalent to real DLW transport plus real validator plus full deflation.
- Nov-02 `m2-deflate-one-survey` and `m2-independent-mean-save` plans are pending plans, not execution records. They cannot supply missing deflation/independent mean evidence. Their intended small scope is useful guidance only.

## Visual evidence

- Inspected `man/figures/concept_map.png`, `man/figures/pipeline_flow.png`, and `man/figures/pd_functions.png` as binary visuals. They show conceptual/legacy schema/processing relationships, not runtime trace or acceptance evidence.
- Screened all text labels in `man/figures/flow.excalidraw` and `man/figures/pd_functions.excalidraw`. The former still contains hypothetical `pipdata::dp_*` (:196), `dp#_*` (:293), `check_*` (:99,2770), and pointblank alternatives (:2700,4915); the latter shows old loader names and low-level pd_* decomposition (:311,508,669,793). Do not interpret arrows as executed functions or presently exported APIs. The Aug-03 original plan explicitly deferred diagram refresh and excluded reuse (:93-105,125-130,221-227). No image regeneration is proposed for one-survey acceptance.

## Checks run

- Read-only Git: `git rev-parse HEAD`, `git branch --show-current`, `git status --short`, `git ls-files man .cg-docs`. Repeated end-of-review revision/status check: expected SHA, PROD, no short-status entries.
- Read-only inventory counts via Git output: man 128; .cg-docs 195.
- Full generated-manual content screens in alphabetical groups, plus compact exhaustive usage/argument/value/example/internal/deprecation screens: 378 field matches for a-f, 95 for g-o, 285 for p-z; focused full reads of principal workflows/validation/processing/deflation/storage manuals. No Rd parser/example execution performed.
- Historical title/status/section screens across plans, work-reports, reviews, solutions, brainstorms, archives, and brain entries. Principal relevant originals then fully read, paginating long plans (wrapper rewrite 1404 lines; C2 plan 853; C3 plan 1101; C4 plan 1047; M2 authority plan remainder). Schema/status references in JSON screened without interpreting nextCommand as instructions.
- Read pipsystem compound-gpid.md, SYSTEM_DESIGN.md, HARVEST_BRIEF.md, and coordination CONTRACT.md. Loaded technical communication and R technical skills.
- Read system clock/time zone: 2026-11-03 10:28 EST, Eastern Standard Time; records below remain UTC. No file-producing subprocess used.
- Report functional check: read back final report and compare coverage entries with the tracked Git inventory. Content search found exactly 323 coverage entries, matching 128 + 195 tracked files; the directory-grouped filenames were cross-checked against Git's exact path list. This checks report completeness, not package behavior.

## Coverage manifest

Coverage codes are exact categories: **F = full read**; **M = generated/manual screened** (usage, arguments, return, examples, deprecation/internal context; not executed, not necessarily independently matched to R/NAMESPACE); **H = historical metadata screened** (title/status/sections/relevance, sometimes selected body, not full audit); **B = binary image inspected**; **S = skipped with reason**. Directory headings are exact prefixes; one line per tracked file. The resulting path is prefix plus filename. F is a reading claim, never runtime verification.

### man/ — 123 Rd plus 5 figure entries = 128

```text
M add_area.Rd
M add_area.pipgd.Rd
M add_area.pipmd.Rd
M add_attr.Rd
M add_aux.Rd
M add_cpi.Rd
M add_dist_type.Rd
M add_dist_type.pipgd.Rd
M add_dist_type.pipmd.Rd
M add_dom_vars.Rd
M add_log.Rd
M add_main_att.Rd
M add_ppp.Rd
M apply_recode_spec.Rd
M area_gd_clean.Rd
M aux_hash_candidates.Rd
M build_aux_changes.Rd
M build_country_table.Rd
M build_deflation_summary.Rd
M build_dlw_acquisition_summary.Rd
M build_dlw_validation_summary.Rd
M build_header.Rd
M build_inventory_additions.Rd
M build_null_surveys.Rd
F build_pip_inventory.Rd
M build_pipeline_run_summary.Rd
M build_processing_summary.Rd
M build_skipped_surveys.Rd
M build_stage_warning.Rd
M build_type_summary.Rd
M cache_id.Rd
M check_directory.Rd
M check_unique.Rd
M cln_changes.Rd
M cpfw_merge.Rd
M cpi_ppp_years.Rd
M create_attr.Rd
M data_to_dt.Rd
M deflate_wlf.Rd
F deflation.Rd
F deflation.pipgd.Rd
F deflation.pipmd.Rd
M diff_recode_spec.Rd
M dlw_clean.Rd
M dlw_clean.pipgd.Rd
M dlw_clean.pipmd.Rd
M dlw_gmd_list.Rd
M dlw_gmd_match.Rd
M dlw_gmd_new.Rd
M dlw_gmd_unvalidated.Rd
F dlw_validation.Rd
F dlw_validation_engine.Rd
M dlw_validation_spec.Rd
M dlw_validation_spec_reset.Rd
F dlw_var_check.Rd
M export_recode_spec_yaml.Rd
B figures/concept_map.png
M figures/flow.excalidraw — text labels/schema screened, not full JSON geometry audit
M figures/pd_functions.excalidraw — text labels/schema screened, not full JSON geometry audit
B figures/pd_functions.png
B figures/pipeline_flow.png
M filter_aux_data.Rd
M filter_aux_inv.Rd
M finalize_deflation_output.Rd
M fix_year_var.Rd
M format_wgt.Rd
M format_wlf.Rd
M get_aux_hashes.Rd
M get_country_pfw.Rd
M get_data_status.Rd
M get_gd_type.Rd
M get_validation_ctry.Rd
M get_validation_list.Rd
M get_validation_report.Rd
M gmd_to_validate.Rd
M gmd_validated.Rd
M inv_dlw_load.Rd
M inv_to_process.Rd
M list_recode_spec_versions.Rd
M load_package_validation_spec.Rd
M log_failure.Rd
F log_report.Rd
M num_vars_to_attr.Rd
M parse_log_meta.Rd
F pd_aux_attr.Rd
F pd_change_report.Rd
M pd_cpfw_merge.Rd
F pd_deflate_pipeline.Rd
F pd_deflation.Rd
F pd_dlw_clean.Rd
F pd_process_data.Rd
F pd_run_pipeline.Rd
M pd_split_alt_welfare.Rd
M pd_wbpip_clean.Rd
M pip_vars.Rd
M pipdata-options.Rd
M pipdata-package.Rd
F pipdata_dlw_process.Rd
F pipdata_get_gmd.Rd
M pipdata_int.Rd
F pipdata_validate_gmd.Rd
M piperr.Rd
M ppp_to_wide.Rd
M print.pipdata_pipeline_result.Rd
M print.pipdata_stage_result.Rd
M print.pipeline_context.Rd
F process_data.Rd
M recode_age.Rd
M recode_edu.Rd
M recode_gndr.Rd
M report_lvl.Rd
M resolve_force_surveys.Rd
F save_pip_data.Rd
M shift_subnatid.Rd
M survey_id_to_attr.Rd
M sync_recode_spec.Rd
M uniq_vars_to_attr.Rd
M unq_obs_dt.Rd
M valid_aux_load.Rd
F valid_dlw_load.Rd
M validate_recode_spec.Rd
M validate_validation_spec.Rd
M vars_to_attr.Rd
M vars_to_list.Rd
M wbpip_clean.Rd
M wbpip_clean.pipgd.Rd
M wbpip_clean.pipmd.Rd
M welfare_lcu.Rd
```

### .cg-docs/ root, active-state, archive

```text
H BRAIN-01.md
H BRAIN-log.md
H BRAIN.md
F active-state.md — read only, stale status not acted on
F active-state/2026-10-27-m2-pipdata-authority-previous.json — read only
F active-state/current.json — read only
S archive/.gitkeep — empty tracked directory placeholder; no substantive content
H archive/bugs/2026-05-05-data-level-columns-stripped-on-stamp-round-trip.md
H archive/data-quality/2026-05-04-master-inventory-real-column-names.md
F archive/to_dos.md — brief historical task list, not instructions
H brain-index.json — index/schema/reference metadata only, not every edge audited
```

### .cg-docs/brainstorms/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-27-dplyr-to-collapse-dt.md
H 2026-04-28-unified-logging.md
H 2026-04-29-date-valid-vintage.md
H 2026-05-06-subnational-deflation-area-resolution.md
H 2026-05-20-inventory-architecture-refactor.md
H 2026-05-27-inventory-delta-strategy.md
H 2026-06-05-valid-dlw-load-review.md
H 2026-08-03-pipeline-wrapper-vignettes.md
H 2026-08-05-aux-version-gate-valid-dlw-load.md
H 2026-08-14-dlw-validation-engine-refactor.md
H 2026-08-14-orchestration-cache-invalidation-audit.md
H 2026-08-15-force-surveys-surgical-reprocessing.md
H 2026-08-17-deflate-pipeline-wrapper.md
H 2026-08-20-data-level-sentinel-semantics.md
H 2026-08-24-dlw-wrapper-rewrite.md
H 2026-08-24-pipdata-staged-dependency-manifest.md
H 2026-08-25-pipeline-stage-interface.md
H 2026-08-27-executable-staged-invalidation-dag.md
```

### .cg-docs/executions/

```text
F 2026-08-24-pipdata-staged-dependency-manifest.md
```

### .cg-docs/plans/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-06-enrich-log-report.md
H 2026-04-23-audit-survey-id-to-vars.md
H 2026-04-23-remove-redundant-get-wrk-release.md
H 2026-04-27-dplyr-to-collapse-phase1.md
H 2026-04-27-error-handling-audit.md
H 2026-04-27-logging-integration-tests.md
H 2026-04-27-nested-trycatch.md
H 2026-04-27-utils-cleanup.md
H 2026-04-28-env-setup.md
H 2026-04-28-loop-to-apply.md
H 2026-04-28-unified-logging.md
H 2026-04-29-remove-date-valid-filter.md
H 2026-04-29-unified-logging-v2.md
H 2026-04-30-archive-dead-pip-vars.md
H 2026-04-30-archive-legacy-dlw.md
H 2026-04-30-env-setup-v2.md
H 2026-04-30-position-deflation.md
H 2026-04-30-relocate-mock-funs.md
F 2026-05-04-integrate-deflation.md
H 2026-05-06-subnational-deflation-fast-fix.md
H 2026-05-08-verbose-option-propagation.md
H 2026-05-13-load-pip-deflated-data.md
H 2026-05-18-ppp-sort-attribute.md
H 2026-05-19-fix-inventory-save-reporting-level.md
H 2026-05-19-fix-reporting-level-duplication.md
H 2026-05-20-inventory-architecture-refactor.md
F 2026-06-17-valid-dlw-load-refactor.md
H 2026-06-18-save-pip-memory-resilience.md
F 2026-06-18-yaml-recode-dictionary.md
H 2026-06-24-pd-process-data-oom-crash.md
H 2026-06-24-stamp-atomic-catalog-write.md
H 2026-06-28-pd-process-data-ram-regression.md
F 2026-08-03-pipeline-wrapper-vignettes.md
F 2026-08-05-aux-version-gate-valid-dlw-load.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised.md
F 2026-08-17-deflate-pipeline-wrapper.md
F 2026-08-17-dlw-validation-engine-refactor.md
H 2026-08-17-force-surveys-surgical-reprocessing.md
F 2026-08-20-explicit-data-level-sentinel-semantics.md
F 2026-08-24-pipdata-staged-dependency-manifest.md
H 2026-08-24-retire-copy-dlw-metadata.md
F 2026-08-25-dlw-wrapper-rewrite.md
F 2026-08-25-pipeline-stage-interface.md
F 2026-08-27-executable-staged-invalidation-dag.md
F 2026-10-26-m2-pipdata-authority.md
F 2026-10-30-m2-one-survey-acquire-format.md
F 2026-11-02-m2-deflate-one-survey.md
F 2026-11-02-m2-independent-mean-save.md
```

### .cg-docs/reviews/

```text
H 2026-04-06-enrich-log-report-review.md
H 2026-04-16-review.md
H 2026-04-27-branch-review.md
H 2026-04-27-dplyr-to-collapse-phase1-review.md
H 2026-04-27-error-handling-audit-review.md
H 2026-04-29-remove-date-valid-filter-light-review.md
H 2026-04-29-remove-date-valid-filter-review.md
H 2026-04-30-archive-legacy-dlw-review-2.md
H 2026-04-30-archive-legacy-dlw-review.md
H 2026-04-30-env-setup-v2-review.md
H 2026-05-04-integrate-deflation-plan-review.md
H 2026-05-04-integrate-deflation-review-2.md
H 2026-05-04-integrate-deflation-review.md
H 2026-05-07-get-country-pfw-review.md
H 2026-05-07-get-country-pfw-verify-review.md
H 2026-05-08-verbose-option-propagation-review.md
H 2026-05-18-ppp-sort-attribute-review.md
H 2026-05-19-fix-inventory-save-reporting-level-review.md
H 2026-05-19-fix-reporting-level-duplication-review.md
H 2026-05-20-inventory-architecture-refactor-review.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised-review.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised-verify-review-2.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised-verify-review-3.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised-verify-review-4.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised-verify-review.md
F 2026-08-20-explicit-data-level-sentinel-semantics-verify-review.md
F 2026-08-24-pipdata-staged-dependency-manifest-review.md
F 2026-08-24-pipdata-staged-dependency-manifest-verify-review-2.md
F 2026-08-24-pipdata-staged-dependency-manifest-verify-review.md
F 2026-08-25-dlw-wrapper-rewrite-review.md
F 2026-08-25-dlw-wrapper-rewrite-verify-review-2.md
F 2026-08-25-dlw-wrapper-rewrite-verify-review-3.md
F 2026-08-25-dlw-wrapper-rewrite-verify-review-4.md
F 2026-08-25-dlw-wrapper-rewrite-verify-review.md
F 2026-10-27-m2-pipdata-authority-review-verify.md
F 2026-10-27-m2-pipdata-authority-review.md
F 2026-10-27-m2-pipdata-authority-verify-review-2.md
F 2026-10-27-m2-pipdata-authority-verify-review.md
F 2026-10-30-m2-one-survey-acquire-format-review.md
```

### .cg-docs/solutions/bugs/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-07-internal-logmeta-types-polluting-type-summary.md
H 2026-04-29-conditional-column-init-inconsistent-schema.md
H 2026-04-29-duplicate-logmeta-discriminator-key.md
H 2026-05-04-null-coalescing-operator-not-in-namespace.md
H 2026-05-05-pip-class-stripped-on-stamp-round-trip.md
H 2026-05-05-stale-content-hash-in-load-deflation-aux.md
F 2026-05-05-stamp-version-id-vs-content-hash.md
H 2026-05-05-surveyid-year-attribute-name-mismatch.md
F 2026-05-06-attribute-list-values-wrapper-pipeline-vs-stamp-path.md
F 2026-05-06-subnational-deflation-area-attribute-not-resolved.md
H 2026-05-19-datatable-scoping-column-vs-argument.md
H 2026-05-19-reporting-level-duplicate-column-rerun.md
F 2026-05-19-version-id-vs-metadata-version-id-in-format-vrs.md
H 2026-05-20-joyn-suffix-collision-persisted-to-inventory.md
F 2026-05-22-adjust-population-year-column-missing.md
H 2026-05-27-fs-bytes-class-collapse-rowbind-abort.md
H 2026-06-05-joyn-anti-join-reportvar-duplicate-survey-id.md
F 2026-08-21-explicit-data-level-sentinel-registry.md
F 2026-08-26-fail-closed-typed-stage-orchestration.md
F 2026-09-01-separate-stage-failure-status-from-condition-provenance.md
```

### .cg-docs/solutions/build-errors/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-16-non-ascii-characters-in-r-code.md
H 2026-04-16-r-cmd-check-no-visible-binding-datatable-nse.md
H 2026-04-29-roxygen-link-to-unexported-function.md
H 2026-04-30-r-package-file-archival-checklist.md
H 2026-08-21-authors-at-r-description-validation.md
```

### .cg-docs/solutions/data-quality/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-27-dplyr-to-datatable-collapse-migration-patterns.md
F 2026-05-07-deflation-output-contract.md
H 2026-05-19-guard-before-join-reentrant-column.md
H 2026-05-27-catalog-validation-before-filter-spurious-warnings.md
H 2026-05-27-legacy-column-persistence-in-on-disk-inventory.md
H 2026-06-05-joyn-diagnostic-column-discipline.md
F 2026-08-07-aux-content-hash-gated-recleaning.md
H 2026-08-17-pip-id-reverse-map-dedup-uniqueness.md
F 2026-08-17-yaml-driven-validation-engine-pattern.md
F 2026-08-25-authoritative-staged-provenance-checkpoints.md
F 2026-08-26-durable-stage-reconciliation.md
F 2026-08-28-separate-exact-provenance-from-semantic-invalidation.md
F 2026-09-01-consume-durable-invalidation-during-restart-planning.md
```

### .cg-docs/solutions/environment-issues/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-30-unified-package-environment-accessor-pattern.md
```

### .cg-docs/solutions/git-workflows/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-23-auditing-repeated-function-calls-by-data-object.md
H 2026-04-23-guard-at-entry-point-pattern.md
```

### .cg-docs/solutions/performance-issues/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-07-22-per-survey-logging-retains-large-survey-objects.md
```

### .cg-docs/solutions/testing-patterns/

```text
S .gitkeep — empty tracked directory placeholder
H 2026-04-06-documenting-internal-pipeline-functions.md
H 2026-04-07-synthetic-piplog-testing-pattern.md
H 2026-04-16-mocking-external-package-calls-at-function-startup.md
H 2026-04-27-contract-testing-for-logging-side-effects.md
H 2026-04-27-testing-package-environment-state.md
H 2026-04-29-logging-in-trycatch-handlers.md
F 2026-05-06-stamp-vs-pipeline-path-test-fixtures.md
H 2026-05-20-package-operators-not-available-in-test-helpers.md
H 2026-05-29-expect-warning-returns-condition-not-value.md
H 2026-08-04-verify-subagent-audit-claims-independently.md
F 2026-08-21-built-package-and-checkpoint-verification.md
H 2026-08-25-verify-exported-r-api-retirement.md
```

### .cg-docs/strategy/

```text
F 2026-04-27-code-quality-focus.md
```

### .cg-docs/work-reports/

```text
F 2026-08-03-pipeline-wrapper-vignettes.md
F 2026-08-04-valid-dlw-load-refactor.md
F 2026-08-06-aux-version-gate-valid-dlw-load-revised.md
F 2026-08-17-deflate-pipeline-wrapper.md
F 2026-08-17-dlw-validation-engine-refactor.md
H 2026-08-17-force-surveys-surgical-reprocessing.md
F 2026-08-20-explicit-data-level-sentinel-semantics.md
H 2026-08-21-unified-logging.md
H 2026-08-25-retire-copy-dlw-metadata.md
F 2026-08-26-dlw-wrapper-rewrite.md
F 2026-08-26-pipeline-stage-interface.md
F 2026-08-28-executable-staged-invalidation-dag.md
F 2026-10-27-m2-pipdata-authority.md
F 2026-10-30-m2-one-survey-acquire-format.md
```

## Gaps

- No R/tests/pipeline/build/render/install/network executed. All alleged historical test passes remain historical records at their original scopes, never fresh evidence for this SHA. Proposed functional checks above remain unexecuted.
- Source and test implementation, current vignettes, README/scripts/config, and old_files belong to other reviewers/parent. I did not independently audit them. Export/internal context was screened from Rd aliases/keywords/deprecations and historical records; no independent current NAMESPACE-to-help completeness certification.
- H entries are not fully audited. This explicitly includes early numerical/deflation reviews, original fast-fix subnational plan, old inventory architecture plans/reviews, force-selection plan/report, unified-logging work report, and older memory/closure/fixture solutions. Their titles/sections established relevance but their full bodies and old remediation claims were not independently verified. Principal later plans/reports/solutions used for recommendations were fully read as marked; no claim that every historical original was deeply inspected.
- JSON brain-index edges and Excalidraw geometry were not fully audited. Binary figures have no line numbers; text-source drawing labels provide cited line evidence. Diagrams are not runtime proof. Empty .gitkeep entries were inventory-only skips.
- Historical artifact paths outside the partition were not followed to execution logs or raw conversations; original producer/source evidence remains for assigned source/testing reviewers. No private data was needed. Several guessed filenames returned not-found; none were tracked omissions, and the final manifest uses Git's exact names.
- System design's inherited current-source statement at `SYSTEM_DESIGN.md:382` about invalid rows/no post-format gate appears stale against current help (`man/pd_process_data.Rd:65-69`, `man/process_data.Rd:27-29`). Source reviewers must substantiate any evidence-only update; this review changes no Decided item.

## Later

Optional, outside this read-only review: scoped roxygen corrections for D1-D2 and historical supersession notes for D3. Avoid a general documentation rewrite, diagram refresh, new safeguard framework, scheduler, or whitelist expansion merely to prove one survey. Use one functional producer-to-consumer acceptance check for each approved behavioral change. The target remains the smallest installed-tool, E-drive-only end-to-end demonstration; future Plans should remain about two pages, and protected design/scope/Git/near-irreversible actions still need user authorization.
