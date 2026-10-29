# Pipload Adapter Plan Revision: Before/After Evidence

Task `adapter-plan-revision`; run `20261022T201230Z-code-plan-revision`. Direct reporting/document-only approval received `2026-10-22T20:43:54Z`. Initial report clock `2026-10-22T20:46:02Z`; native diff/hash checkpoint `20:53:17Z`; explicit native-exit/complete amended-Plan readback checkpoint `20:54:05Z`; comparison-evidence update clock `20:54:58Z`. These are actual captured UTC clocks, not the run-folder identifier's 20:12:30 time. Individual unrecorded read/command UTCs remain UNKNOWN.

## E1: Authority, Inputs and Paths

Only three files are writable: canonical `E:/PovcalNet/01.personal/wb384996/PIP/pipload/.cg-docs/plans/2026-10-20-m2-pipload-stamp-adapter.md` and this run's `handoff.md`/`evidence.md` under `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipload/adapter-plan-revision/20261022T201230Z-code-plan-revision/`. No new supporting/helper file or temporary before-image was created. Every actual write is on E:. Human reporting owner and request/coordinator/native IDs UNKNOWN; existing pipload session owns this report. Unknown IDs do not block interpretation or imply private-session discovery.

Instructions read completely: pipload `.kilo/AGENTS.md:1-26`, charter `compound-gpid.md:1-26`, local config `compound-gpid.local.md:1-30`; central `CONTRACT.md:1-113` and `templates/handoff.md:1-71`. Workflow is a bounded document amendment, Compound GPID command NONE. No `/cg-plan`, `/cg-work`, new review, helpers or lifecycle mutation. Existing coordination formal registration remains deferred; no state/registry/request edit.

Read-only canonical inputs: prior reconciliation `handoff.md` (160 lines) and `evidence.md` (144 lines) at `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipload/producer-pin-prerequisite-check/20261022T172056Z-pipload-reconciliation/`. Fresh non-writing Git blob hashes, in that order: `acf5c053b2c7c7f2656405e1e9645546ccb98ca7` and `20e7e148af49374b061db8b6d5e42475b280a802`. No link into stamp/source/archive/private runtime evidence was followed. These prior records retain their then-applicable blocked result; this user-authorized amendment does not rewrite them.

Preflight captured `2026-10-22T20:44:50Z`: Resolve-Path returns the exact Plan and existing reporting-parent E: paths. Bounded Get-Item attribute/LinkType/Target checks of existing E: ancestors through each parent found no redirecting reparse point. Independent Get-Acl reads of the Plan and reporting parent showed existing account access, not human/exclusive ownership or hostile-writer certification. Run folder and both destinations were absent; task-level parent absence was separately checked. File creation succeeded within approval. No permission denial was bypassed.

## E2: Before/After Identities and Mechanical Diff

