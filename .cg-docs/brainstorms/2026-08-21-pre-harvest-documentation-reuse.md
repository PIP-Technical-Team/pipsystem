---
date: 2026-08-21
title: "Pre-harvest documentation reuse and package scope"
status: decided
scope: "Extended"
artifact-schema-version: 1
chosen-approach: "Evidence-First Navigation"
tags: [harvest, documentation, provenance, scope, stamp, pipdata, metapip]
---
<!-- Valid status values: decided, in-progress, abandoned -->

# Pre-harvest Documentation Reuse and Package Scope

## Context

Phase 1 of `pipsystem` requires a structured, evidence-backed harvest across the PIP package ecosystem. Before harvesting, the workspace documentation was surveyed to determine what already exists, when it was produced, and whether it is current against each repository's HEAD.

The survey covered the ten configured workspace roots: `pipsystem`, `pipaux`, `pipdata`, `pipfun`, `pipload`, `pipster`, `wbpip`, `pipapi`, `metapip`, and `stamp`. It found useful orientation material but little commit-pinned behavioral evidence. Several generated sites and narrative documents are demonstrably stale or internally contradictory.

`pipfaker` was named in `compound-gpid.context.md` and `HARVEST_BRIEF.md` but is not part of the intended project or workspace. Its inclusion was a mistake, and it is excluded from Phase 1.

## Requirements

- Existing documentation may guide where to read but must not supply final harvest facts without verification.
- Every reusable harvest fact must be verified against the audited repository HEAD in source or tests.
- Every fact must carry repository SHA, file, and line evidence, or be marked `UNKNOWN`.
- Existing documentation should be used selectively to identify relevant functions, tests, known gaps, and terminology.
- Stale README, pkgdown, DeepWiki, vignette, plan, review, and work-report claims must not be treated as runtime proof.
- Current roxygen pages may accelerate navigation but remain declarations rather than behavioral evidence.
- `pipfaker` is out of scope and should be removed from the project context and harvest brief before implementation planning is finalized.
- This brainstorm remains strategic. Detailed repository order, work allocation, and verification steps belong in `/cg-plan`.
- No harvest tables, package notes, or mechanical extraction outputs are created during this brainstorm.

## Approaches Considered

### Approach 1: Evidence-First Navigation

Use existing documentation only to locate relevant code, tests, known gaps, and terminology. Verify every harvested fact against HEAD source or tests.

Pros: aligns with the charter's no-fabrication, file-and-line, and SHA requirements; preserves the navigation value of existing documentation; applies one consistent evidence rule across repositories.

Cons: requires fresh reading even where generated documentation appears current; increases up-front review effort.

Effort: medium.

### Approach 2: Chronology-Based Selective Reuse

Accept selected generated declarations when repository history shows no relevant source change after documentation production, while re-reading stale areas.

Pros: reduces duplicate reading for recently generated reference pages.

Cons: chronology does not prove that a declaration was correct when generated; documentation facts still lack direct source-line evidence; creates repository-specific trust rules that conflict with the charter if used as final evidence.

Effort: small to medium.

### Approach 3: Documentation-Blind Source Pass

Ignore existing documentation after the survey and derive all harvest findings directly from source and tests.

Pros: provides a simple and strict evidence rule; avoids contamination from stale claims.

Cons: discards useful maps of recent refactors, known bugs, and weakly tested areas; increases search effort unnecessarily.

Effort: large.

## Decision

Choose **Evidence-First Navigation**.

Existing documentation is a navigation layer and hypothesis source only. It can reduce discovery time but cannot reduce the requirement to verify every final harvest claim against HEAD source or tests. This decision is deliberately conservative because recovering from unverified facts after they enter concatenated CSVs would be more costly than the additional source-reading effort.

The package scope excludes `pipfaker`. The remaining package scope is `stamp`, `pipfun`, `pipload`, `pipaux`, `pipdata`, `wbpip`, `pipapi`, `pipster`, and `metapip`.

## Next Steps

- Correct `compound-gpid.context.md` and `HARVEST_BRIEF.md` to remove `pipfaker`; review whether package-count wording in `compound-gpid.md` also needs correction.
- Run `/cg-plan` to define the detailed source-reading sequence, evidence capture, and verification workflow.
- Preserve the brief's distinction between deep, medium, light, and skipped manual passes, with `metapip` limited to mechanical extraction and focused configuration, network, cache, and side-effect checks.
- Use selected `pipdata` and `pipload` `.cg-docs` artifacts and `stamp` documentation as reading maps, not evidence.
- Record the exact HEAD SHA before reading each package and cite HEAD source or tests for every final fact.
- Do not use stale generated sites or DeepWiki pages as substitutes for source and test inspection.
