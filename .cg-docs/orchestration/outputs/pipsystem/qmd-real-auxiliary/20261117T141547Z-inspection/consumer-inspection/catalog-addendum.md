# Catalog and retained-snapshot source trace

Source-only addendum returned by the consumer researcher and persisted by the
coordinator. No worker package execution, network, household reads or repair.

## Sources
Checked-archive root A:
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources/`.
pipdata `53a76e379c81a3ac70b39925954981ae6a691459`, pipload
`4ef0d90a974cb6ff0725da69373bde421dd04ad5`, stamp
`95890411e8bf9db842593c2b0ab68ec4f2a66b25`.

## Exact-version consequence
- A/pipdata/R/dependency_execution.R:234-254 queries st_catalog_query(alias=aux),
  selects requested measures, loads exact version_id with ppp_defaults=FALSE,
  then compares the object hash with the catalog hash.
- A/stamp/R/version_store.R:1546-1559 joins artifacts.latest_version_id to
  version metadata, not physical snapshot availability or the main sidecar.
  Missing matching catalog rows abort integrity at :1561-1569.
- A/pipload/R/pip_read-write.R:119-134 delegates exact version to st_load;
  A/stamp/R/IO_core.R:654-668 immediately resolves and loads the snapshot.
- A/stamp/R/version_store.R:403-421 requires catalog membership. The snapshot
  path is <artifact>/versions/<version_id>/artifact (:88-97,535-536).
  If absent, :537-541 aborts before recovery logic :543-568. No main-file fallback.
- Source-defined payload diagnostic is `Version <version_id> not found for
  <path>.` This was NOT executed against the public API during this inspection.
- Unpinned main-file reads use a different branch (A/stamp/R/IO_core.R:654-675,
  687-719), so main-file readability does not establish pinned-route readiness.

## Read-only public confirmation boundary
The pinned pipload::pip_read metadata_only=TRUE branch requires an exact
character pin and delegates to stamp::st_read_sidecar
(A/pipload/R/pip_read-write.R:63-70,71-106).
A/stamp/R/format_registry.R:507-529 requires exactly one catalog row, retained
artifact and historical sidecar. Missing retention has source-defined diagnostic
`Retained snapshot is unavailable.` (:518-520), NOT a newly executed error here.
Public confirmation should use the already configured correct alias and record
the actual returned result/error without triggering initialization or repair.
Successful sidecar reading still does not prove payload/hash equality.

## PPP selection
A/pipload/R/load_aux_data.R:84-90 filters ppp_default_by_year, not ppp_default.
For the coordinator's observed COL2021 rows, v1/v2 survives that filter; v1/v1
does not. The filter alone does not restrict the PPP year. Pipdata freezes with
defaults disabled (:248-251) and distinguishes full vintage identifiers in
A/pipdata/R/pd_aux_attr.R:144-158,203-209. Deflation later requires an explicit
vintage and rejects duplicate years (A/pipdata/R/pd_deflation.R:165-188).
The catalog retention discrepancy is the earlier blocker, not the presence of
two PPP variants or ppp_default=FALSE on both.

## Gaps
Actual public adapter calls, exact payload/hash acceptance and root alignment
inside the user's R session were not executed by this worker. Filesystem and
catalog observations are coordinator evidence in the main handoff. No repair
method, cause or latest-version reinterpretation is established by this trace.
