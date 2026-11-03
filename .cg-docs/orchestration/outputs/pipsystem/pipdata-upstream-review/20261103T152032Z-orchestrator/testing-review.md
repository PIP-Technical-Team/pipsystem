---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:29:35Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: NONE
next: Coordinator integrates this completed tests-only source review with runtime and documentation reviews; execution remains unauthorized.
---

# PIPDATA upstream test-source review

## Summary

Completed: all 50 tracked textual R files under tests/ fully read (including capped-file continuations); 16 tracked RDS fixture paths inventoried only. No missing textual paths. Did not execute /cg-plan or tests. Package HEAD/branch freshly verified at start, checkpoint and completion at the full SHA above; package status clean. Root pipsystem is main at 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39 with pre-existing modified/untracked files, not changed by this review. Only this report was written. Coverage map, per-file labels, seven findings, smallest useful subset and narrowly scoped acceptance deltas follow.

## Conclusion and evidence boundary

The existing suite is useful for reuse, but does not establish one-survey upstream acceptance. It supplies a real clean/save/readback example, a real validator suite, detailed legacy scheduling/restart tests, and separate stamp-authority recipe tests. These are not yet one connected producer-to-consumer check: the clean acceptance fixture substitutes validator success and creates auxiliary inputs itself; the legacy restart harness substitutes every processing worker; the recipe suite uses generic calculations. This is a source-review conclusion, not a test failure or a claim that tests pass.

All package citations below are relative to pipdata at `fe075a6d49f37d6d131eeadfeb9219c2038899ea`. No runtime source audits were duplicated. Assertions, mocks and fixture construction were inspected; runtime behavior not directly asserted remains UNKNOWN. No historical test totals are reused as current results.

## Findings

**[P1]** `tests/testthat/test-m2-one-survey-acquire-format.R:443-460` -- Positive acceptance substitutes the DLW validator and hand-builds auxiliary producer output.
**Issue**: The mocked engine appends a success record with zero violations regardless of the input. The same fixture builds CPI/PPP/PFW/pop/GDP/PCE tables and directly saves them through stamp (`:248-334`); it never consumes pipaux-produced output. Thus the valid inventory assertions (`:463-470`) cannot establish real validator eligibility or producer-consumer schema agreement. Formatting and exact pinned readback at `:504-543` are genuine checks and should be retained. The separate real-engine smoke accepts either `valid` or `invalid` (`test-pipdata_validate_gmd.R:1454-1488`), so it cannot fill the positive-eligibility gap.
**Fix**: Add one offline acceptance case using the selected survey's real DLW engine and actual pipaux-shaped saved auxiliary outputs, mocking transport only. Functional check: the real report classifies the selected survey valid, the real clean worker saves the expected module-bearing ID, and exact readback equals independently specified daily welfare and consumed auxiliary vectors. If actual pipaux output is not available, mark this producer bridge unverified rather than renaming handwritten tables as producer evidence.

**[P1]** `tests/testthat/test-pd-deflation.R:588-623` -- Integration assertions permit a complete calculation failure as success.
**Issue**: Mode A accepts either a data.table or `NA`; Mode B repeats this at `:669-707`. Other tests exercise real `deflation.pipmd` but assert names/attributes rather than independently computed deflated values (`:712-849`). The authoritative worker test mocks both strict deflation and save receipt (`test-pd-deflate-pipeline.R:9-35`); it checks pins, not numerical correctness or publication of valid values.
**Fix**: Reuse the small named-vector fixture with complete attributes and replace failure-tolerant expectations with one exact numeric oracle. Functional check: each persisted PPP welfare value matches a hand-worked LCU/day/CPI/PPP example within stated tolerance, retains expected weights, and is finite. Do not compute the expected values with the function being tested.

**[P1]** `tests/testthat/helper-dependency-fixtures.R:646-667` -- Restart/invalidation coverage is not real survey-processing coverage.
**Issue**: `c4_pipeline_run()` replaces `pd_execute_clean`, `pd_execute_metadata` and `pd_execute_deflate`; replacements write synthetic `source`/hash objects (`:506-617`). Tests do genuinely check real stamp receipt/inventory/manifest behavior and counters (`test-pd-run-pipeline.R:1311-1441,1548-1629,1631-1821`). They do not exercise real auxiliary matching, formatting or deflation. The M2 recipe tests independently prove generic execution behavior (`test-m2-engine-authority.R:92-150,320-367`), not a bridge from these real processing functions.
**Fix**: Keep these harnesses as orchestration tests. Add one restart continuation to the real one-survey acceptance case, interrupting after a real saved clean output before metadata publication. Functional check: a fresh analyst-started invocation uses the exact retained clean pin and publishes/readbacks matching metadata without asserting success from a mocked worker. This does not approve the legacy manifest as target rebuild authority or require a new scheduler.

