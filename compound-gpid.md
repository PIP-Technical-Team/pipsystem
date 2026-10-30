---
project-name: "pipsystem"
team: "PIP-Technical-Team"
created: "2026-08-21"
last-reviewed: "2026-10-30"
---

# pipsystem

## Objective

Design and build an incremental build system for the PIP data pipeline: a system that detects what changed, whether a household survey, an auxiliary data value, a cleaning rule, or a package version, and reruns only the work affected by that change across more than 2,000 survey databases. It is for the PIP technical team, who currently cannot rerun the full pipeline every time a single CPI value is revised.

## Key Deliverables

- Structured tables documenting how the nine PIP R packages read data, write data, consume auxiliary data, and encode cleaning rules.
- Data contracts per pipeline layer.
- A dependency graph with an explicit invalidation model.
- A planner that decides what needs to run for a given release, kept separate from the executor so the compute platform can change without changing the logic.
- A planner built on `{stamp}` that decides what needs to run for a given release,
  plus whatever extensions to `{stamp}` that requires, kept separate from the
  executor so the compute platform can change without changing the logic.

## Constraints

- The other folders in this workspace are read only sources, with one exception: `pip-orchestrator` may make a small change in a PIP package repository when the change unblocks work, and it reports every such change (`ORCHESTRATOR.md`, "Changes in packages"; `SYSTEM_DESIGN.md:319`). All other output belongs in pipsystem.
- No fabrication. Every documented fact must trace to a file and line, or be marked UNKNOWN. Gaps sections are mandatory and must never be empty.
- Record the commit SHA of every package repository read. Facts without a SHA are not reusable.
- Planner logic must stay portable and must not depend on any specific cloud platform.
- R dialect is data.table and collapse, matching the existing PIP packages.
- `{stamp}` stays domain agnostic. It knows about artifacts, hashes, parents, and
  versions. It must never learn what a survey, a CPI series, or a release is.
  PIP-specific runtime concepts live in the PIP packages. Release orchestration lives in `pipdata`; `pipsystem` is the design and evidence workspace.

## Current Focus

M2 Walking Skeleton (`.cg-docs/plans/2026-10-10-m2-walking-skeleton.md`) is in progress:
- Phase 1 (`close-stamp-gaps-for-skeleton` and `create-engine-skeleton`) is `done` (`stamp` `ready_cran` at `4a1fa5d`, `pipload` `feat/m2-stamp-adapter` at `4ef0d90`, `pipdata` `PROD` at `7f4a984` / `8cde5c5`).
- Next M2 steps: Phase 2 (`save-cpi-ppp-and-pfw-through-stamp` in `pipaux` and `download-one-survey` / `format-and-validate-one-survey` in `pipdata`). M1 R1 (row-level change detection) remains Open.
