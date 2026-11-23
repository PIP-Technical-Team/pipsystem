---
schema: pip-handoff-v2
project: pipsystem
task: aux-reconciliation-proposal
run: 20261117T223822Z/stamp-research
status: completed
updated: 2026-11-17T22:43:45Z
owner: explore researcher; coordinator persisted source research
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: null
next: Apply actual latest-equals-candidate facts before defining minimum installed-pin capability gap.
---

# Checked stamp selection and reconciliation boundaries

## Summary
Exact-version public reads are supported; no dedicated public history-preserving
catalog reconciliation export found at checked stamp pin. Three meanings remain
distinct: unversioned main bytes, catalog artifact pointer and chronological
st_latest. General activation of an older pin would need more than pointer repair;
that is NOT yet established necessary for this concrete six-artifact case.

## Changes
Source research only. Worker no R/tests/Git/shell/network/shared/credentials or
file writes. Coordinator persists this summary, not raw worker conversation.

## Checks run
S = `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources/stamp`,
SHA95890411e8bf9db842593c2b0ab68ec4f2a66b25 (pins.tsv:2). Installed
library/stamp/NAMESPACE exports match checked source; installed DESCRIPTION
records0.1.0, November13 build. Serialized installed namespace not introspected.

| Public API | Actual selection / limit |
|---|---|
| st_versions(path,alias=NULL) | Sorts saved time/ID; returned view drops invalid timestamps; no retention test. R/version_store.R:230-303 |
| st_latest(path,alias=NULL) | First st_versions row, ignores artifact pointer; no retained-payload validation. :330-337 |
| st_catalog_query(alias=NULL) | Pointer join, catalog-row integrity, no snapshot-availability check. :1519-1569 |
| st_load(file,format=NULL,version=NULL,verbose=TRUE,alias=NULL,...) | Exact ID checks history and snapshot; NULL reads main. R/IO_core.R:630-719; version_store.R:396-421 |
| st_load_version(path,version_id,verbose=TRUE,...,alias=NULL) | Exact retained payload/recorded format; legacy recovery not full execution proof. version_store.R:469-608 |
| st_read_sidecar(rel_path,alias=NULL,version_id=NULL) | Exact row, payload and required historical sidecar; no current fallback. format_registry.R:454-529 |
| st_restore(file,version="oldest",verbose=TRUE,alias=NULL,...) | Reads then st_save; may replace main/create version/prune/skip; not pointer promotion. IO_core.R:1032-1083 |
| st_rebuild(plan,rebuild_fun=NULL,dry_run=FALSE) | Executes builders and saves results; not index reconstruction. rebuild.R:274-277,307-332,420-460 |
| st_switch(alias) | Alias/state switch, not artifact-version selection. IO_core.R:942-956 |

No st_ensure/st_migrate/reconciliation export in checked or installed
NAMESPACE:4-42, relevant R/man/vignettes. Directory troubleshooting offers
history-losing deletion/recreation or unspecified maintainer migration
(vignettes/stamp-directory.Rmd:713-739), not a supported safe recipe.

### Coupled selection warning and actual-case refinement
Unchanged-save validation uses st_latest (IO_core.R:1429-1438); pointer edits
alone cannot select an older version if a newer version row remains. Existing
test-audit-versions.R:54-80 demonstrates stale pointer versus chronological latest.
That hypothetical is not a reason to redesign st_latest for the actual case:
coordinator's fresh baseline-ranking.tsv now shows each desired candidate is
ALREADY unique chronological latest and latest retained. A narrow repair-to-
latest may therefore align these views without changing their contracts, provided
main/snapshot/current-sidecar integrity and expected prestate are separately proved.
Researcher addendum requested to verify that narrower conclusion.

## Researcher refinement after actual ranking
The source researcher confirmed that a general active-reference redesign is NOT
needed here. Because each approved candidate already equals unique chronological
latest, correcting only the stale artifact pointer could align query/latest/main
without changing st_latest, reordering history or inventing new selection state.
This is conditional, not a supported existing repair API or proof that main is
currently coherent. Source: version_store.R:302-303,330-337,1546-1568;
test-audit-versions.R:54-80. No additional execution or source change.

Minimum proposed capability is restricted to one artifact/exact supplied ID that
already equals unique chronological latest. Other artifact metadata/count/format,
current main/required-sidecar bytes and original proof must already match;
otherwise stop rather than expand repair scope. Preserve every non-pointer
field/history row/snapshot/parent/timestamp/execution record. Already-correct
state is unchanged no-op; failed prerequisites do not partially activate.
Fresh main/provenance proof, approved implementation and separate shared-mutation
authority remain later gates. No dataset-baseline or PPP-vintage choice added.

### Gates for any future no-payload-rewrite repair
Exact alias/path/candidate row; required retained payload/sidecars and recorded
integrity; fresh main/candidate byte and required metadata/provenance agreement;
preserved parents/execution proof; coherent pointer/chronological/main meanings;
unchanged expected prestate under existing writer authority. No code/parent
provenance invented or successful-execution receipt fabricated. Internal source
validators are evidence only, not an external private-API workaround
(R/execution_state.R:345-394,418-431).
Already coherent state must be no-op; mismatch/ambiguity must stop. No new version,
data rewrite, timestamp change, history row removal, retained-sidecar mutation,
builder/producer or retention. If current metadata replacement is needed, it is
not pointer-only and needs a separately defined scope.

## Gaps
No proven public repair operation at the checked pin, no runtime test of any
proposed capability, no implementation or mutation approval. Current checkout
not inspected. Main/candidate byte/provenance equality not freshly tested;
historical main-sidecar agreement is insufficient for a future no-op guarantee.
Historical cause/backups unknown. Base PPP2021 does not select an adaptation.
