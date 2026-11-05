---
schema: pip-handoff-v2
project: pipsystem
task: m2-phase-3-readiness
run: 20261102T135331Z-orchestrator
status: completed
updated: 2026-11-02T14:08:20Z
owner: pipdata-readiness-research
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: feat/m2-one-survey-acquire-format
head: 57006c2f39fc6f3e03413515ee941d122e44c6dd
plan: NONE (research only)
next: Coordinator consolidates findings; implementation remains gated by the decisions and execution-safety requirements below.
---

# pipdata Phase 3 Readiness

## Summary
Research complete. The managed feature worktree matches the user pin and is clean. Phase 3 implementation is not ready: scientific contracts, recipe integration, dependency binding and a safe full-suite/substitute gate remain unresolved. Exact proposed deflation and separate sequential mean-save work sets are below. No package/local Plan changes or R execution occurred.

## Changes
Only this requested evidence report. No package writes or local Plans.

## Checks run
Read-only git status, references, worktree list, parent log, merge-base, merged-branch list and source/document inspection. No R code or tests executed.

## Checkpoint Findings
- Feature HEAD `57006c2f39fc6f3e03413515ee941d122e44c6dd` has direct parent PROD `7f4a98471d9c2350c3537fcae8448856896cd9f9`; `rev-list --left-right --count PROD...feat/m2-one-survey-acquire-format` returned `0 1`.
- At feature HEAD, `R/pd_deflation.R:907-928` delegates `welfare_lcu / ppp / cpi` to wbpip and emits `welfare_ppp_YEAR_RELEASE_ADAPT`, not target `welfare_YYYY`. `R/pd_aux_attr.R:189-203` retains only CPI/PPP values, not `ccf`.
- `R/code_fingerprint.R:189-237,253-280,356-419` rejects the package-qualified/S3/classed operations used by existing data.table deflation and future pipster/collapse mean. Existing recipe support is not a working production-calculation adapter.
- Historical Phase 2 report passes are not executions in this research. Historical engine runner is three-file selected coverage, not a full-suite gate, and copies canonical checkout rather than the managed feature worktree (`pipdata-m2-engine-runtime/runner/run.ps1:12,289-329`).

## Evidence Keys And Scope

All package-relative citations below use these freshly observed HEADs unless a different source identity is explicitly stated. A HEAD establishes inspected source identity, not installed-package identity or a tested commit.

