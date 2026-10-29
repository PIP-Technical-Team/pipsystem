# pipsys tools

pipsys reads repository facts, Plans and handoffs to produce fixed-format reports; its Git calls disable optional locks and filesystem monitoring. `tools/pipsys/pipsys.R:147-165,804-871`

## Run a command

Use the slash commands in Kilo, or run the equivalent wrapper with the shell tool from the current pipsystem checkout root. `.kilo/commands/pip-status.md:5-9` `.kilo/commands/pip-overview.md:5-9` `.kilo/commands/pip-handoffs.md:5-9` `.kilo/commands/pip-site.md:5-9`

| Kilo command | Wrapper equivalent |
|---|---|
| `/pip-status pipdata` | `.\tools\pipsys\pipsys.cmd status pipdata` |
| `/pip-overview` | `.\tools\pipsys\pipsys.cmd overview` |
| `/pip-handoffs` or `/pip-handoffs pipdata` | `.\tools\pipsys\pipsys.cmd handoffs` or `.\tools\pipsys\pipsys.cmd handoffs pipdata` |
| `/pip-site` | `.\tools\pipsys\pipsys.cmd site` |
| No slash command listed here | `.\tools\pipsys\pipsys.cmd check-map` |

These mappings follow the command definitions and R dispatcher. `.kilo/commands/pip-status.md:9` `.kilo/commands/pip-overview.md:9` `.kilo/commands/pip-handoffs.md:9` `.kilo/commands/pip-site.md:9` `tools/pipsys/pipsys.R:1224-1237`

The wrapper requires `Rscript` on PATH, uses `--no-init-file` and keeps temporary files under `.tmp/pipsys` on E:. `tools/pipsys/pipsys.cmd:5-18`

The R code uses `data.table`, `yaml`, `jsonlite` and `rlang`; repository queries invoke `git`. `tools/pipsys/pipsys.R:21-23,123,149-155,348-350,808`

For site rendering, set `PIPSYS_QUARTO` if Quarto is not at the configured default path; `/pip-site` specifies a 600000 ms shell timeout. `tools/pipsys/pipsys.R:27-29,1101-1105` `.kilo/commands/pip-site.md:5-7`

## What each command shows

- **`status <package>`:** repository path, branch, short HEAD, commit date, uncommitted-entry count and DESCRIPTION version; owned pipeline stages; Plan counts and open Plans; latest handoffs for that package; and Gaps. `tools/pipsys/pipsys.R:182-217,804-871`
- **`overview`:** one row per configured package with repository facts, open-Plan count and latest handoff status/time, followed by milestone statuses and counts of roadmap features marked `done`. `tools/pipsys/pipsys.R:407-422,898-958`
- **`handoffs [project]`:** latest run per project and task, optionally filtered to one project, showing run ID, status, update time and next action. `tools/pipsys/pipsys.R:365-404,961-985`
- **`site`:** regenerates overview, handoffs, roadmap, pipeline map, design, package status pages and copies of every Plan, then renders a local Quarto website and prints the render exit code, log path and site path. `tools/pipsys/pipsys.R:1107-1154,1185-1206`
- **`check-map`:** checks the map's columns, allowed fields and statuses, stage and edge IDs, required rows and citation locations; prints counts and problems, using data-row numbers with header row 0; exits with status 1 when problems are found. `tools/pipsys/pipsys.R:524-624,1230-1235`

## Inputs and writes

Package paths come from `tools/pipsys/packages.csv`; the `pipsystem` row always resolves to the checkout running the script, including a worktree. `tools/pipsys/pipsys.R:131-138`

Plans come from each repository's `.cg-docs/plans/*.md` frontmatter; handoffs come only from this checkout's `.cg-docs/orchestration/outputs/<project>/<task>/<run>/handoff.md`; roadmap data come from `roadmap.json`. `tools/pipsys/pipsys.R:35-48,141-143,227-257,365-390,407-420,898-899,961-962`

Stage ownership and outputs, the site diagram and `check-map` use `tables/pipeline_map.csv`, whose rows carry separate claim statuses and evidence locations. `tools/pipsys/pipsys.R:446-465,524-531,641-672,676-696` `tables/pipeline_map.csv:1-7`

Reports print to standard output; the wrapper can create `.tmp/pipsys` even for reporting commands. `tools/pipsys/pipsys.R:1262-1265` `tools/pipsys/pipsys.cmd:9-18`

`site` deletes and recreates `site/gen`, renders HTML under `site/_site`, and stores the render log and redirected Quarto state under `.tmp/pipsys`; the script also identifies `site/.quarto` as a write location. `tools/pipsys/pipsys.R:16-18,1067-1084,1167-1196` `site/_quarto.yml:1-3`

Edit source files, not generated pages; the site is local and not published. `site/index.md:5-8`

## Gaps

- Statuses are recorded claims, not verified completion; an open Plan is any status other than `completed`, `complete`, `done` or `superseded`. `tools/pipsys/pipsys.R:30-31,833-841`
- Latest handoff means newest parsed `updated` time, then run ID, with unknown times last; it does not mean the most successful run. `tools/pipsys/pipsys.R:365-390`
- `check-map` checks citation existence and line ranges, not whether the cited text supports the claim; the map is evidence, not a contract. `tools/pipsys/pipsys.R:620-622`
- Local paths for `pipfaker` and `metapip` are UNKNOWN in the configuration. `tools/pipsys/packages.csv:11-12`
- Unrecognized handoff formats show UNKNOWN status, and lenient v2 parsing leaves multiline fields UNKNOWN. `tools/pipsys/pipsys.R:875-891`
