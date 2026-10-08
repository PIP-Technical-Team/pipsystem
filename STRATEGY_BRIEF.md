# STRATEGY_BRIEF.md

Input for `/cg-strategy` in `pipsystem`. Written 2026-10-07.

It answers every question the session asks and holds the full roadmap to create.

## How to use

1. Run `/cg-strategy`.
2. Paste this file, or point the session to it.
3. Approve the roadmap in section 9. The session sends it to `@cg-roadmap` in one dispatch.

All features start with status `idea`. `roadmap.json` stores only a title and a status per feature, so titles are short. The "What it means" and "Depends on" columns go into the strategy record in `.cg-docs/strategy/`, not into `roadmap.json`.

## 1. Trigger

Starting fresh. `roadmap.json` is empty. The design exists in `SYSTEM_DESIGN.md`.

Project type: **technical** (infrastructure and pipeline). `compound-gpid.local.md` says "Tool". Treat it as technical.

## 2. The project

A new backend pipeline for the World Bank Poverty and Inequality Platform (PIP). It turns more than 2,000 harmonized household surveys and more than 20 auxiliary series into the files the PIP API serves.

Today, one change in one survey or one auxiliary value forces a full rerun. The new system detects what changed and reruns only what that change affects.

It is for the PIP Technical Team, who produce each release, and for the API that publishes the numbers.

## 3. Ideas

* Everything belongs to a release. Test runs are releases too.
* Every published number is reproducible: we know which data versions, code versions, and decisions produced it.
* `stamp` tracks every artifact, its parents, and its versions, and decides what reruns. It knows nothing about PIP.
* Dependencies are tracked per estimate, not per survey.
* Ten stages, from cleaning auxiliary data to ingesting into the API (`SYSTEM_DESIGN.md` section 5).
* A failure is recorded and the run moves on. Every run ends with a report.
* The engine is plain R functions. Any interface comes later. (Proposal, decided in M0.)

## 4. Dependencies and build order

1. Design decisions (M0) and code facts (M1) come before any build code.
2. `stamp` must support what the skeleton needs before M2 can finish. Gaps are fixed in the `stamp` repo.
3. Auxiliary data come before surveys. Deflation needs CPI and PPP, and PFW decides which surveys exist.
4. Stages 1 to 5 come before lineups (stage 6) and missing countries (stage 7). Stage 7 needs lineups.
5. The release folder (stage 8) and ingest (stage 10) come last.
6. Stage 9 (ALL module for Table Maker) depends only on stages 2 and 3. It can run in parallel with M3 and M4.

## 5. Success at the first useful milestone

M2, the walking skeleton: one country, CPI, PPP, and PFW, one survey, one estimate (the mean), and one test release, all through `stamp`.

The test: run it twice, and nothing reruns the second time. Change one CPI value, and only the artifacts that use it rerun.

## 6. Technical probes

**Architecture.** `stamp` stays domain agnostic. PIP concepts live in `pipsystem`. `pipster` only calculates. The orchestrator decides what runs. Its location is decided in M1.

**Infrastructure.** Data on the Y drive. `fst` files. R with `data.table` and `collapse`. No platform chosen yet. The logic must not depend on one.

**API contract.** `pipapi` behavior does not change, except the planned move to receive welfare already in PPP. Until then, release files keep the current format.

**Build order.** See section 4.

## 7. Constraints

* Everything ready by end of January 2027. Fallback: two more weeks, no more.
* Reason: the release around mid March 2027 must be the first one produced by the new pipeline.
* About 16 weeks, with the December holidays inside.
* Work runs with several agents in parallel.
* Package repos are read only from `pipsystem`. Changes go to each package's own repo.
* No fabrication. Every fact traces to a file and line, or is marked unknown.

## 8. Risks