| Key | Root / SHA |
|---|---|
| P | `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.kilo/worktrees/m2-phase-2-steps-5-and-6` at `57006c2f39fc6f3e03413515ee941d122e44c6dd` |
| B | canonical `pipdata` at `7f4a98471d9c2350c3537fcae8448856896cd9f9` |
| H | `pipsystem` at `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`; current governing files read from working tree |
| W | canonical `wbpip` at `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; only arithmetic source read |
| A | canonical `pipaux` at `27c5a3c8eab8ddcabb032d620af6a1f76e62f444`; only upstream CPI source read |
| L | canonical `pipload` at `ff9a81e386a09fb2531c154f63fd2b91521313c6`; only DESCRIPTION read |
| S | existing `E:/PovcalNet/01.personal/wb384996/PIP/pipdata-m2-engine-runtime`; non-Git historical runtime/evidence, not a package HEAD |

Additional observed statuses: W is clean on `DEV`; A is `PROD` with untracked `.cg-docs/` and `compound-gpid.local.md`; L is `PROD` with modified `.gitignore` and untracked local Plan/review/config/session outputs. The inspected W arithmetic source, A CPI source and L DESCRIPTION had no porcelain modifications. No unrelated changes were touched.

Source inspection, inspected test assertions, saved historical execution logs, worker-reported results, and checks executed here are different evidence classes. Only read-only Git/document operations were executed here. No R process, package source, tests, installer, remote query, DLW, Y drive, production or shared-system access was run. No fetch, branch operation, commit, push, merge or worktree cleanup occurred. E-only report edits used apply_patch; no write-capable shell command was run.

## Repository And Rules

Observed read-only Git results:

| Observation | Result |
|---|---|
| Canonical branch / HEAD | `PROD`, `7f4a98471d9c2350c3537fcae8448856896cd9f9` |
| Canonical dirty status | Untracked `.cg-docs/plans/2026-10-30-m2-one-survey-acquire-format.md` and `.tmp/`; no other porcelain entries |
| Managed feature branch / HEAD | `feat/m2-one-survey-acquire-format`, exact expected `57006c2f39fc6f3e03413515ee941d122e44c6dd` |
| Feature dirty status | Clean porcelain; tracking label is `origin/feat/m2-one-survey-acquire-format` |
| Feature direct parent and merge base | Both `7f4a98471d9c2350c3537fcae8448856896cd9f9` |
| PROD versus feature count | `git rev-list --left-right --count PROD...feat/m2-one-survey-acquire-format` returned `0 1` |
| Integrated authority history | `57006c2 -> 7f4a984 -> 8cde5c5efd4ab87f419661221f202205e5e87214 -> 4728a2b2d2aadb43ce72ddf6c19732f75188a208 -> 36ea541fec38e8c38b58b00f029bfa644b32d4a6`; parent log observed |
| Branches merged into PROD | `DEV_v2`, `PROD`, `feat/m2-pipdata-authority`, `m2-phase-2-steps-5-and-6`; acquisition feature absent |
| Other exact branch refs | `DEV_v2=9d9955ba5b2ce6bd4673064b8c1226ad11ab35dc`; `dlw-check=f1f2166bb198cbb69fa853eb37e1120570e86279`; authority feature `8cde5c5efd4ab87f419661221f202205e5e87214`; local `m2-phase-2-steps-5-and-6=7f4a98471d9c2350c3537fcae8448856896cd9f9` |
| Worktrees | Canonical E checkout and managed E feature above; two registered historical detached C worktrees at `a55a089eb5acb0d3a850dac2628ca9daa0d64fc4` and `3ca225b1020587dbb6aa97f63904a6c32bf5ae20`, both marked prunable/nonexistent gitdir by Git. Neither accessed or pruned |

Local tracking refs are not fresh remote evidence; no fetch was authorized. `git diff --stat PROD feat/m2-one-survey-acquire-format` observes 21 committed changed files, including local Plan, review and work report. Historical handoff says uncommitted at base `7f4a984`; that was the October 30 state, not today's clean committed feature state (H `.cg-docs/orchestration/outputs/pipdata/m2-one-survey-acquire-format/20261030T163045Z-pipdata/handoff.md:9-19,45-48`).

Explicit ancestor reads found no `AGENTS.md` at `E:/`, `E:/PovcalNet`, `E:/PovcalNet/01.personal`, `E:/PovcalNet/01.personal/wb384996`, `.../PIP`, canonical pipdata, its `.kilo/worktrees`, or the managed feature root. Canonical pipdata `.kilo/AGENTS.md:1-24` was read; it supplies adapter paths. Managed-worktree `.kilo/AGENTS.md` is absent. Canonical and feature `compound-gpid.local.md` are absent. P `compound-gpid.md:10-24` describes package validation/cleaning and older pipeline-alignment focus; H `compound-gpid.md:35-40` supplies current cross-package M2 focus. H `AGENTS.md`, design and harvest brief control this research's read-only package boundary.

Branch-policy distinction: canonical `.kilo/skills/cg-skill-git-workflow/workflows/branching-strategy.md:3-6,38-64` is generic main/feature/PR guidance, whereas observed default/local baseline is PROD. Canonical `.kilo/commands/cg-plan.md:40-58` explicitly offers staying on the current branch and creates a branch only after acceptance. P prior engine Plan `.cg-docs/plans/2026-10-26-m2-pipdata-authority.md:49-67` requires a separately named E work branch operation for future implementation and records `origin/PROD`. Therefore no branch creation is inferred from planning. A future explicitly authorized Plan-only save can remain on the selected existing branch; implementation branch/base/ownership still need explicit scope. This research saves no local Plan and does not resolve branch choice by mutating PROD or the feature.

Brain query: P `.cg-docs/BRAIN.md:19` and matching `.cg-docs/BRAIN-01.md:270-279` point to older single-survey/batch-deflation Plans, consistent with existing transformation seams. Their completed status is not new M2 authority or a safe-test gate; the current design and freshly inspected engine supersede any inherited currentness implication. No Brain tool/process/cache or remote retrieval was run.

## Existing Interfaces To Reuse

| Interface | Verified source and implication |
|---|---|
| Explicit selection | P `R/pipdata_dlw_compare.R:1167-1289`: nine fields, one catalog row, parsed identity/master/harmonization/checksum checks; source `survey_id` remains distinct from clean module-bearing `pip_id`. Reuse; do not build a new selector or infer HIST/BIN policy |
| Acquire/validate | P `R/pipdata_get_gmd.R:1429-1489`: pinned catalog override and selected validation IDs; durable availability/checksum gate. It still loads server catalog and release state, so do not call it unmocked in offline research/tests |
| Clean eligibility / no-save boundary | P `R/dependency_execution.R:214-231`; `R/pd_process_data.R:226-260`: only valid/available one-row inputs, validation before metadata construction and saves |
| Clean schema | P `R/pd_dlw_clean.R:636-738`: nonempty classed data.table, finite double welfare/weights, nonnegative weights/positive total, scalar identity/domain attrs and required area values. This does not prove original welfare period/currency or scientific approval |
| PFW/domain resolver | P `R/dependency_inputs.R:183-237,257-317`; `R/pd_cpfw_merge.R:215-225`: exact included welfare mapping and separate measure levels (`national` or `area`), with existing CPI/PPP domain-variable restrictions. Reuse without expanding selection scope |
| Pinned transform | P `R/pd_deflation.R:338-363`: exact clean+metadata version reads/hash checks and direct core dispatch without public NA-on-error wrapper. Reuse core; verify class/attribute round trip at actual producer pins |
| Legacy save | P `R/save_pip.R:91-148`: catalog/version-verified local artifact receipt. It does not forward parents/code/semantic schema and is not an engine execution receipt. Do not use it as modern scheduling proof |
| Engine / modern save proof | P `R/pd_run_pipeline.R:295-408,418-439`; `R/dependency_plan.R:364-439`; `R/dependency_execution.R:65-185`: existing TEST recipes, explicit path/version parents, stamp requests/planner/rebuild, same-pin metadata and exact execution receipt checks. Reuse this authority, not legacy C2 currentness |
| Fingerprints | P `R/code_fingerprint.R:39-106,169-353`: canonical formals/bodies plus curated helpers/constants. Exact source SHAs remain audit metadata; no package-SHA blanket invalidation |

### Critical Integration Boundary

The engine accepts only narrowly reviewed base operations, declared ordinary helper closures, exact public pipload/stamp reads and rlang aborts. Its qualified-call whitelist excludes data.table, collapse, wbpip and pipster; `UseMethod`, dynamic lookup, package-internal access and classed operands are rejected (P `R/code_fingerprint.R:189-237,253-280,309-327,356-419`). Existing deflation uses data.table mutation, S3 classes, joyn and `wbpip::deflate_welfare_mean`. A future `pipster::...` call using `collapse::fmean` is also not directly admissible. Passing these as helper closures does not bypass inspection: every supplied helper is inspected and rebound.

This is a source-proven incompatibility, not an executed error. The smallest credible extension is a narrowly reviewed calculation adapter with explicit result-affecting function/helper/constant proof and pinned data reads; retain stamp's selection/save/receipt path. Its exact admitted surface needs local design/review before implementation. Do not silently weaken all proof rules, duplicate the formula in a base-only shadow estimator to claim reuse, run numerical work before stamp selection, or fall back to the legacy manifest selector. All recipe outputs/parents must resolve inside the initialized E root (P `R/dependency_plan.R:342-361,404-431`); Phase 2 aliases in separate stores cannot simply be handed in as arbitrary outside-root parent paths. Agree the bounded fixture's storage layout or approved pin-transfer contract.

## Consumed Arithmetic And Matching Audit

| Input | Actual arithmetic and matching, not just projected dependency |
|---|---|
| Clean LCU welfare | P `R/pd_dlw_clean.R:190-211` always converts micro welfare to double and divides by 365. `R/pd_deflation.R:858-869` copies that value to `welfare_lcu`. No period/currency flag is checked there. Pin/approve an annual-LCU fixture; do not assume all harmonized modules use that period |
| CPI | P `R/pd_aux_attr.R:129-137,189-196` filters country, `year == surveyid_year`, acronym, then extracts only `cpi_value` named `cpi_year_reporting_level`. P `R/pd_deflation.R:758-787` maps each base year by independent `cpi_data_level`: scalar national or per-observation area. Required levels missing from a year map become NA; no complete coverage/positive-finite divisor gate exists here |
| PPP | P `R/pd_aux_attr.R:138-158,197-203` filters country only; builds version strings and retains all available years/vintages/levels. P `R/pd_deflation.R:674-714` maps those versions by independent PPP domain. It does not choose one release/adaptation per year. Duplicate names can be rejected by projection (`R/dependency_inputs.R:361-367`) but direct attribute creation does not itself validate them |
| Final welfare equation | P `R/pd_deflation.R:907-928` calls W `R/deflate_welfare_mean.R:32-35`: `welfare_lcu / ppp / cpi`, elementwise. One divisor pair per mapped row/year/vintage, not a single national factor for every survey. W source SHA is `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; this is not proof that the installed historical W build has identical bytes |
| `ccf`, currency | No active pipdata R match for ccf/currency/cur_adj, and `create_attr(cpi)` drops every field except `cpi_value` and name keys. A `R/aux_cpi.R:83-109,197-225` computes `ccf = 1 / cur_adj`, retains it as an identifier when melting CPI columns, and does not multiply it into those CPI values in this inspected path. A's raw/precomputed CPI construction is not established here. Thus ccf is not an independent arithmetic input to this pipdata deflation; do not silently multiply it a second time or silently assert it is already embedded |
| Spatial/temporal adjustment | No active pipdata R match for spatial/spdef/spat. The CPI/PPP domain match selects appropriate area values; it does not constitute an additional spatial correction formula. W `R/deflate_welfare_mean.R:6-10` explicitly requires temporal/spatial/currency adjustments to be made already. Whether a supplied pinned CPI fixture satisfies that requirement is UNKNOWN until D2/source evidence; source comments are not numerical equivalence proof |
| Available years | P `R/pd_deflation.R:807-848` uses CPI/PPP year intersection and logs mismatch rather than enforcing all requested years. `:914-928` emits one `welfare_ppp_YEAR_RELEASE_ADAPT` per vintage. Target `welfare_YYYY` requires one approved vintage per year and explicit missing-year policy, not a blind rename that collides |
| Population activation | Only micro core applies adjustment when `pop_data_level` resolves to registered `area`; grouped core never adjusts (P `R/pd_deflation.R:449-458,483-502`; `R/aaa.R:124-153`). A national final mean can therefore depend on area populations, even though welfare values do not |
| Population selection | Metadata filters population to country and exact `year == surveyid_year`, then names `year_reporting_level` (P `R/pd_aux_attr.R:159-165,204-210`). Named-vector consumer instead takes `df$year[[1L]]`, groups by area, chooses closest available year within that area, first exact match or inverse-distance average on nonzero-distance ties (P `R/pd_deflation.R:1012-1056`). With normal exact-year metadata there are no neighboring years to choose; mismatch between survey ID year and observed year may be masked. Approve the matching policy rather than claiming nearest-year behavior is supplied end-to-end |
| Weight equation | Named path computes `pop_fact(area)=selected_population(area)/sum(weight in area)`, then `weight_i *= pop_fact(area)` (P `R/pd_deflation.R:1036-1078`). Population is not a welfare divisor. Missing all areas aborts; a single missing area returns NULL for that area and can survive left join as NA weights. Zero area totals/nonfinite/negative populations are not rejected here. Legacy table path instead groups country/survey_year/reporting_level and nearest-year joins before scaling (`:963-1009`); do not conflate its keys with named-vector area keys |
| Final row alignment / LCU | P `R/pd_deflation.R:439-470,520-554` copies input, deflates, optionally reweights, removes `welfare` but retains `welfare_lcu`, then sorts all rows together by latest PPP welfare and weight. Mean integration must use the aligned final welfare/weight vectors and only regex `^welfare_[0-9]{4}$`, not broad `welfare_vars` (which currently includes LCU) |

