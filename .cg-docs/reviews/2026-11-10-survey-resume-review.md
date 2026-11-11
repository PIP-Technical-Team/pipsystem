---
date: 2026-11-10
depth: full
type: standard
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
findings:
  P2.1: fixed
  P3.1: fixed
---

# Survey Resumption Full Review

## Result
Full route completed across all ten required roles. Two supported harness findings, both fixed: P0 0, P1 0, P2 1, P3 1; no skipped findings or accepted exceptions. This is source/evidence review completion, NOT original Plan completion. Real cleaning is blocked by a reproduced pinned-package fresh-master failure. V1 passes in the corrected runtime; V2 and V4 are partial; V3 not reached; final verify follows separately. No P0/P1 strength was downgraded or suppressed.

## Scope And Routing
Original reviewed revision 1 Plan; whole-plan resumption, review:auto, deviate:auto. Security-risk install/write paths resolve to full; the Plan also explicitly requires all ten roles. Survey welfare/weights and reproducibility are mandatory focus. No model, effort, environment or Git settings changed. Excluded unrelated and concurrent work remains untouched.

Reviewed experiment files: `setup.R`, `run.ps1`, `paths.ps1`, `checks.ps1`, actual `scenario.R`, and public-call `reproduce.R`. Initial subset-only reviews were marked partial; architecture, quality, reproducibility, performance and adversarial were later re-invoked on actual scenario source. Quality/testing additionally inspected the native-dependency correction. Coordinator inspected current reproducer and readable output; reviewers do not claim independent reruns.

## Findings

### [P2.1] Initial usability criterion omitted required QS2 storage
**Fixed; safe_auto.** Initial seven namespace loads and stamp hashing did not test the optional storage namespace used by the scenario. Preserved `resume-20261110-full/logs/reproduce.log:27-49` shows no-version storage fallback; the actual namespace probe shows copied stringfish.dll could not load. The exact missing native module is UNKNOWN, not proved merely by imports. Final 285-line `setup.R:25-30,42-45,151-172,208-211` selects three compatible existing installed dependency origins, binds their provenance and requires a real QS2 save/read exact equality before setup acceptance. Fresh `resume-20261110-correction1/logs/setup.log:126` reaches acceptance after that gate; `dependencies.tsv:10-12` records RcppParallel 6.2.0, stringfish 0.19.2 and qs2 0.2.2 from existing 4.5-pipapi. Quality/testing independently inspected this source and retained evidence. Original failure preserved; no download, package edit or ecosystem-pin change. Initial phase completion was revoked and reinstated only after corrected execution evidence.

### [P3.1] Diagnostic wording overstated missing installation
**Fixed; safe_auto.** Initial setup diagnostic still said no pipaux install despite seven required installed namespaces. Final 285-line `setup.R:277` says `NOT RUN in diagnostic mode: survey, storage or numeric scenario`. Worker had corrected this before parent's leave-line instruction arrived; no duplicate fix counted. Quality/documentation reviewed the correction. Earlier role checkpoints cite their explicitly recorded 256/272-line snapshots; these final references include the later evidence-rendering block.

## Executed Evidence
Fresh corrected runtime: `.tmp/one-survey/resume-20261110-correction1/`.
- Seven exact Git archive source installs, all seven usable private paths, 107 copied dependencies with provenance, actual QS2 roundtrip, explicit R 4.5.2 and installed versions/paths.
- Real absent-package red baseline retained separately; real missing-declared-dependency install failure, five stale/incomplete inventory controls, ten unsafe/redirected/reused-root controls.
- `logs/outer-green.log:119-129`: actual intentional R-child failure, plus assertions restoring all process environment keys and error preference after success and failure.
- Public acquisition and validation complete with one valid SYNA, one completed-invalid SYNB, zero validation execution failures (`logs/scenario.log:103-160`). Separate validation report/inventory receipt versions `03ddb471b4d2dc93` and `e36551f8882dfe08` are NOT clean-data/metadata readback evidence.
- `logs/evidence.log` renders the specific `weight variable should be in the data` diagnostic. Fresh SYNB identity and distinct checksum avoid no-work/cache vacuity.
- Public clean wrapper fails before formatting: `first-failure.txt:1-2`, `logs/scenario.log:255-258`. Separate fresh-store public-call reproducer repeats that failure and confirms zero master versions (`logs/reproduce.log:1-16`).

