# pipapi: M1 Evidence

## Scope And Provenance

This note answers only I1, the release input contract (`HARVEST_BRIEF.md:114-116` @D). It is not a function inventory.

Citation tags identify full commit SHAs. Every citation below uses one of these tags:

| Tag | Repository | Full HEAD SHA |
|---|---|---|
| @P | `E:\PovcalNet\01.personal\wb384996\PIP\pipapi` | `280af151d05902a550d5dea18cd4bf1a3d013239` |
| @D | `E:\PovcalNet\01.personal\wb384996\PIP\pipsystem\.kilo\worktrees\docs-m1-harvest-8658eaafa47c46e5` | `84c384f78ed44bcb96bb19c6d364519df5b5db6f` |

Collection date: 2026-10-07. The following are direct command observations, not claims from package files:

- `git rev-parse HEAD` returned the SHAs above.
- In the package, `git status --short --untracked-files=all` returned no entries. The source checkout was clean.
- `git ls-files -- <cited paths>` confirmed that all cited package source and test files were tracked. `git diff HEAD -- <cited paths>` returned no output. The cited text matches package HEAD; there is no dirty-source attribution to @P.
- In the evidence worktree, the initial status contained only ` M .gitignore`. This existing change was not changed. The six requested project documents were tracked, and their path-scoped `git diff HEAD` returned no output. Their cited text matches @D.
- No package README was read. No R tests, builds, API requests, or cache operations were executed. Test statements below are test-source evidence only, not pass results.

The source establishes names and columns that consumers use. It does not establish a complete release schema with types, null rules, or enforced uniqueness for every file. Such fields are marked UNKNOWN below rather than inferred from names.

## I1. Input Contract

### Release Selection

- The API builds one lookup per selected release directory, keeps the full directory names as versions, and sets `latest_release` to the first sorted version (`R/create_lkups.R:8-32,40-67` @P).
- The default directory regex is `\d{8}_\d{4}_\d{2}_\d{2}_(PROD|TEST|INT)$`. Sorting places PROD before INT before TEST; each group sorts in decreasing text order (`R/create_lkups.R:819-836,932-945` @P).
- The new lineup path is selected when the first eight characters give a date strictly after `2025-05-01`. The `pip()` wrapper selects the new or old path from this lookup flag (`R/create_lkups.R:999-1010`; `R/pip.R:61-94` @P). The files below therefore distinguish all releases from new-path releases.

### Files Read At Lookup Creation

Paths are relative to one release folder. FST means `fst::read_fst()`; RDS means `readRDS()`. All entries in this table are unconditional reads unless the condition says new path. This follows the calls in `R/create_lkups.R:79-123,145-147,189-241,406-477` @P and `R/valid_years.R:8-20` @P.

