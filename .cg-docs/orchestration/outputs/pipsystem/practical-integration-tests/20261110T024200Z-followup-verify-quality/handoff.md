---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T024200Z-followup-verify-quality
status: completed
updated: 2026-11-10T02:43:08Z
owner: cg-code-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator incorporates this role result; implementation remains blocked with no correction budget remaining.
---

# Follow-up LIGHT code-quality verification

## Summary
Completed the requested cg-review mode:verify LIGHT code-quality role against main and the explicit parent review `.cg-docs/reviews/2026-11-09-one-survey-harness-repair-and-diagnosis-review.md` (findings map lines 6-13). Both narrow fixed scopes are supported by source and retained evidence, with limits below. No new actionable P0-P3 or cross-file breakage found in this bounded pass. Five unchanged OPEN findings remain (P0: 0, P1: 3, P2: 2, P3: 0). This is review-role completion, NOT implementation/Plan completion or gate success.

P0/P1 were inspected regardless of fixed status. No file-wide P2/P3 suppression was applied: only explicit fixed-function/block scope would qualify; unchanged P2 issues in other blocks remain reported. Neither two DONE installs nor two narrow fixes close all seven original findings.

## Changes
Only this report created and finalized. No code, package, Git, Plan, parent review or prior handoff changes. No fixes, cleanup, new dependencies or speculative safeguards proposed. All report writes are inside pipsystem on E:.

## Checks run
Read all three scoped files: `experiments/one-survey/run.ps1` (128 lines), `setup.R` (207 lines), `checks.ps1` (82 lines). Read parent full review, worker handoff, charter/config/design/harvest instructions, review command, context-loading and handoff contracts. Loaded R technical, analytical, shared, data.table and collapse skills; no visualization code present. Brain query skill loaded; no local BRAIN*.md found. No external Brain fetch or write-capable query executed.

Read-only terminal identity commands: `git rev-parse --show-toplevel`, `git branch --show-current`, `git rev-parse HEAD` confirmed expected pipsystem/main/f9454707b292a620e25abef17f2e515794020ba7. `Get-Date -Format o` supplied report checkpoint time (2026-11-09 21:43:08 ET / 2026-11-10T02:43:08Z). No setup, R, PowerShell harness, Pester, tests, diagnostic or package commands executed. No write-capable terminal process started, so no temporary/cache/home outputs from such a process.

Retained logs independently read (FINAL = `.tmp/one-survey/20261110T024500Z-followup-correction2`):
- FINAL/logs/child-startup.log:1-8: top-level process and real installer/resolver/lazy-load processes; all reported .libPaths lie in FINAL/library, FINAL/r/library or contained 00LOCK staging.
- FINAL/logs/install-missing-declared-cli.log:1-4: actual declared dependencies unavailable and failed installation removal. This is the retained negative install log, not a synthetic requireNamespace control.
- FINAL/logs/setup.log:1-4: missing-dependency install exit1 then stamp/pipfun exit0; :26-27: non-exported object failure and halt.
- FINAL/logs/install-stamp.log:13 and install-pipfun.log:15: DONE. Missing private R.css warnings at stamp :8-9 / pipfun :10-11 are preserved, not interpreted as success of runtime acceptance.
- `.tmp/one-survey/20261110T022500Z-followup-red/logs/baseline.log:1,8-9`: actual missing pipfun namespace baseline.
- FINAL-populated-sources/sources/sentinel:1 and FINAL-populated-library/library/sentinel:1 both retain `preserve`.

## Fixed-scope verification

### P1.2 — supported, narrowly (not suppressed)
`run.ps1:45-58,90-116,119` copies only base/recommended packages into a private R default library, appends child-startup containment assertions to that private profile, and executes its Rscript. `setup.R:55-60` invokes R.exe from that private R home. The actual child log and missing-declared-dependency log above independently corroborate the replacement of the old parent-only .Library rebinding. Both resolver and lazy-load children are represented, including legitimate 00LOCK staging. No current recurrence of the original ambient-default-library finding was identified. No full loaded namespace audit was reached: `setup.R:35-39,160-180` lies beyond the observed usable() failure. Thus full V2/runtime provenance remains incomplete.

### P1.3 — supported, narrowly (not suppressed)
`run.ps1:3-4,38-40` validates the launcher's RunId and rejects preexisting setup/baseline attempts before `:60-62` creates output. `setup.R:68-78` requires empty source/library roots and extracts exact Git objects into new package directories; `:119-120` refuses existing dependency destinations. Retained setup.log demonstrates a completed fresh extraction/install path. Sentinel files corroborate preservation of populated controls; worker handoff:40,44,59 describes executed reuse rejection. That rejection was not rerun here, and no separate retained boundary transcript was found by the negative-log filename search. Source supports no setup overlay; arbitrary tree byte equality is not certified. Helper RunId safety is a different OPEN block, not covered by P1.3 closure.

