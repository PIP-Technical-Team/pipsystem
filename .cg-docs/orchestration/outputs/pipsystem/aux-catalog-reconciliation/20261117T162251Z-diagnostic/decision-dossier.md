---
schema: pip-handoff-v2
project: pipsystem
task: aux-catalog-reconciliation
run: 20261117T162251Z-diagnostic
status: completed
updated: 2026-11-17T16:25:23Z
owner: evidence-dossier worker
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md revision 2
next: User considers next evidence route; authority and supported-method gates remain before any shared recovery or version choice.
---

# Auxiliary Recovery Decision Dossier

## Summary
The six catalog-selected auxiliary versions have absent retained snapshot and
historical-sidecar files in the saved inspection evidence. All six exact public
metadata-only probes were user-reported FAIL with `Retained snapshot is
unavailable.` Different retained candidate files exist and their catalog version
content/code hashes match the corresponding main-file sidecars. That is metadata
agreement plus file-existence evidence, NOT public payload/hash acceptance or
authority to select those candidates (E:64-85,130-144; L:2-42).

This completes only the evidence-dossier contribution to Plan step 2, not the
Plan's execution/review acceptance. Local execution was NOT RUN by this worker;
the coordinator's subsequent executed result is recorded below. No repair, readiness or historical
cause is established. Shared context remains 20260401 / TEST / PPP2021 and
COL_2010_GEIH_V04_M_V01_A_GMD_GPWG (P:26-38,81-96,118-158).

## Evidence Register
All paths below are relative to repository root
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/`. Citations such as E:66 mean
file E, line 66. Evidence is inherited from saved local reports, not refreshed
against packages, the share, a network service or a running R session.

| Key | File |
|---|---|
| P | `.cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md` revision 2 |
| E | `.cg-docs/orchestration/outputs/pipsystem/qmd-real-auxiliary/20261117T141547Z-inspection/handoff.md` |
| L | `.cg-docs/orchestration/outputs/pipsystem/qmd-real-auxiliary/20261117T141547Z-inspection/read-references.log` |
| C | `.cg-docs/orchestration/outputs/pipsystem/qmd-real-auxiliary/20261117T141547Z-inspection/consumer-inspection/catalog-addendum.md` |
| U | `.cg-docs/orchestration/outputs/pipsystem/qmd-real-auxiliary/20261117T141547Z-inspection/consumer-inspection/handoff.md` |
| A | `.cg-docs/orchestration/outputs/pipsystem/qmd-real-auxiliary/20261117T141547Z-inspection/producer-inspection/handoff.md` |
| H | `.cg-docs/orchestration/outputs/pipsystem/aux-catalog-reconciliation/20261117T152428Z-planning/handoff.md` |

### Inherited Source Provenance
Checked source archive root is
`.tmp/one-survey/qmd-acceptance-20261113/sources/`. These full SHAs identify the
source evidence inherited here, not a fresh receipt/origin certification
(E:109-120; C:6-11; U:33-44; A:31-37; H:53-57).

| Package | Checked archive SHA | Historical current-checkout distinction |
|---|---|---|
| stamp | `95890411e8bf9db842593c2b0ab68ec4f2a66b25` | No current external stamp checkout inspection claimed |
| pipdata | `53a76e379c81a3ac70b39925954981ae6a691459` | Prior PROD HEAD matched archive; mixed work recorded, not rechecked |
| pipload | `4ef0d90a974cb6ff0725da69373bde421dd04ad5` | Prior PROD HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6` differs; do not substitute its API |
| pipaux | `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` | Prior PROD HEAD matched archive and was reported clean |
| pipfun | `7d534516a8c17c33d537681610eccd4c29211762` | Archive provenance only; no current external checkout inspection claimed |

Prior pipsystem HEAD was `e9c71e3190f1ce88a017ae25af7c373a64c655a2`
(E:9-11; H:9-11). This worker used no Git; current HEAD is UNKNOWN, as reflected
in frontmatter. Main is the assigned existing checkout, not independently verified.

## Six-Measure Matrix
Each row describes the historical inspection, not a new live observation. The
candidate ID is different from the catalog-selected missing ID in every row.
"Agreement" means candidate catalog-version content/code hashes match the main
sidecar, as reported in E:79-85; it does not mean a public loader deserialized or
hashed that retained payload. L establishes candidate snapshot-file existence,
not successful candidate historical-sidecar or payload loading. Candidate-sidecar
file existence is not separately established by the cited L lines.

