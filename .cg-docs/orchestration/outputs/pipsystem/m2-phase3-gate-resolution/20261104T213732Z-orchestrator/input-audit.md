---
schema: pip-handoff-v2
project: pipsystem
task: m2-phase3-gate-resolution
run: 20261104T213732Z-orchestrator
status: completed
owner: source-input-audit
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f0eb0d2950f24a67270a6ba946de9df9fae4ccdf
plan: pipdata/.cg-docs/plans/2026-11-02-m2-deflate-one-survey.md revision 2
next: Parent integrates proposed D1-D3 decisions; explicit analyst approval remains required.
---

# D1-D3 Source/Input Audit

## Summary
The November 3 fixture supplies a concrete primary survey; it does not resolve scientific approvals. Recommend one bounded D1-D3 approval bundle: reuse its four positive rows, select one explicit PPP vintage for each of its four existing base years, keep national primary weights unchanged, and add the mandatory separate population-on control. None of these recommendations is an applied decision. Runtime/adapter/D8 is the parent's separate audit.

All package paths below are relative to `E:/PovcalNet/01.personal/wb384996/PIP/`. Source references use the repository identities below. Historical saved-artifact pins are clearly separated from current source facts and from future execution verification.

## Repository identities

Read-only `git status --short --branch` and `git rev-parse HEAD` returned:

| Repository | Branch | Full HEAD | Working tree |
|---|---|---|---|
| pipdata | PROD, tracks origin/PROD | 5680d7848dccb5fb2563129bbcd25809093d52bd | clean |
| pipaux | PROD, tracks origin/PROD, ahead 1 | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | clean |
| pipsystem | main, tracks origin/main | f0eb0d2950f24a67270a6ba946de9df9fae4ccdf | dirty, paths below |

No fetch, remote verification, branch changes, staging or other Git mutation. Pipsystem dirty paths at initial inspection, before this support report was created:

```text
 M .cg-docs/orchestration/outputs/pipaux/m2-aux-stamp-cpi-ppp-pfw/20261030T163258Z-pipaux/handoff.md
 M HARVEST.md
 M docs/pipsys-tools.md
 M site/_quarto.yml
 M site/assets/aos-body.html
 M site/custom.scss
 M site/index.md
 M tests/pipsys/test-pipsys.R
 M tools/pipsys/pipsys.R
 M wiki/README.md
 M wiki/cli-reference.md
?? .cg-docs/orchestration/outputs/pipaux/m2-aux-stamp-cpi-ppp-pfw/20261102T152522Z-pipaux/
?? .cg-docs/orchestration/outputs/pipaux/m2-aux-stamp-cpi-ppp-pfw/20261102T190429Z-pipaux/
?? .cg-docs/orchestration/outputs/pipaux/m2-aux-stamp-cpi-ppp-pfw/20261102T191337Z-pipaux/
?? .cg-docs/orchestration/outputs/pipdata/one-survey-upstream-acceptance/
?? .cg-docs/orchestration/outputs/pipsystem/m2-phase-3-local-plans/
?? .cg-docs/orchestration/outputs/pipsystem/m2-phase-3-readiness/
?? .cg-docs/orchestration/outputs/pipsystem/m2-phase3-gate-resolution/
?? .cg-docs/orchestration/outputs/pipsystem/pip-command-guidance/
?? .cg-docs/orchestration/outputs/pipsystem/pip-next-global/20261102T203907Z-live-global/
?? .cg-docs/orchestration/outputs/pipsystem/pip-next-global/20261104T211450Z-global/
?? .cg-docs/orchestration/outputs/pipsystem/pip-next-pipdata/
?? .cg-docs/orchestration/outputs/pipsystem/pip-next/
?? .cg-docs/orchestration/outputs/pipsystem/pipdata-upstream-followup/
?? .cg-docs/orchestration/outputs/pipsystem/pipeline-test-layer-explanation/
?? .cg-docs/orchestration/outputs/pipsystem/site-focus-and-navigation/
?? .cg-docs/plans/2026-11-02-pip-next.md
?? .cg-docs/plans/2026-11-02-site-focus-and-navigation.md
?? .cg-docs/reviews/2026-11-02-pip-next-review.md
?? .cg-docs/reviews/2026-11-02-pip-next-verify-review.md
?? .cg-docs/reviews/2026-11-02-site-focus-and-navigation-review.md
?? .cg-docs/reviews/2026-11-02-site-focus-and-navigation-verify-review.md
?? .cg-docs/work-reports/2026-11-02-pip-next.md
?? .cg-docs/work-reports/2026-11-02-site-focus-and-navigation.md
?? site/assets/table-tools.js
?? tables/site_task_context.csv
?? tests/pipsys/check-site-browser.py
?? tests/pipsys/site-render-browser.html
?? tests/pipsys/site-table-browser.html
```

