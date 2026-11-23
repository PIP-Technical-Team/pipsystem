# Proposal: Reconcile the Latest Validated TEST Inputs

**Proposal only. No implementation or shared mutation is authorized.** User
approved the baseline policy on 2026-11-17: use the most recent retained,
technically validated snapshot of each auxiliary dataset. PPP base remains2021;
this does not select a PPP release/adaptation vintage or certify publication.

## Exact Baseline
Fresh metadata window: `2026-11-17T22:44:06.525794Z` to
`2026-11-17T22:44:06.691373Z`; times below are saved metadata in UTC, not filesystem
copy dates. Every candidate is the **unique newest catalog row and newest retained
snapshot**, with no timestamp ties or orphan directories for these six artifacts.
All five public technical check groups passed in user-run ea662384aa01 at20:34UTC.

| Input | Frozen exact ID | Saved UTC, 2026-05-26 |
|---|---|---|
| PFW | dbd2ccf63260991d | 16:21:38.730901 |
| CPI | ae38185bd7ff383c | 16:21:51.225475 |
| PPP | c16e62d94f46e1bc | 16:21:44.224163 |
| Population | c059b971f5fc70cc | 16:21:48.727535 |
| GDP | 062e2d30b15b4661 | 16:22:24.310111 |
| PCE | 4d57e305a0e3c86e | 16:22:11.803518 |

"Most recent" here is bounded to the existing 20260401_TEST auxiliary store,
not an upstream data refresh, a newer release folder or a package upgrade.

The six artifact.latest_version_id pointers still name unavailable older
snapshots. Chronological latest already names the approved versions. Metadata
catalog bytes stayed equal across this inspection; no payload was opened again.
Main-sidecar matching evidence is historical, not a fresh main-byte/provenance
certificate. Evidence: baseline-ranking.tsv:2-7, version-metadata.tsv:2-26,
orphan-directories.tsv, metadata-window.tsv and the user-run candidate-results.tsv.

## Route Assessment
| Route | Supported now? | Consequence |
|---|---|---|
| Public exact-version reads | Yes; already passed | Good technical evidence, not an execution/reconciliation interface |
| Existing pipdata legacy processing with explicit six-pin override | No override at checked pin | Default freeze still uses stale catalog pointers |
| process_data(aux_list) or explicit-parent recipes | Real public contracts, limited | Object route saves outside release-pin orchestration; recipes require one initialized E root and guarded callbacks, not direct shared-input substitution |
| Restore/rebuild/reset/resave | Not proven safe for this purpose | Can run builders, rewrite data/create versions/lose provenance or history; do not use as an index-repair shortcut |
| Narrow stamp-owned pointer reconciliation | Missing supported public operation | Smallest proposed extension for this observed state; requires approved package work and later application |

## Recommendation
Prepare a **stamp-owned, pointer-only reconciliation Plan**, restricted to an
explicit candidate that is already unique chronological latest. Do not redefine
st_latest or add a general active-versus-historical selection model. Reuse
existing catalog locking/public integrity semantics; stamp stays domain agnostic,
while PIP supplies release policy and the six exact IDs.
This would remove the demonstrated auxiliary-pointer blocker only; complete
pipeline/root/permission and survey-processing acceptance remains untested.

Before an eventual mutation, the supported method must prove exact store/artifact
identity, retained payload/required historical metadata integrity, fresh main and
candidate byte/provenance agreement, and unchanged expected pointer/latest state.
Apply must hold effective writer locks in artifact-then-catalog order and recheck
the gates while held. Unavailable or failed locking stops before mutation; do not
use the legacy unlocked fallback or change that helper package-wide. Dry-run is
read-only advisory evidence, not future prestate assurance, and must not create
lock files merely to claim readiness.
Other artifact metadata, including format and history-row count, must already
be coherent; a mismatch stops rather than expanding this pointer-only repair.
If any proof is unavailable or main differs, stop: metadata/payload restoration
is a different scope. Earlier read/hash PASS alone does not establish these gates.

The permitted effect would be only the selected artifact's stale latest pointer.
Preserve every version row (including missing-history records), retained bytes,
parents, source/execution metadata, timestamps and counts. No builder/producer,
main rewrite, new data version, retention or pruning. Already coherent must be
an unchanged no-op. Expected-prestate conflicts must fail without overwriting work.
No repair name/signature is claimed as already available.

**Focused future check:** package-owned synthetic stale-pointer fixture whose
valid latest snapshot matches main: dry-run changes nothing; apply changes only
the intended pointer and aligns public query/latest/exact/main observations;
repeat is a no-op; wrong target/prestate/main mismatch leaves all state unchanged.
Include unavailable-lock rejection before any mutation in that focused check.
This is not an instruction to edit serialized production metadata.

## Ownership and Gates
**CRAN constraint added 2026-11-18:** user reports Stamp already submitted. Do not
edit the submitted source/tarball/release branch or replace current libraries.
Only additive, explicitly invoked future development is proposed. Existing APIs,
defaults, return/error contracts and normal read/save/startup behavior must stay
unchanged and pass regression checks; that is a requirement, not a current proof.
No automatic repair, package-wide stricter locking, version bump or resubmission.
The observed ready_cran checkout below is reference evidence, not an approved
implementation target. Isolated future branch/worktree setup needs explicit
authorization; preferably defer package changes until CRAN review completes.

1. Approve the proposed route/completion contract, then save and formally review
   a canonical implementation Plan. Draft contract is in completion-contract-preview.md.
2. Separately authorize package implementation/local tests. Current source is
   `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp`, branch ready_cran, HEAD
   95890411e8bf9db842593c2b0ab68ec4f2a66b25; preserve dirty config/ignore artifacts.
3. Qualify a new isolated E: tool build before using a new API. Existing checked
   libraries/pins remain immutable. No build/install/pin change occurs here.
4. Refresh expected pointer/latest/main integrity and obtain separate explicit
   user-run shared-application approval. PPP vintage and survey execution are
   later decisions. Do not silently retarget if a newer/unvalidated version appears.

If avoiding every shared metadata mutation is the overriding requirement, the
alternative is a pipdata-owned explicit-pin orchestration contract, preserving
the same inputs across planning, lease refresh, execution and parent provenance.
That is broader integration work, not a private snapshot-object workaround or a
second planner, and it leaves the stale index unrepaired. It is not recommended
as the smallest default-path fix for the verified latest-equals-candidate case.

## Evidence and Limits
Source details: pipdata-research/handoff.md and stamp-research/handoff.md.
Checked pipdata53a76e379c81a3ac70b39925954981ae6a691459: dependency_execution.R:234-259,
1038-1097,1129-1151; pd_process_data.R:379-474; pd_run_pipeline.R:295-461.
Checked stamp95890411e8bf9db842593c2b0ab68ec4f2a66b25: version_store.R:230-337,
1519-1569; IO_core.R:1032-1083,1429-1438; rebuild.R:420-460. Source tests inspected,
not run. Historical cause, backup availability and complete lineage remain UNKNOWN.
Lock gap: IO_core.R:1512-1530 has an optional unlocked fallback; saves hold the
artifact lock before main writes (:377-380,419-509), then the catalog lock
(version_store.R:926-930). filelock DESCRIPTION is present at version1.0.3 in the
checked library; presence is not a new runtime/acquisition test.

**Minimal first:** smallest complete slice; safeguards only for almost-irreversible
harm (otherwise Later); one functional check/change; installed tools and only
worthwhile dependencies; Plans about two pages. No migration/audit framework,
pipeline rewrite, automatic cleanup or unrelated roadmap changes.
