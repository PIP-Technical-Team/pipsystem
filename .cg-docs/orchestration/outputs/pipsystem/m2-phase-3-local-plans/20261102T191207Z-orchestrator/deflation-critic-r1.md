---
schema: pip-handoff-v2
project: pipsystem
task: m2-phase-3-local-plans
run: 20261102T191207Z-orchestrator
status: completed
updated: 2026-11-02T19:21:53Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: UNKNOWN
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-02-m2-deflate-one-survey.md revision 1
next: Coordinator considers the bounded Plan acceptance correction; execution remains blocked pending explicit decisions and authorization.
---

# Deflation revision 1 Plan review

## Summary
Reviewed the FULL saved revision 1 Plan (100 lines), governing design/charter and relevant umbrella Step 7/E7/D1-D8/local-handoff requirements against exact local Git objects. Findings: **0 P1, 1 P2, 0 P3**. The remaining issue is a conditional local population test obligation, not the already documented lack of execution approval or a demand for future production safeguards.

The Plan is otherwise appropriately bounded to one real deflation/storage path. No implementation, R execution, tests, source loads, installs, generator, network/shared-system access or Git mutation occurred.

## Findings

- **[P2.1] [cg-plan-critic] Step 1 / V2: `2026-11-02-m2-deflate-one-survey.md:55-56,75` — Do not make the required population-only local regression disappear with the primary-fixture choice.**
  **Issue**: Step 1 makes population work conditional on D3 choosing adjustment for the primary input; V2 correspondingly requires only “applicable population-only weight sensitivity.” There is no explicit separate population-on control when the primary fixture uses national/unadjusted weights. This allows the local gate to pass without the population-only mutation case required by the controlling Step 7.
  **Evidence**: Umbrella `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:338-340` explicitly includes “population-only weight change with identical welfare” and actual transformation/storage with population-weight provenance. At pipdata object `f06acb9c557aa1866bab965ffdfe86af22a636fe`, `R/pd_deflation.R:449-458` never enters adjustment for a national pop-data level; `:1036-1078` contains the distinct area aggregation/matching/reweighting path. Existing `tests/testthat/test-pd-deflation.R:731-752` checks the adjustment attribute, not a population-only change across two pinned executions or saved final-weight provenance. Existing `test-adjust-population.R:40-101` checks individual legacy-table arithmetic, not that end-to-end mutation. Thus simply retaining the existing tests does not fill the local obligation.
  **Impact**: A permitted D3 “primary input does not need population adjustment” answer could remove the only numerical/provenance check of the weight-changing route while still allowing V2/V3 completion. That would under-deliver the umbrella's local Step 7 gate; this is separate from later mean or full-skeleton selectivity tests.
  **Fix**: Add one sentence binding a small approved synthetic population-on control regardless of the primary-fixture choice: change only a pinned area population, execute the actual deflation/storage path, and assert unchanged PPP/LCU welfare, exact changed aligned final weights and matching population/rule provenance on readback. D3 still approves this control's matching/weight policy and supplied synthetic pins before execution. Reuse the existing proposed test files; no population producer, mean calculation, release, selective scheduler or additional infrastructure is needed.

## Documented execution blockers — not additional Plan findings

- **Canonical versus feature base**: canonical pipdata is `PROD` at `7f4a98471d9c2350c3537fcae8448856896cd9f9`; local `origin/PROD` is `f06acb9c557aa1866bab965ffdfe86af22a636fe`. Only the canonical worktree is registered. The Plan acknowledges the missing former feature worktree and requires D8 to select/authorize the execution base (`:23,27,37,89`). It does not pretend canonical PROD contains Phase 2. This is a correctly documented blocker, not an unacknowledged source assumption.
- **Scientific inputs**: D1-D3 explicitly leave fixture selection, annual-LCU/source pins, selected PPP vintages, independent domains, currency/spatial evidence, invalid-input policy and population matching unresolved (`:34-36`). No ccf multiplication or real-survey approval is inferred. Those decisions are blockers rather than review defects.
- **Recipe admission and fingerprints**: the current engine rejects real qualified/data.table/S3 calculation calls (`R/code_fingerprint.R:189-327,356-419` at the candidate object). The Plan explicitly recognizes that incompatibility, gates the narrow contract under D8, includes fingerprint/entry-point edits and requires callback/helper/constant/external arithmetic proof (`:37,58-63`). It does not claim the existing generic engine tests prove numerical deflation.
- **Storage and test safety**: one initialized E store, public exact-version reads, actual numerical payload/same-version metadata round trips and invalid no-save are explicit (`:62-66`). `R/dependency_plan.R:342-361,404-431` confirms the one-root restriction. The safe full-suite command/substitute is intentionally unresolved and blocks before implementation, not merely at completion (`:66,86,89`). No command was run to resolve it during this review.