| Item | Exact observation |
|---|---|
| Current source checkout | `E:/PovcalNet/01.personal/wb384996/PIP/pipload`; existing main checkout, `PROD`; HEAD/base `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| Starting Plan | 362 lines; raw working-copy Git blob `fb70122706185d51ff458e6040507033a699cda9`, exactly the user-required starting identity |
| Before-image validation | Before Plan editing, this assigned evidence.md temporarily contained only the exact 362-line old Plan; `git hash-object --no-filters -- <Plan> <evidence.md>` returned the same old blob twice |
| Amended Plan | 371 lines; raw working-copy Git blob `ffc48cfc78434cb893684c41b7429280aebb1b2c` |
| Native diff | Compared the exact before-image to amended Plan before adding this evidence wrapper; 1 file changed, 36 insertions(+), 27 deletions(-), net +9 lines |
| Full readback | Entire amended Plan read via Read, slices 1-200 and 201-371, in checkpoint captured `20:54:05Z` |
| Tracked package preservation | `git diff --exit-code HEAD -- R tests man NAMESPACE DESCRIPTION` returned 0/no output |

The old Plan was untracked, so ordinary `git diff HEAD` cannot establish this amendment's baseline. Instead the exact before-image was created within the already assigned evidence file, verified byte-identical by raw Git hashes, and used for native no-index diff. This wrapper was added afterward; the original before-image remains verbatim in E7's fenced block, not a second active Plan or an approved implementation instruction. Its original line numbers are the before-image source line references below. The completed evidence file's own raw hash is necessarily different from the old Plan blob.

Native commands actually executed, no external diff/text conversion driver and no Git object writes:

```text
git diff --no-index --no-ext-diff --no-textconv --no-color --unified=0 -- <exact-before-image-evidence.md> <canonical-Plan>
git diff --no-index --stat -- <exact-before-image-evidence.md> <canonical-Plan>
git diff --no-index --check -- <exact-before-image-evidence.md> <canonical-Plan>
git hash-object --no-filters -- <canonical-Plan> <exact-before-image-evidence.md>
```

The stat/check native exits were explicitly captured with `$LASTEXITCODE`: **both 1**. Stat 1 is expected for different files. Check emitted no whitespace-error diagnostics, but also returned 1 in this no-index differing-file invocation; it is not reported as exit 0. Both paths generated Git LF-to-CRLF normalization notices. No formatting command or config update was performed. Full zero-context diff was inspected: all edits belong to the authorized rule replacement, necessary terminology/cross-references, dated amendment authority and explicit pipdata/stamp fixture boundary. No unrelated behavior, test, phase, safety or compatibility decision was settled.

## E3: Substantive Acceptance-Rule Comparison

| Surface | Before (original source lines) | After (canonical amended source lines) |
|---|---|---|
| Authority | :32 only capture/review authority | :34 explicitly records direct 2026-10-22 bounded amendment, no execution/phase/gate approval |
| Pin identity | :50 UNKNOWN exact tested commit, mandatory implementation block | :52 candidate immutable source `5d1ddebdc926dad9c6ec99c08a65e74baee0da92`; :53 historical clean-at-execution tested commit still UNKNOWN, not a mandatory prospective prerequisite |
| Producer binding | :60 required past full tested commit/close-out | :63-65 historical records remain qualified; prospective loaded producer must match fixed source before behavior changes, with source/archive/build/library/runtime/dependency/consumer evidence |
| R1 | :86 establish exact tested pin before implementation | :91 explicit immutable source plus separately approved prospective consumer loaded-source proof before behavior changes; ownership/API/safe gate retained |
| Pre-Start Gate | :138 historical tested full commit/verified past binding required | :145 recorded immutable pin plus separate direct approval of exact prospective gate/commands/resources/outputs; inherited results do not pass it. Other gates at :146-147 remain required |
| Step 1 sequencing | :150-153 loaded identity verification plus historical prerequisite | :157-160 prospective V1 must establish actually loaded equality and consumer content before Step 2/behavior changes; missing dependencies stop, no automatic install |
| V1 | :274 actual loaded tested producer, verified historical close-out | :281 immutable source and prospective source/archive/build/library/runtime/dependency/consumer binding, exact commands/results/native exits, approved safety/runtime |
| Stop conditions | :310 missing historical exact tested commit blocks pre-start | :317 missing pin/approval/other gates blocks pre-start; :318 missing/failing loaded-source prospective V1 blocks behavior changes |
| Historical gaps | :319 historical missing tested commit a mandatory gate | :327 historical clean-at-execution gap remains UNKNOWN/not relabeled; :328 prospective proof still unapproved/unexecuted and blocking |
| Authority boundary | :112 already excluded new adapter rebuild/currentness mechanisms | :119 explicitly keeps orchestration in pipdata, authority in stamp; direct fixture calls do not authorize a pipload engine/scheduler |
| Consistency references | Old :72/88/98/106/109-110/116/128/140/238/302/321/353/357/359/361 | New :77/93/103/111/114-115/123/135/147/245/309/330/362/366/368/370 refer to pinned-source prospective verification, not renewed historical mandatory proof |

Key exact old R1:

> Establish exact tested producer pin, ownership, API and approved safe gate before implementation

Key exact new R1:

> Fix an explicit immutable producer-source pin and require separately approved prospective consumer proof that the loaded producer matches it before adapter behavior changes; retain ownership/API/safe-gate prerequisites

Key new verification evidence (Plan:65): producer source/content SHA; archive path/digest; build/install identity and commands; actual loaded library path/content binding; runtime/OS/dependency versions; exact commands/results/native exits and warnings/skips/exclusions; consumer HEAD and any dirty working-content/test identity. Source-to-archive-to-build-to-loaded-library evidence is required, not a package-version assertion. This gate requires its own explicit commands/resources/output approval before any execution.

Nothing now asserts that candidate content was historically clean at execution or that a historical producer check is prospective consumer evidence. The previous reconciliation's 4128 PASS and archive claims, original 1873/9/7 results, native-exit/dependency gaps and exact historical tested-commit UNKNOWN remain historical; no old result was rerun, relabeled, promoted or closed.

## E4: Scope Preserved and Remaining Blockers

Unchanged: frontmatter/date/status/deviation policy/phase count, two exact Phase headings and four globally numbered steps; no completed-phases/current-phase/report pointer update. Proposed source/test/Rd paths, test command/eight exclusions, failure matrix, data/version/format/sidecar/receipt behavior, all V2-V6 rows and C1-C6, lifecycle/worktree proposals and 2026-10-21 review outcome remain unchanged. Only V1/R1 and necessary related references changed. The old review result was not rerun or asserted to certify this amendment. The known NULL/live-versus-latest ambiguity and other reconciliation open items remain unresolved, not silently fixed.

Still unsatisfied: separate prospective producer-loaded verification approval/execution; API/signature/format/metadata/failure mapping/dependency compatibility decisions; actual consumer runtime/library/dependency identities; exact owner/write set and lifecycle permissions; approved safe full suite or exact substitute/exclusions and resource/hook/cleanup/profile/library arrangements; later implementation approval. Candidate pin alone satisfies none. A single direct-stamp RDS fixture cannot certify all adapter behavior or authorize orchestration. Pipdata orchestrates; stamp owns version/hash/parent/rebuild/currentness; no scheduler/cycle added.

Historical full manifests/raw native-exit/runtime/load bindings remain incomplete. Human/request/coordinator/native IDs remain UNKNOWN. No source, package test/doc/config, prior report, lifecycle, roadmap or registry changes permitted. No stamp repository access, provenance search, runtime, tests/install/build/helper/network/Git write occurred. New renderer/schema/Plan validation was not run: historical successful validation does not certify the amended blob. Readback/native diff are the only new document checks, not implementation readiness.

## E5: Executed Checks and Evidence Qualification

OBSERVED: instructions/contract/template/current Plan/prior two reports fully read; root/HEAD/status/worktree and Plan hashes; resolved E: paths/ancestor/ACL/collision checks; exact baseline equality and native full/stat/check diff; package preservation diff; actual amended Plan readback; clocks. Capture bounds 20:44:50Z through 20:54:05Z, wrapper update 20:54:58Z on 2026-10-22. Individual UTCs otherwise UNKNOWN. No source/test execution or candidate/library verification is implied.

DOCUMENT-REPORTED/WORKER-REPORTED: prior producer content/archive/check associations, old Plan review and historical document validation retained from the read-only inputs/before-image. No new producer source/raw artifact/log access or test rerun. A source candidate is not a tested runtime dependency; testedPins stays empty for this task.

The only writes are the amended Plan and two approved central files. Existing dirty `.gitignore`, `.compound-gpid/`, `.github/skills/`, `sessionInfoLog` remain unrelated and preserved; Plan remains untracked and unpublished. No staging, commit, merge/PR, branch/worktree or remote/default-branch operation. Final preservation/output readback will be recorded in the handoff, not fabricated here.

## E6: Smallest Proposed Continuation

Owner: user/coordinator, then this existing pipload worker only after a new exact approval. Propose the bounded prospective source/archive/build/library identity verification gate for candidate `5d1ddebdc926dad9c6ec99c08a65e74baee0da92`, with actual permitted source/runtime/library/resource/read/write/report paths, commands/native exits, safety and dependency arrangements defined before execution. This report assigns no such commands or new output paths and starts no gate/helper/session. Acceptance must bind actual loaded producer to fixed source and record runtime/dependencies and exact consumer content. If proof/access/safety is missing or mismatched, stop before behavior changes. API/compatibility/lifecycle and implementation approvals remain independent even if that identity gate later passes.

## E7: Exact Original Plan Before-Image

This fenced block is the original 362-line evidence baseline that was hash-verified equal to `fb70122706185d51ff458e6040507033a699cda9` and used for the mechanical diff **before** this wrapper was added. It is historical supporting content, not a newly active Plan, current acceptance rule or approval. The canonical amended Plan is the separate path above; earlier historical wording here must not override its authorized amendment.

~~~markdown
---
date: 2026-10-20
title: "M2 Pipload Stamp Adapter: Forwarding, Receipts, and Pinned Access"
status: active
scope: "Standard"
brainstorm: "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md"
language: "R"
estimated-effort: "medium"
deviation-policy: "ask"
artifact-schema-version: 1
artifact-html: false
phases: 2
tags: [m2, pipload, stamp, adapter, historical-pins, receipts, test-safety]
---

# Plan: M2 Pipload Stamp Adapter

## Objective

Define the minimal pipload-local adapter work for task `m2-pipload-adapter-plan-2026-10-20`, milestone `m2-walking-skeleton`, feature `create-engine-skeleton` (pipload adapter sub-work set). Preserve stamp as the authority for versions, hashes, parents, and currentness while forwarding approved producer contracts and providing exact-pin data/metadata access with fst/qs2 compatibility.

**DOCUMENT CAPTURE ONLY. Implementation readiness: BLOCKED.** The user approved saving exactly this Plan after reviewing the completion-contract preview. This approves no implementation, tests, dependency installation, lifecycle writes, roadmap changes, worktree creation, or execution of `/cg-work`. All implementation steps and commands below are proposals for later approval. `status: active` describes the planning artifact, not an active implementation phase. No completed phase, execution report, or active-state pointer is recorded.

## Context

### Authority and Permissions

The active root is `E:/PovcalNet/01.personal/wb384996/PIP/pipload`. The charter's objective is PIP loading and inventory management; its current focus is compatibility with the new pipeline. This adapter scope aligns with that charter. Local configuration selects R, package development, data.table-collapse syntax, and standard review depth.

The current direct approval permits creation only of `.cg-docs/plans/2026-10-20-m2-pipload-stamp-adapter.md`. The target was absent at initial and pre-save directory inspection. Directory ACL inspection reported owner `WB\wb384996`, that account FullControl, and other existing access entries. This is observed ACL evidence, not proof of exclusive ownership, worker absence, general sandbox enforcement, or a successful write before saving. Other workers' assignments, liveness, and write sets are UNKNOWN. Native session ID is UNKNOWN and optional.

The preceding paragraph records the original capture authority. On 2026-10-21 the user explicitly requested `/cg-plan-review` and correction of all findings in this existing Plan, without starting `/cg-work`. That authorizes read-only critic dispatch, revisions to this Plan only, and no-derived-output revalidation/readback. It grants no package/runtime tests, lifecycle/roadmap writes, new review report, worktree, helper runner, or implementation approval. Original pin observations and capture outcomes remain historical evidence rather than fresh runtime facts.

Read-only design inputs are `pipsystem/SYSTEM_DESIGN.md`, `pipsystem/.cg-docs/plans/2026-10-10-m2-walking-skeleton.md`, and `pipsystem/.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md`. They are not execution targets or runtime dependencies. Do not modify stamp or pipsystem. Design section 4 requires historical metadata from the same artifact version; sections 6 and 10 reserve rebuild authority to stamp and assign access to pipload. The umbrella's Step 3 separates pipload work under the engine feature and requires tested producer evidence. The brainstorm's adapter unit and test-safety sections are historical proposals, not current execution permissions.

### Repository and Pin Evidence

| Evidence | Observed value | Limits |
|---|---|---|
| Pipload root and origin | Root above; `https://github.com/PIP-Technical-Team/pipload.git` | Organizational remote identity, not assignment of all local work |
| Current branch, HEAD, proposed base | `PROD`; `ff9a81e386a09fb2531c154f63fd2b91521313c6` | Starting/pre-save observed baseline, not an executed adapter commit |
| Default branch | `git symbolic-ref refs/remotes/origin/HEAD --short` returned `origin/PROD` | No assumption of main/master and no network freshness check |
| Local remote-tracking base | `refs/remotes/origin/PROD` resolves to the same pipload SHA | No fetch or remote/API access performed |
| Existing changes | Modified `.gitignore`; untracked `.compound-gpid/`, `.github/skills/`, `sessionInfoLog` | Preserve without reading runtime/session content or modifying these paths |
| Inspected pipload source identity | `git diff --exit-code HEAD -- R tests man NAMESPACE DESCRIPTION` exited 0 | These inspected package files match the observed SHA; runtime behavior untested |
| Registered pipload worktrees | One checkout, on `PROD` | Does not establish other processes/workers are absent |
| Proposed branch | `feat/m2-stamp-adapter`; exact local ref lookup failed because absent | Not created; recheck collisions before future use |
| Stamp inspected source | Root `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp`; branch `ready_cran`; HEAD `235a18a58eabe15d5c98e7e4ee0e582eac60b4f5` | Current source observation only, NOT the tested producer pin |
| Stamp dirty-source limits | Modified `.gitignore`, `compound-gpid.local.md`; untracked `.compound-gpid/` | No stamp writes; package execution not performed |
| Exact tested stamp producer commit | **UNKNOWN** | Explicit implementation-blocking gap; no substitution by branch, version, HEAD, installed package, or CRAN |
| Pipdata dependency evidence | Root `E:/PovcalNet/01.personal/wb384996/PIP/pipdata`; `PROD`; `84442e979c98d33fa5565ab9e56d3179cc7d5278`; clean short status; DESCRIPTION diff against HEAD exited 0 | Inspected dependency direction only; no pipdata execution |
| Dependencies actually tested here | NONE | R, installed package paths/versions, package hooks and loaded producer identity not probed |