Broad projection is not exact consumption: P `R/dependency_inputs.R:331-373` hashes every CPI base year/level for the survey, every PPP vintage/level for the country, and population at the exact survey-ID year, plus domain labels. It does not use observed areas or selected PPP vintages. `:376-387,544-559` also carries source artifact versions. An unused CPI level/year can change that projection even though arithmetic is unchanged; a country population input can be present when adjustment is off. Do not advertise this as solved consumed-row selectivity or an approved M1 R1 algorithm. Preserve full-source pins for audit, separately record the actually consumed values/keys, and leave stamp as sole currentness authority. D7 gates any new selective mechanism.

Known fingerprint gap: `get_welfare_ppp` is the actual callback passed as a value to `purrr::walk` (P `R/pd_deflation.R:892,907-928`) but absent from `.PD_FINGERPRINT_COMPONENTS$deflate` (`R/code_fingerprint.R:22-29`). The audit examines `findGlobals(...)$functions`, not callback variables (`:96-106`). Likewise audit result is not proof of coverage for attribute-builder callbacks or `.data_level_columns`. Proposed relevant-helper mutation tests must include `get_welfare_ppp`, attribute selection/building helpers and sentinel constants actually reused. Existing external wbpip deflator is included (`:34-37,76-83`); this alone does not cover the omitted local callback.

