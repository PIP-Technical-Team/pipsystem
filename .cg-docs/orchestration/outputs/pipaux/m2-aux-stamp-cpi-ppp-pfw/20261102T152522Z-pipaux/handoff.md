---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-stamp-cpi-ppp-pfw
run: 20261102T152522Z-pipaux
status: completed
updated: 2026-11-02T20:20:27Z
owner: pipaux-agent
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux/.kilo/worktrees/m2-phase-2-step-4
branch: feat/m2-aux-stamp-cpi-ppp-pfw
head: 4b59a60d846a91c513d17f59629f8dc509867e78
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipaux/.kilo/worktrees/m2-phase-2-step-4/.cg-docs/plans/2026-10-30-m2-aux-stamp-cpi-ppp-pfw.md
next: Under later explicit approval, PR 119 was merged into PROD at dca23869 after successful CI. See ../20261102T191337Z-pipaux/handoff.md; runtime installation and broader M2 work remain separate.
---

# M2 Auxiliary Dependency Alignment and Test Isolation

## Summary

The user authorized dependency alignment and correction of the remaining P3
test-isolation finding. The feature branch already contains implementation
commit `798242c` and verification report commit `c274487`. Work is confined to
this branch and isolated E-drive verification. Production merges, shared-library
upgrades, and Y-drive operations are not part of this run.

Corrections are complete, committed and pushed as
`4b59a60d846a91c513d17f59629f8dc509867e78`
(`fix(aux): align M2 dependencies and isolate storage tests`). Local HEAD and
the remote feature branch match. `PROD` remains at `27c5a3c`.

## Changes

- `DESCRIPTION`: minimum supported versions and full-SHA stamp/pipload remotes;
  explicit installed test-only `callr`/`pkgload` dependencies.
- `tests/testthat/helper-stamp-process.R` and the two storage-test files:
  disposable subprocesses replace private stamp-state snapshots/mutations.
- `R/aux_cpi.R`, `R/aux_ppp.R`, `R/aux_pfw.R`: eight explicit
  `assertr::is_uniq()` calls fix expression resolution in the installed package.
- Plan and execution/review evidence are updated and included in the commit.

## Checks run

- Confirmed feature HEAD and remote are `c274487`; `PROD` is unchanged at
  `27c5a3c`.
- Local dependency source HEADs remain stamp `4a1fa5d` and pipload `4ef0d90`.
- Previous verification: 218 passing assertions with those pins; default
  installed stamp `0.0.10` fails three exact-key restoration assertions.
- Current source and installed-package focused suites pass all 218 original
  assertions plus 4 caller-state wrapper assertions, with zero
  failures/errors/warnings and five existing external-service skips.
- Two repeated directory-discovery runs and an intentional child-error
  experiment demonstrate no caller alias/options/child-marker leakage.
- The new minimum dependency requirement rejects incompatible stamp 0.0.10
  before loading pipaux. Tested pins were installed only into the E-drive
  verification library.
- Independent architecture/reproducibility and testing/code-quality reviews,
  followed by `/cg-review mode:verify`, confirm all three corrections resolved
  with no outstanding actionable P0-P3 findings in scope. Review sessions:
  `ses_e631b8ec8ffemkxWD52CaGTdnD`, `ses_e631b8ec7ffe6ln9Z056JW5gtV`.
- `git diff --check` passes. Live GitHub comparison confirms the feature branch
  is three commits ahead and zero behind `PROD`. No open feature PR exists.
- All tracked files are clean after push. Existing generated untracked
  `.cg-docs/active-state/` was not included or modified.

## Gaps

- No production runtime has been changed or certified. Rollout must install the
  dependencies selected by the declared remotes; the obsolete default stamp
  installation is intentionally not accepted.
- A merge into `PROD` remains a separately authorized action.
- Follow-up: the user subsequently authorized PR creation; PR 119 is now open
  at https://github.com/PIP-Technical-Team/pipaux/pull/119. See the newer PR
  handoff for the current snapshot. Merge remains separately authorized.
- Full package checks, remote CI and live-data/shared-drive integration remain
  outside the focused evidence. Broader M2 integration remains separate.
- The three existing read-only `stamp:::st_hash_code()` assertions remain;
  the corrected P3 issue concerned private mutable state, not all private APIs.
