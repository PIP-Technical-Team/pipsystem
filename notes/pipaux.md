# pipaux: M1 Evidence A1-A4

## Evidence Record

- Date: 2026-10-07.
- Read-only package: `E:\PovcalNet\01.personal\wb384996\PIP\pipaux`.
- Evidence SHA, called **P** below: `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` (`git rev-parse HEAD`, checked before and after source inspection).
- Every package file and line citation below is relative to that package and is at **P**. No package facts use uncommitted text.
- `git status --short`, before and after inspection: `?? compound-gpid.local.md`. This untracked file was not read as package evidence. The repository is not fully clean, but all cited source and test files are clean against HEAD.
- Verification: `git ls-files -- R tests DESCRIPTION` lists the cited package files as tracked. `git diff HEAD -- R tests DESCRIPTION` returned no output. This check includes both staged and unstaged changes against HEAD.
- Code and test source were read. **No tests were executed.** A test citation means an assertion or skip found in test source, not a passing result.
- Scope: A1-A4 only. The approved strategy leaves design proposals Open and requires S1, A1, and D2 together for the row-level decision (`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:151-179`, current worktree). No design decision or implementation is made here.

## A1. Granularity

**Answer: complete-measure requests at the pipaux boundary, not requests for only a survey's needed rows. Actual survey selection is UNKNOWN within this package.** The CPI, PPP, and population wrappers have no country, survey, reporting-level, or year row-filter argument. Their load branches call `pipload::load_aux_data()` with only `measure` and `verbose`, then return the result. Physical file-read behavior belongs to `pipload`, not to the inspected wrapper code. Evidence at P: `R/aux_cpi.R:14-18,55-60`; `R/aux_ppp.R:12-17,61-63`; `R/aux_pop.R:10-14,35-39`.

Whole-measure loading followed by a subset is visible inside pipaux: `aux_pfw_key()` loads PFW and CPI, selects columns, and joins in memory. It does not request a survey partition from the loader. Evidence at P: `R/aux_pfw.R:240-260`.

The natural **row-level partition candidates** below are the keys supplied to the save call. These are proposals based on existing keys, not implemented partitions or an approved invalidation rule.

| Series | Row-level partition candidate | Source evidence at P | Test-source evidence at P |
|---|---|---|---|
| CPI | `country_code`, `year`, `survey_acronym`, `reporting_level`, `cpi_year` | `R/aux_cpi.R:185-187,214-242` defines the full key, reshapes CPI base years into rows, and passes `pk` to the save wrapper. | `tests/testthat/test-cpi.R:144-152` asserts rejection of duplicate country/calendar-year/survey/reporting-level rows in the **wide, pre-melt** schema. It does not test the persisted long key with `cpi_year`. |
| PPP | `country_code`, `reporting_level`, `ppp_year`, `release_version`, `adaptation_version` | `R/aux_ppp.R:251-271` supplies all five fields as `pk`; `R/aux_ppp.R:339-344` validates this key. | `tests/testthat/test-ppp.R:92-101` asserts rejection of duplicates across all five fields. |
| Population | `country_code`, `year`, `reporting_level` | `R/aux_pop.R:191-200` supplies the key; `R/aux_pop.R:410-413` validates it. | `tests/testthat/test-pop.R:189-196` asserts rejection of duplicates across those fields. |

Important distinctions for these candidate keys:

- CPI `year` comes from raw `year`, through `cpi_year`, then a rename. Saved `cpi_year` is subsequently created from the melted base-year column names. Fractional `survey_year` comes from `ref_year` and is not in the saved primary key. Evidence at P: `R/aux_cpi.R:103-107,176-187,214-225`.
- CPI also carries `ccf = 1 / cur_adj`; a candidate row dependency must not track only `cpi_value` if the consumer uses `ccf`. Consumer use is UNKNOWN here. Evidence at P: `R/aux_cpi.R:84-98`.
- PPP contains more than one release/adaptation version. Default flags depend on maximum release and adaptation versions within country and PPP year. A change that adds a version can therefore change default flags on other rows. Evidence at P: `R/aux_ppp.R:113-129`.
- Population special-case values update the main population table by country, year, and population data level; this level is later renamed `reporting_level`. Evidence at P: `R/aux_pop.R:112-116,146-152,170-171`.
- Each main series is saved under one measure ID with its primary key, not by an explicit partition call in these update functions. Evidence at P: `R/aux_cpi.R:236-242`; `R/aux_ppp.R:265-271`; `R/aux_pop.R:194-200`.

