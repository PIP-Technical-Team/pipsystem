---
date: 2026-10-07
title: "M1 Code, Orchestration, and Storage Decisions"
status: decided
scope: "Extended"
artifact-schema-version: 1
chosen-approach: "Automatic fingerprints, pipdata orchestration, pipload access adapter"
tags: [m1, code-versions, orchestration, pipdata, pipload, stamp]
---

# M1 Code, Orchestration, and Storage Decisions

## Context

This Thinking Partner discussion reviewed R2, R3, and R4 from the completed M1 harvest, in that order. It did not repeat the harvest or start implementation. The user requested the smallest effective design, raised Databricks or similar hosting as a possible future setting, and preferred one existing package entry point rather than another package solely for coordination.

The approved strategy distinguishes roadmap approval from design approval and defines the nine-feature M2 start gate (D: `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:151-174`). This record captures explicit session decisions, not source-code changes or completed design integration.

### Source Evidence And Authority

| Key | Read-only source | Recorded SHA |
|---|---|---|
| D | This pipsystem worktree's tracked project documents | `84c384f78ed44bcb96bb19c6d364519df5b5db6f` |
| S | `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp` | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| P | `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| L | `E:/PovcalNet/01.personal/wb384996/PIP/pipload` | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |

Package facts below use the completed harvest's file/line evidence at these SHAs. The harvest records source-state checks and separates inspected tests from executed results (`HARVEST.md:11-24,43-49`). HARVEST.md and the package notes are uncommitted evidence artifacts, not files at D. No package code or tests were executed during this decision discussion.

Charter constraints remain in force: platform-independent planning, domain-agnostic stamp, and package repositories read-only from pipsystem (D: `compound-gpid.md:26-33`). The design assigns rebuild authority to stamp and keeps the orchestrator location Open (D: `SYSTEM_DESIGN.md:188-194,291,299`). Current implementation evidence does not override those Decided responsibilities.

The bounded Brain query returned roadmap references, not an approved R2/R3/R4 decision. No related existing brainstorm was available in this worktree. Those retrieval results were not treated as authorization.

## Requirements

- Prefer a small effective design. Do not introduce a general workflow, dependency-discovery, or version-management framework without a concrete need.
- Keep code-version identification separate from the ability to schedule a code-only change.
- Reuse pipdata processing functions without automatically retaining its existing manifest/planner authority.
- Use one existing package entry point for orchestration. Existing dependency packages can remain; this does not mean a one-package runtime environment.
- Preserve stamp as the single rebuild authority and keep hosting-specific code outside rebuild rules.
- Keep the harvest, SYSTEM_DESIGN.md, roadmap.json, charter, configuration, and .gitignore unchanged. Capture only a new brainstorm record; generate no HTML.
- Do not edit package repositories, register roadmap items, commit, push, or start M2.

## Approaches Considered

### R2: Explicit Version Labels

**Summary:** give each independently run calculation a label and require a bump after result-affecting code or dependency changes.

**Evidence:** stamp hashes character inputs supplied as `code`; `code_label` is display-only. Function hashes cover formals/body, not environments or transitive calls (S: `R/hashing.R:318-342`; `R/IO_core.R:318-334`).

**Benefit:** small policy and intentional invalidation, without treating unrelated package edits as calculation changes.

**Risk:** a missed human label bump can reuse an outdated result. Source-SHA provenance does not compensate for a missed invalidation signal.

**Effort:** small policy change; code-only scheduling work was not estimated. Label support at save time does not close that scheduling gap.

**Selection:** not selected. After the trade-offs were explained, the user chose automatic detection instead of manual labels.

### R2: Automatic Calculation Fingerprints

**Summary:** fingerprint each independently run calculation's code and its known result-affecting dependencies, while recording exact package SHAs separately.

**Evidence:** pipdata already has curated fingerprints that include selected function formals/bodies, constants, YAML, and external functions (P: `R/code_fingerprint.R:38-92`). Inspected tests describe fingerprint stability and an external-deflation-function change, not executed success (P: `tests/testthat/test-code-fingerprint.R:1-33,73-82`).

**Benefit:** removes manual version-label bumps and detects changes in the code/dependencies covered by the fingerprint.

**Risk:** uncovered helpers or rules can be missed, and covered non-result edits can cause unnecessary work. Automatic hashing is not automatic discovery of every dependency.

**Effort:** reuse of existing curated fingerprint concepts is a candidate; integration and scheduling effort remain unestimated. No reuse of the current pipdata planner is implied.

**Selection:** selected and confirmed. Scope fingerprints to independently run calculations and known result-affecting dependencies. Do not add a general dependency scanner or use a whole-package SHA as the blanket invalidation rule.

### R3: Separate pipsystem Coordination Layer

**Summary:** keep release-wide coordination outside the survey-processing package, initially as ordinary functions rather than a new framework.

**Evidence:** pipdata's existing runner covers clean, metadata, and deflate waves, while the target spans auxiliary processing, calculations, release output, and ingestion (P: `R/pd_run_pipeline.R:443-600`; D: `SYSTEM_DESIGN.md:149-160`).

**Benefit:** makes release ownership separate from survey-processing ownership. Release-format changes need not be implemented inside pipdata.

**Risk:** maintaining coordination in another location adds a boundary and can later add packaging/deployment work. Location alone does not improve rebuild selectivity or performance.

**Effort:** coordination and stamp integration still need work; an additional packaging boundary offers no demonstrated runtime requirement here.

**Selection:** not selected. The user preferred keeping the public runner in an existing package and did not find a separate location sufficient to justify another package.

### R3: Orchestration In pipdata

**Summary:** put release coordination in pipdata, separate from its processing functions, with one public package entry point.

**Benefit:** avoids creating another package solely for coordination and provides one package entry point for a future platform job.

**Risk:** pipdata gains a broader responsibility. Coordination must not become unrelated backend code or another rebuild authority.

**Evidence boundary:** the current pipdata manifest/planner decides work (P: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:33-55,76-111,212-220`). That implementation is not approved unchanged because stamp is the Decided authority (D: `SYSTEM_DESIGN.md:188,217`).