## Phase 2 And Test Evidence

P local Phase 2 Plan `.cg-docs/plans/2026-10-30-m2-one-survey-acquire-format.md:20-34,76-91,104-107` records acquisition/format fixture scope, historical dependency pins and a five-file targeted command. Work report `.../.cg-docs/work-reports/2026-10-30-m2-one-survey-acquire-format.md:19-35` reports six test-file results: 50, 31, 84, 37, 56, 37 passing expectations; review `.../.cg-docs/reviews/2026-10-30-m2-one-survey-acquire-format-review.md:8-85,90-110` records all 11 findings fixed/verified. These are inspected worker-reported passes, not independently rerun results at today's commit.

H Phase 2 central handoff `.../outputs/pipdata/m2-one-survey-acquire-format/20261030T163045Z-pipdata/handoff.md:29-43` additionally reports four targeted files at 151, 185, 52, 27 passes. No raw October 30 native logs were established in the inspected local Plan/review/work-report/central handoff paths. Do not transfer October 28 engine logs into October 30 acquisition-test proof.

Saved historical engine execution evidence was directly read: S `evidence/gate-phase2-20261028T1406251674086Z-native.json:1-14` records exit 0/no timeout; matching stdout `:1-8` records three files, 46 tests/324 expectations; stderr is empty. This is stronger than a prose claim but remains an inspected historical execution, not an execution here and not a full suite. P engine work report `.../2026-10-27-m2-pipdata-authority.md:134-180,412-415` explicitly lists 41 excluded files, including arithmetic/population/deflation tests. The engine's internal phase 2 is not umbrella Phase 2 acquisition/format.

