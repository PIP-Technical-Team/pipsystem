---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:28:46Z
owner: processing-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: NONE
next: Coordinator integrates processing evidence into research synthesis; no implementation authorized.
---

# Processing and auxiliary-consumer research

## Summary
Completed source-only review of all 16 assigned R files and all four extdata CSV/YAML files. pd_deflation.R read in two explicit pages (1-520, 521-1080); remaining files reached EOF without truncation. Mapped cleaning, auxiliary production/consumption, validation and recode specs, startup side effects, static correctness risks, scientific decisions, and narrow acceptance known-answer/mismatch cases. No planning command or implementation executed. Source-only corruption risks are conditional correctness findings, not verified live publication incidents.

## Changes
Only this report created. No package changes or commits.

## Checks run
- Read-only Git: branch PROD; HEAD fe075a6d49f37d6d131eeadfeb9219c2038899ea; git status --short empty.
- Report parent existence checked: True.
- Read project constraints, SYSTEM_DESIGN.md, HARVEST_BRIEF.md and pip-handoff-v2 contract.
- Root read-only Git: main at 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39; existing unrelated tracked and untracked work present and untouched.
- Loaded required technical communication, R data.table, collapse, technical, and analytical skills.
- Shared material recode/alternative-welfare/auxiliary mismatch risks with coordinator.
- Final read-only package recheck: PROD, fe075a6d49f37d6d131eeadfeb9219c2038899ea, status empty at 2026-11-03T15:28:46Z.
- No tests, package loading, R execution, installations, network, pipeline execution, production/private data reads, or Git mutations performed. Proposed acceptance cases were not run.

## Gaps
- Source review complete for this partition only. Runtime behavior, serializer round trips, numerical equivalence and actual production occurrence of conditional risks are untested.
- External package implementations/versions, compiled sysdata, production data schemas and current canonical PFW contents are UNKNOWN; neither private data nor sysdata was read.
- Scientific/source-contract confirmations below remain open; this report does not choose policy or alter Decided design.
- Test, engine, acquisition and documentation coverage belongs to other assigned reviewers; no claim of whole-package acceptance from this partition.

## Evidence scope and provenance

All package citations below refer to `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` at **fe075a6d49f37d6d131eeadfeb9219c2038899ea**, branch **PROD**, with empty `git status --short` at inspection. Root documents were read in `pipsystem`, branch main, HEAD **0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39**; root working tree contains pre-existing unrelated edits, which were not touched. No other package repository was read. References to external package behavior are limited to arguments/calls visible here; their implementation and installed versions are UNKNOWN.

This is research, not `/cg-plan` execution, a Plan, implementation authorization, or a production numerical audit. Preliminary examples are not policy. Fixed boundaries: formatting is not inferred error repair; stamp alone decides rebuilds; pipdata coordinates; neither pipster nor mean calculation is an upstream acceptance prerequisite (`SYSTEM_DESIGN.md:160,186-192,290-307`).

### Per-file coverage

| Assigned file | Coverage |
|---|---|
| R/aaa.R | Full, 1-287 |
| R/get_country_pfw.R | Full, 1-246 |
| R/pd_aux_attr.R | Full, 1-218 |
| R/pd_cpfw_merge.R | Full, 1-360 |
| R/pd_deflate_pipeline.R | Full, 1-624 |
| R/pd_deflation.R | Full, pages 1-520 and 521-1080 |
| R/pd_dlw_clean.R | Full, 1-738 |
| R/pd_split_alt_welfare.R | Full, 1-87 |
| R/pd_wbpip_clean.R | Full, 1-141 |
| R/recode_spec.R | Full, 1-562 |
| R/valid_aux_load.R | Full, 1-173 |
| R/utils.R | Full, 1-504 |
| R/log_report.R | Full, 1-1173 |
| R/pipdata-options.R | Full, 1-54 |
| R/pipdata.R | Full, 1-97 |
| R/zzz.R | Full, 1-32 |
| inst/extdata/dlw_pip_var_type.csv | Full, 1-28 |
| inst/extdata/pip_pc_var_type.csv | Full, 1-21 |
| inst/extdata/recode_spec.yml | Full, 1-456 |
| inst/extdata/validation_spec.yml | Full, 1-448 |

