---
date: 2026-08-21
title: "Evidence-first Phase 1 package harvest"
status: active
scope: "Deep"
brainstorm: ".cg-docs/brainstorms/2026-08-21-pre-harvest-documentation-reuse.md"
language: "R"
estimated-effort: "large"
deviation-policy: "ask"
artifact-schema-version: 1
phases: 4
tags: [harvest, provenance, documentation, stamp, dependency-graph, data-contracts]
---

# Plan: Evidence-First Phase 1 Package Harvest

## Objective

Produce a deterministic, SHA-pinned Phase 1 harvest for `stamp`, `pipfun`,
`pipload`, `pipaux`, `pipdata`, `wbpip`, `pipapi`, `pipster`, and `metapip`.
Use prior documentation only to navigate to source and tests. The accepted
outputs must expose package I/O, auxiliary-data access granularity, outputs,
cleaning rules, `stamp` capability gaps, and cross-package inconsistencies with
machine-validated provenance.

## Context

- The charter requires source/test evidence, repository SHAs, explicit
  `UNKNOWN` values, and non-empty Gaps sections.
- The decided brainstorm excludes `pipfaker` and gives `metapip` a focused
  configuration, network, cache, lockfile, and side-effect pass.
- `HARVEST_BRIEF.md` still includes `pipfaker`, skips `metapip`, incorrectly
  states that PIP packages do not depend on `stamp`, and has tables that cannot
  satisfy its row-level provenance rule.
- `pipsystem` is a plain R project. It has no `DESCRIPTION`, `NAMESPACE`, test
  harness, dependency lockfile, or extraction implementation.
- PIP clones are under one workspace root, while the current `stamp` clone is
  elsewhere. Implementation must accept portable source-root configuration and
  must not commit runtime checkout or temporary paths. Source-literal production
  paths remain valid findings and receive canonical placeholder IDs.
- Installed package versions and SHAs differ from several source clones.
  Namespace loading also triggers package startup side effects. Source HEAD is
  therefore authoritative; runtime reflection is optional, isolated, and
  allowed only after installed/source SHA equality is established.
- Relevant prior learnings distinguish `stamp` `version_id` from
  `content_hash`, require artifact-level and row-level auxiliary change gates,
  and document a soft dependency cycle between `pipload` and `pipdata`. These
  are hypotheses and navigation aids until reverified at pinned HEADs.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Define the canonical nine-repository scope and remove stale `pipfaker` and `metapip` skip instructions. | Charter; brainstorm decision |
| R2 | Treat README, roxygen, vignettes, generated sites, DeepWiki, and `.cg-docs` as navigation only. | Charter; brainstorm requirements |
| R3 | Pin every repository to a 40-character SHA before reading, cite committed blobs, and detect HEAD/worktree drift before acceptance. | Charter constraints |
| R4 | Implement deterministic, source-first mechanical extraction without loading package namespaces as the source of truth. | Harvest brief; repository research |
| R5 | Revise the fixed schemas so every fact has a stable ID, primary file/line evidence, and normalized support for multiple evidence records. | Charter; harvest brief contradiction |
| R6 | Validate schemas, types, enums, keys, provenance, `UNKNOWN` mappings, non-empty Gaps, referential integrity, and byte determinism automatically. | Charter; harvest brief rules |
| R7 | Assess `stamp` against all listed capabilities and answer its five design questions with source and executed-test evidence where available. | `HARVEST_BRIEF.md` section 5 |
| R8 | Harvest `pipfun` and `pipload` infrastructure, configuration, path grammar, artifact wrappers, inventory, cache, and side effects. | `HARVEST_BRIEF.md` sections 6 and 8 |
| R9 | Harvest `pipaux` update flow, auxiliary series access, versioning, dependency processing, keys, granularity, and side effects. | Charter current focus; harvest brief |
| R10 | Harvest `pipdata` orchestration, per-survey control flow, auxiliary use, deflation, outputs, and YAML/code rules. | `HARVEST_BRIEF.md` section 8 |
| R11 | Harvest `wbpip` input assumptions and purity evidence, plus a light `pipster` representation pass. | `HARVEST_BRIEF.md` sections 6 and 8 |
| R12 | Harvest the `pipapi` input contract and focused `metapip` configuration, network, cache, lockfile, install, and attach side effects. | Brainstorm decision; harvest brief |
| R13 | Reconcile cross-package writes/reads, dependencies, paths, schemas, rules, auxiliary granularity, and `stamp`/`pipload` overlap. | `HARVEST_BRIEF.md` section 9 |
| R14 | Record commands, SHAs, table counts, skipped evidence, failures, and final validation in `HARVEST.md`. | `HARVEST_BRIEF.md` section 9 |
| R15 | Execute package code/tests only from disposable exports of pinned commits with a temporary library and isolated runtime roots. | Charter read-only constraint; plan review |
| R16 | Produce closed-world source/candidate manifests and canonical artifact relationships so negative claims and reconciliation have reproducible coverage denominators. | Charter no-fabrication constraint; plan review |

## Data Contracts

