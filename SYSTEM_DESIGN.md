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

**Open. Proposal: decisions become data.** Every choice that changes results must exist as stored data, not only as logic in code. The module rule is run once and its result saved as a table. When the rule changes, the new table is compared with the old one, and only surveys whose row changed rebuild.

## 4. Identity and versions

**Decided. Survey identity.** Country, year ID, survey acronym, welfare type. Example: `PHL_2023_FIES_CON`.

**Decided. No versions in the PIP ID.** Versions are managed by `stamp`. Each release is linked to specific `stamp` versions of each survey.

**Decided. Module is not a version.** Modules are different sets of variables. Versions are changes inside a module.

**Open. Module in the ID.** Today the PIP ID includes the module, for example `PHL_2023_FIES_CON_GPWG`, and code uses it to choose the estimation procedure, such as grouped data procedures.

The problem: if a survey moves from HIST to GPWG, its ID changes, and `stamp` treats it as a different survey. History breaks.

**Proposal.**

* The `stamp` name is the identity without module: `PHL_2023_FIES_CON`.
* Moving from HIST to GPWG is a new version of the same survey.
* Module, module version, data type, and DLW master and harmonization versions are stored in the `stamp` metadata file kept next to each artifact. The data file itself stays `fst`.
* The module selection table (section 3.3) also carries the data type, so code can read it to choose the procedure. This table is generated by code, never edited by hand.
* Where other systems need the module in the ID, the full ID is built when the release folder is written.

**Open.** Whether `stamp` supports custom fields in its metadata file. To be confirmed by the harvest.

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
| 8 | Write release folder | Open | Files ready for the API |
| 9 | ALL module for Table Maker | `pipdata` | Clean ALL module |
| 10 | Ingest | `pipapi` | Live API |

**Stage 1. Decided.** Errors here flow into every survey. This stage comes first.

**Stage 3. Decided.** Cleaning means formatting, not fixing errors. Examples: missing values coded properly, welfare converted to local currency units per day whatever its original period.

**Stage 4. Decided.** Welfare is converted from local currency to PPP for each available PPP year. Columns are named `welfare_YYYY`. Code detects all columns matching `welfare_[0-9]{4}` and never hardcodes PPP years. New PPP years must be picked up automatically.

**Stage 5. Decided.** Estimates are computed for each PPP year. Some estimates are one value, others are many, such as deciles.

**Stage 5. Open. Output shape.** Proposal: one long table for all estimates, with columns for survey, PPP year, reporting level, statistic, position, and value. A new statistic adds rows, not a new format.

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

**Decided.** Anything reruns when any of its inputs changed, or when it failed last time.

**Decided. `stamp` stays domain agnostic.** It knows artifacts, hashes, parents, and versions. It never learns what a survey, a CPI series, or a release is. PIP concepts live in `pipsystem`.

**Open. Row level change detection.** `stamp` hashes whole files, so it knows a file changed but not which rows. For PFW and series like CPI, that matters: a change in one row must not rebuild every survey. Two possible answers:

* `stamp` partitions, if a partition can be a parent on its own.
* A comparison step in `pipsystem` that lists exactly which rows changed.

The harvest decides which.

**Decided. Trade off on PPP columns.** All `welfare_YYYY` columns live in one survey file because the API needs them. So adding or revising one PPP year changes the file, and every estimate for every PPP year of that survey reruns. Accepted, because PPPs change every three or four years.

**Open. Code versions.** What counts as a code change for `stamp`. Hashing whole function bodies would rebuild everything after any edit. Explicit version labels, bumped on purpose, would avoid that.

## 7. Checks and failures

**Decided.** Checks run at every boundary: before saving, before ingesting, before reading.

**Decided.** When a survey or estimate fails a check, the failure is recorded and the run moves on. The pipeline never stops for one failure.

**Decided.** If a download from DLW is not correct, the survey is marked as needing revision in a manifest file and does not proceed. After formatting, data that fail validation are not saved.

**Decided.** At the end of every run, a report lists every success and failure, so the analyst can see exactly where problems are.

**Decided. The log records. It never decides.** What reruns is decided by `stamp`. The log only records what happened.

**Decided.** Logging lives in `pipfun` today.

**Open.** Moving logging into a general package usable outside PIP.