Test limits: the CPI clean and wrapper integration cases are skipped in source (`tests/testthat/test-cpi.R:160-166`, P). PPP and population wrapper integration cases are also skipped (`tests/testthat/test-ppp.R:161-163`; `tests/testthat/test-pop.R:204-206`, P). The keys are source-supported candidates; actual partition-parent support and the rows each survey consumes require S1 and D2. Neither is established by these tests.

## A2. Dependency Chain

**Answer: dependencies exist as data that another program can read, and actual input dependencies also exist in code. Completeness and agreement between these two sources are UNKNOWN.**

The data path is `read_dependencies()`. It constructs `https://raw.githubusercontent.com/<owner>/pipaux/metadata/Data/new_dependency.yml`, calls `yaml::read_yaml()`, and converts each nonempty comma-space-separated value into a character vector. `process_dependencies()` reads this graph for `PIP-Technical-Team`, gets the current measure's dependencies, and calls `aux_fun()` for each one. A processed environment prevents repeated processing. Evidence at P: `R/utils.R:490-500`; `R/update_aux_data.R:67-90`.

`update_aux_measures()` reads the same manifest, takes its names as available measures, and preserves that order when a subset is requested. Evidence at P: `R/update_aux_data.R:421-449`.

The actual GDP inputs in code are:

| Input relationship | Evidence at P |
|---|---|
| GDP reads Maddison, WEO, and WDI through the auxiliary loader. | `R/aux_gdp.R:93-100` |
| GDP reads special national accounts, fiscal-year metadata, and nowcast rates from GitHub. | `R/aux_gdp.R:104-127` |
| GDP reads the country list. | `R/aux_gdp.R:130` |
| GDP combines WDI with WEO and then Maddison, grouped by country. | `R/aux_gdp.R:188-212` |
| PCE reads WDI, special national accounts, and fiscal-year metadata. | `R/aux_pce.R:62-83` |
| CPI, PPP, population, and PFW cleaning also depend on the country list. | `R/aux_cpi.R:128-130`; `R/aux_ppp.R:205-207`; `R/aux_pop.R:157-161`; `R/aux_pfw.R:149-162` |

The remote manifest was not fetched. Its contents, commit SHA, and agreement with these code dependencies are **UNKNOWN**. The inspected reader does not select a commit SHA or the current release in the URL. Evidence for that reader behavior at P: `R/utils.R:490-500`; `R/update_aux_data.R:70-73`. This is not evidence that a specific remote graph contains any particular edge.

These main-series and GDP save calls do not explicitly supply `parents`; the save wrapper accepts and forwards `...`. Whether pipload creates any lineage implicitly is **UNKNOWN** here. Do not treat the YAML execution graph as proof of registered stamp lineage. Evidence at P: `R/aux_cpi.R:236-242`; `R/aux_ppp.R:265-271`; `R/aux_pop.R:194-200`; `R/aux_gdp.R:58-65`; `R/utils.R:470-485`.

Test-source evidence: dependency processing and update execution cases are skipped for external-resource requirements (`tests/testthat/test-update_aux_data.R:54-70`, P). The GDP wrapper integration case is skipped (`tests/testthat/test-gdp.R:64-68`, P). The GDP duplicate-key test covers the output key, not correctness of the dependency chain (`tests/testthat/test-gdp.R:51-58`, P).

**Decided contradiction:** the target design says a GitHub copy of generated GDP is never an input (`SYSTEM_DESIGN.md:100`, current worktree). At P, `aux_gdp_update()` saves generated GDP to GitHub (`R/aux_gdp.R:368-374`). `aux_gdp()` then reads GDP back from GitHub after that update and sends it to the local save wrapper (`R/aux_gdp.R:34-65`). This is current-code behavior that conflicts with the target rule, not permission to change the rule or code.

## A3. Hashes Today

**Answer: pipaux already uses stamp. The exact cleaned-data content-hash algorithm and write-side storage are UNKNOWN from pipaux alone. Code hashes and raw GitHub file SHAs are visible and must not be confused with cleaned-data hashes.**

