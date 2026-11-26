---
schema: pip-handoff-v2
project: pipsystem
task: retained-candidate-validation
run: 20261117T171652Z-readonly
status: blocked
updated: 2026-11-17T18:49:30Z
owner: Code prepares; user executes in initialized R session
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: null
next: Use the approved user-run clean-process launcher at ../20261117T192911Z-clean-context/handoff.md; keep original R session open and probe unchanged.
---

# Retained-candidate read-only validation

## Summary
User approved the recommended candidate-validation route. Probe preparation only
in this turn; live reads must use the user's existing initialized R session.
No shared write, catalog change, producer, installation, Git mutation or release
version-selection authorization. No backup source was supplied.

## Changes
This report, probe.R, static-check logs and reviewer handoff; scratch check.R
under `.tmp/retained-candidate-validation/20261117T171652Z-readonly/`. No existing
package, Qmd, rule, roadmap, completed diagnostic or runtime artifact is edited.

## Checks run
- Existing main/full HEAD above verified read-only.
- Pinned source root: `.tmp/one-survey/qmd-acceptance-20261113/sources/`.
  pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5`:
  R/pip_read-write.R:63-106,119-134 reads exact metadata/payload, no st_init call.
  stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`:
  R/version_store.R:523-608 reads snapshots; R/hashing.R:193-278 exposes direct
  content hashing. Hash raw public payload before any projection conversion;
  never strip attributes or rewrite metadata to make a hash match.
- pipfun `7d534516a8c17c33d537681610eccd4c29211762`:
  R/working_release.R:315-329 assigns active descriptor into caller memory only.
- pipdata `53a76e379c81a3ac70b39925954981ae6a691459`:
  R/dependency_inputs.R:183-236,257-317,331-373 and R/pd_aux_attr.R:135-178,195-216
  establish PFW/domain/projection requirements. Probe checks bounded national
  target coverage, not private pipeline helpers or full processing acceptance.
- probe.R finalized: requires existing reader namespaces and private library
  first, checks actual reader/import origins, existing release/TEST/PPP2021 and
  aux alias. No library switching, namespace unloading, initialization or reset.
  Lazy helper packages must resolve privately; actual secretbase origin checked
  after hashing. Required R version4.5.2 matches hash-serialization context.
- static-check-3.log: eight checks PASS, parser exit0. Parsed complete source;
  no explicit writers/initializers/repair/system/patch calls; inert inserted-save
  AST control detected; exact six pins and metadata/payload reads verified;
  raw public hash precedes projection copies. The local cold-session guard was
  actually called in a base-only environment and stopped before reader/alias
  access. No live reader namespaces loaded, no candidate/shared call executed.
- Static checks used installed system R4.5.2 base only, not an ambient contributed
  fallback or live acceptance runtime. C: executable/profile read only; process
  temp/home/cache/log outputs redirected to the new E: run. No old private-run
  startup audit was invoked or appended.
- Static cg-testing review plus final guard-only verification: no supported
  P0/P1/P2/P3 issues, suppressions or deferrals. Report review/handoff.md preserves
  earlier cutoffs and final-source addendum. Reviewer executed no R/network/shared
  operation. These findings do not certify actual user-session/live compatibility.

## User-session execution and interpretation
Run only probe.R in the same R session that performed the successful shared
setup and earlier metadata-only probe. Do not start a fresh R process or rerun
setup as part of this read-only step. The script resets only its own previous
result and restores logging/verbosity options after completion.

Return retained_candidate_results (printed automatically) and warnings/errors.
Columns separate catalog membership, historical metadata readability, exact
payload readability, content-hash agreement and bounded target coverage. A
failure marks its actual stage FAIL; dependent stages stay NOT RUN. If PFW
national domains are not verified, other candidates can still report read/hash
results but their target projections remain NOT RUN. Subnational checks are not
silently guessed. Stop on a context/origin guard; do not auto-install/unload/reset.

Hash means direct public payload content_hash agreement with both historical
sidecar and exact catalog version row, before any table copy/filter. No default
PPP filtering, attribute stripping or guessed normalization. No raw payload rows
or numerical values are printed/saved. PPP2021 variants are checked, not chosen.
Even all PASS does not promote a candidate, establish release authority, prove
complete lineage, fix the catalog or certify full pipeline processing.

Minimal first: one bounded public reader plus static safety/control-flow checks;
installed tools, no added dependency/framework/CI or speculative recovery method.

## Gaps
- No live candidate metadata/payload/hash or projection result yet; all NOT RUN.
- Candidate authority, historical cause, backups and supported reconciliation
  method remain UNKNOWN. Successful reads will not promote candidates.
- No current external package checkout inspected; SHAs above identify the checked
  source archives, not a new source-install/provenance certification.

## User-run guard result — 2026-11-17T18:47:30Z
User reported an actual preflight failure before catalog/candidate reads:
`Namespace origin mismatch: data.table`.
Expected:
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/library/data.table`.
Actual loaded namespace:
`E:/PovcalNet/01.personal/wb384996/R/win-library/4.5/data.table`.
No candidate metadata/payload/hash/projection ran; all remain NOT RUN, not six
candidate FAIL results. This demonstrates a session provenance mismatch, not
candidate corruption or a proven version difference. Do not relax the guard.

Changing .libPaths does not replace a namespace already loaded. Do not force
unload a package used by active imports. A separate fresh R process preserves
the user's existing session/work and can select the private library at startup.

Context-bootstrap boundary: pinned stamp/R/IO_core.R:110-121 ensures .stamp,
.stamp/temp and .stamp/logs then registers aliases in memory. It is not an
unconditional read-only attach API. Fresh pipfun working context likewise needs
its public setup route; do not patch private environments or fabricate release
rows. Re-establishing this context can assure/create shared directories and is
outside the last probe's no-initialization boundary. Seek a narrow explicit
user-run context-setup authorization before providing that execution path.
No clean-process setup or original-session change was made in this turn.

## Authorized continuation
User subsequently approved `Approve clean-process setup (Recommended)` via the
question tool, covering a separate user-run private-first process and public
context re-establishment with possible support-directory assurance only. No data
save/producer/catalog selection/repair/install authorization. Fresh preparation
and local-only proof are recorded at
`../20261117T192911Z-clean-context/handoff.md`. This original probe stays immutable;
do not rerun it in the known contaminated original session. Existing R work is
preserved; the new launcher uses a separate R process. Shared/live results remain
NOT RUN until the user invokes the explicitly named live switch.
