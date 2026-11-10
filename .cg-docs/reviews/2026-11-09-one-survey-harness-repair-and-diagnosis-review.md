---
date: 2026-11-09
depth: full
type: standard
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
findings:
  P1.1: open
  P1.2: fixed
  P1.3: fixed
  P1.4: open
  P1.5: open
  P2.3: open
  P2.4: open
---

# Follow-Up Full Execution Review

## Status
All ten required roles completed usable file-based reports. Five current OPEN findings (P0:0, P1:3, P2:2, P3:0); two inherited P1 boundaries narrowly fixed. Highest supported severity is retained on deduplication: adversarial P1 for acceptance/fixture blockers is not weakened by other roles' P2. Not a passed gate. Step1 blocked after two allowed corrections; step2 NOT RUN. Original survey Plan remains blocked. Two narrow fixed scopes do not complete all seven original findings.

## Open Findings
### [P1.1] Test helper writes outside the launcher's preflight
**Open, manual.** `experiments/one-survey/checks.ps1:1-6,30-39,48,56-57,62-63` accepts unvalidated RunId and creates fixtures before any launcher check. Traversal can escape the intended runtime root; a redirected fixture ancestor can direct writes outside pipsystem/E:. No exploit/outside write was executed or observed by review. Apply the same actual-destination confinement before helper writes; validate RunId and put benign fixtures in a separately checked E-only root. Original P1.1 cannot be closed for the complete harness while this entry point remains unsafe. Source: adversarial.

### [P1.4] Usable-package acceptance invokes a non-exported function
**Open, safe_auto recommendation; correction budget exhausted.** `setup.R:31-34` calls `stamp::st_extmap_defaults()`, not exported at the pinned stamp SHA. Final `logs/setup.log:26` confirms the actual stop after two DONE installation commands. Choose source-verified exported behavior and rerun the same acceptance; no package change or ::: workaround. This is a harness defect, not a new pipaux failure. Sources: quality, testing, architecture, reproducibility and data quality.

### [P1.5] Boundary fixtures poison the accepted runtime
**Open, safe_auto recommendation; correction budget exhausted.** `checks.ps1:31,56-57` leaves a hard-link target in the runtime subsequently scanned by `run.ps1:24-38`. The guard correctly rejects it; the test layout prevents later positive/forced-child checks. Isolate benign negative fixtures outside the selected positive runtime while preserving all old evidence; don't weaken the link guard. Worker handoff:45,63-65 reports the observed rejection. Sources: quality, testing, architecture, reproducibility and data quality.

### [P2.3] Expected-error helper does not identify the exercised boundary
**Open, safe_auto recommendation; correction budget exhausted.** `checks.ps1:8-16,39-40,75-76` accepts any exception as expected failure. An existing-attempt rejection can satisfy a redirected-target test, and an unrelated prelaunch failure can satisfy the supposed intentional child failure. Require boundary-specific diagnostics and actual child markers/logs for the restoration pair, along with no-write assertions. Do not count launcher rejection as a forced R child result. Sources: testing and data quality.

### [P2.4] Dependency inventory is not checked against the current copy
**Open, safe_auto recommendation; correction budget exhausted.** `setup.R:145-148` only requires a nonempty dependency table; recorded versions/origins/paths/DESCRIPTION digests are not reconciled to the copied dependency tree or loaded namespaces. A partial/stale record can later pass. Validate the specific recorded dependency identity needed by this attempt, without a general schema/checksum framework. The existing loaded-path/receipt mutation checks were not reached and do not prove closure. Source: data quality.

## Narrow Fixed Scopes For Final Verification
### [P1.2] Actual installer-child ambient fallback
**Fixed for the inspected child boundary; full V2 still incomplete.** Launcher copies installed R with only 29 base/recommended packages into the fresh attempt; real installation children use that private default .Library. Final `logs/child-startup.log:2-8` records actual resolver/lazy-load paths under dedicated/private libraries and contained 00LOCK staging. `logs/install-missing-declared-cli.log:1` confirms real declared dependencies are absent before copies; final stamp/pipfun install commands exit0 afterward. This replaces the old parent-only rebinding mechanism. No fresh loaded namespace inventory was captured, so do not extend closure to whole-runtime or original-Plan success.

