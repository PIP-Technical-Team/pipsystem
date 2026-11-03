---
schema: pip-handoff-v2
project: pipsystem
task: pipdata-upstream-review
run: 20261103T152032Z-orchestrator
status: completed
updated: 2026-11-03T15:24:11Z
owner: engine-source-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: fe075a6d49f37d6d131eeadfeb9219c2038899ea
plan: NONE
next: Coordinator integrates this evidence with acquisition, processing, tests and documentation reviews; no execution authorized.
---

# Engine source review

## Summary
All 14 assigned R files were read fully. There are two separate available routes, not one connected stamp-controlled production pipeline. The default route coordinates real clean/metadata/deflate workers but retains independent manifest currentness decisions. The opt-in recipes route delegates selection/execution to stamp, but only admits narrow TEST callbacks, not the real cleaning workers. Minimum reuse is to preserve pipdata coordination and the existing stage transformations, connect one real survey through reviewed producer/consumer boundaries, and keep stamp the sole rebuild authority. Do not promote the legacy planner or widen the callback protocol indiscriminately.

Provenance: all package-source citations below refer to `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` at full SHA `fe075a6d49f37d6d131eeadfeb9219c2038899ea`, branch `PROD`. Initial and final read-only Git checks matched this SHA/branch and returned no dirty paths. Short `R/...` citations resolve under that exact absolute root; the coverage table gives full paths. No runtime passes are claimed.

## Actual routes and boundaries

1. **Default full staged route:** `pd_run_pipeline(recipes = NULL)` loads completed validation inventory and master, acquires the legacy manifest lease, prepares its own dependency plan, then dispatches clean, metadata and deflate waves with fresh facts between them (`R/pd_run_pipeline.R:418-517,532-675`). It does not acquire or download a survey: it starts at completed validation metadata (`:451-454`). It returns a `pipdata_pipeline_result` (`:749-776`), not the recipes data.table. Acquisition belongs to a preceding producer handoff, audited separately.
2. **Stage wrapper:** `pd_process_data()` performs legacy clean and metadata waves and returns master inventory; it is not the complete deflation route (`R/pd_process_data.R:108-187`). Its optional `dependency_plan` is advisory: `pd_prepare_execution()` freshly plans before and under a lease; it merely validates the supplied advisory shape (`R/dependency_execution.R:1027-1086`).
3. **Older direct composition:** `process_data()` loads one eligible inventory row, merges PFW, cleans, validates, attaches auxiliary metadata and separately saves clean data/metadata. It returns names, not exact saved receipts (`R/pd_process_data.R:337-380`). `save_pip_data()` catches individual write errors and returns NULL for those entries (`R/save_pip.R:44-81`). `build_pip_inventory()` independently assembles current catalog versions into master and release inventories (`R/build_pip_inventory.R:152-172,281-314,370-376,433-513`). These helpers are reusable evidence, not a third approved scheduler or a release-capture guarantee.
4. **Opt-in M2 recipes:** `pd_run_pipeline(recipes = ...)` immediately returns `pd_engine_run()` and bypasses all preceding legacy stages. It rejects nondefault inventory/force/bootstrap/checkpoint controls (`R/pd_run_pipeline.R:429-440`). `pd_engine_run()` prepares recipes, leases a separate engine-state directory, passes all output requests to `stamp::st_plan_rebuild()` and runs `stamp::st_rebuild()` with the guarded calculation callback (`R/dependency_execution.R:65-107,142-158`). Return value is a data.table with exact request/receipt/outcome fields and actual attempted flags (`:1-9,162-211`).
5. **Preview is currently legacy, not the recipes route:** `pd_change_report()` builds dependency facts and invokes pipdata's own planner without acquiring the writer lease; it prints and invisibly returns a plan list (`R/pd_change_report.R:20-40`). It can load auxiliary objects through `pd_prepare_dependency_facts()` / `pd_freeze_aux_snapshot()` (`R/dependency_execution.R:234-258,439-490`). Thus “without writing artifacts” does not mean metadata-only or no survey-independent data reads. No public recipes preview control occurs in the inspected entry point; no implementation was added.