No assigned file was only partially covered. CSV/YAML glob returned exactly these four files. Tests, acquisition/validation engine, orchestration engine, documentation and vignettes belong to other reviewers; no duplicate audit performed. `R/sysdata.rda` was neither opened nor decoded.

## Cleaning sequence and assumptions

1. **PFW slice and inclusion.** `get_country_pfw()` selects country_code + surveyid_year + survey_acronym using survey attributes (`R/get_country_pfw.R:34-41`), drops rows not satisfying `inpovcal == 1`, computes reporting_level from the maximum across five domain columns, then constructs module-bearing `{country}_{year}_{acronym}_{INC|CON}_{module}` cache IDs and splits by ID (`:72-125,202-244`). This is survey-ID year, not fractional fieldwork year. Missing domain columns abort; domain values are not checked here before `pmax`. No usable row aborts. Multiple rows with only one distinct welfare_type abort; multiple welfare types merely log (`:80-120`). That does not prove uniqueness of every country/year/acronym/welfare key when several welfare types coexist. Module is inherited from input attributes, not selected by this function; HIST/BIN/competing-acronym policy is not resolved here.
2. **Alternative welfare.** A singleton CPFw sets welfare_type and keeps the existing welfare vector. Two CPFw entries must have opposite is_alt_welf flags; the secondary entry names `oth_welfare1_var`, which is copied into welfare in a duplicate survey (`R/pd_split_alt_welfare.R:25-81`). No semantic period/unit validation accompanies that substitution. CPFw settings are mapped positionally with `purrr::map2` (`R/pd_cpfw_merge.R:32-44`).
3. **Attributes and domains.** `cpfw_merge()` copies, fills only missing country/year/welfare attributes, overwrites reporting_level, resolves five auxiliary data levels, and assigns distribution_type (`R/pd_cpfw_merge.R:63-86,97-145,215-225`). Existing conflicting country/year/welfare attributes are not reconciled here. `pd_resolve_data_levels` is outside this partition; its implementation is not independently assessed. Microdata use_imputed == 1 means imputed, otherwise micro (`:245-266`). Group distribution_type is group for pop_domain == 1, otherwise group/aggregate based on distinct area count when pop_domain == 2 (`:276-329`); this occurs before `dlw_clean.pipgd` adds/recodes area, so an urban-only grouped source merits a mismatch case.
4. **Microdata formatting.** Copy -> shift plain subnatid into numbered hierarchy -> format weights -> format welfare -> apply ordered YAML recodes -> wbpip clean -> column ordering (`R/pd_dlw_clean.R:70-85`). Weight priority is existing weight, else weight_p, else weight_h, else uniform 1/N plus warning; coercion to double followed by finite/nonnegative/positive-total checks (`:134-179`). Welfare is required, coerced to double, unconditionally divided by 365, and checked finite (`:190-217`). This explicitly assumes annual per-capita LCU; no period or per-capita metadata is consulted. Negative finite welfare survives this local check. Whether the external cleaner changes negatives/zeros/rows is UNKNOWN: source only calls `wbpip:::md_clean_data(... quiet=TRUE)$data` (`R/pd_wbpip_clean.R:37-50`). Do not equate that call with approved formatting-only behavior without a known-answer preservation check.
5. **Grouped formatting is different.** Copy -> add_area -> order area/welfare -> wbpip grouped cleaner by area -> column order (`R/pd_dlw_clean.R:96-125`; `R/pd_wbpip_clean.R:60-74,84-109,120-139`). It does not run `format_wgt`, `format_wlf`, or YAML recodes. gd_type is read from an attribute and transformed by `as.numeric(sub("T0", "", gd_type))`; only absence is explicitly rejected. Group urban missing maps to national, invalid urban maps to empty area (`R/pd_dlw_clean.R:508-548`). Micro YAML area maps 0/1 to rural/urban and all other values to NA; absent urban skips the area rule and leaves existing area untouched (`inst/extdata/recode_spec.yml:83-89`; `R/recode_spec.R:244-258,429-455`). These are not interchangeable module paths.
6. **Clean-output validation exists now.** `pd_validate_clean_output` requires nonempty uniquely named list; each item is a nonempty pipmd/pipgd data.table with finite double welfare/weight, nonnegative positive-total weights, scalar identity fields, enumerated welfare/reporting/distribution/domain values, and nonempty area when any domain is area (`R/pd_dlw_clean.R:636-738`). It does not establish welfare units, forbid negative welfare, check group cumulative shares, establish uniqueness of survey household IDs, require year column, or prove list name agrees with the object's welfare identity. Hook placement belongs to the engine reviewer; this report does not repeat an inherited claim that this validator is absent.
7. **Output formatting does not enforce the CSV schema.** `pip_vars` merely moves present welfare/weight/area and selected demographic columns to the front; it neither adds nor selects a fixed schema, and leaves other columns (`R/pd_dlw_clean.R:559-616`). Both CSVs declare names/types (including string/numeric tokens) but this assigned cleaning code does not consume them as runtime schema assertions (`inst/extdata/dlw_pip_var_type.csv:1-28`, `pip_pc_var_type.csv:1-21`). Their compiled sysdata representation/use elsewhere is UNKNOWN.

