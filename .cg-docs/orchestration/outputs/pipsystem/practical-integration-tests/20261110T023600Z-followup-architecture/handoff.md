---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-architecture
status: completed
updated: 2026-11-10T02:38:04Z
owner: cg-architecture
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates full review; implementation stays blocked with exhausted Step 1 budget.
---

# Follow-up architecture review

## Summary
Full architecture review of the requested harness and evidence completed. Two P2 findings; no supported P0/P1 findings in the reviewed surface. Review completion is not implementation acceptance: Step 1 remains blocked after 2/2 corrections, Step 2 NOT RUN. Worker handoff:19-21,67-77,111-112 records this accurately; final setup log:26-27 corroborates its acceptance failure.

Paths below use FINAL = `.tmp/one-survey/20261110T024500Z-followup-correction2`, RED = `.tmp/one-survey/20261110T022500Z-followup-red`, and WORKER = `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T021917Z-followup-implementation/handoff.md`.

## Findings

**[P2]** `experiments/one-survey/setup.R:31-34` -- Runtime acceptance depends on an unavailable package export.

**Issue**: `usable()` calls `stamp::st_extmap_defaults()` as if it were public API. The installed pinned package rejects that access. This couples the harness's generic usability boundary to an incorrect package API assumption, before loaded-namespace paths are captured (:35-38).

**Impact**: Successful installations cannot reach usable-package acceptance, loaded exact-path checks or subsequent stale/incomplete-inventory controls (:160-181). FINAL/logs/setup.log:3-4 records installation exits 0, but :26-27 records the non-exported-object error and halted execution. This blocks follow-up V2/V3 and the sequential diagnostic, not a demonstrated package defect.

**Fix**: On separately authorized correction only, use one small behavior demonstrably exported by the exact pinned stamp snapshot, keeping the namespace/path assertions. Do not change package exports or use internal namespace access to make this harness assumption pass. Rerun the affected acceptance and receipt controls within an explicitly revised budget.

**[P2]** `experiments/one-survey/checks.ps1:31,56-57` -- Boundary fixtures contaminate the runtime they subsequently validate.

**Issue**: The boundary suite stores its benign hard-link target at `$runtime/boundaries/log-target`. The launcher recursively rejects every hard-linked file in that same runtime (`run.ps1:24-34,38`), including this target, even though the rejection test itself used a separate negative-attempt link.

**Impact**: Later `check`, `inspect` and `forced-failure` launches reject before entering a child. This makes the safety-test order affect usable-runtime availability and prevents the intended success/forced-child-failure restoration evidence. WORKER:45,63-65 explicitly records the failed later launch; this review confirms the structural cause, not a newly executed reproduction.

**Fix**: On separately authorized correction only, create future boundary-fixture targets in a fresh sibling fixture directory inside pipsystem, outside the accepted runtime tree. Preserve current evidence and the recursive guard; do not weaken the guard or clean old evidence to obtain a pass. Then demonstrate actual successful and deliberately failed child launches with caller-state comparison.

## Architecture Assessment

