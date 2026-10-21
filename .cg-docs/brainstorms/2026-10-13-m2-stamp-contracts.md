---
date: 2026-10-14
title: "M2 D5/D8: Stamp Contracts and Local Work Gates"
status: in-progress
scope: "Deep"
artifact-schema-version: 1
artifact-html: false
chosen-approach: "Retained output pin with a stamp-owned execution receipt; bounded discussion selection"
tags: [m2, stamp, pipload, pipdata, contracts, lineage, fingerprints, test-safety]
---

# M2 D5/D8: Stamp Contracts and Local Work Gates

## Context

Task `m2-stamp-contracts-2026-10-13`, milestone `m2-walking-skeleton`, concerns exactly `close-stamp-gaps-for-skeleton` and `create-engine-skeleton`. This is a Software/Data discussion, scope Deep because storage, scheduling, access, and three repository-local work gates interact. The filename retains the approved task date; the frontmatter gives the capture date.

The direct user request received `2026-10-14T01:26:22Z` approves execution of the discussion recorded under "Proposed D5/D8 Stamp and Engine Discussion: 2026-10-13" in `.cg-docs/orchestration/REQUESTS.md`. The complete original request was read at lines 739-935; its current, reformatted section was re-read at lines 404-508 before capture. The saved request's historical "NOT GRANTED" statement is not the current direct user's approval state. No coordination record is changed here.

The umbrella `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:225-236,254-288,415-433` identifies D5/D8, the two feature prerequisites, and separate local Plans. It is not an approved implementation Plan or a `/cg-work` target in pipsystem.

### Approval Boundary

- The user selected the asymmetric missing-fingerprint policy as a proposal preference, explicitly not approval of D5 or implementation.
- After clarification, the user selected Option 1: A may advance and B may rerun; if B's computed result is unchanged, retain B's output version and do not recalculate C merely because A advanced. Adding an unused variable to A was the user's example. Variable-level dependency tracking is not requested for this bounded case.
- The confirmation received `2026-10-14T21:13:04Z` confirms the explained discussion summary and one-file capture, not all remaining D5/D8 rules. The user subsequently selected "No, save minimal". No more-complex version was requested.
- The confirmed capture narrows the first early-cutoff case to an upstream-only change with unchanged B content, requested calculation fingerprint, and result-relevant metadata. Equal-output behavior after B's own calculation fingerprint changes remains a separate compatibility question, not a silently changed save policy.
- This record is `in-progress`, not `decided`: the selected discussion approach is recorded, but the full D5 contract and D8 implementation gates are not approved. No protected design edit, umbrella revision, roadmap operation, package change, test execution, or native session access follows.

### Repository and Inventory Evidence