## Package Blocker And Owner
`pipdata` at `13a38280c1eafe7e03a97837cdb57833fbe9d926`, `R/pd_process_data.R:108-120`, unconditionally calls `pipload::load_pip_master_inventory()` before forwarding `bootstrap = TRUE` to execution preparation. Pinned pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6`, `R/load_pip_data.R:327-360`, propagates the absent artifact read. Actual error: `No version files found in 'pip_master_inventory.qs2'.`

Owner direction: pipdata package session should diagnose/fix trustworthy empty first-run master handling without masking arbitrary read errors or fabricating a populated master in the example. Package changes and any corrected source-pin substitution require that separate authorized package stage. No package patch or internal-worker bypass occurred here. This external package-path blocker remains unresolved, not a skipped harness finding.

## Review Sources
Under `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T223242Z-survey-resume/`:
- `review-quality/handoff.md`: original P3 and correction1 current-source/evidence review.
- `review-testing/handoff.md`: actual checks, scenario assertions and correction1 QS2/provenance review.
- `review-documentation/handoff.md`: substitutions, original-vs-diagnostic distinctions and factual correction.
- `review-version-control/handoff.md`: initial/final inspected Git/ignore/preservation boundary.
- `review-reproducibility/handoff.md`: exact archives, child paths, versions, scenario and initial reproducer scope.
- `review-performance/handoff.md`: actual bounded four-row scenario, no material supported issues.
- `review-architecture/handoff.md`: actual documented public route, no internal-worker bypass or extra orchestrator.
- `review-data-quality/handoff.md`: current classification evidence and explicit partial V4 interpretation.
- `review-learnings/handoff.md`: relevant historical lessons only.
- `review-adversarial/handoff.md`: actual setup/scenario source and blocked runtime, no supported exploitable findings.

Incremental coordinator history is retained in `.cg-docs/reviews/2026-11-10-installed-package-one-survey-example-resume-review.md`. Implementation report `implementation/handoff.md` records final source state, all pins, statuses and conservative correction accounting. This final consolidation is the parent artifact for mode:verify.

## Budget And Limits
Conservative final step 1 count: 2/2 corrective edits (wording and storage-dependency suitability), one fresh functional reinstall correction. Step 2 count: 0/2; stopped on first actual pinned-package path blocker, not an exhausted harness budget. No second setup correction is assumed available. Earlier failure evidence and budgets preserved.

PowerShell syntax parsing and tracked `git diff --check` passed. Problems API/get_errors and execution_subagent unavailable; no diagnostics or Pester execution fabricated. No standard Pester suite applies to these functional R/PowerShell example scripts. Evidence assertions/print calls are intentional, not debug leftovers; no new public package API/import dependency introduced. No added TODO/FIXME or hardcoded credentials identified in inspected scripts. Absolute E roots and full SHAs are deliberate isolated-experiment constraints.

## Gaps
V2 is partial: real validation complete, clean/metadata attempted but fails. V3 paired daily welfare/weights and actual exact clean/meta version reads have not executed. V4 classification and missing-weight diagnostic are proven, but downstream rejection cannot be certified from empty catalogs when the clean wrapper itself fails. No original Plan completion, phase 2 completion, roadmap done, accepted exception or clean scenario pass. No exhaustive OS write trace, live DLW, production, deflation/mean, incremental certification or historical selection after a later save. Final light verification is pending; a clean source review cannot clear the package blocker.
