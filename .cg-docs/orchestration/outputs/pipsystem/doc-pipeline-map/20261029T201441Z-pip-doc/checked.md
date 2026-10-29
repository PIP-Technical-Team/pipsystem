# PIP Pipeline Map

This map describes the target pipeline, not a claim that every stage is implemented today. `SYSTEM_DESIGN.md:7`
The dependency table distinguishes target decisions (`decided`), harvested behavior (`harvested`), and unresolved information (`open` or `unknown`). `tables/pipeline_map.csv:22-23,35-36,45`

## The Ten Stages

| Stage | Responsible Package | Work and Output | Evidence |
|---|---|---|---|
| 1. Clean auxiliary data | `pipaux` | Produces auxiliary files. | `SYSTEM_DESIGN.md:147` |
| 2. Download microdata | `pipdata` with `dlw` | Downloads survey modules to the Y drive. | `SYSTEM_DESIGN.md:148` |
| 3. Format and validate | `pipdata` | Produces clean survey data. | `SYSTEM_DESIGN.md:149` |
| 4. Deflate | `pipdata` | Produces welfare in purchasing power parity (PPP), with one column per PPP year. | `SYSTEM_DESIGN.md:150,162` |
| 5. Estimates that do not depend on the poverty line | `pipster` | Computes mean, median, deciles, Gini, and other estimates. | `SYSTEM_DESIGN.md:151` |
| 6. Lineups | `pipster` | Produces distributions per country and lineup year. | `SYSTEM_DESIGN.md:152` |
| 7. Countries with missing data | `pipster` | Produces estimated distributions. | `SYSTEM_DESIGN.md:153` |
| 8. Write release folder | `pipdata` | Writes files ready for the API. | `SYSTEM_DESIGN.md:154` |
| 9. ALL module for Table Maker | `pipdata` | Produces a clean ALL module. | `SYSTEM_DESIGN.md:155` |
| 10. Ingest | `pipapi` | Makes the release available through the live API. | `SYSTEM_DESIGN.md:156` |

Stage 1 comes first because errors in auxiliary data flow into every survey. `SYSTEM_DESIGN.md:158`

In stage 3, cleaning means formatting rather than fixing errors, such as converting welfare to local currency units per day. `SYSTEM_DESIGN.md:160`
The target validation rule prevents incorrect downloads from proceeding and prevents data that fail validation after formatting from being saved. `SYSTEM_DESIGN.md:213`

Stage 4 converts welfare from local currency to PPP in columns named `welfare_YYYY`, detecting available PPP years rather than hardcoding them. `SYSTEM_DESIGN.md:162`
Stage 5 computes estimates for each PPP year. `SYSTEM_DESIGN.md:164`

A lineup year is a round calendar year for which an estimate is built from surrounding surveys. `SYSTEM_DESIGN.md:44`
Stage 6 uses additional deflation factors to align surveys to a target year, interpolating between surveys and extrapolating after the last survey. `SYSTEM_DESIGN.md:170`
Lineup estimates are national only, while survey-year estimates can use any level the survey supports. `SYSTEM_DESIGN.md:182`

Stage 7's method is currently standalone code in the existing pipeline's `targets` project and is intended to move to `pipster`. `SYSTEM_DESIGN.md:174`

Stage 8 puts lineup distributions, survey distributions, auxiliary files, and precomputed estimates in a separate folder for each release. `SYSTEM_DESIGN.md:178`

The ALL module contains every variable in the GMD harmonization methodology. `SYSTEM_DESIGN.md:34,60`
Stage 9 saves that cleaned module separately for Table Maker, whose internals are outside this system. `SYSTEM_DESIGN.md:180`

## Documented Dependencies

Read each arrow as an input passed from one stage to another, with the evidence status shown separately.

| Link | Input Passed | Evidence Status | Evidence |
|---|---|---|---|
| 1 -> 3 | Price framework file (PFW) rows used to map and select surveys. | Harvested | `tables/pipeline_map.csv:57-58` |
| 1 -> 4 | CPI, PPP, PFW domain settings, and population for weights only. | Harvested | `tables/pipeline_map.csv:59-60` |
| 2 -> 3 | Downloaded modules marked available become validation candidates. | Harvested | `tables/pipeline_map.csv:65` |
| 3 -> 4 | Cleaned welfare passed into deflation. | Harvested | `tables/pipeline_map.csv:67` |
| 4 -> 5 | Welfare in PPP used for estimates for each PPP year. | Decided | `tables/pipeline_map.csv:69-70` |
| 1 -> 8 | Auxiliary files included in the release folder. | Decided | `tables/pipeline_map.csv:74-75` |
| 5 -> 8 | Precomputed estimates included in the release folder. | Decided | `tables/pipeline_map.csv:76-77` |
| 6 -> 8 | Country and lineup-year distributions included in the release folder. | Decided | `tables/pipeline_map.csv:78-79` |
| 8 -> 10 | Release files prepared for the API and read during lookup creation. | Decided producer; harvested consumer | `tables/pipeline_map.csv:80-81` |

The harvested stage 3 inventory retains both valid and invalid rows, which conflicts with the target validation rule. `tables/pipeline_map.csv:18`
The harvested stage 4 columns use `welfare_ppp_{year}_{release}_{adaptation}`, not the target `welfare_YYYY` names. `tables/pipeline_map.csv:22-23`

## What Changes Rerun

`stamp` tracks artifacts, their parents, and their versions, and decides what reruns. `SYSTEM_DESIGN.md:186`
Dependencies are tracked per estimation rather than per survey, so a population change need not rerun an estimate that depends only on CPI. `SYSTEM_DESIGN.md:188`
In incremental mode, changed inputs or rules make artifacts eligible to rerun, while successful unchanged work is skipped. `SYSTEM_DESIGN.md:190`
One accepted exception is that adding or revising a PPP year changes the shared survey file and reruns every estimate for every PPP year of that survey. `SYSTEM_DESIGN.md:201`

## Gaps

- UNKNOWN: stage 6's exact inputs and methodology remain Open; its survey choices depend on a rule applied to whichever surveys exist, not a fixed survey list. `SYSTEM_DESIGN.md:172`
- UNKNOWN: stage 7's inputs remain Open; cross-country dependencies are described as likely, not established. `SYSTEM_DESIGN.md:176`
- UNKNOWN: the stage supplying survey distributions to stage 8 is not established in the map. `tables/pipeline_map.csv:46`
- UNKNOWN: the stage handing the ALL module to stage 9 is not stated, so the map draws no incoming stage link. `tables/pipeline_map.csv:51`
- UNKNOWN: the mechanism for detecting changed PFW or auxiliary rows without rebuilding every survey remains Open. `SYSTEM_DESIGN.md:194-199`