### Missing Producer Close-Out Binding

No exact producer close-out handoff or tested commit was attached to the invocation. A discovered document, `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp/.cg-docs/work-reports/2026-10-15-m2-stamp-generic-gaps.md:313-327`, reports final installed tests PASS1873/FAIL0/WARN9/SKIP7, plus two deliberately excluded-vignette check warnings. Those are document-reported producer results, not tests rerun or independently certified here.

Crucially, report line 319 binds tests to an **uncommitted working-copy manifest**, not its base commit `ad9a483b6261166a6feefc64baea5d602198977b` alone. It records source-manifest MD5 `302c32dc5945df7875c192f7ae6aa9c2` and tarball MD5 `5643aa2026c3ef9dc80340304b9b7549`. These are historical local artifact identifiers, not a commit binding or cryptographic certification. Subsequent observed Git history includes further persistence/audit fixes and a merge; neither history nor current HEAD proves which commit passed the required producer close-out gates. Do not promote that manifest, report, base, or current HEAD into the missing exact tested commit.

Later implementation must receive the close-out handoff, full tested commit, executed evidence paths/results and source-to-built-package binding. Verify the commit exists, identify the tested API/docs/tests there, reconcile changes since the historical report, and establish that the loaded dependency is built from that exact pin. If unavailable, remain blocked rather than install/update or choose another producer.

### Existing Patterns and Minimal Changes

| Observed source | Finding | Planning consequence |
|---|---|---|
| `R/pip_read-write.R:48-107,151-187` | Read forwards version and alias; write forwards metadata/code/format/pk plus `...` and returns stamp's result invisibly | Verify parents, modern request/semantic schema and receipt preservation through existing forwarding first; no duplicate argument/store framework |
| `R/load_aux_data.R:37,61-66` | Artifact uses caller format in its path, but the nested `pip_read()` omits format | Propose passing `format = format`; test fst and qs2 explicitly |
| `R/load_pip_data.R:83-85,89-105,139-145,375-389` | Loader forwards format/version, but direct-ID checking removes any original extension before rewriting to qs2; inventory-derived IDs bypass that helper | Check original extension/format agreement before normalization on both paths; preserve existing extensions for format NULL and identity/default compatibility; no module identity migration |
| `R/pip_inv_enrich.R:219-282` | Constructs `versions/<id>/artifact` and calls qs2 directly; missing/read failures warn and yield NA, with an all-unreadable layout error | Replace private layout access with pinned public artifact loading; preserve legacy warning/NA behavior explicitly, never treat it as successful required-pin verification |
| `tests/testthat/test-pip_inv_enrich.R:1-14` | Builds imitation storage paths rather than actual stamp artifacts | Convert affected fixtures to real isolated stamp saves/pins before claiming integration |
| `DESCRIPTION:17-47`; `R/load_pip_deflated_data.R:146-172`; pipdata `DESCRIPTION:12-34` | Pipload imports stamp, fst, qs2 and pipfun; pipdata imports pipload; pipload's reverse convenience dependency on pipdata is only Suggests | Do not promote pipdata to Imports or route M2 I/O through deflation convenience calls |
| Inspected stamp `R/IO_core.R:588-626`, `R/format_registry.R:443-498` | Current source has versioned data and exact-version data-free sidecar access | Candidate public surfaces only until verified at the tested producer commit |

Pipload's DESCRIPTION says stamp >= 0.0.10, not an exact tested dependency. A package version floor does not prove the modern producer contract. No DESCRIPTION, NAMESPACE, lockfile, or dependency change is proposed under this bounded work set; if a shipping dependency-floor policy is necessary, pause for exact approval rather than ship unsupported assumptions.

### Prior Work and Learnings

No existing M2 adapter Plan matches the target filename/topic. Existing recent plan titles concern verbosity, deflation convenience, or bulk metadata enrichment, not this feature. The completed `2026-05-28-pip-inv-enrich-fast-bulk-v3.md` is historical context, not a plan to overwrite. The relevant local brainstorm, `.cg-docs/brainstorms/2026-05-28-pip-inv-enrich-fast-bulk-loading.md`, selected private-layout reads for speed. Its reported 18x speedup is not measured here. Replacing that path may cost performance; do not promise equivalence or introduce a batch framework to recover it without evidence and approval.

