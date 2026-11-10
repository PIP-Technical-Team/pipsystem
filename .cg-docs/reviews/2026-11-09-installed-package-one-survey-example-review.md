---
date: 2026-11-09
depth: full
type: standard
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
findings:
  P1.1: open
  P1.2: open
  P1.3: open
  P2.1: open
  P2.2: open
  P2.3: open
  P2.4: open
  P2.5: fixed
  P3.1: fixed
  P3.2: fixed
---

# Full Execution Review

## Status
Full review completed across all ten required roles. Not a passed gate: 10 distinct findings (P0: 0, P1: 3, P2: 5, P3: 2); 3 fixed, 7 open, 0 skipped. Runtime blocked at pipaux installation; no phase complete. Review mode full because installation paths trigger the full route and the approved Plan explicitly requires all ten roles. No package fix or additional harness execution is authorized by this report. P1 strength from adversarial review is retained when other roles classified the same issue as P2.

## Findings

### [P1.1] Pre-write output validation misses real destinations
**Open; safe_auto recommendation, blocked by exhausted correction budget.** `experiments/one-survey/run.ps1:17-21` checks only enumerated top-level directories and omits base-library, while `setup.R:12-18` copies there before its path check. Existing nested directory junctions or output-file links can also redirect writes. This is an E-only safety hole, not evidence that this run wrote to C:. Validate actual existing destinations before writes and exercise rejection using E-only test destinations. Sources: testing, reproducibility and adversarial reviewers.

### [P1.2] Install-child library boundary differs from parent
**Open; manual integration decision.** `setup.R:20-23,104-107` changes .Library only in the parent. New R installation children recreate the built-in mixed installation library. Disabled user/site libraries do not remove it. Actual fallback consumption is UNKNOWN, but no-ambient-fallback is not established. Make child library paths match the dedicated-plus-base/recommended boundary and retain executed child path evidence in a newly authorized attempt. Sources: architecture, testing, reproducibility, adversarial.

### [P1.3] Snapshot extraction and dependency copying reuse mutable directories
**Open; safe_auto recommendation, blocked by correction budget.** `setup.R:58-66,89` overlays archives and copies onto existing directories. An extra/removed/edited source file can survive while inventory still names the pinned archive SHA. Use a fresh attempt's source/library destinations or reject already-populated destinations; do not remove preserved evidence or touch package repositories. Sources: reproducibility and adversarial.

### [P2.1] Inventory presence is not a behavioral red baseline
**Open; safe_auto recommendation, blocked by correction budget.** `setup.R:50-53` tests only inventory existence, yet inventory is written before installation (`:99-100`). The retained failed run already has inventory.rds without usable pipaux/pipdata. Initial observed error is genuine absence evidence, not a red-to-green test of usable installed packages. Use the actual usable-package criterion in an authorized correction. Source: testing.

### [P2.2] Final checks do not establish declared provenance
**Open; safe_auto recommendation, blocked by correction budget.** `setup.R:112-133` reads inventory without validating required records or matching current successful install provenance to exact installed paths/revisions. A stale/incomplete inventory can therefore support a future false pass. No such pass occurred in this run. Tie the check to current successful installations and required inventory records; no framework or general schema system needed. Sources: testing and data quality.

### [P2.3] Negative controls do not exercise actual failure boundaries
**Open; safe_auto recommendation, blocked by correction budget.** `setup.R:116-117` tests a fabricated absent namespace and a final prefix helper, not the resolver's declared missing dependency or actual pre-write boundary. Neither assertion was reached. In an authorized correction, exercise the actual resolver and launch/path boundary with E-only targets and require that installation does not proceed. Source: testing.

### [P2.4] Launcher mutates the caller's process environment
**Open; safe_auto recommendation, blocked by correction budget.** `run.ps1:43-50` sets process environment values without restoring prior values after success or error. A direct invocation therefore leaves HOME, USERPROFILE, TEMP, library and Git configuration overrides in the hosting PowerShell process. Capture and restore previous values in finally, including unset values, and keep overrides scoped to child execution. No continuation in a reused interactive terminal was exercised here. Source: code quality.

### [P2.5] Runtime files exposed as staging candidates
**Fixed.** `.gitignore:37` now narrowly ignores `/.tmp/one-survey/`. Runtime evidence is preserved on disk; Plans, reports and experiment scripts remain visible. Executed `git check-ignore -v` confirms the inventory, installation log and archive paths match this rule. Source: version control.

### [P3.1] Installation comment overstated child isolation
**Fixed.** `setup.R:103-104` now states that children inherit explicit environment redirections, not parent .Library rebinding; mixed-library fallback remains unverified. This is a comment-only correction, no runtime change or rerun. Source: documentation.

### [P3.2] Worker report misstated parent restriction chronology
**Fixed.** Implementation handoff line 85 now says the parent restriction ran before installation, while final namespace/path verification was not reached. Correction is explicitly attributed to the coordinator; prior execution evidence is unchanged. Source: documentation.

## Corrections and Budget
Step 1's two functional harness corrections were already used before the first package failure. No further functional harness corrections or package execution were made during review. Narrow Git hygiene and two factual wording corrections do not claim to remediate installation or isolation. Remaining findings are open, not skipped or accepted exceptions. The package failure is a separate execution blocker, not a passed or suppressed review finding.

## Evidence
`.tmp/one-survey/logs/install-pipaux.log:7-11` confirms lazy-load failure for missing isolated clean_survey_data cache. Five preceding install commands exited 0 with --no-test-load; none establishes fresh usable runtime loading. V1 partial/failed; V2-V4 not run. Work report records exact archived SHAs and installed-provenance gaps.

## Review Sources
All paths below are under `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/`.
- `20261109T222600Z-learnings/handoff.md`: historical lessons only; no current implementation defect.
- `20261109T223200Z-quality/handoff.md`: child-library isolation and caller-environment mutation findings, merged above.
- `20261109T223200Z-testing/handoff.md`: one P1 and four P2, merged above.
- `20261109T223200Z-documentation/handoff.md`: two P3 wording findings, fixed above.
- `20261109T223200Z-version-control/handoff.md`: one P2 runtime-ignore finding, fixed above.
- `20261109T223200Z-reproducibility/handoff.md`: child isolation, source reuse and pre-write path findings.
- `20261109T223200Z-performance/handoff.md`: no supported performance issues for this bounded example.
- `20261109T223200Z-architecture/handoff.md`: child library-boundary finding; two-script design otherwise appropriate.
- `20261109T223200Z-data-quality/handoff.md`: future inventory false-pass risk.
- `20261109T223200Z-adversarial/handoff.md`: three P1 findings (pre-write paths, install-child library and mutable source overlays), retained at P1 above.

## Gaps
No independently rerun scenario or functional setup success. No numerical, exact saved-version readback or malformed-classification evidence. No observed external-write claim; startup/path and child library isolation remain unverified. Binary inventory not independently decoded by these static reviewers. Final verify completed in `2026-11-09-installed-package-one-survey-example-verify-review.md`: three fixed scopes verified, no new findings, seven open findings retained. Passing wording/ignore corrections does not make the Plan complete.
