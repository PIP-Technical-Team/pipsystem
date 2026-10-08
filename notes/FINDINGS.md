# M1 Findings And Decision Support

Date: 2026-10-07. Written by the coordinator after all eight package workers finished. Scope and table structure follow `HARVEST_BRIEF.md:118-127` at **D**. All recommendations below are **proposals, not approvals**. No design changes are applied.

## Evidence Keys

Each citation binds a repository-relative file and line to the full SHA below. Verified absolute source paths, dirty-state checks, and output coverage are in `HARVEST.md:9-40`. Package notes distinguish source/test inspection from executed results. **No tests were executed.**

| Key | Repository | Full SHA |
|---|---|---|
| D | This pipsystem worktree | `84c384f78ed44bcb96bb19c6d364519df5b5db6f` |
| S | stamp | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| A | pipaux | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` |
| Dp | pipdata | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| L | pipload | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| F | pipfun | `0c6a78d9884ed0965a524311537eec2a5095d60b` |
| P | pipster | `828064e406e07e711c34d2ba725746e367d35f9b` |
| W | wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` |
| I | pipapi | `280af151d05902a550d5dea18cd4bf1a3d013239` |

The approved strategy controls dependencies and does not approve Open design proposals (D: `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:151-174`). Answer status describes evidence coverage, not an approved decision or runtime verification.

All shortened `approved strategy` references below mean `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md` at D. Generated notes and HARVEST.md are uncommitted outputs, not files at D.

## Open Questions

One row per Open question in D: `SYSTEM_DESIGN.md:313-327`.