These unrelated dirty files were not edited. The design and helper command are working-copy evidence, not a claim that all inspected governing bytes equal HEAD (the helper itself is dirty).

## Authority and boundary

The actual pipdata Plan is revision 2, execution-gate blocked; it explicitly says no implementation approved (`pipdata/.cg-docs/plans/2026-11-02-m2-deflate-one-survey.md:12-20`). D1/D2/D3 are at lines 34-36. Its required separate population-on control and exact `c(8,24)/2/4 = c(1,3)` numerical check are at lines 54-56; it requires dynamic year output, retained LCU and final-weight provenance, not merely a table-or-NA outcome. Governing Decided Stage 3 and Stage 4 require LCU/day before deflation and dynamic `welfare_YYYY`, respectively (`pipsystem/SYSTEM_DESIGN.md:160-162`); all years reside in one survey file (`:201`). No Decided statement is changed here.

## D1: Existing synthetic input, not a new invented survey

**Current source facts.** The actual acceptance helper identifies `survey_id = AAA_2010_SYNA_V01_M_V01_A_GMD_GPWG`, `pip_id = AAA_2010_SYNA_INC_GPWG`, and file `AAA_2010_SYNA_V01_M_V01_A_GMD_GPWG.dta` (`pipdata/tests/testthat/helper-one-survey-upstream-acceptance.R:116-120`). Selection explicitly fixes AAA, 2010L, SYNA, income, GPWG, filename/checksum and Vermast/Veralt 01 (`:222-249`). This is synthetic offline data, not live DLW.

Raw input is four annual-LCU-per-capita observations, explicitly already person-weighted (`:122-131`):

| Row | hhid / pid | hsize | Annual welfare / welfshprosperity | Person weight | urban | age | male |
|---|---|---|---|---|---|---|---|
| 1 | h1 / p1 | 1 | 365 | 10 | 1 | 25 | 1 |
| 2 | h2 / p2 | 2 | 730 | 20 | 0 | 35 | 0 |
| 3 | h3 / p3 | 3 | 1095 | 30 | 1 | 45 | 1 |
| 4 | h4 / p4 | 4 | 1460 | 40 | 0 | 55 | 0 |

Common raw fields: `countrycode = AAA`, `year = 2010L`, `survname = SYNA`. The actual clean/readback test asserts `pipmd` and `data.table`, hhid/pid order unchanged, welfare/day `c(1,2,3,4)`, weights `c(10,20,30,40)`, area `urban,rural,urban,rural`, gender `male,female,male,female` and age `25,35,45,55` (`pipdata/tests/testthat/test-one-survey-upstream-acceptance.R:199-228`). Annual-to-daily conversion is exactly `/365` in `pipdata/R/pd_dlw_clean.R:190-211`; do not divide again in Phase 3 or multiply person weights by hsize.

Asserted identity/domain metadata: survey/country/acronym above, surveyid_year 2010, welfare_type income, reporting_level character `1`, distribution_type micro, aux_data_levels same, and every CPI/PPP/pop/GDP/PCE data-level attr national (`test-one-survey-upstream-acceptance.R:218-228`). Metadata repeats identities and reporting/distribution fields (`:239-244`). Raw year 2010L is a source fact; the acceptance assertions do not independently pin every clean column/type or all arbitrary attributes. `pip_vars()` only reorders selected present columns; its old column-subset code is commented (`pipdata/R/pd_dlw_clean.R:559-611`). Consequently this audit does NOT falsely call the asserted subset a complete clean column inventory. Full payload pins, not a hand-transcribed partial schema, are the proposed input identity.

