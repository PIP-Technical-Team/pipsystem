# pipster and wbpip: M1 P1-P2 Evidence

## Evidence Record

- Date: 2026-10-07.
- **P** = `pipster`, `E:/PovcalNet/01.personal/wb384996/PIP/pipster`, SHA `828064e406e07e711c34d2ba725746e367d35f9b`.
- **W** = `wbpip`, `E:/PovcalNet/01.personal/wb384996/PIP/wbpip`, SHA `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`.
- **D** = this pipsystem worktree, SHA `84c384f78ed44bcb96bb19c6d364519df5b5db6f`.
- Citation prefixes bind each file and line reference to its full SHA above. Package paths are relative to their verified absolute source roots.
- Git command evidence: both package workers reported empty source status. For P, `git diff HEAD -- R tests NAMESPACE DESCRIPTION data-raw` was empty. For W, `git diff --exit-code HEAD -- R tests NAMESPACE` was empty. Cited text is committed source, not dirty content.
- Evidence type: source and test-source inspection. No tests, builds, package loading, or example-data scripts were executed. Separate Task workers read the two packages; only the coordinator writes this combined note.

## P1. pipster Today

**Answer: grouped-data calculations exist, but stages 5-7 are not complete.** Stage 5 is poverty-line-independent statistics; stages 6-7 are lineups and missing-country distributions (D: `SYSTEM_DESIGN.md:149-157`). The exported calculation set is grouped-data based (P: `NAMESPACE:3-12`).

| Calculation relevant to P1 | Source evidence at P | Limit |
|---|---|---|
| Quadratic and beta Lorenz fitting through `pipgd_params()` | `R/pipgd_params.R:33-99` | Stores a supplied mean; does not estimate the mean. |
| Lorenz validation and separate distribution/poverty selections | `R/pipgd_lorenz.R:30-128,195-241` | Validation also uses poverty-line or population-share calculations. |
| Cumulative welfare shares, within-quantile welfare shares, and quantile welfare values | `R/pipgd_dist.R:24-72,93-135,164-213` | Quantiles use a supplied mean, defaulting to 1. |
| Poverty headcount and poverty gap | `R/pipgd_pov.R:14-65,113-153,164-228,272-311` | Poverty-line-dependent calculations, not stage 5 outputs. |
| Poverty severity and Lorenz-curve output | `R/pipgd_pov.R:316-322`; `R/pipgd_lorenz.R:245-248` | Severity bodies are empty; Lorenz-curve function returns TRUE. Neither is exported (`NAMESPACE:3-12`). |

No dedicated microdata mean, median, or Gini estimator was found in the inspected runtime source. Input preparation/classification is not indicator calculation or a missing-country method (P: `NAMESPACE:3-12`; `R/as_pip.R:79-100,181-199`; `R/identify_pip_type.R:116-142`). No stage 6-7 entry point was found in the inspected R files or exports. Full current-pipeline methodology remains UNKNOWN and belongs to M4 (P: `NAMESPACE:3-12`; D: `HARVEST_BRIEF.md:129-131`).

**File access:** calculation return paths have no direct file read/save calls; they accept vectors/lists and return in-memory values (P: `R/pipgd_params.R:33-41,91-99`; `R/pipgd_lorenz.R:119-128,234-241`; `R/pipgd_dist.R:64-72,128-135,206-213`; `R/pipgd_pov.R:57-65,148-153,218-228,306-311`). Output formatting returns a list, data.table, or vector (P: `R/utils.R:34-65`). Separate example-data preparation scripts call `usethis::use_data()` and are not runtime calculations (P: `data-raw/pip_gd.R:13-33`; `data-raw/pip_md.R:9-29,34-51,62-71`). Transitive file access in all dependencies is UNKNOWN. Several numerical calls use private wbpip functions, so source presence does not establish independent numerical implementations (P: `R/pipgd_params.R:54-89`; `R/pipgd_lorenz.R:73-104,202-227`).

