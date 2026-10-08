# SYSTEM_DESIGN.md

How the new PIP backend pipeline is supposed to work.

## 0. How to use this document

This is a living document. It describes the target system, not the current one.

Every statement is marked:

* **Decided.** Agreed. Build on it.
* **Open.** Not settled. Do not assume an answer. Some Open items carry a **Proposal**, which is a suggestion under discussion, not a decision.

Rules for agents:

* Never change a Decided item without explicit approval from Andres.
* When you find evidence that answers an Open item, record the evidence with file and line, and propose the change. Do not apply it yourself.
* When code contradicts a Decided item, report the contradiction. Do not quietly follow the code.

## 1. Purpose and central principle

**The problem.** In the current pipeline, a change in one survey or one auxiliary value forces a full rerun across more than 2,000 survey databases. That is not viable.

**The goal.** Detect what changed and rerun only what that change affects.

**Decided. Everything belongs to a release.** Every run is done for a release. Every version of every file, auxiliary or microdata, is linked to the releases that use it. Test and internal runs are releases too, with a different suffix.

**Decided. Every published number is reproducible.** For any release, it must be possible to know exactly which data versions, code versions, and decisions produced it.

## 2. Vocabulary

| Term | Meaning |
|---|---|
| GMD | Global Monitoring Database harmonization methodology. All microdata used here follow it. |
| DLW | DatalibWeb, the World Bank repository that serves harmonized surveys. |
| Module | A set of variables in a harmonized survey: ALL, GPWG, HIST, GROUP, BIN. |
| Data type | How a module is treated in calculations: micro, bin, or group. |
| Version | A change inside one module. Each module has its own version sequence. |
| Survey identity | What a survey is: country, year ID, survey acronym, welfare type. Never changes. |
| Year ID | The first year in which the survey round was conducted. India 2011 to 2012 has year ID 2011. |
| Welfare type | Income or consumption. |
| Reporting level | National, urban, rural, or subnational. |
| Survey year | The fieldwork date of a survey, possibly fractional, such as 2011.5 or 2008.85. |
| Lineup year | A round calendar year for which an estimate is built from the surveys around it. |
| PPP year | The ICP round of the PPPs used, such as 2017 or 2021. |
| PFW | Price framework file. An auxiliary file with one row per survey holding all survey specific decisions. |
| Release | A published set of global poverty numbers for one PPP year. |
| Round | A set of releases published together, one per PPP year, sharing the same survey versions. |
| Release season | The month before a release, when all processing happens. |
| Y drive | The network drive on the server where data are stored. |

## 3. Inputs

### 3.1 Microdata from DLW

**Decided.** The system never works with raw surveys. It uses GMD harmonized data only.

**Decided. Modules.**

* **ALL.** Every variable in the GMD harmonization.
* **GPWG.** A subset of ALL. The module used for poverty and inequality whenever it exists.
* **HIST.** Historical data. Only welfare and weight are reliable. Other variables vary by country and year.
* **GROUP.** Aggregated data, usually 10 or 20 points of the distribution. Used to fit a parametric Lorenz curve and build a synthetic distribution.
* **BIN.** 1,000 bins, treated as microdata in every calculation.

**Decided. Module preference.**

* GPWG is always preferred over everything else.
* HIST is always preferred over GROUP.
* BIN is always preferred over GROUP.
* Between HIST and BIN there is no general rule. It depends on the survey.
* Once GPWG exists for a survey, it replaces HIST for good.

**Decided. DLW versions.** A DLW ID carries two versions, for example `COL_2010_GEIH_V02_M_V09_A_GMD_GPWG`:

* `V02_M` is the master version. It changes when the raw data change, for example when the national statistics office recomputes weights after a census.
* `V09_A` is the harmonization version. It changes when the harmonization changes, including when it absorbs a new master version.

**Decided.** When the ALL module changes, the GPWG module changes too.