## Auxiliary producer-consumer map

`pd_aux_attr` extracts survey attributes except internal selfref, row.names, notes; **names and class remain in the metadata list**. It retains only aux names cpi/ppp/pop/gdp/pce, obtains PK via `stamp::st_get_pk`, uses the matching attributes to build an id, filters, and appends named numeric vectors (`R/pd_aux_attr.R:21-60,80-108`). This is an attribute-list producer, not a table join or a guarantee of unique keys. Missing PK attributes are not explicitly rejected; no matches leave the measure absent (`:80-99`). Repeated measure names append duplicate list names rather than explicitly replacing an old measure (`:105`).

| Measure | Producer filtering and vector shape | Actual assigned consumer/use |
|---|---|---|
| CPI | country_code + `year == surveyid_year` + survey_acronym; value cpi_value, name `{cpi_year}_{reporting_level}` (`R/pd_aux_attr.R:130-137,190-196`) | `add_cpi` splits names, uses literal cpi_data_level or looks up each area; columns `cpiYYYY` and attr cpi_years (`R/pd_deflation.R:758-790`). Fractional survey/fieldwork year is not used by producer. |
| PPP | country only; ppp_version combines ppp_year/release_version/adaptation_version, replacing `_v` with `_0`; value ppp, name `{ppp_version}_{reporting_level}` (`R/pd_aux_attr.R:138-158,197-203`) | `add_ppp` splits first four underscore segments into version, remainder into level; literal/area lookup; columns `ppp_YEAR_REL_ADAPT`, attr ppp_versions (`R/pd_deflation.R:674-714`). All supplied country PPP versions are retained, not latest-per-year selection. |
| Population | country + `year == surveyid_year`; value pop, name `{year}_{reporting_level}` (`R/pd_aux_attr.R:159-165,204-210`) | Only microdata whose pop_data_level resolves to area get weight scaling (`R/pd_deflation.R:449-458`). Consumer requires **column year**, takes first row's year, sums weights per area, chooses closest named population year, averages equidistant ties, and applies population/area-weight-total (`:1012-1078`). Producer has already restricted to one surveyid_year; broad nearest-year search is therefore usually unavailable on this path. Group data never scale population (`:483-504`). National population vector is carried but unused in welfare deflation. |
| GDP | country + surveyid_year; value gdp, name `{year}_{reporting_level}` (`R/pd_aux_attr.R:159-165,204-210`) | Stored metadata only in assigned path. Neither GDP nor its growth enters `.deflation_pipmd_core` or `.deflation_pipgd_core`; loader returns only CPI/PPP/pop (`R/pd_deflation.R:144,439-504`). |
| PCE | Same filter/name shape using pce (`R/pd_aux_attr.R:159-165,204-210`) | Same: metadata only, not an input to assigned welfare arithmetic. No inference about downstream lineup use. |

**Welfare arithmetic boundary:** original daily welfare is copied into welfare_lcu, then for each CPI/PPP intersecting base year, every matching PPP version is passed with welfare_lcu and cpiYYYY to `wbpip::deflate_welfare_mean` (`R/pd_deflation.R:858-869,880-928`). The external function's exact formula is NOT defined in these files; an independently approved known answer is needed, rather than claiming its formula was reviewed here. Output names are `welfare_ppp_YEAR_REL_ADAPT`, not the Decided `welfare_YYYY`; the original welfare column is removed, all character columns become factors, rows sort by newest PPP welfare then weight, and welfare_vars/adj_pop/ppp_sort attributes are attached (`R/pd_deflation.R:460-469,493-502,520-554`; `R/utils.R:273-287`). This is an explicit target conflict with `SYSTEM_DESIGN.md:162`, not authority to change target policy.