| Relative file | Format / condition | Directly consumed columns, keys, or object shape | Evidence |
|---|---|---|---|
| `_aux/missing_data.fst` | FST / all; read again for new path | New-path selection takes `country_code`, `year` renamed to `reporting_year`, and `welfare_type`. If `welfare_type` is absent it becomes `consumption`. Old-path filters use `country_code`, `year`. Full old-path row schema: UNKNOWN. | `R/create_lkups.R:91-92,240-273,807-812`; `R/create_countries_vctr.R:139-149` @P |
| `_aux/country_list.fst` | FST / all | Requires `region`, renamed to `region_name`; new reference lookup joins by `country_code` as many-to-one. Country subsets use columns ending in `_code`. UI region filtering also consumes `region_code`, `africa_split_code`. | `R/create_lkups.R:95-97,313-323`; `R/pip_grp_new.R:112-137`; `R/get_aux_table.R:75-87` @P |
| `_aux/countries.fst` | FST / all | Requires `region`, renamed to `region_name`; survey and reference tables join by `country_code`. Consumers also use `region_code`. Full country/name schema: UNKNOWN. | `R/create_lkups.R:100-102,135-160`; `R/create_countries_vctr.R:88-105` @P |
| `_aux/regions.fst` | FST / all | `region_code` supplies valid region values. Old regional selection also uses `grouping_type`. | `R/create_lkups.R:105-106`; `R/utils-query.R:38-56`; `R/create_countries_vctr.R:55-84` @P |
| `_aux/pop.fst` | FST / all | New path expects wide data identified by `country_code`, `data_level`, with year columns. It pivots to `reporting_year`, `reporting_level`, `reporting_pop`; expects `national`, `urban`, `rural`; joins reference rows by country/year/level as one-to-one. For non-CHN rows it replaces urban and rural population with national population. | `R/create_lkups.R:110-111,325-369` @P |
| `estimations/prod_svy_estimation.fst` | FST / all | `cache_id` must match a file basename in `survey_data`; remaining rows get path `survey_data/<cache_id>.fst`. Join to countries: `country_code`. Survey calculation joins on file basename plus `reporting_level` as many-to-one and takes `survey_mean_ppp`, `survey_median_ppp`. Detailed metadata use is below. | `R/create_lkups.R:83-85,122-143`; `R/rg_pip.R:92-108` @P |
| `estimations/prod_ref_estimation.fst` | FST / all, including new path | Filter and path use `cache_id` just as for surveys. `interpolation_id` groups the constructed `cache_id` plus `reporting_level` strings. The interpolation list also takes `region_code`, `country_code`, `reporting_year`, `reporting_level`, `interpolation_id`. | `R/create_lkups.R:146-183,421-452` @P |
| `estimations/prod_refy_estimation.fst` | FST / new path | Country/year metadata. Distribution-type join uses `country_code`, `reporting_year`, `welfare_type`, `reporting_level` with a one-to-one match. API adds path `lineup_data/<country_code>_<reporting_year>.fst` and interpolation ID country/year/level. It filters to lineup years and positive, nonmissing `reporting_pop`. | `R/create_lkups.R:189-226,275-311,360-404` @P |
| `estimations/lineup_years.fst` | FST / new path | Column `lineup_years`, converted to a list member with that name, controls reference-year selection. | `R/create_lkups.R:228-238,373-378,667-671` @P |
| `estimations/lineup_dist_stats.fst` | FST / new path | `country_code`, `reporting_year` construct `file`; `min`, `max` are removed. Mean/median and distribution-statistic joins use `country_code`, `reporting_year`, `reporting_level` as many-to-one. Direct mean/median selection uses `mean`, `median`. | `R/create_lkups.R:406-416`; `R/utils-stats.R:26-43,338-348,370-377` @P |
| `estimations/dist_stats.fst` | FST / all | Survey statistic join uses `cache_id`, `reporting_level`; selected fields are `gini`, `polarization`, `mld`, `decile1` through `decile10`. Cached survey mean/median enrichment also selects `country_code`, `reporting_year`, `reporting_level`, `welfare_type`, `mean`, `survey_median_ppp`. | `R/create_lkups.R:454-456`; `R/utils-stats.R:44-60,349-377`; `R/pip_new_lineups.R:158-175` @P |
| `_aux/pop_region.fst` | FST / all | Loaded and included in lookup hashes. Column schema and calculation keys: UNKNOWN; the cited load/hash sites do not select them. | `R/create_lkups.R:458-460,708-750,776-782` @P |
| `_aux/country_profiles.rds` | RDS / all | A nested object: `$key_indicators` and `$charts` contain tables filtered by `country_code`; `$flat$flat_cp` joins on `country_code`, `reporting_year` and has `headcount_national`, which is divided by 100. Full nested schema: UNKNOWN. | `R/create_lkups.R:462-465`; `R/ui_country_profile.R:25-27,120-123,355-361` @P |
| `_aux/poverty_lines.fst` | FST / all | `poverty_line` is rounded to two decimal places. Default request lines select rows where `is_default == TRUE`. No uniqueness constraint is shown at these sites. | `R/create_lkups.R:467-472`; `R/utils-plumber.R:286-299` @P |
| `_aux/censored.rds` | RDS / all | List members `$countries`, `$regions`, each a table with `id`, `statistic`. Country ID is country/year/acronym/welfare type/reporting level joined with underscores. Region ID is region/year. `statistic == "all"` removes a row; other values name statistics to set to NA. | `R/create_lkups.R:474-477`; `R/utils-censor.R:22-47,63-87` @P |
| `_aux/interpolated_means.fst`, `_aux/survey_means.fst` | FST / all | `reporting_year` supplies sorted unique valid interpolated and survey years. These are also needed for new-path lookup creation. | `R/create_lkups.R:667-671`; `R/valid_years.R:8-20`; `R/get_aux_table.R:41-48` @P |

