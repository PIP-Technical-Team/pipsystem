---
schema: pip-handoff-v2
project: pipsystem
task: machine-migration
run: 20261123T213020Z-checkpoint
status: partial
updated: 2026-11-23T21:38:42Z
owner: pip-orchestrator
repo: pipsystem (current workstation)
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: Restore the portable checkpoint and approved private inputs, then requalify the new machine before any survey download.
---

# M2 workstation migration

## Summary

Public-safe checkpoint for moving M2 to an approved intranet workstation.
The original `pipsystem` base was `1821c5526337d03b87a9e61ad934b3c7316c16cf`.
The portable checkpoint belongs on `docs/m2-machine-migration`, not remote
`main`. The final published commit identifies the new checkout. The README
explains what Git carries, what requires approved private transfer, and how
to requalify the new workstation.

## Changes

- [Reconstruction guide](../../../../../../README.md#rebuild-the-m2-workstation)
  and [Kilo continuation prompt](resume-kilo.md).
- Portable workspace instructions and configuration, synthetic experiment
  changes, a local storage locator ignore rule, and the version-only R
  dependency inventory. No package repository edits, stash application, or
  transfer of local runtime state, logs or data payloads.

## M2 state at transfer

| Check | State | What the new workstation must verify |
|---|---|---|
| Installed auxiliary proof r4, Run 3 | PASS V1–V3 in one private offline TEST store | The pinned Stamp archive installed after restoring the x64 `PROCESSOR_ARCHITECTURE` in the isolated child. Country list, PFW and population passed normal installed saves and exact-version reads. Qualify the new runtime and bind approved inputs; old receipts do not prove the new setup. No shared storage was written. |
| One-survey preflight r2 | V1 BLOCKED, V2–V3 NOT RUN | At the pinned `pipdata` baseline, no supported public one-file path binds the verified DLW source to the exact raw version/hash consumed by validation and cleaning. Moving machines does not fill that interface gap. |
| Public one-file `pipdata` Plan r2 | Write path BLOCKED | No authoritative catalog checksum algorithm, covered bytes or encoding was established. A locally computed digest and a catalog token cannot verify the expected source bytes. Read-only catalog access, producer checksum evidence and a qualified isolated destination are distinct checks. |
| Real survey and release work | NOT RUN | After readiness and authorization, acquire one pinned GPWG survey, validate and clean it, then save and verify the exact clean survey and metadata pair. Deflation, mean and TEST release proof are later boundaries. |

This is a sanitized summary of the private original auxiliary work report
(Run 3), the original survey Phase 1 result, and the follow-up DLW integrity
handoff. Transfer those original records separately if their exact provenance
or receipts are needed. The published R scenario changes are historical
synthetic diagnostics, not current live acceptance.

## Checks run

Verified the base SHA, origin identity and public visibility; reviewed the
scope of the existing notebook/setup stash, selected evidence, and the
immutable dependency refs distinguished from old checkout HEADs. Compared
the dependency inventory with Run 3 and checked the portable checkpoint
paths before publication. Details of reviewed inputs are in the README.

## Gaps

Fresh-machine setup, authenticated DLW access, and new-machine artifact
readback were not run. Private records and package-local work do not follow
the GitHub clone; restore only permitted items through an approved channel.