**[P2]** `tests/testthat/test-recode-spec.R:149-156` -- Recode coverage does not assert important composed output values.
**Issue**: Quantiles are checked only for five distinct labels; there is no weighted membership oracle. The entire file tests range/binary/haven/binned/quantile rules and legacy mapping equivalence but not `recode_indicator` or the composition of numeric-code indicators after factor recodes. No textual test calls `pd_split_alt_welfare`; its only inventory match is the export-name assertion (`test-dependency-api-contract.R:120`). The four-row acceptance microdata omits labor/education and alternate welfare (`test-m2-one-survey-acquire-format.R:232-246`). This leaves the processing review's reported indicator and alternate-welfare risks without a regression detector here; those runtime findings are owned by the processing reviewer.
**Fix**: Add a minimal composed-recode fixture with one positive, negative and missing source case; assert exact indicator values after the complete package YAML. Functional check: output vector equals the chosen semantic oracle, including missing handling. Separately, if the accepted survey uses alternate welfare, add one alt-first PFW case whose two named welfare vectors remain correctly labeled after a row-order permutation. Do not expand to every survey type for a one-GPWG-survey acceptance.

**[P2]** `tests/testthat/test-dlw_validation_engine.R:57-78` -- Golden comparisons lose assertion-to-result associations.
**Issue**: Messages, descriptions, types, violation counts and table names are sorted independently before comparison. A result that swaps violation counts/severities between checks can preserve every compared multiset. Fixture generation itself calls the current engine (`generate-fixtures.R:16-35`), so automatic regeneration is not independent validation of intended rules.
**Fix**: Compare canonical rows keyed by assertion identity/description with their associated message/type/count intact. Functional check: an intentionally swapped severity/count between two distinct assertions fails the comparator. Retain the direct missing-column/empty-input/duplicate-key tests as independent semantic checks; no binary decoding was done in this review.

**[P2]** `tests/testthat/test-logging-integration.R:182-478` -- Many tests assert local examples or copied implementation rather than production output.
**Issue**: Literal `expected_structure` lists, local `should_log` booleans and `.apply_release_vid()` (a duplicate of production logic, `:396-416`) can pass even if production emission/population is broken. The first part of the same file (`:6-180`) does exercise actual logging helpers, so this is mixed coverage, not an entirely empty file. Also `test-pd_dlw_gd_clean.R:1-3` is only `2 * 2 == 4`; `test-release_mgmt.R:5-167` and `test-dlw_store_release.R:3-111` are entirely disabled with `if (FALSE)`.
**Fix**: Do not count these as processing/release acceptance evidence. When the corresponding emitter is changed, replace only its copied-example test with a captured production-emitter assertion. Functional check: triggering that emitter returns the expected discriminator and fields; changing/removing the production emission makes it fail. Grouped-data cleaning needs a real fixture only when grouped-data acceptance enters scope.

**[P2]** `tests/testthat/test-m2-engine-authority.R:2-16` -- Fixture setup depends on and leaves mutable process storage state.
**Issue**: `m2_fixture()` derives an E: directory from `PIP_ROOT_DIR`, creates a sibling `phase2` tree, registers stamp aliases and changes global stamp options without restoring those options or scheduling root cleanup. The separate Step 5/6 fixture restores five stamp options but only after registering aliases (`test-m2-one-survey-acquire-format.R:39-64`); alias cleanup is not present there. Logging tests register standard aliases (`test-dlw-unified-logging.R:480-543`) and clear global builders rather than restoring prior builders (`:517-518`). Several validation helpers remove existing accumulator state rather than restore it (`test-dlw_validation_engine.R:6-8`; `test-pipdata_validation_report.R:2-5`). This is an isolation/run-environment risk, not evidence of a production failure.
**Fix**: For the selected acceptance runner, use one disposable process with all paths/environment/cache/log settings already on E:, unique isolated aliases, and no shared production registration. Functional check: after the runner exits, production files/aliases have not changed and all emitted files stayed in the selected E: sandbox. Broader fixture cleanup can wait unless it is needed for that runner.