These contracts are implementation inputs, not decisions deferred to
`/cg-work`. Step 1 must copy them into `HARVEST_BRIEF.md` before any accepted
output is generated.

### Common Value And Identity Rules

- All columns are character unless explicitly typed below. Character cells must
  never be blank.
- Use `UNKNOWN` only when a value is epistemically undetermined. Every row
  containing `UNKNOWN` must carry a non-`NOT_APPLICABLE` `gap_id` and map to a
  note entry with this exact grammar:
  `- <gap_id> | facts: <fact_id>[, <fact_id>...] | <gap text> | evidence: <file>:<line>`.
- Use `NOT_APPLICABLE` only when a field does not apply by definition. Do not
  use `NA`, an empty string, `NULL`, `N/A`, `TBD`, or `None` for fact values.
- Integer citation columns must be positive. The sole nullable exception is
  `tables/evidence.csv::line`, which may be integer `NA` only when
  `evidence_kind = test_execution` and `file = NOT_APPLICABLE`.
- `is_fun` is logical and never missing. `loads_full_table` and `has_overrides`
  are character enums `TRUE`, `FALSE`, `UNKNOWN`, or `NOT_APPLICABLE`.
- A fact ID is
  `<table>:<package>:<sha256(canonical-key-values-joined-with-U+001F)>`, using
  lowercase table/package slugs and a 64-character SHA-256 digest over UTF-8
  text. Canonical key values are the table key columns listed below after path
  and sentinel normalization. IDs must be stable across row order and runs.
- `gap_id` is `gap:<package>:<sha256(sorted-fact-ids-and-gap-text)>` or
  `NOT_APPLICABLE`. `evidence_id`, `manifest_id`, and `candidate_id` use the same
  SHA-256 construction with prefixes `evidence:`, `manifest:`, and `candidate:`.
- Every fact table is sorted by its listed key before writing. Multi-value cells
  are deduplicated and sorted, then joined with `;`.

### Exact CSV Contracts

| Artifact | Exact ordered columns | Primary key | Deterministic sort |
|----------|-----------------------|-------------|--------------------|
| `identity.csv` | `fact_id,package,version,repo_url,branch,commit_sha,imports,suggests,remotes,file,line,gap_id` | `package` | `package` |
| `api.csv` | `fact_id,package,function_,is_fun,signature,file,line,gap_id` | `package,function_` | `package,function_` |
| `deps_internal.csv` | `fact_id,caller_package,caller_function,callee_package,callee_function,call_type,resolution,file,line,gap_id` | `caller_package,caller_function,callee_package,callee_function,file,line,call_type` | same as key |
| `config.csv` | `fact_id,package,kind,key,default,raw,file,line,gap_id` | `package,kind,key,file,line` | same as key |
| `io_points.csv` | `fact_id,package,function_,file,line,direction,target_kind,target,artifact_id,path_source,config_key,format,notes,gap_id` | `package,function_,file,line,direction,target` | same as key |
| `aux_access.csv` | `fact_id,package,function_,file,line,series,granularity,key_columns,key_set,loads_full_table,artifact_id,notes,gap_id` | `package,function_,file,line,series` | same as key |
| `outputs.csv` | `fact_id,package,function_,artifact_name,artifact_id,storage_location,format,primary_key,columns,columns_source,file,line,notes,gap_id` | `package,function_,artifact_id,file,line` | same as key |
| `rules.csv` | `fact_id,package,rule_id,rule_name,rule_kind,defined_in,definition_location,scope,has_overrides,override_location,on_failure,file,line,notes,gap_id` | `package,rule_id,file,line` | same as key |
| `stamp_fit.csv` | `fact_id,package,requirement,stamp_function,status,evidence_file,evidence_line,notes,gap_id` | `requirement` | `requirement` |
| `evidence.csv` | `evidence_id,fact_id,package,repo_sha,evidence_kind,file,line,command,result,notes` | `evidence_id` | `fact_id,evidence_kind,file,line,evidence_id` |
| `source_manifest.csv` | `manifest_id,package,repo_sha,file,blob_sha256,file_kind,scan_status,notes` | `package,file` | `package,file` |
| `candidates.csv` | `candidate_id,package,repo_sha,category,file,line,primitive,disposition,fact_id,exclusion_reason,gap_id` | `candidate_id` | `package,file,line,category,primitive` |
| `contract_edges.csv` | `fact_id,package,producer_fact_id,consumer_fact_id,artifact_id,relation,status,notes,gap_id` | `producer_fact_id,consumer_fact_id,artifact_id,relation` | same as key |

Typed columns are `line` and `evidence_line` as integer, and `is_fun` as
logical. All other columns are character under the value rules above.

### Enumerations And Referential Rules

- `call_type`: `namespace`, `internal`, `imported`, `dynamic`.
- `resolution`: `resolved`, `unresolved`.
- `kind`: `option`, `env_var`, `package_accessor`, `yaml`, `constant`, `other`.
- `direction`: `read`, `write`.
- `target_kind`: `file`, `blob`, `db`, `api`, `option`, `env`, `other`.
- `path_source`: `hardcoded`, `constructed`, `config`, `argument`.
- `series`: `cpi`, `ppp`, `pop`, `gdp`, `pce`, `gdm`, `pfw`, `other`.
- `granularity`: `global_table`, `country`, `country_year`,
  `country_year_level`, `other`, `UNKNOWN`.