**Legacy table interface is not the named-vector contract.** PPP reshapes by country_code + ppp_data_level, CPI expects wide cpiYYYY columns and survey_year rather than producer's year/cpi_value, and legacy population expects country_code/survey_year/reporting_level columns in survey data (`R/pd_deflation.R:573-603,659-671,733-755,963-1009`). Legacy PPP country filter dereferences `attributes(dt)$country_code$values` although clean validator expects a scalar character attribute (`:661`; `R/pd_dlw_clean.R:665-669`). Legacy dcast has no duplicate-key rejection or explicit aggregation; duplicate cells can become counts. These are compatibility mismatch cases, not reasons to rewrite the main vector path.

**Version resolution:** public pd_deflation treats auxiliaries as explicit only when all CPI/PPP/pop are non-NULL; one omitted argument causes all supplied vectors to be replaced from inventory (`R/pd_deflation.R:286-301`). Public metadata loading matches optional version against content_hash_data, takes first metadata version among matches, and falls back to latest on any read error (`:89-142`). Strict exact route reads exact data/meta versions, checks optional object hashes, validates the table, and calls core directly (`:338-363`); it does not fall back to latest. Non-strict public S3 methods wrap core errors into NA and in-memory logs (`:382-423`). Strict worker validates exact receipts and only that result is a data.table before saving (`R/pd_deflate_pipeline.R:501-559`); that is not a numeric-output validity gate.

## Findings ordered by impact

All findings are source-level conditional risks, not reproduced production incidents. P0 denotes silent data corruption or incorrect statistical output under the stated input, not a claim that production outputs are known to be wrong.

**[P0]** `R/recode_spec.R:327-331` -- Indicators compare numeric source codes after those codes have become labeled factors.
**Issue**: YAML applies labeled factor recodes first (lstatus, empstat, industrycat4, age_group2), then indicators use numeric match_values (`inst/extdata/recode_spec.yml:113-141,178-186,306-333,370-456`). Dispatcher applies factors immediately and follows YAML order (`R/recode_spec.R:429-467`). `%in%` compares factor labels, not their original numeric codes; source NA also becomes false rather than unknown.
**Impact**: youth/employment/sector indicators can silently be zero for positive cases, contaminating disaggregation. The welfare-only clean validator does not inspect these indicators.
**Static counterexample (not executed)**: Input age=20, lstatus=1, industrycat4=1. Canonical YAML first makes age_group2 the factor label `15–24`, lstatus `Employed`, industrycat4 `Agriculture`; later match_values are respectively numeric 2, 1, 1. Source-derived `%in%` results are FALSE, so youth/employed/emp_agri become 0, while the rule comments/labels imply expected 1. A source NA similarly yields 0. This ordering is present in the shipped YAML and triggers whenever those positive source fields are supplied; no production occurrence is claimed.
**Fix**: Match explicit canonical labels or retain original codes for derivations; preserve unknown where policy requires. Functional check: a 20-year-old employed agriculture worker yields youth/employed/in_labor_force/emp_agri == 1, while a source NA remains the approved unknown, not an accidental zero.

**[P0]** `R/pd_split_alt_welfare.R:79-81` -- Alternative-welfare list names can be reversed relative to their contents.
**Issue**: Both CPFw orders are accepted at :47-55, but output always uses list(main, alternative) and names from the original CPFw order. get_country_pfw splits by cache ID (`R/get_country_pfw.R:239`), without promising main-first ordering. pd_cpfw_merge subsequently maps that list to original CPFw position (`R/pd_cpfw_merge.R:42-44`).
**Impact**: Alt-first input can save primary welfare under the alternative cache ID, apply wrong domains/imputation flags, and cross-label consumption/income without detection by current name/attribute checks.
**Static counterexample (not executed)**: CPFw list order is `[INC alternative, CON primary]`, a permitted order because :52 accepts it. Input primary welfare=3650 and alternate named welfare=7300. Expected INC artifact uses 7300, CON uses 3650. Branch assigns mcpfw=second and scpfw=first, then list(dt,dta) contains `[CON 3650, INC 7300]` but :81 assigns names `[INC, CON]`. Source-derived actual keyed contents are reversed, before the daily conversion; map2 then supplies the opposite CPFw settings. The canonical production PFW order/content was not read, so this is a permitted counterexample, not proof every dual-welfare survey is affected.
**Fix**: Key both data and CPFw by each resolved cache_id and pair explicitly. Functional check: swapping CPFw order leaves each named artifact's values, welfare_type, and settings identical; primary consumption plus alternative income is a useful canary.