**Effort:** extending an existing package avoids new coordination-package scaffolding, but authority reconciliation and complete release coordination remain unestimated implementation work.

**Selection:** selected and explicitly approved. Hosting on Databricks or another platform was discussed as a possibility, not selected or verified. Platform-independent logic remains required (D: `compound-gpid.md:29`; `SYSTEM_DESIGN.md:272`).

### R4: Move Access Logic Into pipdata

**Summary:** consolidate PIP lookup/I/O functions in pipdata and call stamp directly.

**Benefit:** reduces the number of packages owning PIP access functions.

**Risk:** requires moving and testing existing lookup/access code without removing the need for that logic. One public runner does not require moving every dependency into its package.

**Evidence:** pipload already resolves PIP survey/inventory queries and delegates current versioned I/O to stamp (L: `R/load_pip_data.R:174-255`; `R/pip_read-write.R:82-107,175-185`).

**Effort:** migration effort was not estimated; it adds work beyond settling the existing access boundary.

**Selection:** not selected.

### R4: Retain pipload As A Thin Access Adapter

**Summary:** retain PIP-aware lookup/access in pipload and delegate versions, hashes, and parents to stamp.

**Benefit:** reuses existing access functions while keeping pipdata as the public runner. No new storage framework is needed.

**Risk:** the adapter must not make independent freshness decisions or depend on unverified storage internals.

**Evidence:** pipload supplies auxiliary loading/PPP-default filtering and delegates read/write operations (L: `R/load_aux_data.R:24-70`; `R/pip_read-write.R:82-107,175-185`). Legacy inventory signatures compare path lists and are not calculation lineage (L: `R/pip_update_inventory.R:178-194,345-355`).

**Effort:** retaining this boundary avoids an ownership-only migration. Format and snapshot-access corrections remain unestimated work.

**Selection:** selected and explicitly approved. Approval settles the role, not current implementation correctness.

## Decision

The user confirmed this smallest complete decision boundary, then declined exploration of a more sophisticated version:

1. **R2 approved: automatic fingerprints.** Fingerprint each independently run calculation and its known result-affecting dependencies. Record exact package SHAs separately. Manual version-label bumps are not the selected policy. A general dependency-discovery framework is not approved.
2. **R3 approved: orchestration in pipdata.** Keep coordination functions separate from processing functions. Provide one public existing-package entry point, with platform-independent logic. Another package solely for coordination is not required.
3. **R4 approved: pipload access adapter.** Reuse PIP lookup and I/O functions and delegate version/hash/parent storage to stamp. No independent rebuild decisions belong in pipload.
4. **Decided authority preserved:** stamp is the single rebuild authority. pipdata's existing manifest/planner must be reconciled, not retained as a second authority. Reusing processing functions does not approve planner reuse.
5. **Code-only scheduling remains open:** planning must compare the requested fingerprint before execution. Save-time hashing does not provide that capability by itself. Current `st_is_stale()` compares immediate parent versions, not code hashes (S: `R/version_store.R:1176-1217`; `R/hashing.R:500-529`).