- `key_set`: `static`, `runtime`, `UNKNOWN`.
- `rule_kind`: `cleaning`, `validation`, `imputation`, `exclusion`,
  `transformation`.
- `defined_in`: `code`, `data`.
- `scope`: `global`, `region`, `country`, `survey`, `welfare_type`, `other`.
- `on_failure`: `drop`, `flag`, `error`, `impute`, `skip`, `UNKNOWN`.
- `columns_source`: `declared`, `inferred`, `UNKNOWN`.
- `status` in `stamp_fit.csv`: `supported`, `partial`, `absent`, `unknown`.
- `evidence_kind`: `source`, `test_declaration`, `test_execution`.
- `result`: `observed`, `passed`, `failed`, `skipped`, `not_run`.
- `file_kind`: `r_source`, `namespace`, `description`, `yaml`, `config`, `test`.
- `scan_status`: `scanned`, `parse_error`, `excluded`.
- `category`: `io`, `aux`, `rule`, `side_effect`, `config`, `network`,
  `database`, `dynamic`.
- `disposition`: `mapped`, `excluded`, `gap`.
- `relation`: `writes_reads`, `schema_contract`, `depends_on`, `overlaps`.
- `status` in `contract_edges.csv`: `matched`, `mismatch`, `unmatched`,
  `unknown`.
- Every `evidence.fact_id`, mapped `candidates.fact_id`, and contract-edge fact
  reference must resolve. Every repository SHA must equal its identity row.
- `supported` requires source plus `test_execution = passed`; `partial`,
  `absent`, and `unknown` require source evidence and a gap when uncertainty
  remains. `failed`, `skipped`, and `not_run` never count as passing evidence.

### Artifact Identity And Path Portability

- `artifact_id` is `<target_kind>:<normalized-target-template>` in lowercase,
  with `/` separators, normalized `.`/`..`, and sorted named placeholders.
- Replace a source-literal drive prefix such as `Y:/` with `<drive:y>/` and a
  UNC prefix with `<unc:server/share>/`. Preserve the exact source literal in
  `target` or `storage_location` and preserve its pinned citation.
- Represent variable segments as `{config:<key>}`, `{arg:<name>}`, or
  `{expr:<sha256>}`. Do not collapse distinct unresolved expressions.
- Reject committed local checkout roots, temporary roots, credentials, and
  runtime source-map values. Do not reject source-literal production paths;
  normalize them only in `artifact_id`.

### Closed-World And Negative-Evidence Protocol

- `source_manifest.csv` lists every committed R, NAMESPACE, DESCRIPTION, YAML,
  config, and test file examined at the pinned SHA, including files with no
  candidates.
- AST/config scanning emits every recognized I/O, network, database, option,
  environment, dynamic-dispatch, and rule primitive to `candidates.csv`.
- Every candidate must be `mapped` to a fact, `excluded` with a non-empty
  reason, or assigned to a Gap. No candidate may disappear during manual review.
- An `absent`, pure, or unmatched conclusion is permitted only when the complete
  relevant source manifest was scanned, all candidates were disposed, and no
  unresolved dynamic call can reach that category. Otherwise use `UNKNOWN`.

### Pinned Test Execution Contract

- Never execute package code or tests in sibling worktrees. Export each pinned
  commit with `git archive` to an OS temporary directory outside the workspace.
- Build/install the required pinned PIP packages in dependency order into a
  temporary library without network access or user-library writes. Set temporary
  `HOME`, `R_USER`, `R_LIBS`, `TMPDIR`, cache roots, and package path options.
- Before accepting a result, record package, source SHA, archive hash, install
  command, test command, loaded namespace path, loaded version, temporary
  library, start/end time, and result in `HARVEST.md`/`evidence.csv`. The loaded
  namespace path must be under the temporary library built from that SHA.
- Audit each targeted test for external/network writes first. If containment or
  required offline dependencies cannot be established, record `not_run` or
  `skipped`; do not weaken the evidence requirement.
- Ephemeral installation into the temporary library is allowed. Installation
  into user libraries, dependency downloads, and writes to source worktrees are
  forbidden.
- Snapshot sibling tracked status plus path, size, and SHA-256 for every
  pre-existing untracked file before and after the overall harvest.

## Phase 1: Canonical Specification And Evidence Harness

### 1. Reconcile Scope And Evidence Schemas

- **Requirements**: R1, R2, R5
- **Files**: `compound-gpid.context.md`, `HARVEST_BRIEF.md`
- **Details**: Make the nine-repository scope authoritative. Remove `pipfaker`,
  replace the `metapip` skip with its focused pass, and correct current `stamp`
  dependency wording. Copy the complete Data Contracts section into the brief,
  including exact ordered headers, types, keys, sort orders, enums, sentinels,
  ID construction, Gap grammar, artifact normalization, candidate coverage,
  and evidence joins. Keep one row per requirement in `stamp_fit.csv`; use
  `evidence.csv` for multiple citations. Remove run date from deterministic data
  tables and record it only in `HARVEST.md`.