**[P0]** `R/pd_deflation.R:690-709` -- Named auxiliary vectors do not enforce unique keys, supported names, complete matches, or valid deflators.
**Issue**: CPI has the same behavior at :764-786. Duplicate names go into named maps and ordinary character indexing selects a matching entry without ambiguity rejection. Missing levels become NA; nonpositive/nonfinite deflators are not rejected here. Producer does not check uniqueness (`R/pd_aux_attr.R:189-217`). Inconsistent CPI/PPP years are reduced to their intersection after logging; empty intersection can yield an LCU-only data.table (`R/pd_deflation.R:807-848,885-896,542-552`). Worker accepts any data.table for save (`R/pd_deflate_pipeline.R:522-536`).
**Impact**: Wrong auxiliary row can be silently selected; missing/invalid deflators or missing PPP years can produce invalid or incomplete welfare yet reach persistence if external arithmetic returns a table rather than errors. Exact input hashes prove identity, not scientific validity.
**Fix**: At the existing deflation boundary, reject ambiguous names and unmatched required domain/year keys and require finite, positive used CPI/PPP plus expected finite welfare columns before saving. Obtain scientific direction on unequal-year policy; do not silently choose policy. Functional checks: duplicate same-key/different-value, missing rural CPI, zero PPP, malformed name, and disjoint years must not be recorded successful.

**[P0]** `R/pd_deflation.R:1041-1078` -- Partial area population coverage can create missing weights in a successful-looking table.
**Issue**: An area with no population match returns NULL; only absence of *all* factor rows aborts. A left join then leaves unmatched area pop_fact missing and multiplies weights by it. Zero area weight sum can divide by zero at :1057-1058. Clean validation allows zero weights provided overall total is positive (`R/pd_dlw_clean.R:658-660`), and there is no corresponding post-deflation finite-weight validation in this worker.
**Impact**: A survey with urban coverage but missing rural population can be saved with rural NA weights, losing support in downstream statistics or failing later. A positive-total survey can still contain a zero-total area.
**Fix**: Require exact area coverage and finite positive area denominators before population scaling and finite nonnegative output weights afterward. Functional check: known totals urban=100/rural=300 are attained exactly; remove rural population or give an area all-zero weights and assert a failed, unsaved artifact.

**[P0]** `R/pd_dlw_clean.R:203-205` -- Welfare conversion assumes annual units without checking input period.
**Issue**: Every micro welfare vector, including alternative welfare, is divided by 365; no annual/monthly/daily or per-capita indication is checked.
**Impact**: Monthly/already-daily or non-per-capita inputs can produce finite but scientifically incorrect welfare. Finite double validation cannot detect the unit error.
**Fix**: Confirm the chosen survey's source-unit fact and use an explicit supported unit contract; unsupported/ambiguous units should stop that survey rather than infer a repair. Functional check: independently documented annual LCU 3650 becomes daily 10 exactly; a declared daily/monthly mismatch does not get silently annualized. Whether all eligible GMD modules guarantee annual welfare requires scientific/source-contract confirmation, not a guessed new rule.

**[P0]** `R/pd_dlw_clean.R:147-161` -- Missing or differently scoped weights are silently substituted.
**Issue**: If weight_p is absent, weight_h is renamed directly without checking household-versus-person semantics; if neither exists, 1/N is created and only a warning recorded. The format validator then accepts the fabricated positive finite weights.
**Impact**: An unsupported household-weight or unweighted sample can produce incorrect population-representative statistics while passing structural checks. This conflicts with treating formatting as something other than error repair unless an explicit approved source contract justifies it.
**Fix**: For acceptance, require the survey's documented person weight and fail unsupported missing weights; decide separately whether a declared equal-probability design or household-weight conversion is scientifically valid. Functional checks: explicit weight preserved, weight_p rename preserves values, no-weight input not accepted by accidental fallback, and household-only case follows a documented decision.