Dependency identity discrepancy: P Phase 2 Plan `:26,77-86` says stamp 0.1.0 at short `4a1fa5d` (content `5d1ddebdc926dad9c6ec99c08a65e74baee0da92`) and pipload `4ef0d90`. Direct S installed DESCRIPTION reads show stamp **0.0.11**, built October 27 (`library/phase2/stamp/DESCRIPTION:7,36`), pipload 1.0.0 (`.../pipload/DESCRIPTION:1-2,28`). S `evidence/stamp-source.json:1-4` pins content `5d1ddebdc926dad9c6ec99c08a65e74baee0da92`; `pipload-source.json:1-4` pins `4ef0d90a974cb6ff0725da69373bde421dd04ad5`. Historical runner `gate.R:20-47` also pins installed wbpip RemoteSha `ae0d3937bc61b27fa4566e72a75c56e562ac7f88`, different from W canonical HEAD. These metadata/source records need fresh reconciliation; no loaded DLL/function bytes or installed manifests were recomputed here.

### Safety Findings

- P `tests/testthat.R:1-4` merely invokes package `test_check`; it contains no isolation controls. No setup/teardown files appear in the inspected test directory; the actual side effects live in helpers/test bodies and package/dependency hooks.
- P `R/zzz.R:2-17` selects an R user cache default and initializes logging on load. S captured pipfun defaults include shared network main_dir (`evidence/20261028T1406250828788Z-hook-details.txt:172-178`); disabling automatic logs alone is not storage containment. Redirect HOME/user/cache/PIP paths before namespace loading, not just tempdir after loading.
- P `helper-dlw-data.R:1-137` is synthetic generator declarations. `helper-dlw-wrapper-fixtures.R:1-25` parses nine test files and evaluates top-level assignment expressions. `helper-dependency-fixtures.R:128-176` creates real temporary stamp stores when invoked. Therefore `load_all(helpers=TRUE)` has a larger inspected-source surface than the single requested test filename.
- P Phase 2 fixture `test-m2-one-survey-acquire-format.R:10-64` enforces E temp, deletes its owned temp root on exit and restores selected stamp options. Its `st_versions` mock tries alternative basename/extension paths and casts returned fields to character (`:94-120`); a passing fixture does not establish that unwrapped production receipt resolution has the same behavior.
- P `test-m2-engine-authority.R:1-17` derives its root from `PIP_ROOT_DIR`, changes global stamp options and retains per-test stores without a matching restore/cleanup in this fixture. Use a disposable separate R process/root; do not reuse an analyst's live session.
- P `test-pd-deflation.R:193-294` mocks loader/version fallback and uses synthetic fixtures. Its integration assertions at `:588-623,669-706` allow either a table or NA, so a pass is not proof of successful numerical deflation. P `test-pd-deflate-pipeline.R:9-35` replaces both transform and receipt; it proves wiring, not arithmetic/storage together. Add a real oracle/readback functional check.
- P `test-adjust-population.R:40-101` provides exact/nearest-year and independent-level arithmetic fixtures; named-vector area tests exist in `test-pd-deflation.R:532-581,731-791`. None has been executed here.
- P `test-release_mgmt.R:1-5` and `test-dlw_store_release.R:1-3` disable retired-function tests with `if (FALSE)`. P `test-pd_dlw_gd_clean.R:1-3` is a multiplication placeholder. These are coverage gaps, not evidence of safe release/grouped behavior.
- S runner redirects temp/home/cache/PIP paths (`runner/run.ps1:98-162`), but its `W` is canonical pipdata (`:12`), copies selected source/tests (`:289-319`) and then builds and installs (`:324-330`). It must not be run unchanged for this research or presented as a current feature-tree gate.

## Proposed Minimal Deflation Work Set

PROPOSED, not an approved local Plan or permission to edit. Execute only after D2/D3/D8 and the narrow engine-call contract are resolved; sequence shared files with the later mean-save work. Smallest end-to-end goal: one explicitly selected annual-LCU microdata fixture, pinned CPI/PPP/settings and optional approved population, real deflation, checked dynamic welfare-year output and actual stamp save/readback, without legacy independent selection.

| Exact candidate file | Smallest required change / functional check |
|---|---|
| `R/pd_deflation.R` | Reuse existing named-vector cores; add explicit one-vintage/year selection/validation, finite positive divisor and full-area coverage checks, dynamic `welfare_YYYY` naming, LCU retention and aligned final weights, explicit consumed-input provenance. Check analytic division, added year, duplicate/missing vintage/year/domain, zero divisor, missing population area and population-only weight change |
| `R/pd_aux_attr.R` | Reuse filters/vector builders; expose exact consumed keys/value selection for the approved path, reconcile chosen population year with survey-ID/observed-year policy, and explicitly account for upstream-adjusted CPI versus independent ccf. Do not implement an inferred correction formula. Check mixed independent CPI/PPP domains and unused versus consumed fields |
| `R/dependency_inputs.R` | Reuse key/PFW/domain validation; represent approved actual consumed values and parent pins as input facts, not an independent scheduler. No R1 selective-cache mechanism without D7. Check full-source audit pin versus consumed-value evidence and no spurious arithmetic dependence on optional unused population |
| `R/code_fingerprint.R` | Include omitted calculation callback/actually used helpers/constants, and narrow reviewed adapter proof to support real approved calculation calls. Preserve package-independent stamp descriptors. Check relevant helper/constant mutation changes the owning requested fingerprint; unrelated edits do not |
| `R/pd_run_pipeline.R` | Document/integrate the bounded deflation recipe path through the existing public entry point; preserve positional/default API and old path compatibility. Check no legacy planner/currentness callback runs on M2 |
| `tests/testthat/test-pd-deflation.R` | Extend current numerical fixtures with strict successful outcomes, target names/vintage metadata/LCU/row alignment, complete mapping and added-year checks; remove NA-as-success only in new required cases |
| `tests/testthat/test-adjust-population.R` | Add approved zero-total/missing-area/tie/year/invalid-pop and final-weight dependency oracle cases |
| `tests/testthat/test-dependency-inputs.R` | Check selected consumed keys independently from broad projection and unchanged unrelated fields; do not label projection hashing as approved R1 |
| `tests/testthat/test-code-fingerprint.R` | Add local callback, selection-helper, sentinel and adapter dependency mutation checks |
| `tests/testthat/test-m2-engine-authority.R` | Add real selected-survey transformation and actual stamp pinned readback through the approved narrow adapter; no replacement numerical worker |
| `tests/testthat/test-dependency-api-contract.R` | Preserve existing entry point/defaults/exports and verify the exact modern producer arguments |