## Real cleaning workers are not admitted to the current recipes route

This is established by source, not an inferred test failure. Proof requires exactly `(path, parents)` calculation formals, complete immutable constants and named ordinary helpers; it rebinds closure copies to a locked base-parent environment (`R/code_fingerprint.R:169-188,286-327`). Allowed qualified dependencies are only exact reads from pipload/stamp plus `rlang::abort`; dynamic lookup, options, environment state, I/O, S3 dispatch, package internals and undeclared function calls are rejected (`:189-237,245-280,309-320`). Classed operands are rejected at runtime boundaries unless explicitly unclassed (`:356-382`).

`pd_execute_clean(action, inv_row, execution, recode_spec, verbose)` calls an inventory loader, PFW merge, cleaning/validation, metadata creation, execution fences and save receipts (`R/pd_process_data.R:240-287`). Merely listing it as a helper does not satisfy admission: its body includes undeclared/package-qualified operations, ambient execution state and write-side effects. The public direct `process_data()` also mutates package state, saves and logs (`:337-428`). The recipes layer has no stage-name dispatch that substitutes these functions. This means a generic arithmetic recipe pass is not evidence that a real acquired survey reaches clean/deflated storage under stamp authority.

## Prerequisites that a connected one-survey acceptance must make explicit

### Storage and identity

- Recipes require an explicit nonempty release, identity exactly `TEST`, existing absolute E-drive root resolving on E, and a stamp alias already initialized for that same root. Alias selection is the first sorted matching alias; stamp's configured state path is also checked beneath the root (`R/dependency_plan.R:364-384`). All selected outputs and external parent paths must resolve beneath this one initialized root; symlink/junction ancestors are resolved before containment checks (`:342-361,397-414`). Existing legacy aliases on different roots cannot simply be passed unchanged to one recipe envelope.
- Recipe physical formats are explicit lowercase `rds`, `qs2`, or `fst`, and filename extensions, when present, must match (`R/dependency_plan.R:394-401`). Supported-by-contract is not proof that installed serializers are available; those runtime dependencies were not loaded here.
- Legacy context instead requires working-release/identity options and derives five repository roots from aliases or `main_dir/pip_repository/...`; manifest location is another option (`R/dependency_contract.R:266-288`; `R/dependency_manifest.R:1-24`). Auxiliary snapshot uses alias `aux`; output catalogs use `pip`, `pip_meta`, `pip_deflated`, `pip_inv` (`R/dependency_execution.R:234-258,275-280`). Do not confuse this layout with the single-root TEST recipe boundary.

### Parent and output proof

- Recipe parents are exact path/version pairs; mutable selectors and numeric pins are rejected. NULL is permitted only when the parent is another selected output in this same invocation (`R/dependency_plan.R:402-434`). Guarded reads demand the effective exact parent pair, explicit supported pip_read format and, for execution-info reads, a successful receipt proving the declared version (`R/code_fingerprint.R:385-416`).
- Callback returns must contain exactly one named `x` with only the supported optional fields. Requested format must agree; declared semantic metadata cannot be contradicted (`R/dependency_execution.R:120-140`). Successful output status is cross-checked using exact receipt IDs and same-pin metadata-only `pipload::pip_read()` (`:170-184`). Semantic metadata comes from the request, not an automatically inferred PIP schema.
- Legacy clean receipt sets must match all accepted PFW-derived expected PIP IDs, including multiple welfare outputs from one survey (`R/dependency_inputs.R:183-255,597-662`; `R/pd_process_data.R:248-287`). Acceptance cannot silently select just one output if the chosen survey produces two.

### Survey, auxiliary and metadata inputs

