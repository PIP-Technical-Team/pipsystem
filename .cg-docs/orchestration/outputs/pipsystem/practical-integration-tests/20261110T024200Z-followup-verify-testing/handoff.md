---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T024200Z-followup-verify-testing
status: completed
updated: 2026-11-10T02:43:18Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates this testing verification; implementation remains blocked with no correction budget.
---

# Follow-up testing verification

## Summary
LIGHT mode:verify testing role complete. Both inherited fixed scopes are supported narrowly: P1.2 actual installer-child ambient fallback and P1.3 fresh setup/no overlay. All five consolidated OPEN findings remain OPEN (P0: 0, P1: 3, P2: 2, P3: 0). No additional actionable P0-P3 or cross-file breakage found in this bounded pass. This is review-role completion, NOT implementation or gate completion.

Parent review: `.cg-docs/reviews/2026-11-09-one-survey-harness-repair-and-diagnosis-review.md:6-19,37-54`. Only explicitly fixed P1.2/P1.3 anchor suppression; P0/P1 and cross-file breakage were not suppressed. Never infer all seven original findings fixed or full runtime namespace provenance from child library paths.

## Changes
Only this exact report created and finalized. No code, package, Git, Plan, parent review, protected artifact or runtime writes. No dependency/framework additions or speculative safeguards proposed. Minimal first: keep corrections limited to demonstrated failures; no correction performed.

## Checks run
Loaded `pl-clear-technical-communication`, `cg-skill-r-testing`, `cg-skill-r-technical`. Read charter/local config, SYSTEM_DESIGN, HARVEST_BRIEF, review and handoff contracts; actual run.ps1/setup.R/checks.ps1; consolidated review; worker handoff; targeted retained logs, pins and dependency records. No scripts, R, setup, Pester, tests, reproducer or diagnosis executed. Read-only terminal command `git branch --show-current; git rev-parse HEAD; Get-Date -Format o` confirmed main and HEAD above, clock 2026-11-09T21:43:18.0519022-05:00. No write-capable command run.

In evidence below FINAL means `.tmp/one-survey/20261110T024500Z-followup-correction2`; WORKER means `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T021917Z-followup-implementation/handoff.md`.

## Fixed-scope verification

### P1.2 — Supported only for actual inspected installer children
- `run.ps1:45-58,90-116` copies R binaries/bootstrap plus only Priority base/recommended packages into the fresh E-local R home, then appends a startup audit/assertion to that private base Rprofile; `:69-84,119` supplies private library/home settings before launching Rscript. This replaces parent-only .Library mutation.
- `FINAL/logs/child-startup.log:2-8` directly records actual tools:::.install_packages resolver children and stamp/pipfun lazy-load children. Paths are FINAL/library and FINAL/r/library, with contained FINAL/library/00LOCK-*/00new staging. It is not just a synthetic child or a parent-side .libPaths observation.
- `setup.R:88-96` invokes the real pinned stamp installation before contributed copies. `FINAL/logs/install-missing-declared-cli.log:1-4` records real unavailable declared dependencies cli/fs/rlang/secretbase/jsonlite/data.table/nanoparquet/qs2 and removal of the failed stamp target. `FINAL/logs/setup.log:1-4` then records two successful installation commands after copies; `install-stamp.log:13` and `install-pipfun.log:15` contain DONE.
- Scope limit: installation uses `--no-test-load` (`setup.R:58`). Startup library search roots do not prove every loaded namespace/payload or arbitrary third-party write behavior. Final usable acceptance stopped before loaded-namespace output. Full V2 is NOT passed.

### P1.3 — Supported for fresh setup/no-overlay boundary
- `run.ps1:38-44` checks the existing runtime tree and rejects every preexisting baseline/setup attempt before directory creation at `:60-62`. `setup.R:68-78` requires empty source/library roots and extracts exact Git objects into new package directories. Dependency copies refuse existing destinations at `:119-120`.
- `checks.ps1:44-51` provides populated source/library controls with sentinel preservation and no temp creation. Executed outcomes are attributed to WORKER:40,44,59, not rerun here. WORKER:29,41-43 documents distinct fresh setup attempts; final source/lib installation paths corroborate the final attempt.
- Expected-exception identity remains too broad (OPEN P2.3); this limits behavioral-control attribution but does not undo the direct preexisting-attempt rejection/no-overlay source boundary. It is not independent archive-byte equality or an OS write audit.

## Unchanged OPEN findings

**[P1]** `experiments/one-survey/checks.ps1:1-6,30-39` -- P1.1: helper bypasses prewrite confinement.
**Issue**: RunId has no ValidatePattern here; boundaries creates testRoot/destinations and fixtures before launcher validation. Traversal or a redirected ancestor can route helper writes outside the allowed root. This is a static risk, not an executed exploit or observed C: write.
**Fix**: In separately authorized correction, validate RunId and actual destinations before the helper's own writes; use a checked E-only fixture root. No change made.