Not in default deflation edit set: `R/pd_cpfw_merge.R` already delegates domains to the reusable resolver; `R/pd_deflate_pipeline.R` already offers exact strict transform/save seams but belongs to the legacy selected action route. Keep their current tests as regressions rather than rewiring legacy batch scheduling for M2. `R/dependency_execution.R` and `R/dependency_plan.R` remain unchanged if the reviewed adapter fits the existing callback/request result envelope; if adapter review shows otherwise, declare the exact additive edit before implementation rather than silently expanding this set. Generated `man/pd_deflation.Rd`/`man/pd_run_pipeline.Rd` only if changed documented contracts require synchronization; no NAMESPACE change is required for an internal adapter. No dependency, framework, partition scheme or new generic release mechanism is proposed.

## Separate Sequential Mean-Save Integration Work Set

Wait for tested deflation output plus a separately tested pure pipster mean interface at an exact recorded commit. This research does not inspect or approve a new pipster function; its name/contract must come from that producer handoff. Reuse `collapse` weighted mean inside pipster, not a second pipdata estimator (H umbrella `:342-352`; H design `:166,290-307`). Mean-save work must not overlap the first owner's edits to `code_fingerprint.R`, the entry point or integration tests.

| Exact candidate file | Bounded role / functional check |
|---|---|
| `DESCRIPTION` | Add the approved pipster dependency only when its actual exported interface/installed producer is available; confirm no Imports cycle. P currently imports collapse/data.table/pipaux/pipfun/pipload/wbpip/stamp, not pipster (`:12-41`); L DESCRIPTION suggests pipdata (`:36-42`), so distinguish suggested reverse access from a hard Imports cycle |
| `R/pd_mean_result.R` (proposed new file) | One small internal seam to select only `^welfare_[0-9]{4}$`, supply aligned final weights to the approved pure producer, add approved module/year/level/statistic/unit identity and submit one independently stored result per agreed contract through the existing engine. No new public entry point, latest-version read or manual skip rule |
| `R/code_fingerprint.R` | Extend the already reviewed adapter to the exact pure mean producer and its actual known helpers/constants/external numeric implementation; preserve exact source SHAs separately and do not accept arbitrary package-qualified callbacks |
| `R/pd_run_pipeline.R` | Add only composition of deflation -> independent mean result recipe(s), using stamp decisions and exact parents. Leave release manifest/assembly feature implementation out of this work set |
| `tests/testthat/test-m2-mean-save.R` (proposed new file) | Real pure-producer result and actual stamp save/readback; weights `c(1,3)` and welfare `c(1,3)` oracle 2.5, approved null/zero/negative policy, new year, population-only national-mean change, helper change, unavailable pin, save failure. Inject downstream assembly failure after successful independent save and verify recovery reuses the saved mean without producer rerun when stamp says current |
| `tests/testthat/test-code-fingerprint.R` | Relevant mean-helper mutation and unrelated-code no-change checks |
| `tests/testthat/test-m2-engine-authority.R` | Retained-output/unchanged/skipped feedback and receipt recovery with the real mean adapter |
| `tests/testthat/test-dependency-api-contract.R` | Existing entry point/export compatibility and producer API/capability check |

`R/save_pip.R` is not a default edit: use the modern engine's stamp builder return and exact execution proof, rather than treating catalog-only receipts as successful execution. If an approved independent-result adapter genuinely needs forwarding outside the engine, expose that explicit change and provenance contract first. No result assembly framework, TEST manifest, API adapter or release registration is implemented in this unit; injected assembly failure is sufficient for local Step 8 recovery evidence.

## Decision And Dependency Gates

H canonical umbrella `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:167-177,227-236,330-352,419-429` governs E7/E8 and D1-D8. H design `:162-168,186-205,290-309` protects dynamic years, independent results, stamp authority and package roles.

