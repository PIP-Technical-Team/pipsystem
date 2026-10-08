---
date: 2026-10-07
title: "M0: Remaining Design Decisions"
status: decided
scope: "Extended"
artifact-schema-version: 1
chosen-approach: "Module-bearing identity, generated selections, and independent estimate outputs"
tags: [m0, identity, metadata, selections, estimates, api]
---

# M0: Remaining Design Decisions

## Context

This follow-up Thinking Partner session settles the three M0 decisions left
pending in `.cg-docs/brainstorms/2026-10-07-m0-settle-the-design.md:122-146`.
The user supplied M1 evidence and requested module identity first, then
decisions-as-data, then stage 5 output shape. Each decision was asked separately.
Scope remains Extended. The five earlier approvals were not reopened.

The approved strategy governs dependencies
(`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:46-58,151-174`). Evidence
settles what source supports, not whether a proposal is approved. The user
explicitly confirmed the combined follow-up summary before capture.

Only this new brainstorm is written. The earlier brainstorm, SYSTEM_DESIGN.md,
roadmap.json, the charter, configuration, .gitignore, and package sources remain
read-only. No implementation, roadmap registration, commit, push, or M2 work is
authorized. HTML generation remains suppressed.

## Evidence and Authority

M1 evidence directory:
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.kilo/worktrees/docs-m1-harvest-8658eaafa47c46e5`.

Read evidence: `notes/stamp.md`, relevant `notes/FINDINGS.md` rows and provenance,
`notes/pipapi.md`, and relevant `notes/pipster_wbpip.md` excerpts. These are
uncommitted harvest records, not files at the cited package commits. No package
repository was directly read here. Package facts below are attributed to that
harvest; its full SHA mapping is `notes/FINDINGS.md:9-23`.

| Package | Harvested commit SHA |
|---|---|
| stamp | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` |
| pipdata | `84442e979c98d33fa5565ab9e56d3179cc7d5278` |
| pipaux | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` |
| pipload | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| pipster | `828064e406e07e711c34d2ba725746e367d35f9b` |
| wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` |
| pipapi | `280af151d05902a550d5dea18cd4bf1a3d013239` |

Material facts from M1:

- Custom metadata is appended to stamp sidecars. Current sidecar readers can
  read metadata without loading data. Field collisions and JSON type changes
  remain limits. Source: stamp `R/IO_core.R:193-207,310-348,630-660` and
  `R/format_registry.R:267-347`; harvest `notes/stamp.md:72-82` and
  `notes/FINDINGS.md:33`.
- Metadata-only changes may be skipped: the default save decision checks object
  and code changes, not metadata or parent changes. Source: stamp
  `R/IO_core.R:253-269,952-995`; harvest `notes/stamp.md:80`.
- Historical sidecars are copied to version snapshots, but public sidecar
  readers have no historical-version argument. They expose current metadata.
  Source: stamp `R/version_store.R:631-661`, `R/format_registry.R:319-347`, and
  `R/IO_core.R:630-660`; harvest `notes/stamp.md:76`.
- Arbitrary custom-field round trips and module-transition behavior were not
  runtime-tested. M1 inspected source and test assertions only; no tests were
  executed (`notes/stamp.md:5,82,94-100`).
- Current pipdata cache IDs include module. The complete preferred-module rule,
  external HIST/BIN choice, and choice between competing survey acronyms remain
  partly UNKNOWN. Legacy pipload ranks HIST before BIN; that ranking is not the
  target's survey-specific rule. Harvest `notes/FINDINGS.md:35-36`, citing pipdata
  `R/get_country_pfw.R:202-239`, `R/utils.R:341-364`, pipaux
  `R/aux_pfw.R:524-547`, and pipload `R/pip_find_data.R:307-308,399-428`.
- Reference statistic wrappers return lists. pipster formatting can return
  lists, data.tables, or vectors. Harvest `notes/pipster_wbpip.md:27,44,53-55,61-63`,
  citing pipster `R/utils.R:34-65`, wbpip `R/md_compute_dist_stats.R:58-64` and
  `R/gd_compute_dist_stats.R:95-105`. Decile shares and welfare cutpoints are
  different quantities, not interchangeable labels.
