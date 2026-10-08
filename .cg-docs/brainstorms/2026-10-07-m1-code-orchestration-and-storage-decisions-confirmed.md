---
date: 2026-10-07
title: "Confirmed M1 Code, Orchestration, and Storage Decisions"
status: decided
scope: "Extended"
artifact-schema-version: 1
chosen-approach: "Automatic fingerprints, pipdata orchestration, pipload access adapter"
tags: [m1, code-versions, orchestration, pipdata, pipload, stamp]
---

# Confirmed M1 Code, Orchestration, and Storage Decisions

## Context

This is the canonical decision record for the Thinking Partner discussion of R2, R3, and R4, in that order. The user confirmed the minimal summary and declined a more sophisticated version. The discussion did not repeat the harvest or start implementation.

The earlier capture, `.cg-docs/brainstorms/2026-10-07-m1-code-orchestration-and-storage-decisions.md`, contains the same decisions but failed artifact validation because its approach headings did not use the required `Approach N: name` form. It is preserved unchanged under this session's no-existing-file-edits rule. Use this confirmed record for subsequent decision references.

The user requested a minimal effective design and favored one existing package entry point for possible Databricks or similar hosting. No hosting platform was selected. Roadmap approval is not design approval, and the approved M2 start gate remains in force (D: `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:151-174`).

### Evidence And Authority

| Key | Read-only source | Recorded SHA |
|---|---|---|
| D | This pipsystem worktree's tracked project documents | `84c384f78ed44bcb96bb19c6d364519df5b5db6f` |
| S | `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp` | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| P | `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| L | `E:/PovcalNet/01.personal/wb384996/PIP/pipload` | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |

Package citations below are the completed harvest's source/test evidence at these commits, not a new source harvest. The source-state checks and inspection-versus-execution limits are recorded in `HARVEST.md:11-24,43-49`. HARVEST.md and package notes are uncommitted evidence outputs, not files at D. No package code or tests were executed during this discussion.

The charter requires platform-independent planning and domain-agnostic stamp; package repositories are read-only from pipsystem (D: `compound-gpid.md:26-33`). The design assigns rebuild authority to stamp, while orchestrator location is Open (D: `SYSTEM_DESIGN.md:188-194,291,299`). Current implementation does not override Decided responsibility.

The Brain query returned roadmap references, not prior approval of these decisions. No related existing brainstorm was available in this worktree. Retrieval output was not treated as authorization.

## Requirements

- Use the smallest effective design. Do not introduce a general version-management, dependency-discovery, or workflow framework without a concrete need.
- Separate code-version identification from the ability to schedule work after a code-only change.
- Separate reuse of pipdata processing from reuse of its manifest/planner authority.
- Provide one existing-package entry point for orchestration. This does not require a one-package runtime environment; existing dependencies can remain.
- Keep stamp as the single rebuild authority and hosting-specific code outside rebuild rules.
- Keep all existing files read-only, including harvest, SYSTEM_DESIGN.md, roadmap.json, charter, configuration, and .gitignore. Create decision records only under `.cg-docs/brainstorms/`; generate no HTML.
- Do not edit package repositories, register roadmap items, create a branch, commit, push, or start M2.

## Approaches Considered

### Approach 1: R2 Explicit Version Labels

**Summary:** manually bump a label for each independently run calculation when its result-affecting code or dependencies change.

**Evidence:** stamp hashes character `code` inputs; `code_label` is display-only. Function hashing includes formals/body, not environments or transitive callees (S: `R/hashing.R:318-342`; `R/IO_core.R:318-334`).

**Pros:** small policy, intentional invalidation, and no need for a general version service.

**Cons:** a missed bump can reuse outdated results. Recording a source SHA does not compensate for a missed invalidation signal.

**Effort:** small policy change; scheduling effort remains unestimated. Save-time labels do not close code-only planning.

**Selection:** not selected. The user chose automatic detection after the trade-offs were explained.

### Approach 2: R2 Automatic Calculation Fingerprints

**Summary:** fingerprint each independently run calculation's code and known result-affecting dependencies; record exact source SHAs separately.

**Evidence:** pipdata has curated fingerprints for function bodies/formals, constants, YAML, and selected external functions (P: `R/code_fingerprint.R:38-92`). Inspected tests describe stability and external-deflation changes, not executed success (P: `tests/testthat/test-code-fingerprint.R:1-33,73-82`).

**Pros:** avoids manual version-label bumps and detects changes in covered code/dependencies.

**Cons:** uncovered helpers/rules can be missed, and covered non-result edits can trigger unnecessary work. Hashing does not automatically discover every dependency.

**Effort:** existing curated fingerprint concepts are a possible starting point; integration and scheduling remain unestimated. This does not approve reuse of pipdata's current planner.

**Selection:** selected and confirmed. No whole-package-SHA blanket invalidation rule or general dependency scanner is approved.

### Approach 3: R3 Separate pipsystem Coordination Layer

**Summary:** keep release-wide coordination outside the survey-processing package, initially as ordinary functions rather than a framework.

**Evidence:** pipdata runs clean/metadata/deflate waves; target release stages also include auxiliary processing, calculations, release output, and ingestion (P: `R/pd_run_pipeline.R:443-600`; D: `SYSTEM_DESIGN.md:149-160`).

**Pros:** separates release ownership from survey-processing ownership. Release-format changes can stay outside pipdata.

**Cons:** adds a maintenance boundary and can later add packaging/deployment work. Location alone does not improve performance or rebuild selectivity.

**Effort:** coordination and stamp integration still need work; no concrete runtime requirement for another coordination package was demonstrated.

**Selection:** not selected. The user favored an existing package entry point and did not find a separate location sufficient to justify another package.

### Approach 4: R3 Orchestration In pipdata

**Summary:** put release coordination in pipdata, separate from processing functions, with one public package entry point.

**Pros:** avoids another package solely for coordination and gives a future platform job one package entry point.

**Cons:** broadens pipdata's responsibility; coordination must not become unrelated backend code or another rebuild authority.

**Evidence boundary:** the current manifest/planner decides work (P: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`). Keeping that authority unchanged would conflict with stamp's Decided role (D: `SYSTEM_DESIGN.md:188,217`).