**Historical exact pins, not freshly revalidated artifacts.** November 3 work report `pipdata/.cg-docs/work-reports/2026-11-03-one-survey-upstream-acceptance.md:91-109` records:

| Artifact | Version ID | Content hash |
|---|---|---|
| validated raw | 063817fba1dd3d77 | 484e3547f5ce1bf4 |
| CPI | 819a7a167a0836c8 | ac7acb9c9dc98475 |
| PPP | aff8c7abe3f13a19 | fb07faf47cb42d3d |
| PFW | bc7f1260a09df0ca | 1f687e6b93f71bb3 |
| population fixture | bf1ea71bce0d5b25 | e9ee2b95e5894e8c |
| GDP fixture | e03704f49fb995f8 | a5f1b6e304b6fef1 |
| PCE fixture | 467c1a19825ec680 | 50efb5d94b2e7265 |
| clean | 652f216767807d17 | 5e785953720f4d2e |
| metadata | 55f300af12e7f47e | fd6c38dbd49d7ff3 |

Recode version is `240076d6e122a07a` (`:104`). November 3 central handoff gives evidence root `E:/temp/pdu-20261103T1851184462870Z-1ca4e9b8/evidence` and V3 RDS name (`pipsystem/.cg-docs/orchestration/outputs/pipdata/one-survey-upstream-acceptance/20261103T162831Z-code/handoff.md:54-58,79-95`). These files/stores were not loaded or revalidated here. That handoff explicitly excludes deflation and M2 readiness (`:115-123`); its historical “no unresolved scientific decisions” statement at `:127-132` is not Phase 3 approval.

**Proposed D1.** Approve reuse of exactly this synthetic national microdata fixture and these reported clean/metadata input identities, conditional on exact payload/metadata verification before any future execution. If unavailable, regenerate through the already inspected fixture rather than silently choosing latest, real data, or a manual copy; record new actual pins. This technical regeneration/pin capture is not an additional scientific preference question.

## D2: Vintages, CPI units and consumed levels

**Keys and literal values.** Actual acceptance tests assert CPI key `(country_code,year,survey_acronym,reporting_level,cpi_year)`, PPP key `(country_code,reporting_level,ppp_year,release_version,adaptation_version)`, PFW key `(country_code,surveyid_year,welfare_type,is_alt_welf)` (`pipdata/tests/testthat/test-one-survey-upstream-acceptance.R:95-109`). PFW is exactly one AAA/2010/SYNA/income/nonalternative/national row with all five domains 1 (`:139-150`). PFW determines independent domain attributes via `pipdata/R/dependency_inputs.R:257-317`, not via national coverage alone.

CPI is for AAA, year 2010, SYNA, national; base-year/value pairs are 2005/1, 2011/1, 2017/1.2, 2021/1.4, survey_year 2010, ccf 1 in each row (`test-one-survey-upstream-acceptance.R:121-129`). Named metadata is `2005_national=1`, `2011_national=1`, `2017_national=1.2`, `2021_national=1.4` (`:245-246`). PPP metadata contains ALL nine vintages (`:247-253`), not one selected vintage per year:

| PPP year | Release/adaptation and value | Explicit proposed selection |
|---|---|---|
| 2005 | v1/v1 = 1 | v1/v1 = 1 |
| 2011 | v1/v1 = 1.1; v1/v2 = 1.2; v2/v1 = 1.3; v2/v2 = 1.35 | v2/v2 = 1.35 |
| 2017 | v1/v1 = 1.4; v1/v2 = 1.5 | v1/v2 = 1.5 |
| 2021 | v1/v1 = 1.6; v1/v2 = 1.7 | v1/v2 = 1.7 |

**What defaults actually mean.** `pipaux/R/aux_ppp.R:81-84,119-139` chooses option `pipaux.pppyear` (fallback 2017), then lexicographic max release and max adaptation within that release per country/year; `ppp_default` selects only the configured year while `ppp_default_by_year` selects the winning vintage in each year. Documentation's “default 2011” at `:78` is stale against fallback code. The fixture asserts ppp_default TRUE only for 2017 v1/v2 and ppp_default_by_year TRUE for the four proposed selections (`test-one-survey-upstream-acceptance.R:130-138`). The consumer snapshot deliberately loads `ppp_defaults=FALSE` (`pipdata/R/dependency_execution.R:234-254`); `pd_aux_attr` filters PPP only by country and constructs versioned names (`pipdata/R/pd_aux_attr.R:144-164,203-209`). `add_ppp` iterates every version supplied (`pipdata/R/pd_deflation.R:674-714`). No implicit “latest default” or approved vintage choice follows from any of that. Actual pipload default filtering internals are outside this assigned root audit and belong to the parent's adapter research.

