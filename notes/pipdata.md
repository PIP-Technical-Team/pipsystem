# pipdata: M1 Evidence

## Evidence Boundary

- Source directory: `E:\PovcalNet\01.personal\wb384996\PIP\pipdata`.
- Recorded HEAD: `84442e979c98d33fa5565ab9e56d3179cc7d5278`.
- In this file, **P** means that full pipdata SHA. Every package file and line reference below is at **P**, unless a different SHA is stated.
- `git status --short` returned no output before collection and before this note was written. `git rev-parse HEAD` returned the same SHA at both checks.
- `git diff --exit-code HEAD -- R tests inst/extdata/validation_spec.yml DESCRIPTION` returned no output and exit code 0. The cited source, specification, and test text is clean against HEAD. No dirty-source limitation applies.
- Evidence type: source and test-source inspection only. No tests were executed. Test expectations below are not test-pass results. Runtime, installed-package, DLW, Y-drive, and Windows/SMB results are `UNKNOWN`.
- Scope: D1-D4 only. The approved strategy keeps design proposals Open until approval and makes D2 an input to the row-level change-detection decision (`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:151-179`). No design decision or implementation is made here.

## D1. Module Rule

**Answer: PARTIAL. Module filtering and version selection exist. A new-pipeline module preference rule, HIST-versus-BIN decision, and cross-acronym survey-choice rule are UNKNOWN in pipdata.**

| Question | Observed source behavior | Evidence at P |
|---|---|---|
| Where is module selection? | Acquisition selects all requested supported modules. The active set is GPWG, GROUP, BIN, HIST, ALL. It compares filename/checksum and availability; this is not a preference ranking between modules. | `R/pipdata_dlw_compare.R:1-7,211-250` |
| Does latest-version selection choose one module? | The legacy `valid_dlw_load()` filters by the caller's module set and calls `last_ver_inv()`. That function takes maximum master, harmonization, and pipeline versions **within** country, year ID, acronym, module, and tool. It then keeps valid rows from all five modules. HIST and BIN remain separate groups. | `R/valid_dlw_load.R:89-123`; `R/utils.R:335-365` |
| What does the current staged engine use? | `pd_run_pipeline()` normalizes a completed-validation inventory. The filter removes retries and duplicate rows, but does not rank modules. The dependency planner creates a clean node per supplied DLW `survey_id`, not one preferred module per survey identity. | `R/pd_run_pipeline.R:342-365`; `R/dependency_execution.R:1-17`; `R/dependency_plan.R:33-55` |
| Where is HIST versus BIN chosen? | No rule was found in the inspected pipdata source and tests. The observed grouping and node construction preserve module-specific inputs. The location of a survey-specific HIST/BIN choice is UNKNOWN. | `R/utils.R:341-364`; `R/dependency_plan.R:33-55` |
| Where is the choice between same-welfare surveys made? | PFW lookup uses country, year ID, and **acronym**, then `inpovcal == 1`. It rejects duplicate same-welfare rows within that lookup. Exact planning also rejects duplicate welfare types in the selected acronym. Neither path selects a winner across different acronyms. The mechanism that assigns the inclusion choice to PFW is UNKNOWN here. | `R/get_country_pfw.R:34-51,88-120`; `R/dependency_inputs.R:183-236` |
| How is module retained? | The cache ID includes country, year ID, acronym, INC/CON, and module. Module selection is therefore not replaced by a module-free identity in this code. | `R/get_country_pfw.R:202-239` |

**Test-source evidence at P:** `tests/testthat/test-get-country-pfw.R:58-93` expects exclusion of `inpovcal != 1` and an error for duplicate same-welfare PFW rows. Lines `109-138` expect module-bearing cache IDs. `tests/testthat/test-dependency-inputs.R:31-62` expects exact PFW mapping, both INC and CON outputs for one acronym, and rejection of an ambiguous mapping. These tests do not prove a preference between HIST and BIN or a choice between two acronyms.

**Orchestrator implication, recommendation only:** The new orchestrator must receive an explicit survey/module selection result, not infer that `last_ver_inv()` provides it. A generated decision table is a candidate, subject to the Open design decision. The evidence is the module-preserving grouping and per-DLW-ID nodes above; this is not approval to implement the table.

**Decided-item tension:** The inspected candidate paths do not enforce the GPWG/HIST/BIN preferences in `SYSTEM_DESIGN.md:66-72`, or the one-survey-per-country/year-ID/welfare constraint at line 115. They establish no preference, rather than an opposite preference. Treat the absence as an enforcement gap, not proof of a deployed violation. Keeping module in the ID is an Open item (`SYSTEM_DESIGN.md:131-141`), not a new Decided contradiction.

