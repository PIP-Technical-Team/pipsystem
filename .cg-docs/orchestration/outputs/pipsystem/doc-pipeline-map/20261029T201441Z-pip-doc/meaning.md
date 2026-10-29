| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | The map describes the target pipeline. | same | BEFORE/AFTER line 3; citation unchanged: `SYSTEM_DESIGN.md:7`. |
| 2 | The map does not claim every stage is implemented today. | same | BEFORE/AFTER line 3; negation preserved; `SYSTEM_DESIGN.md:7`. |
| 3 | The dependency table distinguishes decided, harvested, and open or unknown information. | same | BEFORE/AFTER line 4; categories and citation `tables/pipeline_map.csv:22-23,35-36,45` unchanged. |
| 4 | Stage 1 cleans auxiliary data and is assigned to `pipaux`. | same | BEFORE/AFTER line 10; `SYSTEM_DESIGN.md:147`. |
| 5 | Stage 1 produces auxiliary files. | same | BEFORE/AFTER line 10; `SYSTEM_DESIGN.md:147`. |
| 6 | Stage 2 downloads microdata and is assigned to `pipdata` with `dlw`. | same | BEFORE/AFTER line 11; `SYSTEM_DESIGN.md:148`. |
| 7 | Stage 2 downloads survey modules to the Y drive. | same | BEFORE/AFTER line 11; `SYSTEM_DESIGN.md:148`. |
| 8 | Stage 3 formats and validates data and is assigned to `pipdata`. | same | BEFORE/AFTER line 12; `SYSTEM_DESIGN.md:149`. |
| 9 | Stage 3 produces clean survey data. | same | BEFORE/AFTER line 12; `SYSTEM_DESIGN.md:149`. |
| 10 | Stage 4 performs deflation and is assigned to `pipdata`. | same | BEFORE/AFTER line 13; `SYSTEM_DESIGN.md:150,162`. |
| 11 | Stage 4 produces welfare in purchasing power parity (PPP). | same | BEFORE/AFTER line 13; `SYSTEM_DESIGN.md:150,162`. |
| 12 | Stage 4 produces one column per PPP year. | same | BEFORE/AFTER line 13; `SYSTEM_DESIGN.md:150,162`. |
| 13 | Stage 5 produces estimates that do not depend on the poverty line and is assigned to `pipster`. | same | BEFORE/AFTER line 14; `SYSTEM_DESIGN.md:151`. |
| 14 | Stage 5 computes mean, median, deciles, Gini, and other estimates. | same | BEFORE/AFTER line 14; the complete list and `SYSTEM_DESIGN.md:151` are unchanged. |
| 15 | Stage 6 performs lineups and is assigned to `pipster`. | same | BEFORE/AFTER line 15; `SYSTEM_DESIGN.md:152`. |
| 16 | Stage 6 produces distributions per country and lineup year. | same | BEFORE/AFTER line 15; `SYSTEM_DESIGN.md:152`. |
| 17 | Stage 7 addresses countries with missing data and is assigned to `pipster`. | same | BEFORE/AFTER line 16; `SYSTEM_DESIGN.md:153`. |
| 18 | Stage 7 produces estimated distributions. | same | BEFORE/AFTER line 16; `SYSTEM_DESIGN.md:153`. |
| 19 | Stage 8 writes the release folder and is assigned to `pipdata`. | same | BEFORE/AFTER line 17; `SYSTEM_DESIGN.md:154`. |
| 20 | Stage 8 writes files ready for the API. | same | BEFORE/AFTER line 17; `SYSTEM_DESIGN.md:154`. |
| 21 | Stage 9 handles the ALL module for Table Maker and is assigned to `pipdata`. | same | BEFORE/AFTER line 18; `SYSTEM_DESIGN.md:155`. |
| 22 | Stage 9 produces a clean ALL module. | same | BEFORE/AFTER line 18; `SYSTEM_DESIGN.md:155`. |
| 23 | Stage 10 performs ingestion and is assigned to `pipapi`. | same | BEFORE/AFTER line 19; `SYSTEM_DESIGN.md:156`. |
| 24 | Stage 10 makes the release available through the live API. | same | BEFORE/AFTER line 19; `SYSTEM_DESIGN.md:156`. |
| 25 | Stage 1 comes first because auxiliary-data errors flow into every survey. | same | BEFORE/AFTER line 21; `SYSTEM_DESIGN.md:158`. |
| 26 | Stage 3 cleaning means formatting rather than fixing errors. | same | BEFORE/AFTER line 23; `SYSTEM_DESIGN.md:160`. |
| 27 | Converting welfare to local currency units per day is an example of formatting. | same | BEFORE/AFTER line 23; `SYSTEM_DESIGN.md:160`. |
| 28 | The target validation rule prevents incorrect downloads from proceeding. | same | BEFORE/AFTER line 24; “prevents” becomes “stops”; target qualification and `SYSTEM_DESIGN.md:213` preserved. |
| 29 | Under the target validation rule, data failing validation after formatting are not saved. | same | BEFORE/AFTER line 24; second clause becomes a separate sentence; `SYSTEM_DESIGN.md:213` unchanged. |
| 30 | Stage 4 converts welfare from local currency to PPP. | same | BEFORE/AFTER line 26; `SYSTEM_DESIGN.md:162`. |
| 31 | Target stage 4 columns are named `welfare_YYYY`. | same | BEFORE/AFTER line 26; identifier and `SYSTEM_DESIGN.md:162` unchanged. |
| 32 | Stage 4 detects available PPP years rather than hardcoding them. | same | BEFORE/AFTER line 26; clause becomes a separate sentence; `SYSTEM_DESIGN.md:162` unchanged. |
| 33 | Stage 5 computes estimates for each PPP year. | same | BEFORE/AFTER line 27; `SYSTEM_DESIGN.md:164`. |
| 34 | A lineup year is a round calendar year for which an estimate is built from surrounding surveys. | same | BEFORE/AFTER line 29; definition and `SYSTEM_DESIGN.md:44` unchanged. |
| 35 | Stage 6 uses additional deflation factors to align surveys to a target year. | same | BEFORE/AFTER line 30; `SYSTEM_DESIGN.md:170`. |
| 36 | Stage 6 interpolates between surveys. | same | BEFORE/AFTER line 30; `SYSTEM_DESIGN.md:170`. |
| 37 | Stage 6 extrapolates after the last survey. | same | BEFORE/AFTER line 30; `SYSTEM_DESIGN.md:170`. |
| 38 | Lineup estimates are national only. | same | BEFORE/AFTER line 31; restriction and `SYSTEM_DESIGN.md:182` unchanged. |
| 39 | Survey-year estimates can use any level supported by the survey. | same | BEFORE/AFTER line 31; qualification and `SYSTEM_DESIGN.md:182` unchanged. |
| 40 | Stage 7’s method is currently standalone code in the existing pipeline’s `targets` project. | same | BEFORE/AFTER line 33; current-code qualification and `SYSTEM_DESIGN.md:174` preserved. |
| 41 | Stage 7’s method is intended to move to `pipster`. | same | BEFORE/AFTER line 33; intention, rather than completed migration, preserved; `SYSTEM_DESIGN.md:174`. |
| 42 | Stage 8 puts lineup distributions in a separate folder for each release. | same | BEFORE/AFTER line 35; `SYSTEM_DESIGN.md:178`. |
| 43 | Stage 8 puts survey distributions in a separate folder for each release. | same | BEFORE/AFTER line 35; `SYSTEM_DESIGN.md:178`. |
| 44 | Stage 8 puts auxiliary files in a separate folder for each release. | same | BEFORE/AFTER line 35; `SYSTEM_DESIGN.md:178`. |
| 45 | Stage 8 puts precomputed estimates in a separate folder for each release. | same | BEFORE/AFTER line 35; `SYSTEM_DESIGN.md:178`. |
| 46 | The ALL module contains every variable in the GMD harmonization methodology. | same | BEFORE/AFTER line 37; `SYSTEM_DESIGN.md:34,60`. |
| 47 | Stage 9 saves the cleaned ALL module separately for Table Maker. | same | BEFORE/AFTER line 38; `SYSTEM_DESIGN.md:180`. |
| 48 | Table Maker’s internals are outside this system. | same | BEFORE/AFTER line 38; separate sentence preserves scope exclusion; `SYSTEM_DESIGN.md:180`. |
| 49 | Each dependency arrow represents an input passed between stages. | same | BEFORE/AFTER line 42; “Read each arrow as” becomes “Each arrow shows”; neither version cites this statement. |
| 50 | Evidence status is shown separately from the dependency arrow. | same | BEFORE/AFTER line 42; neither version cites this statement. |
| 51 | The harvested 1 → 3 dependency passes PFW rows used to map and select surveys. | same | BEFORE/AFTER line 46; link, input, Harvested status, and `tables/pipeline_map.csv:57-58` unchanged. |
| 52 | The harvested 1 → 4 dependency passes CPI, PPP, PFW domain settings, and population for weights only. | same | BEFORE/AFTER line 47; complete input list, population qualification, Harvested status, and `tables/pipeline_map.csv:59-60` unchanged. |
| 53 | The harvested 2 → 3 dependency makes downloaded modules marked available into validation candidates. | same | BEFORE/AFTER line 48; availability qualification, Harvested status, and `tables/pipeline_map.csv:65` unchanged. |
| 54 | The harvested 3 → 4 dependency passes cleaned welfare into deflation. | same | BEFORE/AFTER line 49; Harvested status and `tables/pipeline_map.csv:67` unchanged. |
| 55 | The decided 4 → 5 dependency uses PPP welfare for estimates for each PPP year. | same | BEFORE/AFTER line 50; Decided status and `tables/pipeline_map.csv:69-70` unchanged. |
| 56 | The decided 1 → 8 dependency includes auxiliary files in the release folder. | same | BEFORE/AFTER line 51; Decided status and `tables/pipeline_map.csv:74-75` unchanged. |
| 57 | The decided 5 → 8 dependency includes precomputed estimates in the release folder. | same | BEFORE/AFTER line 52; Decided status and `tables/pipeline_map.csv:76-77` unchanged. |
| 58 | The decided 6 → 8 dependency includes country and lineup-year distributions in the release folder. | same | BEFORE/AFTER line 53; Decided status and `tables/pipeline_map.csv:78-79` unchanged. |
| 59 | The 8 → 10 dependency prepares release files for the API, with decided producer status. | same | BEFORE/AFTER line 54; producer qualification and `tables/pipeline_map.csv:80-81` unchanged. |
| 60 | The 8 → 10 dependency reads release files during lookup creation, with harvested consumer status. | same | BEFORE/AFTER line 54; consumer qualification and `tables/pipeline_map.csv:80-81` unchanged. |
| 61 | The harvested stage 3 inventory retains both valid and invalid rows. | same | BEFORE/AFTER line 56; harvested qualification and `tables/pipeline_map.csv:18` unchanged. |
| 62 | Retaining both valid and invalid rows conflicts with the target validation rule. | same | BEFORE/AFTER line 56; contradiction and `tables/pipeline_map.csv:18` unchanged. |
| 63 | Harvested stage 4 columns use `welfare_ppp_{year}_{release}_{adaptation}`, rather than target `welfare_YYYY` names. | same | BEFORE/AFTER line 57; both identifiers, harvested/target distinction, and `tables/pipeline_map.csv:22-23` unchanged. |
| 64 | `stamp` tracks artifacts. | same | BEFORE/AFTER line 61; `SYSTEM_DESIGN.md:186`. |
| 65 | `stamp` tracks artifact parents. | same | BEFORE/AFTER line 61; `SYSTEM_DESIGN.md:186`. |
| 66 | `stamp` tracks artifact versions. | same | BEFORE/AFTER line 61; `SYSTEM_DESIGN.md:186`. |
| 67 | `stamp` decides what reruns. | same | BEFORE/AFTER line 61; `SYSTEM_DESIGN.md:186`. |
| 68 | Dependencies are tracked per estimation rather than per survey. | same | BEFORE/AFTER line 62; `SYSTEM_DESIGN.md:188`. |
| 69 | Consequently, a population change need not rerun an estimate dependent only on CPI. | same | BEFORE/AFTER line 62; “so” becomes “therefore”; conditional qualification and `SYSTEM_DESIGN.md:188` preserved. |
| 70 | In incremental mode, changed inputs make artifacts eligible to rerun. | same | BEFORE/AFTER line 63; eligibility qualification and `SYSTEM_DESIGN.md:190` preserved. |
| 71 | In incremental mode, changed rules make artifacts eligible to rerun. | same | BEFORE/AFTER line 63; eligibility qualification and `SYSTEM_DESIGN.md:190` preserved. |
| 72 | In incremental mode, successful unchanged work is skipped. | same | BEFORE/AFTER line 63; clause becomes a separate sentence; `SYSTEM_DESIGN.md:190` unchanged. |
| 73 | An accepted exception is that adding or revising a PPP year changes the shared survey file. | same | BEFORE/AFTER line 64; exception remains accepted; `SYSTEM_DESIGN.md:201` unchanged. |
| 74 | That PPP-year change reruns every estimate for every PPP year of the survey. | same | BEFORE/AFTER line 64; both “every” qualifications and `SYSTEM_DESIGN.md:201` preserved. |
| 75 | Stage 6’s exact inputs and methodology remain UNKNOWN/Open. | same | BEFORE/AFTER line 68; UNKNOWN and Open qualifications and `SYSTEM_DESIGN.md:172` preserved. |
| 76 | Stage 6’s survey choices depend on a rule applied to whichever surveys exist, not a fixed survey list. | same | BEFORE/AFTER line 68; rule and exclusion preserved; `SYSTEM_DESIGN.md:172`. |
| 77 | Stage 7’s inputs remain UNKNOWN/Open. | same | BEFORE/AFTER line 69; UNKNOWN and Open qualifications and `SYSTEM_DESIGN.md:176` preserved. |
| 78 | Stage 7’s cross-country dependencies are described as likely, not established. | same | BEFORE/AFTER line 69; uncertainty preserved; `SYSTEM_DESIGN.md:176`. |
| 79 | The stage supplying survey distributions to stage 8 is UNKNOWN/not established in the map. | same | BEFORE/AFTER line 70; qualification and `tables/pipeline_map.csv:46` unchanged. |
| 80 | The stage handing the ALL module to stage 9 is UNKNOWN/not stated. | same | BEFORE/AFTER line 71; qualification and `tables/pipeline_map.csv:51` preserved. |
| 81 | Because that supplying stage is not stated, the map draws no incoming stage link to stage 9. | same | BEFORE/AFTER line 71; “so” becomes “therefore”; causal relationship and `tables/pipeline_map.csv:51` preserved. |
| 82 | The mechanism for detecting changed PFW or auxiliary rows without rebuilding every survey remains UNKNOWN/Open. | same | BEFORE/AFTER line 72; UNKNOWN/Open qualifications, rebuilding constraint, and `SYSTEM_DESIGN.md:194-199` unchanged. |

summary: same 82, added 0, removed 0, changed 0