**[P0]** `R/pd_deflation.R:118-141` -- Public metadata loading may substitute latest for an exact historical request.
**Issue**: Any metadata read error is turned into NULL and retries version=NULL, even when caller requested a specific data version. When several inventory rows match content_hash_data, the first metadata pin is used without explicit ambiguity resolution (:89-114).
**Impact**: Historical survey data can be combined with newer CPI/PPP/population, yielding the wrong reproducible answer. This conflicts with same-version historical metadata (`SYSTEM_DESIGN.md:135`). The strict exact-stage path is distinct and avoids this fallback.
**Fix**: Reuse the strict exact path for acceptance, with old-data/new-metadata mismatch and unavailable-pin cases proving failure rather than latest substitution. Any change to public convenience behavior should be narrow and separately covered, not a new versioning framework.

**[P1]** `R/pd_deflation.R:358-362` -- Exact strict readback requires class preservation that the public route explicitly restores.
**Issue**: Public mode B says stamp round trips strip pip class and restores it (`:240-253`); exact strict path immediately validates pipmd/pipgd after read. Whether the actual configured serializer now preserves class is UNKNOWN, not proven by this comment.
**Impact**: Otherwise-valid exact clean artifacts may fail before deflation; the acceptance route could work only with mocks that preserve attrs/classes.
**Fix**: Use real local stamp save/read for the chosen module and assert data class plus identity/domain attributes before invoking strict deflation. If restoration is necessary, restore from pinned metadata, not an inferred latest source.

**[P1]** `R/pd_deflate_pipeline.R:606-611` -- Entity-failure classification does not cover all ordinary transform errors.
**Issue**: Only enumerated classes are recoverable; ordinary arithmetic/dispatch errors and exact-hash mismatch are fatal. `pd_execute_deflate` rethrows them (`:561-580`).
**Impact**: A malformed survey or auxiliary transform error can terminate the stage rather than recording one failed survey and continuing; exact integrity mismatch may legitimately require run-level stop. Those classes need an explicit distinction, not a blanket catch.
**Fix**: In a narrow failure case, distinguish one deterministic bad survey from changed pinned-input integrity and show the intended continuation/abort result. Reuse typed condition records, do not add retries or another scheduler.

**[P2]** `R/log_report.R:911` -- Some report sections can mix runs even when top-level summary is scoped.
**Issue**: Null surveys and inventory verification select first matching entry (:911,1080), aux changes aggregate all entries (:1016-1029), skipped surveys/reasons are independently deduplicated and paired by position (:1137-1147), while processing/deflation summaries use selected run IDs (:244-269).
**Impact**: Human feedback can describe historical missing/skipped surveys or misassociate a skip reason, misleading acceptance diagnosis. It does not determine work in these files.
**Fix**: Use the selected run's structured result as acceptance evidence; optional focused report correction should keep survey/reason pairs and filter sections to one run. Functional check: two synthetic run IDs with different failures show only the selected run's paired details.

## Validation and recode specifications: what is and is not established

