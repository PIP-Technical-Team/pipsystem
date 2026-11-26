---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-performance
status: completed
updated: 2026-11-11T19:09:12Z
owner: performance-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md Phase 2
next: Coordinator combines static reviews with fresh execution evidence and final verification; runtime acceptance remains pending.
---

# One-survey performance review

## Summary
No supported P0-P3 performance findings for the four-row offline example. Full script-route and original Plan Phase 2 reviewed statically; this is not runtime acceptance or a claim that the package path succeeds. Current execution is ongoing.

## Review evidence
- Setup/installation: `experiments/one-survey/setup.R:9-22,105-128,148-191` uses seven explicit archive pins, one dependency traversal with a `seen` set, one copied dependency library and one install per required package. The working-tree diff changes only pipload to `4ef0d90a974cb6ff0725da69373bde421dd04ad5` and pipdata to `c5b27fa4458d7175aca81a203762bae81e9f0b40`; the other five pins are unchanged. Archive construction is local Git, not a download (`setup.R:111-116`). No package repository contents were read by this reviewer.
- Launch/isolation: `run.ps1:13-34,35-91,99-107` and `paths.ps1:1-33` inspect output/copy trees, create private runtime paths and restore caller environment. Recursive inspection, runtime copying and per-dependency PowerShell inspection (`setup.R:162-168`) may dominate setup relative to four data rows; no elapsed-time measurement supports assigning severity. These implement the explicit E-only/isolation requirement, not an avoidable survey computation. No cache, shared library, reduced boundary check or installer framework is proposed.
- Validation/cleaning/storage route: `scenario.R:15-42,56-85,89-145` uses four source rows and two distinct survey IDs/checksums, fixture-only auxiliary tables and transport substitutions around real public package calls. Its small loops are over auxiliary measures, not observations (`109-120`); vectorizing file writes or adding keys/group objects would not materially improve this case.
- Correctness assertions: `scenario.R:128-138` requires successful completed validation, valid/invalid inventory classification and the missing-weight error diagnostic; `148-178` obtains separate actual saved data/metadata version IDs, reads those pins, checks paired daily welfare/person weights and metadata CPI/PPP, and rejects malformed-identity paths in both downstream catalogs. These are appropriate functional assertions, not verified passing results. `collapse::fsum` is already used (`172`); no weighted statistic or estimation optimization is required in this scope.
- Supporting controls and historical diagnosis: `checks.ps1:11-28,30-121` checks actual launcher outcomes/restoration and storage boundaries; `reproduce.R:40-55` is a historical failure reproducer, not an acceptance route. `setup.R:38-56,193-231` verifies usable storage/dependencies and installed paths; its tiny probe objects and receipt loops do not warrant optimization.
- Plan alignment: original Plan `Phase 2:46-61`, testing strategy `63-64`, and exclusions `77-78` call for one end-to-end example plus malformed control, not deflation, mean, scaling certification or another orchestrator. Existing paired assertions, exact-pin readback and downstream checks address that requested surface. A single-version readback does not establish historical selection after a later save, as the Plan itself states (`64`).

No code optimization or additional benchmark is required for this four-row example. If runtime setup proves slow, use the ongoing attempt's existing logs to separate installation/startup time from scenario time before considering any change; no extra run or profiling dependency is recommended now.

## Changes
Only this authorized report created and finalized. No source/package edits, Git mutations, downloads, test runs, installation or runtime changes by this reviewer.

## Checks run
- Loaded technical communication and R technical, analytical, data.table and collapse skills; read local `r-syntax: data.table-collapse`.
- Read project constraints, design, harvest brief, pip-handoff-v2 contract and original Plan in full.
- Static inspection of all six files under `experiments/one-survey/`: setup.R, scenario.R, run.ps1, paths.ps1, reproduce.R and checks.ps1.
- Read-only Git: `git status --short`, `git branch --show-current`, `git rev-parse HEAD`, `git diff -- experiments/one-survey/setup.R`, `git diff --stat -- experiments/one-survey`. Result: existing main at the SHA above; sole script diff is the authorized two-pin substitution. Unrelated dirty reports/state were left untouched.
- Read shared-board review context; coordinator already has separate documentation findings on evidence-mode status and the scenario header. Those are not duplicated as performance findings.
- No R/PowerShell scenario, benchmark, fresh install, package tests or acceptance checks run. No runtime artifacts consumed as new acceptance evidence.

## Gaps
- Fresh execution remains ongoing; numerical results, exact readbacks and malformed downstream exclusion remain unverified by this reviewer. Static assertions do not establish a pass.
- No timings, memory measurements, production-scale claims or full package-internal review. Package behavior at the requested pins is the executing worker's verification surface; installed source/library contents were not inspected here.
- Concurrent changes after the inspected snapshot, including documentation corrections being coordinated, require coordinator reconciliation before final verification. Separate documentation findings are not cleared by this no-performance-findings result.