## D2. Deflation

**Answer: The welfare conversion consumes cleaned welfare, a survey CPI value for the PPP base year, and a country PPP value for a specific PPP version. The reporting level is selected independently for CPI and PPP. Population can change microdata weights, but does not enter the welfare conversion call.**

### Exact Inputs And Keys

| Input | Selection and value key | Evidence at P |
|---|---|---|
| Cleaned welfare | Microdata formatting converts `welfare` to double and divides by 365. Deflation copies that value to `welfare_lcu`. No further local welfare-period conversion appears in that copy step. | `R/pd_dlw_clean.R:183-196`; `R/pd_deflation.R:858-869` |
| CPI | Auxiliary rows match `country_code`, `year == surveyid_year`, and `survey_acronym`. Each `cpi_value` is named `{cpi_year}_{reporting_level}`. The complete semantic row key is therefore country, survey year ID, acronym, CPI base year, and reporting level. | `R/pd_aux_attr.R:129-137,189-196`; required columns in `R/dependency_inputs.R:331-337` |
| PPP | Auxiliary rows match `country_code`. Each value is named `ppp_{ppp_year}_{release_version}_{adaptation_version}_{reporting_level}`. Version text is normalized with `gsub("_v", "_0", ...)`; preserve the actual normalized labels rather than assume a fixed width. The complete semantic row key is country, PPP year, release version, adaptation version, and reporting level. | `R/pd_aux_attr.R:138-158,197-203`; `R/dependency_inputs.R:338-340`; fixture label assertion in `tests/testthat/test-dependency-inputs.R:97-100` |
| PFW settings | `cpi_domain`, `ppp_domain`, and `pop_domain` select data levels independently: 1 becomes `national`, 2 becomes `area`. The resolver also checks CPI/PPP domain-variable compatibility. These settings become survey attributes. | `R/dependency_inputs.R:257-317`; `R/pd_cpfw_merge.R:215-225` |
| Population, for weights only | Standard metadata selection matches country and `year == surveyid_year`. Values are named `{year}_{reporting_level}`. It is not an argument to `wbpip::deflate_welfare_mean()`. | `R/pd_aux_attr.R:159-165,204-210`; `R/pd_deflation.R:920-928` |

**Conversion call:** For each CPI/PPP base-year intersection and each PPP version in that year, `get_welfare_ppp()` passes `welfare_lcu`, the selected PPP column, and `cpi{base_year}` to `wbpip::deflate_welfare_mean()` (`R/pd_deflation.R:807-846,880-928`, P). Exact algebra inside the external wbpip function is **UNKNOWN from this pipdata-only source inspection**. It must be joined to separately verified wbpip evidence; no external source text is attributed to P.

### Granularity

- A literal `ppp_data_level` selects one PPP value per version and broadcasts it to all rows. With `ppp_data_level == "area"`, each row selects PPP by its own `area` value. CPI follows the same procedure using its separate `cpi_data_level` attribute (`R/pd_deflation.R:674-713,758-788`, P).
- A national survey can thus use one CPI/PPP pair per base year and PPP version. A subnational survey can use different pairs for rural and urban rows. A mixed-domain survey can use national CPI and area-specific PPP, or the reverse. It is **not** one factor determined solely by the survey's overall reporting-level flag (`R/pd_deflation.R:690-709,764-786`, P).
- PPP release and adaptation versions matter in addition to the PPP year. Each version produces its own welfare column. CPI and PPP years are discovered from the inputs, and only their intersection is used (`R/pd_deflation.R:679-713,807-846,907-928`, P).
- For microdata, population adjustment is called only when `pop_data_level` resolves to a row-level column. It scales each area's weights by selected population divided by the area's total survey weight. The named-vector helper selects the nearest year to the first `year` value in the survey, and averages tied nearest-year values with inverse-distance weights. The standard metadata path has already filtered population to the survey year ID, so this nearest-year behavior is mainly relevant to explicitly supplied multi-year vectors (`R/pd_deflation.R:439-458,1012-1078`; `R/pd_aux_attr.R:159-165`, P).
- Grouped-data deflation runs the CPI/PPP welfare conversion but does not apply population adjustment (`R/pd_deflation.R:483-502`, P). Population still appears in the dependency contract, even when the arithmetic does not use it (`R/dependency_inputs.R:385-387`, P).

### Observed Dependency Projections