- **Test Scenarios**: Happy path: exactly nine repositories and all literal
  headers are defined. Edge case: a fact has source plus test evidence. Error
  path: stale package names or an evidence-free schema fail specification lint.
- **Tests**: Targeted `rg` checks; schema constants exercised by
  `tests/testthat/test-schema-validation.R`.
- **Acceptance criteria**: Scope and schema contradictions are resolved before
  any accepted CSV or note is created.

### 2. Implement Repository Snapshot And Citation Provenance

- **Requirements**: R2, R3, R5, R15
- **Files**: `R/harvest_helpers.R`, `R/validate_harvest.R`,
  `tests/testthat/test-provenance.R`, `tests/testthat/fixtures/`
- **Details**: Accept named repository roots through explicit command
  arguments or environment variables; never commit local paths. Capture HEAD,
  branch/detached state, origin, relevant dirty state, and pre/post SHAs. Read
  cited content with `git show <sha>:<path>`. Reject absolute/escaping paths,
  untracked evidence, out-of-range lines, changed tracked files, and SHA drift.
  Preserve pre-existing untracked files in sibling repositories without using
  them as evidence. Record path, size, and SHA-256 for each before and after the
  harvest. Implement pinned-commit export and temporary-library helpers here;
  package code must never execute from sibling worktrees.
- **Test Scenarios**: Happy path: clean pinned fixture. Edge case: detached HEAD
  and unrelated untracked file. Error path: changed cited file, missing commit,
  escaping path, invalid line, or HEAD drift.
- **Tests**: `tests/testthat/test-provenance.R`.
- **Acceptance criteria**: Every accepted fact resolves to a committed blob at
  the recorded SHA, and sibling worktrees are never written.

### 3. Implement Source-First Mechanical Extraction

- **Requirements**: R4, R5, R16
- **Files**: `R/extract.R`, `R/harvest_helpers.R`,
  `tests/testthat/test-extract-identity.R`, `test-extract-api.R`,
  `test-extract-dependencies.R`, `test-extract-config.R`, fixture repositories
- **Details**: Parse source `DESCRIPTION`, `NAMESPACE`, and R syntax trees.
  Extract identity; exports and source signatures; explicit `pkg::fun`/
  `pkg:::fun` calls; unqualified calls resolved through own definitions and
  `importFrom`; unresolved dynamic calls marked `UNKNOWN`; and literal options,
  environment variables, package accessors, YAML/config sources, and defaults.
  Generate `source_manifest.csv` from every in-scope committed source/config/
  test file and `candidates.csv` from all recognized I/O, auxiliary, rule,
  side-effect, network, database, config, and dynamic primitives.
  Do not merge dependency edges by bare function name. Runtime reflection may
  run only in an isolated process after exact SHA equality and may not override
  source facts. Stable-sort all outputs and write UTF-8/LF CSVs.
- **Test Scenarios**: Happy path: static fixture with explicit and imported
  calls. Edge cases: reexports, duplicate function names, multiline metadata,
  comments with fake calls, dynamic dispatch, zero-row typed output. Error
  paths: malformed metadata, ambiguous resolution, or installed/source mismatch.
- **Tests**: Four extractor test files plus fixture repositories.
- **Acceptance criteria**: Nine identity rows and source-declared API exports
  are reproducible; dependency/config extraction retains evidence and unresolved
  cases without guessing.

### 4. Build The Harvest Validator And Determinism Gate

- **Requirements**: R3, R5, R6, R14, R15, R16
- **Files**: `R/validate_harvest.R`, `tests/testthat/test-schema-validation.R`,
  `test-evidence-validation.R`, `test-note-validation.R`,
  `test-determinism.R`, `test-referential-integrity.R`, `R/preflight.R`,
  `tests/testthat/helper-load.R`
- **Details**: Validate literal headers/order, scalar types, enum domains,
  logical keys, package scope, fact/evidence joins, SHA consistency, committed
  line bounds, navigation-only evidence rejection, and cross-table references.
  Require every `UNKNOWN`/`unknown` to map through `gap_id` to the exact Gap
  grammar. Reject blank/NA epistemic fields while permitting the one documented
  execution-line exception. Enforce candidate dispositions and closed-world
  preconditions for absent/pure/unmatched claims.
  Reject absent, empty, or placeholder-only Gaps. Run extraction twice in clean
  R sessions and compare output SHA-256 values. Establish SHA-keyed count
  baselines only after the first independently accepted extraction. Add a
  preflight for R, Git, required packages, and minimum versions. The helper must
  source `R/harvest_helpers.R`, extractor functions, and validator functions in
  a fixed order without executing command-line entry points.
- **Test Scenarios**: Happy path: complete fixture. Edge case: typed empty table.
  Error paths: reordered column, duplicate key, invalid enum, orphan fact,
  forbidden evidence, placeholder gap, or nondeterministic output.
