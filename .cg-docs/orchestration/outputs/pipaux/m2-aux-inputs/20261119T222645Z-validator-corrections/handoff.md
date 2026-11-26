---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T222645Z-validator-corrections
status: completed
updated: 2026-11-19T22:39:04Z
owner: Implement pipaux validation corrections
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: "This handoff, revision 1 (Summary)"
next: Coordinator collects this result; no further pipaux edits under this assignment.
---

# M2 pipaux validator corrections

## Summary

Implemented both local validator corrections; the final focused source tests
passed. The baseline failures and prior experimental producer proofs remain
distinct from this package change.

### Plan, revision 1

1. Show that distinct population keys and valid country-list region codes in
   PFW output fail against unchanged source. Keep checks for genuine duplicates
   and disallowed regions.
2. Qualify only the three proven population `is_uniq` calls and use the exact
   country-list predicate only for PFW output `region_code`. Leave the WDI and
   PFW raw rules, `reg_pcn`, joins and data unchanged. No new dependencies.
3. Rerun the regressions and directly related tests in isolated E: with existing
   R 4.5.2. Review the final diff against scope and report remaining limitations.
   No branch, commit, push, merge, install, release, network, shared access or
   pipeline work.

Original package-authority failures and experimental passes remain distinct;
sources: `../20261119T215954Z-pop-qualified-proof/handoff.md:20-39,50-62` and
`../20261119T215954Z-pfw-predicate-proof/handoff.md:20-26,36-56`.

## Changes

- `pipaux/R/aux_pop.R:312,412,453`: qualify only `is_uniq` for main, output
  and special population validation. The keys, WDI and all other rules are
  unchanged. There is no `all()` wrapper.
- `pipaux/R/aux_pfw.R:484-489`: require character `region_code` and the exact
  seven-code set from `R/aux_country_list.R:209-212`. Reused the rule in place
  rather than changing the country-list source or adding a dependency. PFW
  raw validation, `reg_pcn`, joins and data are unchanged.
- `pipaux/tests/testthat/test-pop.R`: added one distinct composite-key case
  per affected validator and tightened the existing real-duplicate assertions.
- `pipaux/tests/testthat/test-pfw.R:69-73,205-223,321-333`: use joined codes
  for output and cover rejection of arbitrary and raw-only output codes.
  The M2 storage file changes only its country-list seed (`:74-79`); its raw
  fixtures and exact-key, version and invalid/no-output assertions are intact.
- No Git mutations. The only product changes are the five tracked paths above.
  Untracked harness, logs and launcher cache are under
  `E:/PovcalNet/01.personal/wb384996/PIP/pipaux/.tmp/m2-validator-corrections/`.

## Checks run

- Registry line 4, package root, Git directory, `refs/heads/PROD` and exact HEAD
  verified. Read both package Compound GPID files and loaded the five R skills.
- Handoff target and scoped package paths checked for containment and redirects.
  Hub HEAD `1408035c46f0ebcee494eb3f2c438611505286d3` on
  `feat/auxiliary-recovery-pilot`.
- **RED reproduced** on source verified equal to HEAD: the three distinct POP
  key cases failed the duplicate rule, two PFW positive cases using joined region
  codes failed the `region_code` rule, and the old rule wrongly accepted
  raw-only `EAP`. Report printed 49 passed, 6 expected failures and 2 built-in
  skips before the shell timed out (`pipaux/.tmp/m2-validator-corrections/red.log:177-193`).
- **GREEN, R 4.5.2:** `final.log:1-12` in the scratch directory records exit 0,
  28 POP plus 27 PFW passing expectations, no test failures/errors/warnings,
  and two built-in skips. This includes specific errors for actual duplicate
  keys and invalid output regions. `data.table` and `data.validator` reported
  build-version warnings. Earlier launchers printed the same green assertions
  but did not exit cleanly; the final launcher resolved that issue.
- **Review:** final bounded diff checked against the pinned proof and current
  country-list rule. Restored mixed line endings from the edit tool to the
  tracked LF format; final `git diff --check HEAD` exited 0. Read-only Git
  reconfirmed the registered `pipaux` root, `PROD` and the exact starting HEAD;
  the hub ref and HEAD above also remained unchanged. Used the bounded
  plan/red/green/diff review portions of Compound GPID; formal agent review
  was not run in this worker's toolset.

## Gaps

- `pipaux/R/zzz.R:19-61` reads release and alias state and initializes an
  overwriting log. The tests ran actual validator bodies and package test
  assertions in a scoped source environment, not installed-package startup.
  Two `pipload` cleaner cases, the M2 Stamp integration, and the full package
  suite were **NOT RUN**. No real-input rerun, new snapshot, release, network,
  shared access or pipeline execution was attempted.