No local `.cg-docs/BRAIN.md` appeared in the knowledge-file inventory, so the Brain-query protocol stopped at its existence check. Directly inspected solutions support preserving the soft dependency direction (`solutions/environment-issues/2026-05-14-soft-dep-circular-dependency-suggests.md`) and distinguishing mocked unit checks from real dependency evidence (`solutions/testing-patterns/2026-05-14-mocking-suggests-packages-local-mocked-bindings.md`). Mocking an unavailable package namespace is not assumed runnable; genuine adapter acceptance must use actual stamp storage.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Establish exact tested producer pin, ownership, API and approved safe gate before implementation | Current invocation and capture approval; umbrella D8 |
| R2 | Forward explicit artifact versions, parent pins, calculation/helper fingerprints and metadata without duplicate authority | Invocation; design sections 6/10 |
| R3 | Preserve approved save and unchanged results without inventing success/execution proof | Invocation; discovered producer report D5-A/D5-D, subject to tested-pin verification |
| R4 | Preserve fst/qs2 compatibility through wrappers and PIP/aux loaders | Invocation; design section 11 |
| R5 | Read historical data and sidecar metadata from the same exact artifact pin; keep separate metadata artifacts distinct | Invocation; design section 4 |
| R6 | Report missing/invalid/unavailable pins without silently selecting latest | Invocation; design historical safeguards |
| R7 | Preserve dependency direction and stamp-only version/hash/parent/currentness authority | Invocation; package dependency declarations |
| R8 | Provide real adapter-local regression evidence and approved test-gate results, not complete V6/M2 claims | Invocation; umbrella Step 3 and brainstorm local-evidence boundary |
| R9 | Capture only this Plan, validate/read back, preserve gaps and full handoff | Current direct approval |

## Proposed Producer/Consumer Contracts

These are exact proposed adapter contracts, NOT approved implementation/API changes. The tested producer pin is UNKNOWN; its public contracts must be verified before accepting any API assumption below.

| Boundary | Proposed behavior | Compatibility and failure policy |
|---|---|---|
| `pip_write()` -> `stamp::st_save()` | Existing formals unchanged. Forward `parents`, `request`, `semantic_schema` by exact names through existing `...`; metadata/code/format/alias/pk stay explicit | Caller supplies producer-approved structures. Stamp validates/computes proof. No hashing/currentness logic in pipload |
| Save result -> caller | Return the actual producer result invisibly, including retained `version_id` and `skipped` when approved | Raw unchanged save does not certify a successful builder receipt. Do not create a receipt, map missing pins to latest, or silently turn errors into success |
| Execution receipt -> caller | Preserve producer IDs/results already supplied; use public `stamp::st_execution_info()` directly where data-free proof is needed in acceptance tests | Do not add a pipload receipt store or wrapper solely for symmetry. Unknown/invalid explicit receipt must not resolve to another receipt |
| Existing `pip_read()` data path | Preserve `id, format, version, alias, verbose` positions/defaults and exact version forwarding | NULL/latest, relative selectors and available-version listing remain legacy behaviors; an explicit immutable read uses a nonempty character version ID, not a relative selector |
| Loader identity and physical format | For both direct IDs and inventory-derived IDs, check a present extension against non-NULL `format` before any stripping/replacement; on mismatch abort before reading either artifact. Append a requested extension only if none exists | Keep public default `format = "qs2"`. With `format = NULL`, preserve an existing extension; with neither extension nor format, retain the verified producer's existing resolution behavior and fail if ambiguous/unresolvable rather than selecting another artifact or guessing a physical format. Confirm that behavior at the tested pin before approval |
| Proposed sidecar access | Append `metadata_only = FALSE` after existing `verbose` in `pip_read()`; when TRUE, require exact nonempty scalar character `version`, validate file/format consistently, delegate to `stamp::st_read_sidecar(..., version_id = version)` | NULL, NA, empty, vectors, available/interactive/relative selectors reject in metadata-only mode. Return metadata list, never load data, never use current sidecar as fallback. Final signature requires separate API approval |
| Same-pin pairing | Caller supplies the same `(artifact identity, alias, exact version ID)` to data read and metadata-only read | Do not resolve latest twice or infer a metadata version from time. No new paired release object/API |
| Separate inventory metadata artifact | `path_metadata` identifies its own stamp artifact; `version_id_metadata` must be a nonmissing nonempty scalar character exact ID per row, without coercing numeric/logical/list values into acceptable pins. Prefer verified public `stamp::st_load_version(..., version_id = pin)`; if the tested producer uses another documented exact-pin surface, verify the same guarantees before adoption | Reject numeric 0, -1, positive integers, logicals, zero-length/multi-value pins and reserved latest/relative/interactive/listing directives before invoking an artifact reader or mutable version resolver. Validate exact catalog membership through public APIs where needed. Invalid legacy rows warn/NA as below; never resolve them as latest. The metadata-artifact pin is independent of the survey-data pin |
| Legacy enrichment absence/failure | Apply the explicit failure matrix below; preserve tested legacy condition classes without private snapshot-path inspection | Required M2 pin checks fail/mark unavailable before reuse; warning/NA enrichment is not successful required-pin evidence. If the public tested-pin API cannot distinguish missing from unreadable extant artifacts, compatibility approval is required before implementation |

Modern request structure, if confirmed at the producer pin: schema `1L`; explicit root flag; parent records with exact path/version ID; declared required component IDs and matching hash/algorithm/schema records; registered physical format; typed semantic schema/values; audit source commits separate from calculation equality. Caller fingerprints are not regenerated from whole-package SHAs. Deferred graph parent pins, failure classification, scheduling, and retained-output currentness remain stamp/engine responsibilities, not new adapter mechanisms.

### Historical Access and Legacy Failure Matrix

This matrix defines proposed compatibility acceptance, not an approval of a new error protocol. All fixtures must use disposable real stamp stores. Confirm the producer's public exact-pin availability/error/status surface at the tested commit; do not classify errors by guessed message text or construct `versions/<pin>/artifact` paths to recover a distinction.

| Case | Required legacy enrichment behavior | Strict sidecar/proof or required-M2 behavior |
|---|---|---|
| Metadata-version column absent or a documented unsaved row has NA | Preserve existing `pip_inv_enrich_no_version_col` warning for absent column and `pip_inv_enrich_missing_meta` summary as applicable; fields remain NA, no read | Required member/pin unavailable; do not certify success or select latest |
| Malformed supplied pin (numeric 0/-1/positive, logical, empty, vector/list, directive string) | `pip_inv_enrich_read_error` warning for affected row, NA result and existing missing-meta summary where applicable; zero artifact reads/mutable resolution for that row | Reject exact-pin request; no fallback |
| Exact metadata artifact/snapshot absent | Preserve `pip_inv_enrich_read_error` warning and NA row; do not treat absence alone as layout corruption | Required member/pin unavailable; strict access fails |
| Some extant metadata artifacts unreadable, at least one extant artifact readable | Unreadable rows warn `pip_inv_enrich_read_error` and remain NA; readable rows enrich; preserve applicable missing-meta summary and row count | Required failed member is unavailable, not successfully verified |
| At least one extant artifact and every extant artifact unreadable | Preserve the existing read warnings followed by `pip_inv_enrich_layout_error` abort, even if other rows are absent | Fail required access; no NA-as-success workaround |
| Legacy artifact data readable but its stamp sidecar missing/corrupt | Where the verified producer documents legacy data recovery, permit the data load, including a separately saved metadata artifact's payload; preserve documented producer diagnostics without treating that as verified modern proof | Exact metadata-only/modern proof read fails on missing/corrupt required sidecar; successful legacy data recovery does not certify same-pin semantic proof |
| Exact historical sidecar unavailable while current sidecar exists | No substitution of current metadata for historical access | Strict metadata-only access fails before data loading; current sidecar is not a fallback |

Step 1 must map public tested-pin conditions/status to missing-versus-extant-unreadable classification and record the mapping in the approved contract. If no public distinction exists, stop the enrichment migration for an explicit compatibility decision with exact condition/return changes and regression updates. Do not silently downgrade the all-unreadable error, recreate private storage inspection, widen stamp scope, or claim legacy behavior preserved. This is an additional API/compatibility prerequisite, not authority to decide it during coding.