### [P1.3] Source/library overlay reuse
**Fixed for the fresh setup/reuse boundary.** `run.ps1:38-40` rejects preexisting baseline/setup attempts before new output creation; `setup.R:68-78` extracts exact objects only into new sources and `:119-120` refuses existing dependency destinations. Executed fresh setup attempts and populated-source/library controls support no overlay. Preserve old attempts; no cleanup is required to make a new attempt work.

## Original Seven-Finding Status
IDs here refer to the original review, not similarly numbered new findings above. Prior reports are not rewritten.
| Original ID | Current Status |
|---|---|
| P1.1 actual pre-write confinement | open overall: launcher improved, test helper has unguarded writes |
| P1.2 installation-child fallback | narrowly fixed by actual private-runtime child evidence |
| P1.3 source overlay reuse | fixed at fresh setup/reuse boundary |
| P2.1 behavioral baseline | red demonstrated; green blocked by current P1.4 |
| P2.2 current provenance | open/unverified; mutation and exact loaded-path checks not reached; dependency reconciliation incomplete |
| P2.3 real negative controls | real dependency failure demonstrated; helper error identity still too broad |
| P2.4 caller restoration | failure/prewrite observations exist; success plus forced-child pair incomplete |

## Evidence And Budget
Worker report: `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T021917Z-followup-implementation/handoff.md`. Final runtime: `.tmp/one-survey/20261110T024500Z-followup-correction2/`; labels identify attempts, not observed execution times. Eight harness/assertion invocations, five top-level R starts and five installation attempts. Real missing-dependency failures, staging-audit failure and two DONE installs are distinct from usable acceptance. Step1 corrections2/2, step2 0/2; no review-driven functional changes, budget resets or diagnosis. Zero accepted exceptions.

All seven exact original SHAs and 53 dependency version/origin records are in the worker report/current runtime. No package repo edits, downloads, namespace patches, Git mutations or original survey execution. Private-copy cost ~137MB per fresh runtime is bounded; no optimization/framework recommended.

## Role Reports
Under `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/`:
- `20261110T022000Z-followup-learnings/handoff.md`: completed historical research; no current implementation inspected.
- `20261110T023600Z-followup-quality/handoff.md`: non-exported control and fixture contamination.
- `20261110T023600Z-followup-testing/handoff.md`: same blockers plus error-identity gap.
- `20261110T023600Z-followup-documentation/handoff.md`: no new issues; blocked claims accurate.
- `20261110T023600Z-followup-version-control/handoff.md`: no role-specific issues; source pins/dirt exclusion/ignore boundaries checked.
- `20261110T023600Z-followup-reproducibility/handoff.md`: child progress supported, two acceptance blockers.
- `20261110T023600Z-followup-performance/handoff.md`: no meaningful performance findings for bounded private copy.
- `20261110T023600Z-followup-architecture/handoff.md`: two acceptance/test-layout blockers; child boundary improved.
- `20261110T023600Z-followup-data-quality/handoff.md`: control blockers, dependency identity and expected-error gaps.
- `20261110T023600Z-followup-adversarial/handoff.md`: helper pre-write safety, with static triggers not observed exploits.

## Gaps
Final light verification completed in `2026-11-09-one-survey-harness-repair-and-diagnosis-verify-review.md`: two narrow fixes supported, no new findings, all five open defects retained. V1-V3 partial/failed; V4 NOT RUN. Complete usable runtime/namespace provenance, stale receipt rejection and success/forced-child environment checks are missing. No C: write is asserted as observed. Fixes need further correction authorization; do not run the unsafe helper or diagnostic now. Original numerical/storage/malformed-input/live/incremental/historical certifications remain excluded.