## Coverage map by upstream responsibility

| Responsibility | Reusable evidence actually asserted | Limit for upstream acceptance |
|---|---|---|
| Acquisition | Exact catalog filename/version/checksum selection; forced overwrite arguments; failed/ambiguous download, sibling isolation, typed facts and inventory reconciliation (`test-pipdata_get_gmd.R:496-580,694-811,1025-1110`; `test-pipdata_dlw_compare.R:88-297`). | DLW transport is mocked. Real stamp reconciliation is exercised but not a real DLW download. Step 5 checks catalog read once and failure blocks validation (`test-m2-one-survey-acquire-format.R:336-395`). |
| Actual DLW validator | All eight module routes produce reports; missing-column errors, empty skip, duplicate keys, NA/type/value warnings and committed-report comparisons (`test-dlw_validation_engine.R:20-225`); extensive malformed-spec cases (`test-dlw_validation_spec.R:1-263`). | Positive selected-survey acceptance replaces engine. Real smoke permits invalid. Engine route coverage does not imply every row-level rule has a correct oracle. Warning status is explicitly expected for wrong types/NA (`engine:162-187`), not unconditional rejection. |
| Formatting/cleaning | Real worker formats annual welfare `365,730,1095,1460` to daily `1,2,3,4`; asserts distribution and area/domain attrs and exact clean pin (`test-m2-one-survey-acquire-format.R:397-544`). Negative welfare/weight/domain/eligibility cases assert no clean saves (`:583-795`). | Positive path is GPWG microdata only; recode labor fields, dual welfare, GROUP/BIN/HIST full formatting and exact retained household/weight associations are not established. Sorting welfare alone does not check row-to-weight mapping. |
| Recode | Exact ranges/binary/haven/bins, absent-column no-ops, spec validation, version attr, YAML export/read helpers, legacy equivalence and explicit NA area divergence (`test-recode-spec.R:3-564`; `test-pd_dlw_clean.R:10-144`). | No full YAML indicator composition, weighted quantile membership or alternate-welfare split test. |
| Aux producer-consumer matching | Exact synthetic country/year/acronym/domain projection, unrelated-row hash stability and duplicate-key rejection (`test-dependency-inputs.R:64-144`); PFW inclusion/domain/cache IDs (`test-get-country-pfw.R:41-154`). | Handwritten auxiliaries; no pipaux producer invoked. No proof actual producer schema/key/vintage matches the metadata consumer. `valid_aux_load` tests stub comparison functions, not producing CPI/PPP/PFW (`test-valid_aux_load.R:12-87,171-226`). |
| Deflation | Real named-vector CPI/PPP broadcast and rural/urban values, independent mixed domains, population weight factors/closest-year cases (`test-pd-deflation.R:379-582`; `test-adjust-population.R:40-127`), output attributes and multiple PPP years (`deflation:712-849`). | No hand-worked persisted PPP welfare oracle; failure-tolerant Mode A/B; no actual strict worker numerical/readback path. Missing/zero/duplicate/nonfinite factor and partial-area-population publication outcomes lack acceptance coverage. |
| Legacy full orchestration | Multi-stage waves/lease/force/bootstrap, failure blocking, checkpoint crash/restart matrix and exact targeted synthetic aux invalidation (`test-pd-run-pipeline.R:219-616,1311-1959`). | All processing workers substituted by helper. Restart matrix mostly repeats calls in same process; must not be described as real survey pipeline or adopted stamp-only authority. |
| Opt-in recipes | Real stamp execution/receipts, readback of RDS/QS2/FST, generic chain/cache/early cutoff, code/semantic changes, failure/review and fresh-process restart (`test-m2-engine-authority.R:45-735`). Explicit legacy exclusion for recipes and legacy preservation without recipes (`:45-62,233-249,568-600`). | Generic `m2_node` outputs, not DLW/clean/aux adapters. Passing this route would not establish upstream runtime admission. No approved bridge inferred. |
| Saved payload/metadata/readback | Exact clean and separately saved metadata version reads (`test-m2-one-survey-acquire-format.R:512-543`); unchanged receipt pin retained plus mismatch rejection (`:171-198`); real inventory advancement (`test-pd-deflate-pipeline.R:144-240`). | Metadata is saved manually in positive acceptance, not by actual metadata-stage publication. CPI/PPP/pop asserted present, not exact complete vector contents. Build-inventory “round trip” uses in-memory mocked write/read (`test-build_pip_inventory.R:991-1069`), not real persistence. |
| Invalid no-save and restarts | Invalid inventory exclusion: zero worker/write/catalog entries (`test-m2-one-survey-acquire-format.R:546-581`). Post-format invalidity: errors, zero writes, blocked metadata and empty catalogs (`:583-795`). Generic recipe fresh-process review (`test-m2-engine-authority.R:320-367`). | No connected real-engine-invalid => real-clean-not-called => no artifact acceptance case, and no fresh-process actual one-survey metadata continuation. Post-format blocking test stubs execution preparation/refresh and durable failed invalidation (`:769-787`). |