| # | Open question | Answer status | Evidence | Proposed change to SYSTEM_DESIGN.md |
|---|---|---|---|---|
| 1 | Row-level change detection for PFW and auxiliary series | partial | S1: concrete partition saves use ordinary artifacts (S: `R/partitions.R:175-212`). A1: saved CPI/PPP/pop keys (A: `R/aux_cpi.R:214-242`; `R/aux_ppp.R:251-271`; `R/aux_pop.R:191-200`). D2: actual row/domain selection and broader current projections (Dp: `R/pd_aux_attr.R:129-165,189-210`; `R/pd_deflation.R:690-709,764-786`; `R/dependency_inputs.R:331-373`). | Approve a PIP comparison/projection step with versioned consumed-input artifacts and ordinary stamp parent pins. Do not use whole-series parent pins or automatic partition state alone. Details in R1 below. |
| 2 | Whether a stamp partition can be a parent on its own | answered | A concrete partition calls `st_save`; parent descriptors contain path/version, and staleness compares each path's latest pin (S: `R/partitions.R:175-212`; `R/version_store.R:799-822,1203-1217`). Inspected partition tests save/load parts but do not test selective parent invalidation (S: `tests/testthat/test-partitions.R:2-25`; `tests/testthat/test-write-parts.R:1-60`). | Record source support for addressable partition parents, with integration-test and deletion/unchanged-pin limits. Do not state that automatic lineage or transitive rebuilds are proved. |
| 3 | Whether stamp supports custom metadata fields | answered | Extra metadata is appended to sidecars; current sidecar reads do not load data (S: `R/IO_core.R:193-207,310-348,630-660`; `R/format_registry.R:319-347`). Historical sidecars are copied to version directories, but public readers have no version selector (S: `R/version_store.R:631-661`). | Record source support with collision/type/version-read limits. Keep module-identity approval separate. Require a rule for metadata-only identity changes because default saves can skip them (S: `R/IO_core.R:253-269,952-995`). |
| 4 | What counts as a code version for stamp | answered | Functions hash formals/body, language is deparsed, strings are hashed labels. `code_label` is display-only. NULL/disabled code yields NA; parent staleness does not compare code (S: `R/hashing.R:318-342,500-529`; `R/IO_core.R:318-334`; `R/version_store.R:1176-1217`). | Approve explicit per-stage semantic version labels as the `code` input, retain exact source SHAs for audit, and require code-currentness comparison in planning. R2 gives the proposal and current gap. |
| 5 | Whether module is removed from internal survey identity | partial | Current cache IDs include module (Dp: `R/get_country_pfw.R:202-239`); S6 can store custom module/DLW fields (S: `R/IO_core.R:310-348`). Parent/metadata-only updates can be skipped (S: `R/IO_core.R:253-269,952-995`). | M0 proposal remains: module-free internal identity, module/data type/DLW versions in metadata and selection data, full external ID at export. Andres must approve. Do not claim S6 alone proves module-transition history. |
| 6 | Module selection rule and survey-specific choices | partial | pipdata keeps latest versions within each module, not one preferred module (Dp: `R/utils.R:341-364`). PFW flags exist, but cross-acronym and HIST/BIN choice remain UNKNOWN (A: `R/aux_pfw.R:524-547`; Dp: `R/get_country_pfw.R:34-51,88-120`). Legacy pipload fixes HIST before BIN (L: `R/pip_find_data.R:307-308,399-419,426-428`). | Keep location/choice semantics Open. Propose explicit generated selection data, subject to the M0 decisions-become-data approval. Do not adopt the legacy ranking as the target rule. |
| 7 | Lineup methodology and inputs | unknown | Full targets methodology is outside M1 (D: `HARVEST_BRIEF.md:129-131`; approved strategy `:116-126`). `fill_gaps()` returns poverty-line statistics, not the target lineup distribution (W: `R/fill_gaps.R:81-106,117-159`). | No decision now. Keep Open for M4 targets harvest; do not substitute wbpip helpers for the full method. |
| 8 | Missing-data method inputs | unknown | The same M4 boundary applies. Imputed dispatch returns NA or calls microdata statistics; it does not build missing-country distributions (W: `R/compute_pip_stats.R:61-64`; `R/prod_compute_pip_stats.R:33-45`; D: `HARVEST_BRIEF.md:129-131`). | Keep Open for M4. No cross-country dependency list is inferred. |
| 9 | Shape of stage 5 outputs | partial | Microdata and grouped reference wrappers return lists, with decile shares named `quantiles` versus `deciles` (W: `R/md_compute_dist_stats.R:58-64`; `R/gd_compute_dist_stats.R:95-105`). Current API consumes wide joined fields (I: `R/utils-stats.R:26-60,338-377`). | M0 can approve the proposed long internal table. Define share versus cutpoint semantics and keep a current-format release adapter. Source outputs do not decide the shape. |
| 10 | Where the orchestrator lives | partial | pipdata already runs clean/metadata/deflate waves and has its own manifest/planner (Dp: `R/pd_run_pipeline.R:342-428,443-600`; `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111`). | Approve a separate PIP-specific orchestrator in pipsystem, not a larger pipdata remit. Reuse survey-stage transformations only after resolving existing manifest authority against stamp. R3 below. |
| 11 | Whether targets is fully replaced | unknown | This decision depends on the M4 targets harvest, not M1 package evidence (D: `HARVEST_BRIEF.md:129-131`; approved strategy `:118-125`). | Keep Open; no replacement decision now. |
| 12 | pipload role next to stamp | partial | PIP access queries/metadata expansion sit above `st_versions`, `st_load`, and `st_save` delegation (L: `R/load_pip_data.R:174-255`; `R/pip_inv_enrich.R:219-260`; `R/pip_read-write.R:82-107,175-185`). stamp owns generic version storage (S: `R/version_store.R:122-146,452-489,799-822`). | Approve pipload as the PIP-aware access adapter, not planner/version authority. Resolve format and direct-metadata-path integration before use. R4 below. |
| 13 | Interface and platform | unknown | These remain Open and the approved strategy places them after March (D: `SYSTEM_DESIGN.md:270-272`; approved strategy `:144-149`). No package evidence selects either. | Leave Open. Do not choose Shiny, Databricks, or another platform in M1. |
| 14 | Transient versus permanent failures | partial | pipdata has recoverable-class handling and stage/fatal failure behavior; validation distinguishes invalid versus failed (Dp: `R/pipeline_stage_cores.R:78-137,158-259`; `R/pipdata_validate_gmd.R:580-646,679-703`). stamp has no persisted failed state and its executor can continue after failures (S: `R/rebuild.R:253-342`; `R/version_store.R:122-146,1176-1217`). | M0 approval still required. Specify typed failure records/retry rules, and reconcile their generic stamp integration with Decided rerun authority. Do not infer a complete policy from current allowlists. |
| 15 | Whether corrections in the release window keep history | partial | Individual retained versions can be loaded; no native named release set exists (S: `R/IO_core.R:483-498`; `R/version_store.R:122-146,452-489,1257-1311`). Optional pruning can remove versions (S: `R/retention.R:415-435`). | M0 approval still required. If approved, use pinned release-manifest revisions and release-aware retention. Current version retrieval is not proof of correction-window/freeze semantics. |

## Recommendations

### R1. Row-Level Change Detection