Root: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`. Branch `main` was verified both at research and save preflight. Task starting/base HEAD was `45426874ae489c398b0d7ba479d92f3e016264fb`; current save baseline is `f1863d2e80471616842aebfa5918651c947ba50d`. The repository advanced during discussion; this worker made no Git write. A read-only diff between those commits showed no change to the controlling design, charter, roadmap, brainstorms, HARVEST, notes, or tables. Workflow/context files checked for the save also had no commit diff. These checks do not establish remote freshness or the identity of another writer.

Pre-save status: modified `.cg-docs/orchestration/REQUESTS.md`, `.cg-docs/orchestration/STATE.md`, and `.gitignore`; untracked umbrella Plan. Earlier status also showed modified `ORCHESTRATOR.md`; it no longer appeared modified at save preflight. All are preserved. Directory reads showed the exact brainstorm target absent before creation, with no existing-file replacement. Native discussion-worker session ID, complete worker ownership/write sets, liveness, and default package branches are UNKNOWN. No managed-session inventory was required or obtained. Absence of the target is not proof that no other worker exists.

Permission evidence is the current direct approval, available repository read/Git and apply_patch contracts, and successful bounded reads/checks. This is not a negative permission test or certification of all client enforcement. The worker did not inherit the coordinator's restricted tool identity or acquire its STATE/REQUESTS ownership. Feature 2 remains BLOCKED; no native session, recall, helper, remote Brain, or private-state access occurred.

## Requirements

1. Preserve stamp as the domain-neutral and sole rebuild authority. Pipdata supplies PIP facts and recipes; pipload forwards access; logs and manifests do not independently select work.
2. Compare requested calculation and known result-affecting helper fingerprints before execution. Store exact source commits separately; do not invalidate everything on a package SHA change.
3. Distinguish missing proof, missing output, failed work, reusable output, and blocked dependents. Preserve the Decided analyst-started failure policy; do not decide Force behavior.
4. Make a successful unchanged B execution current without rewriting B's old pinned data, metadata, or original parent history, and without unnecessary C execution in the selected case.
5. Preserve result-relevant metadata changes as new artifact versions even when values match; provide metadata from the same pinned version without loading data. Do not substitute current metadata for historical metadata.
6. Propose typed producer/consumer contracts and separate local Plan, work-set, lifecycle, runtime, and test gates. Recommendations are not permission to implement.
7. Separate L-stamp/V2-V5 and L-authority/V6 from later complete-M2 T1-T12. Do not make a future mean/release a prerequisite for unrelated local checks, or waive core integration evidence.
8. Create only this Markdown artifact; read it back and report actual validation and scope results. Keep a non-empty Gaps section and all unverified claims explicit.

Authority: `compound-gpid.md:24-37`; `SYSTEM_DESIGN.md:133-139,186-205,209-223,268-274,284-321`; umbrella `:193-219,233-236,266-288,448-478,550-564`.

## Researched Facts

### Source Pins and Currentness

Package keys below bind every package file/line citation in this record. These are observed source commits, not installed versions or tested dependencies.

| Key | Absolute repository root | Full observed SHA | Branch and dirty-source limits |
|---|---|---|---|
| S | `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp` | `ad9a483b6261166a6feefc64baea5d602198977b` | Current branch `ready_cran`; empty short status. Initial research HEAD was harvest pin `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` on `master`. Relevant changed APIs/test setup were refreshed; `R/rebuild.R` and `R/zzz.R` have no diff between those pins. |
| Dp | `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` | `84442e979c98d33fa5565ab9e56d3179cc7d5278` | `PROD`; empty short status. |
| L | `E:/PovcalNet/01.personal/wb384996/PIP/pipload` | `ff9a81e386a09fb2531c154f63fd2b91521313c6` | `PROD`; untracked `sessionInfoLog`, not read or used. |

For all three repositories, scoped `git diff --exit-code HEAD -- R NAMESPACE DESCRIPTION tests` returned no differences during inspection. Final package HEAD/status refresh is reported in the response. Source and test inspection is not R execution, a passing test, or safety certification.

The request's historical SHA triplet is conflicting as a citation to HARVEST: stamp `b6e0d7d5aa6ea3070af670f0c6e8b384cbe892a5`, pipdata `844fd326952cb9d45b832f0eac0f8150052a5265`, pipload `ff9aed540f4b2c2b5a34b83e1b355304b3945c99`. `HARVEST.md:13-16` actually records `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e`, `84442e979c98d33fa5565ab9e56d3179cc7d5278`, and `ff9a81e386a09fb2531c154f63fd2b91521313c6`. Use the observed pins above for current claims. Existence/meaning of the conflicting triplet was not independently established. No request or harvest correction is made.

### Fact Inventory

| State | Fact and consequence | Evidence |
|---|---|---|
| Established policy | Fingerprints cover independently run calculations and known result-affecting dependencies; requested comparison precedes execution. Stamp alone selects work. | `SYSTEM_DESIGN.md:203-205,307-309`; confirmed M1 record `:136-140,162-167` |
| Established source gap | Stamp's current stale check compares immediate parent versions, returns FALSE for some missing states, and takes no requested fingerprint. | S `R/version_store.R:1170-1212` |
| Established source gap | Save decision takes object/code but not parents/custom metadata; an unchanged save returns only path/skipped/reason. The executor treats no returned version as failure. | S `R/IO_core.R:250-271,954-997`; `R/rebuild.R:296-327` |
| Established source gap | Graph propagation/frontier and multi-target ordering do not establish the required general dependency-safe planning; execution does not establish cutoff/failure reconciliation. | S `R/rebuild.R:173-189,211-342,400-518`; historical explanation `notes/stamp.md:55-70` |
| Established source gap | Functions hash formals/body, not closure state or transitive helpers. Current sidecars have no version selector; JSON auto-unboxing/simplification needs typed round-trip checks. | S `R/hashing.R:318-342`; `R/format_registry.R:267-347`; `R/IO_core.R:632-662` |
| Established source | Pipdata has curated functions/constants/external functions and YAML fingerprints, but its current manifest/planner compares them to decide work. That is a target-authority contradiction, not approval to retain a second scheduler. | Dp `R/code_fingerprint.R:1-92`; `R/dependency_execution.R:559-718`; `notes/pipdata.md:99-118` |
| Established source | Pipload read/write wrappers forward version/format/save arguments; `...` can already carry parents. Do not add a duplicate parent store. Metadata enrichment directly constructs separate QS2 artifact snapshot paths, not generic sidecar access. | L `R/pip_read-write.R:48-107,151-187`; `R/pip_inv_enrich.R:219-260` |
| Stale for current public API | Harvest partition-helper support must not be assumed public at S: current NAMESPACE does not export those helpers. This discussion needs ordinary artifact pins, not a partition API or R1 selection. | S `NAMESPACE:3-40`; read-only diff from harvest pin to S |
| Established inspection; execution unavailable | Test sources contain temporary stores, destructive negative fixtures, configured-storage tests, package hooks, and cross-file helper evaluation. Safe runtime containment remains unproved. | Test-safety section below |
| Unavailable | Installed R/dependency versions, tested producer commits, implementation owners, safe execution roots, approved local Plans, and complete concurrent ownership. | No runtime or inventory operation authorized; not supplied by user |

Root `AGENTS.md` reads for the three packages returned file-not-found; no missing instruction was invented. One content search rejected unsupported regex look-ahead; the corrected search succeeded. The required communication skill was unavailable through the skill tool; baseline plain-language rules were used. Brainstorm and Brain-query skills loaded successfully.

### Prior Knowledge and Decisions

The local Brain was queried through `.cg-docs/BRAIN.md:12-17`, matched `BRAIN-01.md:130-147`, chronology `BRAIN-log.md:5-20`, and targeted `brain-index.json` snippets. No full index load, remote query, index rebuild, or Brain write occurred. No existing D5/D8 brainstorm target was found. Related M0/M1 records are controlling background, not an artifact selected for continuation.

The relevant learning is to separate decision approval, document-write approval, document verification, and runtime proof: `.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md:22-40,60-71`. Used claims were checked against the current design and the canonical confirmed M1 record, not the older unconfirmed M1 entry.

Controlling records: `.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md:98-107,124-142`; `2026-10-07-m0-remaining-design-decisions.md:169-223,229-246`; `2026-10-07-m1-code-orchestration-and-storage-decisions-confirmed.md:136-168`. Context `compound-gpid.context.md:12-20` reinforces the evidence boundary. M1 R1 remains Open (`roadmap.json:35`); the two M2 features remain `idea`, plan null (`:48-49`).

## Approaches Considered

### Approach 1: Retained Output Pin and Stamp-Owned Execution Receipt

**Selected discussion approach.** When A advances, B runs using the new A pin. If B's content, requested calculation fingerprint, and result-relevant metadata remain identical, retain B's artifact version and append immutable stamp-owned execution proof binding the new inputs to the retained output. C's B pin does not change. Stamp, not pipdata, determines that the next request is satisfied.

Example labels below are illustrative references, not filenames or API names:

```text
Original: A1 -> B1 -> C1
Later:    A2 -> successful B execution -> retained B1
Receipt:  exact A2 inputs + requested fingerprint + semantic metadata proof -> B1
Result:   C1 remains current; the next unchanged run executes/saves nothing
History:  B1's original A1 parents, data, and metadata remain immutable
```

Pros: no provenance-only B output version; existing C output pin remains meaningful; no variable-level dependency graph is required. Cons: output provenance and latest execution proof are distinct references; receipt publication, retrieval, validation, and retention become real stamp obligations. A receipt is not an ordinary unvalidated event log. A missing/corrupt/uncommitted receipt cannot establish success.

Effort: medium, provisional and unmeasured. Recommended: yes for the bounded parent-change case. The user explicitly selected this option after explanation and confirmed the minimal capture.

### Approach 2: New Provenance Version With a Separate Result Signal

Create B2 with A2 parent provenance even when B's result matches B1. Keep B1 immutable. To avoid rebuilding C, stamp must compare an approved result-equivalence signal rather than parent-version inequality alone.

Pros: one artifact-version reference carries the output and that execution's provenance. Cons: extra versions for unchanged results and a change to existing child-currentness semantics; metadata-aware equivalence needs its own contract. Effort: medium/large, provisional. Recommended: no for this bounded first unit; the user selected Approach 1. No general ban on provenance versions is adopted.

### Missing-Fingerprint Alternatives

| Alternative | Benefit | Cost/risk | Discussion outcome |
|---|---|---|---|
| Asymmetric | Missing requested calculation/helper hash blocks; only missing saved hash with complete requested proof and valid parents permits a recovery rebuild. Successful recovery must persist complete proof before reuse. | Requires distinguishing legacy saved proof from an unavailable current dependency. | User-selected proposal preference; full D5 contract not approved. |
| Block either missing hash | Most conservative; no unproved comparison. | Existing artifacts need manual repair/migration even when rebuilding could establish proof. | Considered, not selected. |
| Run without requested reuse proof | Allows exploratory execution. | Never establishes reusable currentness and can repeat indefinitely; provenance remains incomplete. | Considered, not selected for this skeleton proposal. |

Do not equate NA with NA and certify currentness, silently omit a declared helper, fall back to a whole-package SHA, or run repeatedly without establishing proof.

## Proposed Producer/Consumer Contracts

All names, R types, reason codes, schemas, and access shapes below are PROPOSED, not approved exported APIs. Prefer narrow compatible extensions of existing public surfaces; do not call stamp internals from PIP code. Final signatures, format choices, and collision/type validation require D5/D8 approval and tested pins.

| Boundary / owner | Proposed key and types | Null/meaning rules | Pins, compatibility, and authority |
|---|---|---|---|
| Pipdata recipe -> stamp | One logical absolute `artifact_path` character scalar; parent list of unique path/version character pairs; caller recipe identity character | Required keys nonempty/nonmissing; root recipes explicitly declare no parents, rather than treating absent lineage as a root | Preserve module-bearing identity in the PIP adapter. Stamp validates generic pins; no survey/CPI/release vocabulary in stamp. Aliases locate stores, not immutable identity. |
| Requested fingerprints -> stamp | Component table keyed by artifact/component; `component_id`, `hash`, `algorithm`, fingerprint-schema identifier character | Known required body/helper/constants/rules listed explicitly. Missing/NA requested hash blocks; incomparable algorithm/schema is not equality. Source SHA is separate audit data | Pipdata owns curated PIP component coverage; stamp owns comparison/selection. Existing S code hash and Dp composite hashes are not assumed interchangeable. No general dependency discovery. |
| Stamp availability/status -> selector | Artifact key, optional output version, last attempt ID, outcome and failure class character; review acknowledgement logical where required | Successful reusable state requires verified data/metadata/version/proof. Failed outcome has no successful new-output pin. Missing/ambiguous status is not success | Durable status is interpreted by stamp. Pipdata supplies classified failure facts; unknown classification blocks for review in this proposal. Logs cannot override it. |
| Stamp -> pipdata decisions | One row per requested artifact; `action` character in run/skip/blocked; `reasons` character list-column; optional retained version and receipt ID | Action/reasons nonmissing; no reuse pin required for blocked/first-run work. Skip is valid only with a verified retained output and matching execution proof | Stamp alone selects. Pipdata executes supplied recipes and preserves reasons. This internal handoff does not settle D4's public engine feedback columns or Force semantics. |
| Successful save/unchanged execution -> consumers | Receipt ID character, artifact path/version character, content hash/algorithm character, semantic metadata pin/schema, requested fingerprint, exact parent pins, outcome character | Successful built/unchanged outcome requires all reusable references and completed publication. Failed receipt cannot become reusable. An unchanged raw st_save return is not sufficient evidence | Stamp owns output and immutable execution records. An unchanged result resolves a usable retained version; old snapshot parents are never edited. Same fully satisfied later request writes no new success receipt. |
| Version-aware metadata -> pipload/pipdata | Artifact path + explicit version character selects metadata; caller schema identifies result-relevant fields and scalar/vector types | Required semantic values cannot be missing; reserved-key collisions rejected; historical missing metadata fails explicitly, with no current-sidecar fallback | Changed recorded source-version/module-version/data-type requires a new semantic artifact version under existing policy. Descriptive fields need not version. Typed data-free read must not load artifact data. |
| Versioned data -> pipload | Path/version plus explicit physical format character; content and same-version metadata proof | Missing snapshot/hash/metadata fails clearly. Do not silently switch version or extension | Preserve existing wrapper positional/default contracts, fst boundaries, and qs2/rds supported paths. Separate QS2 metadata artifacts remain separate from custom sidecars. No new public signature is inferred. |

### Incremental State Proposal

The Decided policy is unchanged (`SYSTEM_DESIGN.md:190,209-223`). Proposed precedence, subject to D5 approval:

1. Invalid recipe, missing requested hash, unavailable required parent, failed upstream, or contradictory/partial proof: blocked, with explicit reasons; never falsely current.
2. Unchanged deterministic failure: blocked for analyst review plus input/rule change. A missing output alone must not accidentally bypass that failure policy.
3. External failure: eligible on the next analyst-started execution if prerequisites are valid. No timers, automatic retries, or automatic runs.
4. Missing output with valid parents and no suppressing failure: eligible to run. Only missing saved fingerprint with complete requested proof follows the selected recovery proposal.
5. Matching successful proof and available output: skip. Changed requested fingerprint or input pins: evaluate for run, then recheck descendants after the actual outcome.

Pipdata may retain inventory, acquisition/validation facts, receipts, fencing, and logs. Its existing manifest comparison cannot remain a second selector on the M2 path (Dp `R/dependency_execution.R:559-718`; umbrella `:207-219`). No operational safeguard is deleted merely to simplify authority. Existing callers need preservation or an explicitly approved migration.

### Metadata and History Constraints

Content equality alone is insufficient when the meaning of the data changed. A neutral schema must declare which caller metadata affects meaning and how types/NA/nulls are represented; stamp validates generic structure and comparisons, not PIP policy. Module names remain part of artifact identity. Upstream parent pins recorded in an execution receipt must not overwrite a pinned artifact's original metadata or be confused with its recorded source-version fields.

Do not force every unchanged save or use timestamps as result changes. The selected parent-only case does not settle equal-content behavior following a code-fingerprint change; S currently versions code changes (`R/IO_core.R:974-997`). Resolve that compatibility question before extending cutoff to that case. How a future TEST manifest references execution proof is a D6 dependency, not a manifest-schema choice here.

## D8 Local Plan and Test-Safety Proposals

These are candidate future write sets, not assignments or permission to write outside pipsystem. Actual maintainers/worker identities, current conflicting work, default branches, and future execution branches are UNKNOWN. Reverify each repository and obtain direct scope/owner approval there. A current branch name below is an observation, not a request to switch or create one.

### First Local Units

| Unit / candidate owner | Root, observed branch, and incoming evidence | Candidate saved Plan and code/test paths | Local acceptance |
|---|---|---|---|
| Stamp generic contracts/gaps; stamp maintainer, individual UNKNOWN | S root; `ready_cran`; observed S, not tested | `.cg-docs/plans/2026-10-14-m2-stamp-generic-gaps.md`; `R/rebuild.R`, `R/version_store.R`, `R/IO_core.R`, `R/hashing.R`, `R/format_registry.R`; existing `tests/testthat/test-should-save.R`, `test-save-load.R`, `test-info-retention-children.R`, `test-sidecar-verify.R`; proposed `test-m2-rebuild.R`, `test-m2-state.R`, `test-m2-metadata.R` only where existing files cannot hold the cases | L-stamp/V2-V5: real isolated storage, requested hashes, missing/failure state, graph order/cycles, immutable unchanged receipt and convergence, semantic metadata versions and pinned data-free reads. No survey/mean/release prerequisite. |
| Pipload adapter compatibility; pipload maintainer, individual UNKNOWN | L root; `PROD`; wait for tested stamp producer evidence | `.cg-docs/plans/2026-10-14-m2-pipload-adapter-contracts.md`; conditional corrections to `R/pip_read-write.R`, `R/pip_inv_enrich.R`, `R/load_pip_data.R`, `R/load_aux_data.R`; `tests/testthat/test-pip_read-write.R`, `test-pip_inv_enrich.R`; proposed `test-m2-adapter-contracts.R` | Adapter part of L-authority/V6: actual explicit-version/format forwarding and pinned metadata/data round trips; no private snapshot-path dependency as the new contract. Existing parent forwarding may need no code change. |
| Pipdata authority integration; pipdata coordination maintainer, individual UNKNOWN | Dp root; `PROD`; wait for tested stamp/adapter pins | `.cg-docs/plans/2026-10-14-m2-pipdata-authority.md`; `R/pd_run_pipeline.R`, `R/dependency_execution.R`, `R/dependency_plan.R`, `R/dependency_contract.R`, `R/code_fingerprint.R`, `R/save_pip.R`; `tests/testthat/test-code-fingerprint.R`, `test-dependency-api-contract.R`, `test-dependency-contract.R`, `test-dependency-plan.R`, `test-dependency-execution.R`, `test-pd-run-pipeline.R`, `test-save_pip.R`; proposed `test-m2-authority.R` | L-authority/V6: stamp decisions honored with simple neutral producers and real storage; contradictory manifest/log facts cannot select work; failed parents block. D4-dependent public feedback/Force implementation remains blocked. |

Sequence these units; no parallel implementation is proposed. The pipload unit may remain verification-only if approved stamp access can be forwarded without changes. Do not create adapter code solely because a candidate path is listed. Any new entry-point file or public API name requires an exact later Plan scope, not inference from illustrative signatures.

Each local Plan must separately authorize its own Plan progress fields and exact lifecycle paths. Candidate lifecycle pairs are:

- Stamp: `.cg-docs/work-reports/2026-10-14-m2-stamp-generic-gaps.md` and `.cg-docs/active-state/current.json` in S root.
- Pipload: `.cg-docs/work-reports/2026-10-14-m2-pipload-adapter-contracts.md` and `.cg-docs/active-state/current.json` in L root.
- Pipdata: `.cg-docs/work-reports/2026-10-14-m2-pipdata-authority.md` and `.cg-docs/active-state/current.json` in Dp root.

Candidate local Plan progress fields are `status`, `current-phase`, `completed-phases`, `execution-report`, and `completed-date`, only as supported by that repository's installed workflow. Active-state schema, report collision handling, existing lifecycle ownership, and permitted generated documentation deltas require local inspection. NAMESPACE/DESCRIPTION and generated Rd files are NOT blanket-authorized by the candidate sets above; the local API review must enumerate any required exact additions before approval. Preparation of a saved Plan is separate from approval to execute it. No local lifecycle file is created here.

### Observed Setup, Teardown, and Resource Risks

| Package | Read-only evidence | Consequence for a proposed gate |
|---|---|---|
| Stamp | S `R/zzz.R:81-109` initializes options/registries/theme; `tests/testthat/helper-opts.R:12-19` snapshots/restores stamp's option store. Existing tests use temporary stores and some explicit recursive deletion, e.g. `test-info-retention-children.R:1-78`, `test-should-save.R:36-61`; source scans also found destructive missing-snapshot fixtures. | Fresh process and disposable test root required; restore working directory/options/aliases and bound all cleanup to scratch. Inspecting the new helper does not prove every test calls it or every dependency hook is contained. |
| Pipload | L `tests/testthat/helper.R:3-7` only checks configured `_aux` availability. `test-pip_inventory.R:1-15` reads PIP_ROOT_DIR and updates inventory; `test-load_pip_deflated_data.R:195-221` finds a working release and leaves aliases in-session; `test-pip_load_aux.R:9-18` contains a shared UNC path; `test-pip_find_data.R:2-11` and `test-pip_load_data.R:1-15` invoke legacy lookup/load paths. | Unsetting one variable is not proof of isolation. Do not run this full suite against the user's normal configuration. Explicit exclusions or a separately contained, approved full-suite environment are necessary. |
| Pipload wrapper tests | L `test-pip_read-write.R:9-29,46-108,115-199` writes temp stores and explicitly deletes them; existing metadata enrichment fixtures construct paths themselves. | Use fresh unique scratch/process and failure-safe teardown. Manually created snapshot layouts do not replace actual stamp integration. |
| Pipdata | Dp `R/zzz.R:2-25` defaults a cache path and calls `pipfun::log_init` on load. Its storage effects and dependency hooks are outside the three-package source scope. `helper-dependency-fixtures.R:128-175,301-314` creates stores and a manifest/lease in temp roots. | Redirect cache/log/manifest/storage roots before package loading and inspect the invoked dependency hooks under separate source-read scope, or prove containment in an approved isolated environment. Current safety claim is UNKNOWN. |
| Pipdata helpers | Dp `helper-dlw-wrapper-fixtures.R:1-25` parses nine other test files and evaluates top-level assignments even when tests are filtered. `helper-dlw-data.R:1-17,99-137` supplies synthetic generators. | A test-name filter does not isolate helper effects. Audit parsed assignments and package hooks before any candidate filtered gate is runnable. Do not execute fixture-regeneration scripts. |

No production/runtime data, credentials, global/private configuration, session files, fixture data binaries, or unrelated package sources were read. In particular, pipfun source was not read to resolve its load-hook effects by routing around the approved scope.

### Exact Candidate Gates and Their Limits

**No command below was executed or certified safe. D8 remains blocked for implementation until the local owner approves an exact gate and establishes containment.** These are concrete command proposals for future local Plans, not authorization to run them now.

For each package, use a fresh `Rscript --vanilla` process, a preapproved isolated library/runtime, no dependency installation/update, disabled network/shared-storage access, read-only source/input mounts, and writes confined to package-specific disposable scratch plus explicitly approved lifecycle outputs. Set the process-start TMPDIR/TMP/TEMP and user-cache locations before R starts. Candidate scratch prefixes, not created or authorized here, are `C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-contracts/stamp`, `/pipload`, and `/pipdata`. The actual runner must prove that file access and deletion cannot escape the selected prefix; environment variables alone are not enforcement.

Full stamp testthat candidate, working directory S root:

```text
Rscript --vanilla -e "Sys.setenv(NOT_CRAN='true'); testthat::test_local('.', reporter='summary', stop_on_failure=TRUE, stop_on_warning=TRUE)"
```

This selects all `tests/testthat/test-*.R`, including new approved local tests and automatic helper loading. It excludes manual scripts, examples, vignettes, R CMD check, benchmarks outside that suite, and production/Windows-SMB/multiwriter integration. Record every testthat skip, including currently skipped missing-sidecar/partition cases; a skipped core V2-V5 case cannot count as completed. Dependencies/hooks and source-wide resource audit remain prerequisites, not passed checks.

Pipload candidate workflow-compatible substitute, working directory L root, requiring direct approval instead of silently replacing a full-suite gate:

```text
Rscript --vanilla -e "Sys.setenv(NOT_CRAN='true'); testthat::test_local('.', filter='^(pip_read-write|pip_inv_enrich|m2-adapter-contracts)$', reporter='summary', stop_on_failure=TRUE, stop_on_warning=TRUE)"
```

Exact selected existing files: `test-pip_read-write.R`, `test-pip_inv_enrich.R`; add `test-m2-adapter-contracts.R` only after its local approval. `helper.R` is still loaded. Excluded existing files: `test-load_pip_deflated_data.R`, `test-pip_class.R`, `test-pip_create_vintage.R`, `test-pip_find_data.R`, `test-pip_inventory.R`, `test-pip_load_aux.R`, `test-pip_load_data.R`, `test-verbose-arg.R`. This loses legacy lookup/release/convenience/class/verbosity coverage; document that debt, retain required compatibility checks in the approved adapter cases, and do not call it a full suite or complete M2 evidence.

Pipdata candidate workflow-compatible substitute, working directory Dp root, also requiring direct approval and the helper/hook audit above:

```text
Rscript --vanilla -e "Sys.setenv(NOT_CRAN='true'); testthat::test_local('.', filter='^(code-fingerprint|dependency-(api-contract|contract|plan|execution)|pd-run-pipeline|save_pip|m2-authority)$', reporter='summary', stop_on_failure=TRUE, stop_on_warning=TRUE)"
```

The selected existing files are the seven pipdata test files in the First Local Units table; `test-m2-authority.R` is future. All other `tests/testthat/test-*.R` are excluded as a rule, not asserted safe: this omits acquisition, validation, real deflation, population, broader manifests/leases/bootstrap/performance, reports/logging, recode, release, and utility coverage. All automatic helpers remain in scope of the safety audit, including the nine parsed files. Existing API-contract tests assert exact formals/exports (Dp `test-dependency-api-contract.R:1-73,75-135`); do not weaken them merely to permit an unapproved entry point. The gate must include actual stamp/pipload storage and stamp decision traces, not only synthetic replacement workers.

The minimum integration runtime must satisfy declared package requirements: S R >= 4.1 and testthat >= 3.1.5 (`DESCRIPTION:21-43`); Dp R >= 4.4 and testthat edition 3 (`DESCRIPTION:35-41`); L edition 3 (`DESCRIPTION:36-47`). For the combined units, propose R >= 4.4, testthat >= 3.1.5, and installed fst, qs2, filelock plus declared dependencies. Exact R build, testthat/pkgload/withr and storage/dependency versions, loaded producer package locations/SHAs, hook behavior, lock results, and exit/skip results remain UNKNOWN. Source DESCRIPTION versions are not proof of the installed runtime. No cloud platform is selected.

### Local Versus Milestone Evidence

L-stamp proves V2-V5 using neutral nodes, actual storage, old-pin readback, and unchanged second/third-run counters. L-authority proves V6 with simple supplied producers, real adapters, and stamp-only decisions. Neither requires a future survey, mean, or test-release implementation. Synthetic scheduling fixtures cannot establish real deflation or numerical equivalence (Dp `helper-dependency-fixtures.R:506-616`; `HARVEST.md:45-49`).

Later core T1-T12 remain mandatory at tested integrated pins: unchanged reruns, consumed-CPI effects and unaffected controls, unrelated CPI avoidance, relevant/unrelated code changes and missing hashes, missing/failure recovery, semantic metadata/history, unchanged lineage, real deflation/mean/weight cases, no-save and independent-result recovery, pinned TEST retrieval, and graph/publication integrity (umbrella `:461-478`). No local substitute, safety exclusion, or documented blocker waives a core case. Variable-level tracking is not required by Option 1; M1 R1 and T3 consumed-row selectivity remain separate unresolved work, not deleted requirements.

## Decision

Problem validation: source shows the unchanged-save/currentness gap, not measured production frequency or runtime cost. Keeping the status quo cannot establish the umbrella's required unchanged-lineage proof. No reproduced runtime failure or performance estimate is claimed.

Simplicity: the selected case needs artifact-level parent pins and validated execution proof, not a variable-level graph, new PIP runtime package, general dependency-discovery framework, or another scheduler. Reuse existing public storage/adapter surfaces where compatible; the receipt must be a real stamp mechanism, not a pipdata workaround.

Effort/value: retaining B and skipping C is useful, but the extra execution reference has a maintenance cost. Bound the first case to parent-only changes; do not broaden it to every code-change/equivalence problem without a decision. No quantified effort or speedup is established.

Charter alignment: the approach preserves neutral stamp authority, pipdata coordination, pipload access, portable R/data.table/collapse, module-bearing identity, and read-only package boundaries from pipsystem. It does not waive R1, metadata safeguards, API compatibility, Windows/SMB evidence, or core M2 tests. Stakeholders are package maintainers and the PIP team; individual owners are UNKNOWN.

**Outcome:** record Option 1 as the user-selected bounded discussion approach and the asymmetric policy as the user-selected proposal preference. Keep the full D5 contract and D8 gates unapproved. The user confirmed the minimal record and declined further complexity. No implementation phase, protected-design integration, or roadmap change is approved.

### Exact Remaining Decisions for Andres

| Decision request | Proposed wording to approve or revise later | Status / boundary |
|---|---|---|
| D5 fingerprint contract | Require complete requested calculation/known-helper fingerprints before reuse or execution; missing requested proof blocks; only missing saved proof may be recovered by a valid rebuild that persists proof. Approve algorithm/schema compatibility and coverage obligations. | Asymmetric direction preferred, full typed/API contract not approved. |
| D5 state contract | Stamp owns durable success/failure/currentness interpretation; approve missing/ambiguous-state precedence, typed failure facts and review proof under the existing analyst-started policy. | Proposal only; no automatic retries or D4 Force override. |
| D5 receipt contract | Approve immutable successful-execution proof linking exact new input pins to the retained output, usable unchanged receipts, validation/publication/retention and data-free retrieval, without editing old pinned history. | Option 1 selected as discussion approach; exact mechanism/API still unapproved. |
| D5 metadata contract | Approve neutral caller-declared result-relevant metadata schema, reserved-key/type/null rules, semantic version trigger and same-version metadata access. | Existing safeguards are Decided; their exact mechanism remains Open. |
| D5 code-change boundary | Decide whether unchanged-result cutoff will also retain output pins after a requested code fingerprint changes, or retain current code-driven output versioning. | Not selected by the parent-only example; resolve before implementing that extension. |
| D8 first local scope | Approve the first stamp local Plan/write/lifecycle set, named owner, branch/worktree, tested dependency requirements and contained gate; approve later adapter/engine units separately. | All future Plan preparation and execution need direct approval. |
| D8 test substitute | Approve a proven isolated full suite, or the exact compatible filtered substitute and its exclusions after helper/hook/resource inspection; exclude no core local acceptance case. | No safe gate certified; implementation blocked. |

D4 engine feedback/Force, D1-D3 survey/PPP/weights/mean choices, D6 manifest semantics, D7/M1 R1, platform, and unrelated design choices remain outside this selection. Identify their affected dependencies without selecting them here.

## Next Steps

These prompts are proposed future requests, not commands dispatched or authorizations conveyed by this file. User-started local planning must obey that repository's permissions; pipsystem remains the only writable root in this session.

### Proposed First Request: Stamp Local Planning Only

```text
Command: /cg-plan
Task proposal: m2-stamp-local-plan-2026-10-14
Features: close-stamp-gaps-for-skeleton; create-engine-skeleton boundary only
Root: E:/PovcalNet/01.personal/wb384996/Rpackages/stamp
Branch: current observed ready_cran; future approved branch UNKNOWN, verify locally
Worktree: existing repository proposed; no new worktree/branch authorized here
Owner/session and other write sets: UNKNOWN; verify before preparation
Evidence pin: ad9a483b6261166a6feefc64baea5d602198977b, observed not tested
Proposed output: .cg-docs/plans/2026-10-14-m2-stamp-generic-gaps.md only
Scope: after direct planning approval, prepare the smallest local saved Plan
for D5 contract/API and test-safety preparation, then conditional generic-gap
implementation phases. Keep unresolved D5/D8 approvals as explicit gates.
Use the bounded Option 1 and asymmetric proposal without upgrading either
into blanket D5 approval. Resolve exact API/metadata/status/receipt contracts,
containment and runtime pins before any implementation phase can start.
Inspect public APIs, test helpers/hooks/cleanup and resource access; no tests,
package changes or lifecycle writes are authorized by this planning proposal.
Enumerate any additional source-read roots needed for dependency-hook safety.
Return exact code/test/generated-doc/lifecycle paths for later approval,
L-stamp/V2-V5 gates, actual observed pins, gaps, and full sanitized handoff.
Do not execute the pipsystem umbrella, select R1, or start another worker.
```

After tested stamp producer evidence exists, separately propose `/cg-plan` for `m2-pipload-adapter-local-plan-2026-10-14` in L root, observed branch `PROD` but future approved branch/owner UNKNOWN, existing checkout proposed, output `.cg-docs/plans/2026-10-14-m2-pipload-adapter-contracts.md` only. Use L observed pin plus the exact stamp commit actually tested; plan conditional forwarding/format/pinned metadata corrections and L-authority adapter evidence, not new authority. No implementation or test execution is approved by this prompt proposal.

Then separately propose `/cg-plan` for `m2-pipdata-authority-local-plan-2026-10-14` in Dp root, observed branch `PROD` but future approved branch/owner UNKNOWN, existing checkout proposed, output `.cg-docs/plans/2026-10-14-m2-pipdata-authority.md` only. Use Dp observed pin and exact tested upstream pins; prepare the local authority-reconciliation Plan, safe helper/hook gate and L-authority/V6 evidence. Keep D4-dependent behavior blocked. Preserve legacy compatibility or obtain explicit migration approval; do not retain a manifest-derived shadow selector. No new branch/worktree, helper, roadmap change, package execution, or lifecycle write is authorized by this proposal.

Only after separate local Plan, contract, write/lifecycle, owner, runtime and safe-gate approvals may a user explicitly select that saved local Plan and request `/cg-work phase1` in its own repository. No most-recent-Plan fallback may select the umbrella. This record does not start downstream planning or work, nor request umbrella revision.

## Gaps

- Full D5 and D8 remain unapproved. Option 1 and a missing-hash preference do not settle exact schemas, signatures, publication/receipt storage, metadata types, unknown-state handling, or compatibility migration.
- Equal-output cutoff following changed calculation fingerprints remains unresolved. No variable-level dependency tracking is selected; M1 R1/required consumed-row selectivity remains Open and cannot be waived by early cutoff.
- Current stamp differs from harvest and no longer exports partition helpers. Historical notes/fit rows remain historical evidence; no partition or row-level mechanism is assumed from them. The request's conflicting historical SHA triplet is not repaired here.
- No R/package source was executed and no tests, pipelines, DLW/API calls, numerical/API equivalence checks, concurrent-write, Windows/SMB, scale or release-retention checks ran. Dependencies actually tested: NONE.
- Test commands are candidate gates, not proven safe. Uninspected dependency hooks, pipdata cross-file helper assignments, containment enforcement, runtime/cache/log roots, cleanup behavior and test exclusions require local approval/verification. No access to pipfun or other extra sources was inferred.
- Actual named implementation owners, concurrent work sets, native session IDs, default branches, future approved branches/worktrees, safe test roots and loaded dependency versions are UNKNOWN. No complete inventory or conflict-free execution claim is made.
- D4/Force/feedback, other D1-D7 choices, D6 execution-proof membership, R1, platform and later integration remain outside this record's selection. Local tests cannot complete or waive T1-T12.
- Required communication skill activation failed; plain-language fallback was used. Package-root AGENTS files were unavailable. Post-save document validation/readback and final scope results are reported in the response, not represented here as package/runtime evidence.

## Handoff

| Required field | Record |
|---|---|
| Feature/task ID | `m2-stamp-contracts-2026-10-13`; `close-stamp-gaps-for-skeleton`, `create-engine-skeleton`; milestone `m2-walking-skeleton` |
| Repository, worktree, and session ID | pipsystem; `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`; existing checkout; native ID UNKNOWN, permitted for this bounded document |
| Branch, base SHA, and current SHA | `main`; task base `45426874ae489c398b0d7ba479d92f3e016264fb`; save baseline `f1863d2e80471616842aebfa5918651c947ba50d`; final current SHA supplied in response |
| Approved scope, Plan, and completed phase | Discussion and this exact one-file capture only; unapproved M2 umbrella as input; no implementation Plan/phase approved or executed |
| Worker status | Minimal discussion captured; selected approach recorded, remaining D5/D8 gates unapproved. Final document acceptance result supplied in response |
| Changed files | This brainstorm only by this worker; preserve all pre-existing/concurrent changes |
| Executed checks and evidence paths | Read-only root/branch/HEAD/status, source diffs and targeted API/test inspection; controlling sources and package refs above; protected-file hashes collected before save; final readback/validation/scope results in response |
| Dependency versions/SHAs actually tested | NONE; S/Dp/L table is observed source evidence only |
| Checks not run | All package/runtime/pipeline/API/data/production/storage-safety/integration tests; native inventory/recall, remote freshness, helper starts and downstream execution |
| Remaining blockers or required decisions | Exact remaining-decision table and Gaps; D8 safe gate absent; downstream local preparation/execution approval absent; Feature 2 BLOCKED |
| Commit and PR | None created; no staging, commit, push, merge, branch operation or cleanup |
| Recommended next action | Separate direct review/approval of applicable D5 rules and first stamp repository-local planning scope; do not start umbrella /cg-work |
| Inventory limits | Only authorized local project and three-package public source/test evidence; no private session/configuration/runtime data or complete worker inventory |