- **Tests**: `Rscript --vanilla -e "testthat::test_dir('tests/testthat', load_package = 'none', reporter = 'summary', stop_on_failure = TRUE)"`.
- **Acceptance criteria**: The validator exits nonzero for every invalid fixture
  and two identical runs produce byte-identical mechanical outputs.

## Phase 2: Persistence And Auxiliary Foundations

### 5. Assess `stamp` Capabilities

- **Requirements**: R2, R3, R7, R15, R16
- **Files**: `tables/stamp_fit.csv`, `tables/evidence.csv`, `notes/stamp.md`;
  read `stamp/R/IO_core.R`, `hashing.R`, `version_store.R`, `partitions.R`,
  `rebuild.R`, `retention.R`, and paired tests.
- **Details**: Answer partition parenthood, code hashing, content-hash versus
  version propagation, catalog scale/concurrency, and builder API stability.
  Classify every listed capability as `supported`, `partial`, `absent`, or
  `unknown`. A `supported` behavioral claim requires implementation evidence
  plus a recorded passing targeted test from a disposable pinned-commit export;
  skipped/manual-only coverage cannot be promoted to passing evidence. Apply
  the closed-world protocol before `absent` conclusions. Separate PIP needs from
  domain-agnostic `stamp` gaps and preserve the `version_id`/`content_hash`
  distinction.
- **Test Scenarios**: Happy path: source and passing test agree. Edge case: code
  exists but tests are skipped/manual. Error path: docs-only support claim or
  unresolved source/test contradiction.
- **Tests**: Targeted `stamp` tests for save/load, should-save, catalog, lineage,
  partitions, retention, and rebuild; commands/results recorded in evidence.
- **Acceptance criteria**: All five questions and every minimum capability row
  are evidenced; unknowns and gaps are explicit; `Rscript --vanilla
  R/validate_harvest.R --package stamp` exits zero before Phase 2 continues.

### 6. Harvest `pipfun` And `pipload`

- **Requirements**: R2, R3, R8, R15, R16
- **Files**: harvest CSVs, `notes/pipfun.md`, `notes/pipload.md`; read package
  state/configuration, GitHub I/O, logging, release management,
  `pipload/R/pip_read-write.R`, loaders, inventories, cache, and paired tests.
- **Details**: Establish configuration/path ownership and storage path grammar.
  Capture `stamp` wrappers, aliases, formats, inventory/cache behavior, and
  global/filesystem/network side effects. Reverify the `pipload`/`pipdata` soft
  dependency without treating its prior solution note as proof.
- **Test Scenarios**: Happy path: read/write pair and config source traced. Edge
  case: soft dependency or computed path. Error path: undocumented path builder,
  docs-only claim, or write target lacking a reader candidate.
- **Tests**: Validator plus relevant existing unit tests whose commands and
  results are recorded in `tables/evidence.csv`.
- **Acceptance criteria**: Both notes have real Gaps; path grammar and
  `stamp`/cache boundaries are reconstructable from tables; package validators
  for `pipfun` and `pipload` exit zero.

### 7. Harvest `pipaux`

- **Requirements**: R2, R3, R9, R15, R16
- **Files**: harvest CSVs, `notes/pipaux.md`; read `update_aux_data.R`,
  `utils.R`, `stamp_options.R`, `identify_changes.R`, `merger_aux.R`,
  `aux_cpi.R`, `aux_ppp.R`, `aux_pop.R`, `aux_gdm.R`, config, and paired tests.
- **Details**: Trace each relevant series from source/update through storage and
  consumption. Record key columns, static/runtime key selection, whole-table
  versus selective loading, version level, dependency recursion, idempotence,
  update/network/filesystem effects, and natural partition keys. Distinguish
  source behavior from skipped or environment-gated tests.
- **Test Scenarios**: Happy path: series update/read chain is evidenced. Edge
  case: runtime key, dependency recursion, or skipped integration test. Error
  path: guessed granularity or an update claim without source/test distinction.
- **Tests**: Validator and targeted non-network package tests; external tests
  are recorded as skipped/unknown unless safely executable.
- **Acceptance criteria**: `aux_access.csv` can answer consumption granularity
  per series without inference from documentation, every candidate is disposed,
  and the `pipaux` package validator exits zero before Phase 2 completion.

## Phase 3: Processing, Computation, And Consumers

### 8. Harvest `pipdata`

- **Requirements**: R2, R3, R10, R15, R16
- **Files**: harvest CSVs, `notes/pipdata.md`; read `pd_process_data.R`,
  `pd_deflation.R`, `pd_aux_attr.R`, `valid_aux_load.R`,
  `pipdata_dlw_validation.R`, `recode_spec.R`, YAML specs, save/inventory code,
  and paired tests/fixtures.
- **Details**: Trace batch versus per-survey control flow, exact auxiliary
  inputs and keys, artifact/content hashes, cleaning and validation rules,
  country/survey overrides, failures, outputs, inventories, and side effects.
  Determine independently whether artifact-level and affected-row gates exist;
  record each as present, partial, absent, or unknown with separate evidence.
  Never confuse `content_hash` with `version_id`.
- **Test Scenarios**: Happy path: survey processing and aux metadata chain.
  Edge cases: multiple welfare rows, force mode, YAML override, changed aux
  subset. Error path: rule without location/failure semantics or ambiguous key.
