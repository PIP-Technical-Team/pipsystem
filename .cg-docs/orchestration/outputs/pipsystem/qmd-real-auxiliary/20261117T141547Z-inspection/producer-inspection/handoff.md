---
schema: pip-handoff-v2
project: pipsystem
task: qmd-real-auxiliary
run: 20261117T141547Z-inspection/producer-inspection
status: completed
updated: 2026-11-17T14:19:14Z
owner: explore producer researcher; coordinator persisted returned evidence
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE; approved read-only auxiliary inspection
next: Combine with existing-artifact and consumer evidence; no producer execution justified.
---

# Producer interface inspection

## Summary
Existing public pipaux producers cover PFW/CPI/PPP/population/GDP/PCE. Artifact
presence is independently inspected by the coordinator; no new producer or bulk
update is justified by this static source inspection. Important caveats: update
is the default action, PPP options default to 2017, and pipaux caches context at
load time. No worker package execution, network or shared access occurred.

## Changes
No source changes. Coordinator saved this report because explore forbids file
creation. Worker Git command was denied by its policy; no bypass was attempted.

## Checks run
Required R shared/technical/data.table/collapse/testing skills loaded by worker.
Current pipaux root `E:/PovcalNet/01.personal/wb384996/PIP/pipaux` (P below),
coordinator-observed PROD HEAD `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, clean.
Checked archive root (A):
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources/`.
Archive pipaux same full SHA; archive pipfun
`7d534516a8c17c33d537681610eccd4c29211762`, pins.tsv:3,7. Selected setup,
cache/save and CPI/PPP sections agree; no full-tree equivalence claimed.

### Public API and storage
- `aux_cpi`, `aux_pfw`, `aux_ppp`, `aux_pop`, `aux_gdp`, `aux_pce` are exported
  (`P/NAMESPACE:8-28`). All start with `action = c("update", "load")`, plus
  owner/tag/verbose/detail; CPI/PFW/PPP also accept `...`; PPP exposes
  `ppp_defaults = TRUE`. Definitions: respective R/aux_*.R:18-23,15-20,16-22,
  10-14,10-14,11-15. These signatures are evidence, not execution instructions.
- Release source branch is `20260401_TEST`, not a `release`-prefixed string
  (`P/R/aux_cpi.R:25-33`). PPP vintage is a row/default selection, not folder suffix.
- Public action load delegates to pipload; update validates and persists outputs.
  Existing setup/readbacks are in `A/pipfun/R/working_release.R:54-66,315-329,
  350-354,413-417`; setup itself creates folders and is not a read-only probe.

### Dependencies and side effects
| Producer | Inputs | Important effects / output key |
|---|---|---|
| CPI | country_list, aux_cpi GitHub CSV | Long CPI years; country/year/acronym/level/cpi_year key |
| PFW | country_list, aux_pfw DTA | Welfare/coverage recode, alternative-welfare expansion; country/surveyid_year/welfare_type/is_alt_welf |
| PPP | country_list, aux_ppp CSV | Saves PPP and ppp_vintage; country/level/ppp_year/release_version/adaptation_version |
| pop | country_list, pop XLSX and spop CSV | Overrides and year filtering; country/year/level |
| GDP | maddison/weo/wdi/country_list plus sna/metadata/nan | Generates then publishes to GitHub, downloads GDP again and saves locally |
| PCE | wdi/country_list plus sna and metadata | Calendar/fiscal-year adjustment, local save; country/year/level |

Citations under P/R: aux_cpi.R:135-137,163-175,182-260;
aux_pfw.R:69-169,188-234; aux_ppp.R:81-169,194-218,238-313;
aux_pop.R:59-110,123-201; aux_gdp.R:33-65,93-130,350-375;
aux_pce.R:62-86,255-290. Save wrapper utils.R:472-566 requires returned/retained
version_id and supplies primary keys/generator metadata. GH descriptors include
file_path/ext/owner/repo/branch/gh_raw_sha (A/pipfun/R/load_from_gh.R:87-113).
No complete parent lineage is established merely by those descriptors.

### Material cautions
- `P/R/zzz.R:4-6`: pipaux.cpivar=cpi2017 and pipaux.pppyear=2017.
  PPP default flags use that option, not wrk_release$ppp
  (`P/R/aux_ppp.R:81-84,123-138`). Exposed ppp_defaults is unused by this wrapper.
- `P/R/zzz.R:29-57` caches working release/folders/aliases at package load; no
  exported cache-refresh function found. Establish context before loading pipaux.
- `aux_fun`/`update_aux_measures` are not readiness probes: they can read remote
  dependency YAML, synchronize DEV into release branches and regenerate output
  (`P/R/update_aux_data.R:70-74,139-149,263-344,404-425,485-527`).
- Observed GDP round-trip conflicts with Decided SYSTEM_DESIGN.md:100 (GitHub
  copies are never inputs). Reported, not changed; do not run GDP update as a probe.

## Gaps
- Static producer inspection, no fixtures/tests executed. Worker did not read
  shared artifacts; coordinator's aggregate observations are in the main handoff.
- Current manifest, complete lineage, target numerical suitability and saved
  defaults are not established by source inspection alone.
- Full archive/tree equivalence and independent worker Git verification NOT RUN.
- Missing artifacts, if later proven, justify only the existing producer and
  actually missing prerequisites, not a new framework or bulk update.