**CPI/formula evidence.** `pipaux/R/aux_cpi.R:97-117` computes ccf = 1/cur_adj (missing cur_adj replaced by 1), but `:218-233` simply converts/melts the supplied CPI columns to cpi_value; it does not derive a new base-index ratio or normalize 100 to 1. `pd_aux_attr` selects CPI by country + surveyid_year + acronym (`pipdata/R/pd_aux_attr.R:135-143`), retains cpi_value only under year/level names (`:195-202`), and drops ccf from this numerical metadata. Independent CPI/PPP attrs select literal national broadcast or per-row area using separate lookups (`pipdata/R/pd_deflation.R:690-709,764-786`). The consumer passes welfare_lcu, PPP and CPI to `wbpip::deflate_welfare_mean` (`:907-928`). This audit did not read wbpip because it lies outside assigned roots. Parent separately reported wbpip HEAD `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`, `R/deflate_welfare_mean.R:32-35` as exactly welfare_mean / ppp / cpi and `:6-10` as requiring supplied CPI already include temporal/spatial/currency adjustment; this is explicitly parent-supplied evidence for its integrated report, not my direct inspection.

**Proposed units/adjustment choice.** For this synthetic fixture only, declare CPI dimensionless survey-price/base-price deflator ratios (not index points such as 120), PPP base-year LCU per international dollar, daily PPP welfare = daily LCU / CPI / PPP. Declare annual raw welfare already in the intended local currency and no further spatial/currency transformation needed; fixture sets wf_spatial_des=0, wf_currency_des=0, cur_adj=1 and ccf=1 (`helper-one-survey-upstream-acceptance.R:135-145,157-175`). Those settings are fixture evidence, not proof of a general production adjustment methodology. Neither the shown clean route nor the shown deflation arithmetic adds ccf multiplication (`pipdata/R/pd_dlw_clean.R:70-85,190-211`; `pd_deflation.R:439-458,858-865,920-928`). Never infer an extra ccf factor. If adjusted production data are later proposed, adjustment method remains a new scientific decision.

**Proposed bounded D2.** Select all four existing years and explicitly the four vintages in the table; keep their full-source artifact pins distinct from the four consumed vintage keys. Dynamic available-year handling remains required; do not implement four hardcoded year branches. Retain source metadata as an input, record the explicit selection as a rule, and produce one `welfare_YYYY` per selected year on the M2 internal route. Do not silently rewrite the pinned historical metadata or break public legacy `welfare_ppp_*` output naming. The row-aligned oracle is `c(1,2,3,4)` multiplied by 1 (2005), 20/27 (2011), 5/9 (2017), 50/119 (2021). These expected numbers are proposed arithmetic, not a new test run. Keep the Plan's smaller independent `c(8,24)/2/4=c(1,3)` control as well.

Reject missing required year/level/vintage coverage, duplicate full keys or duplicate selected vintage per year, NA/NaN/Inf or nonpositive CPI/PPP, before successful save. This is a proposed M2 rule, not current behavior: current `cpi_ppp_years()` uses the year intersection and logs mismatch (`pd_deflation.R:807-848`); named mappings lack complete-coverage/divisor checks, and exact projections reject absent/duplicate names but not positivity (`dependency_inputs.R:331-373`). Independent domain mapping controls must vary CPI without varying PPP and vice versa; an unused area/year CPI change must leave numeric output unchanged without claiming selective cache behavior (Plan `:54-56`).

## D3: Weights and population