- **Tests**: Validator and targeted orchestration, deflation, aux-gate,
  validation-engine, recode, and inventory tests.
- **Acceptance criteria**: `rules.csv` distinguishes code and data rules, aux
  facts identify the values that enter deflation, all candidates are disposed,
  and the `pipdata` package validator exits zero.

### 9. Harvest `wbpip` And `pipster`

- **Requirements**: R2, R3, R11, R15, R16
- **Files**: harvest CSVs, `notes/wbpip.md`, `notes/pipster.md`; read top-level,
  microdata/grouped-data cleaners and computations, deflation/projection code,
  representation/type helpers, and paired tests.
- **Details**: Search for and evidence any I/O, path, option, environment, cache,
  or global-state access before making a purity statement. Keep microdata and
  grouped-data contracts separate. Limit `pipster` to a short representation
  and consumer-boundary note.
- **Test Scenarios**: Happy path: separate input contracts. Edge case: hidden
  option access or production wrapper. Error path: purity claimed from a grep
  absence or undocumented input failure behavior.
- **Tests**: Validator and targeted same-named unit tests.
- **Acceptance criteria**: Purity satisfies the closed-world protocol or is
  marked unknown, representation assumptions are explicit, and both package
  validators exit zero.

### 10. Harvest `pipapi`

- **Requirements**: R2, R3, R12, R15, R16
- **Files**: harvest CSVs, `notes/pipapi.md`; read lookup creation, aux/PIP data
  readers, DuckDB/cache lifecycle, validation, query helpers, Plumber startup,
  endpoint configuration, and paired unit/integration tests.
- **Details**: Document only the input contract and artifact assumptions, not
  the public API surface. Record schemas, keys, freshness assumptions, disk and
  cache lifecycle, environment configuration, and side effects. Distinguish
  ephemeral unit evidence from environment-gated integration tests.
- **Test Scenarios**: Happy path: lookup/cache input traced. Edge case: missing
  cache table or environment-gated test. Error path: endpoint documentation
  substituted for source behavior.
- **Tests**: Validator plus lookup, DuckDB, cache, and input-validation tests
  that can run without production services.
- **Acceptance criteria**: The serving layer's required artifacts, schemas,
  keys, and consistency assumptions are explicit, all candidates are disposed,
  and the `pipapi` package validator exits zero.

### 11. Perform Focused `metapip` Pass

- **Requirements**: R1, R2, R3, R12, R15, R16
- **Files**: mechanical tables, `notes/metapip.md`; read `pip_snapshot.R`,
  `init_metapip.R`, `get_branches.R`, `core_metadata.R`, `cache.R`, `attach.R`,
  `zzz.R`, lockfile, and paired tests.
- **Details**: Include `metapip` in mechanical extraction, then inspect only
  configuration, network, session cache, lockfile, install/update, attach/
  detach, and option side effects. Do not expand into a general API inventory.
- **Test Scenarios**: Happy path: lock SHA flow traced. Edge case: unresolved
  remote SHA or session cache. Error path: network result treated as reusable
  evidence without a pinned source/test basis.
- **Tests**: Validator plus non-destructive cache, lockfile, branch metadata,
  and attach tests; no installation/update execution against user libraries.
- **Acceptance criteria**: Focused risks are documented with a non-empty Gaps
  section, no production install side effects are invoked, all candidates are
  disposed, and the `metapip` package validator exits zero.

## Phase 4: Consolidation And Acceptance

### 12. Complete Package-Level Evidence Gates

- **Requirements**: R3, R5, R6, R16
- **Files**: all `tables/*.csv`, all `notes/<package>.md`,
  `tables/evidence.csv`
- **Details**: Aggregate and rerun the package gates already required in Steps
  5-11 before cross-package merge. Confirm exact schemas, fact/evidence joins,
  SHA and line validity, enums, logical keys, candidate dispositions,
  `UNKNOWN`-to-Gaps mapping, and real Gaps content. Preserve unresolved
  contradictions rather than choosing a plausible answer.
- **Test Scenarios**: Happy path: package gate passes. Edge case: multiple
  evidence rows or legitimate unknown. Error path: orphan fact, placeholder
  gap, stale SHA, or documentation-only citation.
- **Tests**: `Rscript --vanilla R/validate_harvest.R --level package`.
- **Acceptance criteria**: All nine package gates pass before consolidation.

### 13. Reconcile Cross-Package Contracts

- **Requirements**: R6, R13, R16
- **Files**: `notes/CROSS_PACKAGE.md`, `tables/contract_edges.csv`, harvest tables
- **Details**: Join writes to reads, outputs to I/O, calls to DESCRIPTION/
  NAMESPACE declarations, and producer schemas/keys to consumer assumptions.
  Materialize each relationship in `contract_edges.csv` using canonical
  `artifact_id` values; explicitly retain unmatched and unknown candidates.
  Report undeclared dependencies, path construction outside `pipload`, rules
  outside the rules engine, contradictions, auxiliary granularity, `stamp` fit,
  and `stamp`/`pipload` overlap. Separate observed facts from design implications.