**Test-source evidence, not executed results:** parameter tests assert class only; Lorenz tests assert classes and pipe/direct equality; the distribution test is only `expect_equal(2 * 2, 4)` (P: `tests/testthat/test-pipgd_params.R:1-9`; `tests/testthat/test-pipgd_lorenz.R:5-31`; `tests/testthat/test-pipgd_dist.R:1-3`). Preparation tests cover conversions and ordering, not numerical indicators (P: `tests/testthat/test-as_pip.R:1-81,89-110`).

Reuse limits visible in source, not reproduced failures:

- Quantile-share code does not forward its grid/Lorenz arguments to the cumulative-share call (P: `R/pipgd_dist.R:93-100,116-135`).
- A quadratic poverty-fit call receives beta-regression coefficients; intended behavior is UNKNOWN (P: `R/pipgd_lorenz.R:214-219`).
- Poverty functions default to `selected_lorenz$for_dist`, although a `for_pov` selection exists (P: `R/pipgd_pov.R:48-55,198-215`; `R/pipgd_lorenz.R:229-232`).
- Untouched options set complete output TRUE, while poverty defaults select `dt`; the formatter rejects complete output unless the format is `list` (P: `R/zzz.R:1-4`; `R/pipgd_pov.R:123-127,281-285`; `R/utils.R:20,41-42`). Runtime success is UNKNOWN.

## P2. wbpip Reference

**Answer: stage 5 reference contracts are source-supported; full stages 6-7 remain UNKNOWN.** The following is the requested calculation-contract list, not a package function inventory. These contracts take one distribution, not all PPP-year columns at once (W: `R/md_compute_dist_stats.R:19-24`; `R/gd_compute_dist_stats.R:18-21`; D: `SYSTEM_DESIGN.md:166-170`).

### Microdata Stage 5

`md_compute_dist_stats(welfare, weight, mean = NULL, nbins = 10, lorenz = NULL, n_quantile = 10)` returns a list with `mean`, `median`, `gini`, `polarization`, `mld`, and `quantiles`. Despite the return-type comment, this is not a data.frame. The primary wrapper is internal; its scalar/Lorenz helpers are exported except for the share helper (W: `R/md_compute_dist_stats.R:17-64`; `NAMESPACE:39-50`).

| Output to reproduce | Entry point / reference rule | Evidence at W |
|---|---|---|
| Mean | `md_compute_dist_stats()` uses the supplied mean or `fmean(welfare, w = weight)`. | `R/md_compute_dist_stats.R:19-28,58-64`; `tests/testthat/test-md_compute_dist_stats.R:12-20,36-57` |
| Median | `md_compute_median()` selects central Lorenz points by distance from cumulative population share 0.5; it is not a general interpolated quantile. | `R/md_compute_quantiles.R:99-131`; `tests/testthat/test-md_compute_quantiles.R:104-129` |
| Gini | `md_compute_gini()` uses cumulative weighted welfare and trapezoid area. | `R/md_compute_gini.R:15-34`; `tests/testthat/test-md_compute_gini.R:4-44` |
| MLD | `md_compute_mld()` uses weighted `log(mean / welfare)`; values at or below zero become 1 after the mean is obtained. | `R/md_compute_mld.R:12-25`; `tests/testthat/test-md_compute_mld.R:3-24` |
| Wolfson polarization | `md_compute_polarization()` uses median-based FGT calculations and `2 * ((1 - gini) * mean - mean_below50) / median`. | `R/md_compute_polarization.R:26-49`; `tests/testthat/test-md_compute_polarization.R:20-78,83-127` |
| Decile welfare shares | `md_compute_quantiles_share()` returns differences of cumulative Lorenz welfare shares, named `quantiles` in the primary list. | `R/md_compute_dist_stats.R:36-39,58-64`; `R/md_compute_quantiles.R:16-38`; `tests/testthat/test-md_compute_quantiles.R:7-48` |

