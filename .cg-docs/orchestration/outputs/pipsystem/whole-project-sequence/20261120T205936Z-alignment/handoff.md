---
schema: pip-handoff-v2
project: pipsystem
task: whole-project-sequence
run: 20261120T205936Z-alignment
status: completed
updated: 2026-11-20T21:01:05Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: After alignment on the sequence, plan the bounded installed auxiliary check from the hub; decide whether to start read-only targets discovery in parallel.
---

# PIP whole-project sequence: preliminary alignment

## Summary

Proposed delivery sequence: prove one survey through a pinned test release,
widen survey coverage, add lineups and missing-country estimates, and rehearse
a full round through the existing API. Make plain R usable for analysts before
cutover; leave interface and platform choices for later. This completes the
draft, not agreement on the sequence or approval to execute. The numbered
stages below are delivery stages; pipeline stages are the ten data-processing
steps in `SYSTEM_DESIGN.md:143-156`.

## Changes

This handoff only. No changes to the roadmap, system design, component Plans,
packages, or releases. No Git mutations or session dispatch.

## Checks run

Read-only Git verified the pipsystem root and `main` at the SHA above; existing
edits are outside this task. Compared `roadmap.json:4-124` with the approved
design, roadmap strategy, M2 umbrella, and recent local evidence below. No
package repositories were reread. No R, installs, tests, notebook renders,
live data access, or pipeline runs in this task.

## Starting point

- **Foundation (M0/M1).** M0 is marked done and M1 source harvest is marked
  done. M1 R1 remains Open: how to rerun only dependents of a changed input
  row, for example the surveys that actually use a revised CPI value.
  This does not block continuing the bounded M2 input and calculation work;
  the approved mechanism and evidence for unrelated-row skips are required
  for the M2 completion check, not just for widening (`roadmap.json:4-56`,
  `SYSTEM_DESIGN.md:184-205`, M2 umbrella `:229-235,465-467,561-563`).
- **Current M2 evidence.** The roadmap marks five of nine features done.
  Local evidence covers auxiliary keys and source-level fixes; the recorded
  joint check used experimental PFW and population inputs and did not prove
  normal installed saves or binding in one store. The real-survey record
  shows inventory pins, not verified household data or deflation. No new
  execution result is asserted (M2 assessment `:59-76`, joint log
  `:2-13,23-26`, survey inventory handoff `:67-86`).
- **Ownership.** `pipdata` coordinates releases, `stamp` alone selects what
  reruns, `pipster` calculates on supplied data, and `pipload` delegates
  versioned access to `stamp`. The hub coordinates and records evidence.
  The Qmd is the acceptance narrative, not a second engine. Keep package
  code and tests with their owners (`SYSTEM_DESIGN.md:284-319`,
  `.cg-docs/orchestration/CONTRACT.md:15-30`).

## Proposed stages and steps

### 1. M2 — Finish the one-survey proof

1. From the hub, plan a bounded `pipaux` producer check. In an approved
   isolated E: store, use the installed packages to save PFW (survey settings)
   and read the exact saved version back with a usable version ID and verified
   checksum. Repeat for population only after PFW passes. Reuse the retained
   local CPI and PPP inputs; no shared pointer repair. The earlier package
   pickup assignment was superseded before pickup (`assignment.md:1-6`,
   linked below); it is not an instruction to dispatch.
2. In the approved store, verify the Colombia 2010 GEIH income GPWG clean
   survey and its matching metadata, bind exact auxiliary versions, and
   select one eligible 2021 PPP vintage explicitly. Equal numeric factors do
   not make their source versions interchangeable. Run `pipdata` deflation,
   compute the weighted mean in `pipster`, and save it independently.
3. Register a TEST release with exact data and code references and read it
   back after newer versions exist. Test unchanged, used-CPI, and unused-CPI
   cases; retain the M2 umbrella's additional code-change, failure, and
   history checks. Show which stages did and did not run. A failed prerequisite
   leaves dependent checks NOT RUN. Do not weaken the existing M2 gate.

**Exit:** One independently saved mean and a reproducible TEST release.
An unchanged rerun does no processing; a used CPI change reaches only its
dependents and an unused change leaves processing untouched. This is not a
full API-ingestable release (M2 umbrella `:173-176,538-563`).

### 2. M3 — Widen to all surveys

1. Bring all auxiliary series and their dependencies under version tracking,
   treating separately maintained legacy outputs as inputs. Apply and extend
   the approved selective-change mechanism to relevant CPI, PFW and other
   consumed inputs, including changed and removed keys.
2. Generate the included survey and module selection from PFW and approved
   choices. Track new and corrected DatalibWeb versions; record validation
   failures without passing invalid data downstream. Widen formatting and
   deflation across survey types. Produce the clean ALL-module output for
   Table Maker; do not change Table Maker itself.
3. Add the remaining survey estimates, with individual dependencies and
   independent saves. Validate the analyst modes and end-of-run summaries.
   Compare survey estimates against the current pipeline on pinned inputs,
   then test performance and parallel-write safety at target scale before
   shared operation.