| Measure | Catalog-selected ID | Selected snapshot / historical sidecar | Observed different candidate ID | Candidate observation | User-reported selected-pin public result | Authority / cause / backup provenance | Evidence |
|---|---|---|---|---|---|---|---|
| PFW | `5a1af0d6edf7d639` | Absent / absent | `dbd2ccf63260991d` | Snapshot file exists; main-sidecar hash agreement; public payload acceptance NOT RUN | FAIL: `Retained snapshot is unavailable.` | UNKNOWN / UNKNOWN / UNKNOWN | L:2-7; E:66,73-85,134 |
| CPI | `02e66e507fb7946a` | Absent / absent | `ae38185bd7ff383c` | Snapshot file exists; main-sidecar hash agreement; public payload acceptance NOT RUN | FAIL: `Retained snapshot is unavailable.` | UNKNOWN / UNKNOWN / UNKNOWN | L:9-14; E:67,73-85,135 |
| PPP | `13aa439a44297b23` | Absent / absent | `c16e62d94f46e1bc` | Snapshot file exists; main-sidecar hash agreement; public payload acceptance NOT RUN | FAIL: `Retained snapshot is unavailable.` | UNKNOWN / UNKNOWN / UNKNOWN | L:16-21; E:68,73-85,136 |
| pop | `44be5f221cdbd223` | Absent / absent | `c059b971f5fc70cc` | Snapshot file exists; main-sidecar hash agreement; public payload acceptance NOT RUN | FAIL: `Retained snapshot is unavailable.` | UNKNOWN / UNKNOWN / UNKNOWN | L:23-28; E:69,73-85,137 |
| GDP | `9927e67693c42f7c` | Absent / absent | `062e2d30b15b4661` | Snapshot file exists; main-sidecar hash agreement; public payload acceptance NOT RUN | FAIL: `Retained snapshot is unavailable.` | UNKNOWN / UNKNOWN / UNKNOWN | L:30-35; E:70,73-85,138 |
| PCE | `6fde46585a733db2` | Absent / absent | `4d57e305a0e3c86e` | Snapshot file exists; main-sidecar hash agreement; public payload acceptance NOT RUN | FAIL: `Retained snapshot is unavailable.` | UNKNOWN / UNKNOWN / UNKNOWN | L:37-42; E:71,73-85,139 |

### Interpretation Limits
- Main files were directly readable and contained relevant candidate rows
  (E:64-71). Those generic reads do not establish exact retained-version payload
  equality, complete consumer projection correctness or release suitability
  (E:159-172). No raw rows or production payloads are reproduced here.
- Default pipdata processing freezes all six exact catalog-selected versions
  before cleaning. The pinned public exact-version path requires catalog
  membership and retained files without main-file fallback; unpinned reads use
  another branch (C:14-28; U:46-60). Main readability therefore does not unblock
  this route. Narrowing the route is not default public acceptance.
- Public metadata-only failure is user-reported, not independently replayed here
  (E:26-30,130-144). The source-only addendum's earlier NOT RUN statement
  (C:30-39,51-55) predates that user result. The source-defined payload error
  `Version <version_id> not found for <path>.` was not an executed public result
  (C:25-26); do not replace the actual metadata-only error with it.
- Two observed PPP variants and `ppp_default=FALSE` on both are not the earlier
  failure: the pinned loader filters `ppp_default_by_year`; pipdata freezes with
  defaults disabled and later requires an explicit vintage (C:41-49; E:101-104).

## Recovery Decision Boundaries
Neither option below is selected, implemented or offered as an execution recipe.
The evidence and owner gates are necessary to distinguish their different effects;
no authoritative six-version choice or supported recovery procedure exists in
this dossier (P:153-158; H:109-123,150-155,218-228).

