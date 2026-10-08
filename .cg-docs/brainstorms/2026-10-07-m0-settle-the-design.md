---
date: 2026-10-07
title: "M0: Settle the Design"
status: in-progress
scope: "Extended"
artifact-schema-version: 1
chosen-approach: "Minimal engine-first design; identity-dependent decisions pending"
tags: [m0, design, engine, failures, releases, pipster]
---

# M0: Settle the Design

## Context

This was a Thinking Partner decision session, not implementation. The user asked
to discuss the eight M0 proposals, obtain approval one decision at a time, start
with independent decisions, and leave module identity pending until M1 supplies
S6 evidence. Scope is Extended because the decisions are interconnected.

The project objective is incremental rebuilding across more than 2,000 survey
databases (`compound-gpid.md:10-12`). The charter requires a portable planner,
domain-agnostic stamp, read-only package sources, evidence-backed facts, and R
with data.table and collapse (`compound-gpid.md:24-33`).

The approved strategy record governs dependencies where it differs from the
brief. Its M0 table makes module identity depend on S6, decisions-as-data and
stage 5 output shape depend on module identity, and calculation-only pipster and
plan-only mode depend on engine-first approval
(`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:46-58`). Its nine-feature M2
start gate replaces the brief's whole-milestone prerequisite (same record,
lines 151-170). This session does not start M2, regardless of gate status.

Sources read: AGENTS.md, compound-gpid.md, compound-gpid.local.md,
SYSTEM_DESIGN.md, HARVEST_BRIEF.md, STRATEGY_BRIEF.md, the approved strategy
record, README.md, and the workflow contracts. README.md contains only the
project title. No prior brainstorm or local BRAIN.md was found. No package
repository was read, so no package commit SHA was collected and no package
capability is asserted.

## Requirements

- Decide policies before implementation, one question at a time.
- Keep the smallest complete design. Add features in small steps rather than
  building a general framework in advance. The user explicitly required this
  principle for later planning and implementation as well as this discussion.
- Define analyst workflows and required feedback during engine design, so a
  later interface can use the engine without taking over execution logic.
- Preserve reproducibility and the existing correction-window and frozen-release
  rules (`SYSTEM_DESIGN.md:26-28,246-250`).
- Skip successful unchanged work. Record failures for analyst review. Distinguish
  deterministic failures from external service failures without automatic loops.
- Keep logging separate from work selection (`SYSTEM_DESIGN.md:217`).
- Keep all existing files read-only, including SYSTEM_DESIGN.md, roadmap.json,
  the charter, configuration, and .gitignore. Create only this brainstorm.
- Do not write code, change package repositories, register roadmap or side ideas,
  commit, push, generate HTML, or start M2.

## Approaches Considered

### Approach 1: Minimal Engine-First Design

Use plain R functions for execution logic. Keep calculations separate from
selection and storage. Return simple R tables for planned work and run results.
Retain correction history. Retry external failures only on a later
analyst-started execution; do not repeat unchanged deterministic failures.

Pros: portable logic, inspectable analyst feedback, reusable calculations, and
less repeated work. Cons: analysts initially use R, persistent records still
need a storage design, and failure status must be interpreted correctly by the
planner. This is the selected approach for the approved subset of M0. Policy
capture is small; implementation effort remains UNKNOWN until M1 evidence and
later planning. No implementation estimate was approved.

### Approach 2: Coupled or Reduced-Feedback Alternatives

The discussion considered designing engine and interface together, allowing
calculations to select work and access files, retaining only the latest corrected
release state, retrying all failures, and omitting a plan preview. These were
separate alternatives to individual policies, not a single proposed package.

They can reduce some initial separation or record-keeping work, but increase
coupling, lose correction history, repeat deterministic failures, or remove
pre-run inspection. The user did not select them. Markdown preview and report
exports were also considered and deferred in favor of returned data.tables.

## Discussion and Challenge

- Engine separation must not become a large framework. The discussion proposed
  ordinary functions, not a plugin system or general-purpose registry. The user
  added analyst workflows and feedback as engine-design requirements.
- Keeping artifact versions alone cannot identify what was online on a given
  day. The user approved dated release-version references as well as retaining
  replaced artifact versions. The storage mechanism is not settled.
- The initial proposal for automatic transient retries was not approved. The user
  explained that unchanged deterministic work should fail again and requires
  analyst review. External problems such as lost GitHub connectivity are the
  reason to retry a failed case on the next execution.
- The existing Decided rerun-after-failure rule at SYSTEM_DESIGN.md:192 conflicts
  with suppressing unchanged deterministic failures. This conflict was disclosed.
  The user explicitly approved the revised policy as a qualification of that
  rule. SYSTEM_DESIGN.md was not edited.
