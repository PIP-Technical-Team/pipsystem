---
schema: pip-handoff-v2
project: pipsystem
task: direct-package-dispatch
run: 20261119T165548Z-policy-and-pilot
status: completed
updated: 2026-11-19T17:05:34Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: ac7d40717ac1302ca5cabbab5c848d2c3070d6b6
plan: .cg-docs/plans/2026-11-18-package-assignment-dispatch.md (local follow-up)
next: Prefer internal Task dispatch for approved package work and verify the package diff and handoff in the hub.
---

# Registered package write access and direct-edit pilot

## Summary

User approval on 2026-11-19 replaced the workspace read-only rule. The
internal Task pilot passed in an isolated local clone of registered `pipaux`
without a new package chat or user relay.

## Changes

- Aligned the design, charter, workspace instructions, orchestration
  contract, and user guide for authorized reads and writes from the hub.
- Made internal Task the preferred route for independent package work.
  Pickup by ID remains the fallback when a package session is needed.
- An internal Task changed only `DESCRIPTION:2` in the disposable clone.
  The live `pipaux` and B6 work were not edited. No files were staged,
  committed, or pushed during the pilot run.

## Checks run

- The [worker handoff](../../../pipaux/direct-edit-pilot/20261119T165548Z-internal-task/handoff.md)
  records the edit and checkout identity. The parent independently confirmed
  the disposable clone on `PROD` at `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`,
  with a single unstaged line change in `DESCRIPTION`, and that the live
  checkout had no changed paths.
- `git diff --check` passed for the policy files and the clone's edit. The
  parent's base R `read.dcf` assertion passed for `pipaux`, version `0.3.0`,
  and the exact approved title.

## Gaps

The pilot exercised a metadata edit and check in one disposable clone. It
did not exercise package runtime, production, or runtime permissions in
other sessions. Kilo configuration and publication permissions were not
changed. The disposable clone retains the unstaged edit for inspection.