The engine loads each auxiliary artifact at its catalog version and verifies its whole-object hash before it builds in-memory indexes (`R/dependency_execution.R:20-44,58-71`, P). Indexed selection uses CPI country/year-ID/acronym, PPP country, and population country/year-ID (`R/dependency_inputs.R:17-101`, P).

The per-entity component hash then includes the resolved `data_level` and the **whole selected named vector**. It does not narrow CPI or PPP to only the levels or base years consumed by that survey. Thus a change to another level or unused base year in the selected vector can cause a broader invalidation than the arithmetic needs (`R/dependency_inputs.R:331-373`, P). The manifest records source artifact version IDs separately from projection hashes; PFW/auxiliary currentness uses semantic hashes, not source-version changes alone (`R/dependency_inputs.R:544-558`; `R/dependency_execution.R:617-657`, P).

**Recommendation only:** Use the CPI and PPP semantic row keys above when evaluating narrower partitions or comparison results. Include PFW domain settings and survey `area` values in the consumer mapping. Keep population-weight dependencies separate from welfare-value dependencies. Existing broad projection hashes are evidence of current behavior, not proof that only mathematically consumed rows invalidate. The mechanism remains Open and must use S1, A1, and D2 together.

**Test-source evidence at P:**

- `tests/testthat/test-pd-deflation.R:379-407,420-480` expects national broadcast, area-specific lookups, and independent mixed CPI/PPP levels.
- `tests/testthat/test-pd-deflation.R:487-549,731-807` expects population rescaling, nearest-year selection, and no adjustment for national-population or grouped-data cases.
- `tests/testthat/test-dependency-inputs.R:64-117` expects an unrelated-acronym CPI change to leave the projection hash unchanged, a matching change to alter it, and duplicate vector names to fail.
- `tests/testthat/test-pd-run-pipeline.R:1547-1628` expects only matching Colombia 2018 metadata/deflate nodes to run after a CPI change, and an immediate rerun to do no writes. The test fixture replaces the clean, metadata, and deflate workers with synthetic outputs (`tests/testthat/helper-dependency-fixtures.R:506-616`). It is executor/provenance test-source evidence, not proof of real welfare calculations or live-storage success.

**Decided contradiction:** Output names are `welfare_ppp_{year}_{release_version}_{adaptation_version}`, not `welfare_YYYY` (`R/pd_deflation.R:907-928`, P). Output discovery uses `^welfare_ppp_` and `^welfare_` (`R/pd_deflation.R:465-467,530-532`, P). This differs from the target column contract in `SYSTEM_DESIGN.md:166`. The input-year discovery is dynamic; the mismatch is the output contract, not hardcoded PPP years.

## D3. Checks

**Answer: DLW validation rules are data-driven YAML plus R helper logic. Other boundary checks live in R. A dedicated needs-revision manifest is UNKNOWN; the observed durable states are acquisition and validation inventories, a validation report, and a separate dependency manifest.**

| Boundary | Rule location and failure behavior | Evidence at P |
|---|---|---|
| DLW validation | `inst/extdata/validation_spec.yml` supplies per-module availability, patterns, checks, and severity. R loads and validates the specification, then dispatches helpers. Some severities come from the helpers rather than the YAML. | `inst/extdata/validation_spec.yml:14-87`; `R/pipdata_dlw_validation.R:59-72,360-440,474-570` |
| Completed validation | Any report row of type `error` makes the survey `invalid`; warnings alone leave it `valid`. A load/engine/report failure produces status `failed` with no completed inventory row. The batch records errors and assembles completed valid **and invalid** rows. | `R/pipdata_validate_gmd.R:580-646,679-703,1609-1655` |
| PFW and cleaning | Exact PFW mapping rejects missing or ambiguous mappings. Clean output IDs must match the accepted set before saves. A separate post-clean data-validation call is not active in the inspected workers. Micro/group cleaning delegates to external wbpip cleaners. | `R/dependency_inputs.R:183-236,609-620`; `R/pd_process_data.R:225-240,330-342`; `R/pd_wbpip_clean.R:37-47,120-134` |
| Deflation input | R requires data.table plus pipmd/pipgd class, welfare/weight columns with no NA, and required survey/domain attributes. Public methods validate before the safe conversion wrapper; conversion errors inside that wrapper are logged and return NA. The strict stage path does not use that wrapper. | `R/pd_deflation.R:6-50,338-362,382-420` |
| Save receipt | R hashes the attempted object, checks returned version/hash against exact Stamp history, and requires a unique match. This is storage-integrity verification, not a replacement for data-quality validation. | `R/save_pip.R:91-147` |
| Entity versus fatal failure | The stage engine has allowlisted recoverable classes. It records failed entities and, with the top-level continue policy, proceeds to other entities. Unknown/fatal errors terminalize a stage, while downstream waves are blocked after upstream failures. It does not continue all writes after a storage or fencing failure. | `R/pipeline_stage_cores.R:78-137,158-259`; `R/pd_run_pipeline.R:431-440,501-600` |