- Current source filters completed inventory to `status == "valid"` and `data_available == "Yes"` and repeats the gate at the worker; post-format clean validation occurs before save (`R/dependency_execution.R:214-231`; `R/pd_process_data.R:226-260,349-370`). This corrects the older source limitation quoted in `pipsystem/SYSTEM_DESIGN.md:382`; do not carry that historical claim forward as current source behavior.
- The full legacy coordinator freezes the canonical six auxiliary measures PFW/CPI/PPP/pop/GDP/PCE even though its metadata wave requests CPI/PPP/pop (`R/pd_run_pipeline.R:1,504-516`). The snapshot reads pinned auxiliary artifacts and verifies hashes (`R/dependency_execution.R:234-258`). Minimum legacy clean execution itself creates metadata from the full snapshot before saving clean data (`R/pd_process_data.R:245-256`), so missing metadata inputs can prevent clean publication; a data-path-first design should make this coupling explicit rather than claim cleaning needs only PFW.
- Exact PFW mapping requires country/year/acronym/module, welfare and PIP ID downstream, inclusion `inpovcal == 1`, unique welfare mapping and supported domain fields (`R/dependency_inputs.R:147-237,257-317`). Auxiliary projections require exact columns including CPI survey keys, all PPP release/adaptation-year identifiers, and domain-specific values (`:331-373`). Missing or ambiguous projections abort; these are not arbitrary country/year slices.
- Metadata worker requires either successful clean-result metadata, explicit reconstruct permission with exact clean receipt, or an exact base metadata pin/hash. It reconstructs invalid bases from exact clean data and refreshes selected auxiliary fields (`R/pd_metadata_refresh.R:53-140`). “Metadata” here is a separately saved `pip_meta` object, not automatically a stamp custom sidecar.

### Runtime APIs and side effects

- Recipes check actual public function exports/formals, not version labels: pipload `pip_read`; stamp request-aware planner/rebuild, execution-info, version-aware sidecar/version loading, alias and option APIs (`R/code_fingerprint.R:145-166`). Nonempty recipes require optional `codetools`; missing capability aborts before the lease/rebuild (`:136-166`; `R/dependency_execution.R:65-75`). Installed producer capability is UNKNOWN here.
- Recipes write a lease beneath `.pipdata-engine-state/dependency-manifest/<scope>/writer.lease/owner.rds`; no legacy manifest scheduling is used. Scope includes release, TEST identity and canonical root, not calculation fingerprint (`R/dependency_execution.R:71-89`; `R/dependency_plan.R:435-439`; `R/dependency_manifest.R:53-66`). Frozen checks include every R option and stamp alias/options, so a legitimate worker that mutates unrelated options is not transparently admissible (`R/dependency_execution.R:12-33`).

## Findings and invalidation limits

**[P1]** `R/dependency_plan.R:76-111,212-228` -- Default route retains a second rebuild authority.
**Issue**: pipdata converts its manifest/fact comparisons into create/rebuild/refresh/none decisions; stamp receipts verify storage, but stamp does not select those legacy actions. Entry-point prose calls C2 manifest plus receipts the “only currentness authority” (`R/pd_run_pipeline.R:311-339`).
**Impact**: Reusing the default route wholesale would preserve a source-visible conflict with fixed stamp-only authority (`pipsystem/SYSTEM_DESIGN.md:186-203,290-307`), even though pipdata is correctly the coordination location.
**Fix**: Reuse stage transformations/receipt and feedback knowledge; route requested work through stamp instead of blessing C2 decisions. Keep legacy evidence as migration reference. One functional check: one connected synthetic survey under the public pipdata route gives stamp-selected work initially and stamp-selected skips on the unchanged second invocation, without legacy manifest planning deciding the result.