* **M4 is the biggest.** Port the existing lineup and missing country code. Do not redesign it.
* **`stamp` may not allow a partition as a parent** (S1). Then row level change detection needs a comparison step in `pipsystem`, or a change in `stamp`.
* **Scale.** Tens of thousands of artifacts and parallel writes (S4) are untested.
* **Comparison with the current pipeline takes time.** It starts in M3 for survey estimates, not only in M5.
* **The `pipapi` PPP change** may not fit before March. It is the last feature of M5 and can slip without blocking the release.
* **M3 is dense.** 17 features in about 3 weeks. Most can run in parallel once M2 works.

## 9. Roadmap

Add every milestone and feature below. The milestone objective is the line in italics. The feature title is the first column. Status `idea` for all.

### M0 Settle the design

*Decide every proposal in SYSTEM_DESIGN.md so build work starts from a stable design.*

Target: mid October.

| Feature | What it means | Depends on |
|---|---|---|
| Decide module out of survey ID | Section 4. Decided on the condition that `stamp` stores custom metadata (S6). | |
| Decide decisions become data | Section 3.3. Module rule and survey choices stored as tables. | Module out of survey ID |
| Decide stage 5 output shape | One long table of estimates. | Module out of survey ID |
| Decide engine first interface later | Section 9. `run(release, scope, mode)`. | |
| Decide pipster calculations only | Section 10. A separate layer decides what runs and saves. | Engine first interface later |
| Decide plan only mode | Section 9. Show what would run, without running it. | Engine first interface later |
| Decide transient and permanent failures | Section 7. | |
| Decide corrections keep history | Section 8. | |
| Update SYSTEM_DESIGN with M0 decisions | Move decided proposals to Decided. Andres approves. | All above |

### M1 Know the code

*Answer the Open questions that only code can answer, with file and line evidence.*

Target: end of October. Runs in parallel with M0. One agent per package, as set in `HARVEST_BRIEF.md`.

| Feature | What it means | Depends on |
|---|---|---|
| Harvest stamp | S1 to S7 and `tables/stamp_fit.csv`. | |
| Harvest pipaux | A1 to A4. | |
| Harvest pipdata | D1 to D4. | |
| Harvest pipload | L1. | |
| Harvest pipfun | F1. | |
| Harvest pipster and wbpip | P1 and P2. | |
| Harvest pipapi | I1. | |
| Write harvest findings | `notes/FINDINGS.md` and `HARVEST.md`. | All harvests |
| Decide row level change detection | Partitions in `stamp`, or a comparison step in `pipsystem`. Open questions 1 and 2. | Harvest stamp |
| Decide code version rule | Open question 4. | Harvest stamp |
| Decide orchestrator location | New package, or part of `pipdata`. Open question 10. | Harvest pipdata |
| Decide pipload role | Open question 12. | Harvest pipload |
| Update SYSTEM_DESIGN with M1 findings | Andres approves each change. | Write harvest findings |

### M2 Walking skeleton

*Prove incremental rebuild end to end on one survey, one estimate, and one test release through stamp.*

Target: mid November.

| Feature | What it means | Depends on |
|---|---|---|
| Close stamp gaps for skeleton | Changes in the `stamp` repo found in M1. | Harvest stamp |
| Create engine skeleton | Orchestrator with `run(release, scope, mode)`, incremental and force modes. | Decide orchestrator location |
| Save CPI PPP and PFW through stamp | Stage 1 for three files, with commit check and content hash check. | Create engine skeleton |
| Download one survey | Stage 2, with DLW version check. | Create engine skeleton |
| Format and validate one survey | Stage 3. | Download one survey |
| Deflate one survey | Stage 4. Detects `welfare_YYYY` columns. No hardcoded PPP years. | Format and validate one survey, Save CPI PPP and PFW |
| Compute the mean | Stage 5 through `pipster`. | Deflate one survey |
| Register test release | Release ID with test purpose, linked to the list of `stamp` versions used. | Compute the mean |
| Test incremental reruns | A rerun with no change runs nothing. One CPI change reruns only its dependents. | All above |

### M3 Widen to all surveys

*Run stages 1 to 5 and stage 9 for every survey and auxiliary series.*

