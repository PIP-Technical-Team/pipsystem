---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T222600Z-learnings
status: completed
updated: 2026-11-09T22:26:27Z
owner: learnings
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Coordinator consumes historical lessons during the already authorized implementation and final verification.
---

# Installed-package one-survey historical learnings review

## Summary
Research-only review completed. Scope: installed-package isolation, exact snapshot provenance, offline fixture transport, row-aligned weights, saved-version metadata, invalid classification. No unfinished implementation was read or executed. No supported current P0-P3 defect was identified: implementation/runtime correctness was deliberately not assessed. The lessons below are advisory historical/static evidence, not current package findings or proof of a passing run.

## Changes
Only this handoff report. No package writes, implementation changes, Git mutations, dependency installation or runtime execution. No recommendations to delete, replace, rename or move protected knowledge/project paths.

## Related Learnings

### Directly Relevant

1. **Isolation includes load hooks and fixture helpers, not only `.libPaths()`.** Source: `.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md:182-190,198`. Historical inspection found pipdata load-time logging/cache behavior, manifest/store fixtures, configured pipload roots and helper evaluation across test files even with filtered tests. **Key takeaway:** inspect actual loaded hooks and redirect child temp/home/cache/log/storage before loading packages; do not reuse the internal test-helper environment as proof of containment. Current Plan already requires this (`.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md:38-41`). Classification: advisory; no current defect established.

2. **Observed source SHA is not installed-package provenance.** Source: `.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md:55-65,80` explicitly separates source pins from installed/tested dependencies and documents a conflicting historical SHA triplet. `.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md:17-29,63-64,70-71` distinguishes canonical pipload from its linked adapter, and warns that old runner library/branch/store bindings cannot be reused unchanged. **Key takeaway:** bind clean snapshots to newly installed package paths/versions and actual loaded identities; branch labels and historical runner passes are not sufficient. Classification: advisory.

3. **Preserve literal row correspondence and weight meaning.** Source: `.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md:40-44,56-59`. Accepted synthetic clean rows are daily LCU welfare `1,2,3,4`, person weights `10,20,30,40`, areas `urban,rural,urban,rural`; do not divide clean welfare by 365 again or multiply person weights by household size. **Key takeaway:** compare complete aligned expected rows, not separately sorted welfare and weight vectors. The population-adjusted controls in that historical record are a different stage and must not be added to this example. Classification: advisory.

4. **Data and metadata require their actual saved pins; current metadata is not historical metadata.** Source: `.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md:54-68`; `.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md:44,75,77,139-140`. Older inspection found current-only sidecar readers, metadata-only save gaps and separate QS2 metadata artifacts. The October 13 contract is explicitly proposed (`:130`), not proof of implemented API support. **Key takeaway:** use actual returned saved-version IDs for both artifacts and report an unsupported read boundary rather than falling back to latest or constructing private paths. Do not carry the old API limitation forward as a current bug without fresh evidence. One-version readback does not establish historical selection after a later save (current Plan `:60-61`). Classification: advisory.

5. **Offline synthetic success remains synthetic; preserve real upstream execution and disclose substitutes.** Source: `.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md:15-17,38-44,82-83`; `.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md:188,228`. Historical worker-reported acceptance is not live DLW proof, and manufactured snapshot layouts do not establish actual storage integration. **Key takeaway:** reuse fixture values, execute the documented current validation/clean/storage route, record fresh pins, and identify exactly which external transport is replaced. No specific prior offline-transport recipe was found in the searched sources; the current Plan `:46-50` is controlling rather than an inferred historical implementation. Classification: advisory.

### Potentially Related

6. **Failure, missing proof and reusable success are distinct states.** Source: `.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md:42,136-138`; `.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md:59,68`. These concern generic execution and post-clean deflation, respectively; they do not establish raw missing-weight classification behavior. **Key takeaway:** for this review, use the current Plan's narrower explicit requirement (`:47,87-88`): fresh malformed identity/checksum, completed invalid classification plus missing-weight diagnostic, and no data/metadata outputs. An exception, no-work or absent output alone is not proof of invalid classification. No directly relevant historical missing-weight classification solution was found. Classification: advisory; no speculative finding.

### Patterns to Follow
- Smallest useful example, one independent valid oracle and one malformed control; actual public boundaries and receipts, not another framework.
- Preserve independent fixture expectations, row identity and units; distinguish source, installed and executed evidence.
- Apply current E-only rules. October 13 `:198` proposes C: scratch paths: those historical paths conflict with current instructions and must not be reused. November 4 `:34,64` and the approved current Plan require E-only runtime.

### Anti-Patterns to Avoid
- Treating old static gaps as current runtime bugs or a previous pass as current proof.
- Treating filtered tests, environment variables alone or fabricated snapshot layouts as isolation/integration proof.
- Copying old artifact IDs, replacing historical metadata with latest, independently sorting aligned vectors, or converting an execution error into an invalid-input pass.

### No Relevant Learnings Found
No solution files were returned under `.cg-docs/solutions/`. No directly relevant prior recipe for offline transport substitution or completed raw missing-weight invalid classification was found in the selected brainstorms. Relevant lessons above come from historical brainstorms only.

## Checks run
- Read `compound-gpid.md:10-40`, `compound-gpid.local.md:1-28`, design usage rules `SYSTEM_DESIGN.md:5-28`, harvest evidence rules `HARVEST_BRIEF.md:1-15`, approved Plan revision 1 and `CONTRACT.md:34-76`.
- Loaded communication, brain-query and R technical/analytical skills; read `.kilo/shared/context-loading.contract.md`. No tactical-context/Brain dump.
- Tier 1/2: direct reads reported missing DIGEST.md and search-index.json. BRAIN.md glob returned no files. Tier 3: solution glob/content search returned no files; targeted brainstorm regex search and selected cited passages returned the historical lessons above.
- `cg-index` availability check found a C: launcher. It was not invoked: bounded direct historical retrieval already supplied sufficient signal, and its indirect-write paths were not established under this report-only scope. No team-brain pull or index generation was attempted.
- Read-only Git returned branch `main` and HEAD `f9454707b292a620e25abef17f2e515794020ba7`. No package repository was directly read, so no new package-source SHA observations are claimed.
- Historical package identities remain attributed to the records, not refreshed runtime pins: October 13 stamp `ad9a483b6261166a6feefc64baea5d602198977b`, pipdata `84442e979c98d33fa5565ab9e56d3179cc7d5278`, pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6` (`:55-63`); November 4 pipdata `5680d7848dccb5fb2563129bbcd25809093d52bd`, canonical pipload same as October, linked adapter `4ef0d90a974cb6ff0725da69373bde421dd04ad5`, stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25` (`:19-27`).
- Sent material historical lessons and E-only conflict warning to coordinator through the shared board. No runtime/tests or current implementation review performed, by assignment.

## Gaps
- Current installed package identities, isolation, transport substitution, row alignment, saved-version readback and malformed classification remain UNKNOWN to this reviewer. The implementation/runtime reviewers own these checks.
- Historical source/test claims were not independently revalidated against package repositories. Source pins above identify the historical evidence only; newer package behavior may differ.
- DIGEST.md, search-index.json, BRAIN.md and solution files were not available through this checkout's reads/searches. A historical brainstorm references a former solution (`2026-10-13-m2-stamp-contracts.md:88`); it was not recovered and is not treated as inspected evidence.
- No current P0-P3 safe_auto/manual correction is supported by this non-overlapping research scope. Advisory lessons do not constitute a runtime pass or authorize broader changes.
