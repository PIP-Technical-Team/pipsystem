---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-adversarial
status: completed
updated: 2026-11-11T19:12:28Z
owner: cg-adversarial
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Coordinator consolidates manual P1 package boundary and final verification; Phase 2 remains blocked.
---

# Phase 2 adversarial review

## Summary
Adversarial review complete: one confirmed P1 manual package-integration blocker; no additional supported P0/P1/P2 harness or isolation findings. This is NOT Phase 2 acceptance. Fresh n11 evidence supports completed valid/invalid validation, but cleaning aborts before annual-to-daily assertions, exact data/metadata readbacks, and downstream rejection certification. No runtime or package changes were performed by this reviewer.

## Findings

- **[P1.1]** [cg-adversarial] `pipdata/R/pd_process_data.R`:119 — Public cleaning wrapper reads release options that public release setup never initializes [manual]
  **Attack vector**: Use a fresh process, call documented `pipfun::setup_working_release("20260401", "TEST", verbose = FALSE)`, then `pipdata::pd_process_data(inv = inv, bootstrap = TRUE, verbose = FALSE)` with the genuinely completed valid inventory. No manual options, fake master, or internal worker are used.
  **Impact**: Every such clean public path stops at context construction before cleaning, metadata generation and exact saved-version readback. The fresh-master fix reveals this next blocker; it does not deliver a working clean example. This is a reproducible functional P1, not a claimed security issue or a newly introduced context regression.
  **Proof**: At pipdata SHA `c5b27fa4458d7175aca81a203762bae81e9f0b40`, `R/pd_process_data.R:117-124` loads the bootstrap master then invokes `pd_dependency_context()`. `R/dependency_contract.R:266-273` defaults to `getOption("pipfun.working_release")` and `getOption("pipfun.identity")`, aborting on NULL. At retained pipfun SHA `7d534516a8c17c33d537681610eccd4c29211762`, `R/working_release.R:121-126,154-158` instead persists the working release in `.pipenv$wrk_release`. The fresh n11 `logs/reproduce.log:1-18,27-33` shows setup returned release `20260401` / identity `TEST`, both queried options remained NULL, and the public wrapper raised `pipdata_dependency_context_error`: `A single working release and identity are required.` Original scenario agrees at `logs/scenario.log:255-258`. Minimal reproducer is `experiments/one-survey/reproduce.R:40-67`; this reviewer inspected, not executed, it.
  **Fix**: Package owner should reconcile pipdata context construction with the working release established by the supported pipfun public setup/accessor (`pipfun::get_wrk_release()`, `R/working_release.R:315-329`), retaining scalar release/identity checks and existing alias roots. Add one functional check through public setup and wrapper with options initially unset. Do not seed private context options in the example, construct fake inventory history, switch to internal workers, or weaken acceptance. A package repair and new pin require separate authorization; no fix applied here.

## Changes
Created and finalized only this requested handoff. No script, package, source, configuration, protected artifact, Git index or branch changes by this reviewer; no installs, downloads, R executions or reruns. Read-only Git commands were used.

## Checks run
- Read project constraints, handoff contract, original Plan revision 1 (especially Phase 2:46-61 and completion contract:88-114), and all six example scripts.
- Inspected pipsystem status/branch/HEAD and authorized setup pin diff: existing main, HEAD `e9c71e3190f1ce88a017ae25af7c373a64c655a2`. Later script deltas are the known evidence-mode/header corrections and updated reproducer, not reviewer edits.
- Inspected fresh n11 `pins.tsv:1-8`, `installed-packages.tsv:1-8`, `dependencies.tsv`, `logs/setup.log:1-9`, `logs/check.log`, `logs/repository-status.txt`, `logs/child-startup.log:1-28`, `logs/scenario.log`, `logs/evidence.log`, and `logs/reproduce.log`. The inventory RDS was not independently decoded; setup/verify source plus its fresh textual logs and TSV exports are the review evidence, not a new execution.
- Fresh exact seven pins declared and installed: stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; pipfun `7d534516a8c17c33d537681610eccd4c29211762`; pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5`; wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`; pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`; pipdata `c5b27fa4458d7175aca81a203762bae81e9f0b40`. Package source actually read for this review: archived pipdata and pipfun at those recorded SHAs; also read-only `git show`/diff of the authorized pipdata commit. No other package source reviewed.
- False-pass challenge: validation is not inferred from `outcome = success` alone. `scenario.R:128-138` requires one correct valid row, one distinct invalid identity, zero failed validation executions and the exact missing-weight diagnostic. n11 `logs/evidence.log:1-37` records these outcomes; `logs/scenario.log:159-160` has an empty validation failure table. Validating SYNB does not itself prove downstream rejection.
- Public-path challenge: `scenario.R:89,124-125,143-158` uses public release setup, DLW processing, clean wrapper and separate exact saved data/meta pins. Actual real failure remains fatal (`scenario.R:181-187`); there is no fabricated master, internal-cleaning bypass or acceptance marker emitted on this path. `reproduce.R:63-68` explicitly asserts the error rather than calling it acceptance.
- Numerical/readback challenge: `scenario.R:162-178` compares paired welfare/weights, metadata values and independently obtained data/metadata pins, and queries bad-identity absence. None of these assertions ran in n11. BEFORE catalog counts `0 0` at `logs/evidence.log:161` are baseline evidence only, not successful malformed-input downstream rejection.
- Isolation challenge: `run.ps1:11-19,35-64,74-90,99-108` guards checkout/reuse, establishes E-only private temp/home/config/cache/runtime/library/store before R, logs child library paths and restores the caller environment. `paths.ps1:1-33` rejects ancestor/recursive reparse points and hard links. `setup.R:115-126` uses exact Git archives, so dirty working-tree files in repository-status.txt are not installed-source contamination. Actual child-startup paths are under n11, including installer staging. No supported direct/indirect C-write escape was established; this is not OS-level file-write tracing.
- Known P2 failure-only evidence mode and P3 old header: current `setup.R:70-84` now branches on acceptance evidence and current `scenario.R:1` refers to the current pin. At this review snapshot, `logs/evidence.log:161-163` still contains the old failure wording; executed evidence-only correction confirmation remains coordinator/worker work. They are not duplicated as new findings.
- Shared material package-boundary findings with coordinator; read relevant board updates before final consolidation. No additional execution or dependencies were needed (Minimal first).

## Gaps
- Phase 2 remains blocked by P1.1. Annual-to-daily row-aligned values, exact data and metadata readbacks, and no downstream artifacts after completed malformed-control processing are NOT certified.
- Fresh logs substantiate the installed set; this static adversarial review did not reproduce installs, decode binary RDS evidence, trace every OS write, or certify production/shared/remote behavior.
- Evidence-mode/header corrections are source-inspected, not independently executed here; coordinator must use the worker's refreshed evidence-only check and final verification, without rerunning past the broken package boundary.
- Context mismatch predates the narrow fresh-master commit; it is a blocker in the authorized new installed combination, not evidence that c5b27fa introduced it. No broader package audit or unapproved changes are proposed.
- No new safeguards, dependencies, framework, roadmap/design changes or protected-file removals recommended. Package repair remains outside this review's authorization.
