---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T215847Z-code/review-testing
status: completed
updated: 2026-11-16T22:34:50Z
owner: scoped-testing-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md revision 2
next: Code coordinator integrates this review and completes final scoped verification.
---

# Scoped testing review

## Summary
Explicit no issues found: no supported new P0, P1, P2 or P3 testing finding in
the inspected initialization delta, focused checker or task-local harness.
This is a static evidence review, not an independent test execution or complete
pipeline acceptance. The source-4 failure is retained as a real historical FAIL;
the subsequent source-5 log supports the reconciled source/preservation checks.

## Changes
Only this assigned handoff report created and finalized. No source edits,
execution, network requests, package reads outside this checkout, installation,
Git mutations or shared writes. All reviewer writes were to this E: report.

## Checks run
### Static checks performed

- Read revision 2 and the scoped review brief. Compared Qmd and checker against
  the task's worktree snapshots, not absent HEAD versions. The unchanged
  synthetic numerical, exact-version and invalid/no-output checks were inspected
  against baseline: current Qmd:353-458 corresponds to baseline:242-347.
- Honest directory doubles: checker:33-36 and 53-55 provide deterministic
  TRUE/FALSE replies at the actual directory boundary. Checker:72-75 explicitly
  limits acceptance to offline context/control flow. The missing-directory
  assertion forbids a PASS claim, and original option/environment restoration
  remains asserted at checker:61-70. These are not live share-access evidence.
- Initializer source checks: checker:78-111 require the manual skip, public
  calls, explicit roots and PPP 2021. Evaluating without context must yield
  FAIL/NOT RUN without PASS. The live cell checks exact release identifier
  after character conversion, strict identity/PPP, full active/returned state
  equality and independent expected folder/alias roots (Qmd:83-139).
- Live harness: live.R:24-39 reuses receipt/namespace verification; its only
  helper-environment relocation changes the disposable storage probe root.
  live.R:46-68 extracts and evaluates the actual canonical cell, changes only
  sandbox context roots, verifies first/existing directory state, and requires
  both result rows PASS. No fixture transport or package-function replacement
  appears in this harness. live.R:69-74 additionally asserts E:-contained roots
  and stamp/temp/log directories. run.ps1:18-48 redirects runtime write roots;
  run.ps1:53-67 reads existing credentials into memory without retaining values.
- Inspected only the reused verification helper in setup.R:203-241 and its
  usable() definition at :38-57 to interpret live evidence, not to reopen a
  broad runtime review. Receipt SHAs, archive hashes, installed metadata hashes,
  namespace origins and dependency descriptions are checked before live setup.
- Inspected the current narrow description reconciliation at checker:173-183:
  it checks the exact description suffix, restores that field for comparison,
  and retains whole-config equality. The current task preservation helper
  accounts for this block and trailing diagnostic at check-source.R:37-59.

### Retained execution evidence inspected, not rerun

All paths below are under
`.tmp/qmd-working-release/20261116T215847Z-code/`.

- `source-red.log:1-8`: actual missing-cell red failure.
- `logs/source.log:24-31`: initial offline green and baseline-preservation PASS.
- `logs/source-4.log:29-36`: actual whole-config equality FAIL; subsequent
  preservation checks were NOT RUN in that attempt.
- `logs/source-5.log:24-31`: post-reconciliation offline checks, instruction
  comparison, Qmd baseline preservation and checker preservation PASS. The
  printed synthetic blocker at :26 is the deliberate negative control, not
  a successful package execution or an uncaught test failure.
- `logs/first-4.log:1-4,35-42,127-135` and
  `logs/existing-4.log:1-4,35-42,127-135`: distinct fresh PIDs 26308/25552,
  empty pre-setup alias lists, the same store-4 roots and PASS for both public
  initialization and nine-alias readbacks. Logs explicitly leave shared setup
  and real survey processing NOT RUN. Inspected first-4 exact-cell capture;
  its assertions match the current canonical cell.
- Both live logs :44-52 retain the credentials fallback diagnostic. It is not
  suppressed or represented as absent; returned release/TEST/2021 and final
  assertions nonetheless appear at :53-69 and :127-135.

### Provenance

No package repository was read directly during this review. Recorded execution
pins, inherited from `logs/first-4.log:13-20` and confirmed in the existing log:

| Package | Recorded source SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 53a76e379c81a3ac70b39925954981ae6a691459 |

Checkout HEAD above is inherited from the coordinator's handoff:11, not a
reviewer-executed Git check. Shared, technical, data.table, collapse, testing
and analytical R skills were loaded; test-integrity reference was consulted.

## Gaps
- No R, PowerShell harness, network, rendering or editor diagnostics were run
  by this reviewer; all runtime outcomes are retained producer evidence.
- Source-5 resolves the inspected source-check evidence gap; source-4 remains
  historical FAIL, not retroactively passed. Final integration/verification is
  the coordinator's remaining stage, not certified by this review.
- Real shared-store initialization, household survey processing, auxiliary
  production, B6 and full synthetic rendering remain outside this review.
  Sandbox setup success does not establish their acceptance.
- No new safeguards or extra framework are proposed; no supported defect
  warrants a Later recommendation within this narrow review.