| Gate | Current disposition / required before affected implementation |
|---|---|
| D1 selection | Bounded selector exists; synthetic BOL fixture is evidence of implementation shape, not Andres's selection of a real survey/module/reporting coverage/source pins. Use a separately approved explicit fixture/selection contract |
| D2 deflation science | Still need exact selected PPP vintage per year; missing/ambiguous year/level behavior; PFW key agreement; evidence that CPI includes required currency/spatial adjustments or approved separate treatment. Never infer ccf multiplication |
| D3 weights | Need population required/not-required for primary survey; admissible welfare/weights/zero/NA policy, normalization, observed versus ID year and nearest/tie/area matching. Existing Phase 2 validation behavior is source evidence, not universal scientific approval |
| D4 mean contract | Need minimal producer return, result identity/key/type/unit/physical format and tolerance. Recommend one module/year/approved reporting-level mean result, finite doubles, no implicit row dropping, but this is a proposal |
| D5 generic semantics | Reuse tested stamp capabilities and exact proof rather than reopening generic storage. Fresh package APIs and missing/NA fingerprint/semantic/unchanged-output proof must match the actual selected producer builds |
| D6 TEST release | Later Phase 4 manifest scope; do not make local deflation/mean evidence wait for a future release or imply full API ingestion |
| D7 selectivity | M1 R1 remains Open. Full source pin + broad projection does not solve consumed-row CPI selectivity. Record actual consumption now; mechanism approval before implementing new selective invalidation, and final T3 remains required |
| D8 execution scope / safe suite | No new local Plan, branch permission, lifecycle scope or current safe full-suite/substitute approval established by this research. Historical E5 engine exclusions were for that bounded work, not blanket approval for numerical Phase 3 |
| Runtime / packages | Need exact current test executable, overlay/system library records, installed code and required public producer APIs checked before execution. Metadata source claims and package versions alone are insufficient; reconcile stamp version discrepancy and wbpip source/installed pin |
| Integration base / owner | Feature is not in PROD. Explicitly select clean feature-containing base and sole owner; no automatic merge, branch creation or assumption that canonical PROD contains Phase 2. Preserve canonical untracked Plan/.tmp |
| Calculation adapter | Narrow reviewed extension must support data.table deflation and pipster/collapse mean while retaining known dependency fingerprints, pinned reads and stamp-only run/save decisions. Current generic recipe tests do not establish that adapter |

Minimal first applies: one end-to-end fixture, installed tools, no added framework/dependency unless required, one functional check for each change. Retain protections against wrong published numbers/data loss/secrets/production/shared-branch changes. Recoverable extras belong Later; future local Plans should remain about two pages with evidence linked here, not copy this entire report.

## Exact Candidate Commands, Not Executed

These are **conditional test-only candidates**, supplied after the safety inspection above. They are not an approved or independently verified safe full-suite gate. Do not run during this research. Before future execution, the package owner must obtain D8 scope and reconcile the dependency/loaded-code identities, inspect any new helper/test/hook changes and verify every output path below resolves to E without C reparse ancestry. The overlay is the inspected existing directory, not an assertion that it currently satisfies Phase 3 dependencies. Reading R and installed packages on C is permitted; all indirect writes must remain E.

Candidate focused arithmetic/adapter regression run, Windows PowerShell 5.1, working directory explicitly the managed feature checkout P. The temporary parent `.tmp` was observed to exist; this command creates no parent directories, does not install/build, runs each file in a fresh R process and fails on test failure. New Phase 3 cases must first be added under the separately approved work set; running today's files alone cannot establish the missing functionality.

```powershell
$source = 'E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.kilo/worktrees/m2-phase-2-steps-5-and-6'
$tmp = 'E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.tmp'
$overlay = 'E:/PovcalNet/01.personal/wb384996/PIP/pipdata-m2-engine-runtime/library/phase2'
if (!(Test-Path -LiteralPath $source -PathType Container) -or !(Test-Path -LiteralPath $tmp -PathType Container) -or !(Test-Path -LiteralPath $overlay -PathType Container)) { throw 'Required existing E paths missing' }
$env:TEMP = $tmp
$env:TMP = $tmp
$env:TMPDIR = $tmp
$env:HOME = $tmp
$env:USERPROFILE = $tmp
$env:R_USER = $tmp
$env:APPDATA = $tmp
$env:LOCALAPPDATA = $tmp
$env:XDG_DATA_HOME = $tmp
$env:XDG_STATE_HOME = $tmp
$env:XDG_CACHE_HOME = $tmp
$env:XDG_CONFIG_HOME = $tmp
$env:R_USER_CACHE_DIR = $tmp
$env:R_USER_DATA_DIR = $tmp
$env:R_USER_CONFIG_DIR = $tmp
$env:PSModuleAnalysisCachePath = "$tmp/powershell-module-cache"
$env:PKGLOAD_PARENT_TEMPDIR = $tmp
$env:PIP_ROOT_DIR = "$tmp/pip-root"
$env:R_LIBS_USER = $overlay
$env:R_LIBS_SITE = ''
$env:OTEL_SDK_DISABLED = 'true'
$env:OMP_NUM_THREADS = '1'
$env:RCPP_PARALLEL_NUM_THREADS = '1'
$env:PIPDATA_SOURCE = $source
$files = @('test-pd-deflation.R', 'test-adjust-population.R', 'test-dependency-inputs.R', 'test-code-fingerprint.R', 'test-dependency-api-contract.R', 'test-pd-deflate-pipeline.R', 'test-m2-engine-authority.R', 'test-m2-one-survey-acquire-format.R')
foreach ($file in $files) {
  $env:PIPDATA_TEST_FILE = "$source/tests/testthat/$file"
  & 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe' --vanilla -e "stopifnot(startsWith(normalizePath(tempdir(), winslash='/'), 'E:/')); .libPaths(c(Sys.getenv('R_LIBS_USER'), 'C:/Program Files/R/R-4.5.2/library'), include.site=FALSE); options(pipfun.log.auto=FALSE, pipfun.main_dir=Sys.getenv('PIP_ROOT_DIR'), pipdata.dependency_manifest_path=file.path(tempdir(), 'manifest'), httr_oauth_cache=FALSE); pkgload::load_all(Sys.getenv('PIPDATA_SOURCE'), helpers=TRUE, quiet=TRUE); testthat::test_file(Sys.getenv('PIPDATA_TEST_FILE'), stop_on_failure=TRUE)"
  if ($LASTEXITCODE -ne 0) { throw "Focused test failed: $file" }
}
```

