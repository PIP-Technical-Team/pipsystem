---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:47:16Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-03-one-survey-upstream-acceptance.md revision 1
next: Planning owner considers P2.1 in the next Plan revision; execution remains unauthorized.
---

# Plan critique, revision 1

## Summary
Reviewed only the named package Plan revision 1. Findings: **0 P1 / 1 P2 / 0 P3**. One missing producer prerequisite needs a narrow declaration; no broader producer certification or framework is recommended. No implementation authorized or performed. This review is complete, not an acceptance/test pass.

## Findings

- **[P2.1]** [cg-plan-critic] Step 1–2: `Bind one honest isolated fixture and runner / Connect existing real stages` — Declare the saved country-list prerequisite for all three real auxiliary producers.
  **Issue**: The Plan promises real CPI/PPP/PFW production in a new isolated store, forbids transformed auxiliary substitutes, and explicitly permits supplemental pop/GDP/PCE fixtures, but never declares the required `country_list` seed. The referenced raw-producer fixture ranges omit that setup. An empty sandbox cannot run this chain as specified without adding an undeclared fixture exception or producing another auxiliary series outside the intended scope.
  **Evidence**: Plan `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-03-one-survey-upstream-acceptance.md:20,27,35,40-42` defines those boundaries and cites pipaux fixture lines 84–240. At pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, `R/aux_cpi.R:134-137` loads `country_list` and filters CPI to its codes; `R/aux_ppp.R:215-218` does the same during the PPP update; `R/aux_pfw.R:151-167` loads it, filters countries, and joins `country_code`/`region_code`. The existing producer harness explicitly saves a synthetic country list before updates at `tests/testthat/test-m2-stamp-cpi-ppp-pfw.R:74-79`, outside the Plan's cited fixture range. Real `pipload::load_aux_data` requires the saved artifact to exist (`pipload/R/load_aux_data.R:37-40`).
  **Impact**: V2 is blocked in a genuinely empty E-only sandbox, or implementation silently widens the fixture-substitution boundary / reads an existing country list. Neither is necessary: the required setup already exists in the reusable harness.
  **Fix**: Explicitly permit and seed the small synthetic `country_list` prerequisite in the same isolated auxiliary store before the three actual updaters. Include the selected `AAA` code and required `region_code`, keep the real country-list loader active, and record its fixture identity/pin. State that country-list production is not certified, just as supplemental pop/GDP/PCE production is not certified. One functional check: the existing V2 chain starts from that sandbox, runs all three actual updaters, and retains the expected synthetic survey/country rows and literal values. Do not add a country-list producer, a general fixture registry, or a separate test matrix.

## Other assessed boundaries — no additional findings

- **Real stages and source pins**: `pipdata/R/pipdata_validate_gmd.R:593-605` and `R/inv_dlw_load.R:21` currently read latest rather than forwarding recorded pins. The Plan already identifies this limitation and allows only narrow pin forwarding or a scoped stop (`:42`). The actual loader has a `version` parameter and forwards it to `pip_read` (`pipload/R/load_dlw_data.R:54-68,126-132`), so this is an available narrow seam, not a reason to demand the later recipe bridge.
- **Independent oracles**: V1/V3 expressly require associated result/severity/identity, literal raw-to-daily values and keyed row/weight correspondence (`Plan:34-37,41-43`). The GPWG required-column routes exist (`pipdata/inst/extdata/validation_spec.yml:14-28,73-87`). The Plan does not rely on the existing fabricated engine success or independently sorted golden columns (`tests/testthat/test-m2-one-survey-acquire-format.R:443-460,520`). No mixed-sign/general scientific-policy expansion is required to establish its chosen missing-column rejection case.
- **Metadata/storage remain real**: The clean worker invokes real loader, merge, clean, clean-output validation, metadata construction and verified saves (`pipdata/R/pd_process_data.R:240-287`). The direct route also constructs/saves metadata (`:337-380`); the actual metadata worker exists (`R/pd_metadata_refresh.R:80-140`). The Plan requires exact saved clean/metadata readback rather than auxiliary element-presence assertions (`Plan:35-37,42,44`). These are separate metadata artifacts, not a newly claimed historical sidecar facility.
- **Isolation and helper declarations**: The Plan makes E-only paths, package hooks, all aliases, fixed report IDs and child state prerequisites rather than post-load cleanup (`:29,40,53`). This addresses the default user-cache/log initialization (`pipdata/R/zzz.R:2-17`) and the real loader's alias-by-folder lookup (`pipload/R/load_dlw_data.R:75,115-132`). It also explicitly requires declaration-only helper resolution (`Plan:44`), relevant to `pipdata/tests/testthat/helper-dlw-wrapper-fixtures.R:14-23` parsing/evaluating top-level assignments from other test files. Exact runtime safety remains unobserved, as the Plan says.
- **Scope and Minimal first**: The three-step Plan has a concrete V1–V4 finish, bounded corrections, conditional owning-file regressions, no new dependencies/framework, and one offline vignette section. The later live-DLW transport, stamp-selected recipe adapter, deflation, mean and auxiliary producer expansion are expressly excluded (`Plan:20,29,43-51`). No scheduler/callback allowlist widening is hidden in the proposed direct-stage route. Effort is labeled medium, not a verified duration; no execution time estimate is certified by source review.

## Changes
Only this exact report created and updated from running to completed. No Plan, package source/configuration, other report, active state, roadmap or protected design edited. No Git mutation.

## Checks run
- Read full Plan revision 1 and coordination contract.
- Read-only Git confirms pipdata PROD at fe075a6d49f37d6d131eeadfeb9219c2038899ea; sole dirty path is the untracked target Plan.
- pipaux HEAD: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be.
- Read original producer fixtures and relevant CPI/PPP/PFW producer source, actual source/aux loaders, validator boundary/specification, clean/metadata workers, helper declaration loader and package load hook. Used supplied acquisition/engine/processing/testing/workflow reports and the relevant documentation-report sections as navigation/evidence, not authority. Examples/vignettes are guidance, not rules.
- Additional package read: pipload HEAD ff9a81e386a09fb2531c154f63fd2b91521313c6. pipaux status is clean. pipload has pre-existing modified `.gitignore` and untracked artifacts; none of its read source paths was reported modified, and nothing there was changed.
- Final read-only package recheck: pipdata remains fe075a6d49f37d6d131eeadfeb9219c2038899ea; sole dirty path remains the untracked target Plan. Clock observed 2026-11-03T10:47:15.7837209-05:00, recorded above in UTC.
- Deliberately NOT run: R/package loading, tests, fixture regeneration, installs, network, pipeline or worker/session creation. No test counts or runtime passes claimed.

## Gaps
- P2.1 remains a Plan revision recommendation, not an applied change or authorization to broaden execution.
- Loaded runtime/package identities, serializer behavior, exact consumed pins and child state isolation remain unobserved until separately authorized execution. The Plan's capability/isolation gates must establish those facts, not waive them.
- This is targeted Plan/source review, not a renewed whole-package audit, live-DLW acceptance, scientific-policy approval or complete M2 readiness certification. No tests, R loads, network or pipeline runs were permitted.
