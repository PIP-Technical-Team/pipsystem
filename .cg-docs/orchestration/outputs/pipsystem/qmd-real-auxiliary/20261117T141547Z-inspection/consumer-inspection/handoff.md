---
schema: pip-handoff-v2
project: pipsystem
task: qmd-real-auxiliary
run: 20261117T141547Z-inspection/consumer-inspection
status: completed
updated: 2026-11-17T14:20:48Z
owner: explore consumer researcher; coordinator persisted returned evidence
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE; approved read-only auxiliary inspection
next: Reconcile exact-version snapshot availability with public-read semantics; do not execute a pipeline stage.
---

# Consumer and public read interface inspection

## Summary
PFW/CPI/PPP alone are not sufficient for the default public processing route:
the wrapper eagerly loads all six auxiliary artifacts before cleaning, though
cleaning's semantic parents are DLW/PFW. Existing real data still needs exact-
version and public-adapter verification. No source, package or shared changes.

## Changes
Coordinator persisted worker evidence because explore forbids file creation.
Worker Git provenance command was denied; coordinator obtained it read-only.

## Checks run
Worker loaded R shared/technical/data.table/collapse/testing skills and read
current source and selected pinned archive sections; no R/package execution,
tests, network, UNC or household reads by worker.

Current repositories (coordinator-observed Git):
- D=`E:/PovcalNet/01.personal/wb384996/PIP/pipdata`, PROD HEAD
  `53a76e379c81a3ac70b39925954981ae6a691459`; dirty active-state/vignette and
  untracked B6 artifacts, no reported dirty R source.
- L=`E:/PovcalNet/01.personal/wb384996/PIP/pipload`, PROD HEAD
  `ff9a81e386a09fb2531c154f63fd2b91521313c6`; dirty .gitignore and untracked
  plans/review, .compound-gpid, .github/skills, sessionInfoLog; no dirty R source.
- A=`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources`:
  pinned pipdata `53a76e379c81a3ac70b39925954981ae6a691459`, pipload
  `4ef0d90a974cb6ff0725da69373bde421dd04ad5`, pipfun
  `7d534516a8c17c33d537681610eccd4c29211762`, stamp
  `95890411e8bf9db842593c2b0ab68ec4f2a66b25` (pins.tsv:2-8).

### Dependency envelope
| Boundary | Required inputs / evidence |
|---|---|
| Acquisition | DLW identifiers/transport, no auxiliary consumer found; D/R/pipdata_get_gmd.R:503-524 |
| Validation | Saved DLW artifact and packaged rules; D/R/pipdata_validate_gmd.R:569-647, pipdata_dlw_validation.R:59-72 |
| Clean semantic stage | DLW and PFW; country/year/acronym, included welfare type and domains; D/R/dependency_inputs.R:183-236,257-317,376-387 |
| Default public clean execution | Eager PFW/CPI/PPP/pop/GDP/PCE snapshot before processing and auxiliary metadata before clean publication; D/R/pd_process_data.R:77-123,278-299, dependency_execution.R:234-259 |
| Metadata | CPI country/year/acronym; PPP country; pop/GDP/PCE country/year; D/R/pd_aux_attr.R:135-178,195-216 |
| Later deflation | CPI/PPP/pop metadata, selected vintages and domains; national weights unchanged, area weights rescaled; D/R/pd_deflation.R:116-203 |

PFW domains include GDP/PCE even though those values do not directly deflate
welfare. Annual-to-daily clean conversion is /365 (D/R/pd_dlw_clean.R:190-205).
Legacy pd_run_pipeline fixes all six snapshot measures while requesting only
CPI/PPP/pop metadata (D/R/pd_run_pipeline.R:1,526-538). Checked matching pinned
pipdata stage dependency distinctions; source presence is not live acceptance.

### Pinned public read APIs
- `pip_read(id, format="qs2", version=NULL, alias=NULL, verbose=..., metadata_only=FALSE)`:
  A/pipload/R/pip_read-write.R:63-70.
- `load_aux_data(measure, version=NULL, format="qs2", verbose=..., ppp_defaults=TRUE)`:
  A/pipload/R/load_aux_data.R:15-21. Version and format forwarded at :76-81.
- `load_pip_release_inventory(version=NULL, verbose=..., format="qs2", fields=character(0))`:
  A/pipload/R/load_pip_data.R:283-288; master inventory :334-339.
- Generic pip_read version="available" returns catalog versions in memory;
  A/pipload/R/pip_read-write.R:109-117. Do not list PPP versions via default
  load_aux_data: its PPP payload filtering expects ppp_default_by_year.
- metadata_only=TRUE requires exact nonempty character version; delegates to
  stamp::st_read_sidecar and does not substitute current metadata
  (A/pipload/R/pip_read-write.R:71-106; A/stamp/R/format_registry.R:507-529).
- Current L pip_read lacks metadata_only (:48-54) and current load_aux_data does
  not forward format (:61-66). Do not mix PROD source with the pinned runtime API.
- Generic pip_read does not initialize stamp or call a producer (:47-49,78,
  105-134). Getter assignments affect caller memory; initialization/load effects
  were not executed or certified by the static worker. Inventory nonempty fields
  can add metadata reads; defaults fields=character(0) avoid that expansion.

### Smallest proposed check
Inspect existing six artifacts at explicit retained version IDs, historical
sidecars and relevant aggregate rows with PPP defaults disabled. Establish
columns, unambiguous PFW mapping/domain selection, PPP vintage identifiers and
positive usable numeric projections. Distinguish direct artifact reading from
public adapter acceptance. No producer update or pipeline call as a probe.

## Gaps
- Worker did not execute consumer code or inspect shared contents. Main handoff
  records coordinator's actual aggregate and catalog reads separately.
- Historical namespace receipt evidence is not a fresh public readback.
- Default catalog selection and physical retained snapshots need reconciliation;
  a separate read-only addendum investigates that observed discrepancy.
- No calculation package, full release, B6, survey or deflation acceptance claimed.