Target: mid December.

| Feature | What it means | Depends on |
|---|---|---|
| All aux series through stamp | Stage 1 for every series. The chain between series is visible, for example GDP from WDI and Maddison. | M2 |
| Legacy aux repos as inputs | Change detection only, for repos with their own processing code. | All aux series through stamp |
| Row level change detection | As decided in M1. A change in one PFW or CPI row rebuilds only the affected surveys. | Decide row level change detection |
| Module selection table | Generated by code. Module and data type per survey. | Decide decisions become data |
| Survey list from PFW | Inclusion, exclusion, one survey per country, year ID, and welfare type. | All aux series through stamp |
| DLW change detection for all surveys | New and corrected surveys become new versions. | M2 |
| Revision manifest | Surveys with a bad download are marked and do not proceed. | DLW change detection for all surveys |
| Format validate and deflate all surveys | Stages 3 and 4 for every survey. | Module selection table, Survey list from PFW |
| All stage 5 estimates | Mean, median, deciles, Gini, and others, in the shape decided in M0. | Decide stage 5 output shape |
| Per estimate dependencies | A population change reruns only the estimates that use population. | All stage 5 estimates |
| Failure handling | Record and continue. Transient and permanent failures as decided in M0. | M2 |
| End of run report | Every success and failure. | Failure handling |
| Scoped mode | Limit a run to one country, only aux data, or only CPI. | M2 |
| Plan only mode | Only if approved in M0. | Decide plan only mode |
| ALL module for Table Maker | Stage 9. | Format validate and deflate all surveys |
| Scale test | Full survey set with parallel workers. | Format validate and deflate all surveys |
| Compare survey estimates with current pipeline | Stage 5 results match, or every difference is explained. | All stage 5 estimates |

### M4 Lineups and missing countries

*Port stages 6 and 7 from the current pipeline and track their dependencies.*

Target: mid January.

| Feature | What it means | Depends on |
|---|---|---|
| Harvest targets project | Add it to the workspace. Answer Open questions 7 and 8: lineup and missing data inputs. | |
| Decide targets replacement | Open question 11. | Harvest targets project |
| Port lineups | Stage 6 into `pipster`. Port, do not redesign. | Harvest targets project |
| Track lineup dependencies | A lineup depends on a rule over surveys. Adding a survey can change it. | Port lineups |
| Port missing countries | Stage 7 into `pipster`. | Port lineups |
| Track missing country dependencies | The widest cascade in the system. | Port missing countries |
| Compare lineups with current pipeline | Stages 6 and 7. | Port lineups, Port missing countries |

### M5 Release and API

*Produce a full release the API can serve, and prove it matches the current pipeline.*

Target: end of January.

| Feature | What it means | Depends on |
|---|---|---|
| Write release folder | Stage 8, in the current API format. | M3, M4 |
| Build a round | One release per PPP year, all with the same survey versions. | Write release folder |
| Release states | Building, published, frozen. Correction history if approved in M0. | Write release folder |
| Ingest into pipapi | Stage 10. | Write release folder |
| Full test release | A complete test release, end to end. | All above |
| Compare full release with current pipeline | Final check before March. | Full test release |
| Move PPP conversion out of pipapi | The planned API change. Can slip after March. | Full test release |

### M6 Interface and platform

*Give analysts a way to run the system: plain R functions in January, the rest after March.*

| Feature | What it means | Depends on |
|---|---|---|
| Document run functions for analysts | How to run incremental, force, scoped, and plan only modes. | Create engine skeleton |
| Decide interface | Shiny app or dashboard. After March. | |
| Decide platform | Databricks or other options. After March. | |
| Move logging to general package | Open item in section 7. After March. | |

## 10. Current Focus for the charter

M0 and M1 in parallel. M0: Andres decides the proposals in `SYSTEM_DESIGN.md`. M1: one agent per package answers `HARVEST_BRIEF.md`. Next: M2 walking skeleton.