Related contracts must remain distinct: `md_compute_lorenz()` returns `welfare`, `lorenz_welfare`, and `lorenz_weight`; `md_compute_quantiles()` returns welfare cutpoints, not welfare shares (W: `R/md_compute_lorenz.R:24-93`; `R/md_compute_quantiles.R:56-83`; `tests/testthat/test-md_compute_lorenz.R:3-12,68`; `tests/testthat/test-md_compute_quantiles.R:54-99`).

Input preparation matters: the wrapper passes original vectors to Gini without sorting there. `md_clean_data()` sorts welfare, and the wrapper test cleans its fixture first. Comparisons must use the same preparation (W: `R/md_compute_dist_stats.R:19-56`; `R/md_compute_gini.R:15-34`; `R/md_clean_data.R:90-96`; `tests/testthat/test-md_compute_dist_stats.R:1-7`). BIN follows the microdata branch by target design, not a demonstrated separate wbpip BIN estimator (D: `SYSTEM_DESIGN.md:58-64`).

### Grouped Stage 5

`gd_compute_dist_stats(welfare, population, mean, p0 = 0.5)` takes cumulative welfare/population proportions and a supplied mean. It returns `mean`, `median`, `gini`, `mld`, `polarization`, and `deciles` (W: `R/gd_compute_dist_stats.R:6-21,95-105`; `R/gd_compute_pip_stats.R:6-15`).

Both quadratic and beta Lorenz forms are fitted. Their regression SSE is replaced with Lorenz-point SSE before distribution-model selection. Selection uses validity and SSE; the supplied mean is not inferred from shares. Neither-valid output contains missing distribution statistics (W: `R/gd_compute_dist_stats.R:24-93,213-244,286-326`; `R/gd_select_lorenz.R:168-199,266-277`). Both forms compute Gini, MLD, polarization, median as `mean * Lorenz_derivative(0.5)`, and decile welfare shares rather than cutpoints (W: `R/gd_compute_pip_stats_lq.R:410-423,529-575`; `R/gd_compute_pip_stats_lb.R:294-308,388-426`).

Grouped preparation differs by input type: type 1 normalizes cumulative values; type 2 cumulatively sums shares then normalizes; type 5 derives welfare shares from population times welfare before cumulative summation (W: `R/gd_clean_data.R:92-151`). `gd_estimate_distribution()` prepares these inputs, but returns poverty plus distribution statistics, not a synthetic vector (W: `R/gd_estimate_distribution.R:29-76`; `tests/testthat/test-gd_estimate_distribution.R:1-55`).

**Inspected tests:** direct grouped tests compare all six outputs with a mixed wrapper, check benchmarks, and include a Lorenz-selection regression case. The PCN MLD benchmark is explicitly skipped (W: `tests/testthat/test-gd_compute_dist_stats.R:5-48,51-78`). No test was run.

### Grouped Synthetic Distribution

`sd_create_synth_vector(welfare, population, mean, pop = NULL, p0 = 0.5, nobs = 1e5, selected_model = NULL, verbose = FALSE)` evaluates the selected Lorenz derivative at midpoint probabilities and multiplies by mean. It returns a data.table with `welfare` and `weight`, `nobs` rows, and weights 1 or `pop / nobs` (W: `R/sd_create_synth_vector.R:26-85,92-151,159-171`).

This path retains regression SSE, unlike the direct grouped-statistics path's Lorenz-point SSE. Do not assume the two paths select the same model or produce equal statistics (W: `R/gd_utils.R:24-56`; `R/sd_create_synth_vector.R:47-85,107-112`; `R/gd_compute_dist_stats.R:39-44,73-77`). Synthetic test source checks shapes and weights, not equality to direct grouped statistics (W: `tests/testthat/test-sd_create_synth_vector.R:3-13`; `tests/testthat/test-sd_compute_dist_stats.R:3-60`).

### Other Stage 5 Reference Outputs

