---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-testing
status: completed
updated: 2026-11-10T02:38:37Z
owner: followup-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates testing findings; Step 1 remains blocked at 2/2 corrections and Step 2 must not start.
---

# Follow-up execution testing review

## Summary
Read-only testing review completed, not a passed implementation gate. Three P2 findings (safe_auto recommendations, implementation blocked by exhausted correction budget); no P0/P1 or additional P3 findings in this testing scope. The two known blockers are corroborated, and the forced-failure assertion has an additional false-positive gap. Step 1 remains BLOCKED after 2/2 corrections; Step 2 and reduced package diagnosis NOT RUN. Original V1/V5 remain failed, V2-V4 NOT RUN (worker handoff:71-77).

## Changes
Only this report, created immediately and finalized here. No implementation, package, protected-record or Git mutations. No new dependencies or speculative safeguards. Recommendations below are bounded corrections to existing required functional checks, not permission to execute them.

## Findings

**[P2] [safe_auto] `experiments/one-survey/setup.R:33-34` -- Usable-package acceptance calls a nonexported stamp function.**
**Issue**: `usable()` assumes `stamp::st_extmap_defaults()` is exported. FINAL/logs/setup.log:26-27 records the exact namespace-export error after both installations exited zero (:3-4). This prevents green acceptance, namespace-path capture and the stale/incomplete receipt controls at setup.R:168-180. It is a harness control error, not a pipaux diagnostic or a failed survey.
**Fix**: Under a revised correction budget, use a verified exported, side-effect-appropriate operation from the same pinned stamp revision, retaining real namespace loading and behavior assertions. Re-execute green, receipt-negative and loaded-path checks before claiming acceptance; do not bypass the package boundary with namespace patches.

**[P2] [safe_auto] `experiments/one-survey/checks.ps1:31,56-57` -- Hard-link negative fixture contaminates the runtime needed by subsequent tests.**
**Issue**: `$testRoot` is inside the main attempt. Its `log-target` remains hard-linked after the negative check, so run.ps1:24-38 rejects the main attempt on subsequent launches. The intended guard is correct; the fixture arrangement creates test-order dependence. Worker handoff:44-45,63-65 records eight negative controls passing followed by rejection before the intended success/forced-failure child pair. Thus that pair cannot establish caller restoration.
**Fix**: In a newly authorized correction, create future boundary fixtures in a fresh E-local sibling test area outside the runtime later audited for positive checks. Preserve existing evidence. Execute both test sequences without the negative fixtures preventing the positive launch.

**[P2] [safe_auto] `experiments/one-survey/checks.ps1:12-16,75-76` -- Forced-failure check accepts unrelated prelaunch exceptions.**
**Issue**: `Invoke-Expected` treats any caught exception as the expected failure. The green phase requests `forced-failure` but never requires evidence of setup.R:45's intentional child error. A guard/startup failure can satisfy the boolean assertion without exercising restoration after a failed R child. This is a static false-positive risk, not an observed green pass: the reported direct pair actually stopped at its expected-success invocation.
**Fix**: Keep the environment comparisons, but also require the current forced-failure child log to contain its specific intentional-error marker and evidence that the child launched. Use the existing log; no new framework is needed. A prelaunch failure must fail this control.

## Checks run
No R, setup, PowerShell script, Pester or diagnostic execution. Loaded R testing and R technical skills plus clear technical communication. Read approved Plan, charter/design/harvest brief, coordination contract, all three harness files, original seven-open review, requested worker handoff and targeted fresh logs. Read-only Git confirmed `main` and full HEAD above. Clock read initially used unsupported PS5 `Get-Date -AsUTC`; retried successfully with `.ToUniversalTime()`; neither command writes files.

Evidence aliases:
- FINAL = `.tmp/one-survey/20261110T024500Z-followup-correction2`.
- RED = `.tmp/one-survey/20261110T022500Z-followup-red`.
- WORKER = `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T021917Z-followup-implementation/handoff.md`.