**Local clean semantics, not a new sign rule.** `format_wgt()` uses existing weight, else weight_p, else weight_h, else 1/N with warning; converts to double; rejects missing/nonfinite/negative weights or nonpositive total (`pipdata/R/pd_dlw_clean.R:134-173`). Individual zero weights are permitted when total is positive. It does not normalize existing weights or multiply by hsize. Missing raw weight is nevertheless rejected by the actual selected GPWG validation before clean execution in the acceptance test (`test-one-survey-upstream-acceptance.R:32-67`); do not interpret fallback code as permission to bypass that gate. `format_wlf()` rejects missing column and nonfinite values after `/365` but has no local zero/negative rejection (`pd_dlw_clean.R:190-211`). Clean-save validation requires finite double welfare/weights, nonnegative weights and positive total, without a welfare sign restriction (`:636-659`). Deflation's own validator only checks data.table/class, required columns, NA values and required attribute presence (`pipdata/R/pd_deflation.R:6-50`), so it is weaker than the clean boundary.

Important distinction: the actual micro clean chain additionally calls `wbpip:::md_clean_data` (`pipdata/R/pd_wbpip_clean.R:37-47`) after local formatting (`pd_dlw_clean.R:70-85`). Its semantics cannot be inferred from local checks alone. Parent separately inspected wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`, `R/md_clean_data.R:58-88` (drops NA and negative welfare, retains zero), `:90-96` (sorts the whole table by welfare), `:102-132` (drops NA and nonpositive weights, including zero), and `:133-143` (supplies weight 1 only if weight_col NULL). This is parent-supplied evidence, not direct inspection in this audit. Thus local formatting/save validators allow some inputs that the actual intervening cleaner removes. The positive November 3 fixture does not exercise those edge cases. Bound Phase 3 to validated post-clean data; do not add silent row drops, imputation, normalization or welfare clamping at deflation, or infer a new raw-survey cleaning policy from this research.

**Population dispatch is not coverage.** Only sentinel `area` maps to a column (`pipdata/R/aaa.R:124-154`). Microdata adjusts iff pop_data_level resolves to a registered sentinel, regardless of reporting_level (`pd_deflation.R:449-458`); grouped data never adjusts (`:483-502`). Current fixture pop_data_level national therefore means primary adjustment OFF, not simply because coverage says national. Source tests explicitly preserve weights when CPI/PPP area but pop national (`tests/testthat/test-pd-deflation.R:772-791`). Its population is a supplemental saved fixture, not a certified population producer (`helper-one-survey-upstream-acceptance.R:196-210`); literal primary metadata is `2010_national=1000`, GDP 3500, PCE 2400 (`test-one-survey-upstream-acceptance.R:254-256`).

**Year/area/tie behavior.** Metadata projection filters population by country and surveyid_year exactly (`pipdata/R/pd_aux_attr.R:165-171`); resulting names are year_reporting_level (`:210-216`). Named population adjustment instead uses first observed `df$year[[1L]]`, requires a year column and hard-coded area column, groups weight sums by area, selects nearest year separately per exact area string, uses first entry on exact-year duplicate tie and inverse-distance weighted mean on nonzero-distance ties, then scales row weights by selected population / area sum (`pipdata/R/pd_deflation.R:1012-1078`). With equal-distance two-year ties the average is arithmetic because inverse distances are equal. It skips missing area candidates; only total absence aborts; partially missing areas can therefore left-join NA factors. There is no explicit finite/positive population or positive area-weight-sum check. Legacy table path differs: country/reporting_level joins and survey_year column (`:963-1009`). The proposed M2 fixture uses named vectors only. Do not claim closest-year/tie machinery was approved or tested merely because it exists, or that it is always reachable after exact-year metadata projection.

**Proposed bounded D3.** Primary: no adjustment, preserve exact `10,20,30,40`, no normalization/imputation, and use the existing positive validated post-clean fixture rather than decide new raw-survey sign handling. For a narrow post-clean microdata admissibility rule matching the parent's inspected cleaner, propose finite welfare >= 0 and finite weight > 0, rejecting invalid deflation inputs rather than re-cleaning them; this stricter weight rule is NOT already enforced by the local clean-save/deflation validators and requires explicit inclusion in approval. Zero welfare remains admissible; negative welfare, missing/nonfinite welfare, and missing/nonfinite/nonpositive weight do not silently disappear at deflation. Require a single observed year, equal to surveyid_year 2010, for this bounded fixture; require complete unique exact 2010 area population keys and finite positive area population and area weight sums whenever population is ON. No nearest-year fallback/tie averaging in this fixture. Reject mismatched/mixed years, missing/duplicate areas, nonfinite/nonpositive populations or zero area sums before successful save. This is a scoped proposal, not a change to public legacy matching or raw-survey cleaning policy.

Mandatory separate population-on control: reuse the same four rows, welfare and national CPI/PPP; use a separately pinned synthetic PFW/domain setup with pop_domain 2, resulting pop_data_level area (not a manual contradiction to the pinned original PFW), and exact `2010_urban=400`, `2010_rural=600`. Original area sums are 40 and 60, so final row-aligned weights are `100,200,300,400`. Change only pinned urban population to 800 in a second variant; weights become `200,200,600,400`; rural weights and all LCU/PPP welfare stay unchanged. National PPP/CPI and population-area mixed domains must retain `aux_data_levels=different` as resolved by `dependency_inputs.R:257-317`; reporting level may follow the existing resolver (default max domain=2 at `:288-297`), without changing the primary fixture. Save/read actual outputs and assert hhid/pid-aligned weights plus population/rule provenance, not sorted weight multisets. Both variants and their new pins are proposals, not existing November 3 artifacts. This control satisfies the Plan's mandatory population-dependence evidence without selecting a real survey or a population producer.

## Fewest actual user choices

Recommend ONE explicit scientific approval of the bounded D1-D3 bundle above, with any deviations named, rather than asking the user to invent survey IDs, pins, helper paths or runtime details. The consequential choices are synthetic-only primary and population control, the four named vintages/CPI ratio convention, no additional currency/spatial multiplier, and unchanged primary person weights with exact-year area population scaling only in the control. These can be approved together. Do not portray the approval as general scientific validation of production deflation, the external cleaner's edge behavior, execution permission, D8 approval, or a Decided design change.

## Functional acceptance to carry forward

No tests executed in this audit. One functional check per proposed behavior change:

| Proposed behavior | Smallest functional evidence required during separately authorized execution |
|---|---|
| Explicit vintage/year selection and dynamic columns | Real deflation/save/readback yields all four exact row-aligned oracles, keeps LCU/day, and picks up an added approved synthetic year without hardcoded branches. |
| Complete valid CPI/PPP coverage | Consumed CPI mutation changes arithmetic; unused area/year mutation does not; missing/duplicate mappings and nonpositive/nonfinite divisors yield no successful output. |
| Population-on aligned weights | Two actual saved/readback variants match `100,200,300,400` then `200,200,600,400`, with unchanged LCU/PPP and exact population/rule pins. |
| Bounded admissibility/year matching | Under the explicitly approved post-clean rule, zero welfare remains valid; negative/NA/nonfinite welfare, nonpositive/NA/nonfinite weights, nonpositive area sums, missing population and mixed/mismatched year reject without row deletion or successful save. |

Minimal first: no extra framework, dependency, projection-cache artifact, selector or generalized adjustment methodology. Recoverable broader matching/default selection and production scientific methodology belong in Later, not new blocking safeguards for the synthetic fixture.

## Changes
Only this support report. Destination passed existing tools/pipsys/pipsys.cmd check-path (inside E checkout). Parent handoff.md is not edited.

## Checks run
Read-only Git status --short --branch and rev-parse HEAD in pipdata, pipaux and pipsystem; direct source and acceptance helper/test inspection with line citations. Existing pipsys.cmd check-path returned `inside` for the exact destination before creation; its wrapper routes R temporary files to E (`tools/pipsys/pipsys.cmd:9-18`). No package tests, R package loads, installs, Git mutations or pipeline execution. The approved helper check invokes Rscript infrastructure but does not load any PIP package; no independent R process was otherwise started.

## Gaps
Scientific D1-D3 approvals remain ungranted. Historical saved-artifact bytes, full clean column inventory, and their retained-store availability were not loaded/revalidated; exact current input pins must be verified before future execution. External wbpip formula/cleaner evidence is parent-supplied and explicitly distinguished from direct inspection within these roots. The proposed stricter post-clean admissibility rule is not an existing local validator guarantee or implicit approval. D8/runtime safety, adapter/fingerprint changes, owner/execution environment and implementation remain outside this assignment. No production currency/spatial methodology, new population producer, scientific thresholds or nearest-year policy is certified here.
