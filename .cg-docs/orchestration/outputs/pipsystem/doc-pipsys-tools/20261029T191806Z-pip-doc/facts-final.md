| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | pipsys produces fixed-format reports from repository facts, Plans and handoffs. | supported | `tools/pipsys/pipsys.R:861-871`: "Repository", "Plans", "Handoffs", "Gaps"; fixed report assembly. |
| 2 | Its Git calls disable optional locks and filesystem monitoring. | supported | `tools/pipsys/pipsys.R:154-155`: "core.fsmonitor=false", "--no-optional-locks". |
| 3 | Use Kilo slash commands or equivalent wrappers from the current checkout root. | supported | Command definitions, lines 5-9: "from the root of the current pipsystem checkout". |
| 4 | `/pip-status pipdata` maps to `.\tools\pipsys\pipsys.cmd status pipdata`. | supported | `.kilo/commands/pip-status.md:9`: "tools\pipsys\pipsys.cmd status $ARGUMENTS". |
| 5 | `/pip-overview` maps to `.\tools\pipsys\pipsys.cmd overview`. | supported | `.kilo/commands/pip-overview.md:9`: "tools\pipsys\pipsys.cmd overview". |
| 6 | `/pip-handoffs [pipdata]` maps to the wrapper's `handoffs [pipdata]`. | supported | `.kilo/commands/pip-handoffs.md:9`: "tools\pipsys\pipsys.cmd handoffs $ARGUMENTS". |
| 7 | `/pip-site` maps to `.\tools\pipsys\pipsys.cmd site`. | supported | `.kilo/commands/pip-site.md:9`: "tools\pipsys\pipsys.cmd site". |
| 8 | `check-map` has a wrapper invocation, with no slash command listed in this table. | supported | `tools/pipsys/pipsys.R:1230-1231`: "`check-map` = {", "res <- check_map()". |
| 9 | These mappings follow the command definitions and R dispatcher. | supported | `tools/pipsys/pipsys.R:1226-1230`: "status", "overview", "handoffs", "site", "`check-map`". |
| 10 | The wrapper requires `Rscript` on PATH, uses `--no-init-file`, and keeps temporary files under `.tmp/pipsys` on E:. | supported | `tools/pipsys/pipsys.cmd:9,15-18`: ".tmp\pipsys", "TEMP", "TMP", "TMPDIR", "Rscript --no-init-file". |
| 11 | The R code uses `data.table`, `yaml`, `jsonlite` and `rlang`. | supported | `tools/pipsys/pipsys.R:22,123,348,808`: "library(data.table)", "yaml::yaml.load", "jsonlite::fromJSON", "rlang::abort". |
| 12 | Repository queries call `git`. | supported | `tools/pipsys/pipsys.R:150-151`: "system2(", "git". |
| 13 | Set `PIPSYS_QUARTO` when Quarto is not at the configured default path. | supported | `tools/pipsys/pipsys.R:1102,1105`: "Sys.getenv("PIPSYS_QUARTO", DEFAULT_QUARTO)"; "Set PIPSYS_QUARTO." |
| 14 | `/pip-site` specifies a 600000 ms shell timeout. | supported | `.kilo/commands/pip-site.md:5`: "with a shell timeout of 600000 ms". |
| 15 | `status <package>` shows repository facts, owned stages, Plan counts and open Plans, latest package handoffs, and Gaps. | supported | `tools/pipsys/pipsys.R:815-821,861-871`: repository fields and "Pipeline stages", "Plans", "Handoffs", "Gaps". |
| 16 | `overview` shows one row per configured package, repository facts, open-Plan count, latest handoff status/time, and milestone completion counts. | supported | `tools/pipsys/pipsys.R:919-930,955-956`: "package", "open_plans", "last_handoff", "Roadmap"; line 419 counts "done". |
| 17 | `handoffs [project]` shows the latest run per project/task, optionally filtered, with run ID, status, update time and next action. | supported | `tools/pipsys/pipsys.R:365-366,401-403,973`: "latest run per project and task"; "run, status", "updated", "next". |
| 18 | `site` regenerates the listed pages and Plan copies, renders a local Quarto website, and prints exit code, log and site paths. | supported | `tools/pipsys/pipsys.R:1112-1151,1187,1203-1206`: generated pages; "render"; "Quarto render exit code"; "Site". |
| 19 | `check-map` validates columns, fields, statuses, IDs, required rows and citations; reports counts/data-row problems; exits 1 on problems. | supported | `tools/pipsys/pipsys.R:618,1233-1234`: "header is row 0"; "attr(out, "status") <- 1L". |
| 20 | Package paths come from `tools/pipsys/packages.csv`. | supported | `tools/pipsys/pipsys.R:132-133`: "file.path(root, "tools", "pipsys", "packages.csv")", "fread(file". |
| 21 | The `pipsystem` row resolves to the running checkout, including a worktree. | supported | `tools/pipsys/pipsys.R:135-137`: "main checkout or an Agent Manager worktree"; "path := root". |
| 22 | Plans come from frontmatter in each repository's `.cg-docs/plans/*.md` files. | supported | `tools/pipsys/pipsys.R:232,236,241`: ".cg-docs", "plans"; "pattern = "\\.md$""; "read_frontmatter(f)". |
| 23 | Handoffs come only from this checkout's `.cg-docs/orchestration/outputs/<project>/<task>/<run>/handoff.md`. | supported | `tools/pipsys/pipsys.R:141-142,365`: "file.path(root, ".cg-docs", "orchestration", "outputs")"; "<outputs>/<project>/<task>/<run>/handoff.md". |
| 24 | Roadmap data come from `roadmap.json`. | supported | `tools/pipsys/pipsys.R:408,413`: "file.path(root, "roadmap.json")", "jsonlite::fromJSON(file". |
| 25 | Stage ownership/outputs, the site diagram and `check-map` use `tables/pipeline_map.csv`, with separate claim statuses and evidence locations. | supported | `tools/pipsys/pipsys.R:446,448-449`: "pipeline_map.csv"; "status", "evidence_file", "evidence_line"; cited consumers call `read_map`. |
| 26 | Reports print to standard output. | supported | `tools/pipsys/pipsys.R:1262`: "writeLines(out)". |
| 27 | The wrapper can create `.tmp/pipsys` even for reporting commands. | supported | `tools/pipsys/pipsys.cmd:10`: "if not exist "%PIPSYS_TMP%\" mkdir "%PIPSYS_TMP%"". |
| 28 | `site` recreates `site/gen`, renders HTML under `site/_site`, and stores logs and redirected Quarto state under `.tmp/pipsys`. | supported | `tools/pipsys/pipsys.R:1082-1083,1167,1193`: "unlink(gen", "dir.create(gen", "quarto-home", "quarto-render.log"; YAML: "output-dir: _site". |
| 29 | The script identifies `site/.quarto` as a write location. | supported | `tools/pipsys/pipsys.R:18`: "site/gen, site/_site, site/.quarto and .tmp/pipsys". |
| 30 | Edit source files, not generated pages. | supported | `site/index.md:7-8`: "edit the sources, not the pages". |
| 31 | The site is local and not published. | supported | `site/index.md:5,8`: "Local review site"; "The site is not published." |
| 32 | Statuses are recorded claims, not verified completion; any Plan status outside the four listed closed statuses is open. | supported | `tools/pipsys/pipsys.R:837,833`: "Statuses are as recorded in the files, not verified"; "!status %chin% CLOSED_PLAN_STATUSES". |
| 33 | Latest handoff means newest parsed `updated`, then run ID, unknown times last, not most successful run. | supported | `tools/pipsys/pipsys.R:366,386-387`: "newest `updated`, then run ID; unknown times last"; sorting excludes status. |
| 34 | `check-map` checks citation existence/ranges, not support for claims; the map is evidence, not a contract. | supported | `tools/pipsys/pipsys.R:621-622`: "existence and line range only, not for meaning"; "Evidence-only map, not a contract". |
| 35 | Unrecognized handoff formats show UNKNOWN status; lenient v2 parsing leaves multiline fields UNKNOWN. | supported | `tools/pipsys/pipsys.R:881,889-890`: "unknown format; status shows UNKNOWN"; "multi-line fields show UNKNOWN". |

summary: supported 35, unsupported 0, wrong 0, uncited 0
