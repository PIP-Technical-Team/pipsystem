---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T215847Z-code/verify-testing
status: completed
updated: 2026-11-16T22:37:21Z
owner: cg-testing final light verification
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main (reported; no Git execution permitted)
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2 (observed execution-report record; not independently queried)
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md revision 2
next: Main agent incorporates this testing result with the other light verification report.
---

# Final scoped testing verification

## Summary
No issues found: no supported P0/P1, cross-file breakage or new P2/P3 in the
requested testing verification scope. Verified finding IDs: P2.1. Unresolved
finding IDs: NONE. No suppression requested or applied. The fixed narrow
baseline allowance and current source-5 PASS are supported by direct inspection,
not inferred from the earlier reviews. No broad review or B6 was reopened.

## Changes
Only this assigned report created and finalized. No source edits, R, shell,
network, renderer or Git execution; no commits. No package repository was read.

## Checks run
Read Plan revision 2, the prior review, review brief, contract and targeted
project context. Loaded existing R shared, technical, data.table, collapse and
testing skills, plus clear technical communication. Minimal first applied:
bounded verification only, no new infrastructure, dependencies or safeguards.

Evidence shorthand below: `task/` means
`.tmp/qmd-working-release/20261116T215847Z-code/` in this checkout.

### P2.1 verified fixed
- `experiments/one-survey/check-qmd.R:173-183` requires the exact approved
  description suffix, restores only that field, then retains whole-config
  `identical(config, original)`. Prompt prefix/suffix and four instruction
  excerpts remain asserted at lines 147-172.
- `task/check-source.R:37-55` removes the marked reconciliation block and
  restores the trailing diagnostic before exact comparison with the original
  checker tail. Inspected actual current tail against
  `task/baseline/check-qmd.R:70-130`: original error, dependent NOT RUN,
  fixture-value and instruction/config assertions are retained.
- `task/logs/source-5.log:29-31` reaches the approved-description diagnostic
  and both baseline-preservation PASS summaries. The normalizer does not
  remove numerical, exact-version, invalid/no-output or instruction assertions
  from the inspected current files. No remaining cross-file mismatch found.

### Retained assertions and honest source checks
- `task/check-source.R:14-30` compares the Qmd with its pre-edit worktree
  snapshot, excluding the new manual section and explicit PPP additions only.
  `task/logs/source-5.log:30` records that comparison PASS.
- `experiments/pip-pipeline.qmd:363-368,387-408,423-435` retains exact saved
  version use, paired welfare/weight values, CPI 1.4/PPP 1.6/weight total 100,
  and invalid-survey absence checks. These match the observed baseline
  `task/baseline/pip-pipeline.qmd:251-258,276-297,312-324`.
- `experiments/one-survey/check-qmd.R:32-75` uses deterministic directory
  replies only in isolated offline context environments, verifies failure
  before a PASS label and restores session paths. Lines 102-131 exercise
  missing-context FAIL/NOT RUN and the real error recorder/dependency gate.
- `task/source-red.log:1-8` records the actual missing-cell failure.
  `task/logs/source-5.log:24-31` records current offline/initializer/fixture/
  instruction/preservation success. Its line 26 synthetic blocker is the
  deliberately asserted error-recorder test, not a failed live initializer.
  `task/logs/source-4.log:29-36` remains historical FAIL; it is not treated as
  a passed run or current blocker after explicit user approval and source-5.

### Exact-cell live separation and fresh/existing evidence
- `task/live.R:46-68` extracts and evaluates the canonical manual cell, changes
  only the context roots for sandbox execution, preserves release/TEST/2021
  and both selected survey identifiers, and asserts first/existing directory
  state before evaluation. No transport or package-function replacement is
  present in the inspected live harness. Its helper environment relocation at
  lines 21-35 is for the disposable verification probe, not metadata transport.
- Inspected both retained `task/logs/first-4-exact-cell.R:1-94` and
  `task/logs/existing-4-exact-cell.R:1-94` against canonical
  `experiments/pip-pipeline.qmd:62-155`: same public initializer and readback
  assertions, including exact release identifier, strict identity/PPP, full
  returned/active equality, nine folder/alias roots and stamp-root checks.
- `task/logs/first-4.log:1,35-42` and
  `task/logs/existing-4.log:1,35-42` record distinct fresh PIDs 26308/25552,
  initially empty aliases and the same E:-contained store-4 directory tree.
  Both logs :53-69 record requested release/TEST/2021; :127-135 record both
  public checks PASS and shared/real-survey NOT RUN. `task/live.R:68-76` also
  asserts `.stamp`, `.stamp/temp` and `.stamp/logs` under checked roots.
- Both logs :4-34 record receipt/hash/namespace checks PASS and private
  namespace paths. Observed receipt SHAs (no package repository reads):
  stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`, pipfun
  `7d534516a8c17c33d537681610eccd4c29211762`, pipload
  `4ef0d90a974cb6ff0725da69373bde421dd04ad5`, wbpip
  `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`, dlw
  `12faa058b521ef511073a7b21b1b1dd7993c9649`, pipaux
  `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, pipdata
  `53a76e379c81a3ac70b39925954981ae6a691459`.
- `task/run.ps1:18-52,69-79` redirects process-local temp/home/cache/log roots,
  invokes fresh Rscript children, checks exit status and restores settings.
  `.cg-docs/work-reports/2026-11-16-qmd-working-release-initialization.md:70-75`
  records live exits 0 and source-5 exit 0. Logs themselves expose PASS
  summaries, not process exit codes; these two evidence sources are distinct.

## Gaps
- Static source/log inspection only; no independent execution or live network
  authentication/metadata revalidation. Mutable remote metadata remains a
  reproducibility limit, not an inferred immutable pipeline guarantee.
- Credential fallback diagnostics remain visible in both live logs :44-52;
  later public readbacks and assertions PASS. This report does not claim the
  diagnostic disappeared or inspect credential values.
- Shared initialization, household/survey acceptance, auxiliary producers and
  full Qmd rendering were not executed or certified here. Editor diagnostics
  are unavailable/NOT RUN. No wider source or package review was performed.
- Branch and HEAD are reported execution evidence, not independent Git checks;
  execution was expressly prohibited. Main-agent integration of both light
  verification reports remains outside this testing subtask.