## Implementation Steps

All four steps are future scope. No prerequisite below is marked satisfied by approving this document. Requirements R9's planning-only capture is separate from runtime acceptance.

### Pre-Start Gate: Read-Only, Before Workflow Mutation

The installed `/cg-work` command creates an execution report, Plan pointer and active-state record before its implementation loop (`.kilo/commands/cg-work.md:101-119`). Therefore the missing approvals cannot be deferred solely to Step 1. Before any roadmap/report/active-state/Plan-progress/code/scratch mutation, the future worker must read this exact saved Plan, run only its permitted no-output document validation, and check the following documentary prerequisites:

- A supplied producer close-out identifies the exact tested full stamp commit, executed evidence and source/build binding. Verify those references read-only; UNKNOWN or an uncommitted manifest without a verified commit binding fails this gate.
- The user has separately approved the exact worktree/branch/base and named owner/write set, local implementation/API scope, lifecycle paths/fields and safe-gate arrangement. Recheck collisions and concurrent ownership without changing state.
- The tested-pin API contract, dependency compatibility policy, selected test substitute/exclusions, runtime/library arrangement, resource/hook/cleanup audit and proposed scratch/documentation commands have the applicable explicit approvals. No approval is inferred from this Plan review or from another repository's execution.

If any prerequisite is missing, stop without creating a report, active-state pointer, progress field, scratch directory or roadmap update. Return the missing inputs/decisions in the response; do not start Step 1 or ask `/cg-work` to discover approval by making stateful probes. This is a plan-level guard for the installed workflow, not a claim that its validator automatically enforces these approvals. Once separately authorized and this gate passes, ordinary lifecycle creation may precede Step 1; Step 1 then verifies the actual runtime through the approved gate and records evidence, rather than retroactively authorizing it.

## Phase 1: Preconditions and Core Adapter

### 1. Resolve Producer, Ownership, API, and Test-Gate Prerequisites

- **Requirements**: R1, R7, R8, R9
- **Files**: Read-only producer handoff and source at the supplied full commit; pipload `DESCRIPTION`, `NAMESPACE`, `R/zzz.R`, `tests/testthat.R`, `tests/testthat/helper.R`, selected tests; exact dependency hook files after approved read scope. Future report/active-state paths require separate authorization below.
- **Details**: Require the Pre-Start Gate before lifecycle creation or this step. Record and reverify its supplied producer/ownership/API/safety approvals, including the failure-matrix public condition mapping and format-NULL behavior. Use only the approved runtime/library and exact permitted preflight commands to establish the loaded producer source/build identity and disposable roots; missing dependencies stop rather than trigger installation. Inspect every automatically loaded helper and relevant dependency hook before the first permitted load, and recheck source drift and bounded deletion. No runtime probe or harness is authorized by this Plan capture/review; approval must exist before starting this step.
- **Test Scenarios**: Missing handoff, unbound tested manifest, mismatched installed producer, unavailable format/dependency, overlapping owner, hook reaching configured data, test-scope widening.
- **Tests**: Future executed provenance/runtime/containment preflight, after exact permission; no package test before gate approval. Document readback/renderer validation alone is not that preflight.
- **Acceptance criteria**: V1 and explicit decisions for all four preconditions, with source pin and proposed/approved/executed gates distinguished. Missing evidence blocks Step 2, not an accepted default.

### 2. Verify Forwarding, Receipts, and Exact-Pin Sidecar Access

- **Requirements**: R2, R3, R5, R6, R7
- **Files**: `R/pip_read-write.R`; `tests/testthat/test-pip_read-write.R`; new `tests/testthat/test-m2-adapter-contracts.R`; corresponding roxygen and `man/pip_read.Rd`, `man/pip_write.Rd`.
- **Details**: Add real-storage contract cases before correction. Verify existing `...` forwarding and invisible return unchanged; leave correct implementation intact. Propose only the approved metadata-only branch using public stamp APIs, with no new export. Verify raw save/unchanged version fields separately from genuine execution receipts produced by stamp rebuilds. Exercise invalid fingerprints/parents/semantic fields through stamp validation, not duplicated validators. Require exact historical pin for metadata-only mode; never catch producer pin failures to retry latest.
- **Test Scenarios**: Complete root and parented request; missing helper proof; semantic metadata and source audit; valid unchanged retained version; request-aware producer errors; genuine retained-output receipt; invalid explicit receipt; old-pin data/metadata after later save; malformed/missing historical pin or sidecar; metadata-only reader not invoking an artifact loader.
- **Tests**: Future focused execution of the two wrapper/adapter files with pinned stamp and disposable aliases, then the approved suite gate. A call spy may verify no data-reader invocation, but cannot replace real persisted round trips.
- **Acceptance criteria**: V2/V3; arguments and actual producer results preserved; exact-pin errors visible; historical metadata/data match the same pin and no data reader runs for sidecar access.

**Phase 1 boundary:** require V1, V2, V3 and V6, including an actual approved phase-boundary suite run against the current Phase 1 tree. Phase 2-only loader/enrichment cases may be added in Phase 2; do not count their absence as a passed V4. No skipped required case, missing receipt/pin proof, or unapproved filtered substitute permits `completed-phases: [1]`.

## Phase 2: Compatibility and Local Evidence

### 3. Correct Loader Format Paths and Public Pinned Enrichment

- **Requirements**: R4, R5, R6, R7
- **Files**: `R/load_aux_data.R`, `R/load_pip_data.R`, `R/pip_inv_enrich.R`; `tests/testthat/test-pip_inv_enrich.R`, `tests/testthat/test-m2-adapter-contracts.R`; `man/load_aux_data.Rd`, `man/load_pip_data.Rd`, `man/pip_inv_enrich.Rd`.
- **Details**: Pass `format = format` in the aux loader. Before any ID extension removal/replacement, validate an existing extension against requested non-NULL format, on both direct-ID and inventory-derived-ID paths; conflict aborts with zero reads even if both artifacts exist. Append format only to extensionless IDs, preserve explicit extension for format NULL, and use only the separately verified unambiguous producer behavior when both are absent. Preserve module identity checks/public defaults. Replace enrichment private-layout reads with the verified public exact-pin loader after strict per-row scalar character validation and selector rejection without coercion. Update imitation-layout fixtures to real stamp saves/pins. Implement the approved failure matrix and producer-condition mapping, preserving expansion/naming/cardinality/duplicate-ID/no-overwrite semantics. Keep separate metadata-artifact reads distinct from data-free sidecar access; no private path inspection to infer availability.
- **Test Scenarios**: Both fst/qs2 artifacts coexist: direct and inventory-derived mismatch must error before any read; matching/extensionless inputs and format NULL with present/absent extension follow the exact contract. Test historical independent metadata pins; numeric 0/-1/positive, logical, empty, list/vector and directive pins make zero reader/mutable-resolver calls. Cover absent snapshot, partial unreadability, all-extant-unreadable abort, legacy data recovery with missing/corrupt sidecars versus strict sidecar failure, missing fields, repeated reporting levels and existing columns.
- **Tests**: Real-storage regression cases in the selected files; mock only PIP folder/alias acquisition to scratch, not stamp I/O. Do not initialize a real working release or invoke pipdata deflation. No production fixtures required.
- **Acceptance criteria**: V4; fst/qs2 forwarding and extension/format conflict rejection work on both ID paths; data and sidecar pins remain aligned; malformed metadata pins cannot reach a mutable resolver. Separate metadata artifacts use their explicit pins with no private-layout dependence. Every failure-matrix row has an executed regression with its specified condition/result; public-API inability to preserve a distinction blocks rather than silently changing behavior. Legacy recovery/warning/NA outcomes are not validated modern proof.