- The API consumes specific wide estimation/statistic files. For example,
  `estimations/dist_stats.fst` supplies `gini`, `polarization`, `mld`, and
  `decile1` through `decile10`, joined by `cache_id` and `reporting_level`.
  Harvest `notes/pipapi.md:43-48,65-71`, citing pipapi
  `R/create_lkups.R:83-183,406-456` and `R/utils-stats.R:26-60,338-377`.
  Complete production schemas, types, and null rules remain UNKNOWN
  (`notes/pipapi.md:122-129`).

## Requirements

- Preserve the five earlier approvals without reopening them absent a material
  reason. No such reopening occurred.
- Keep module in the internal identity, as explicitly selected by the user.
- Preserve result-relevant version metadata even when numerical values do not
  change. Historical reads must match data and metadata by version.
- Store resolved selections as generated data without inventing missing survey
  policies or editing generated selections by hand.
- Save successful estimate results independently of assembly. Calculation and
  assembly are separate processes with separate outcomes.
- Preserve the current API-required formats. A broader API redesign is later
  work, not part of this session or a newly registered roadmap item.
- Apply the previously approved minimal design principle: the smallest complete
  solution first, then features in small steps.

## Approaches Considered

### Approach 1: Module-Free Identity With Versioned Module Metadata

Use a stable ID without module, save module information per version, and build
module-bearing IDs at export. Pros: a module switch could stay within one survey
artifact's version history. Cons: requires identity migration and proven
metadata-only versioning and historical metadata reads. The user rejected this
identity proposal and selected module-bearing identity instead.

### Approach 2: Module-Bearing Identity With Version Metadata Safeguards

Keep module in the ID and preserve result-relevant metadata with each version.
Pros: retains the current identity form and avoids module-removal migration.
Cons: HIST-to-GPWG creates a different identity; it is not one artifact's version
transition. Metadata-only saving and historical reading still need implementation
work. The user selected this approach and separately approved its safeguards.

### Approach 3: Generated Selection Data Versus Code-Only Selections

Record resolved survey/module selections as a generated versioned table and
compare changes by selection row. Pros: explicit decisions and affected-work
identification. Cons: input policies must be defined; tables cannot supply missing
domain choices. Code-only selection avoids an extra stored output but makes
decision changes harder to inspect. The user approved generated selection data.

### Approach 4: Long Estimate Table Versus Independent Estimate Outputs

A long format is extensible but would add mapping to current API inputs. The
user rejected a mandatory long-table format and selected separate list or
data.table outputs for each estimate, followed by separate assembly if needed.
Pros: successful estimates survive assembly failure and current output contracts
can be preserved. Cons: each estimate and assembly need explicit keys and output
contracts. No single global artifact or new schema framework is required.

Implementation effort is UNKNOWN: source support is not runtime validation.
Policy capture is small, but storage gaps and complete contracts require later
planning. No implementation estimate was approved.

## Discussion and Challenge

- S6 supports custom-field storage in source; it does not prove module-transition
  history. Keeping module in the ID does not remove the metadata-only save or
  historical-read limits. The user approved safeguards without selecting their
  implementation mechanism.
- A generated selection table records choices; it must not invent HIST/BIN
  policy or adopt legacy ranking without approval. No general rule engine or
  manual table editor was proposed.
- The initial long-format recommendation was revised after the user distinguished
  estimation from appending. A failed assembly must not discard or cause the
  recomputation of successful unchanged estimate outputs.
- A single large list or combined file must not be the only saved result if it
  would defeat independent recovery. Each successful result must be saved before
  it is treated as reusable.
- The team and the API remain the affected users. Current API compatibility takes
  priority over a new uniform internal format. Estimate output contracts may
  supply parts of the required final format; API-bound assembled files must meet
  the current full contract.
- Keeping the current identity and API formats avoids unnecessary migration now.
  Metadata preservation protects information that cannot be recovered if lost.
  These choices fit the charter's reproducibility, performance, and minimal
  design constraints without adding PIP concepts to stamp.

## Decision

### Module Identity: Keep Module in the ID

The user explicitly selected **Keep module in identity**. The module-free proposal
in SYSTEM_DESIGN.md:135-141 is rejected. A module switch creates another artifact
identity rather than a new version of a module-free identity. No alias system or
new cross-module history mechanism is selected.

### Version Metadata: Safeguards Approved

The user separately approved the following requirements:

- Within an artifact identity, changes to recorded module-version, source-version,
  or data-type fields must be preserved as a new artifact version even when data
  values are identical. A module-name change changes identity under the preceding
  decision; it must not silently overwrite the old module's history.
- Historical data must use metadata from the same pinned artifact version, never
  the latest sidecar substituted for a past version.