- A plan is a preview of the state when it is made, not a commitment to execute
  an old plan unchanged. Plan-only mode uses normal planning logic without stage
  execution or changes to pipeline state.
- Tables provide initial analyst feedback without introducing Markdown naming,
  formatting, and export requirements. Persistent run records remain necessary;
  returning a table does not replace them.
- Stakeholders are the PIP Technical Team and the consuming API. The policies
  preserve the existing API boundary, while exact analyst workflows remain for
  engine design. Interface and platform choices remain deferred. No conflict
  with the charter's portability or domain-agnostic stamp constraints was found.
- Minimal policy decisions can be refined later. Correction history protects
  information that cannot be reconstructed if discarded; failure suppression
  must not hide failed cases from analysts. No additional features were approved
  to address these risks in this session.

## Decision

Each approval below was obtained separately in this session. The user then
confirmed the combined minimal design summary and declined further complexity.

| M0 proposal | Status | Approved decision or prerequisite |
|---|---|---|
| Engine first, interface later | Approved | Plain R functions hold execution logic. Defer interface choice and implementation. Define analyst workflows and required feedback during engine design. Exact signatures and orchestrator location remain open. |
| Corrections keep history | Approved | Preserve replaced artifact versions and dated release-version references, so prior and corrected online states can be identified. Do not change correction-window or frozen-release rules. Storage mechanism awaits M1 evidence. |
| Transient and permanent failures | Approved with revised policy | Unchanged deterministic failures wait for analyst review and an input or rule change. External service failures are eligible on the next analyst-started execution. Successful unchanged cases are skipped. No automatic runs or retry loops. |
| pipster calculations only | Approved | Calculation functions receive data and return results. A separate layer selects estimates from a data list, supplies inputs, and saves outputs through stamp. Orchestrator location remains an M1 decision. |
| Plan-only mode | Approved | Return an R data.table of selected work and selection reasons, using normal planning logic without stage execution or pipeline-state changes. No automatic Markdown export or stored execution commitment. |
| Module out of survey ID | Pending | Wait for M1 S6 code and test evidence on custom metadata. No conditional approval was obtained. |
| Decisions become data | Pending | Wait for the module identity decision under the approved strategy dependencies. |
| Stage 5 output shape | Pending | Wait for the module identity decision under the approved strategy dependencies. |

The supporting execution-report decision was also approved separately: return an
R data.table with a short summary, attempted-work outcomes, failure details, and
blocked work. Keep persistent run records separate. Defer automatic Markdown
export. Exact columns remain for engine design. This is feedback for the existing
end-of-run report requirement (`SYSTEM_DESIGN.md:215`), not a ninth M0 proposal
or a new roadmap item.

Incremental execution still includes other work whose inputs changed. The
failure policy does not restrict every future run to previously failed cases.
Failure records supply status; the planner selects work. The log does not decide.

The final confirmation explicitly covered an in-progress record with five
approved proposals and three pending proposals. The user declined the optional
more sophisticated design and asked to capture the minimal design.

## Next Steps

1. Continue M1 harvest. S6 asks whether module, module version, data type, and
   DLW versions can be stored and read from a sidecar without loading data
   (`HARVEST_BRIEF.md:50`). Obtain file/line evidence at a recorded package SHA.
2. Return to the module identity decision only after S6 evidence is available.
   Obtain explicit approval; then discuss its two dependent M0 proposals.
3. Keep exact engine signatures, table columns, analyst workflows, correction
   storage, and orchestrator location for their appropriate design work. Do not
   treat illustrative output tables from this discussion as fixed schemas.
4. Apply approved design changes only in a later authorized integration step.
   The approved strategy requires all eight M0 decisions before its design-update
   feature (`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:58`). This record
   does not authorize editing SYSTEM_DESIGN.md or roadmap.json.
5. No implementation handoff is made. Do not start M2 from this session.

## Gaps

- stamp custom metadata support is UNKNOWN until M1 supplies S6 evidence. Module
  identity and its two dependent proposals remain unresolved.
- No package implementation, test behavior, metadata storage mechanism, or
  release snapshot capability was verified here. S7 covers release scoping
  (`HARVEST_BRIEF.md:52`).
- Exact failure classification rules, engine function signatures, feedback
  columns, correction storage, and analyst workflows remain open. No retry
  framework or override mechanism was added.
- Orchestrator location remains an M1 decision. This record does not select a
  package or settle any other evidence-dependent M1 decision.
- Five approvals do not complete M0 or establish that the nine-feature M2 start
  gate has been satisfied. No readiness or implementation claim is made.