Candidate future mean-save command, only after `tests/testthat/test-m2-mean-save.R` exists, its new fixture/setup/teardown has been inspected and approved, the tested pure producer is present and the same E-only environment above is set. This is not a currently existing test or an invented producer function name:

```powershell
$env:PIPDATA_TEST_FILE = "$source/tests/testthat/test-m2-mean-save.R"
if (!(Test-Path -LiteralPath $env:PIPDATA_TEST_FILE -PathType Leaf)) { throw 'Approved mean-save test is not present' }
& 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe' --vanilla -e "stopifnot(startsWith(normalizePath(tempdir(), winslash='/'), 'E:/')); .libPaths(c(Sys.getenv('R_LIBS_USER'), 'C:/Program Files/R/R-4.5.2/library'), include.site=FALSE); options(pipfun.log.auto=FALSE, pipfun.main_dir=Sys.getenv('PIP_ROOT_DIR'), pipdata.dependency_manifest_path=file.path(tempdir(), 'manifest'), httr_oauth_cache=FALSE); pkgload::load_all(Sys.getenv('PIPDATA_SOURCE'), helpers=TRUE, quiet=TRUE); testthat::test_file(Sys.getenv('PIPDATA_TEST_FILE'), stop_on_failure=TRUE)"
if ($LASTEXITCODE -ne 0) { throw 'Mean-save candidate failed' }
```

No exact safe full-suite command can truthfully be certified from this inspection. `devtools::test()`, `test_check()` or `test_dir('tests/testthat')` are not designated safe simply because temp variables are redirected. Historical E5 excludes arithmetic tests and cannot be inherited wholesale. Required before implementation: inspect remaining whole-suite access/teardown and current dependency hooks, then approve the actual safe full suite or a directly approved compatible substitute that includes all local deflation/mean functional obligations and states exact exclusions. Whole-M2 T1-T12 remains a later actual integration obligation, not waivable by selected file passes (H umbrella `:368-378,419-429`).

## Later

- General dependency discovery, all-survey selection, all statistics, generic adapter expansion, broad test cleanup and extra frameworks are not needed for the one-survey end-to-end path.
- Full release registration/correction/freeze/retention, production/API equivalence, live DLW, SMB, multiwriter and scale certification remain separate later work. No production activation is proposed.

## Gaps
- No current R results or independent rerun of historical passes. October 30 raw native execution logs were not located in the inspected handoff/local evidence paths; historical prose results remain attributed.
- Exact loaded dependency bytes, DLLs and current installed API behavior are UNKNOWN. Existing overlay metadata contradicts the Phase 2 Plan's stamp version label, and historical installed wbpip pin differs from the canonical source inspected here.
- Whether the approved CPI source already incorporates each required currency/spatial adjustment is UNKNOWN. The code does not establish an independent ccf consumer; do not infer scientific correctness from projection membership or source comments.
- D2/D3/D4 and relevant D8 permissions/gates, the narrow calculation-adapter contract, storage-root interoperability and selected feature-containing implementation base remain unresolved for Phase 3. Existing validators are not approvals of those scientific choices.
- Safe full-suite command or directly approved Phase 3 compatible substitute is NOT established. No filesystem/network interception or current dependency-hook execution was performed. Candidate commands are conditional, not a safety certification.
- M1 R1 / D7, removed keys, exact consumed-row selectivity and final whole-skeleton rerun evidence remain Open. Recording consumption is not implementing another currentness authority.
- No new local Plans, package edits, branch changes, merges, commits, pushes, installs, roadmap changes or protected-design changes were made. Only this named evidence report was created/updated.
