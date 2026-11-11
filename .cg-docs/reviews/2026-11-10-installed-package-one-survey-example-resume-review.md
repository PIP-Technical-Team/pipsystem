---
date: 2026-11-10
depth: full
type: standard
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
findings:
  P2.1: fixed
  P3.1: fixed
---

# Original Survey Resumption Full Review

## Status
All ten required full-route roles dispatched. Initial setup-only reviews were explicitly partial; architecture, code quality, reproducibility, performance and adversarial roles were subsequently given the actual scenario for additional source review. This report is an incremental checkpoint, not original Plan clearance. No P0/P1 finding has been downgraded or suppressed.

Auto-routing resolves to full: installation/write-path isolation is a security-risk trigger, and the approved Plan explicitly requires all ten roles. Survey welfare/weights and reproducibility receive mandatory emphasis. No model or effort setting was changed.

## Findings

### [P2.1] Initial usability criterion did not exercise required storage dependency
**Fixed; safe_auto, correction 1.** Coordinator evidence review: initial `setup.R` usable criterion loaded the seven required package namespaces and exercised stamp hashing, but never loaded the QS2 storage dependency that the original scenario requires. `.tmp/one-survey/resume-20261110-full/logs/reproduce.log:27-49` shows real storage returned no metadata/version because qs2 was unavailable; the dependency probe narrows this to copied stringfish.dll loading. Seven package installs and copied DESCRIPTION provenance therefore overstated V1 suitability. Current `setup.R:25-30,42-45,138-159,195-198` selects compatible preinstalled copies with bound provenance and executes an actual QS2 write/read acceptance before setup acceptance. Fresh `.tmp/one-survey/resume-20261110-correction1/logs/setup.log:126` reaches acceptance after that check; quality and testing reviewers inspected source/evidence. This is one functional check of an actual required operation, not a speculative safeguard or package change. Worker had already begun the authorized targeted correction when this coordinator finding was consolidated.

### [P3.1] Diagnostic wording no longer matches installation scope
**Fixed; safe_auto.** Initial `setup.R` diagnostic string said no pipaux installation, despite the full-seven installed namespace criterion. Worker had already changed it during the metadata edit before the parent instruction to leave it for parent arrived. Current `experiments/one-survey/setup.R:248` says `NOT RUN in diagnostic mode: survey, storage or numeric scenario`. Code-quality and documentation reviewers inspected the correction. No second edit or extra functional correction is credited for the same finding.

## Runtime Blocker
The fresh scenario stopped at `pipdata::dlw_gmd_list()` with `The intended acquisition inventory could not be verified durably.` See `.tmp/one-survey/resume-20261110-full/first-failure.txt:1-2` and `logs/scenario.log`. Validation, cleaning, malformed classification and numeric/exact-version readback did not run. This is not rejection, no-work success or a passed scenario. A separate minimal public-call reproducer also fails; its direct storage diagnostic reports qs2 is required despite recorded copying of qs2. Exact dependency-usability cause is still being diagnosed; no pipdata package defect is yet established. V1 suitability must be reassessed against that evidence; seven top-level namespace loads alone are insufficient for the actual storage path.

## Review Sources
All role handoffs are under `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T223242Z-survey-resume/`:
- `review-quality/handoff.md`: one P3 fixed, no new supported findings after actual scenario review.
- `review-testing/handoff.md`: fresh checks and actual scenario source inspected; runtime blocker retained.
- `review-documentation/handoff.md`: truthful scope/substitutions/oracles, P3 correction verified.
- `review-version-control/handoff.md`: initial Git/ignore/preservation boundary; coordinator performs final status check.
- `review-reproducibility/handoff.md`: exact archives, dependency provenance, child paths, explicit R/package versions and final scenario/reproducer review.
- `review-performance/handoff.md`: bounded setup and four-row actual scenario, no supported material performance issues.
- `review-architecture/handoff.md`: actual documented public path and external-only substitutions, no new orchestrator/internal-worker bypass.
- `review-data-quality/handoff.md`: actual paired welfare/weight and exact saved artifact pin assertions, no runtime V3/V4 pass.
- `review-learnings/handoff.md`: relevant historical lessons, not current execution certification.
- `review-adversarial/handoff.md`: actual setup/scenario inspection, no supported exploitable finding; blocked runtime and attribution limits retained.

## Checks And Limits
Reviewers read retained execution logs; they did not independently rerun functional tests. Coordinator read setup/pins/session/package-version/outer-restoration logs, actual scenario source and failure/reproducer logs. PowerShell syntax parsing passed for launcher/path/check scripts; `git diff --check` passed with LF/CRLF notices only. No Problems API or execution_subagent is exposed, and no direct Pester execution is substituted. No functional evidence is inferred from source alone.

## Gaps
First-failure root cause and final owner direction pending worker diagnosis. V2-V4 remain blocked/unexecuted. V1 dependency usability is conditional on that diagnosis; setup namespace/provenance checks are not storage acceptance. Final mode:verify and consolidated exit evidence pending. No live DLW, deflation, mean, incremental certification, historical selection after a later save or OS-wide write trace is claimed.

## Dependency Diagnosis Checkpoint
Actual qs2 namespace loading fails while loading copied stringfish.dll; native imports require tbb.dll/RcppParallel.dll. Suitable preinstalled qs2/stringfish/RcppParallel copies are available in a separate existing E: library. Worker is applying step 1 harness correction attempt 1: explicit three-package source origins with provenance, real QS2 write/read acceptance, and a new complete runtime. No downloads, ecosystem pin changes or package patch. V1/phase 1 completion was revoked while reassessed. Initial failure and reproducer remain distinct preserved evidence, not a discovered pipdata defect. Changed setup must receive final testing/quality verification after execution stabilizes.

### Correction 1 Result
Fresh seven-source setup, real QS2 roundtrip, check and caller restoration passed in `resume-20261110-correction1`; phase 1 completion reinstated after coordinator artifact reads, and P2.1 marked fixed. Real public acquisition and validation now complete: two rows, SYNA valid, SYNB invalid, zero validation execution failures (`logs/scenario.log:103-160`). Missing-weight-specific diagnostic assertion executed before next boundary. Then `pipdata::pd_process_data(inv = inv, bootstrap = TRUE)` fails because no version exists for `pip_master_inventory.qs2` (`:255-258`, `first-failure.txt:1-2`). Worker is preparing the minimal package-boundary reproducer. No internal worker, fabricated master inventory, package patch or weaker assertion was used. V2 remains partial, V3 not run, V4 classification component proven but clean/no-downstream transition not certified. Phase 2 and original Plan remain active/blocked; final verify still required.