| Hash or persistence question | Answer and evidence at P |
|---|---|
| Does pipaux use stamp? | Yes. It directly reads sidecars with `stamp::st_read_sidecar()` (`R/check_status.R:133-139`), obtains primary keys and version metadata with stamp (`R/identify_changes.R:348-361,400-401`), and calls stamp option functions (`R/stamp_options.R:59-65,79-82,94-104`). `DESCRIPTION:41-42` declares the import. |
| How does the local save path work? | `pip_aux_save()` gets the configured auxiliary alias and delegates to `pipload::pip_write(x, id, alias, verbose, ...)`. It does not compute a data hash itself. Evidence: `R/utils.R:470-487`. CPI/PPP/population callers pass `pk`, GitHub metadata, generator code, and a code label (`R/aux_cpi.R:236-242`; `R/aux_ppp.R:265-271`; `R/aux_pop.R:194-200`). |
| How is the generator code hash computed? | `hash_code()` calls the private `stamp:::st_hash_code(x)`. The exact algorithm belongs to stamp and is UNKNOWN in this package-only inspection. Evidence: `R/utils.R:539-541`. |
| Where is the stored generator hash read? | The status check opens the sidecar using a `<measure>.qs2` path, reads `sidecar$code_label`, gets that function, computes its hash, and compares it with `sidecar$code_hash`. Evidence: `R/check_status.R:133-139,244-256`. The sidecar's physical serialization and write logic are UNKNOWN here. |
| What is compared against GitHub? | The status check reads `sidecar$gh`, fetches each raw file's current GitHub `sha`, and compares it with stored `gh_raw_sha`. Missing or unequal SHAs mark a mismatch. Evidence: `R/check_status.R:171-196,210-238`. This check is not a comparison of cleaned data content. |
| Is a cleaned-data content hash used by this status check? | Not in the inspected function. It loads the measure but decides `update_y` from raw-file SHA mismatch or generator-code change. Evidence: `R/check_status.R:154-168,244-270`. What pipload/stamp does on saving the result is UNKNOWN here. |
| What versioning options are supplied? | The reset helper supplies `versioning = "content"`, `retain_versions = Inf`, `force_on_code_change = TRUE`, and `code_hash = TRUE`. Evidence: `R/stamp_options.R:94-104`. This does not prove the current session ran the reset helper or that identical rebuilt data stop a downstream cascade. |

There is already row-comparison code: `compare_vintage_versions()` loads latest and previous whole measures, gets their primary key and stamp versions, and uses `myrror` to extract changed values and rows. This is comparison code, not row hashes or proof of survey invalidation. Evidence at P: `R/identify_changes.R:321-361,400-431,445-465`.

Test-source limits: the save-wrapper test is skipped for filesystem access (`tests/testthat/test-utils.R:47-51`, P); the stamp-option test is explicitly skipped as not implemented (`tests/testthat/test-stamp_options.R:1-3`, P); the direct Y-drive-status test is skipped (`tests/testthat/test-check_status.R:43-47`, P). No executed content-hash or early-cutoff result is claimed.

**Target-design limit:** the target requires commit detection followed by data-content detection, with no downstream trigger for unchanged data (`SYSTEM_DESIGN.md:91-96`, current worktree). The current status policy sets `update_y = TRUE` whenever GitHub needs an update (`R/check_status.R:338-355`, P), and its other local check uses raw-file and code hashes, not cleaned-data hashes (`R/check_status.R:210-270`, P). Therefore this status path does not establish the target's no-change rule. Save-time cutoff and downstream behavior remain UNKNOWN until L1/S3 evidence is combined.

## A4. PFW

**Answer: the saved primary key is country, survey ID year, and welfare type. PFW stores inclusion and settings fields, including a BIN flag, but pipaux does not establish an explicit HIST-versus-BIN or GPWG module-selection rule.**