**What is persisted instead of a needs-revision manifest?**

- Acquisition inventory `dlw_gmd_inv` uses catalog columns `Country`, `Year`, `Survey_acronym`, `Vermast`, `Veralt`, `Module`, `Collection`, `FileName`, `Checksum`, `Ext`, plus `data_available`. Failed/ambiguous downloads return `No`; inventory writes use PK `Checksum, FileName`. Only `Yes` rows become validation candidates (`R/pipdata_dlw_compare.R:9-12,35-36,709-723,868-885`; `R/pipdata_get_gmd.R:503-565`, P).
- Completed validation inventory `gmd_valid_inv`, alias `dlw_meta`, contains `survey_id`, `pipeline_version`, `latest_version_id`, `content_hash`, `file_path`, `status`, `data_available`, `date_validated`, `Checksum`, and parsed country/year/acronym/master/harmonization/collection/module/tool fields. Completed statuses are `valid` or `invalid`, with `data_available == "Yes"` (`R/pipdata_dlw_compare.R:313-355,452-459,788-793`; `R/pipdata_validate_gmd.R:679-690`, P).
- The validation report contains the survey `table_name`, message, type, and fuller assertion detail. The engine appends it; completed worker report rows are assembled separately from the inventory (`R/pipdata_dlw_validation.R:537-570`; `R/pipdata_validate_gmd.R:1683-1721`, P).
- The **dependency** manifest is an RDS generation under `dependency-manifest/<scope_id>/manifest-v1-<20-digit-generation>-<uuid>.rds`. Its payload has header, records, inputs, fingerprints, and tombstones. Records hold stage/entity/output-version/output-hash/input-hash/code-hash/receipts, not a needs-revision flag. Publication adds parent, generation, UUID, and payload checksum (`R/dependency_contract.R:36-59`; `R/dependency_manifest.R:1-19,150-170`, P).

**Test-source evidence at P:** `tests/testthat/test-dlw_validation_engine.R:20-50,80-97,113-128` checks module results, errors, fixture equality, and unknown-module fallback. `tests/testthat/test-pipdata_validate_gmd.R:694-765` expects an invalid survey to retain an inventory row/report, but an execution failure to have neither. `tests/testthat/test-dependency-execution.R:140-181` checks retry exclusion and malformed/duplicate state. It does not check exclusion of invalid surveys. `tests/testthat/test-save_pip.R:1-41` mocks the storage/hash/history calls for receipt checks.

**Critical Decided contradiction:** The new completed-validation filter retains both valid and invalid rows (`R/dependency_execution.R:1-17`; `R/pipdata_dlw_compare.R:452-459`, P). Current-state construction loops over every inventory row (`R/dependency_execution.R:433-437`, P). The runnable clean stage then loads, cleans, and saves the selected row without a `status == "valid"` gate (`R/pipeline_stage_cores.R:158-172`; `R/pd_process_data.R:225-240`, P). Invalid input is therefore not excluded at these boundaries. A dedicated post-format quality validation is also not active before clean saves; the legacy calls are commented out (`R/pd_process_data.R:330-342`, P). These paths conflict with `SYSTEM_DESIGN.md:209-213`, which requires checks at boundaries and says failed-validation data must not proceed or be saved. A real invalid survey reaching storage was not executed or proved in this harvest.

## D4. stamp Use

**Answer: YES. pipdata uses Stamp directly for hashes, catalogs, versions, and artifact information, and uses pipload for artifact reads/writes. Its current scheduling authority is its own dependency manifest/planner, not Stamp's builder/staleness API.**