**Proposal:** use a PIP comparison/projection step in pipsystem. Give each estimate/stage the versioned input slice it actually consumes; let stamp track those ordinary artifacts and their parent pins. Do not attach whole-series parent pins to numerical consumers when a consumed slice is the dependency. The comparison step updates input artifacts; it does not independently choose numerical reruns. Partitions are a possible storage representation, not the full selection/invalidation algorithm. This uses all three required inputs, S1, A1, and D2 (D: approved strategy `:72,155-156`).

- S1 supports individual partition paths/versions. The actual automatic writer is `st_write_parts()`, not `st_auto_partition()`. It copies supplied parents, does not infer consumer dependencies, returns NA version IDs for unchanged parts, and does not remove vanished keys (S: `R/partitions.R:175-212,342-428`). Therefore automatic partition manifests alone are not a reliable row-change contract.
- A1 establishes candidate keys: CPI country/year-ID/acronym/reporting level/CPI base year; PPP country/reporting level/PPP year/release/adaptation; population country/year/reporting level (A: `R/aux_cpi.R:214-242`; `R/aux_ppp.R:251-271`; `R/aux_pop.R:191-200`). PPP default flags can change when a version is added (A: `R/aux_ppp.R:113-129`). Selection changes must be represented, not only edited values.
- D2 resolves national versus per-row area separately for CPI and PPP, and loops over intersecting base years and PPP versions. Exact arithmetic is `welfare_lcu / ppp / cpi` (Dp: `R/pd_deflation.R:690-709,764-786,807-846,907-928`; W: `R/deflate_welfare_mean.R:32-35`; inspected W test `tests/testthat/test-deflate_welfare_mean.R:1-15`). Include PFW domain settings and selected reporting levels in input mappings.
- Population is a weight dependency, not a welfare division factor. Area population can alter microdata weights; grouped deflation omits that adjustment (Dp: `R/pd_deflation.R:439-458,483-502,1012-1078`). Separate welfare/weight inputs where this is useful, but never omit population from a statistic that consumes adjusted weights.
- Existing pipdata projections already isolate country/year/acronym CPI changes, but include the entire selected CPI/PPP vector, even unused levels/years (Dp: `R/dependency_inputs.R:17-101,331-373`; inspected test `tests/testthat/test-dependency-inputs.R:64-117`). Use this as evidence for the mapping, not as proof of minimal per-estimate invalidation or stamp lineage.
- For PFW, persistence uses country/year-ID/welfare type, while clean validation uses year/welfare type/alternative-welfare flag (A: `R/aux_pfw.R:215-227,636-639`). Approve one unique selection/projection contract before partitioning PFW. Represent additions, deletions, and changed decisions explicitly; do not leave deleted keys current because a partition loop no longer visits them.

**Required validation after approval:** changed row versus unchanged sibling; removed key; added PPP default/version; mixed national/area CPI/PPP; population-weight change; unchanged output with refreshed lineage; one-country no-change second run. Existing source tests do not prove this full contract, and stamp planner/unchanged-pin defects must be resolved rather than bypassed with a second rebuild authority (S: `R/rebuild.R:311-327,495-518`; `R/IO_core.R:253-269`).

### R2. Code Version Rule

**Proposal:** pass an explicit version label for each calculation/recipe as `code`, and bump it for result-affecting logic or dependency changes. Store exact package SHAs and the code-version policy in reproducibility records; do not make an unrelated repository edit an automatic global rebuild. `code_label` alone is insufficient because it is only display text (S: `R/hashing.R:318-342`; `R/IO_core.R:318-334`).

Function-body hashing excludes the function environment and transitive callees. pipdata currently supplies a broader curated fingerprint that includes selected external functions and YAML; this is current behavior, not an approved label policy (S: `R/hashing.R:318-342`; Dp: `R/code_fingerprint.R:38-92`; inspected test `tests/testthat/test-code-fingerprint.R:1-33,73-82`). The proposed bump policy must cover those result-affecting inputs.

For calculation outputs, propose non-NULL version labels with hashing enabled. NA must not silently count as an auditable version. Planning must compare the requested code version through stamp before deciding an artifact is current: current `st_is_stale()` only checks immediate parent versions, so supplying a label only at save time cannot schedule code-only changes (S: `R/hashing.R:500-529`; `R/version_store.R:1176-1217`). Direct label/NA transition tests and code-only planning are required gaps, not completed functionality.

### R3. Orchestrator Location

**Proposal:** place the cross-package, release-aware orchestrator in a separate pipsystem R package/layer. Keep pipdata's survey transformations in pipdata, and calculation-only ownership in pipster only if M0 approves it. Do not expand pipdata into the release/estimate/API controller (D: `SYSTEM_DESIGN.md:194,282-299`; Dp: `R/pd_run_pipeline.R:443-600`; P: `R/pipgd_params.R:33-99`; `R/pipgd_dist.R:24-72,164-213`).