### Distribution Files And Metadata Keys

| Distribution input | Columns and processing contract | Evidence |
|---|---|---|
| `survey_data/<cache_id>.fst` | The API reads the FST file and expects numeric calculation vectors `welfare`, `weight`. `area` becomes `reporting_level`; a sole national metadata level sets `area = "national"` before the rename, so that case need not supply an existing `area` column. Metadata supplies `cpi`, `ppp` per reporting level, joined many-to-one. Calculation groups use file basename plus reporting level. | `R/utils-pipdata.R:274-321`; `R/compute_fgt_new.R:29-30,166-171`; `R/rg_pip.R:62-87,92-108` @P |
| `lineup_data/<country_code>_<reporting_year>.fst` | New path reads FST and adds `id` from basename without extension. It consumes `reporting_level`, `index`, `welfare`, `weight`, `cw`, `cwy`, `cwy2`, `cwylog`. `(id, reporting_level)` identifies a group; cumulative lookup requires one row per group/index. `findInterval()` requires ordered welfare in each group. Index zero must have zero cumulative values to support a poverty line below the first observation; positive indexes correspond to the ordered observations. | `R/create_lkups.R:275-294`; `R/fg_pip.R:62-113`; `R/fgt_cumsum.R:12-25,37-45,67-108,144-166,198-230,348-377` @P |
| Survey files for old-path lineup requests | The reader takes `welfare`, `weight`; for urban/rural it also takes `area`, filters that level, then removes `area`. The old lineup path supplies these data to the external `wbpip` calculation together with predicted PPP mean, LCU mean/median, PPP median, survey year, default PPP, and distribution type. | `R/utils-aux.R:25-55`; `R/fg_pip_old.R:64-112` @P |

The cumulative definitions are explicit in a synthetic test fixture: `cw = cumsum(weight)`, `cwy = cumsum(weight * welfare)`, `cwy2 = cumsum(weight * welfare^2)`, `cwylog = cumsum(weight * log(welfare))`, with an all-zero index-zero row. This is test-source evidence, not proof of the production writer (`tests/testthat/test-fgt_cumsum.R:27-66` @P). Nonpositive-welfare handling in actual release cumulative files is UNKNOWN.

The estimation files are wide metadata tables, not only survey identities or long statistic rows:

- Common filters consume `country_code`, `reporting_year`, `welfare_type`, `reporting_level`; national selection also consumes `is_used_for_aggregation`, and coverage selection can use `survey_coverage` (`R/utils-lkup.R:98-109,145-146,230-233,272-290` @P).
- Survey calculations consume metadata `cpi`, `ppp`, `survey_mean_ppp`, `survey_median_ppp`, as well as the generated file path (`R/utils-pipdata.R:274-294,319-321`; `R/rg_pip.R:93-108` @P).
- The reference table supplies `distribution_type`, `welfare_type`, and country/year/level for the new reference join. Old lineup calculations additionally consume `predicted_mean_ppp`, `survey_mean_lcu`, `survey_median_lcu`, `survey_median_ppp`, `survey_year`, `ppp` (`R/create_lkups.R:196-226`; `R/fg_pip_old.R:91-112` @P).
- New-path lookup preparation removes `monotonic`, `same_direction`, `mult_factor`, `nac`, `nac_sy`, `svy_mean`, `relative_distance` from refy; it removes the same fields except `mult_factor` from ref. These removal sites must be considered when producing compatible inputs; whether all are required by the external `gv<-` operation is UNKNOWN (`R/create_lkups.R:380-404` @P).
- Output selection expects metadata such as `survey_acronym`, `survey_coverage`, `survey_year`, `survey_comparability`, `comparable_spell`, `reporting_pop`, `reporting_gdp`, `reporting_pce`, `is_interpolated`, `estimation_type`, plus country/region names and codes. This is a merged-output requirement, not proof that each source file must contain all these columns (`R/create_lkups.R:479-528`; `R/pip_lineups_postprocess.R:40-55,88-95` @P).

### Files Read On Demand

| Relative input | Consumed shape and keys | Evidence |
|---|---|---|
| `_aux/framework.fst` | Selects `country_code`, `survey_acronym`, `surveyid_year`, `use_imputed`, `use_microdata`, `use_bin`, `use_groupdata`. Joins reference metadata by country/year ID/acronym as many-to-one. Distribution-type labels use group and imputed flags. | `R/utils-stats.R:107-141,146-192,390-399`; `R/get_aux_table.R:41-48` @P |
| `_aux/spr_svy.fst`, `_aux/spr_lnp.fst` | Statistic join key: `country_code`, `reporting_year`, `welfare_type`, `reporting_level`; values `spl`, `spr`, `median`. Survey and lineup paths choose their matching file. Loader errors return an empty typed table; this does not show that missing inputs preserve published results. | `R/utils-aux.R:69-89`; `R/utils-stats.R:260-283,298-322` @P |
| `_aux/pg_svy.fst`, `_aux/pg_lnp.fst` | Same four-column join key; value `pg`. Loader errors return an empty typed table. Country Profile charts also read `pg_svy` directly, without that fallback. | `R/utils-aux.R:129-147`; `R/utils-stats.R:230-248`; `R/ui_country_profile.R:125-143` @P |
| `_aux/metaregion.fst` | `region_code`, `lineup_year`; used for regional MRV and estimate-type labels, including WLD. Loader errors return an empty typed table. | `R/utils-aux.R:102-115`; `R/utils-lkup.R:202-207`; `R/utils-censor.R:109-126,161-170` @P |
| `_aux/survey_metadata.rds` | RDS table returned as supplied, optionally filtered by `country_code`. Other columns: UNKNOWN. | `R/ui_miscellaneous.R:8-15` @P |
| `_aux/<table>.fst` | Generic auxiliary endpoint sanitizes the requested name and reads that FST. Available public names derive from top-level `_aux/*.fst`, minus the blocklist. For `cpi`, `ppp`, `gdp`, `pce`, `pop`, optional long output melts wide columns using IDs `country_code`, `data_level`, with variable `year` and default value column. Other table schemas: UNKNOWN. | `R/create_lkups.R:657-665`; `R/get_aux_table.R:23-57`; `R/utils-query.R:253-255` @P |

### Cache-Related Reads In The Release Folder

These are separate from the upstream data tables:

- `cache.duckdb` can be read for intermediate results. Tables are `rg_master_file` and `fg_master_file`. Survey keys are `cache_id`, `reporting_level`, `poverty_line`; lineup keys are `interpolation_id`, `poverty_line`. Created schema has VARCHAR identity fields and DOUBLE `poverty_line`, `headcount`, `poverty_gap`, `poverty_severity`, `watts`, with a unique constraint on each key set. Live-data requests and custom PPP/popshare requests can bypass the cache (`R/duckdb_func.R:19-22,39-50,443-487,491-512,637-647` @P).
- The cache-v2 manifest requires `_aux`, `estimations`, `survey_data`, `lineup_data` directories. It hashes top-level auxiliary FST files, the three named auxiliary RDS files, six named estimation FST files, and top-level survey/lineup FST files. It optionally reads UTF-8 `data_update_timestamp.txt` as provenance, not data identity. Cache files are not in this input set (`R/cache-v2.R:88-109,118-151` @P).
- No cache read or write was executed for this harvest. Required deployed cache mode and complete cache deployment artifacts are UNKNOWN; they are not established by the release-data load sites above.