- Validation YAML explicitly distinguishes startsWith availability prefixes from regex loops and says severity is only honored for explicit missingness/threshold routes (`inst/extdata/validation_spec.yml:3-10`). GPWG requires weight*/welfare* availability and countrycode; urban optional; household/person missingness/uniqueness conditional warnings; numeric and welfare/weight checks with critical NA threshold (`:14-87`). GROUP/BIN/HIST have na_threshold_min 1 and module-specific fields (`:89-280`); ALL adds age/demographic checks (`:282-342`), ASPIRE hhweight (`:344-387`), labor module labor fields (`:389-440`), skip only data presence (`:442-448`). Availability of a prefix is not proof the exact final `welfare` or person `weight` exists. Actual threshold/default or helper semantics belong to acquisition reviewer; no inference that YAML severity is universally enforced.
- Recode YAML includes range-to-NA educy/age/hsize, categorical relabels, derived age/hsize groups, weighted welfare quintiles and binary indicators (`inst/extdata/recode_spec.yml:5-456`). R handlers explicitly coerce ranges to double, map unknown binary/education codes to NA, parse bin expressions, and preserve source columns only for derivations (`R/recode_spec.R:223-332,425-467`). `na_outside` is descriptive YAML here: range handler always maps outside to NA. Unknown category coding needs a source dictionary, not inferred correction.
- `educat4` YAML labels differ from the older commented labels in deprecated cleaner (YAML :49-58 vs `R/pd_dlw_clean.R:257-264`). Neither comment nor this review decides the correct scientific dictionary. Confirm against the selected survey's harmonized labels before accepting a categorical known answer.
- Quintiles use wbpip quantile cutpoints and `cut(unique(breaks))`, then ordinal map (`R/recode_spec.R:296-323`). Tied cutpoints compress intervals, so mapping a surviving interval ordinal to a named quintile requires an agreed tie convention. This is an explicit limited mismatch case, not a demand for new statistical kernels.
- Recode schema validator checks presence of schema_version, types/recode names, selected necessary fields but not schema_version support, range shape/order, scalar output types, mapping code validity, bin overlap or weight availability (`R/recode_spec.R:48-160`). Pre-resolved and stamp specs are applied without calling this validator at that boundary (`:400-423`). Package YAML loader does validate once (`:15-28`); do not misstate validation as wholly absent.
- Package spec is synced into stamp by content comparison; read errors become no-spec; unchanged branch queries paths containing recode_spec and takes first row, not exact path uniqueness (`R/recode_spec.R:32-41,175-217`). Fall-back apply reads spec and catalog separately (:407-422); potential race/version association is UNKNOWN without runtime, so acceptance should pass the once-resolved spec/version explicitly and verify that provenance.
- Legacy `valid_aux_load` calls pipaux release/vintage comparisons, removes diff_cols, binds row changes and projects unique key columns (`R/valid_aux_load.R:33-110,131-172`). A schema-only difference can disappear by design. It is useful historical comparison evidence, not a substitute rebuild authority. `get_aux_hashes` rejects missing/ambiguous aux catalog basenames and empty hashes, but documents rather than proves same-root/same-data coupling (`R/utils.R:405-503`).

## Runtime/startup and safety constraints

- Source creates unified mutable `.pipdataenv` with emptyenv parent and accessor/reset/append helpers; data-level dispatch recognizes only area pointer and treats other values as literal levels, with degenerate inputs falling through (`R/aaa.R:2-82,124-154`). Clean validation restricts levels to national/area, but public deflation input validation only checks presence, not legal scalar values (`R/pd_deflation.R:34-49`).
- `.onLoad` resets that environment, calls `pipfun::log_init("pipdata_log", overwrite=TRUE)`, then sets only absent options (`R/zzz.R:10-26`). External log_init's disk behavior is UNKNOWN; it was not executed. Top-level defaults include `tools::R_user_dir("pipdata", "cache")`, which can resolve to C: on Windows (`:2-7`). Before any future authorized execution, configure **all** process temp/cache/log/output paths on E and the pipeline manifest to an isolated E path before loading, and check external package startup side effects. Loading this package was expressly prohibited here.
- `log_report(path=...)` writes directly with writeLines, default path=NULL returns text (`R/log_report.R:64-84,112-118`); YAML export can also write a path (`R/recode_spec.R:493-507`). These were read only, never called. In-memory failure timestamps use local time (`R/utils.R:297-318`); this report uses UTC frontmatter, human updates ET.
- `R/pipdata.R:8-15,20-95` records broad data.table/collapse imports, .datatable.aware, and globalVariables; these are package namespace declarations rather than data processing or remote reads.

## Scientific decisions versus implementation verification

**Scientific/source-contract confirmation needed before claiming the relevant case accepted:**