**Decided. Change detection.** `pipdata` asks DLW what is new or changed, using DLW versions. New data come in two forms: new surveys, and corrected surveys. Each DLW change becomes a new version in the PIP system. Old versions stay available.

### 3.2 Auxiliary data

**Decided.** More than 20 auxiliary files, including CPI, PPP, population, GDP, PCE, region definitions, country names and ISO codes, income classifications, and national accounts growth series built from sources such as WDI, Maddison, and WEO.

**Decided.** Each series lives in its own GitHub repository, prefixed `aux_` (`aux_cpi`, `aux_ppp`, `aux_pop`, and so on). These repositories are the source of truth and hold the raw data.

**Decided.** `pipaux` manages all auxiliary data: cleaning, formatting, dependencies between series, and versions.

**Decided. Change detection has two steps.**

1. A new GitHub commit tells `pipaux` to look.
2. A content hash of the data tells it whether the data really changed.

A commit that changes nothing in the data triggers nothing.

**Decided. Some series depend on others.** For example, GDP may be built from WDI, Maddison, and other sources. `pipaux` manages this chain. The rest of the system must be able to see it, so a change in a source series reaches every series built from it.

**Decided. GitHub copies are never inputs.** Some files, such as GDP, are built by `pipaux`, saved to the Y drive, and then pushed to GitHub for completeness. The GitHub copy is never read back by anything.

**Decided. Legacy repositories.** A few `aux_` repositories still contain their own processing code, often from Stata, maintained outside this ecosystem. Their outputs are treated as external raw inputs. The system only needs to know when they change.

**Decided. Update frequency varies by series.** CPI usually changes once a year, sometimes with midyear revisions. PPPs change every three or four years. Population changes more often. There is no single cadence.

### 3.3 Decisions as inputs

**Decided. PFW.** All survey specific decisions, such as exclusions and comparability breaks, live in the PFW, one row per survey. PFW is an auxiliary file.

**Decided. PFW has two roles.**

1. It decides which surveys exist in the system. A new row adds a survey. An exclusion removes one.
2. It holds settings for each survey.

**Decided.** One survey per country, year ID, and welfare type. If two surveys exist with the same welfare type, only one is included. Two surveys can coexist only if they have different welfare types.

**Open. Module selection rule.** Which module a survey uses is decided by a rule in code. Its location is unknown.

**Open. Survey specific choices.** Where the HIST versus BIN choice is recorded for each survey, and where the choice between two surveys with the same welfare type is recorded.

**Decided. Resolved selections become data.** Generate and version a selection table containing the selected full module-bearing survey ID and data type. Existing rules and explicit survey choices are inputs; the generated table is not hand-edited. PFW retains survey inclusion and settings. Compare additions, exclusions, and module switches by resolved selection row. Changed rules with unchanged choices do not alone mandate recalculation of every survey. R1's invalidation mechanism and missing survey-choice policies/input locations stay Open.