R2 and R3 differ from the harvest's proposed explicit-label policy and separate pipsystem location. R4 follows the proposed adapter role. The harvest remains an unchanged evidence/proposal record (`notes/FINDINGS.md:62-84`). This later record captures the user's selections; it does not rewrite the earlier evidence.

### Challenge And Reversibility

- Automatic fingerprints reduce manual bump errors but do not eliminate missing-dependency risk. Coverage must be explicit and testable.
- Orchestration location is a responsibility/deployment choice, not a performance guarantee. Keeping it in pipdata avoids a package solely for coordination, but requires a clear internal boundary.
- Moving orchestration later is possible, but creates API/migration work. Keep the entry point and processing boundaries small; do not build abstractions solely for possible future moves.
- Retaining pipload is the smaller ownership change. Its value depends on remaining an access adapter rather than another planner.
- Stakeholders are the PIP team maintaining pipdata/pipload and the stamp maintainers. Fixes to generic scheduling remain stamp work; platform-specific setup must not own rebuild policy.

## Next Steps

- In a separate authorized task, integrate the approved policy/location/role edits into SYSTEM_DESIGN.md. This session does not edit that file.
- Keep the M1 design-update feature pending until those approved edits are integrated. Policy approval is not completion of code-only scheduling or planner repair.
- Use this decision record for later planning of fingerprint coverage, code-only scheduling, and reconciliation of pipdata's existing manifest authority with stamp. Do not start that implementation now.
- Continue assessing the remaining M2 prerequisites. The approved start gate includes other M0 decisions; these three approvals do not authorize M2 by themselves (D: `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:158-170`).
- No roadmap item registration, charter change, branch creation, commit, push, or M2 start follows from this record. HTML generation is disabled for this capture.

## Gaps

- **Code-only scheduling is unresolved.** Current stamp parent staleness does not compare requested code fingerprints. No completed scheduling solution is claimed (S: `R/version_store.R:1176-1217`).
- **Fingerprint coverage is not finalized.** Known helpers, external numerical functions, rules, and configuration that affect each calculation must be identified during planning. No automatic general dependency-discovery capability is assumed (P: `R/code_fingerprint.R:38-92`; S: `R/hashing.R:318-342`).
- **Required tests remain unexecuted:** code-only change with unchanged data, changed relevant helper/rule, unrelated package edit, unchanged second run, and missing/NA saved code-hash handling. Current inspected tests do not establish those outcomes (S: `tests/testthat/test-should-save.R:1-34`; `R/hashing.R:500-529`; P: `tests/testthat/test-code-fingerprint.R:1-33,73-82`).
- **stamp planner/executor gaps remain:** transitive propagation and unchanged-output parent refresh are not repaired by selecting a policy or package location (S: `R/rebuild.R:311-327,495-518`; `R/IO_core.R:253-269`).
- **pipdata authority reconciliation is not designed or implemented.** Its current manifest/planner decides work. Reuse of inventories, receipts, or records is not approval to keep independent currentness rules (P: `R/dependency_execution.R:559-710`; `R/dependency_plan.R:76-111,212-220`).
- **pipload format and snapshot access need validation.** Current loaders have qs2 assumptions, and metadata enrichment reads versioned artifacts directly. Adapter-role approval does not prove fst compatibility or stable integration with stamp (L: `R/load_pip_data.R:375-389`; `R/load_aux_data.R:37,61-66`; `R/pip_inv_enrich.R:219-260`).
- **Platform remains unselected and unverified.** Databricks or similar hosting was a decision consideration, not a deployment decision or demonstration. R dependencies, storage access, parallel safety, and runtime compatibility remain UNKNOWN here (D: `SYSTEM_DESIGN.md:272`).
- **Design integration remains pending.** Existing design, harvest, roadmap, charter, configuration, and .gitignore were not changed. This record alone does not complete the design-update feature or the other M2 gates.