**Effort:** avoids new coordination-package scaffolding. Complete release coordination and authority reconciliation remain unestimated work.

**Selection:** explicitly approved. Databricks or similar hosting informed the packaging discussion but was not selected or verified. Platform-independent logic remains required (D: `compound-gpid.md:29`; `SYSTEM_DESIGN.md:272`).

### Approach 5: R4 Move Access Logic Into pipdata

**Summary:** move PIP access functions into pipdata and call stamp directly.

**Evidence:** pipload already provides survey/inventory queries and stamp-delegated I/O (L: `R/load_pip_data.R:174-255`; `R/pip_read-write.R:82-107,175-185`).

**Pros:** consolidates ownership of access and orchestration.

**Cons:** requires moving/testing existing logic without removing the need for it. One public runner does not require moving every dependency into that package.

**Effort:** unestimated migration work beyond settling the existing boundary.

**Selection:** not selected.

### Approach 6: R4 Retain pipload As A Thin Access Adapter

**Summary:** retain PIP-aware access in pipload, delegating versions, hashes, and parents to stamp.

**Evidence:** pipload provides auxiliary loading/PPP-default filtering and stamp-delegated reads/writes (L: `R/load_aux_data.R:24-70`; `R/pip_read-write.R:82-107,175-185`). Legacy inventory signatures compare path lists, not calculation lineage (L: `R/pip_update_inventory.R:178-194,345-355`).

**Pros:** reuses existing functions while pipdata remains the public runner. No new storage framework or ownership-only migration is needed.

**Cons:** the adapter must not introduce independent freshness rules or rely on unverified storage internals.

**Effort:** avoids moving code solely to change ownership. Format/snapshot corrections remain unestimated.

**Selection:** explicitly approved. The role approval does not certify current implementation correctness.

## Decision

The user confirmed this minimal summary and selected **No, Capture Minimal** instead of exploring more sophistication:

1. **R2 approved: automatic fingerprints.** Fingerprint each independently run calculation and its known result-affecting dependencies. Record exact source SHAs separately. Manual version-label bumps and a general dependency-discovery framework are not selected.
2. **R3 approved: orchestration in pipdata.** Keep coordination and processing functions separate. Use one public existing-package entry point with platform-independent logic. Do not create another package solely for coordination.
3. **R4 approved: pipload access adapter.** Reuse PIP lookup/I/O functions and delegate version/hash/parent storage to stamp. Do not make independent rebuild decisions in pipload.
4. **Decided authority preserved:** stamp remains the single rebuild authority. Reconcile pipdata's current manifest/planner; do not retain a second authority. Processing reuse is not planner approval.
5. **Code-only scheduling remains open:** planning must compare the requested fingerprint before execution. Save-time hashing is not enough; current stamp staleness compares immediate parent versions, not code hashes (S: `R/version_store.R:1176-1217`; `R/hashing.R:500-529`).

R2 and R3 differ from the harvest's proposed explicit-label policy and separate pipsystem location. R4 follows its proposed adapter boundary. The existing harvest remains unchanged (`notes/FINDINGS.md:62-84`); this later record captures the user's selected decisions.

### Challenge And Reversibility

- Automatic fingerprints remove manual bumps but leave coverage risk. Relevant dependency changes must be testable.
- Location is an ownership/deployment decision, not a performance guarantee. Keeping orchestration in pipdata avoids another package but needs a clear internal boundary.
- Later relocation is possible but would create API/migration work. Keep boundaries small without abstractions solely for hypothetical moves.
- pipload remains useful only if it is an access adapter, not another planner.
- Stakeholders are the PIP team maintaining pipdata/pipload and the stamp maintainers. Generic scheduling stays stamp work; platform setup must not own rebuild policy.

## Next Steps

- Integrate the approved R2/R3/R4 design edits in a separate authorized task. SYSTEM_DESIGN.md is unchanged in this session.
- Keep the design-update feature pending until those edits are integrated. Approval is not completion of code-only scheduling or planner repair.
- Use this record for later planning of fingerprint coverage, code-only scheduling, and reconciliation of pipdata manifest authority with stamp. Do not start implementation now.
- Assess remaining M2 prerequisites. Other M0 decisions are still part of the approved gate; these approvals alone do not authorize M2 (D: `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:158-170`).
- No roadmap registration, charter change, branch creation, commit, push, or M2 start follows from this record. No HTML is generated for this capture.

## Gaps

- **Code-only scheduling is unresolved:** stamp's current parent-staleness check does not compare requested fingerprints. No scheduling solution is claimed complete (S: `R/version_store.R:1176-1217`).
- **Fingerprint coverage is not finalized:** identify the known helpers, numerical dependencies, rules, and configuration affecting each calculation during planning. Do not assume general automatic dependency discovery (P: `R/code_fingerprint.R:38-92`; S: `R/hashing.R:318-342`).
- **Tests are not executed:** require code-only changes with unchanged data, changed relevant helpers/rules, unrelated package edits, unchanged reruns, and missing/NA saved-hash behavior. Inspected tests do not establish all these outcomes (S: `tests/testthat/test-should-save.R:1-34`; `R/hashing.R:500-529`; P: `tests/testthat/test-code-fingerprint.R:1-33,73-82`).
- **stamp planner/executor defects remain:** transitive propagation and unchanged-output parent refresh are not repaired by a policy/location decision (S: `R/rebuild.R:311-327,495-518`; `R/IO_core.R:253-269`).
- **pipdata authority reconciliation is not designed or implemented:** current manifest/planner rules decide work. Reuse of records, inventories, or receipts does not approve independent currentness rules (P: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:76-111,212-220`).
- **pipload format and snapshot access need validation:** qs2 assumptions and direct metadata-snapshot reads do not prove fst compatibility or stable stamp integration (L: `R/load_pip_data.R:375-389`; `R/load_aux_data.R:37,61-66`; `R/pip_inv_enrich.R:219-260`).
- **Platform remains unselected and unverified:** Databricks or similar hosting was a discussion consideration, not deployment evidence. R dependencies, storage access, parallel safety, and runtime compatibility remain UNKNOWN here (D: `SYSTEM_DESIGN.md:272`).
- **Design integration remains pending:** existing harvest, SYSTEM_DESIGN.md, roadmap.json, charter, configuration, and .gitignore remain unchanged. This record does not complete the design-update feature or the other M2 gates.