### PPP Conversion Site

**Survey path:** `rg_pip()` calls `load_data_list(metadata)`. That function groups metadata by path, builds reporting-level CPI/PPP rows, joins them to the survey distribution, and executes `welfare := welfare / (cpi * ppp)`. It then removes CPI and PPP from the loaded distribution. The conversion is in `R/utils-pipdata.R:319-321`, called from `R/rg_pip.R:62-63` @P. The old survey path has the same formula at `R/compute_fgt_old.R:106-108`, called from `R/rg_pip_old.R:53-54` @P.

This is an in-memory conversion during calculation, not a rewrite of the release FST at these sites (`R/utils-pipdata.R:297-321`; `R/rg_pip.R:62-87` @P). The API uses the literal `welfare` column. The cited readers do not select `welfare_YYYY` (`R/utils-pipdata.R:319`; `R/compute_fgt_new.R:166-171`; `R/utils-aux.R:35-47` @P).

**New lineup path:** `fg_pip()` reads `lineup_data` through `load_list_refy()`, then uses the supplied welfare and cumulative columns against the requested poverty line. Those sites do not apply CPI/PPP conversion. The consumer therefore requires values already on the poverty-line scale, consistent with PPP-scaled lineups; the production writer's actual units are UNKNOWN (`R/fg_pip.R:65-113`; `R/fgt_cumsum.R:67-108,348-377` @P).

**Old lineup path:** conversion and scaling are delegated to `wbpip:::prod_fg_compute_pip_stats()` with the supplied LCU/PPP means and default PPP. The exact formula inside that external package is UNKNOWN in this package-only harvest (`R/fg_pip_old.R:98-112` @P).

**Custom PPP limitation:** new survey and lineup functions accept `ppp` but use it to choose/bypass the cache; the survey load uses `metadata$ppp`, and the lineup reader has no PPP parameter. Thus the cited new-path calculation code does not apply a custom PPP to source welfare. This is source evidence, not a tested numerical result (`R/rg_pip.R:30,62-87`; `R/utils-pipdata.R:274-321`; `R/fg_pip.R:32,65-113`; `R/fgt_cumsum.R:348-377` @P).

### Incompatibilities With The Target

1. **PPP output needs an explicit release adapter until the API change.** Target stage 4 stores dynamically detected `welfare_YYYY` columns; the planned API change receives welfare already in PPP. The current reader uses LCU `welfare` and divides by CPI times PPP. Supplying PPP as `welfare` without changing the reader would convert twice; supplying only `welfare_YYYY` would omit the consumed column. The design explicitly keeps the current release format until this change (`SYSTEM_DESIGN.md:166,203,301-305` @D; `R/utils-pipdata.R:274-321`; `R/compute_fgt_new.R:166-171` @P). M5 places current-format release writing before the conversion change (`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:130-140` @D). No design change is proposed here.
2. **Minimal lineup distributions are not enough for the current fast path.** A release with only welfare and weight lacks the ordered indexes, sentinel, and cumulative fields that the new lineup consumer uses. Stage 8 must preserve these current inputs until an approved API change (`SYSTEM_DESIGN.md:180,305-306` @D; `R/fgt_cumsum.R:67-108`; `tests/testthat/test-fgt_cumsum.R:27-66` @P).
3. **A proposed long stage-5 table is not a direct API input.** Current statistics are wide fields joined by cache ID/level or country/year/level. If the Open long-output proposal is approved, stage 8 needs to map it to the present tables; the API source does not settle the proposal (`SYSTEM_DESIGN.md:170` @D; `R/utils-stats.R:26-60,338-377` @P).
4. **Serving every old release has a source-level validation risk.** `create_lkups()` adds `refy_lkup` only for the new path, but `pip()` calls validation for `new_pathway` before it chooses the old path. That validation requires `refy_lkup`, so an unmodified old lookup lacks a required field and is rejected. This conflicts with the target to serve every past release. It was not reproduced by execution (`SYSTEM_DESIGN.md:240,285` @D; `R/create_lkups.R:776-799`; `R/pip.R:57-67`; `R/validate_lkup.R:17-25,45-63,78-85` @P).

