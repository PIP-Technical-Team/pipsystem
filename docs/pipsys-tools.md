# pipsys tools

## Run commands

Run the Windows wrapper from the root of the current pipsystem checkout, including an Agent Manager worktree. `tools/pipsys/kilo/commands/pip-status.md:5-9`
The wrapper calls `Rscript --no-init-file` and redirects temporary files to this checkout's `.tmp/pipsys` on E:. `tools/pipsys/pipsys.cmd:5-18`
The R code uses `data.table`, `yaml`, `jsonlite` and `rlang`, plus Git for repository facts. `tools/pipsys/pipsys.R:24,125,151-157,350-353,743`

Use these Kilo commands or their Windows PowerShell equivalents. `tools/pipsys/kilo/commands/pip-status.md:9` `tools/pipsys/kilo/commands/pip-overview.md:9` `tools/pipsys/kilo/commands/pip-handoffs.md:9` `tools/pipsys/kilo/commands/pip-site.md:9`

| Kilo command | PowerShell command | What it shows or does |
|---|---|---|
| `/pip-status pipdata` | `.\tools\pipsys\pipsys.cmd status pipdata` | Repository facts, owned pipeline stages, Plan counts, open Plans, handoffs and Gaps for one package. `tools/pipsys/pipsys.R:854-860,898-910` |
| `/pip-overview` | `.\tools\pipsys\pipsys.cmd overview` | One row per configured package. `tools/pipsys/pipsys.R:939-946,957-958,972-973` Then roadmap milestone statuses and counts of features marked `done`. `tools/pipsys/pipsys.R:419-421,958-969,993-996` |
| `/pip-handoffs [project]` | `.\tools\pipsys\pipsys.cmd handoffs [project]` | Latest run per project and task, optionally filtered to one project, with status, update time and next action. `tools/pipsys/pipsys.R:367-368,403-405,1003-1013` |
| `/pip-site` | `.\tools\pipsys\pipsys.cmd site` | Regenerates the local review site; edit sources, not generated pages. `site/index.md:5-8` |

Site rendering uses Quarto; set `PIPSYS_QUARTO` to override the default executable path. `tools/pipsys/pipsys.R:29-31,1140-1144`

## Write documentation

Use `/pip-doc <target.md> <source> [source ...] -- <purpose>` with checkout-relative paths. `tools/pipsys/kilo/commands/pip-doc.md:2,13-19`

The workflow runs:

1. A writer. `tools/pipsys/kilo/commands/pip-doc.md:28` The writer receives the target document path. `tools/pipsys/kilo/commands/pip-doc.md:28`
2. A factual checker with at most one correction round. `tools/pipsys/kilo/commands/pip-doc.md:28-44`
3. A simplifier. `tools/pipsys/kilo/commands/pip-doc.md:36`
4. A meaning checker. `tools/pipsys/kilo/commands/pip-doc.md:37-38`
5. `check-doc`. `tools/pipsys/kilo/commands/pip-doc.md:42-43`

The run directory is `.cg-docs/orchestration/outputs/pipsystem/doc-<SLUG>/<UTC timestamp>-pip-doc/`. `tools/pipsys/kilo/commands/pip-doc.md:20-22`

The workflow saves:

- Its handoff as `RUN/handoff.md`. `tools/pipsys/kilo/commands/pip-doc.md:26-27`
- Checker reports in the run directory. `tools/pipsys/kilo/commands/pip-doc.md:20-27,30-46`
- An exact checked copy as `RUN/checked.md`. `tools/pipsys/kilo/commands/pip-doc.md:35`
- Script-check output as `RUN/check-doc.md`. `tools/pipsys/kilo/commands/pip-doc.md:42-43`

## Other subcommands

Use the same `.\tools\pipsys\pipsys.cmd` prefix for these subcommands. `tools/pipsys/pipsys.R:10-13`

| Subcommand | Purpose |
|---|---|
| `check-map` | Checks map columns, allowed values, stage and edge identifiers, required name/carries rows, and evidence references. `tools/pipsys/pipsys.R:537-550,555-559,563-569,571-581,584-597` |
| `check-doc docs/name.md` | Requires a nonempty `## Gaps` section and checks local citation paths and line ranges. `tools/pipsys/pipsys.R:752-772` |
| `check-path docs/name.md` | Rejects `..` components and checks containment in the checkout, resolving junctions and symbolic links through existing parents. `tools/pipsys/pipsys.R:800-806,1094-1103` |
| `install-kilo` | Copies tracked Markdown definitions from `tools/pipsys/kilo/{commands,agents}/` into `.kilo/{commands,agents}/`, overwriting matching files. `tools/pipsys/pipsys.R:809-826` |

Map or document problems and rejected paths produce exit status 1. `tools/pipsys/pipsys.R:1272-1273,1283-1284,1292-1293,1307-1309`

## Inputs and files written

- Package paths come from `tools/pipsys/packages.csv`, with `pipsystem` replaced by the checkout running the script. `tools/pipsys/pipsys.R:133-140`
- Plans come from repository `.cg-docs/plans/*.md` frontmatter. `tools/pipsys/pipsys.R:234,238,243,250-256`
- Handoffs come from this checkout's `.cg-docs/orchestration/outputs/<project>/<task>/<run>/handoff.md`. `tools/pipsys/pipsys.R:143-145,367-379`
- Roadmap summaries read `roadmap.json`. `tools/pipsys/pipsys.R:409-421`
- Stage ownership and the site diagram read `tables/pipeline_map.csv`. `tools/pipsys/pipsys.R:448,461-466,644,659-667,680,685`

Reports print to standard output; the wrapper can still create `.tmp/pipsys`. `tools/pipsys/pipsys.R:1312` `tools/pipsys/pipsys.cmd:9-17`
`site` deletes and recreates `site/gen`. `tools/pipsys/pipsys.R:1121-1122,1146-1147`
Generated pages include overview, handoffs, roadmap, map, package status, Plans and, when present, the system design. `tools/pipsys/pipsys.R:1152-1153,1156-1157,1159-1162,1166-1172,1178-1179,1188-1190`
Rendered HTML goes to `site/_site`; the script also lists `site/.quarto` as a write location. `site/_quarto.yml:1-3` `tools/pipsys/pipsys.R:19-20`
Quarto state and `quarto-render.log` go under `.tmp/pipsys`. `tools/pipsys/pipsys.R:1206,1219-1222,1232-1233`
The site is not published. `site/index.md:8`

## Gaps

- Statuses are recorded values, not verified completion. `tools/pipsys/pipsys.R:875-876`
- Open Plans are those not marked `completed`, `complete`, `done` or `superseded`. `tools/pipsys/pipsys.R:32-33,872`
- Latest handoff means newest parsed update time, then run ID, with unknown times last. `tools/pipsys/pipsys.R:387-393`
- Citation checks test existence and line ranges, not meaning. `tools/pipsys/pipsys.R:623,794`
- `check-doc` leaves package citations unchecked. `tools/pipsys/pipsys.R:795`
- The pipeline map is evidence, not a contract. `tools/pipsys/pipsys.R:624`