| Option | Meaning | Evidence still required | Owner and authority gate | Current disposition |
|---|---|---|---|---|
| Recover intended missing snapshots | Recover the exact currently selected IDs and their same-version metadata, if those pins are confirmed intended; preserve their identities rather than substitute other versions | Identifiable recoverable copies; backup/source provenance and chain to each exact ID; matching payload/hash, historical sidecar and relevant lineage; release-owner confirmation that these pins are intended; demonstrated supported history-preserving restoration method | User/release owner confirms intended pins and separately approves any exact shared recovery; source/backup custodian supplies provenance; package maintainer establishes supported method if existing public APIs cannot | Missing snapshots observed; recoverable copies and backup provenance UNKNOWN; no procedure authorized |
| Select different retained versions | Choose other exact IDs, possibly but not automatically the six candidates above; this changes selection, not recovery of the missing selected versions | Public exact candidate payload and historical-sidecar/hash acceptance; complete relevant provenance/lineage and release/PPP/vintage/domain suitability; explicit per-artifact intended-version decision and consequences for release references; demonstrated supported history-preserving selection/reconciliation method | User/release owner explicitly chooses each intended ID, then separately approves any shared mutation; maintainer supplies method evidence if needed | File existence and metadata agreement only; authority UNKNOWN; no promotion authorized |
| Preserve current state pending evidence | Leave all selections and files unchanged while coordinator completes local diagnosis and review | Coordinator's actual local result and remaining evidence/owner decisions above | Coordinator integrates diagnostics; user decisions are required only before later version selection/shared recovery, not to finish this dossier | Current boundary; shared public processing remains blocked |

Backup provenance is UNKNOWN for every row: neither file existence, creation date,
source-branch labels nor a main-sidecar match proves a recoverable copy of the
missing selected version (E:50-53,73-85,159-172). The evidence requirements above
are unresolved gates, not claims that backups or owner approvals exist.

### Public API and Cause Boundaries
These are inherited static findings at the stamp SHA above, not newly executed
tests or a new source review (H:53-82):
- `st_rebuild` runs builders and saves their outputs. It is not a proven snapshot
  index-repair API, despite the catalog error hint: archived
  `stamp/R/rebuild.R:274-277,307-332,420-460,1138-1194` and
  `stamp/R/version_store.R:1568` (H:71-73).
- `st_restore` reads a selected snapshot then calls `st_save`; it is not pointer
  promotion. It can overwrite main, create history or apply retention, does not
  automatically replay historical provenance, and an unchanged save can fail
  when current selected retention is missing: archived
  `stamp/R/IO_core.R:1032-1083,410-417,1429-1438` (H:74-78).
- No dedicated supported non-destructive reconciliation export was found in the
  prior bounded inspection of `stamp/NAMESPACE:4-42`. The documented catalog
  deletion loses history; an unspecified maintainer migration is not a proven
  method (`stamp/vignettes/stamp-directory.Rmd:713-739`; H:79-82). This is a
  bounded negative finding, not proof that no future supported method can exist.
- Upsert captures incoming `new_vid` before assignment; a first-save-pointer bug
  is not established (`stamp/R/version_store.R:834-874`; H:59-62). Main/sidecar
  writes precede snapshot/catalog publication (`stamp/R/IO_core.R:419-531`),
  and retention deletes files before publishing catalog changes
  (`stamp/R/retention.R:344-352,375-431`) while protecting chronological newest
  (`:186-214`). These expose possible interruption windows, NOT the observed
  historical cause (H:63-70). Historical writer, interruption and retention
  events remain UNKNOWN.
- `st_catalog_query` follows artifact pointers; `st_latest` sorts version rows.
  Neither repairs the pointer (`stamp/R/version_store.R:302-337,1546-1568`;
  H:69-70). A differing "latest" interpretation supplies no release authority.

No blind promotion, catalog deletion, pruning, manual serialized edits,
`st_rebuild`, `st_restore`, producer refresh or shared writes occurred here or
are recommended as a safe repair. Producer updates are not read-only probes;
GDP's existing publish-then-read cycle conflicts with the Decided no-GitHub-copy
input rule, already reported, not changed (A:39-79; SYSTEM_DESIGN.md:100).

## Changes
Only this fresh `decision-dossier.md` is owned and written by this worker.
No scripts, other reports, source, Plan, rules, roadmap, package or Git changes;
no shell, R, packages, network/shared access, installs, downloads or new sessions.
The coordinator owns local runtime/scripts/tests, integration and other reports.
All manual output is this E:-checkout artifact. No raw conversations, credentials
or production payloads are retained.

Minimal first: this is the smallest cited dossier, not an implementation Plan,
framework or user execution prompt. No dependencies or new safeguards were added;
irreversible history/release harm justifies the explicit authority/method gates.
Later: broader hardening or a recovery API would require separate evidence and
scope; no such work is started or presumed necessary from these observations.