### Independently read execution evidence
- RED/logs/baseline.log:1,8-9: real pipfun namespace-load absence, not missing inventory. This verifies behavioral RED only, not red-to-green closure.
- `.tmp/one-survey/20261110T023500Z-followup-green/logs/install-stamp.log:5-11`: initial staged lazy-load library assertion failure.
- `.tmp/one-survey/20261110T024000Z-followup-correction1/logs/setup.log:1-9`: correction 1 failed because `tail()` was unavailable during base startup.
- FINAL/logs/install-missing-declared-cli.log:1-4 and setup.log:1-2: actual R CMD INSTALL declared-dependency rejection including cli, not a fabricated namespace name.
- FINAL/logs/child-startup.log:2-8: actual dependency-resolution and lazy-loading children report dedicated/private-base paths, with 00LOCK staging contained under the dedicated library; no mixed original library appears in these recorded paths. These are startup path observations, not final loaded-namespace inventory.
- FINAL/logs/install-stamp.log:13 and install-pipfun.log:15: DONE for the two installs. setup.R:58 uses `--no-test-load`; successful install exits are not acceptance evidence by themselves.
- FINAL/logs/setup.log:26-27: final failure on the nonexported stamp control, no success marker.
- FINAL directory listing contains inventory.rds but no namespace-paths.tsv or diagnostic.rds. Binary inventory was not decoded or treated as successful proof.
- Negative prewrite/reuse assertions and restoration results are attributed to WORKER:38-45,55-65; those console results were not independently rerun, and separate saved assertion-output logs were not located/read. Code inspection confirms their assertions and the hard-link test-layout consequence.

### Original seven: executed-evidence closure assessment

| Original finding | Testing assessment, limited to executed evidence |
|---|---|
| P1.1 prewrite destinations | Tested-case correction supported: WORKER:57 records eight executed rejection assertions; current recursive/ancestor/hard-link guard is run.ps1:12-38. Not a blanket sandbox certification; assertion outputs are worker-attributed. |
| P1.2 actual installer child | Resolver/startup boundary correction demonstrated by FINAL child-startup.log:2-8 and real missing-dependency log:1-4. Full usable exact-path runtime acceptance remains incomplete; do not close all V2 requirements from these child logs alone. |
| P1.3 snapshot reuse | Tested-case correction supported: WORKER:59 reports populated sources/library rejection and fresh attempts; run.ps1:39-41 rejects existing setup/baseline attempts before writes. Exact-object archive code is setup.R:71-79. No independent archive equality/package source inspection performed here. |
| P2.1 behavioral baseline | RED verified directly; GREEN failed at nonexported control. NOT verified fixed. |
| P2.2 current install provenance | Receipt validation code exists at setup.R:144-164, but stale/incomplete controls and loaded-path capture at :169-180 were not reached. NOT verified fixed. Inventory existence does not close it. |
| P2.3 actual failures | Actual declared-dependency resolver failure directly verified; real redirected/populated boundary assertions reported executed by worker. Original proxy-control defect addressed for these exercised cases, subject to attribution limits. |
| P2.4 caller restoration | `finally` exists at run.ps1:123-128; baseline/prewrite failure comparisons reported passed. Success plus intentional failed-child pair NOT verified because fixture contamination prevented launch. NOT verified fixed. |

### Provenance
No package repository or extracted package source was read in this review; no package SHA refresh required. FINAL/pins.tsv:2-8 and setup.R:16-22 agree on the seven recorded pins (source declarations, not independent runtime certification): stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25; pipfun 0c6a78d9884ed0965a524311537eec2a5095d60b; pipload ff9a81e386a09fb2531c154f63fd2b91521313c6; wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f; dlw 12faa058b521ef511073a7b21b1b1dd7993c9649; pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be; pipdata 13a38280c1eafe7e03a97837cdb57833fbe9d926.

## Gaps
- No independent runtime execution authorized or performed. Negative assertion console outcomes and environment comparisons remain worker-attributed, not independent passes.
- Usable GREEN, loaded namespace paths, stale/incomplete inventory controls and successful/forced-failure child restoration pair remain incomplete. Binary receipts not independently inspected.
- Step 1 correction budget exhausted at 2/2; suggestions require an explicitly revised budget. No further fix or rerun authorized by this review.
- Step 2 diagnostic and all original survey/numerical/storage scenarios remain NOT RUN. No new package-cause runtime confirmation.
- This is one full-route testing-role result, not completion of all ten roles or final light verification. Coordinator owns integration and any required remaining reviews.
- No OS-level write audit or exhaustive third-party compiled-code/hook audit; recorded private-child paths do not prove an OS sandbox.