**[P1]** `R/code_fingerprint.R:169-327` -- Narrow proof protocol excludes the real cleaning path.
**Issue**: Existing stage workers require I/O/dispatch/state outside the recipe protocol, while the recipe entry point bypasses those workers (`R/pd_run_pipeline.R:429-440`; `R/pd_process_data.R:240-287`).
**Impact**: Completed engine recipes and completed legacy acquisition/format work do not establish a connected data-path-first M2 route.
**Fix**: Add only the smallest reviewed stage adapter/boundary needed to consume one pinned acquired survey and produce its complete clean output set. Keep lookup/read/save coordination separate from a result-returning calculation; do not wrap the entire legacy worker as an allegedly pure helper or build a new scheduler. One functional check: real cleaning/validation functions run on a synthetic acquired artifact with PFW and return saved, version-pinned clean outputs plus matching metadata; invalid formatted output produces no accepted clean output. Exact adapter mechanism remains a design choice, not implemented or approved here.

**[P1]** `R/dependency_manifest.R:605-619` -- Legacy stage-global fingerprints can hide remaining code-only work after partial success.
**Issue**: Manifest fingerprints are keyed only by stage/component (`R/dependency_contract.R:53-55,138-139`). A successful entity checkpoint overwrites the stage-wide table. Next planning compares that shared table when present, falling back to the entity record's code_hash only when no component rows exist (`R/dependency_execution.R:899-932`). Static trace: change clean code; rebuild one entity and checkpoint; restart while another entity still has its old record hash; shared components now match and the old entity hash is not compared in that branch.
**Impact**: An interrupted or restrictive canary legacy run can leave old-code outputs appearing current when inputs did not otherwise change. This is a source-visible risk, not an observed wrong result or executed reproduction.
**Fix**: Do not transplant this optimization into stamp request proof. If legacy coexistence must be supported, compare each record's aggregate code hash even when shared component details exist; keep component rows explanatory. One functional check: two entities, a code-only change, checkpoint just one, restart; second entity remains selected. No need for a new manifest framework.

**[P2]** `R/reconcile_pip_inventory.R:25-49,53-60` -- Legacy reconciliation defeats unchanged-output early cutoff.
**Issue**: Every clean reconciliation clears metadata/deflated pointers; every metadata reconciliation clears deflated pointers, without checking whether the successful receipt preserved the prior content/version.
**Impact**: Equivalent-output recomputation can cause unnecessary downstream refreshes. `pd_dependency_completeness()` only checks plan actions and unknown/drift reasons, not an independent stamp proof (`R/dependency_bootstrap.R:1-6`). Recipes instead have the machinery to use returned effective parent pins, but actual early cutoff remains untested here (`R/dependency_execution.R:98-107,145-184`).
**Fix**: Use stamp's effective parent/output pin behavior for the connected path; do not copy unconditional pointer clearing. Only adjust legacy reconciliation if needed for that path. One functional check: a parent rule change returning identical content gives a new successful receipt, retains its output pin and skips its unchanged child.

**[P2]** `R/dependency_manifest.R:509-539,624-629` -- Legacy checkpoint is ordered publication, not atomic release capture.
**Issue**: Release inventory is saved first, master next, manifest last. Artifact writes already happened before checkpoint (`R/pd_process_data.R:253-262`). Manifest cleanup keeps only at least three checksum-valid generations (`R/dependency_manifest.R:192-210`). Older direct assembly additionally swallows old-master read failures and can proceed after release-write errors (`R/build_pip_inventory.R:76-79,447-513`).
**Impact**: A partial failure can leave durable artifacts/inventory writes without the final manifest; no exactly-once or complete named-release history guarantee follows from these functions. Manifest generations are not the retained release references required by design.
**Fix**: For the minimum TEST acceptance, use exact artifact/receipt pins and record actual outcomes; do not equate master/release inventory saves with completed release registration. Preserve the fixed release-history policy; atomic named-release capture stays a separate unresolved mechanism (`pipsystem/SYSTEM_DESIGN.md:238-256,341`). One functional check if checkpoint reuse is changed: fail between master publication and manifest publication, restart, and demonstrate no false accepted success or lost exact output pin. Do not run this against production storage.

