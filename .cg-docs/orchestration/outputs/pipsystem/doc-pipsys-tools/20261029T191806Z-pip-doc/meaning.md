| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | pipsys produces fixed-format reports from repository facts, Plans and handoffs; Git calls disable optional locks and filesystem monitoring. | same | BEFORE:3 and AFTER:3 retain both facts and the identical citation. |
| 2 | Run Kilo slash commands or the equivalent wrapper using the shell tool from the current pipsystem checkout root. | same | BEFORE:7 and AFTER:7 retain the same instructions and four citations. |
| 3 | `/pip-status pipdata` maps to `.\tools\pipsys\pipsys.cmd status pipdata`. | same | BEFORE:11 and AFTER:11 are identical. |
| 4 | `/pip-overview` maps to `.\tools\pipsys\pipsys.cmd overview`. | same | BEFORE:12 and AFTER:12 are identical. |
| 5 | `/pip-handoffs` and `/pip-handoffs pipdata` map to the respective wrapper commands. | same | BEFORE:13 and AFTER:13 are identical. |
| 6 | `/pip-site` maps to `.\tools\pipsys\pipsys.cmd site`. | same | BEFORE:14 and AFTER:14 are identical. |
| 7 | The table lists no slash command for `.\tools\pipsys\pipsys.cmd check-map`. | same | BEFORE:15 and AFTER:15 are identical; "listed here" remains qualified. |
| 8 | Command mappings follow the command definitions and R dispatcher. | same | BEFORE:17 and AFTER:17 retain identical text and citations. |
| 9 | The wrapper requires `Rscript` on PATH, uses `--no-init-file` and keeps temporary files under `.tmp/pipsys` on E:. | same | BEFORE:19 and AFTER:19 are identical, including the citation. |
| 10 | R dependencies are `data.table`, `yaml`, `jsonlite` and `rlang`; repository queries invoke `git`. | same | BEFORE:21 and AFTER:21 retain all dependencies, Git usage and the identical citation. |
| 11 | Set `PIPSYS_QUARTO` when Quarto is not at the configured default path; `/pip-site` specifies a 600000 ms shell timeout. | same | BEFORE:23 and AFTER:23 retain the condition, timeout and both citations. |
| 12 | `status <package>` reports repository metadata, owned stages, Plan counts and open Plans, latest package handoffs, and Gaps. | same | BEFORE:27 and AFTER:27 retain every listed field and the identical citation. |
| 13 | `overview` reports one row per configured package, repository facts, open-Plan count and latest handoff status/time, followed by milestone statuses and counts of `done` roadmap features. | same | BEFORE:28 and AFTER:28 retain all fields, ordering and the identical citation. |
| 14 | `handoffs [project]` reports the latest run per project and task, optionally filtered by project, with run ID, status, update time and next action. | same | BEFORE:29 and AFTER:29 retain filtering, grouping, fields and the identical citation. |
| 15 | `site` regenerates the listed pages and every Plan copy, then renders a local Quarto website and prints exit code, log path and site path. | same | BEFORE:30 and AFTER:30 retain all outputs, sequence, locality and the identical citation. |
| 16 | `check-map` checks the listed map properties and citations, prints counts and problems using data-row numbers with header row 0, and exits with status 1 on problems. | same | BEFORE:31 and AFTER:31 retain all checks, numbering, exit condition and the identical citation. |
| 17 | Package paths come from `tools/pipsys/packages.csv`; `pipsystem` resolves to the running checkout, including a worktree. | same | BEFORE:35 and AFTER:35 retain the source, "always" qualification and identical citation. |
| 18 | Plans come from repository Plan frontmatter; handoffs come only from this checkout's specified output path; roadmap data come from `roadmap.json`. | same | BEFORE:37 and AFTER:37 retain all paths, the "only" restriction and identical citation. |
| 19 | Stage ownership and outputs, the site diagram and `check-map` use `tables/pipeline_map.csv`, with separate claim statuses and evidence locations. | same | BEFORE:39 and AFTER:39 are identical, including both citations. |
| 20 | Reports print to standard output; the wrapper can create `.tmp/pipsys` even for reporting commands. | same | BEFORE:41 and AFTER:41 retain both facts, the "can" qualification and identical citations. |
| 21 | `site` recreates `site/gen`, renders under `site/_site`, stores its log and redirected Quarto state under `.tmp/pipsys`, and identifies `site/.quarto` as a write location. | same | BEFORE:43 and AFTER:43 retain all write locations, operations and identical citations. |
| 22 | Edit source files rather than generated pages; the site is local and not published. | same | BEFORE:45 and AFTER:45 retain the instruction, publication limitation and identical citation. |
| 23 | Statuses are recorded claims, not verified completion; open Plans exclude `completed`, `complete`, `done` and `superseded`. | same | BEFORE:49 and AFTER:49 retain the verification limitation, exact statuses and identical citation. |
| 24 | Latest handoff uses newest parsed `updated` time, then run ID, with unknown times last; it does not mean the most successful run. | same | BEFORE:50 and AFTER:50 retain ordering, unknown-time handling, limitation and identical citation. |
| 25 | `check-map` checks citation existence and line ranges, not support for claims; the map is evidence, not a contract. | same | BEFORE:51 and AFTER:51 retain both limitations and the identical citation. |
| 26 | Configured local paths for `pipfaker` and `metapip` are UNKNOWN. | same | BEFORE:52 and AFTER:52 are identical, including UNKNOWN and the citation. |
| 27 | Unrecognized handoff formats show UNKNOWN status; lenient v2 parsing leaves multiline fields UNKNOWN. | same | BEFORE:53 and AFTER:53 are identical, including both UNKNOWN qualifications and the citation. |

summary: same 27, added 0, removed 0, changed 0