1. The chosen welfare and alternate welfare's period, currency, and per-capita meaning; whether the annual/365 convention applies to the selected module. Do not infer from a numeric column.
2. The population estimand and correct person weights; whether household-only or truly missing weights are ever permitted, and any explicit conversion/equal-probability rule. An implementation may fail unsupported input without inventing replacement values.
3. Meaning of negative/zero welfare and external cleaner edits; confirm preservation or rejection consistent with formatting-only design, not inferred repair.
4. Selected PFW inclusion/settings and applicable national/urban/rural domains; resolution of multiple candidate surveys/module choices remains outside this partition. No blanket HIST-before-BIN rule inferred.
5. Whether intersecting available CPI/PPP years is scientifically acceptable or missing requested PPP years must fail; which PPP release/adaptation version should represent a year given target `welfare_YYYY`. Target column convention itself is already Decided, not open to a silent alternative.
6. For disaggregation only: correct educat4 dictionary, tie convention for quintiles, and whether unknown indicators should remain missing. These need not block a welfare-only one-survey case if no such field is claimed accepted; they remain material known defects, not silently certified.
7. Population reference year versus survey-ID year/fractional fieldwork year, and whether nearest-year/averaged-tie matching is the approved method. The code's current choice is evidence, not policy approval.

**Ordinary implementation verification; no new scientific approval needed:** preserve keyed INC/CON identity under CPFw reordering; detect duplicate/ambiguous aux keys; preserve row support and weights where no approved scaling applies; verify all used required keys match; enforce finite used values/output; exact version/hash readback; reject a missing historical pin rather than substitute latest; demonstrate class/attribute preservation; distinguish single-entity failure from integrity failure; use E-only isolated artifacts; use stamp-selected work and retain pipdata coordination. These checks support already-Decided reproducibility and release correctness, not a broad defensive framework.

## Narrow acceptance recommendations (not a Plan)

Reuse existing CPFw split/merge -> pd_dlw_clean with one explicit recode_spec/version -> pd_validate_clean_output -> pd_aux_attr -> actual local exact save/read -> pd_deflation_exact_strict -> existing typed persistence/result boundary. Coordinate route ownership with engine reviewer; this is not endorsement of legacy manifest currentness or widening an experimental recipe interpreter. Reuse the acquisition review's actual validator and a declared synthetic/public fixture; no production/private survey access is authorized by this research. Do not require mean, pipster, lineups, live DLW or an all-survey run to prove the upstream producer-consumer contract.

Small functional evidence set for a future authorized acceptance effort:

| Case | Specific expected evidence |
|---|---|
| Annual one-survey known answer | Independently specified source units; annual 3650 -> daily welfare_lcu 10; two manually approved CPI/PPP values with independently calculated expected outputs (not the function under test as oracle); unchanged row count/weight support, correct welfare identity and domain attrs, exact readback pins. |
| Mixed domain known answer | National PPP with distinct urban/rural CPI; verify per-area expected welfare, with national population leaving weights unchanged. Separately set area population totals and verify exact area sums. This covers independent domain dispatch without a general regional framework. |
| Missing/ambiguous aux mismatch | Remove one required area CPI/pop row; duplicate a version/level key with another value; introduce zero/nonfinite factor; disjoint CPI/PPP years. Assert explicit failure/no successful saved result, not merely table-or-NA. |
| Alternate welfare identity | Primary CON and alternative INC with distinct known values; reverse CPFw order and verify identical keyed outputs/settings. No requirement to run an entire second survey. |
| Recode canary | Known age/labor/industry positives and NA values; ensure expected labels and indicators agree and unknowns follow explicit policy. If scoped only to core welfare, record these fields as unaccepted rather than pretending they passed. |
| Format contract mismatch | Missing weights, wrong declared welfare period, absent year when population adjustment is requested, or no usable area: no inferred repair/no successful persistence. |
| Exact history/class readback | Save/read real data and metadata in isolated E storage; assert pip class plus identity/domain attrs and spec version. Missing exact metadata pin and mismatched hash must not fall back to latest. |

For any proposed correction above, its named functional case is the one check showing it works. Add only validations needed to prevent wrong numbers being released; keep reversible tooling/general schema enhancements under Later. No new dependencies recommended. Any later Plan should remain about two pages, name protected/scientific decisions explicitly, and stop at one-survey acceptance rather than expand project scope.

### Later (not acceptance prerequisites)

- Broad schema framework, generalized arbitrary-domain registry, full numerical audit, replacement statistical kernels, nationwide/grouped-module certification, new scheduler/retry machinery, and comprehensive report redesign.
- Survey-specific policies for every country/module; capture unresolved policies as inputs when those cases enter scope, not as guessed defaults now.
- Performance/parallelism, automatic Markdown exports and a universal spec-validation layer; use installed tools and the existing boundaries first.