- Descriptive metadata edits need not create versions.

The exact save/read mechanisms remain open. No claim is made that stamp already
fulfills these requirements. This approval does not settle the M1 code-version
policy or authorize forcing every unchanged save.

### Decisions Become Data: Approved

Generate and version a selection table containing the selected full
module-bearing survey ID and data type. Existing rules and explicit survey
choices are inputs; the generated table is not hand-edited. PFW retains its
survey-inclusion and settings role.

Compare old and new selection rows, including additions, exclusions, and module
switches, so only affected work is invalidated. A changed rule with unchanged
resolved choices does not alone require every survey calculation to rebuild.
This does not select the M1 row-level invalidation mechanism or create another
rebuild authority. Missing survey-choice rules and their input location remain
open.

### Stage 5 Output: Independent Results and Separate Assembly Approved

Each estimate returns a list or data.table under a defined output contract.
The separate storage layer independently saves and versions the result through
stamp. pipster remains calculation-only; this decision does not add saving to its
calculation functions.

Combining, appending, or joining saved outputs into a file is a separate work
item with its own inputs and outcome. If it fails, fix and rerun assembly from
saved results without recomputing successful unchanged estimates. This separation
does not assert that every mathematical calculation is dependency-free; actual
estimate dependencies must still be tracked.

The mandatory long-table proposal is rejected. API-bound files retain current
required names, shapes, keys, and units. Exact per-estimate contracts and physical
storage remain for planning. A broader API redesign is deferred and not registered.
The existing planned PPP conversion change is not approval to change today's
API contract (`SYSTEM_DESIGN.md:301-305`).

### Earlier Approvals Preserved

The five approvals remain as recorded in the first brainstorm:

- Engine first, plain R execution logic, interface choice and implementation
  deferred, analyst workflows and feedback defined during engine design.
- Correction history, including replaced versions and dated release references.
- Revised failure policy: no automatic retry loops; unchanged deterministic
  failures await review and an input/rule change; external failures are eligible
  on the next analyst-started execution; successful unchanged work is skipped.
- Calculation-only pipster with selection and saving in a separate layer.
- Plan-only mode with a returned data.table and no pipeline-state changes.

The table-based execution report and minimal design principle also remain
approved. No earlier decision was reopened.

The user confirmed this combined follow-up summary and instructed capture.
All eight M0 proposals now have explicit outcomes: five prior approvals,
selection-data approval, and two rejected proposals with approved alternatives.
This follow-up resolves the first record's three pending decisions; that record
is historical and remains unchanged. This is decision completion, not design
integration, roadmap status completion, tested capability, or M2 readiness.

## Next Steps

1. In a later authorized design-integration step, use both brainstorm records.
   Replace the module-free and mandatory long-output proposals with the selected
   alternatives rather than marking those original proposals approved.
2. Plan metadata-only version preservation and same-version historical metadata
   access, with direct tests. Keep any generic stamp work domain agnostic and in
   its own authorized package session.
3. Define selection inputs, unresolved survey-choice policies, and estimate/API
   contracts before implementing the affected behavior. Do not infer missing
   schemas from labels or source output names alone.
4. Verify separate recovery for a failed assembly after successful estimate
   saves, plus unchanged-run behavior and API-compatible assembled output.
5. Keep M1 decisions and capability gaps separate. This session does not decide
   orchestrator location, code-version policy, pipload role, or row-level detection.
6. Do not start implementation or M2 from this record. Do not update roadmap.json
   or SYSTEM_DESIGN.md without later authorization.

## Gaps

- UNKNOWN: executed custom-field round trips, metadata-only transition behavior,
  and historical metadata readback. Source inspection is not a test pass.
- Open: the metadata-only save/read implementation and field validation, including
  collisions with stamp built-in keys and JSON type preservation.
- UNKNOWN: complete HIST/BIN and competing-survey policies and where their
  explicit inputs are maintained. Selection-data approval does not answer these.
- UNKNOWN: complete production API schemas, null/type rules, all units, and
  numerical equivalence. Current-consumer evidence is only a partial contract.
- Open: per-estimate result contracts, physical storage, assembly granularity,
  and recovery validation. Independent result saving is a requirement, not
  implemented behavior.
- Open: broader API redesign as later work. No scope, schedule, roadmap feature,
  or permission was created for it.
- No M2 readiness claim is made. M1 decisions and skeleton stamp gaps remain
  separate from these completed M0 decisions.
