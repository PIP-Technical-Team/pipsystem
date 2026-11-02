---
schema: pip-handoff-v2
project: pipdata
task: m2-one-survey-acquire-format
run: 20261030T163045Z-pipdata
status: completed
updated: 2026-10-30T17:53:30Z
owner: pipdata-agent
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.kilo/worktrees/m2-phase-2-steps-5-and-6
branch: feat/m2-one-survey-acquire-format
head: 7f4a98471d9c2350c3537fcae8448856896cd9f9
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.kilo/worktrees/m2-phase-2-steps-5-and-6/.cg-docs/plans/2026-10-30-m2-one-survey-acquire-format.md
next: Review uncommitted changes on feat/m2-one-survey-acquire-format and proceed to M2 Phase 3 (deflate-and-merge-auxiliary and pipster mean calculation)
---

# M2 Phase 2 Steps 5 and 6: One-Survey Acquire and Format-Validate

## Summary
Completed M2 Phase 2 Steps 5 (`download-one-survey`) and 6 (`format-and-validate-one-survey`) in `pipdata` on branch `feat/m2-one-survey-acquire-format` from `PROD` (`7f4a98471d9c2350c3537fcae8448856896cd9f9`). Created and validated the local Plan, resolved all `@cg-plan-critic` findings (P1-P3), implemented Phase 1 and Phase 2, ran all 9 `review:auto` agents plus `@cg-adversarial`, resolved all 11 code review findings (P1-P3) via `/cg-fix-triage`, and verified clean closure via `/cg-review mode:verify`. All changes remain uncommitted on `feat/m2-one-survey-acquire-format` as instructed.

## Changes
- `R/pipdata_dlw_compare.R`: Added `.resolve_m2_one_survey_selection()` validating explicit single-survey module-bearing selections (`country_code`, `surveyid_year`, `survey_acronym`, `welfare_type`, `module`, `FileName`, `Checksum`, `Vermast`, `Veralt`), verifying parsed `FileName` identity via `pipload::survey_id_to_vars()`, preserving DLW source `survey_id`, and deriving expected clean `pip_id` (`<COUNTRY>_<YEAR>_<ACRONYM>_<INC|CON>_<MODULE>`).
- `R/pipdata_get_gmd.R` & `R/pipdata_validate_gmd.R`: Extracted `.pipdata_get_gmd_core(..., selected_filenames = NULL, server_catalog_override = NULL)` and added `selected_survey_ids = NULL` to `.pipdata_validate_gmd_core()`; added `.acquire_and_validate_m2_one_survey()` to acquire and validate only the explicitly selected pinned survey while preserving unrelated prior inventory rows and gating failed/unavailable/mismatched downloads before validation and clean execution.
- `R/dependency_execution.R`: Updated `.filter_completed_dlw_validation_inventory()` to retain only `status == "valid" & data_available == "Yes"` rows (resolving `notes/pipdata.md:95` / `SYSTEM_DESIGN.md:209-213`).
- `R/pd_dlw_clean.R`: Added active post-format validation (`pd_validate_clean_output()` and `.validate_clean_survey()`) and pre-`wbpip_clean` checks in `format_wgt()` and `format_wlf()` enforcing `data.table` + `pipmd`/`pipgd` inheritance, finite non-missing double `welfare` (converted to LCU/day via `welfare / 365`) and `weight` (`>= 0`, `sum > 0`), scalar identity/domain attributes, and non-empty `area` values for subnational (`"area"`) domains.
- `R/pd_process_data.R`, `R/pipeline_stage_cores.R`, `R/code_fingerprint.R`, `R/save_pip.R`, `R/pd_change_report.R`, `man/*.Rd`: Added `.assert_clean_eligible_inv_row()` and `pd_validate_clean_output()` calls before saving in `pd_execute_clean()` and `process_data()`, added `"pipdata_clean_validation_error"` to `.PD_CLEAN_RECOVERABLE_CLASSES`, registered new helpers in `.PD_FINGERPRINT_COMPONENTS$clean`, prevented `invariant` columns from shadowing clean receipt `content_hash`/`version_id`, normalized `pd_save_receipt()` `error` field to `NA_character_`, and updated roxygen comments and `.Rd` files.
- `tests/testthat/test-m2-one-survey-acquire-format.R`, `tests/testthat/test-dependency-execution.R`, `tests/testthat/test-pd_process_data.R`, `tests/testthat/test-code-fingerprint.R`, `tests/testthat/test-dependency-inputs.R`: Added comprehensive unit and integration tests for Steps 5 and 6 and updated existing fixtures that previously expected `status == "invalid"` rows to pass `.filter_completed_dlw_validation_inventory()`.

## Checks run
- `cg-render-artifact --automatic ".cg-docs/plans/2026-10-30-m2-one-survey-acquire-format.md"`: exit 0 (`HTML disabled; validated .cg-docs/plans/2026-10-30-m2-one-survey-acquire-format.md`).
- `tools::parse_Rd()` on `man/pd_process_data.Rd`, `man/pd_change_report.Rd`, `man/process_data.Rd`: exit 0.
- `Rscript` `testthat::test_file()` suite on `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.tmp` with Phase 2 dependency overlay (`stamp` 0.1.0 at `4a1fa5d`, `pipload` at `4ef0d90`):
  - `test-m2-one-survey-acquire-format.R`: 0 FAIL, 84 PASS
  - `test-dependency-execution.R`: 0 FAIL, 50 PASS
  - `test-pd_process_data.R`: 0 FAIL, 31 PASS
  - `test-code-fingerprint.R`: 0 FAIL, 37 PASS
  - `test-dependency-api-contract.R`: 0 FAIL, 56 PASS
  - `test-dependency-inputs.R`: 0 FAIL, 37 PASS
  - `test-pipdata_get_gmd.R`: 0 FAIL, 151 PASS
  - `test-pipdata_validate_gmd.R`: 0 FAIL, 185 PASS
  - `test-pipdata_dlw_compare.R`: 0 FAIL, 52 PASS
  - `test-pd-change-report.R`: 0 FAIL, 27 PASS
- `/cg-review mode:verify`: 0 open findings (all 11 review findings verified fixed).

## Gaps
- Changes are intentionally left uncommitted on branch `feat/m2-one-survey-acquire-format` per instructions.
- Live DLW server and `Y:` drive integration were not exercised (all tests used isolated local fixtures on `E:`).
- M2 Phase 3 (`deflate` stage `welfare_YYYY` column rename and `pipster` mean calculation) and Phase 4 (test release manifest) remain for subsequent steps in the umbrella walking skeleton.