### Test-Source Evidence Only

No tests were executed. These assertions document intent and fixtures, not current pass status:

- Release regex, directory validity, PROD-first sorting, and the strict 1 May 2025 cutoff have source assertions (`tests/testthat/test-create_lkups.R:10-20,79-104,133-148,197-207` @P).
- A legacy missing-data fixture expects default `consumption` and the selected country/reporting-year/welfare columns (`tests/testthat/test-create_lkups.R:154-161` @P).
- Cumulative fixtures define the sentinel and cumulative values; pair tests expect distinct country/year/reporting-level groups and reject unknown groups (`tests/testthat/test-fgt_cumsum.R:27-66,82-104,171-183` @P).
- Statistic tests use wide fields and assert survey cache-ID/level joins, lineup country/year/level joins, and mean/median enrichment (`tests/testthat/test-utils-stats.R:149-190,215-225,231-284` @P).
- Auxiliary tests are conditional on `PIPAPI_DATA_ROOT_FOLDER_LOCAL` and exercise GDP/PCE/pop/CPI/PPP plus four-column long GDP output (`tests/testthat/test-get_aux_table.R:1-19` @P). Shared integration setup pins `20260922_2021_01_02_PROD`, tries to build lookups, and permits skips when no lookup is available (`tests/testthat/helper-lkup.R:34-59,69-76` @P).
- Cache manifest tests create temporary files and caches; they assert exclusion of cache/archive/non-FST copies and detection of changed distribution content. They are not release-schema ingestion tests and were not run (`tests/testthat/test-cache-v2-core.R:9-33,121-145` @P).

## Gaps

- UNKNOWN: complete production schemas, storage types, null rules, and uniqueness for all release files. This note gives only source-consumed columns and declared join constraints. No actual release data or upstream writer was inspected.
- UNKNOWN: full nested Country Profile schemas, all survey metadata fields, and the `pop_region` data schema. The API loads or forwards these objects without a complete field specification at the cited sites (`R/create_lkups.R:458-477`; `R/ui_country_profile.R:25-27,120-123,355-361`; `R/ui_miscellaneous.R:8-15` @P).
- UNKNOWN: production lineup cumulative handling for zero, negative, or missing welfare, and proof that lineup units match release PPP. Source consumption and synthetic positive-welfare fixtures do not verify the writer (`R/fgt_cumsum.R:67-108`; `tests/testthat/test-fgt_cumsum.R:27-66` @P).
- UNKNOWN: exact PPP scaling inside the external old-lineup `wbpip` call, and tested custom-PPP behavior of the current new path (`R/fg_pip_old.R:98-112`; `R/utils-pipdata.R:274-321`; `R/fg_pip.R:32,65-113` @P).
- UNKNOWN: production cache configuration and whether a full deployed release can be served without prepared caches. Cache-v2 has explicit directory and provenance requirements, which were read but not executed (`R/cache-v2.R:88-109`; `R/duckdb_func.R:443-487,491-545` @P).
- UNKNOWN: numerical equivalence and old-release availability in a running API. No tests or API requests were executed. The old-lookup validation conflict needs a safe regression test in the package's own work (`R/pip.R:57-67`; `R/validate_lkup.R:17-25,78-85`; `R/create_lkups.R:796-799` @P).