- **Test Scenarios**: Happy path: producer/consumer pair matches. Edge case:
  intentional soft dependency or unknown schema. Error path: unmatched target
  omitted from contradictions or inferred contract presented as observed fact.
- **Tests**: Cross-table referential checks and targeted validator assertions.
- **Acceptance criteria**: The synthesis answers the charter's auxiliary
  granularity question and lists every unresolved contract mismatch.

### 14. Record And Run The Final Reproducibility Gate

- **Requirements**: R3, R4, R6, R14, R15, R16
- **Files**: `HARVEST.md`, all generated/manual outputs
- **Details**: Record date, command arguments without local absolute paths,
  source SHAs/branches/dirty caveats, tests run/skipped, row counts, output
  hashes, package depth, unknown/gap counts, and failures. Recheck repository
  SHAs and cited blobs, rerun extraction twice, run the full validator, and
  confirm no sibling repository was modified by the harvest, including content
  hashes for pre-existing untracked files.
- **Test Scenarios**: Happy path: stable SHAs and identical outputs. Edge case:
  unrelated pre-existing untracked file. Error path: HEAD drift, changed cited
  source, nondeterminism, failed evidence, or sibling write.
- **Tests**: Full test command; two clean extraction runs; `Rscript --vanilla R/validate_harvest.R --level final`; targeted Git status comparisons.
- **Acceptance criteria**: Final validation exits zero and `HARVEST.md` contains
  the complete audit trail required to reproduce or reject the harvest.

## Testing Strategy

- Keep `pipsystem` as a plain R project; do not add package scaffolding solely
  for Phase 1.
- Add `tests/testthat/helper-load.R` with a fixed, side-effect-free source order.
  Command-line entry points must be guarded so sourcing defines functions only.
- Run `R/preflight.R` before extraction. Require and record minimum supported
  versions for R, Git, `testthat`, `data.table`, `digest`, the YAML parser, and
  any other declared parser dependency; record actual versions in `HARVEST.md`.
- Use small temporary Git fixture repositories for parser, provenance, drift,
  and dirty-worktree tests.
- Use `data.table::fread(check.names = FALSE)` and literal expected header
  vectors for CSV validation.
- Test happy, edge, and failure behavior for every extractor and validator.
- Export sibling commits into OS temporary directories and install pinned local
  sources into a temporary library before any package test. Never run code in a
  sibling worktree or install/download into a user library. Verify and record
  the loaded namespace path for every accepted result.
- Apply field-aware portability checks: reject committed checkout/temp roots and
  credentials, but retain source-literal production paths and normalize only
  their `artifact_id` representation.
- Require source implementation plus an actually executed passing test for
  strong behavioral claims. Static inspection alone does not satisfy final
  evidence.
- Run all `pipsystem` tests with:
  `Rscript --vanilla -e "testthat::test_dir('tests/testthat', load_package = 'none', reporter = 'summary', stop_on_failure = TRUE)"`.

## Documentation Checklist

- [ ] Canonical nine-repository scope appears consistently.
- [ ] Revised CSV headers and provenance semantics are explicit.
- [ ] Navigation-only sources are labeled and excluded from final evidence.
- [ ] Every package note includes purpose, side effects, execution-order
      dependencies, surprises, real Gaps, and maintainer questions.
- [ ] `notes/stamp.md` answers all five capability questions.
- [ ] `notes/CROSS_PACKAGE.md` covers every required consolidation topic.
- [ ] `HARVEST.md` records SHAs, commands, tests, counts, hashes, and caveats.

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Repository HEAD changes during a long harvest | Evidence no longer describes one snapshot | Capture pre/post SHAs, read committed blobs, and block on drift. |
| Installed packages differ from clones | Runtime reflection reports the wrong API or behavior | Make source HEAD authoritative; SHA-gate and isolate optional reflection. |
| Namespace startup mutates state or writes caches | Harvest changes the environment or source repos | Prefer AST parsing; run code only from pinned exports with temporary HOME, library, cache, and path roots. |
| Static dependency analysis misses dynamic calls | Incomplete dependency graph | Resolve explicit/imported calls, retain dynamic calls as `UNKNOWN`, and use sentinel call-site tests. |
| Prior documentation is stale but plausible | Unsupported claims enter final tables | Enforce navigation-only deny rules in the evidence validator. |
| Existing schemas cannot hold multi-source evidence | Behavioral support becomes ambiguous | Use stable fact IDs plus normalized `evidence.csv`. |
| External/network tests are unavailable | Behavior cannot be confirmed | Record skipped evidence and classify claims as partial/unknown rather than guessing. |
| Manual harvesting across nine repositories is inconsistent | Schemas or evidence standards drift | Gate each package with one validator before consolidation. |
| Runtime checkout paths leak or source-literal paths are discarded | Harvest is non-portable or incomplete | Reject checkout/temp roots, retain cited production literals, and normalize only canonical artifact IDs. |
| PIP concepts leak into `stamp` recommendations | Domain boundary regresses | Phrase `stamp` findings as domain-agnostic capabilities; place PIP orchestration in `pipsystem`. |
| Negative claims rely on incomplete searches | Purity or absence is overstated | Require complete source/candidate manifests and downgrade when dynamic calls remain unresolved. |
| Existing untracked sibling files change invisibly to Git status | Read-only violations go undetected | Record path, size, and SHA-256 before and after the harvest. |

