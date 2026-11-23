---
schema: pip-handoff-v2
project: pipsystem
task: aux-reconciliation-proposal
run: 20261117T223822Z/pipdata-research
status: completed
updated: 2026-11-17T22:43:47Z
owner: explore researcher; coordinator persisted source research
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: null
next: Compare package-owned explicit-pin extension with narrow stamp reconciliation; no execution.
---

# Checked pipdata public input contracts

## Summary
Public object inputs and exact-parent recipes exist. There is no public
per-artifact aux-pin/snapshot override for the legacy release-processing routes
in this checked pin. Do not describe all explicit inputs as absent, or bypass
package-owned planning/provenance by constructing private snapshot objects.

## Changes
Research only; coordinator saved this report. Worker no shell/Git/R/tests,
network/shared/credential access, source changes or file writes.

## Checks run
S = `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources/pipdata`,
full SHA53a76e379c81a3ac70b39925954981ae6a691459 (pins.tsv:8).

### Legacy public entry points
`pd_process_data(inv=NULL, aux_measures=c("pfw","cpi","ppp","pop","gdp","pce"),
force=FALSE, verbose=..., force_surveys=NULL, bootstrap=FALSE,
bootstrap_entities=NULL, dependency_plan=NULL)`.
`pd_run_pipeline(inv=NULL, force=FALSE, verbose=..., force_surveys=NULL,
bootstrap=FALSE, bootstrap_entities=NULL, checkpoint_size=25L,
checkpoint_seconds=Inf, recipes=NULL)`.
Definitions/docs: S/man/pd_process_data.Rd:6-16, pd_run_pipeline.Rd:6-17;
S/NAMESPACE:58-59. aux_measures chooses names, not versions.

Both legacy routes freeze through private pd_freeze_aux_snapshot, using
st_catalog_query pointer-selected rows, exact load_aux_data version and
ppp_defaults=FALSE plus hash comparison (S/R/dependency_execution.R:234-259).
dependency_plan is advisory, not a pin escape: facts rebuilt before validation
and again under lease without forwarding its snapshot (:1038-1097,1129-1151).
These APIs acquire leases, sync recodes and save outputs/inventory/manifest;
never use as read-only probes (S/R/pd_process_data.R:117-158,278-299;
pd_run_pipeline.R:495-539).

### Genuine public lower-level object contracts
`process_data(inv, aux_list, recode_spec=NULL, verbose=TRUE, ...)` and
`pd_aux_attr(clean_data, aux_list)` are public (S/NAMESPACE:67;
S/man/process_data.Rd:6-20; S/R/pd_aux_attr.R:21-60).
process_data uses supplied six-frame aux_list directly for mapping/metadata
(S/R/pd_process_data.R:379-407), but reads DLW and saves pip/pip_meta immediately
(:409-412), returns names or catches/logs failures (:419-474). Save helper does
not forward explicit aux parent/version provenance (S/R/save_pip.R:32-62).
recode_spec=NULL separately reads current recode catalog (pd_dlw_clean.R:70-80;
recode_spec.R:400-422). These are building blocks, not release-pin orchestration.

### Public exact-parent recipes
pd_run_pipeline(recipes=...) documents explicit parents(path,version_id) and
returns before legacy freeze (S/R/pd_run_pipeline.R:295-301,346-376,440-461;
S/man/pd_run_pipeline.Rd:102-109). Delegates rebuild decisions/execution to
stamp (dependency_execution.R:145-149). But every parent/output must lie beneath
one initialized absolute E root (dependency_plan.R:342-359,364-414), callbacks
are restricted pure operations/guarded reads (code_fingerprint.R:275-362,
477-509), and package exception is bounded deflation, not cleaning/metadata
adaptation (pd_run_pipeline.R:381-400). Writes leases/receipts/outcomes; no
drop-in path for the shared six-artifact baseline. Source test assertions only,
NOT RUN: test-m2-engine-authority.R:369-399,808-828.

### No private-object workaround
pd_build_dependency_snapshot and pd_prepare_dependency_facts accept injected
objects internally (dependency_execution.R:262-299,440-491), not exported.
Fixture mocks/private snapshots (test-dependency-execution.R:232-303;
helper-dependency-fixtures.R:246-263) are not public contracts. snapshot_identity
is a digest, not a supported public snapshot selector (:373-409,489-491).

## Proposed ownership gap, not implementation
A future pipdata explicit-input contract could thread exact aux path/version
selection through existing coordination, fact refresh, execution and provenance.
No second planner or externally fabricated snapshot. Generic metadata repair
would instead belong in stamp. This research does not require either change.

## Gaps
No source runtime API, tests or baseline execution was run. Current package
checkout state/HEAD not inspected; checked installed pin only. New source
features might differ and must be checked before any implementation. Exact
object reads alone do not solve provenance/planning or imply store authority.
