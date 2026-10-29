| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | The map describes the target pipeline, not necessarily current implementation. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:7`: “It describes the target system, not the current one.” |
| 2 | The dependency table distinguishes target decisions from harvested behavior. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:22-23`: matching output rows have statuses `decided` and `harvested`. |
| 3 | The dependency table identifies unresolved information as Open or UNKNOWN. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:36,45`: “exact inputs Open”; entry point `UNKNOWN`, status `unknown`. |
| 4 | Stage 1 cleans auxiliary data. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:147`: “Clean auxiliary data”. |
| 5 | `pipaux` owns stage 1. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:147`: “Clean auxiliary data \| `pipaux`”. |
| 6 | Stage 1 produces auxiliary files. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:147`: “Auxiliary files”. |
| 7 | Stage 2 downloads microdata. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:148`: “Download microdata”. |
| 8 | Stage 2 uses `pipdata` with `dlw`. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:148`: “`pipdata` with `dlw`”. |
| 9 | Stage 2 places survey modules on the Y drive. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:148`: “Modules on the Y drive”. |
| 10 | Stage 3 formats and validates data. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:149`: “Format and validate”. |
| 11 | `pipdata` owns stage 3. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:149`: “Format and validate \| `pipdata`”. |
| 12 | Stage 3 produces clean survey data. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:149`: “Clean survey data”. |
| 13 | Stage 4 performs deflation. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:150`: “Deflate”. |
| 14 | `pipdata` owns stage 4. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:150`: “Deflate \| `pipdata`”. |
| 15 | Stage 4 produces welfare in PPP. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:150`: “Welfare in PPP”. |
| 16 | Stage 4 produces one welfare column per PPP year. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:150`: “one column per PPP year”. |
| 17 | Stage 5 computes estimates that do not depend on the poverty line. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: “Estimates that do not depend on the poverty line”. |
| 18 | `pipster` owns stage 5. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: stage 5 package is `pipster`. |
| 19 | Stage 5 computes means. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: “Mean”. |
| 20 | Stage 5 computes medians. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: “median”. |
| 21 | Stage 5 computes deciles. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: “deciles”. |
| 22 | Stage 5 computes Gini estimates. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: “Gini”. |
| 23 | Stage 5 includes other estimates. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:151`: “and others”. |
| 24 | Stage 6 produces lineups. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:152`: “Lineups”. |
| 25 | `pipster` owns stage 6. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:152`: “Lineups \| `pipster`”. |
| 26 | Stage 6 produces distributions per country and lineup year. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:152`: “Distributions per country and lineup year”. |
| 27 | Stage 7 handles countries with missing data. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:153`: “Countries with missing data”. |
| 28 | `pipster` owns stage 7. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:153`: “Countries with missing data \| `pipster`”. |
| 29 | Stage 7 produces estimated distributions. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:153`: “Estimated distributions”. |
| 30 | Stage 8 writes the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:154`: “Write release folder”. |
| 31 | `pipdata` owns stage 8. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:154`: “Write release folder \| `pipdata`”. |
| 32 | Stage 8 writes files ready for the API. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:154`: “Files ready for the API”. |
| 33 | Stage 9 handles the ALL module for Table Maker. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:155`: “ALL module for Table Maker”. |
| 34 | `pipdata` owns stage 9. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:155`: stage 9 package is `pipdata`. |
| 35 | Stage 9 produces a clean ALL module. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:155`: “Clean ALL module”. |
| 36 | Stage 10 is ingestion. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:156`: “Ingest”. |
| 37 | `pipapi` owns stage 10. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:156`: “Ingest \| `pipapi`”. |
| 38 | Stage 10 makes the release available through the live API. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:156`: stage 10 output is “Live API”. |
| 39 | Stage 1 comes first. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:158`: “This stage comes first.” |
| 40 | Auxiliary-data errors flow into every survey. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:158`: “Errors here flow into every survey.” |
| 41 | Stage 3 cleaning means formatting, not fixing errors. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:160`: “Cleaning means formatting, not fixing errors.” |
| 42 | Formatting includes converting welfare to local currency units per day. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:160`: “welfare converted to local currency units per day”. |
| 43 | The target prevents incorrect downloads from proceeding. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:213`: “If a download from DLW is not correct ... does not proceed.” |
| 44 | The target prevents saving data that fail validation after formatting. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:213`: “After formatting, data that fail validation are not saved.” |
| 45 | Stage 4 converts welfare from local currency to PPP. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:162`: “Welfare is converted from local currency to PPP”. |
| 46 | Target welfare columns are named `welfare_YYYY`. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:162`: “Columns are named `welfare_YYYY`.” |
| 47 | Stage 4 detects available PPP-year columns rather than hardcoding years. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:162`: “Code detects all columns matching `welfare_[0-9]{4}` and never hardcodes PPP years.” |
| 48 | Stage 5 computes estimates for each PPP year. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:164`: “Estimates are computed for each PPP year.” |
| 49 | A lineup year is a round calendar year. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:44`: “A round calendar year”. |
| 50 | A lineup-year estimate is built from surrounding surveys. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:44`: “an estimate is built from the surveys around it”. |
| 51 | Stage 6 uses additional deflation factors to align surveys to a target year. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:170`: “Lineups use additional deflation factors to align surveys to a target year.” |
| 52 | Alignment between surveys uses interpolation. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:170`: “Between surveys this is interpolation.” |
| 53 | Alignment after the last survey uses extrapolation. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:170`: “After the last survey it is extrapolation.” |
| 54 | Lineup estimates are national only. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:182`: “Lineup year estimates are national only.” |
| 55 | Survey-year estimates can use any level supported by the survey. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:182`: “Survey year estimates can go down to any level the survey supports.” |
| 56 | Stage 7's method is currently standalone code in the current pipeline's `targets` project. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:174`: “It is currently standalone code in the `targets` project of the current pipeline”. |
| 57 | Stage 7's method is intended to move to `pipster`. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:174`: “will move to `pipster`”. |
| 58 | Each release has its own folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:178`: “Each release has its own folder.” |
| 59 | Stage 8 includes lineup distributions in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:178`: “It contains lineup distributions”. |
| 60 | Stage 8 includes survey distributions in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:178`: “survey distributions”. |
| 61 | Stage 8 includes auxiliary files in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:178`: “auxiliary files”. |
| 62 | Stage 8 includes precomputed estimates in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:178`: “precomputed estimates”. |
| 63 | GMD means Global Monitoring Database harmonization methodology. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:34`: “Global Monitoring Database harmonization methodology.” |
| 64 | ALL contains every variable in the GMD harmonization. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:60`: “Every variable in the GMD harmonization.” |
| 65 | Stage 9 saves the cleaned ALL module separately for Table Maker. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:180`: “The ALL module is cleaned and saved separately for Table Maker”. |
| 66 | Table Maker internals are outside this system. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:180`: “Table Maker itself (`piptm`) is outside this system.” |
| 67 | The harvested 1 → 3 link carries PFW rows used to map surveys. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:57`: “PFW rows, consumed when stage 3 maps and selects surveys”, status `harvested`. |
| 68 | The harvested 1 → 3 link carries PFW rows used to select surveys. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:57`: “PFW rows, consumed when stage 3 maps and selects surveys”, status `harvested`. |
| 69 | PFW is cleaned in stage 1, establishing the producer side of 1 → 3. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:58`: “PFW is cleaned by pipaux in stage 1”. |
| 70 | The harvested 1 → 4 link supplies CPI for deflation. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:59-60`: “CPI ... consumed by deflation”; “CPI ... cleaned by pipaux in stage 1”. |
| 71 | The harvested 1 → 4 link supplies PPP for deflation. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:59-60`: “PPP ... consumed by deflation”; “PPP ... cleaned by pipaux in stage 1”. |
| 72 | The harvested 1 → 4 link supplies PFW domain settings. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:59`: “PFW domain settings, consumed by deflation”, status `harvested`. |
| 73 | Population in the harvested 1 → 4 link is used for weights only. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:59-60`: “population (weights only)”; “population ... cleaned by pipaux in stage 1”. |
| 74 | Downloaded modules marked available become validation candidates in the harvested 2 → 3 link. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:65`: “Downloaded modules marked data_available Yes, which become validation candidates”, status `harvested`. |
| 75 | Cleaned welfare passes into deflation in the harvested 3 → 4 link. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:67`: “Cleaned welfare: formatting divides by 365, deflation copies it to welfare_lcu”, status `harvested`. |
| 76 | The decided 4 → 5 link supplies welfare in PPP. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:69`: “Welfare in PPP, one column per PPP year”, status `decided`. |
| 77 | The decided 4 → 5 link supports estimates for each PPP year. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:70`: “Estimates are computed for each PPP year”, status `decided`. |
| 78 | The decided 1 → 8 link includes auxiliary files in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:74-75`: “Auxiliary files”; “The release folder contains auxiliary files”, both `decided`. |
| 79 | The decided 5 → 8 link includes precomputed estimates in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:76-77`: “Estimates: mean, median, deciles, Gini, and others”; “release folder contains precomputed estimates”. |
| 80 | The decided 6 → 8 link includes country and lineup-year distributions in the release folder. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:78-79`: “Distributions per country and lineup year”; “The release folder contains lineup distributions”. |
| 81 | The producer side of 8 → 10 prepares API-ready files and is Decided. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:80`: “Files ready for the API”, status `decided`, “Producer side.” |
| 82 | The consumer side of 8 → 10 reads release files during lookup creation and is harvested. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:81`: “Release folder files read at lookup creation”, status `harvested`, “Consumer side.” |
| 83 | The harvested stage 3 inventory retains valid rows. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:18`: “Completed validation inventory gmd_valid_inv (valid and invalid rows)”. |
| 84 | The harvested stage 3 inventory retains invalid rows. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:18`: “Current code keeps invalid rows”. |
| 85 | Retaining invalid rows conflicts with the target validation rule. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:18`: “conflicts with SYSTEM_DESIGN.md:213”. |
| 86 | Harvested stage 4 columns use `welfare_ppp_{year}_{release}_{adaptation}`. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:23`: “welfare_ppp_{year}_{release}_{adaptation} columns”, status `harvested`. |
| 87 | Harvested stage 4 names differ from the target `welfare_YYYY` names. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:22-23`: target “named welfare_YYYY”; harvested “differs from the target names”. |
| 88 | `stamp` tracks artifacts. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:186`: “`stamp` tracks every artifact”. |
| 89 | `stamp` tracks artifact parents. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:186`: “its parents”. |
| 90 | `stamp` tracks artifact versions. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:186`: “its versions”. |
| 91 | `stamp` decides what reruns. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:186`: “decides what reruns”. |
| 92 | Dependencies are tracked per estimation rather than per survey. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:188`: “Dependencies are tracked per estimation, not per survey.” |
| 93 | A population change need not rerun an estimate depending only on CPI. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:188`: “a population change reruns only the second”. |
| 94 | An input change makes an artifact eligible to rerun. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:190`: “Artifacts are eligible to rerun when an input or rule changes.” |
| 95 | A rule change makes an artifact eligible to rerun. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:190`: “Artifacts are eligible to rerun when an input or rule changes.” |
| 96 | Incremental mode skips successful unchanged work. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:190`: “In incremental mode, successful unchanged work is skipped.” |
| 97 | Adding a PPP year changes the shared survey file. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:201`: “adding or revising one PPP year changes the file”. |
| 98 | Revising a PPP year changes the shared survey file. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:201`: “adding or revising one PPP year changes the file”. |
| 99 | Such a PPP change reruns every estimate for every PPP year of that survey. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:201`: “every estimate for every PPP year of that survey reruns”. |
| 100 | This PPP-wide rerun behavior is an accepted trade-off. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:201`: “Decided. Trade off on PPP columns”; “Accepted”. |
| 101 | Stage 6's survey choices depend on a rule applied to whichever surveys exist. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:172`: “It depends on a rule applied to whichever surveys exist.” |
| 102 | A lineup does not depend on a fixed survey list. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:172`: “A lineup does not depend on a fixed list of surveys.” |
| 103 | Stage 7's cross-country dependence is described as likely, not established. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/SYSTEM_DESIGN.md:176`: “It likely combines information across countries”. |
| 104 | The map draws no incoming stage link to stage 9 because its supplying stage is not stated. | supported | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/tables/pipeline_map.csv:51`: “Which stage hands it over is not stated, so no edge is drawn.” |

summary: supported 104, broad 0, unsupported 0, wrong 0, uncited 0