`get_palma_ratio()` returns top-decile share divided by bottom-four-decile share; `get_9010_ratio()` returns top-decile share divided by bottom-decile share. Both map negative inputs to missing output. These can consume either data type's decile shares but are not in the primary six-output lists. Whether they are mandatory is UNKNOWN because the design does not fix the complete statistic set (W: `R/low-hanging_indicators.R:128-157,169-185`; `tests/testthat/test-low-hanging_indicators.R:242-310,319-349`; D: `SYSTEM_DESIGN.md:155,168-170`).

Poverty-dependent `md_compute_pip_stats()` and `gd_compute_pip_stats()` mix distribution and poverty results. Production wrappers return only poverty line, mean, median, headcount, gap, severity, and Watts. They are not substitutes for the poverty-line-independent six-output contracts (W: `R/md_compute_pip_stats.R:51-63`; `R/gd_compute_pip_stats.R:69-82`; `R/prod_md_compute_pip_stats.R:52-60`; `R/prod_gd_compute_pip_stats.R:65-74`).

### Stages 6-7

Full microdata and grouped-data lineup entry points, selection rules, factors, distribution outputs, and missing-country cross-country inputs remain UNKNOWN. These are assigned to the M4 targets harvest (D: `HARVEST_BRIEF.md:129-131`; `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:116-126`). Do not substitute these helpers:

- `predict_request_year_mean()` predicts one or two means, not distributions (W: `R/predict_request_year_mean.R:69-105`; `tests/testthat/test-predict_request_year_mean.R:1-81`).
- `fill_gaps()` requires a poverty line and averages statistics for supplied surveys, not the target distribution output (W: `R/fill_gaps.R:81-106,117-159`; D: `SYSTEM_DESIGN.md:156,172`).
- The `imputed` dispatch branches return NA or call microdata statistics; they do not construct missing-country distributions (W: `R/compute_pip_stats.R:61-64`; `R/prod_compute_pip_stats.R:33-45`).

## Decided Contradictions

No direct contradiction is established from P1. Missing target calculations are implementation gaps, not design decisions. Calculation-only ownership is still Open; example-data save scripts do not contradict an approved calculation-only rule (D: `SYSTEM_DESIGN.md:7,283,295,297`; P: `tests/testthat/test-pipgd_lorenz.R:20-29`).

No confirmed Decided stage 5 contradiction is established from P2. Existing list outputs differ from the proposed long table, but the latter is Open (W: `R/md_compute_dist_stats.R:58-64`; `R/gd_compute_dist_stats.R:95-105`; D: `SYSTEM_DESIGN.md:168-170`). The different grouped SSE rules are reference-contract risks, not approved design changes.

## Gaps

- UNKNOWN: executed numerical correctness and default-call success. Tests were inspected only, and several inspected tests provide no independent numerical benchmark.
- UNKNOWN: the complete mandatory statistic set, long-table output approval, and automatic per-PPP-year driver (D: `SYSTEM_DESIGN.md:166-170`).
- A dedicated mean estimator is not present in the inspected pipster export/calculation paths; the M2 mean step is not already supplied by the harvested package (P: `NAMESPACE:3-12`; `R/pipgd_params.R:93-98`).
- UNKNOWN: transitive file access in all calculation dependencies.
- UNKNOWN: equality between direct grouped and synthetic-vector statistics. Inspected synthetic tests check shape/weights only, and the source uses different SSE definitions (W: `tests/testthat/test-sd_compute_dist_stats.R:3-60`; `R/gd_compute_dist_stats.R:39-44,73-77`; `R/sd_create_synth_vector.R:47-85,107-112`).
- Grouped MLD/Watts benchmarks and local production-data tests have skips or environment gates; they are not passing evidence (W: `tests/testthat/test-gd_compute_dist_stats.R:47-48`; `tests/testthat/test-gd_compute_pip_stats.R:27-28`; `tests/testthat/test-gd_compute_dist_stats-local.R:1-4,58-59`).
- UNKNOWN: full lineup and missing-country inputs and behavior. The harvest contract assigns current-pipeline targets inspection to M4 (D: `HARVEST_BRIEF.md:129-131`).