### 4. Run the Approved Gate, Document Contracts, and Close Adapter-Local Evidence

- **Requirements**: R1, R2, R3, R4, R5, R6, R7, R8
- **Files**: The source/test/Rd paths above only; future execution report and active-state pointer only after separate approval. No DESCRIPTION/NAMESPACE/lockfile/site/README changes under this proposed allowlist.
- **Details**: Execute the separately approved gate in a fresh disposable process/copy with verified producer pin, record native exit, failures/warnings/skips, source/build identities and every exclusion. Run compatible API/formal/export and documentation checks. Inspect isolated roxygen deltas and transfer only the five allowed Rd paths; refuse unrelated generator changes. Record local adapter evidence and unresolved integration obligations. Do not record a pass for a skip, static assertion, or unavailable dependency.
- **Test Scenarios**: Clean fresh-process repeat; alias/options/cwd restored on error; every required adapter test actually executes; generator produces unrelated deltas; missing producer/library or unsafe resource path stops gate.
- **Tests**: Approved suite substitute/full suite, targeted API/formal/export assertions and documentation validation in approved scratch. Exact documentation generator command and scratch output paths must be approved in Step 1; no helper start is implied here.
- **Acceptance criteria**: V5 and all required V1-V5 evidence present. Handoff says adapter-only L-authority/V6 contribution, not completed pipdata-engine V6 or whole M2.

**Phase 2/final boundary:** require V4 plus all final evidence V5, recheck V1-V3/V6 and C1-C6, and execute the approved phase-boundary gate on the complete corrected tree. Do not mark the phase or Plan complete when core adapter evidence is missing. The execution report must distinguish the Plan's local evidence ID V6 from the umbrella's authority-integration V6; identical labels do not equate their scopes.

## Testing Strategy

### Read-Only Safety Findings

`tests/testthat.R` loads testthat and pipload before `test_check()`. `helper.R:3-7` checks `PIP_ROOT_DIR/_aux` when called; it is not a containment mechanism. `R/zzz.R:1-12` changes package options on load and later initializes internal naming patterns. Dependency initialization and inherited stamp/pipfun roots require review at actual runtime source pins; they have not been certified here.

`test-pip_inventory.R:1-16` uses configured PIP_ROOT_DIR, scans COL data and invokes inventory update. `test-pip_load_aux.R:9-18` contains a hard-coded shared UNC path. `test-load_pip_deflated_data.R:195-221` can look up/setup a real release and explicitly leaves aliases in-session. Those make the normal configured full suite unsuitable for this task.

Selected wrapper tests create fixed-name temp aliases and delete their directories, with options setup at file scope (`test-pip_read-write.R:9-40,46-108`). Those names and delayed cleanup can collide/leak; use a unique process-start temp subtree and failure-safe per-test teardown. Selected enrichment fixtures use withr tempdirs but currently fabricate private storage paths. Automatic helpers still load even when tests are filtered. Dependency hooks and full failure cleanup remain unresolved safety requirements, not established by reading these files.

### Proposed Compatible Substitute, NOT Approved or Executed

Candidate R expression, working directory an approved disposable copy of the package root:

```text
Rscript --vanilla -e "Sys.setenv(NOT_CRAN='true'); testthat::test_local('.', filter='^(pip_read-write|pip_inv_enrich|m2-adapter-contracts)$', reporter='summary', stop_on_failure=TRUE, stop_on_warning=TRUE)"
```

This is a **proposed compatible substitute**, not a full suite, approved gate, safety certification, or command to execute now. Step 1 must secure explicit compatible-substitute approval, including every exclusion and the actual runtime arrangement. Warnings or skips require explanation; a required new acceptance case cannot skip. Do not silently weaken `stop_on_warning` to make a run pass.

Selected files: existing `test-pip_read-write.R`, `test-pip_inv_enrich.R`, and proposed `test-m2-adapter-contracts.R`. `helper.R` and package/dependency hooks remain loaded and must be audited. Exact excluded existing files:

- `test-load_pip_deflated_data.R`: convenience guard/dispatch/deflation and real release integration.
- `test-pip_class.R`: package class behavior.
- `test-pip_create_vintage.R`: legacy vintage creation.
- `test-pip_find_data.R`: legacy configured-storage lookup.
- `test-pip_inventory.R`: inventory scanning/update.
- `test-pip_load_aux.R`: legacy auxiliary loading/deprecation and shared-path cases.
- `test-pip_load_data.R`: legacy microdata loading.
- `test-verbose-arg.R`: broad verbosity behavior.

Lost coverage is all of the behavior listed above. The new selected adapter tests must still explicitly cover required current-loader fst/qs2/version/verbosity forwarding where relevant. Neither that replacement coverage nor the exclusions waive omitted compatibility debt, full-suite obligations in later approved work, engine V6, or core M2 T1-T12.

Proposed scratch prefix, **not created/approved**, is `C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-pipload-stamp-adapter/`. A later exact runner proposal must enumerate source copy, library, temp, home/cache, storage, logs and cleanup paths beneath it; verify parent/path guards and use fixed allowlists. Set temp/home/profile controls before R starts, use a verified exact producer library, prevent fallback to another stamp, and inspect selected hooks/resources. Do not read/copy the repository `.stamp`, test `.stamp`, runtime logs, profiles, credentials or production data into fixtures. Do not perform dependency installation or uncontrolled package loading.

**Filtering, `--vanilla`, environment overrides, and a disposable directory alone do not establish filesystem/network containment or hook safety.** The previous stamp task's D8 simplification is historical, not inherited permission in pipload. If practical process isolation rather than enforced containment is proposed, obtain explicit local approval of that exact approach and residual risks first. No safe full-suite command is currently established. No test or runtime preflight has run here.

## Documentation Checklist

- Preserve existing positional arguments/defaults and document the separately approved metadata-only signature/return/error behavior.
- Explain exact immutable pin versus legacy latest/relative selectors; document no fallback on a requested historical pin.
- Distinguish artifact sidecars, separately saved metadata artifacts, raw unchanged saves and stamp-owned execution receipts.
- Correct the misplaced `code` documentation sentence in `R/pip_read-write.R:124-125` without changing behavior.
- Update enrichment docs to public exact-pin loading, accepted pin types, failure-matrix warning/NA/abort semantics and legacy-data-versus-strict-sidecar distinction; remove unverified private-layout timing claims.
- Generate/review only `man/pip_read.Rd`, `man/pip_write.Rd`, `man/load_aux_data.Rd`, `man/load_pip_data.Rd`, `man/pip_inv_enrich.Rd` after exact runtime/write approval. No NAMESPACE delta is expected.

## Risks & Mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Tested producer commit absent or later APIs differ | Wrong adapter contract or false tested dependency | UNKNOWN pin blocks implementation; verify supplied close-out and exact commit/build binding |
| Shared dirty PROD checkout and unresolved workers | Disturbance of production/concurrent work | No branch switch; propose separate worktree and reverify ownership before later approval |
| Test helpers/hooks/configuration escape scratch | Shared-data reads, writes, or cleanup | Audit all loaded paths/hooks and approve exact gate; no filtering-only safety claim |
| Public pinned enrichment is slower than private path | Bulk inventory latency regression | Document tradeoff; keep simple public access first; assess bounded fixtures later without promising historical speedups |
| Confusion between sidecar and separate metadata artifact | Historical data paired with wrong metadata | Explicit artifact/pin tuples and independent metadata-artifact fixture tests |
| Raw unchanged save mistaken for builder success | False currentness or missing provenance | Preserve results verbatim; obtain genuine proof from stamp, never create adapter authority |
| API/dependency-floor compatibility unsettled | Callers break or old stamp appears supported | Preserve defaults, approve exact API, verify tested runtime; stop for any required dependency-scope expansion |

