| # | claim | verdict | evidence |
|---|---|---|---|
| 1 | Run the wrapper from the current checkout root. | supported | `tools/pipsys/kilo/commands/pip-status.md:5-6`: "from the root of the current pipsystem checkout" |
| 2 | The checkout may be an Agent Manager worktree. | supported | `tools/pipsys/kilo/commands/pip-status.md:6-7`: "the main checkout or an Agent Manager worktree" |
| 3 | The wrapper calls `Rscript --no-init-file`. | supported | `tools/pipsys/pipsys.cmd:18`: `Rscript --no-init-file "%~dp0pipsys.R" %*` |
| 4 | Temporary files are redirected to this checkout's `.tmp/pipsys`. | supported | `tools/pipsys/pipsys.cmd:9,15-17`: `set "PIPSYS_TMP=%~dp0..\..\.tmp\pipsys"`; sets `TEMP`, `TMP`, `TMPDIR`. |
| 5 | The wrapper requires the checkout to be on E:. | supported | `tools/pipsys/pipsys.cmd:5-7`: `if /i not "%~d0"=="E:"`; `exit /b 1` |
| 6 | The implementation uses `data.table`. | supported | `tools/pipsys/pipsys.R:24`: `library(data.table)` |
| 7 | The implementation uses `yaml`. | supported | `tools/pipsys/pipsys.R:125`: `yaml::yaml.load(yaml_text)` |
| 8 | The implementation uses `jsonlite`. | supported | `tools/pipsys/pipsys.R:350`: `jsonlite::fromJSON(` |
| 9 | The implementation uses `rlang`. | supported | `tools/pipsys/pipsys.R:743`: `rlang::abort(sprintf("'%s' must be an existing file inside pipsystem.", file))` |
| 10 | The implementation calls Git for repository facts. | supported | `tools/pipsys/pipsys.R:151-153`: `run_git <- function(path, args)`; `system2(`; `"git"` |
| 11 | `/pip-status pipdata` maps to the wrapper's `status pipdata`. | supported | `tools/pipsys/kilo/commands/pip-status.md:9`: `tools\pipsys\pipsys.cmd status $ARGUMENTS` |
| 12 | `/pip-overview` maps to the wrapper's `overview`. | supported | `tools/pipsys/kilo/commands/pip-overview.md:9`: `tools\pipsys\pipsys.cmd overview` |
| 13 | `/pip-handoffs [project]` maps to the wrapper's `handoffs [project]`. | supported | `tools/pipsys/kilo/commands/pip-handoffs.md:9`: `tools\pipsys\pipsys.cmd handoffs $ARGUMENTS` |
| 14 | The handoff project argument is optional. | supported | `tools/pipsys/kilo/commands/pip-handoffs.md:2`: "optionally for one project. Usage: /pip-handoffs [project]" |
| 15 | Omitting the handoff project argument shows all projects. | unsupported | Cited `tools/pipsys/kilo/commands/pip-handoffs.md:2,9` describes optional selection but does not state the omitted-argument result. |
| 16 | `/pip-site` maps to the wrapper's `site`. | supported | `tools/pipsys/kilo/commands/pip-site.md:9`: `tools\pipsys\pipsys.cmd site` |
| 17 | `/pip-status` shows repository facts. | supported | `tools/pipsys/pipsys.R:854-860`: repository fields include `path`, `branch`, `head`, `head_date`, `uncommitted`, `version`. |
| 18 | `/pip-status` shows owned pipeline stages. | supported | `tools/pipsys/pipsys.R:901`: `"## Pipeline stages", "", md_table(stage_table(root, pkg))` |
| 19 | `/pip-status` shows Plan counts. | supported | `tools/pipsys/pipsys.R:902`: `"## Plans", "", counts` |
| 20 | `/pip-status` shows open Plans. | supported | `tools/pipsys/pipsys.R:903-906`: `md_table(open_plans)`; `"Open Plans: none"` |
| 21 | `/pip-status` shows handoffs. | supported | `tools/pipsys/pipsys.R:909`: `"## Handoffs", "", md_table(handoff_view(ho))` |
| 22 | `/pip-status` shows Gaps. | supported | `tools/pipsys/pipsys.R:910`: `"## Gaps", "", paste0("- ", gaps)` |
| 23 | `/pip-status` reports one configured package. | supported | `tools/pipsys/pipsys.R:899,901`: `sprintf("%s: status", pkg)`; `stage_table(root, pkg)` |
| 24 | `/pip-overview` shows one row per configured package. | supported | `tools/pipsys/pipsys.R:939-942,957-958`: `pk <- read_packages(root)`; iterates `seq_len(nrow(pk))`; `package = name`. |
| 25 | Roadmap output follows the package table. | supported | `tools/pipsys/pipsys.R:994-995`: `"## Packages", "", md_table(table)` precedes `"## Roadmap"`. |
| 26 | The roadmap summary shows milestone statuses. | supported | `tools/pipsys/pipsys.R:419-420`: `milestone = as_chr(m$title)`; `status = as_chr(m$status)` |
| 27 | The roadmap summary counts features marked `done`. | supported | `tools/pipsys/pipsys.R:421`: `features_done = sprintf("%d/%d", sum(st == "done"), length(st))` |
| 28 | `/pip-handoffs` shows the latest run per project and task. | supported | `tools/pipsys/pipsys.R:367-368`: "latest run per project and task" |
| 29 | The handoff display includes status. | supported | `tools/pipsys/pipsys.R:403`: `project, task, run, status` |
| 30 | The handoff display includes update time. | supported | `tools/pipsys/pipsys.R:404`: `updated = fmt_et(updated)` |
| 31 | The handoff display includes next action. | supported | `tools/pipsys/pipsys.R:405`: `` `next` = next_action `` |
| 32 | `/pip-site` regenerates the local review site. | supported | `site/index.md:5-6`: "Local review site"; "Every page under `gen/` is generated" |
| 33 | Site sources, not generated pages, should be edited. | supported | `site/index.md:7-8`: "edit the sources, not the pages" |
| 34 | `PIPSYS_QUARTO` overrides the default Quarto executable path for rendering. | supported | `tools/pipsys/pipsys.R:1141`: `quarto = Sys.getenv("PIPSYS_QUARTO", DEFAULT_QUARTO)` |
| 35 | `/pip-doc` accepts a target, sources and a purpose separated by `--`. | supported | `tools/pipsys/kilo/commands/pip-doc.md:2`: `/pip-doc <target.md> <source> [source ...] -- <purpose>` |
| 36 | `/pip-doc` target and source paths are checkout-relative. | supported | `tools/pipsys/kilo/commands/pip-doc.md:16`: "TARGET and every SOURCE must be relative paths" |
| 37 | The documented `docs/status-guide.md` example follows `/pip-doc` argument syntax. | supported | `tools/pipsys/kilo/commands/pip-doc.md:13-15`: target first, sources before `--`, purpose after `--`. |
| 38 | The documentation workflow runs a writer. | supported | `tools/pipsys/kilo/commands/pip-doc.md:28`: "Writer. Subagent `pip-doc-writer`" |
| 39 | The workflow runs a factual checker. | supported | `tools/pipsys/kilo/commands/pip-doc.md:29-30`: "Checker, facts"; "DOCUMENT TARGET" |
| 40 | The factual check permits at most one correction round. | supported | `tools/pipsys/kilo/commands/pip-doc.md:31-34`: writer reruns once; another non-supported verdict blocks. |
| 41 | The workflow runs a simplifier. | supported | `tools/pipsys/kilo/commands/pip-doc.md:36`: "Simplifier. Subagent `pip-doc-simplifier`" |
| 42 | The workflow runs a meaning checker. | supported | `tools/pipsys/kilo/commands/pip-doc.md:37-38`: "Checker, meaning"; "BEFORE `RUN/checked.md` and AFTER TARGET" |
| 43 | The workflow runs `check-doc`. | supported | `tools/pipsys/kilo/commands/pip-doc.md:42`: `tools\pipsys\pipsys.cmd check-doc "<TARGET>"` |
| 44 | The workflow writes TARGET. | supported | `tools/pipsys/kilo/commands/pip-doc.md:28,35`: writer receives TARGET; "Save an exact copy of TARGET". |
| 45 | Run artifacts use the documented project, slug and UTC timestamp directory. | supported | `tools/pipsys/kilo/commands/pip-doc.md:20-22`: `outputs/pipsystem/doc-<SLUG>/<UTC time as yyyyMMddTHHmmssZ>-pip-doc` |
| 46 | The run directory contains a handoff. | supported | `tools/pipsys/kilo/commands/pip-doc.md:26`: "Create RUN and `RUN/handoff.md`" |
| 47 | The run directory contains checker reports. | supported | `tools/pipsys/kilo/commands/pip-doc.md:30,33,39`: `RUN/facts-1.md`, `RUN/facts-2.md`, `RUN/meaning.md`. |
| 48 | The run directory contains a checked copy. | supported | `tools/pipsys/kilo/commands/pip-doc.md:35`: "Save an exact copy of TARGET as `RUN/checked.md`." |
| 49 | The run directory contains script-check output. | supported | `tools/pipsys/kilo/commands/pip-doc.md:43`: "save its output as `RUN/check-doc.md`" |
| 50 | The other subcommands use the same wrapper prefix. | supported | `tools/pipsys/pipsys.R:10-13`: each usage begins `tools\pipsys\pipsys.cmd`. |
| 51 | `check-map` checks map columns. | broad | Narrow to `tools/pipsys/pipsys.R:537-538`: `missing <- setdiff(MAP_COLUMNS, names(map))`; "missing columns". |
| 52 | `check-map` checks allowed kinds. | broad | Narrow to `tools/pipsys/pipsys.R:541-542`: "kind '%s' is not stage or edge". |
| 53 | `check-map` checks allowed fields. | broad | Narrow to `tools/pipsys/pipsys.R:547-550`: "field '%s' is not allowed for kind %s". |
| 54 | `check-map` checks allowed statuses. | broad | Narrow to `tools/pipsys/pipsys.R:544-545`: `!map$status %chin% MAP_STATUSES`. |
| 55 | `check-map` checks stage identifiers. | broad | Narrow to `tools/pipsys/pipsys.R:571-573`: "stage id '%s' is not 1-10". |
| 56 | `check-map` checks edge identifiers. | broad | Narrow to `tools/pipsys/pipsys.R:584-589`: "edge id '%s' is not <stage>-><stage> with stages 1-10". |
| 57 | `check-map` checks required rows. | broad | Narrow to `tools/pipsys/pipsys.R:578-581,592-595`: missing stage name and edge carries rows produce problems. |
| 58 | `check-map` checks citation locations. | broad | Narrow to `tools/pipsys/pipsys.R:563-569,597`: checks design/note sources and calls `check_citations(map, root)`. |
| 59 | `check-doc` requires a nonempty `## Gaps` section. | supported | `tools/pipsys/pipsys.R:752-760`: "no ## Gaps section"; "## Gaps section is empty". |
| 60 | `check-doc` checks local citation paths and line ranges. | supported | `tools/pipsys/pipsys.R:768-769`: `local <- cit[!is_package]`; `bad <- check_citations(local, root)` |
| 61 | `check-path` rejects `..` path components. | supported | `tools/pipsys/pipsys.R:803-804`: matching `\\.\\.` components returns `FALSE`. |
| 62 | `check-path` checks checkout containment. | supported | `tools/pipsys/pipsys.R:806`: `inside_root(normalizePath(path, winslash = "/", mustWork = FALSE), root)` |
| 63 | Containment follows junctions and symbolic links. | supported | `tools/pipsys/pipsys.R:1094-1095`: "junctions and symbolic links are followed" |
| 64 | Containment uses existing parents for nonexistent paths. | supported | `tools/pipsys/pipsys.R:1094,1098-1100`: "nearest existing parent"; loop replaces probe with `dirname(probe)`. |
| 65 | `install-kilo` copies Markdown command and agent definitions into `.kilo`. | supported | `tools/pipsys/pipsys.R:814-816,823`: command/agent loop, `\\.md$`, destination `.kilo`, `file.copy`. |
| 66 | The copied definitions are described as tracked. | supported | `tools/pipsys/pipsys.R:809`: "Copy the tracked command and agent definitions". |
| 67 | `install-kilo` overwrites matching files. | supported | `tools/pipsys/pipsys.R:823`: `file.copy(f, dest, overwrite = TRUE)` |
| 68 | Failed map checks exit with status 1. | supported | `tools/pipsys/pipsys.R:1272-1273`: `if (nrow(res$problems))`; `attr(out, "status") <- 1L` |
| 69 | Failed document checks exit with status 1. | supported | `tools/pipsys/pipsys.R:1283-1284`: `if (nrow(res$problems))`; `attr(out, "status") <- 1L` |
| 70 | Rejected paths exit with status 1. | supported | `tools/pipsys/pipsys.R:1292-1293,1309`: rejected paths abort; `quit(save = "no", status = 1L)`. |
| 71 | Package paths come from `tools/pipsys/packages.csv`. | supported | `tools/pipsys/pipsys.R:134-135`: `file.path(root, "tools", "pipsys", "packages.csv")`; `fread(file, ...)`. |
| 72 | The running checkout replaces the configured `pipsystem` path. | supported | `tools/pipsys/pipsys.R:139`: `pk[package == "pipsystem", path := root]` |
| 73 | Plans come from repository `.cg-docs/plans/*.md` files. | supported | `tools/pipsys/pipsys.R:234,238`: `.cg-docs/plans`; `list.files(dir, pattern = "\\.md$", full.names = TRUE)`. |
| 74 | Plan facts come from frontmatter. | supported | `tools/pipsys/pipsys.R:243,250-255`: `fm <- read_frontmatter(f)`; reads status, title, date and completed phases. |
| 75 | Handoffs come from this checkout's orchestration outputs hierarchy. | supported | `tools/pipsys/pipsys.R:143-144,367`: `outputs_dir(root)`; "<outputs>/<project>/<task>/<run>/handoff.md". |
| 76 | Roadmap summaries read `roadmap.json`. | supported | `tools/pipsys/pipsys.R:409-410,415`: `roadmap_summary`; `"roadmap.json"`; `jsonlite::fromJSON(file, ...)`. |
| 77 | Stage ownership reads `tables/pipeline_map.csv`. | supported | `tools/pipsys/pipsys.R:448,680,685`: `MAP_FILE`; `read_map(root)`; filters `field == "owner"`. |
| 78 | The site diagram reads `tables/pipeline_map.csv`. | supported | `tools/pipsys/pipsys.R:448,644,660,665-667`: reads map and constructs stage nodes and links. |
| 79 | Reports print to standard output. | supported | `tools/pipsys/pipsys.R:1312`: `writeLines(out)` |
| 80 | The wrapper can create `.tmp/pipsys` even for report commands. | supported | `tools/pipsys/pipsys.cmd:9-10`: sets the temporary directory and unconditionally checks whether to create it. |
| 81 | `site` deletes and recreates `site/gen`. | supported | `tools/pipsys/pipsys.R:1121-1122`: `unlink(gen, recursive = TRUE)`; `dir.create(gen, recursive = TRUE)`. |
| 82 | Generated site pages cover overview. | broad | Narrow to `tools/pipsys/pipsys.R:1151-1153`: `"overview.md"`; `report_page(report_overview(root, ho = ho))`. |
| 83 | Generated site pages cover handoffs. | broad | Narrow to `tools/pipsys/pipsys.R:1155-1157`: `"handoffs.md"`; `report_page(report_handoffs(root = root, ho = ho))`. |
| 84 | Generated site pages cover roadmap. | broad | Narrow to `tools/pipsys/pipsys.R:1159-1162`: `"roadmap.md"`; `md_table(roadmap_table(root))`. |
| 85 | Generated site pages cover the map. | broad | Narrow to `tools/pipsys/pipsys.R:1166`: `write_page(file.path(gen, "map.qmd"), map_page(root))`. |
| 86 | Generated site pages cover design. | broad | Narrow to `tools/pipsys/pipsys.R:1167-1172`: reads `SYSTEM_DESIGN.md`; writes `"design.md"` if it exists. |
| 87 | Generated site pages cover package status. | broad | Narrow to `tools/pipsys/pipsys.R:1175-1179`: package loop writes `"status"` pages using `report_status`. |
| 88 | Generated site pages cover Plans. | broad | Narrow to `tools/pipsys/pipsys.R:1186-1190`: Plan-file loop writes `"plans"` pages using `copy_page`. |
| 89 | Rendered HTML goes to `site/_site`. | supported | `site/_quarto.yml:1-3`: website project; `output-dir: _site`. |
| 90 | The script lists `site/.quarto` as a write location. | supported | `tools/pipsys/pipsys.R:20`: "site/gen, site/_site, site/.quarto and .tmp/pipsys." |
| 91 | Quarto state goes under `.tmp/pipsys`. | supported | `tools/pipsys/pipsys.R:1206,1219-1222`: `quarto-home` under `.tmp/pipsys`; redirects `LOCALAPPDATA`, `APPDATA`, `DENO_DIR`. |
| 92 | `quarto-render.log` goes under `.tmp/pipsys`. | supported | `tools/pipsys/pipsys.R:1232-1233`: `file.path(root, ".tmp", "pipsys", "quarto-render.log")`; `writeLines(log, log_file)`. |
| 93 | The site is local. | supported | `site/index.md:5`: "Local review site for the PIP incremental build system." |
| 94 | The site is not published. | supported | `site/index.md:8`: "The site is not published." |
| 95 | Recorded statuses do not verify completion. | supported | `tools/pipsys/pipsys.R:876`: "Statuses are as recorded in the files, not verified." |
| 96 | Plans not marked `completed`, `complete`, `done` or `superseded` are open. | supported | `tools/pipsys/pipsys.R:33,872`: `CLOSED_PLAN_STATUSES` lists those values; open Plans exclude them. |
| 97 | Latest handoff is ordered by newest parsed update time. | supported | `tools/pipsys/pipsys.R:368,388-389`: "newest `updated`"; descending `updated` ordering. |
| 98 | Run ID breaks update-time ties. | supported | `tools/pipsys/pipsys.R:368,388-389`: "then run ID"; descending `run` ordering. |
| 99 | Unknown handoff update times sort last. | supported | `tools/pipsys/pipsys.R:368,389`: "unknown times last"; `na.last = TRUE`. |
| 100 | `check-map` checks citation existence and line ranges, not meaning. | supported | `tools/pipsys/pipsys.R:623`: "Citations are checked for existence and line range only, not for meaning." |
| 101 | `check-doc` checks citation existence and line ranges, not meaning. | supported | `tools/pipsys/pipsys.R:794`: "Citations are checked for existence and line range only, not for meaning." |
| 102 | `check-doc` leaves package citations unchecked. | supported | `tools/pipsys/pipsys.R:795`: "Package citations are not checked". |
| 103 | The map is evidence, not a contract. | supported | `tools/pipsys/pipsys.R:624`: "Evidence-only map, not a contract". |
| 104 | `pipfaker` has an empty configured path. | supported | `tools/pipsys/packages.csv:11`: `pipfaker,` |
| 105 | `metapip` has an empty configured path. | supported | `tools/pipsys/packages.csv:12`: `metapip,` |

summary: supported 89, broad 15, unsupported 1, wrong 0, uncited 0
