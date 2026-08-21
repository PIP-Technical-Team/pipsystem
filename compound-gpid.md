---
project-name: "pipsystem"
team: "PIP-Technical-Team"
created: "2026-08-21"
last-reviewed: "2026-08-21"
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

- The other folders in this workspace are read only sources. Never modify, commit to, or create files in any PIP package repository from here. All output belongs in pipsystem.
- No fabrication. Every documented fact must trace to a file and line, or be marked UNKNOWN. Gaps sections are mandatory and must never be empty.
- Record the commit SHA of every package repository read. Facts without a SHA are not reusable.
- Planner logic must stay portable and must not depend on any specific cloud platform.
- R dialect is data.table and collapse, matching the existing PIP packages.
- `{stamp}` stays domain agnostic. It knows about artifacts, hashes, parents, and
  versions. It must never learn what a survey, a CPI series, or a release is.
  PIP specific concepts live in pipsystem.

## Current Focus

Phase 1, discovery. Establish what documentation already exists in the .cg-docs folders of the PIP package repositories before generating anything new, then harvest structured facts about how the nine packages read data, write data, consume auxiliary data, and encode cleaning rules. The first question to answer is the granularity at which auxiliary data is consumed, because it determines whether precise invalidation is achievable without refactoring.