Approval source: [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 192-204.

## 4. Identity and versions

**Decided. Survey identity.** Country, year ID, survey acronym, welfare type. Example: `PHL_2023_FIES_CON`.

**Decided. No versions in the module-bearing PIP artifact ID.** Versions are managed by `stamp`. Each release is linked to specific `stamp` versions of its module-bearing survey artifacts.

**Decided. Module is not a version.** Modules are different sets of variables. Versions are changes inside a module.

**Decided. Module-bearing artifact identity.** Survey identity remains country, year ID, survey acronym, and welfare type. Internal artifact identity also includes module, for example `PHL_2023_FIES_CON_GPWG`. A HIST-to-GPWG switch creates another artifact identity, not a version of one module-free identity. No alias or cross-module history mechanism is selected.

**Decided. Version metadata safeguards.** Within one artifact identity, changes to recorded module-version, source-version, or data-type fields must be preserved as a new artifact version even when data values are identical. Historical data must use metadata from the same pinned artifact version, never the latest sidecar substituted for it. A module-name change changes artifact identity and must not overwrite the old module's history. Descriptive metadata edits need not create versions.

Approval source: [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 169-190. The exact save/read mechanisms stay Open; no forcing of every unchanged save is selected.

**Open. Custom metadata integration.** Source supports custom current-sidecar fields and data-free current reads, not complete version-aware access. Metadata-only saving, same-version historical metadata, collision/type rules, and stable access mechanisms remain Open. Inherited evidence: S, `R/IO_core.R:193-207,253-269,310-348,630-660`; `R/format_registry.R:319-347`; `R/version_store.R:631-661`; [stamp S6](notes/stamp.md), lines 74-82. Full SHA keys are in section 14.

**Decided. Reporting level** is a level below identity. It is not needed at the data stage for now.

## 5. Stages

| # | Stage | Package | Output |
|---|---|---|---|
| 1 | Clean auxiliary data | `pipaux` | Auxiliary files |
| 2 | Download microdata | `pipdata` with `dlw` | Modules on the Y drive |
| 3 | Format and validate | `pipdata` | Clean survey data |
| 4 | Deflate | `pipdata` | Welfare in PPP, one column per PPP year |
| 5 | Estimates that do not depend on the poverty line | `pipster` | Mean, median, deciles, Gini, and others |
| 6 | Lineups | `pipster` | Distributions per country and lineup year |
| 7 | Countries with missing data | `pipster` | Estimated distributions |
| 8 | Write release folder | `pipdata` | Files ready for the API |
| 9 | ALL module for Table Maker | `pipdata` | Clean ALL module |
| 10 | Ingest | `pipapi` | Live API |

**Stage 1. Decided.** Errors here flow into every survey. This stage comes first.

**Stage 3. Decided.** Cleaning means formatting, not fixing errors. Examples: missing values coded properly, welfare converted to local currency units per day whatever its original period.

**Stage 4. Decided.** Welfare is converted from local currency to PPP for each available PPP year. Columns are named `welfare_YYYY`. Code detects all columns matching `welfare_[0-9]{4}` and never hardcodes PPP years. New PPP years must be picked up automatically.

**Stage 5. Decided.** Estimates are computed for each PPP year. Some estimates are one value, others are many, such as deciles.

**Decided. Independent estimate results and separate assembly.** Each estimate returns a list or data.table under a defined output contract. A separate storage layer independently saves and versions each successful result through stamp before reuse. Combining, appending, or joining saved outputs is separate work with its own inputs and outcome. Assembly failure must not discard or recompute successful unchanged estimates. Actual estimate dependencies still apply. Reject the mandatory long-table proposal. API-bound files retain current required names, shapes, keys, and units. Exact result contracts, physical storage, and assembly granularity remain Open.

Approval source: [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 206-223. Decile shares and cutpoints require distinct semantics; neither the reference list outputs nor current wide API fields fix the internal contracts (W, `R/md_compute_dist_stats.R:58-64`; `R/gd_compute_dist_stats.R:95-105`; I, `R/utils-stats.R:26-60,338-377`; [findings](notes/FINDINGS.md), line 39).

**Stage 6. Decided.** Lineups use additional deflation factors to align surveys to a target year. Between surveys this is interpolation. After the last survey it is extrapolation. The final output covers every country and lineup year. Lineups are national only.

**Stage 6. Open.** The lineup methodology and its exact inputs. A lineup does not depend on a fixed list of surveys. It depends on a rule applied to whichever surveys exist. Adding a survey can change which surveys a lineup uses.

**Stage 7. Decided.** Follows the published methodology at https://www.sciencedirect.com/science/article/pii/S0304387825002469. It is currently standalone code in the `targets` project of the current pipeline and will move to `pipster`.

**Stage 7. Open.** Its inputs. It likely combines information across countries, which makes it the widest cascade in the system.

**Stage 8. Decided.** Each release has its own folder. It contains lineup distributions, survey distributions, auxiliary files, and precomputed estimates. Survey distributions hold only the variables needed for poverty and inequality calculations.

**Stage 9. Decided.** The ALL module is cleaned and saved separately for Table Maker, which disaggregates by categorical variables and does not aggregate regionally. Table Maker itself (`piptm`) is outside this system.

**Survey year and lineup year. Decided.** Survey year estimates can go down to any level the survey supports. Lineup year estimates are national only.

## 6. Dependencies and rebuild rules

**Decided.** `stamp` tracks every artifact, its parents, and its versions, and decides what reruns.

**Decided. Dependencies are tracked per estimation, not per survey.** If an estimate for Colombia 2010 depends on CPI and another depends on population, a population change reruns only the second.

**Decided. Rebuild and failure policy.** Artifacts are eligible to rerun when an input or rule changes. In incremental mode, successful unchanged work is skipped. An unchanged deterministic failure waits for analyst review and an input or rule change. An external service failure is eligible on the next analyst-started execution. There are no automatic runs or retry loops.

**Decided. `stamp` stays domain agnostic.** It knows artifacts, hashes, parents, and versions. It never learns what a survey, a CPI series, or a release is. PIP-specific runtime concepts live in the PIP packages. Release orchestration lives in `pipdata`; `pipsystem` is the design and evidence workspace.

**Open. Row level change detection.** `stamp` hashes whole files, so it knows a file changed but not which rows. For PFW and series like CPI, that matters: a change in one row must not rebuild every survey. Two possible answers:

* `stamp` partitions, if a partition can be a parent on its own.
* A comparison step that lists exactly which rows changed. The historical `pipsystem` location is an unapproved candidate, not a runtime location decision.

M1 R1 remains unapproved. Source supports addressable partition parents through ordinary artifact path/version pins, but does not establish selective invalidation, removed-key handling, automatic parent inference, or unchanged-pin integration (S, `R/partitions.R:175-212,342-428`; `R/version_store.R:799-822,1203-1217`; [stamp S1](notes/stamp.md), lines 9-15). Candidate auxiliary keys and consumed-value mappings are evidence for later design, not a selected algorithm (A, `R/aux_cpi.R:214-242`; `R/aux_ppp.R:251-271`; `R/aux_pop.R:191-200`; Dp, `R/pd_aux_attr.R:129-165,189-210`; `R/pd_deflation.R:690-709,764-786`; `R/dependency_inputs.R:331-373`; [findings R1](notes/FINDINGS.md), lines 49-60).

**Decided. Trade off on PPP columns.** All `welfare_YYYY` columns live in one survey file because the API needs them. So adding or revising one PPP year changes the file, and every estimate for every PPP year of that survey reruns. Accepted, because PPPs change every three or four years.

**Decided. Automatic calculation fingerprints.** Fingerprint each independently run calculation and its known result-affecting dependencies. Record exact source SHAs separately. Manual version-label bumps, whole-package-SHA blanket invalidation, and general dependency discovery are not selected. Planning must compare the requested fingerprint before execution. Fingerprint coverage, missing/NA hash policy, and code-only scheduling integration remain Open.

Approval source: [confirmed M1 decisions](.cg-docs/brainstorms/2026-10-07-m1-code-orchestration-and-storage-decisions-confirmed.md), lines 136,140-142,162-165. Save-time hashing does not prove code-only scheduling: current stamp staleness compares immediate parent versions, not requested code hashes (S, `R/version_store.R:1176-1217`; `R/hashing.R:500-529`; [stamp S2](notes/stamp.md), lines 19-23). pipdata's curated fingerprints are current-source evidence, not complete coverage (Dp, `R/code_fingerprint.R:38-92`; [pipdata D4](notes/pipdata.md), lines 108-114).

## 7. Checks and failures

**Decided.** Checks run at every boundary: before saving, before ingesting, before reading.

**Decided.** When a survey or estimate fails a check, the failure is recorded and the run moves on. The pipeline never stops for one failure.

**Decided.** If a download from DLW is not correct, the survey is marked as needing revision in a manifest file and does not proceed. After formatting, data that fail validation are not saved.

**Decided. End-of-run feedback.** At the end of every run, return an R `data.table` with a short summary, attempted-work outcomes, failure details, and blocked work. Keep persistent run records separate. Automatic Markdown export is deferred; exact columns remain Open.

**Decided. The log records. It never decides.** What reruns is decided by `stamp`. The log only records what happened.

**Decided.** Logging lives in `pipfun` today.

**Open.** Moving logging into a general package usable outside PIP.

The section 6 rebuild and failure policy replaces the automatic transient-retry proposal. Failure records supply status; stamp selects work; logs record events. **Open.** Failure classification, generic persistent status integration, exact record schema, and interaction with Force mode. No Force override or retry loop is selected.

Approval sources: [first M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md), lines 98-107,126,133-142; [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 232-239. Full analyst workflows and exact feedback columns remain Open.

## 8. Releases

**Decided. Release ID.** Example: `20260922_2021_01_02_PROD`.

* `20260922`: release date. Frozen at the planned date. If the release goes out on September 24, the ID keeps September 22.
* `2021`: PPP year.
* `01_02`: PPP version. Not managed by this team.
* `PROD`: purpose. Production, test, or internal.

**Decided. Rounds.** Each round publishes one release per PPP year, currently 2017 and 2021. With a new PPP year, three releases at once. All releases in a round use the same survey versions. Only the PPP year differs.

**Decided. A release is a list of `stamp` versions,** one per survey and per auxiliary file.

**Decided. Release folders.** Each release has its own folder, even when data are identical to another release. This duplication is accepted for now.

**Decided. The API serves every past release,** to guarantee reproducibility.

**Decided. Release season.** Processing happens in about the month before a release. Nothing runs between seasons. Data are saved on the Y drive.

**Decided. Test releases are releases.** They use a different suffix and are tracked like any other release.

**Decided. Three states.**

1. **Building.** During release season.
2. **Published.** Corrections are allowed only during the first days, roughly the first week. Data are replaced.
3. **Frozen.** No changes. Any fix becomes a new release.

**Decided. Corrections keep history.** Preserve replaced artifact versions and dated release-version references so prior and corrected online states can be identified. Do not change the correction window or frozen-release rules. Capture, historical retrieval, and release-aware retention mechanisms remain Open.

Approval sources: [first M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md), line 125; [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 230-231. Individual retained-version loading is not a named-release guarantee; optional pruning can remove versions (S, `R/IO_core.R:483-498`; `R/version_store.R:122-146,452-489,1257-1311`; `R/retention.R:415-435`; [stamp S7](notes/stamp.md), lines 86-92).

## 9. Running the system

**Decided. Modes.**

| Mode | What it does |
|---|---|
| Incremental | Runs only what is missing or stale. Default. |
| Force | Reruns everything in scope, even if nothing changed. |
| Scoped | Limits either mode to a part of the system, such as one country, only auxiliary data, or only CPI. |

**Decided. Plan-only mode.** Use normal planning logic to return an R data.table of selected work and selection reasons without stage execution or changes to pipeline state. It is a preview, not a stored execution commitment. No automatic Markdown export is selected. Exact columns remain Open.

**Decided.** Every run belongs to one release.

**Decided. Engine first, interface later.** Plain R functions hold execution logic. Interface choice and implementation are deferred. Define analyst workflows and required feedback during engine design. Exact signatures stay Open; illustrative `run(release, scope, mode)` is not a fixed API. Coordination location is the approved R3 decision in section 10.

**Decided. Smallest complete solution first.** Add features in small steps; no general framework is selected.

Approval sources: [first M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md), lines 42-45,88-90,102-107,124,128; [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 101-102,229,238-239.

**Open. Interface.** A Shiny app or dashboard to drive the system.

**Open. Platform.** Databricks or other options. Whatever is chosen, the logic that decides what to run must not depend on it.

**Open.** Whether the `targets` project of the current pipeline is fully replaced.

## 10. Packages and responsibilities

| Package | Owns | Must not own | Status |
|---|---|---|---|
| `stamp` | Artifacts, hashes, parents, versions, staleness | Any PIP concept | Decided |
| `pipaux` | Auxiliary cleaning, formatting, dependencies between series | Survey processing | Decided |
| `pipdata` | Download, formatting, validation, deflation, ALL module for Table Maker; release orchestration through one public entry point, separate from processing functions | Calculations of indicators; independent rebuild authority | Decided |
| `pipster` | Calculations: stages 5, 6, 7 | Reading or saving files, choosing what to run | Decided |
| `pipfun` | Shared utilities, logging | | Decided |
| `pipapi` | Serving every release | | Decided |
| `pipload` | PIP-aware access adapter; lookup and I/O delegated to stamp for versions, hashes, and parents | Independent rebuild decisions | Decided |
| `wbpip` | Today's calculations, as reference for `pipster` | | Open: likely retired |
| `pipfaker` | Synthetic data for tests | | Decided |
| `metapip` | Installing the ecosystem, SHA pinned lockfile | | Decided |
| `piptm` | Table Maker API | | Out of scope |
| Orchestrator (`pipdata`) | Release coordination, calling every stage, writing releases; stamp selects rebuild work | Calculations; independent rebuild authority | Decided |

**Decided.** `pipdata` belongs to the new pipeline only. The current pipeline does not use it.

**Decided.** `pipster` grows by adding calculations that chain with the R native pipe, so new estimates do not break earlier ones.

**Decided. pipster does calculations only.** Calculation functions receive data and return results. A separate layer selects estimates from a data list, supplies inputs, and saves results through stamp. pipster does not select work, read files, or save outputs. The separate layer is pipdata coordination under R3; do not create another package solely for it.

**Decided. Orchestration in pipdata.** Keep release coordination separate from processing functions, with one public existing-package entry point and platform-independent logic. stamp remains the single rebuild authority. Reconcile pipdata's current manifest/planner; processing reuse is not approval of its currentness rules. Stage 8's target package and Orchestrator location become pipdata. Do not fix an exact entry-point signature or choose a platform.

**Decided. pipload is the PIP-aware access adapter.** Reuse PIP lookup and I/O functions; delegate versions, hashes, and parents to stamp. pipload does not make independent rebuild decisions. Format compatibility and version-pinned metadata access remain Open; a separate QS2 metadata artifact is not a stamp custom sidecar.

Approval sources: [first M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md), line 127; [remaining M0 decisions](.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md), lines 208-211,235; [confirmed M1 decisions](.cg-docs/brainstorms/2026-10-07-m1-code-orchestration-and-storage-decisions-confirmed.md), lines 137-139,166-168. Current-source limits: Dp, `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`; L, `R/pip_inv_enrich.R:219-260`; `R/load_pip_data.R:375-389`; `R/load_aux_data.R:37,61-66`; [pipdata D4](notes/pipdata.md), lines 99-118; [pipload limits](notes/pipload.md), lines 40-42.

**Decided. Planned `pipapi` change.** The API receives welfare in local currency and converts to PPP itself. The planned change: receive welfare already in PPP for its release, and remove the conversion. Until then, release files keep the current format.

## 11. Constraints

* **Decided.** API behavior does not change, except the planned PPP change in section 10.
* **Decided.** Performance comes first. Fast formats such as `fst` stay.
* **Decided.** Package repositories in the workspace are read only from `pipsystem`. Changes are made in each package's own repository.
* **Decided.** No fabrication. Every fact traces to a file and line, or is marked unknown.
* **Decided.** R with `data.table` and `collapse`.

## 12. Open questions

1. Row level change detection for PFW and auxiliary series: M1 R1 remains Open. Partitions and comparison/projection remain proposals, not a selected algorithm or another rebuild authority. See section 6 and S1/A1/D2 evidence.
2. A concrete `stamp` partition can use ordinary path/version parent pins in source. Selective invalidation, removed keys, automatic parent inference, unchanged pins, and integration validation remain Open (section 6; S1).
3. Custom current-sidecar fields and data-free current reads are supported in source. Metadata-only saving, same-version historical metadata, collision/type rules, and stable access mechanisms remain Open (section 4; S6).
4. Automatic calculation fingerprints are Decided. Known dependency coverage, missing/NA saved-hash policy, and code-only scheduling remain Open (section 6; confirmed M1 R2).
5. Module-bearing artifact identity is Decided; module removal is rejected. No identity migration, alias system, or new cross-module history mechanism is selected. Metadata safeguards are required; their mechanisms remain Open (section 4).
6. Generated selection data is Decided. HIST/BIN and competing-survey rules, source input locations, and exact selection schema remain UNKNOWN/Open. The legacy HIST-before-BIN ranking is not adopted (section 3.3; D1).
7. Lineup methodology and its inputs.
8. Inputs of the missing data method.
9. Independent list/data.table estimate results and separate saving/assembly are Decided. Exact keys, types, null rules, units, physical storage, and assembly granularity remain Open. Distinguish decile shares from cutpoints (section 5).
10. pipdata orchestration is Decided. Existing manifest authority reconciliation and exact entry point remain Open; platform remains unselected (section 10).
11. Whether `targets` is fully replaced.
12. pipload's adapter boundary is Decided. fst/qs2 compatibility, separate metadata-artifact paths versus sidecars, and pinned metadata integration remain Open (section 10).
13. Interface and platform.
14. The revised failure policy is Decided, with no automatic runs or retry loops. Classification, Force interaction, persistent failure/status integration, and exact record schema remain Open (sections 6-7).
15. Correction history is Decided: retain replaced versions and dated references. Atomic capture, historical reads, freeze enforcement, and release-aware retention mechanisms remain Open (section 8).

Items 7, 8, and 11 await the M4 targets harvest; full lineup and cross-country missing-data inputs are UNKNOWN. M1 source inspection does not supply those methods ([HARVEST_BRIEF](HARVEST_BRIEF.md), lines 129-131; [findings](notes/FINDINGS.md), lines 37-38,41). Logging relocation, detailed analyst workflows, exact engine/table signatures, and result contracts also remain Open.

## 13. Out of scope for now

* Removing duplicated data across release folders.
* Table Maker internals (`piptm`).
* Reporting levels below national at the data stage.

## 14. Decision Evidence and Implementation Gaps

### Approval and Historical References

Exact D1-D5 wording and the matching charter sentence were separately approved during Phase 1 of [the integration plan](.cg-docs/plans/2026-10-07-m0-m1-design-integration.md). Approval answers and executed checks are recorded in [the execution report](.cg-docs/work-reports/2026-10-07-m0-m1-design-integration.md). This is target policy, not tested implementation or permission to start M2.

Historical proposals are retained unchanged in [the harvest findings](notes/FINDINGS.md), lines 49-84. The later M0 decisions reject module-free artifact identity and mandatory long-table output. Confirmed M1 R2/R3 supersede the explicit-label and separate-pipsystem-orchestrator proposals. M1 R1 remains unapproved. The earlier unconfirmed M1 record remains historical, not the canonical decision source.

### Inherited Package Provenance

Package citations use the following full harvested SHAs, not current package HEADs. No package repository was re-read and no package tests were run for this integration. Source paths and original inspection limits are in [HARVEST](HARVEST.md), lines 9-49.

| Key | Package | Harvested SHA |
|---|---|---|
| S | stamp | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| A | pipaux | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` |
| Dp | pipdata | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| L | pipload | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| F | pipfun | `0c6a78d9884ed0965a524311537eec2a5095d60b` |
| P | pipster | `828064e406e07e711c34d2ba725746e367d35f9b` |
| W | wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` |
| I | pipapi | `280af151d05902a550d5dea18cd4bf1a3d013239` |

The historical D key (`84c384f78ed44bcb96bb19c6d364519df5b5db6f`) identifies earlier pipsystem documents, not pipdata or this new integration text.

### Gaps

- **Metadata and lineage:** metadata-only or parent-only saves can skip. Current sidecar readers have no historical-version selector. The Decided version safeguards need save/read mechanisms and tests, not forced saving of every unchanged object (S, `R/IO_core.R:253-269,630-660`; `R/format_registry.R:319-347`; `R/version_store.R:631-661`; [stamp S6](notes/stamp.md), lines 74-82).
- **Planning and code:** stamp staleness does not compare requested code hashes. Transitive planning, topological order, unchanged-output parent refresh, and failed/missing-state integration have gaps; inspected manual assertions are not executed passes (S, `R/version_store.R:1176-1217`; `R/rebuild.R:253-342,495-518`; [stamp S5](notes/stamp.md), lines 55-70; [fit table](tables/stamp_fit.csv), rows at lines 5-6,10,14-15).
- **Current pipdata authority:** the manifest/planner currently decides work. This conflicts with the retained stamp authority; reuse is not approval of a second currentness authority (Dp, `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`; [pipdata D4](notes/pipdata.md), lines 99-118).
- **Access formats:** pipload's exact QS2 metadata artifact differs from a custom sidecar. Current PIP loader fst compatibility and pinned metadata integration need validation (L, `R/pip_inv_enrich.R:219-260`; `R/load_pip_data.R:375-389`; `R/load_aux_data.R:37,61-66`; [pipload limits](notes/pipload.md), lines 40-42).
- **Current/target contradictions:** generated GDP is read back from GitHub, contrary to section 3.2 (A, `R/aux_gdp.R:34-65,368-374`). Invalid validation rows are retained, and the clean path lacks an active post-format validation gate (Dp, `R/dependency_execution.R:1-17,433-437`; `R/pipdata_dlw_compare.R:452-459`; `R/pd_process_data.R:225-240,330-342`). Current welfare columns are `welfare_ppp_YEAR_RELEASE_ADAPT`, not the Decided `welfare_YYYY` (Dp, `R/pd_deflation.R:907-928`). These are inherited source conflicts, not reproduced production failures ([findings](notes/FINDINGS.md), lines 90-94).
- **Selection and exclusions:** legacy HIST-before-BIN ranking conflicts with survey-specific choice; active new-pipeline use is UNKNOWN (L, `R/pip_find_data.R:307-308,399-419,426-428`). PFW choice inputs, exclusions, remote auxiliary dependency graph content/SHA, and exact selection contracts remain UNKNOWN ([findings](notes/FINDINGS.md), lines 95,98,115; A, `R/aux_pfw.R:427-430,524-547,614-617`; `R/utils.R:490-500`). M1 R1 is not resolved by the generated table policy.
- **Release/API compatibility:** current API wide files and LCU-to-PPP conversion remain the boundary until the existing planned API change (I, `R/utils-stats.R:26-60,338-377`; `R/utils-pipdata.R:274-321`; [pipapi](notes/pipapi.md), lines 43-71,106-129). Old-release lookup validation is a source-level availability risk (I, `R/create_lkups.R:776-799`; `R/pip.R:57-67`; `R/validate_lkup.R:17-25,78-85`). Complete production schemas, writer units, numerical equivalence, and live availability remain UNKNOWN.
- **Remaining execution evidence:** named-release atomic capture, historical retrieval, freeze enforcement, release-aware retention, parallel-write safety, target-scale performance, complete stage 5-7 calculations, failure classification/status integration, and Force interaction are not certified by harvest completion. No package tests, pipeline runs, or API calls were executed ([HARVEST](HARVEST.md), lines 41-49,71-78; [fit table](tables/stamp_fit.csv), lines 12-16). Interface, platform, targets replacement, and full lineup/missing-country inputs remain Open.