### Storage history distinction

Legacy `.load_deflation_aux` tests deliberately allow latest when the pin is missing and fallback to latest after stale-pin failure (`test-pd-deflation.R:223-294`). In contrast, authoritative deflation tests assert exact pin forwarding and incomplete-action failure (`test-pd-deflate-pipeline.R:9-52`). Do not carry the legacy fallback into acceptance of reproducible exact-version processing: `pipsystem/SYSTEM_DESIGN.md:135` requires historical metadata from the same pinned version. This review reports the distinction, not a change to that Decided rule.

## Smallest useful existing subset and acceptance delta

No test invocation is authorized now. The following is the smallest useful **file-level baseline for this upstream boundary**, not a claim that all eight files are necessary for every future single-function change:

1. `tests/testthat/test-m2-one-survey-acquire-format.R` -- actual clean/save/readback and no-save cases; use the positive block `:397-544` as the skeleton, not as real-validator proof.
2. `tests/testthat/test-dlw_validation_engine.R` -- actual validator behavior, plus inventory-only golden fixture dependencies if later execution is authorized.
3. `tests/testthat/test-dlw_validation_spec.R` -- actual package validation rules/schema errors.
4. `tests/testthat/test-recode-spec.R` -- actual package recode composition building blocks; extend narrowly for any touched indicator.
5. `tests/testthat/test-dependency-inputs.R` -- exact country/year/acronym/domain and duplicate-key projection contract.
6. `tests/testthat/test-pd-deflation.R` -- actual mathematical helpers, with the positive numerical gap corrected rather than accepting `NA`.
7. `tests/testthat/test-pd-deflate-pipeline.R` -- strict pin forwarding, failure/incomplete-action behavior, actual inventory receipt advancement.
8. `tests/testthat/test-save_pip.R` -- narrow typed-save/mismatched history rejection; positive real receipt equivalence remains in item 1.

Required helper declarations include `helper-dlw-data.R` and `make_dependency_validation_inventory()` from `test-dependency-execution.R:1-26`; the current `helper-dlw-wrapper-fixtures.R:1-25` loads that declaration by parsing a broader fixed list. This subset is a selection recommendation, not an executable command: a future runner must resolve helpers and package hooks without accidentally executing unrelated suites.

Only if checking the existing orchestration feature itself, add `test-m2-engine-authority.R` separately and retain the legacy targeted restart blocks `test-pd-run-pipeline.R:1311-1441,1443-1546` with `helper-dependency-fixtures.R`. Do not require the entire legacy scheduling/performance/reporting surface for one-survey upstream processing. It tests a different boundary and the source review does not approve it as target rebuild authority.

Necessary new acceptance cases, each with one functional check (combine related assertions in that single case rather than introducing a framework):

| Case | Smallest reusable setup/change | One functional check |
|---|---|---|
| A. Real positive upstream chain | Adapt existing four-row GPWG case; transport fixture only, real DLW engine, actual saved auxiliary producer outputs, real formatting/metadata/strict deflation, isolated stores. | Exact pinned readback matches independent expected daily and PPP welfare, weight/row correspondence, selected identity, exact consumed CPI/PPP/pop metadata. This is the missing connected acceptance. |
| B. Real validator rejection => no save | Same selected fixture, remove a required column; leave actual engine and eligibility routing active. | Invalid classification results in zero clean/metadata/deflated versions and zero downstream worker attempts for that survey, while report records the rejected check. |
| C. Factor mismatch => no invalid publication | Same saved clean pin, one missing rural factor or nonfinite/zero CPI/PPP, plus a duplicate matching key variant only if the bridge touches matching. | No successful invalid deflated artifact is published, and failure names the missing/ambiguous factor. This prevents release of wrong numbers rather than adding generic defensive checks. |
| D. Real continuation/readback | Reuse A with interruption after clean publication and before metadata commit; restart in a fresh isolated process. | Exact old clean pin plus matching metadata is recovered without silent latest substitution; finalized numerical output equals uninterrupted A. |
| E. Scoped regression for processing findings | Only rules used/touched: full YAML indicator composition and, if relevant, alt-first dual welfare; tiny deterministic rows. | Exact semantic indicator values or order-invariant named INC/CON welfare vectors. These catch processing findings without broad model/calibration scaffolding. |