## Out of Scope

- Modifying any sibling package repository.
- Implementing fixes or new capabilities in `stamp` or PIP packages.
- Building the final incremental planner or executor.
- Updating production data, package branches, lockfiles, releases, or user
  libraries.
- Exhaustively documenting public APIs or generating README-style summaries.
- Treating plans, reviews, generated documentation, or roxygen text as runtime
  proof.

## Completion Contract

### Outcome

Phase 1 produces a deterministic, SHA-pinned harvest for the nine intended
repositories. Tables, package notes, the `stamp` assessment, and cross-package
synthesis are machine-validated and directly answer auxiliary-data consumption
granularity without treating prior documentation as proof.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|----|-------|-------------------|------------------|----------|
| V1 | 1 | Canonical scope contains exactly the nine intended repositories; stale `pipfaker` and `metapip` skip instructions are removed | `compound-gpid.context.md`, `HARVEST_BRIEF.md`, targeted `rg` checks | yes |
| V2 | 1 | Provenance/schema decisions include stable fact IDs, primary citations, and normalized multi-evidence records | `HARVEST_BRIEF.md`, schema tests | yes |
| V3 | 1 | Preflight and source-first extraction/validation tests pass with explicit plain-project loading | `R/preflight.R`; full `testthat::test_dir()` command | yes |
| V4 | 1 | Two runs against identical Git SHAs produce byte-identical mechanical tables | Determinism test and SHA-256 comparison | yes |
| V5 | 2 | `stamp` questions and supported claims have source plus pinned-export executed-test evidence | `stamp_fit.csv`, `evidence.csv`, `notes/stamp.md` | yes |
| V6 | 2 | `pipfun`, `pipload`, and `pipaux` package gates pass within their package steps | Per-package validator reports | yes |
| V7 | 3 | Remaining five package gates pass within their package steps | Per-package validator reports | yes |
| V8 | 4 | All repositories retain pinned SHAs, cited blobs, and unchanged tracked/untracked state | `HARVEST.md`, Git and untracked-file hash checks | yes |
| V9 | 4 | Required cross-package reconciliation uses canonical artifact IDs and explicit matched/unmatched edges | `contract_edges.csv`, `notes/CROSS_PACKAGE.md` | yes |
| V10 | final | Final validator records passing schemas, provenance, gaps, counts, and reproducibility evidence | `R/validate_harvest.R`, `HARVEST.md` | yes |

### Constraints

| ID | Phase | Constraint | Check |
|----|-------|------------|-------|
| C1 | final | Modify only `pipsystem`; sibling repositories remain read-only | Compare pre/post sibling Git status |
| C2 | final | Every fact cites pinned committed evidence or maps through `gap_id` to an explicit gap | Provenance validator |
| C3 | final | Documentation artifacts remain navigation only | Evidence allow/deny validation |
| C4 | 1 | No checkout/temp roots or credentials are committed; source-literal paths remain evidenced and canonically normalized | Field-aware portability scan |
| C5 | 1 | Runtime reflection/tests cannot override or misrepresent source HEAD | Pinned-export test matrix and extractor tests |
| C6 | final | CSV schemas, types, enums, keys, and order remain exact | Schema validator |
| C7 | 2 | `stamp` stays domain agnostic; `version_id` and `content_hash` remain distinct | `stamp_fit` and synthesis checks |
| C8 | final | Every package note contains real Gaps | Markdown validator |
| C9 | final | Harvest performs no network writes, user-library installs, or sibling writes; only temporary pinned-source installs are allowed | Side-effect and command review |

### Boundaries

- Allowed: revise Phase 1 specification/context; add extraction, validation,
  fixtures, tables, notes, and audit records in `pipsystem`; run read-only source
  inspection and non-destructive tests.
- Out of scope: sibling-package edits, production data changes, package updates,
  `stamp` redesign, and planner/executor implementation.

### Iteration Policy

1. Resolve scope and schema contradictions before accepting outputs.
2. Pass fixture-based tooling tests before manual behavioral harvesting.
3. Gate each package before consolidation.
4. Under `deviation-policy: ask`, pause before changing scope, schemas, evidence
   standards, output layout, or read-only boundaries.
5. Re-run the final gate after any table, note, citation, or SHA correction.

### Blocked-Stop Conditions

- Canonical scope or provenance schema remains ambiguous.
- A required repository cannot be located and SHA-pinned.
- HEAD drifts, cited content differs from the pinned blob, or evidence exists
  only in uncommitted content.
- A behavioral claim relies only on documentation, comments, skipped tests, or
  an unexecuted manual script.
- Required tests cannot run safely, determinism fails, or dependency output is
  implausibly empty.
- A required note has empty Gaps or an `UNKNOWN` lacks a mapped gap.
- Continuing requires a sibling write or another protected-boundary violation.