**[P1]** `experiments/one-survey/setup.R:31-34` -- P1.4: unusable exported-behavior gate.
**Issue**: `stamp::st_extmap_defaults()` stops acceptance. `FINAL/logs/setup.log:26-27` directly confirms the non-exported-object failure after two successful install exits; this is not pipaux diagnosis. Loaded paths `:35-38`, exact-path assertions `:160-163`, and stale-receipt controls `:169-177` are not reached successfully.
**Fix**: Use source-verified exported behavior and rerun acceptance only under revised correction authorization; do not use ::: or alter the package.

**[P1]** `experiments/one-survey/checks.ps1:31,56-57` -- P1.5: negative fixture poisons later positive runtime scan.
**Issue**: Hard-link target stays in FINAL/boundaries; `run.ps1:24-38` correctly rejects linked files on subsequent launches. WORKER:45,63-65 attributes the observed pre-child rejection. It prevents success/forced-child evidence and is cross-file breakage, not suppressed.
**Fix**: Keep benign negative targets in a separately checked fixture root outside the selected positive runtime, preserving evidence and the link guard; correction not authorized here.

**[P2]** `experiments/one-survey/checks.ps1:8-16,39-40,75-76` -- P2.3: any exception can satisfy expected failure.
**Issue**: No diagnostic/child identity assertion distinguishes recursive-link rejection from existing-attempt rejection or intentional R failure. No-write/sentinel checks are useful but do not identify the rejecting boundary. Do not count prelaunch failure as a forced R child result.
**Fix**: Require boundary-specific diagnostics and actual child marker/log evidence for the restoration pair, alongside existing no-write assertions, in any separately authorized correction.

**[P2]** `experiments/one-survey/setup.R:145-148` -- P2.4: dependency inventory not bound to current copies.
**Issue**: Verification merely requires nonempty dependencies, unlike explicit project-package receipt checks. `FINAL/dependencies.tsv:2-54` records 53 versions/origins/destinations/DESCRIPTION digests, but verify never reconciles them to current copied dependency identities. Writing this table is not validation.
**Fix**: Validate this attempt's specific recorded dependency identities against current copies; no general schema/checksum framework is warranted or added.

## Failed gates and original-finding limits
- Behavioral RED is directly retained: `.tmp/one-survey/20261110T022500Z-followup-red/logs/baseline.log:1,8-9` fails actual pipfun namespace loading. GREEN remains failed at FINAL/logs/setup.log:26. Original P2.1 is NOT closed by RED alone.
- Current project receipts are implemented at setup.R:132-158, but stale/incomplete receipt mutation checks and full loaded exact paths at :160-180 did not complete. Original P2.2 remains open/unverified; current dependency-identity defect reinforces that limit. Binary inventory.rds was not deserialized in this review.
- Real missing-dependency failure supports progress on original P2.3, not all negative-control correctness. Original P2.4 caller restoration has baseline/prewrite failure observations (WORKER:38,63); success plus intentional forced-child pair remains incomplete (WORKER:45,47,63-65).
- Follow-up V1/V2/V3 remain PARTIAL/failed; V4 and step 2 diagnosis NOT RUN (WORKER:69-77). Step-1 corrections 2/2 exhausted, zero remaining (WORKER:111-112). This verification does not reset budget or satisfy runtime gates.
- Original V1/V5 remain failed; original V2-V4 NOT RUN (WORKER:77). Historical `.tmp/one-survey/logs/install-pipaux.log:7-11` still records original ENOENT clean_survey_data lazy-load failure. No new reduced diagnostic, numerical, storage or malformed-survey result is claimed.

## Provenance
No package repository or package source file was read in this verification. Retained `FINAL/pins.tsv:2-8` and setup.R:16-22 agree on recorded source pins (not independently refreshed package HEADs or full installed provenance):
- stamp: 95890411e8bf9db842593c2b0ab68ec4f2a66b25
- pipfun: 0c6a78d9884ed0965a524311537eec2a5095d60b
- pipload: ff9a81e386a09fb2531c154f63fd2b91521313c6
- wbpip: fd2c687ed527ebe33d0a7addf9859f72f71ff39f
- dlw: 12faa058b521ef511073a7b21b1b1dd7993c9649
- pipaux: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
- pipdata: 13a38280c1eafe7e03a97837cdb57833fbe9d926

## Gaps
- Read-only verification and inherited worker evidence, not a runtime rerun. Boundary/restoration outcomes rely on explicitly attributed WORKER observations; no independent transcript of those direct assertions was reconstructed.
- Full loaded namespace provenance, stale/incomplete receipt rejection and successful/intentional-failure restoration pair remain missing. No exhaustive third-party hook/compiled-code or OS write audit; no observed outside-E write alleged.
- Step 1 remains blocked after 2/2 corrections; no diagnosis or further fix authorized. Five OPEN consolidated defects are not waived; two narrow fixed scopes do not complete the seven original findings.
- Review role completed only; coordinator owns combined final verification and any decision request for a revised budget. No protected artifact deletion/replacement/rename/move recommended.