**Exit:** Intended survey and auxiliary coverage, explained numerical
differences, and measured scale and rebuild behavior (`roadmap.json:60-82`,
`SYSTEM_DESIGN.md:108-121,166-190,209-223,258-272`).

### 3. M4 — Add lineups and missing-country estimates

1. Inspect the current `targets` project to identify the existing methods,
   inputs, and reference outputs. Start this read-only discovery in parallel
   with M2 if source access is available; do not start the port or commit to
   replacing `targets` from the discovery alone.
2. Port the existing national lineup method to `pipster`, without redesign.
   Track how a new or changed survey can alter the surveys selected for a
   country and lineup year.
3. Port the missing-country method after lineups. Track actual cross-country
   dependencies where confirmed and compare both outputs to the current
   pipeline. Full comparison depends on the widened survey outputs.

**Exit:** Both methods match the existing pipeline or have explained
differences, with evidence of what reruns (`roadmap.json:85-97`,
`SYSTEM_DESIGN.md:170-176,325-343`, strategy `:116-128`).

### 4. M5 — Rehearse a full release, then decide on cutover

1. Assemble complete release folders in the current `pipapi` format. Build a
   full TEST round: one release per supported PPP year, sharing survey
   versions. Keep the current API welfare units until the planned API change.
2. Ingest into a test API, compare outputs against the current pipeline, and
   check that past releases still load. Rehearse release states, corrections
   that retain the previous versions, and freeze. Exercise the analyst R
   workflow from stage 5 below in the same rehearsal.
3. Use the full-round comparisons and rehearsal evidence for the production
   go/no-go. The March 2027 release remains the documented target; January
   readiness and its two-week fallback are planning assumptions, not an
   updated delivery forecast. Recommend the existing API contract for the
   first cutover, without making the planned PPP API change a prerequisite.

**Exit:** A reproducible full TEST round served by the API, differences
resolved or explained, and an evidence-based cutover decision
(`roadmap.json:100-112`, `SYSTEM_DESIGN.md:227-256,307-318`, strategy
`:28,130-140`, `STRATEGY_BRIEF.md:64-80`).

### 5. M6 — Make the system operable, then improve the interface

1. Before the cutover decision, document and rehearse the plain-R workflow:
   preview, scope, run, read failures, and rerun. Cover incremental, force,
   scoped and plan-only modes as available and approved.
2. Later, decide interface and execution platform based on analyst and
   operational needs. Keep the planning logic portable and leave logging
   extraction as an open choice. The planned API PPP conversion change can
   also be scheduled separately when it has independent compatibility evidence.

**Exit:** Analysts can run and interpret a release in R before cutover; later
interface, platform, and logging choices are not on the first-release path
(`roadmap.json:110-124`, `SYSTEM_DESIGN.md:258-282`, strategy `:140-149`).

## Order and decisions

- Release-critical order: **M2 proof → M3 survey coverage → M4 methods and
  full comparison → M5 release rehearsal and decision.** Read-only M4
  discovery and preparation of legacy comparison baselines can overlap
  earlier work. The ALL-module path depends on download and formatting, not
  lineups. Analyst R instructions can develop alongside the engine and be
  tested in the M5 rehearsal (strategy `:94-149`,
  `STRATEGY_BRIEF.md:39-46,73-80`).
- Proposed alignment choice: start read-only `targets` discovery during M2
  if available, or hold it until after M2. Neither option delays the installed
  auxiliary save/readback check. Decide M1 R1 against the evidence before the
  affected tests; do not preselect partitions or a comparison mechanism.
- Later component Plans should be short and build the smallest working slice
  first. Use installed tools, require a functional check for each change, and
  add safeguards only for nearly irreversible harm. Otherwise, defer them
  (`AGENTS.md`, Working Principles). No implementation Plan is saved here.

## Evidence references

- [M2 umbrella](../../../../../plans/2026-10-10-m2-walking-skeleton.md)
- [Approved roadmap strategy](../../../../../strategy/2026-10-07-pip-backend-roadmap.md)
- [M2 assessment](../../pip-next-global/20261120T191722Z-m2-installed-proof/handoff.md)
- [Joint local input log](../../m2-aux-inputs/20261119T215954Z-local-boundary/joint-verified.log)
- [Survey inventory handoff](../../qmd-real-data-setup/20261116T194917Z-col-geih/handoff.md)
- [Superseded assignment](../../../pipaux/m2-installed-save-proof/20261120T205240Z-plan/assignment.md)
- [Shared retention gap](../../qmd-reconciliation-eligibility/20261119T162506Z-pin-diagnosis/handoff.md#L108-L122)

## Gaps

- Installed producer saves and real-survey deflation remain unverified in the
  evidence read. B6 is a separate installed-writer issue with unknown cause;
  shared historical recovery has no trusted checksum or authoritative copy.
  Neither is assumed to block the isolated M2 check (M2 assessment `:61-76`
  and shared retention gap `:108-122`).
- M1 R1 remains Open. `targets` source availability, its full dependencies,
  production-scale behavior, full release/API equivalence and capacity to meet
  the historical schedule were not verified here. This sequence is provisional
  and can change without treating every local fix as a roadmap change.