Cases A/B are the minimum immediate upstream acceptance. This is **offline stage acceptance**, not stamp-selected full orchestration or incremental-rerun proof; reuse real stage functions without adopting the legacy scheduler's currentness decisions. C/D are needed before calling saving/restart behavior accepted. E accompanies the corresponding processing correction. Generic scheduling benchmarks, full population methodology matrices and grouped-data expansion are **Later** unless the chosen survey needs them. Use installed tools and dependencies only; no new framework, roadmap re-scope, design mutation, live production run, automatic retry, or broadened recipes whitelist is proposed. A future Plan should remain about two pages. These recommendations grant no execution or package-write permission.

## Per-file complete textual coverage inventory

Labels: **infra** = harness/helper only; **unit** = real behavior assertions with narrow mocks where noted; **integration-mixed** = real components plus substituted boundaries; **contract** = schema/API checks, not processing; **placeholder**/**disabled** = no active relevant product coverage. Every listed range was read in full. Paths below are under `tests/` (or `tests/testthat/` for bare filenames). There are 45 `test-*.R` files and five infrastructure R files; counts are tracked-source inventory, not executed-test counts.

| File (complete line range) | Coverage label and what is asserted |
|---|---|
| `tests/testthat.R:1-4` | infra: library loads and test_check entry, no standalone product assertion. |
| `generate-fixtures.R:1-48` | infra/generator: seeded module report generation, error fixture stopifnot; writes package fixture paths when explicitly run, not run here. |
| `helper-dependency-fixtures.R:1-692` | infra/integration harness: actual stamp stores, synthetic stage workers, aliases, clocks, fault seams; no standalone tests. |
| `helper-dlw-data.R:1-137` | infra: synthetic eight-module data builders, deterministic per-module wrapper, error-column mapping; no standalone tests. |
| `helper-dlw-wrapper-fixtures.R:1-32` | infra: parses nine test files and evaluates every top-level `<-` before shuffled blocks; hidden test-file declaration dependencies. |
| `test-adjust-population.R:1-127` | unit: actual table-path weight scaling, exact/nearest year and groups/row structure; synthetic pop. |
| `test-build_pip_inventory.R:1-1236` | integration-mixed: actual joins/upserts/schema/aux hashes/legacy migration and warning/error cases; catalogs, aux load, writes/logs mocked; in-memory round trip. |
| `test-code-fingerprint.R:1-211` | unit: canonical formals/srcref, locked lexical proof, ordering, curated closure and mutation ownership/reason; namespace substitutions for mutation probes. |
| `test-dependency-api-contract.R:1-158` | contract: exact formals/defaults, producer exports, NAMESPACE delta/S3 registration, aliases/sentinels; not API HTTP tests. |
| `test-dependency-bootstrap.R:1-61` | unit: unknown bootstrap selection and atomic closure, invalid selectors/required bootstrap; synthetic plans. |
| `test-dependency-contract.R:1-21` | contract/unit: manifest stage reject and scope hashes; synthetic C:/repo string only, no test runner storage isolation. |
| `test-dependency-execution.R:1-743` | unit/integration-mixed: batches/failures, invalid filtering, snapshots/order stability, lease loss, removal/preflight/planning; isolated filesystem or injected snapshots, no real clean pipeline. |
| `test-dependency-inputs.R:1-396` | unit: canonical projections/keys, expected IDs, mixed domains, stage input rows/legacy hashes; output-defined ID rejection mocks transforms and save. |
| `test-dependency-manifest.R:1-310` | unit/integration-mixed: real immutable manifest generations/leases/recovery; synthetic input/fingerprint provenance and per-entity content facts. |
| `test-dependency-performance.R:1-446` | structural/performance: 2500 nodes, memory bound, bounded calls/checkpoints; synthetic planner/workers/facts and no household I/O. Elapsed checks only `>= 0`, not a runtime performance threshold. |
| `test-dependency-plan.R:1-314` | unit: synthetic invalidation reason matrix, cached/stale/force/duplicate relationships and empty selection; not aux numerical correctness. |
| `test-dlw-unified-logging.R:1-557` | integration-mixed: logging signatures/typed failures/no-op/checkpoint behavior; mocked DLW/stage/storage boundaries, two actual checkpoint writes/sidecar checks, source-body architecture assertions. |
| `test-dlw_store_release.R:1-111` | disabled: entire nonexistent-function suite `if(FALSE)`, includes an empty failure block at `:65-67`; no active release coverage. |
| `test-dlw_validation_engine.R:1-225` | unit/real-engine: module/report/fixture comparisons, blank/unknown/dup/NA/type/age/value constraints; private accumulator; body-text no-logging assertions. |
| `test-dlw_validation_spec.R:1-263` | unit: real package spec and invalid schema/types/check/severity fields, valid bare-string check. |
| `test-get-aux-hashes.R:1-174` | unit: catalog-only hash resolution and missing/ambiguous/empty/bad hash errors, st_catalog_query mocked. |
| `test-get-country-pfw.R:1-154` | unit: real report_lvl/cache_id synthetic PFW, inclusion/duplicate/missing-domain/welfare-type cases; no actual aux producer. |
| `test-log_report.R:1-1491` | unit/integration-mixed: real report parsers/rendered sections over synthetic logs, latest attempts/run IDs, malformed and optional data, temp file write; some real pipfun empty-log behavior. |
| `test-logging-integration.R:1-478` | mixed unit/example-only: real helper emission/parsing/compactness first 180 lines; literal schemas/local boolean/copied release logic thereafter. |
| `test-m2-engine-authority.R:1-735` | integration-mixed/real storage: generic recipe chains/formats/pins/proofs/semantic versions/restarts/failures/guards with selected corruption/mocks; not production upstream functions. |
| `test-m2-one-survey-acquire-format.R:1-796` | integration-mixed: strongest real format/save/readback, invalid/no-save; mocked DLW engine/transport/loader, self-created aux and partly mocked downstream blocking. |
| `test-pd-change-report.R:1-397` | unit/integration-mixed: print/facts/plan parity, invalid/retry filter/removal; fact/snapshot/I/O mocks remain even in “real fact preparation” block. |
| `test-pd-deflate-pipeline.R:1-454` | unit/integration-mixed: exact action/pins/compatibility, durable invalidation with real stamp subsection, checkpoint/cached/recoverable results; mathematical worker mocked. |
| `test-pd-deflation.R:1-849` | unit/integration-mixed: actual numeric factor/pop helpers and attributes, pinned/latest fallback loader mocks; two Mode A/B cases allow NA. |
| `test-pd-env.R:1-85` | unit: actual package-env set/get/remove/reset/append; reset clears all package state rather than prior-state restore. |
| `test-pd-metadata-refresh.R:1-517` | unit/integration-mixed: metadata merge/exact pins/hash rejects/schema/reconstruction/stage blocking; loads/hashes/aux transform/saves/checkpoints mocked where invoked. |
| `test-pd-run-pipeline.R:1-1959` | integration-mixed: signatures/guards/waves/selectors/failure counts/crash convergence/aux invalidation/force/tombstones; uses synthetic c4 workers, real stamp receipt and inventory work. Read `1-1572` then `1573-1959` after cap. |
| `test-pd_dlw_clean.R:1-144` | unit: deprecated numeric clamps/binary/area behavior and deprecation warnings; own `make_pipmd` helper, no full DLW orchestration. |
| `test-pd_dlw_gd_clean.R:1-3` | placeholder: only multiplication, no grouped-clean call. |
| `test-pd_process_data.R:1-615` | unit/integration-mixed: guards/versioning/inv filters/cached/multi-output/stage refresh/aux subset; scheduling, workers/receipt/checkpoints mostly substituted. |
| `test-pipdata_dlw_compare.R:1-467` | unit/integration-mixed: exact catalogs/candidate/authoritative merges and strict version errors; server/loads/persistence mocked. |
| `test-pipdata_dlw_process.R:1-1104` | unit/integration-mixed: exhaustive wrapper outcome/routing/argument/interrupt/bootstrap/summary/checkpoint facts; delegates largely constructed by helper, storage inspection mocked. |
| `test-pipdata_get_gmd.R:1-1110` | unit/integration-mixed: six-field results/truth table/canonicalization, exact worker args/failures/interrupts, orchestration/reconciliation; real stamp reload subsection, no transport. |
| `test-pipdata_validate_gmd.R:1-1567` | unit/integration-mixed: schema/report consistency/history/reconcile/routing/failure isolation; worker/engine/storage usually mocked; real-engine smoke permits valid/invalid. |
| `test-pipdata_validation_report.R:1-47` | unit: actual status aggregation from manually injected error/success rows and absent-state error. |
| `test-pipeline-context.R:1-80` | unit: option order and deterministic plan hashes/current-node inclusion; synthetic plans. |
| `test-pipeline-run-result.R:1-177` | contract/unit: aggregate schema/counts/null-wave/hash/manifest invariants, portability and S3 registration. |
| `test-pipeline-stage-result.R:1-320` | contract/integration-mixed: stage table/condition/status/portable schemas and v1/v2 final evidence; real c4 multiwave receipts but synthetic stage outputs. |
| `test-recode-spec.R:1-564` | unit/integration-mixed: recode methods, schema/dictionary I/O seams, version attrs, real YAML equivalence; missing indicator/alt-welfare composition. |
| `test-reconcile-pip-inventory.R:1-530` | unit/integration-mixed: sibling retention/downstream invalidation/complete sets, checkpoint ordering/provenance/replay, real manifest/lease files and substituted writers/history. |
| `test-release_mgmt.R:1-167` | disabled: removed functions inside if(FALSE), no active coverage. |
| `test-save_pip.R:1-41` | unit: typed receipt write-error/exact-row/ambiguous-history rejects; pip_write/hash/history mocked. |
| `test-utils.R:1-109` | unit: actual column-to-attribute transforms/error paths and package-env logs/duplicate keys; top-level shared dt object. |
| `test-valid_aux_load.R:1-226` | unit: verbose chain and release/vintage merge over mocked pipaux comparisons; no actual producer data/schema. |
| `test-valid_dlw_load.R:1-1863` | unit/integration-mixed: legacy aux/DLW gating, exact hash version, force selectors/ambiguity/case/dedup/logmeta; aux comparison and master reads mocked, real pipfun logs. Read `1-1704` then `1705-1863` after cap. |

### Binary exclusions (complete tracked inventory, never decoded)

All under `tests/testthat/fixtures/`, inventory label **binary-excluded**:

- `validation_all.rds`
- `validation_aspire.rds`
- `validation_bin.rds`
- `validation_error_all.rds`
- `validation_error_aspire.rds`
- `validation_error_bin.rds`
- `validation_error_gpwg.rds`
- `validation_error_group.rds`
- `validation_error_hist.rds`
- `validation_error_l.rds`
- `validation_gpwg.rds`
- `validation_group.rds`
- `validation_hist.rds`
- `validation_l.rds`
- `validation_skip.rds`
- `validation_skip_blank.rds`

No other tracked textual tests path was omitted. No active `skip()`/`skip_if`/`skip_on` was found in the targeted search; this does not count disabled `if(FALSE)` tests as executed. Module `skip` in engine tests is a real validation route, not testthat's skip mechanism.

## Mock, private state and execution-environment ledger

- **Transport/network**: all exercised DLW calls in these source tests are substituted, e.g. `test-pipdata_get_gmd.R:498-504,534-571`; actual pipaux comparisons substituted at `test-valid_aux_load.R:15-21,39-45,64-74`. No live network/shared-drive credentials are needed for their intended mocked checks. This does not certify isolation of package load hooks or newly introduced I/O before an internal mock.
- **Mock-target drift**: many tests mock internal loaders/planners/workers rather than the outer I/O boundary (`test-pipdata_get_gmd.R:724-783`; `test-pd-run-pipeline.R:233-320`; helper `:646-684`). Those are valid unit seams, not proof that every external call is intercepted. Runtime boundary verification was prohibited; no observed network failure is claimed. For actual acceptance substitute only the explicitly intended transport and preserve real validation/transform/storage.
- **Private cross-package APIs/state**: helper replaces stamp's private `.st_now_utc` (`helper-dependency-fixtures.R:162-165,448-457`). M2 tests access/register/remove base S3 table methods (`test-m2-engine-authority.R:611-620,648-654`) and mutate captured stamp internal receipt/sidecar files (`:384-449`). These are targeted integrity probes, not an upstream runtime contract to reuse.
- **Namespace/process state**: repeated `make_pipmd` names with incompatible constructors appear in `test-pd-deflation.R:17-53` and `test-pd_dlw_clean.R:2-6`; shared helper parses nine test files before tests (`helper-dlw-wrapper-fixtures.R:1-25`). This creates declaration/helper coupling for custom subsets; no actual order-dependent failure was reproduced. `helper-dlw-data.R:107-123` calls `set.seed` without local RNG restoration; several direct builders use random draws without their own seed (`test-dlw_validation_engine.R:144-225`), although their assertions mostly depend on controlled mutations, not exact draws. Random alias in acquisition real-stamp test (`test-pipdata_get_gmd.R:1026-1028`) is not a numerical oracle.
- **Logging/accumulators**: `.pipdataenv` is reset entirely in env tests (`test-pd-env.R:50-61`) and report cleanup often removes rather than restores a prior accumulator. `pipfun::log_init(... overwrite=TRUE)` is used in actual log tests (`test-valid_dlw_load.R:156,244,796`); sandbox load/log-auto state matters. The strongest positive clean fixture mocks logging and sets `pipfun.log.auto=FALSE` (`test-m2-one-survey-acquire-format.R:142-149,417-423`).
- **Files/aliases/hooks**: generic `withr::local_tempdir`/`tempfile` paths inherit runner settings; only the M2 cases assert E: explicitly (`test-m2-one-survey-acquire-format.R:10-16`; `test-m2-engine-authority.R:2-9`). `tests/testthat.R:1-4` loads package, so package hooks can run before tests. Hooks, DESCRIPTION dependency availability and installed library versions are not audited in this tests-only partition; they remain UNKNOWN here and belong to runtime/infrastructure reviewers. Root-level C:/repo in `test-dependency-contract.R:17-19` is a synthetic hash input, not evidence of writes.
- **OS/subprocess**: M2 suite directly calls `Rscript.exe` with `--vanilla` and real library paths (`test-m2-engine-authority.R:320-367`) and Windows `cmd.exe /c mklink /J`/rmdir (`:623-634`). It is not platform-neutral test execution. Fresh-process test inherits environment settings; all process-local TEMP/TMP/TMPDIR, caches, logs and library writes must be directed to E: before any future authorized run.
- **Acceptance scope**: test-source inspection does not authorize publication or any production action. No live shared-drive or production acceptance is established. No tests were run, no R process/package load was started, and binary fixtures remain unread.

## Changes

Only this requested report created. No package changes, Git mutations, R loads, tests, network or pipeline execution.

## Checks run

- Read-only Git: rev-parse HEAD, branch --show-current, status --short in both repositories; ls-files tests in pipdata.
- Final pipdata check at 2026-11-03T15:29:35Z: PROD, fe075a6d49f37d6d131eeadfeb9219c2038899ea, no status entries. Root provenance captured at review start; unrelated root modifications were not touched.
- Tracked inventory count using git ls-files/Measure-Object: 66 files = 50 textual R + 16 RDS binaries. All 50 text files read with specialized Read; two output caps followed to EOF. Targeted Grep checked disabled/skip/indicator/alternate-welfare/strict-deflation/network patterns; not a test execution.
- Report parent existence checked on E:. Required project guidance and R testing/analytical/data.table skills read. Report created running, updated at full-coverage checkpoint, finalized and read back.
- Required execution checks deliberately NOT run: testthat/R/package hooks, fixture regeneration/decoding, actual DLW transport, pipaux update, real pipeline, install, network and any Git mutation.

## Gaps

- RDS fixtures are inventory-only exclusions; content, hashes and baseline correctness are UNKNOWN. Fixture comparator/generator source was reviewed, not decoded output.
- Source assertions are not passing-test evidence. Current pass/fail counts, installed package compatibility, load-hook effects, storage/cache redirection under an actual runner, live DLW and shared-drive behavior remain unexecuted/UNKNOWN.
- All tracked textual tests are covered; runtime source, docs/vignettes and actual pipaux producer fixtures are other reviewers' partitions. No public-function completeness percentage is claimed without their complete runtime function inventory.
- No connected real-validator/real-producer/real-clean/strict-deflation/pinned-readback acceptance exists in the inspected tests. Proposed deltas require a separately authorized implementation/execution step, not a new framework or approval of legacy rebuild authority.
