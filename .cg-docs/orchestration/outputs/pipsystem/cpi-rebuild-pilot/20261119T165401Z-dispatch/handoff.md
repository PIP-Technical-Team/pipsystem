---
schema: pip-handoff-v2
project: pipsystem
task: cpi-rebuild-pilot
run: 20261119T165401Z-dispatch
status: completed
updated: 2026-11-19T16:57:15Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: ac7d40717ac1302ca5cabbab5c848d2c3070d6b6
plan: NONE
next: User submits the verified pickup in the existing pipaux Code session. The worker verifies approved local inputs and runs the isolated CPI pilot only if they are ready.
---

# Isolated CPI Pilot Dispatch

## Summary

The user approved a CPI-only rebuild and validation in isolation. This does
not authorize selecting a shared version, repairing the shared catalog,
publishing, rebuilding other measures, or running a survey. The live
diagnostic `pin-diagnosis-e602bdea0368.tsv:2-7` found no usable saved file
checksum for any of the six retained versions. The pilot is not a way to
certify or modify those historical files.

The assignment is ready but not dispatched directly. It is saved at
`outputs/pipaux/cpi-rebuild-pilot/20261119T165401Z-local/assignment.md`
relative to `.cg-docs/orchestration`. Only the package worker will create
the matching `handoff.md` after pickup. No new session or worktree was started.

## Changes

- Added this coordinator handoff and the CPI package assignment. No package
  or Git changes. No producer execution or data access by the coordinator.

## Checks run

- `git worktree list --porcelain` and `git status --short` in `pipaux`:
  existing clean `PROD` checkout at `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`.
- `tools/pipsys/packages.csv:4` maps `pipaux` to that checkout. Installed
  global `pip-pickup.md:5-13` points to this hub. The earlier `pipaux` pickup
  pilot used the same checkout (`outputs/pipaux/dispatch-pilot/`
  `20261119T144229Z-pickup/handoff.md:7-11,24-29`).
- Agent Manager overview for this project exposed local pipsystem sessions
  only. No exact `pipaux` session could be verified for direct dispatch.
- At the recorded pipaux SHA, `R/aux_cpi.R:135-137,163-183,239-260` shows the
  two source inputs, the existing transformation and the save call.
  `R/zzz.R:16-39` shows the production default and load-time context lookup;
  the worker must not use that context for this pilot.
- From the pipaux checkout, the hub `pipsys.cmd pickup-path` resolver returned
  the exact assignment and its future handoff for
  `pipaux/cpi-rebuild-pilot/20261119T165401Z-local` (exit 0). The resolver
  verifies an unused handoff path; it does not run the assignment. Final
  read-only checks confirmed the hub `main` and pipaux `PROD` SHAs above.

## Gaps

- Approved, reproducible local source inputs and an isolated execution path
  are not yet verified. The assignment names this as the preflight gate.
- The pilot has not started. No new snapshot, tracked release change, shared
  write, or survey verification is implied.