**Open. Proposal: two kinds of failure.** Transient failures, such as a download timeout, retry automatically. Permanent failures, such as a failed validation, do not rerun until an input or rule changes, because they would fail again.

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

**Open. Proposal: corrections keep history.** Even inside the correction window, the replaced version stays in `stamp`. The release just points to the new version. This makes it possible to say what was online on any given day.

## 9. Running the system

**Decided. Modes.**

| Mode | What it does |
|---|---|
| Incremental | Runs only what is missing or stale. Default. |
| Force | Reruns everything in scope, even if nothing changed. |
| Scoped | Limits either mode to a part of the system, such as one country, only auxiliary data, or only CPI. |

**Open. Proposal: plan only mode.** Shows what would run, without running it.

**Decided.** Every run belongs to one release.

**Open. Proposal: engine first, interface later.** The engine is a set of plain R functions, roughly `run(release, scope, mode)`. Any interface calls those functions. The logic never lives inside the interface.

**Open. Interface.** A Shiny app or dashboard to drive the system.

**Open. Platform.** Databricks or other options. Whatever is chosen, the logic that decides what to run must not depend on it.

**Open.** Whether the `targets` project of the current pipeline is fully replaced.

## 10. Packages and responsibilities

| Package | Owns | Must not own | Status |
|---|---|---|---|
| `stamp` | Artifacts, hashes, parents, versions, staleness | Any PIP concept | Decided |
| `pipaux` | Auxiliary cleaning, formatting, dependencies between series | Survey processing | Decided |
| `pipdata` | Download, formatting, validation, deflation, ALL module for Table Maker | Calculations of indicators | Decided |
| `pipster` | Calculations: stages 5, 6, 7 | Reading or saving files, choosing what to run | Open: proposal |
| `pipfun` | Shared utilities, logging | | Decided |
| `pipapi` | Serving every release | | Decided |
| `pipload` | Storage access | | Open: its role next to `stamp` |
| `wbpip` | Today's calculations, as reference for `pipster` | | Open: likely retired |
| `pipfaker` | Synthetic data for tests | | Decided |
| `metapip` | Installing the ecosystem, SHA pinned lockfile | | Decided |
| `piptm` | Table Maker API | | Out of scope |
| Orchestrator | Deciding what runs, calling every stage, writing releases | Calculations | Open: location |

**Decided.** `pipdata` belongs to the new pipeline only. The current pipeline does not use it.

**Decided.** `pipster` grows by adding calculations that chain with the R native pipe, so new estimates do not break earlier ones.

**Open. Proposal.** `pipster` does calculations only. A separate layer decides what runs and saves through `stamp`. The list of estimates to run lives as data in that layer.

**Open.** Whether the orchestrator is a new package or part of `pipdata`.

**Decided. Planned `pipapi` change.** The API receives welfare in local currency and converts to PPP itself. The planned change: receive welfare already in PPP for its release, and remove the conversion. Until then, release files keep the current format.

## 11. Constraints

* **Decided.** API behavior does not change, except the planned PPP change in section 10.
* **Decided.** Performance comes first. Fast formats such as `fst` stay.
* **Decided.** Package repositories in the workspace are read only from `pipsystem`. Changes are made in each package's own repository.
* **Decided.** No fabrication. Every fact traces to a file and line, or is marked unknown.
* **Decided.** R with `data.table` and `collapse`.

## 12. Open questions

1. Row level change detection for PFW and auxiliary series: `stamp` partitions or a comparison step.
2. Whether a `stamp` partition can be a parent on its own.
3. Whether `stamp` supports custom fields in its metadata file.
4. What counts as a code version for `stamp`.
5. Whether the module is removed from the internal survey identity.
6. Where the module selection rule lives, and where survey specific choices are recorded.
7. Lineup methodology and its inputs.
8. Inputs of the missing data method.
9. Shape of stage 5 outputs.
10. Where the orchestrator lives.
11. Whether `targets` is fully replaced.
12. The role of `pipload` next to `stamp`.
13. Interface and platform.
14. Transient versus permanent failures.
15. Whether corrections inside the release window keep history.

## 13. Out of scope for now

* Removing duplicated data across release folders.
* Table Maker internals (`piptm`).
* Reporting levels below national at the data stage.