## Out of Scope

No stamp or pipsystem writes; no engine, manifest reconciliation, Force/failure scheduling, fingerprint discovery, R1 row selectivity, survey selection, mean/deflation implementation, release registration, API ingestion, retention policy, SMB/multiwriter guarantees, production equivalence, package publication, Git staging/commit/push/merge, dependency installation, pipelines/API calls, or current configuration changes. No execution reports, active-state, plan progress, roadmap updates or derived HTML are authorized by this capture. Do not start `/cg-work`.

## Future Worktree and Lifecycle Proposal

Because the checkout is dirty and on `PROD`, do not create/switch a branch there. Proposed future worktree path `E:/PovcalNet/01.personal/wb384996/PIP/pipload-m2-stamp-adapter` was absent and parent `E:/PovcalNet/01.personal/wb384996/PIP` exists. Exact proposal, **not executed or approved**:

```powershell
git worktree add -b feat/m2-stamp-adapter "E:/PovcalNet/01.personal/wb384996/PIP/pipload-m2-stamp-adapter" ff9a81e386a09fb2531c154f63fd2b91521313c6
```

Recheck source/base freshness, branch/path collisions, complete target ownership and permissions before requesting creation. A linked worktree shares Git administration and is not proof of complete resource isolation. No stashing, cleanup, switching, creation, or new managed session is authorized now. The saved Plan may be ignored/untracked by Git; do not change ignore rules or copy it to another worktree without approval.

Later lifecycle paths must be resolved and approved in the selected execution root before the Pre-Start Gate passes. The installed report rule uses the execution date, not this Plan's date: `.cg-docs/work-reports/<execution-date>-m2-pipload-stamp-adapter.md`. For example, first execution on 2026-10-21 would propose `.cg-docs/work-reports/2026-10-21-m2-pipload-stamp-adapter.md`; neither that example nor the earlier 2026-10-20 candidate is approved now. If a matching report exists, obtain approval before linking/resuming it; a same-day unrelated collision needs a separately approved `-2`/`-3` exact path, never overwrite. Preserve report history on resume.

The other candidate is `.cg-docs/active-state/current.json`; its current owner/content and compatible schema must be checked before approving an overwrite. The installed `/cg-work` supports only `status`, `completed-date`, `failing-steps`, `completed-phases`, `current-phase`, and `execution-report` Plan progress fields. Approve the exact needed subset and any required parent-directory creation separately. No lifecycle/progress field is written in this review. No roadmap registration, `active`, or `done` update is authorized: this adapter sub-work set cannot complete the parent `create-engine-skeleton` feature. If the installed workflow would make such a write without separate approval, halt before its mutation stage rather than dispatching it.

## Completion Contract

### Outcome

Pipload forwards approved stamp requests and receipts without owning versions, hashes, parents, or currentness. Historical reads use the requested exact pins, preserve fst/qs2 compatibility, and report invalid or unavailable pins without latest-version fallback.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|----|-------|-------------------|------------------|----------|
| V1 | 1 | Pre-Start Gate approvals plus actual loaded tested-producer identity, compatible runtime and approved safety preflight | Verified close-out/source/build binding, explicit approvals and approved runtime-preflight output | yes |
| V2 | 1 | Existing forwarding preserves parents, requested fingerprints, semantic metadata, save/unchanged results and genuine receipt references | Real-storage `test-m2-adapter-contracts.R` cases | yes |
| V3 | 1 | Old-pin data/sidecar agree; invalid/unavailable pins fail without fallback; metadata-only access invokes no artifact reader | Exact-pin integration and reader-invocation assertions | yes |
| V4 | 2 | fst/qs2 loaders and separately pinned metadata-artifact enrichment remain compatible | Wrapper/enrichment tests and new adapter regressions | yes |
| V5 | final | Approved complete-tree gate passes with actual exits/skips/exclusions; API/docs/dependency direction and all earlier evidence remain valid | Future runtime output, API/doc checks and approved local report | yes |
| V6 | 1 | Approved Phase 1 suite gate executes all required then-existing wrapper/sidecar cases; no unapproved substitute or core skip | Fresh-process phase-boundary test output and evidence inventory | yes |

Phase integers bind evidence to the installed phase-completion gate; `final` binds whole-Plan completion. Recheck all required rows before final completion even if a phase was previously recorded. V6 here is solely a local phase-boundary gate, not the umbrella's engine authority V6. No local phase depends on a future engine/mean/release implementation. Planning document validation is separate from V1-V6 and cannot mark them passed.

### Constraints

| ID | Constraint | Check |
|----|------------|-------|
| C1 | Stamp alone owns version/hash/parent/currentness decisions | Source/API review plus argument/result preservation assertions |
| C2 | Original historical snapshot data, metadata and parents stay immutable | Real before/after pinned storage comparisons |
| C3 | No hard dependency cycle or new scheduler | DESCRIPTION/NAMESPACE and call-path inspection |
| C4 | Tests do not use normal/shared data | Approved resource/hook/helper/cleanup preflight before tests |
| C5 | Legacy defaults preserved; raw saves do not invent execution proof | Compatibility and receipt assertions |
| C6 | Local adapter evidence is not complete engine V6 or whole M2 | Explicit evidence scope in local and downstream handoffs |

### Boundaries

- Allowed later, only after explicit approval: the exact proposed source/test/Rd paths, disposable resources, and lifecycle fields/paths enumerated above.
- Allowed now: create only this named Plan and perform readback plus one-file no-derived-output document validation.
- Out of scope: all runtime/package/production operations and cross-repository writes listed above; no helper starts or `/cg-work` dispatch.

### Iteration Policy

1. Resolve producer-pin, ownership, API, lifecycle and safe-gate approvals through the read-only Pre-Start Gate before any workflow mutation. Capture/review approval resolves none of those requirements; Step 1 records approved runtime evidence only after a separately authorized start.
2. Test existing forwarding first and preserve correct code; implement only corrections justified by regression evidence.
3. Keep real storage/pinned metadata acceptance distinct from mocked lookup/argument checks.
4. Under `ask`, pause before changing any API, dependency, write set, lifecycle scope, test substitute, safety approach or producer contract.
5. Record actual exits/results and exclusions. Missing required local evidence blocks completion; no static inspection or whole-M2 promise substitutes for it.

### Blocked-Stop Conditions

- Exact tested producer commit/build binding, ownership, API, lifecycle or safe-gate approval is unavailable: stop at the Pre-Start Gate before lifecycle/progress/roadmap/scratch mutation.
- Producer contracts differ materially from the approved local Plan, or inspected source drifts/conflicts with another writer.
- Safe test access, cleanup or dependency-hook behavior is unresolved; private/shared/production access would be needed.
- Required evidence fails or skips; a proposed substitute has not been explicitly approved.
- Completion requires an unapproved write/output, dependency installation, configuration change or protected boundary crossing.
- Future execution cannot durably record its separately authorized report, or a required deviation lacks approval under `ask`.

## Gaps