## Minimum connected one-survey acceptance (proposal, not an executed workflow)

**Existing callable processing sequence, without inventing a scheduler:** `process_data(inv = one_completed_valid_row, aux_list = frozen_aux_objects, recode_spec = resolved_spec, verbose = FALSE)` already calls real load/merge/clean/post-validation and saves clean plus metadata (`R/pd_process_data.R:337-380`). For a more inspectable in-memory handoff, the same source shows the order `inv_dlw_load()` -> `pd_cpfw_merge()` -> `pd_dlw_clean()` -> `pd_validate_clean_output()` -> `pd_aux_attr()` -> separate exact-receipt saves (`:240-287`). This is useful for first proving data flow in isolated storage, but is NOT stamp-selected M2 execution and must not be described as exact-pin acquisition consumption until its loader boundary is checked/corrected. The acquisition reviewer reports `inv_dlw_load()` currently reads by survey ID rather than inventory version (`R/inv_dlw_load.R:21`, peer-supplied evidence, not independently read in this partition). The same reviewer reports the public acquisition wrapper touches unrelated aliases and selected validation reconciles global state before worker filtering; use isolated roots/aliases for subsequent authorized acceptance. Those acquisition findings require coordinator integration, not blind reuse.

The shortest useful acceptance is not a new scheduler and not a bulk production run:

1. Start with one synthetic/approved nonprivate GMD-shaped acquisition output plus its completed-valid validation row, exact stamp version, module-bearing identity and complete PFW mapping. Use the real acquisition/validation producer contract supplied by the other review; no production data or network is needed for an offline functional check.
2. Consume that exact output in the reviewed pipdata clean adapter, reuse actual PFW merge/recode/clean/post-validation functions, and publish all expected clean PIP IDs with their necessary metadata. Read back each exact saved version through the intended pipload/stamp API and verify its shape/content and module/version semantics. That is the minimum upstream producer-to-consumer proof; a hand-written arithmetic recipe or a clean worker with its loader entirely mocked does not replace it.
3. For the complete data-stage chain, connect exact clean+metadata+CPI/PPP/pop inputs to actual deflation and save/read back one deflated output. Processing review owns exact welfare naming/units and validation requirements; this partition does not certify them. Mean/release assembly are later consumers, not prerequisites for proving acquisition-to-clean connectivity, and are still needed before claiming the entire M2 milestone complete.
4. Repeat unchanged and show stamp selects skips; then revise the relevant input and show only the dependent chain is selected. Keep a distinct same-output check for early cutoff. A code-only change is needed to establish request-fingerprint integration; a data-only rerun does not demonstrate it.

This acceptance is a recommendation for subsequent authorized work. All runs remain analyst-started; deterministic failures do not become automatic retries. Fixed authority/location/failure decisions are in `pipsystem/SYSTEM_DESIGN.md:186-223,268-274,299-307`. Row-level R1 selection is still Open (`:194-199`): legacy exact projections are reusable evidence, not approval of a row-level policy.

## Minimum reuse and Later

- Reuse the existing public `pd_run_pipeline` coordination boundary, real cleaning and validation functions, exact PFW mapping/output-set checks, metadata reconstruction, pipload versioned access and stamp request/execution APIs. Do not create another package, scheduler, plan registry or general callback-discovery system.
- For metadata/adapter separation, one functional check is the synthetic acquisition-to-clean exact readback above. For the stamp authority connection, one functional check is the unchanged second invocation with stamp-selected skips. For any fingerprint correction, use the two-entity partial-checkpoint check above. These are proposed checks, not inferred passes.
- **Later:** broader API/format coverage, production Windows/SMB activation evidence, general worker admission, wider dependency discovery, bulk performance/concurrency, richer preview UX and module refactoring purely to meet a line-count target. Existing long files are documented below; splitting them is not needed for this evidence task. Production credential/private-data/publication protections remain essential when production work is separately authorized, but no additional safeguards were implemented here.

