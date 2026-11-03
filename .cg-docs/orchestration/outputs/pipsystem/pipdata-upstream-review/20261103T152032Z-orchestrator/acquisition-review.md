---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:26:37Z
owner: pip-orchestrator - persisting read-only acquisition reviewer result
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: NONE
next: Parent uses these static findings to scope upstream acceptance; no package execution is authorized.
---

# Acquisition and validation source review

## Summary
Read-only worker reports all 12 assigned source files (9,485 lines) plus DESCRIPTION/NAMESPACE read. The explore role forbids file writes and denied Git; the coordinating parent creates this record and independently verified the package SHA/branch/clean status before delegation. Findings remain static source evidence, not executed failures.

## Findings
All source references below are relative to E:/PovcalNet/01.personal/wb384996/PIP/pipdata. This is a synthesized evidence record, not a copied conversation.

1. The useful internal one-survey path exists: .resolve_m2_one_survey_selection validates explicit filename/identity/module/version/checksum pins (R/pipdata_dlw_compare.R:1167-1289); .acquire_and_validate_m2_one_survey selects acquisition and checks completed valid/available status before cleaning (R/pipdata_get_gmd.R:1429-1489). The convenience helper always fetches the catalog at :1437, so an offline acceptance needs lower existing seams or a narrow transport/catalog injection, not a mocked validator.
2. Selection is not storage isolation. Acquisition preserves unrelated rows (get_gmd:1145-1169), while validation scans histories, reconciles inventory/report state, and only then restricts workers (R/pipdata_validate_gmd.R:1209-1343,1538-1555). Fixed validation artifact IDs require isolated aliases/root, not just a custom acquisition inventory ID.
3. Source pinning does not prove transport integrity. Catalog keys/checksums are validated (R/pipdata_dlw_compare.R:121-165,232-250), but .acquire_one_gmd accepts any return other than a caught condition or dlw_call_list as success; no local checksum calculation is visible (R/pipdata_get_gmd.R:503-567). Guarantees inside dlw/pipload remain UNKNOWN. No transport was exercised.
4. The real validator needs explicit expected-result cases. is_greaterthanzero and is_greaterequale0 use existential any() expressions and allow an NA branch, rather than checking every relevant value (R/pipdata_dlw_validation.R:904-917,929-943). For x=c(-1,1), the positive branch is true by source reasoning. This is not an executed module failure; actual YAML activation must be checked by the processing review.
5. Validation schema and runtime dispatch can disagree: globally permitted check names are broader than category-specific switches, whose fallback leaves the chain unchanged (validation.R:149-202,285-315,407-471). A single-variable is_numeric entry is an example of a permitted but inert combination. Whether current YAML uses such a combination is not established by this partition.
6. Category helper descriptions also need care: check_urban and check_gender inspect unique values against 1/2 or NA, not a count of reporting levels/categories (validation.R:850-865,878-892). Do not accept messages as proof of all implied constraints.
7. Stage success means completed work, not necessarily a valid survey. Engine error rows produce status invalid, warnings alone valid (validate_gmd.R:628-647); completed invalid rows may coexist with a successful validation stage (validate_gmd.R:275-294,1039-1075,1652-1655). The selected-survey eligibility gate correctly inspects status valid (get_gmd.R:1471-1480). Acceptance must assert that row/report result, not merely outcome success.
8. Consumers do not explicitly pin the validated source version: .validate_one_gmd loads current data and reads current st_info separately (validate_gmd.R:593-609,667-691); inv_dlw_load reads only by survey_id (R/inv_dlw_load.R:14-25). This is a source-level exact-version gap, not proof of a race or wrong data. Immutable isolated input can establish a bounded acceptance without new concurrency infrastructure.
9. Legacy retry/currentness logic remains evidence, not target authority. Completion is keyed by survey/checksum and does not automatically include validator-code/spec changes (compare.R:749-780; validate_gmd.R:1652-1655). valid_dlw_load combines local content/aux checks and force candidates (R/valid_dlw_load.R:120-165,197-210,253-392). Its missing-historical-hash handling differs from its own description (:50-57,750-758 versus :799-803,837-856). Do not adopt this as approved rerun policy; SYSTEM_DESIGN.md:186-203,307 assigns rebuild decisions to stamp.
10. Public wrapper setup has side effects even with stages disabled: working release and pip_deflated/piplog initialization, plus checkpoint attempts (R/pipdata_dlw_process.R:681-715,905-917). Prepared stage cores also save/checkpoint and are not pure formatters (R/pipeline_stage_cores.R:140-273,315-498). An acceptance runner must bind all those paths on E before package loading.
11. Result contracts differ deliberately: DLW uses six-field plain results, clean/metadata use pipdata_stage_result, and aggregate pipeline slots exclude acquisition/validation (get_gmd.R:288-301; validate_gmd.R:301-314; pipeline_run_result.R:1-3,99-138). No API/result unification is required merely for acceptance.
12. Source examples include non-callable documentation anchors dlw_validation/dlw_var_check, deprecated path-string validator examples and report helpers given unsupported positional arguments (R/pipdata_dlw_validation.R:353-360,586-588,601-610,794-800; R/pipdata_validation_report.R:94-109,168-180). Treat them as candidates for targeted correction, not execution recipes.

## Minimum acceptance reuse
Reuse the selected-source resolver, source loader, real validation engine/accumulator, actual cleaning worker and stored-result readback. Offline substitution should stop at the catalog/download boundary; selected valid status and invalid no-clean/no-save behavior must be real. Separate a live DLW check from offline acceptance. Any narrow seam or selected validator fix gets one concrete valid/invalid expected-result check. Exact source-version loading, if promised, needs a two-version readback check, not a general concurrency rewrite. Broad result unification, general dependency discovery and unrelated deprecated-helper cleanup belong under Later.

## File coverage
Read-only worker reports full paginated reads of every assigned R file. Counts are reported source lengths, not test results.

| File | Full read lines |
|---|---|
| R/pipdata_dlw_compare.R | 1-1289 |
| R/pipdata_get_gmd.R | 1-1489 |
| R/pipdata_validate_gmd.R | 1-1932 |
| R/pipdata_dlw_validation.R | 1-1018 |
| R/pipdata_dlw_process.R | 1-919 |
| R/valid_dlw_load.R | 1-882 |
| R/inv_dlw_load.R | 1-192 |
| R/pipeline_stage_cores.R | 1-499 |
| R/pipeline_stage_result.R | 1-593 |
| R/pipeline_context.R | 1-144 |
| R/pipeline_run_result.R | 1-283 |
| R/pipdata_validation_report.R | 1-245 |
| DESCRIPTION | 1-51 |
| NAMESPACE | 1-87 |

## Changes
Only this report, persisted by parent. No package work was executed.

## Checks run
Completed source inspection by the assigned reviewer; read-only Git provenance independently observed by parent. No source findings were executed as tests. Parent persisted the returned facts, not the transcript.

## Gaps
Reviewer could not write or independently run Git because of role restrictions; parent persistence/provenance resolves that report blocker, not the unexecuted source findings. No package loads/tests, downloads, network, pipeline or live data validation. YAML contents, external transport/storage implementations, processing/test behavior and current numerical outcomes remain outside this partition; other review reports cover their own scope.