## Unchanged OPEN findings

**[P1] P1.1** `experiments/one-survey/checks.ps1:1-6,30-39,48,56-57,62-63` -- Helper writes precede confinement.
**Issue**: Unlike the launcher, the helper accepts an unconstrained RunId, composes fixture paths from it and creates directories/files/links before launcher preflight. Traversal or a redirected existing fixture ancestor can escape intended pipsystem/E-only destinations. Static risk only; no exploit or outside write executed/observed.
**Fix**: On separately authorized correction, validate helper RunId and actual fixture destinations/ancestors before its own first write; use an independently checked E-only fixture root.

**[P1] P1.4** `experiments/one-survey/setup.R:31-34` -- Acceptance calls a non-exported stamp function.
**Issue**: `stamp::st_extmap_defaults()` fails in the retained actual runtime (FINAL/logs/setup.log:26), preventing green acceptance, loaded-path capture and mutation checks. Two installation DONE markers are not usable-runtime acceptance.
**Fix**: On separately authorized correction, choose source-verified exported behavior and rerun the same acceptance; do not patch namespaces or use ::: as a bypass.

**[P1] P1.5** `experiments/one-survey/checks.ps1:31,56-57` -- Negative fixture contaminates the positive runtime.
**Issue**: The retained hard-link peer lives within the runtime subsequently scanned by `run.ps1:24-38`; the guard correctly rejects it. Worker handoff:45,63-65 reports that later success/forced-failure assertions stopped before child execution. Source verifies this causal path; this reviewer did not rerun it.
**Fix**: On separately authorized correction, separate negative fixtures from the positive runtime, preserving existing evidence and link guard behavior.

**[P2] P2.3** `experiments/one-survey/checks.ps1:8-16,39-40,75-76` -- Any exception satisfies expected failure.
**Issue**: Existing-attempt rejection can satisfy a redirect control without exercising link detection; unrelated prelaunch failure can satisfy the intended forced-child failure. No forced-failure child marker is required. Not suppressed: this is outside the two explicit fixed scopes.
**Fix**: Require specific boundary diagnostics and actual intentional child marker/log for the restoration pair, alongside the existing no-write assertions.

**[P2] P2.4** `experiments/one-survey/setup.R:145-148` -- Dependency identity not reconciled.
**Issue**: The verifier requires only a nonempty dependency table, not agreement between recorded package versions/origins/paths/DESCRIPTION digests and the current copied dependency tree or namespaces. The later receipt mutations are unexecuted and do not test dependency reconciliation. Not suppressed: verify() dependency validation is outside the fresh-copy/install-child fixed scopes.
**Fix**: Reconcile the dependency identities needed by this attempt with the current copies/loaded paths; no general validation framework or new dependency is warranted.

## Provenance and status boundaries

No package repository, extracted package source or installed package payload read in this pass. Package SHAs therefore were not independently refreshed; source pins read only from setup.R:16-22 and worker handoff:83-91 are inherited: stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25; pipfun 0c6a78d9884ed0965a524311537eec2a5095d60b; pipload ff9a81e386a09fb2531c154f63fd2b91521313c6; wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f; dlw 12faa058b521ef511073a7b21b1b1dd7993c9649; pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be; pipdata 13a38280c1eafe7e03a97837cdb57833fbe9d926.

Worker handoff:69-77,107,111-112 retains follow-up V1-V3 partial/failed, V4 and reduced diagnosis NOT RUN; Step1 corrections 2/2 exhausted. This role completes only its V5 review contribution, not the complete V5 gate. Original survey V1/V5 remain failed and V2-V4 NOT RUN. No original numerical/storage/invalid-survey/live/incremental success is asserted.

## Gaps
- No execution was permitted; retained logs are historical evidence, not fresh test runs. The independent negative log inspection covers the real declared-dependency failure and baseline; boundary invocation outcomes are attributed to worker handoff plus preserved sentinels, not a fabricated transcript.
- Full namespace paths, dependency-inventory reconciliation, stale/incomplete mutation execution, and success plus forced-child environment-restoration pair remain incomplete. Inventory.rds not executed/deserialized by this reviewer.
- No OS-wide write trace, arbitrary third-party compiled-code audit, source/tree byte comparison or package payload attestation. No outside-E write observed or alleged as observed.
- Five current OPEN findings and original unresolved gates remain; exhausted budget does not authorize corrections or diagnostic execution. Coordinator owns consolidation and any later request for revised authorization. Protected artifacts remain untouched and no destructive recommendations are made.