## Per-file coverage

Every file below was read from first through final line, including comments/documentation as evidence only. “Fully read” is not “executed” or “verified at runtime.”

| Absolute source path | Complete range | Reviewed responsibility |
|---|---:|---|
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/code_fingerprint.R | 1-420 | Curated legacy hashes; recipe proof, read and base-operation boundaries; producer capabilities |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/dependency_bootstrap.R | 1-6 | Plan completeness criterion |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/dependency_contract.R | 1-291 | Actions/manifest validation, scope context, schema and hashing |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/dependency_execution.R | 1-1218 (1-1000;1001-1218) | Recipe execution and receipts; legacy facts/snapshots/planning fences/checkpoints |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/dependency_inputs.R | 1-663 | Indexed auxiliary/PFW projections, input composition, exact output/receipt sets |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/dependency_manifest.R | 1-637 | Lease lifecycle, generation persistence, ordered inventory/manifest checkpoints |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/dependency_plan.R | 1-440 | Legacy selection/bootstrap and recipe context/path/request preparation |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/pd_run_pipeline.R | 1-777 | Public route split, legacy stage waves, feedback and logging |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/pd_process_data.R | 1-433 | Stage wrapper, real clean worker, direct composition and validation/save ordering |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/pd_metadata_refresh.R | 1-141 | Base validation, exact reconstruction, metadata refresh/save |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/build_pip_inventory.R | 1-630 | Older catalog assembler, schema stripping, master/release writes |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/reconcile_pip_inventory.R | 1-76 | Atomic output-set replacement, tombstones, downstream invalidation |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/save_pip.R | 1-153 | Older save helper and exact-version/hash receipt verification |
| E:/PovcalNet/01.personal/wb384996/PIP/pipdata/R/pd_change_report.R | 1-70 | Read-side legacy preview and printed disposition summaries |

## Changes
Only this report created, checkpointed and finalized. No package/source, Plan, roadmap, protected-design or Git changes. No new worker or session created.

## Checks run
- Read governing charter, SYSTEM_DESIGN, HARVEST_BRIEF, and handoff contract.
- Read-only Git revision, branch and status checks; no package loads, tests, pipeline execution, installation or network.
- Repeated `git rev-parse HEAD`, `git branch --show-current`, `git status --short` at completion: full requested SHA, PROD, clean output again.
- Fully read all assigned files using read-only file tools; explicit pagination for the 1218-line execution file. Governing files read fully: compound-gpid.md 1-40, SYSTEM_DESIGN.md 1-385, HARVEST_BRIEF.md 1-131 and CONTRACT.md 1-94.
- Static call/data-flow tracing only. Loaded technical-communication, R technical, data.table and collapse guidance. No private or production datasets opened. System clock/timezone checked read-only; report timestamp is UTC.
- Proposed functional checks above were NOT run. No test/pipeline pass, installed-package compatibility, production readiness or SMB safety is asserted.

## Gaps
- Installed stamp/pipload capabilities, serializer availability, exact producer builds and runtime numerical correctness are UNKNOWN; package loads/tests were prohibited.
- Acquisition, other processing helpers, tests and vignettes were deliberately left to their assigned reviewers. Their findings must be integrated by the coordinator; no full-package review claim is made by this partition.
- A concrete real-worker adapter is absent from this inspected recipe route. Its minimal supported mechanism and any version-aware semantic metadata integration need subsequent authorized design/implementation; this review does not widen the callback allowlist or approve a mechanism.
- PFW/module choice, R1 selective invalidation, named-release atomic capture/history and production activation remain subject to the governing Open items. Source/vignette descriptions do not settle them.
- The stage-global fingerprint risk is a static multi-call trace, not a reproduced runtime failure. Prior historical design citations may describe older package source; current invalid gating and post-format validation are materially improved at this SHA.