## Coordinator integration: actual local diagnostic
Coordinator independently verified main and HEAD
`e9c71e3190f1ce88a017ae25af7c373a64c655a2` at run startup; the worker did not run
Git. `preparation.json` records the private-R-home copy and one copied audit-line
adaptation. Original runtime and contributed packages remain untouched.

Executed in copied private R4.5.2, original contributed library, stamp
`95890411e8bf9db842593c2b0ab68ec4f2a66b25`. Current stamp receipt/archive/installed
metadata and 107 dependency descriptions verified before namespace loading;
first-1-namespaces.tsv and second-1-namespaces.tsv record actual origins. No
unrelated PIP packages loaded and no shared calls made.

| Check | Actual result | Evidence under this run |
|---|---|---|
| Red baseline | Independent verifier rejects missing receipt before creator; no store initialized | red-1.log |
| Two changed public synthetic RDS saves | PASS; returned 8bc28cc289f49d51 then 6fee99c874dfb800; catalog selects second | save-trace-1.tsv; first-1.log:13-21 |
| First/current/second payload and sidecar content hashes | PASS against independently defined inputs | first-1.log:22-29 |
| Fresh R process repeats exact checks | PASS, creator PID17712 versus reader PID17200 | second-1.log:2-7,17-27 |
| Timestamp/ID latest semantics | PASS; no timestamp tie in this run | first-1.log:29-30; second-1.log:27-28 |

Both real diagnostic child exits were zero. PowerShell labels informational
stamp options messages on stderr as NativeCommandError; retained logs preserve
that wrapper formatting, but the messages are options updates, not an R failure.
The red missing-result failure is intentional verifier evidence, not a package bug.

This proves only the tested fresh RDS/two-save/infinite-retention public path.
It did not reproduce the shared mismatch. It does not rule out historical or
format/path/failure/retention/concurrency-specific causes, prove QS2 auxiliary
payload acceptance, recover missing snapshots or authorize different versions.
The six real-data matrix rows and their NOT RUN/UNKNOWN fields remain unchanged.

## Checks run
- PASS, document reconciliation: checked all six selected/candidate ID pairs and
  selected-file absence/candidate-file existence against L:2-42 and E:64-85;
  matched each public error row against E:130-144. Preserved the distinction
  between metadata agreement and public payload acceptance in every row.
- PASS, scope/evidence check: read P revision 2, E, C, U, A and H; retained full
  inherited source SHAs and source-versus-observed-versus-user-reported labels.
  No new package inspection or source-level verification is claimed.
- Worker cutoff: local diagnostics were not supplied during worker research.
  Coordinator integration above now records their actual PASS with direct logs;
  no result is inferred from old unit tests or planning-stage review.
- Interpretation gate for later integration: a local PASS would mean only that
  this controlled current-package diagnostic did not reproduce historical
  divergence, not that shared snapshots are repaired or historical cause known
  (P:84-89). A failed required package invariant remains FAIL and blocks;
  dependent checks must stay NOT RUN, without weakening assertions (P:141-151).
- **NOT RUN here:** public candidate payload/sidecar/hash acceptance; replay of
  user public failures; shared recovery, any pipeline/Qmd execution; formal
  route-aware execution review and light `mode:verify`. Coordinator integrates
  those required local review records separately (P:90-96,123-128); this dossier
  is not a substitute or overall V1-V4 completion certification.

## Gaps
- Local diagnostic and all eight execution reviews plus final light verification
  now passed in coordinator integration. Linked records:
  `.cg-docs/reviews/2026-11-17-auxiliary-version-retention-diagnostic-review.md` and
  `.cg-docs/reviews/2026-11-17-auxiliary-version-retention-diagnostic-verify-review.md`.
  This closes the local diagnosis Plan only, not shared public-processing readiness.
- Intended authoritative versions, cause, historical writer/retention events,
  backup existence/provenance, complete lineage and freshness remain UNKNOWN.
- Candidate snapshot-file existence and main-sidecar metadata agreement do not
  prove candidate historical-sidecar availability, exact public payload/hash
  acceptance, numerical correctness or consumer/release suitability.
- Public failures remain user-reported; no independent replay or new live-store
  observation was made. All filesystem findings are historical inspection scope.
- No proven automatic safe repair API or approved history-preserving procedure;
  no version-selection/shared-mutation authority. Those are later explicit gates,
  not an obstacle requiring user action to finish this evidence record.