| Use | Evidence at P |
|---|---|
| Package dependency | `DESCRIPTION:23-34` imports pipload, wbpip, and `stamp (>= 0.0.11)`. |
| Freeze exact auxiliary inputs | `R/dependency_execution.R:20-44` queries the aux catalog, loads pinned versions through pipload, and verifies them with `stamp::st_hash_obj()`. |
| Resolve survey storage facts | `R/build_pip_inventory.R:152-172,253-289` queries Stamp catalogs and joins data/metadata version and content-hash facts. |
| Read exact deflation inputs | `R/pd_deflation.R:338-362` reads explicit cleaned-data and metadata versions through pipload and verifies their Stamp hashes before transformation. |
| Save and verify outputs | `R/save_pip.R:91-124` calls pipload and Stamp hash/version APIs. Deflation saves to alias `pip_deflated` (`R/pd_deflate_pipeline.R:501-536`). |
| Code currentness | `R/code_fingerprint.R:38-92` hashes curated function formals/bodies, constants, YAML content, and selected external wbpip functions. These hashes are inputs to pipdata currentness; they are not evidence of an approved explicit code-version-label policy. |
| Decide work | `R/dependency_execution.R:559-710` compares manifest records, exact outputs, semantic input projections, and fingerprints. `R/dependency_plan.R:33-55,76-111,212-220` creates per-stage actions. |
| Execute stage waves | `R/pd_run_pipeline.R:342-428,443-600` runs clean, metadata, and deflate under one lease, with authoritative refreshes between waves. The selected nodes cover those three stages, not the ten-stage release system. |

No direct calls to `st_register_builder()`, `st_plan_rebuild()`, `st_rebuild()`, or `st_is_stale()` were found in inspected pipdata R source. No explicit `parents` argument is supplied by the inspected save wrappers (`R/save_pip.R:59-60,91-96`, P). Actual delegation inside pipload is UNKNOWN here; do not infer that the pipdata manifest is Stamp lineage.

**Test-source evidence at P:** `tests/testthat/test-pd-run-pipeline.R:218-340` mocks stage/storage boundaries and expects clean, metadata, deflate waves, one lease, and final fencing. `tests/testthat/test-pd-run-pipeline.R:1547-1628` checks keyed invalidation and no-write convergence with synthetic workers. `tests/testthat/helper-dependency-fixtures.R:506-616` defines those worker replacements. `tests/testthat/test-code-fingerprint.R:1-33,73-82` expects stable function fingerprints and deflate-only invalidation after an external deflation-function change. None was executed here.

**Orchestrator recommendation, not a design decision:** Keep the existing survey-stage engine in pipdata and place release-wide and per-estimate planning in a separate pipsystem layer. D1 shows a missing explicit survey/module-selection boundary. D4 shows an existing survey engine that should not be mistaken for an empty package or a complete ten-stage orchestrator. The existing manifest/planner also needs an explicit fit decision against the target Stamp authority; do not add a second independent source of currentness without that decision. Supporting source: `R/dependency_plan.R:33-55`; `R/pd_run_pipeline.R:443-600`; `R/dependency_execution.R:617-710`, P.

**Decided contradiction:** Current work selection is computed by pipdata's dependency manifest and planner, whereas `SYSTEM_DESIGN.md:188,217` assigns rebuild authority to Stamp. This is an architectural mismatch to resolve, not permission to move or delete the existing code. The package source itself states that production activation remains blocked pending signed target Windows/SMB fencing and immutable unique-rename evidence (`R/pd_run_pipeline.R:329-332`, P). Those deployment claims were not independently verified.

## Gaps

- **D1:** New-pipeline GPWG/HIST/BIN selection and cross-acronym same-welfare selection remain UNKNOWN. The observed filters do not implement those choices (`R/utils.R:341-364`; `R/get_country_pfw.R:37-51`; `R/dependency_plan.R:33-55`, P).
- **D2:** External wbpip conversion algebra and CPI construction must be joined to separately verified package harvests. This worker did not read those repositories. Exact row-consumption invalidation is not proved: existing projections hash all selected values, including unused levels/years (`R/dependency_inputs.R:331-373`, P).
- **D2:** Tests do not establish real numerical end-to-end deflation on production surveys. Some public integration assertions allow either data.table or NA (`tests/testthat/test-pd-deflation.R:588-623,669-706`, P); executor tests replace the transformation workers (`tests/testthat/helper-dependency-fixtures.R:506-616`, P).
- **D3:** A dedicated revision manifest and a complete active post-format quality-check contract remain UNKNOWN. Invalid-row exclusion needs verification/correction in the package's own repository before the Decided failure contract can be met (`R/pd_process_data.R:225-240,330-342`; `R/dependency_execution.R:1-17`; `R/pipdata_dlw_compare.R:452-459`, P).
- **D4:** Stamp partition-parent capability, pipload's actual write delegation/format, and production Windows/SMB safety are outside this package-only inspection. The global orchestrator location and the relation between the existing manifest and target Stamp authority remain decisions, not harvest facts (`R/save_pip.R:91-124`; `R/pd_run_pipeline.R:329-332`; `R/dependency_execution.R:617-710`, P).
- No tests, external-data calls, or pipeline runs were executed. No runtime pass, scale, or deployment-safety claim is made.