- **Minimal separation is appropriate.** `run.ps1:9-117` owns Windows path/environment/bootstrap boundaries and `:119-128` owns child execution/restoration; `setup.R:55-185` owns package setup/receipts/acceptance; `checks.ps1:8-82` owns direct behavioral controls. Files are 128/207/82 lines. No framework, package split, dependency addition or generalized configuration layer is warranted for this bounded experiment.
- **Actual child boundary improved, with executed evidence.** `run.ps1:45-58,90-116` copies R executable/support directories and only Priority base/recommended packages into a fresh private runtime, then appends an audit to the copied base startup profile. This is not a parent-only `.Library` mutation. FINAL/logs/child-startup.log:2-8 records actual installer and lazy-loading child libraries: dedicated E library, contained `00LOCK-*/00new` staging, and private E `r/library`; no ambient C library appears in these observations. FINAL/logs/install-missing-declared-cli.log:1-4 records the real missing-dependency failure. This supports the observed resolver boundary, not arbitrary-code sandbox certification.
- **Terminology matters.** The private default library is base **and recommended**, not literally base-only: `run.ps1:53` selects both priorities; RED/logs/inspect.log:3-31 lists 29 packages and their priorities. This matches WORKER:99 and does not show contributed-package fallback. No misleading base-only claim is attributed to the worker.
- **Freshness/source provenance is structurally bounded.** `run.ps1:38-43` rejects any existing baseline/setup attempt; `setup.R:68-79` checks empty source/library destinations and archives the seven literal SHAs. FINAL/pins.tsv:2-8 agrees with setup.R:16-22. New setup IDs after failures avoid overlays (WORKER:29,36-45). Reviewer did not independently compare extracted bytes to Git objects.
- **Receipt evidence is not runtime acceptance.** `setup.R:133-142` saves current receipts only after both installation exits succeed; `:145-158` checks roots, pins, paths, digests and DONE logs. FINAL/logs/install-stamp.log:13 and install-pipfun.log:15 independently corroborate DONE, but `--no-test-load` is explicit (:58). `usable()` failure prevents final namespace evidence and mutation controls (:160-181); WORKER:60-63 does not overclaim these. FINAL/dependencies.tsv:2-54 records 53 copied dependency versions/origins/destinations/DESCRIPTION digests, not rebuilt dependency source provenance.
- **Diagnostic remains code, not evidence.** `setup.R:186-207` contains a bounded fresh-root diagnostic candidate; WORKER:107 and :120 say NOT RUN. Nothing in retained install success proves the pipaux cause or original survey acceptance. Plan:41,46,73-77 requires the missing evidence before progression.
- **No design change proposed.** This remains an experiment/evidence workspace, not a replacement pipeline orchestrator; no contradiction requiring modification of a Decided item was identified (SYSTEM_DESIGN.md:192,274,319).

## Changes
Only this report created/finalized. No package, Git, harness, runtime, Plan, protected record or other report modified. No fixes made or corrections consumed by this review.

## Checks run
Read charter, SYSTEM_DESIGN, HARVEST_BRIEF, coordination contract, approved Plan, all three requested harness files, WORKER and targeted retained logs/tables listed above. Loaded R technical and technical communication skills before review.

Read-only commands: `git rev-parse HEAD`, `git branch --show-current` returned main/f9454707b292a620e25abef17f2e515794020ba7; `Get-Date -Format o` returned 2026-11-09T21:37:43.1381622-05:00. No setup, R, Pester, tests, diagnostic, installer, fixes or Git writes executed by reviewer. Tool reads, not runtime execution, verified evidence contents.

## Source SHAs

No package repository or extracted package source was read by this reviewer. Source pins below are retained provenance from FINAL/pins.tsv:2-8 and setup.R:16-22, not independently refreshed package HEADs:

| Package | Recorded source SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

## Gaps
- Step 1 remains blocked: usable-package GREEN, final namespace-path proof, stale/incomplete inventory controls and actual success/forced-failure restoration pair remain incomplete. Two authorized corrections exhausted; review is not permission for another correction.
- Step 2 diagnostic and original survey scenario remain NOT RUN. Original Plan gates are not passed by this review.
- Boundary-control success is worker-reported in WORKER:44,57; this reviewer did not rerun those controls or independently inspect every fixture target. The hard-link coupling is directly visible in the reviewed source and acknowledged in the worker evidence.
- No independent binary inventory.rds parsing, source/archive equality check, dependency-byte rebuild/audit, OS-wide write tracing or exhaustive third-party hook/compiled-code audit. E-local library startup observations do not certify all possible external process writes.
- Other full-review roles and final verification are coordinator-owned and not certified here. Recommendations are intentionally limited to the two demonstrated blockers; no new framework, speculative safeguards or dependencies proposed.