pipdata is not an empty engine: it already coordinates three stage waves, projections, receipts, and leases. Its manifest/planner currently decides work, rather than stamp builder/staleness APIs (Dp: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`). Reuse does not mean endorsing two independent sources of currentness. Resolve this Decided-authority mismatch before integrating it into the new orchestrator.

Release membership belongs in PIP-owned data. stamp has individual version retrieval but no native named release registry; its generic save can store a caller-owned pinned manifest (S: `R/IO_core.R:193-207,483-498`; `R/version_store.R:122-146,452-489,799-822`). The caller must enforce freeze/correction state and retention. This preserves stamp's domain-agnostic boundary, not permission to implement release code now.

### R4. pipload Role

**Proposal:** keep pipload as the PIP-aware storage access adapter: folder/alias resolution, survey queries, auxiliary selection, and PIP metadata expansion. Delegate version/content/parent storage to stamp; do not use legacy directory signatures as estimation invalidation (L: `R/load_pip_data.R:174-255`; `R/load_aux_data.R:24-70`; `R/pip_read-write.R:82-107,175-185`; `R/pip_update_inventory.R:178-194,345-355`; S: `R/version_store.R:122-146,799-822`).

Cross-package closure: auxiliary wrappers request a whole measure; pipload delegates a whole-artifact load and only then filters PPP default rows. No survey-row read selector exists in those interfaces (A: `R/aux_cpi.R:55-60`; `R/aux_ppp.R:61-63`; `R/aux_pop.R:35-39`; L: `R/load_aux_data.R:10-15,24-70`; `R/pip_read-write.R:93-107`). pipaux saving delegates through pipload to stamp (A: `R/utils.R:470-485`; L: `R/pip_read-write.R:175-185`). The cleaned-object hash is stamp sanitation, attribute normalization, R serialization version 3, then SipHash-1-3, stored in sidecar/catalog fields (S: `R/hashing.R:193-223,273-282`; `R/IO_core.R:310-382`). This closes A3's package-boundary UNKNOWN without treating raw GitHub SHAs as cleaned-data hashes.

Keep two metadata concepts distinct. pipload enrichment directly reads an exact QS2 **metadata artifact** at `path_metadata/versions/version_id_metadata/artifact`; stamp snapshots use that `artifact` basename but custom sidecars are separate `sidecar.json|qs2` files (L: `R/pip_inv_enrich.R:219-260`; S: `R/version_store.R:631-661`). The layout pattern is compatible in source; actual inventory paths/serialization and proposed sidecar-field integration are not executed or proved. Also resolve current PIP loader qs2 assumptions before relying on fst (L: `R/load_pip_data.R:375-389`; `R/load_aux_data.R:37,61-66`; `R/pip_read-write.R:48-53,63-79`).

## Decided Conflicts

These are current-source/target mismatches or capability gaps, not approvals to change Decided rules. No production failure was executed.

- **Generated GitHub copies as inputs:** GDP is generated/uploaded and then read back from GitHub (A: `R/aux_gdp.R:34-65,368-374`), contrary to D: `SYSTEM_DESIGN.md:100`.
- **Invalid input and post-format checks:** completed validation retains invalid rows; the candidate clean path has no valid-status gate and saves without an active post-format validation call (Dp: `R/dependency_execution.R:1-17,433-437`; `R/pipdata_dlw_compare.R:452-459`; `R/pd_process_data.R:225-240,330-342`), contrary to the required boundaries/no-save rule (D: `SYSTEM_DESIGN.md:209-213`). A real invalid survey reaching storage remains UNKNOWN.
- **Welfare output columns:** current names are `welfare_ppp_YEAR_RELEASE_ADAPT`, not `welfare_YYYY` (Dp: `R/pd_deflation.R:907-928`; D: `SYSTEM_DESIGN.md:166`). Year discovery itself is dynamic.
- **Rebuild authority:** pipdata's manifest/planner decides work (Dp: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:76-111,212-220`), while stamp is the Decided authority (D: `SYSTEM_DESIGN.md:188,217`). This is an architecture mismatch, not permission to remove existing code.
- **stamp rerun capability:** propagation removes scheduled children from its next frontier, and unchanged saves are reported as failures without parent refresh; missing/failed state is not a complete stale signal (S: `R/rebuild.R:311-327,495-518`; `R/version_store.R:122-146,1176-1217`). These do not fulfill D: `SYSTEM_DESIGN.md:188-192`. The manual assertion of two levels is not an executed pass (S: `tests/manual/test_stamp_smoke.R:264-292`).
- **Legacy HIST/BIN ranking:** pipload ranks HIST before BIN (L: `R/pip_find_data.R:307-308,399-419,426-428`), contrary to the target's survey-specific choice (D: `SYSTEM_DESIGN.md:71`). Active use in the new pipeline is UNKNOWN.
- **Old-release availability risk:** API lookup creation adds `refy_lkup` only for new releases, but `pip()` requires it before old/new dispatch (I: `R/create_lkups.R:776-799`; `R/pip.R:57-67`; `R/validate_lkup.R:17-25,78-85`). This source path conflicts with serving every past release (D: `SYSTEM_DESIGN.md:240`). Runtime availability is UNKNOWN.