- **Implementation-blocking:** exact tested stamp producer commit is UNKNOWN. The discovered report is bound to an uncommitted manifest, and the requested close-out handoff was not supplied. Current HEAD/package versions/CRAN are not substitutes.
- **Implementation-blocking:** exact local owner/concurrent write sets, approved execution worktree and lifecycle writes remain unresolved. No branch/worktree creation was approved.
- **Implementation-blocking:** metadata-only API proposal, format-NULL behavior and tested-pin producer request/receipt/error contracts need separate verification and approval. Public missing-versus-extant-unreadable classification must support the compatibility matrix, or an exact compatibility change needs separate approval; no private path reconstruction. This Plan is not implementation ready.
- **Implementation-blocking:** no safe full suite or compatible substitute is approved. Proposed filtering and `--vanilla` do not establish containment/hook safety; dependency initialization, disposable runtime/library, pre-start roots and bounded cleanup remain unresolved.
- Dependencies actually tested in this session: NONE. All R/package tests, runtime probes, install/build/check/docs generation, pipelines/API calls, numerical equivalence, storage safety, SMB/multiwriter and full M2 integration were not run.
- Installed R and dependency versions/locations, actual producer-loaded SHA binding, complete release/member schemas and bulk performance impact are UNKNOWN.
- The existing stamp floor in DESCRIPTION does not establish modern API support; shipping dependency-policy changes, if needed, require exact additional approval.
- Adapter-local evidence will cover only a contribution to L-authority/V6. Pipdata authority integration and complete M2 T1-T12 remain later work and are not waived by exclusions or local checks.

## Planning Validation and Handoff

### Plan Review Revision: 2026-10-21

The user requested `/cg-plan-review`, correction of all findings in this Plan and no `/cg-work` start. All findings were selected for correction by that direct request; none was accepted as risk or deferred. The read-only `cg-plan-critic` read the complete original 312-line Plan and checked relevant pipload/stamp source/test assumptions. The parent separately audited installed workflow/lifecycle contracts. The critic then read the complete corrected 348-line Plan and rechecked all five corrections, returning no residual/new significant P1, P2 or P3 issues. This closing review log and handoff synchronization were added afterward; no implementation contract changed in that synchronization.

| Finding | Severity | Status | Plan correction confirmed by re-review |
|---|---|---|---|
| P1.1 | P1 | Closed | Read-only Pre-Start Gate precedes every workflow mutation; exact future lifecycle paths/date/collisions/ownership/permissions and parent-feature roadmap boundary are explicit |
| P2.1 | P2 | Closed | Validate original extension/format agreement on direct and inventory-derived ID paths; explicit NULL behavior and zero-read mismatch acceptance |
| P2.2 | P2 | Closed | Exact scalar character enrichment pins without coercion; reject numeric/logical/list/directive inputs before readers/mutable resolvers |
| P2.3 | P2 | Closed | Explicit legacy failure matrix/condition mapping, real regression cases and strict-sidecar versus legacy-data distinction; block on an unrepresentable public compatibility contract |
| P2.4 | P2 | Closed | Required evidence assigned to Phase 1, Phase 2 and final completion, with actual approved phase-boundary gates |

**Review outcome:** 1 P1 / 4 P2 / 0 P3 findings, all five closed in the Plan; zero accepted or deferred. Structural review readiness is not implementation authorization/readiness. Exact tested producer commit remains UNKNOWN, and all ownership/API/compatibility/safe-gate/lifecycle prerequisites remain unsatisfied until their specified evidence and separate approvals exist. Document validation/readback and final changed-file results must be reported from actual operations in the response. No separate review report, test, execution report, active-state record, roadmap write or implementation phase was created or started by this review.

Approved capture requires saving this exact Markdown, reading it back, and reporting actual document validation and changed-file scope. The installed contract supports `cg-render-artifact --validate-only <source>`. The installed wrapper routes to `scripts/render_artifact.py`; inspected `artifact_views/cli.py:237-241` validates and returns before view publication. Use this explicit no-derived-output mode, not an assumption that `artifact-html: false` alone enforces the boundary. Disable Python bytecode writes for the process. Do not create HTML, reports or validation helper files. If validation fails, preserve this Markdown and report the exact error/gap; never claim a pass.

Expected but unauthorized derived-view path is `.cg-docs/views/plans/2026-10-20-m2-pipload-stamp-adapter.html`. No view is required or to be created for this capture. Recovery within current permission is the same `--validate-only` command; explicit `cg-render-artifact <source>` would publish a derived output and therefore needs additional approval. Actual post-save validation/readback results belong in the response, not a subsequent unauthorized Plan progress update.

| Standard worker-handoff field | Record |
|---|---|
| Feature/task ID | `m2-pipload-adapter-plan-2026-10-20`; `create-engine-skeleton`, pipload adapter sub-work set; milestone `m2-walking-skeleton` |
| Repository, worktree, session ID | pipload; active root above; existing checkout; native session UNKNOWN/optional; proposed worktree not created |
| Branch, base SHA, current SHA | `PROD`; starting/proposed base and pre-save HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`; final refresh in response |
| Approved scope, Plan, completed phase | Original exact Plan capture plus 2026-10-21 review/corrections to this Plan and no-derived-output validation/readback; no implementation phase approved/executed |
| Worker status | All five Plan review findings closed and rechecked; structurally ready conditional work plan, implementation BLOCKED by producer/ownership/API/safe-gate gaps; actual document result in response |
| Changed files | This Plan only by this worker; preserve pre-existing `.gitignore`, `.compound-gpid/`, `.github/skills/`, `sessionInfoLog` |
| Executed checks and evidence paths | Read-only Git root/default branch/HEAD/status/worktree/ref/history/source-diff checks; target directory and ACL inspection; source/design/test/helper/renderer reads. Actual save/readback/validation results in response |
| Dependency versions/SHAs actually tested | NONE; exact tested stamp producer commit UNKNOWN; observed source pins listed separately above |
| Checks not run | All R/package/runtime/storage-safety/build/check/generation/pipeline/API/production/integration tests; no remote freshness or worker-liveness certification |
| Remaining blockers/required decisions | Full Gaps section; exact tested producer handoff; local ownership/worktree/lifecycle; API and safe-gate decisions |
| Commit and PR | None; no staging/commit/push/merge/branch/worktree operation |
| Recommended next action | Owner supplies tested producer close-out and resolves exact Pre-Start Gate approvals before any later execution request; this review does not start `/cg-work` |
| Inventory limits | Authorized source/document inspection and local Git/ACL observations only; no private session/configuration, runtime catalog, production data or complete concurrency inventory |
~~~

## E8: Actual Readback and Final Preservation

Full amended canonical Plan readback (371 lines) completed in slices 1-200/201-371 at the batch captured `2026-10-22T20:54:05Z`. Full substantive checkpoint-2 handoff.md (112 lines) and this evidence.md (455 lines before this closing section) were read in the batch captured `2026-10-22T20:57:52Z`, including every line without truncation or omitted slices. Directory readback shows exactly the two assigned central outputs.

Final status/HEAD preserve `PROD`, `ff9a81e386a09fb2531c154f63fd2b91521313c6` and the same dirty path inventory. Non-writing hash-object on amended Plan, prior reconciliation handoff and prior reconciliation evidence returned in that order:

```text
ffc48cfc78434cb893684c41b7429280aebb1b2c
acf5c053b2c7c7f2656405e1e9645546ccb98ca7
20e7e148af49374b061db8b6d5e42475b280a802
```

All closing native identity/status/hash commands returned 0. Thus canonical Plan is at the intended new identity and both prior reports remain byte-preserved. Earlier package preservation diff returned 0/no source/test/doc changes. Individual read/command UTCs UNKNOWN. Checkpoint-3 clock `2026-10-22T20:58:17Z` records these actual completed reads and only reporting/document completion; final closing files are re-read before the user response, without pretending their later closing bytes were already self-verified. No renderer/schema/review/consumer gate, package execution or implementation occurred.