## Other requested review checks

- **Minimal end-to-end scope**: two sequential steps reuse the existing clean/domain/core and stamp-authoritative recipe path; no scheduler, selective cache, mean, assembly or release work is included (`Plan:49-63,95-98`). No significant overengineering found.
- **Compatibility/LCU**: internal M2-only names preserve public naming/signatures, retain aligned LCU welfare and forbid repeated annual conversion (`:54-56,63,82`). Source `R/pd_dlw_clean.R:203-205` confirms prior division by 365; `R/pd_deflation.R:460-466,520-554` confirms why M2 adaptation must be internal rather than globally changing legacy output. The Plan explicitly requires compatibility checks.
- **Known fingerprint coverage**: Plan `:62-63` includes the omitted `get_welfare_ppp` callback, reused attribute/domain helpers/constants and external arithmetic, with relevant-mutation/unrelated-edit checks. Source `.PD_FINGERPRINT_COMPONENTS` at `R/code_fingerprint.R:22-37` and actual callback at `R/pd_deflation.R:892,907-928` support this requirement. No general dependency-discovery framework is requested.
- **Real storage**: `test-m2-engine-authority.R` currently demonstrates real storage of simple generic values, not real deflation. Plan `:63,70,76` explicitly requires the actual numerical worker and pinned payload/metadata readback, so that existing limitation is acknowledged and assigned work.
- **Exact future scopes and shared files**: the two step file sets and conditional generated docs are bounded; lifecycle artifacts are proposed, not authorized. Additional file needs stop for declared D8 revision. One pipdata owner finishes before mean-save touches shared engine/fingerprint/test files (`:52,60,84,89`). No hidden branch operation is authorized.
- **Approximately two-page length**: the Plan is a compact 100-line, two-step document linking the larger readiness evidence rather than reproducing it. Its long table/bullet lines are dense; exact printed pagination is UNKNOWN without rendering. This is not a substantive Plan defect, and no expansion into a large implementation specification is recommended.

## Changes
Only this exact review report was created and updated. Plan/code/config/other outputs unchanged by this reviewer; no commits.

## Checks run
- Read the full saved revision 1 Plan; pipsystem charter Objective/Constraints/Current Focus verbatim; SYSTEM_DESIGN; HARVEST_BRIEF; handoff contract; review command and context-loading instructions; relevant umbrella sections and readiness evidence. User-supplied pipdata charter text was used as context, not permission.
- Read-only Git: canonical `rev-parse HEAD`, branch, `origin/PROD`; candidate-versus-inspected-feature source diff; canonical-versus-candidate changed-file list; worktree list; canonical status. `git diff --stat 57006c2f39fc6f3e03413515ee941d122e44c6dd f06acb9c557aa1866bab965ffdfe86af22a636fe -- R/pd_deflation.R R/pd_aux_attr.R R/code_fingerprint.R R/dependency_inputs.R R/pd_run_pipeline.R` returned no delta, verifying the Plan's specific source-equivalence assertion.
- Exact-object reads via `git show f06acb9c557aa1866bab965ffdfe86af22a636fe:<path>`: deflation, auxiliary attributes, dependency inputs/planning, fingerprints, public pipeline engine; population/deflation/engine/API test files; targeted clean-unit/validation code. No absent worktree was used and no source was loaded.
- Repository identities actually read: **pipsystem HEAD `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`** (governing working-tree documents); **pipdata canonical HEAD `7f4a98471d9c2350c3537fcae8448856896cd9f9`**, candidate object **`f06acb9c557aa1866bab965ffdfe86af22a636fe`**, and source-equivalence comparison object **`57006c2f39fc6f3e03413515ee941d122e44c6dd`**. No other package repository was directly read; dependency SHAs in the Plan/readiness report remain attributed documentary candidates, not fresh inspected/tested builds.
- No R, tests, installed artifact validator, source loads, installs or generators run. The user-reported artifact-validation pass was not rerun and is not numerical evidence. Shell commands were read-only Git/clock queries, with no write-capable child process or redirected temporary output. The only intentional file write is this E-path report through apply_patch.

## Gaps
- Execution remains blocked: D1-D3/D8, tested producer/loaded-byte pins, approved adapter surface, safe suite/substitute and execution owner/base are unresolved, as the Plan states. Review completion does not resolve them or authorize implementation.
- This review does not execute numerical/storage/population checks or certify runtime containment, dependency APIs, production equivalence, live DLW, network storage or full M2 T1-T12. Those limitations must not be presented as additional undisclosed Plan flaws.
- Exact rendered page count and actual runtime package identities are UNKNOWN. No changes to protected design, scientific decisions, scope or Git history were proposed as implied approvals.