PFW's rejection of `inpovcal = 0` is an **exclusion-contract gap**, not proof that all exclusions are impossible: deletion/upstream choices remain UNKNOWN (A: `R/aux_pfw.R:427-430,614-617`; D: `SYSTEM_DESIGN.md:108-115`). No log-decides contradiction is established: inspected pipfun helpers record/filter/count events, and the actual skip caller remains UNKNOWN (F: `R/log.R:251-280`; `R/log_helpers.R:228-262`; D: `SYSTEM_DESIGN.md:217`).

Current API survey welfare is converted in memory by `welfare / (cpi * ppp)`; new lineup files also need indexes and cumulative fields (I: `R/utils-pipdata.R:274-321`; `R/fgt_cumsum.R:67-108`). Preserve the current release adapter until the planned API conversion change. This is compatible with the Decided transitional format, not a contradiction or authorization to change pipapi (D: `SYSTEM_DESIGN.md:301-305`; approved strategy `:130-140`).

## Approvals And Readiness

Required M1 approvals: R1 row-level detection, R2 code-version rule, R3 orchestrator location, and R4 pipload role. Required M0 decisions for the approved M2 gate: module-free identity, engine-first interface-later, pipster calculation-only ownership, and stage 5 shape (D: approved strategy `:158-168`). R2 and R3 are the other two decision members of that gate. None is approved by this harvest.

The three gate harvests have completed evidence collection. The six decision features remain pending in this worktree; M2 is not ready to start on this record. The rest of M0/M1 need not all finish before M2 starts, but skeleton stamp gaps must be closed before M2 finishes (D: approved strategy `:155-170`). A dedicated mean estimator is not already present in harvested pipster (P: `NAMESPACE:3-12`; `R/pipgd_params.R:93-98`).

Design-update features remain pending until Andres-approved edits are integrated. SYSTEM_DESIGN.md, roadmap.json, the charter, configuration, and .gitignore are unchanged by this work. No M2 code, package-source edit, or roadmap writer was dispatched (D: `SYSTEM_DESIGN.md:16-18`; approved strategy `:58,76,174`).

## Gaps

- UNKNOWN: all executed test results, live-storage/API behavior, and numerical equivalence. All cited assertions are test-source evidence only.
- Required stamp gaps: transitive/topological planning, changed-code scheduling, unchanged-output lineage refresh, failed/missing artifact policy, custom metadata transition/readback, and named-release retention/capture semantics (S: `R/rebuild.R:253-342,400-518`; `R/version_store.R:1176-1217`; `R/IO_core.R:253-269`; `R/retention.R:415-435`).
- UNKNOWN: parallel-write safety and target-scale cost. Optional locks, unchecked timeout returns, pre-lock decisions, delete/move read gaps, and catalog-before-snapshot publication require safe tests in the stamp repository (S: `R/IO_core.R:253-279,347-408,1014-1044`; `R/version_store.R:156-192,772-827`; inspected sequential-only test `tests/testthat/test-edgecases.R:1-21`).
- UNKNOWN: external PFW/module-choice policy, remote auxiliary dependency graph content/SHA, and complete production release schemas/writer units (A: `R/aux_pfw.R:524-547`; `R/utils.R:490-500`; I: `R/create_lkups.R:79-123,406-477`).
- UNKNOWN: stages 6-7 full inputs, targets replacement, interface, and platform; these are not settled by M1 (D: `HARVEST_BRIEF.md:129-131`; approved strategy `:116-126,144-149`).
- Pending: Andres approval of proposed decisions and subsequent approved design integration. No proposal is silently promoted to Decided or to a completed roadmap design-update feature.