| PFW role | Answer and evidence at P |
|---|---|
| Saved primary key | `country_code`, `surveyid_year`, `welfare_type`, passed as `pk` to `pip_aux_save()` (`R/aux_pfw.R:215-227`). `survey_acronym` and `pfw_id` are not in this saved key. |
| Raw validation key | Nonmissing `code`, `year`, `survname`, with uniqueness across those fields (`R/aux_pfw.R:449-452`). |
| Clean validation key | Nonmissing `country_code`, `year`, `welfare_type`; uniqueness additionally includes `is_alt_welf` (`R/aux_pfw.R:636-639`). This differs from the saved key: `year` versus `surveyid_year`, and an additional alternative-welfare flag. |
| Inclusion | `inpovcal == 1` is the active filter in `pfw_report_lvl()` and the countries builder (`R/aux_pfw.R:670-674`; `R/aux_countries.R:33-40`). Both raw and clean PFW validators allow only value `1`, not a stored exclusion value `0` (`R/aux_pfw.R:427-430,614-617`). The cleaner does not filter `inpovcal` between copying input and returning output (`R/aux_pfw.R:52-166`). |
| Alternate welfare rows | Cleaning maps `datatype` to `welfare_type`, marks main rows `is_alt_welf = FALSE`, and adds rows with `is_alt_welf = TRUE` when `oth_welfare1_type` is nonempty (`R/aux_pfw.R:65-114,119-138`). |
| Data-type choices | `use_imputed`, `use_microdata`, `use_bin`, and `use_groupdata` are numeric flags constrained to `0/1` (`R/aux_pfw.R:524-539`). They are settings, not proof of a specific module-selection procedure. |
| Coverage, timing, and comparability settings | Cleaning maps survey coverage to national/rural/urban, `ref_year` to rounded `survey_year`, `rep_year` to `reporting_year`, and `comparability` to `survey_comparability` (`R/aux_pfw.R:65-114`). |
| Deflation and domain settings | Validation includes `wf_baseprice`, `wf_baseprice_note`, `wf_baseprice_des`, `wf_spatial_des`, `wf_spatial_var`, `cpi_replication`, `cpi_domain`, `cpi_domain_var`, `wf_currency_des`, `ppp_replication`, `ppp_domain`, `ppp_domain_var`, temporal/spatial adjustment fields, `tosplit`, and `tosplit_var` (`R/aux_pfw.R:560-613`). These field checks do not define every value's downstream meaning. |
| Other series settings | `gdp_domain`, `pce_domain`, and `pop_domain` are constrained to `1/2` (`R/aux_pfw.R:622-633`). The reporting-level helper uses the maximum of these and CPI/PPP domains (`R/aux_pfw.R:661-682`). |
| Survey preference | `preferable` exists and is checked only as character (`R/aux_pfw.R:546-547`). How it chooses among surveys is UNKNOWN in this package. |
| Module to use, including HIST versus BIN | `use_bin` is explicit, but no HIST/BIN precedence or module selector is defined in the inspected PFW cleaner, updater, or reporting helper (`R/aux_pfw.R:52-232,528-539,653-715`). The validator and test fixtures do not require a `module` field (`R/aux_pfw.R:479-640`; `tests/testthat/test-pfw.R:69-130`). The cleaner retains unlisted columns, so this is not proof that actual external PFW data cannot carry a module field. Actual source-file schema and module-choice semantics are UNKNOWN. |

Test-source evidence: duplicate raw-key assertions use country/year/survey (`tests/testthat/test-pfw.R:186-193`, P). Duplicate output assertions use country/year/welfare (`tests/testthat/test-pfw.R:237-244`, P), not the saved `surveyid_year` key. The output fixture lacks `is_alt_welf` and uses region codes outside the source validator's allowed set (`tests/testthat/test-pfw.R:69-130`; `R/aux_pfw.R:480-481,638-639`, P). These negative tests cannot establish that the intended duplicate-key check is the sole reason for an error. BIN-range assertions are present (`tests/testthat/test-pfw.R:217-220`, P); the PFW wrapper integration case is skipped (`tests/testthat/test-pfw.R:282-284`, P).

**Decided contradiction/contract limit:** the target says PFW records exclusions that remove surveys (`SYSTEM_DESIGN.md:108-112`, current worktree). The current raw and clean validators accept only `inpovcal = 1`, so an explicit `inpovcal = 0` exclusion cannot pass this validation path (`R/aux_pfw.R:427-430,614-617`, P). Exclusion by deleting a row, another field, or another source process is UNKNOWN. The saved-key/validation-key mismatch must also be resolved before relying on PFW row changes; no design change is made here.

## Gaps

- **UNKNOWN:** physical selective loading and the exact CPI/PPP/population rows used by a survey. A1 gives the pipaux request boundary and stored keys; combine it with pipdata D2 and stamp S1 before selecting row-level invalidation.
- **UNKNOWN:** the remote dependency manifest's contents, commit SHA, reproducibility, and agreement with code inputs. The reader is data-readable but its graph was not fetched or validated.
- **UNKNOWN:** exact cleaned-data hash algorithm, normalization, storage format, save-time early cutoff, and registered parent lineage. These operations cross the pipload/stamp boundary.
- **UNKNOWN:** the external PFW source schema, how exclusions are represented upstream, and the meanings or precedence of `preferable`, `use_microdata`, `use_bin`, and `use_groupdata` for HIST/BIN/GPWG selection.
- **Contract risk:** CPI tests cover the wide pre-melt key, not the saved long key. PFW validation and persistence use different keys; current negative PFW fixtures do not isolate key validation.
- **Decided conflicts:** generated GDP is read back from GitHub; explicit PFW `inpovcal = 0` fails the current validators. Record these for coordinator review; do not change Decided items.
- **Execution gap:** no tests were run. The cited external-resource integration cases and stamp-option case are skipped in test source, so no runtime success or performance claim is available.
