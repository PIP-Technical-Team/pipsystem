---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T143615Z-evidence-audit
status: completed
updated: 2026-11-10T14:39:26Z
owner: independent-evidence-audit
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator integrates this completed evidence audit; no implementation or execution authorized by this report.
---

# Independent completion-evidence audit

## Summary
Independent retained-evidence audit complete. Original survey work is NOT complete: original V1/V5 failed and V2-V4 never ran. The follow-up has substantial real executed evidence for its bounded harness and diagnosis, and all ten full-review plus both light-verify reports exist. However, the strongest claim that every follow-up gate is independently supported by retained execution logs is overstated: successful/intentional-failure caller-state equality is parent-attested only, without its green-helper transcript. This is missing independent evidence, NOT evidence that restoration failed or execution was fabricated. Completed follow-up status should retain that qualification. Two current-status documentation mismatches also remain.

This review does not certify implementation safety beyond the inspected evidence or replace the separate harness-safety audit. No new execution, pipeline, installer or package remedy was performed.

## Evidence notation
- `P`: `.cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md`.
- `OP`: `.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md`.
- `W`: `.cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md`.
- `OW`: corresponding original `2026-11-09-installed-package-one-survey-example.md` Work Report.
- `FR` / `VR`: `.cg-docs/reviews/2026-11-10-one-survey-harness-repair-and-diagnosis-review.md` / corresponding `-verify-review.md`.
- `H`: `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261109T210857Z-code/handoff.md`.
- `S`: `experiments/one-survey/`.
- `G`: `.tmp/one-survey/20261110T125325Z-completion-green/`.
- `R`: sibling `20261110T125325Z-completion-red/`.
- `F`: sibling `20261110T125325Z-completion-green-fixtures/`.

## Findings

**[P2]** `.cg-docs/reviews/2026-11-10-one-survey-harness-repair-and-diagnosis-verify-review.md:19` -- Full V1 evidence claim exceeds retained independently inspectable evidence.

**Issue**: `P:75` requires executed pre-write rejection AND caller restoration on success/failure, with logs; `P:43` requires saved evidence for every R1-R3 check. Boundary assertions have an actual transcript (`F/checks.log:22-49`). R child success and intentional failure also have real logs (`G/logs/check.log:36`, `G/logs/forced-failure.log:1-8`, `G/logs/child-startup.log:9-10`). None records completion of the parent PowerShell environment/count/preference comparisons, which occur AFTER child return (`S/checks.ps1:23-28,105-121`). The only equality outcome is the parent narrative at `W:12`; `FR:61` and `VR:41` explicitly admit no standalone green-helper transcript persists. Therefore caller equality is reported executed, not independently log-verified. Successful R entry/exit cannot prove parent environment equality. `W:6,23` and `H:19` should not be read as stronger proof than that.

**Fix**: Qualify V1 as parent-attested for equality until an existing captured outer command result is retained, or a separately authorized bounded green-helper check saves its own completion/exit evidence. No need for raw environment dumps, new framework or pipeline execution. No such rerun was performed or authorized by this review.

**[P3]** `.cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md:103` -- Completed canonical Plan retains an unqualified pre-execution Gaps paragraph.

**Issue**: Frontmatter says completed (`P:4-5`), while its Gaps says repairs/child evidence have not been implemented/executed, the reduced call is unexecuted and approval is review-only. Actual `G/logs/check.log:1-36` and `G/logs/diagnose.log:36-40` contradict that current-tense paragraph. `W:32` explains the body was intentionally retained as historical specification, so this is not evidence that the latest runtime is absent; nevertheless P itself does not label its Gaps as historical or link the current resolution there.

**Fix**: Preserve approved specification/history, but provide an explicitly dated historical-status annotation or current evidence pointer through the permitted reporting mechanism. Do not rewrite Decided items or expand scope.

**[P3]** `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261109T210857Z-code/handoff.md:70` -- Final Gaps still says dependency provenance is not rendered.

**Issue**: This unqualified final Gaps statement conflicts with current readable `G/dependencies.tsv:1-54` (53 rows with versions, origins, destinations and DESCRIPTION digests) and `W:99`. Older run provenance and current follow-up provenance are not distinguished in that sentence. Binary inventory independent decoding remains a genuine limit; absence of a rendered current dependency table does not.

**Fix**: Scope the sentence to the original attempt or point current follow-up readers to the TSV; keep independent binary-decoding and payload limits explicit.

## Acceptance reconciliation

### Original survey Plan

| Gate | Audited retained status | Precise evidence / mismatch |
|---|---|---|
| V1 clean installed ecosystem and provenance | Partial / failed, NOT complete | `OP:87`; `OW:24,43-47`; original `.tmp/one-survey/logs/install-pipaux.log:7-11` preserves ENOENT/lazy-load failure. Five earlier exit0 installs used no-test-load; pipdata not attempted. Later two-package follow-up is not full original ecosystem setup (`S/setup.R:24`). |
| V2 documented real survey path | NOT RUN | `OP:88`; `OW:13,25`; current experiment directory has setup.R/run.ps1/paths.ps1/checks.ps1 only, no scenario.R. `G/logs/diagnose.log:40` explicitly excludes survey. |
| V3 row-aligned annual-to-daily welfare, person weights, exact data AND metadata version readback | NOT RUN | `OP:49,89`; `OW:26`; no actual row/value/readback log exists in inspected runs. Hashing list(example=1:3) (`S/setup.R:34-38`) is not survey numerical evidence. |
| V4 completed invalid missing-weight classification with no downstream artifacts | NOT RUN | `OP:49,90`; `OW:27`; both original installation ENOENT and reduced diagnosis are execution errors, not completed invalid-survey classification. No malformed control ran. |
| V5 full review / correction / final verify | Reviews completed; original acceptance gate failed | Original full review `2026-11-09-installed-package-one-survey-example-review.md:21-22,26-45` retains seven open findings; corresponding verify `:21-22,45-46` explicitly does not pass V5. Later repair review is scoped to the follow-up, not original scenario completion (`FR:19`). |

Original status is accurately left active/failing step1 (`OP:4,13-14`); neither original nor later reports legitimately certify original completion. Package remedy and eventual original execution remain undone, outside this review.

### Follow-up Plan

| Gate | Audited retained status | Executed evidence and limits |
|---|---|---|
| V1 pre-write rejection and caller restoration | Pre-write independently log-supported; success/failure equality parent-attested | `F/checks.log:22-49` records ten controls: helper traversal/redirect, four redirected recursive targets, two populated attempts, hardlinked log and redirected ancestor. Current corresponding no-write assertions are `S/checks.ps1:47-102`. Restoration qualification is Finding P2 above; no observed restoration failure. |
| V2 actual installer-child isolation, real missing dependency, usable pinned package | Supported at observed process/library boundary | `G/logs/install-missing-declared-cli.log:1-4` is actual stamp missing declared dependencies, not fabricated namespace absence. `G/logs/child-startup.log:2-8` records real resolver/lazyload processes and contained 00LOCK staging with dedicated/private libraries. `install-stamp.log:13`, `install-pipfun.log:15` record DONE; later `check.log:8-9,22-23,36` demonstrates usable exact-path stamp/pipfun. Missing private R.css warnings remain (`install-stamp.log:8-9`, `install-pipfun.log:10-11`), not fatal errors. |
| V3 fresh/reuse, current receipts, behavioral red and stale inventory | Supported for current metadata/loaded-path scope | Real absent-pipfun baseline `R/logs/baseline.log:1,8-9`. Reuse rejections `F/checks.log:38-41`; exact archive mechanism `S/setup.R:76-86`; receipts/current metadata checks `:150-189`; five mutations `:194-208`; successful combined result `G/logs/check.log:1,36`. `G/pins.tsv:2-8` retains original seven pins; `dependencies.tsv:2-54` records 53 copied dependencies. This is not whole-payload authenticity, portable restoration or all-53-loaded proof. |
| V4 minimal isolated diagnosis and owner direction | Supported for the reduced pipfun call | `G/logs/diagnose.log:36-40` records exact exported call, NULL vintage/create_dir=FALSE, ENOENT/fs_error and root/cache FALSE; downstream explicitly NOT RUN. Source at retained pipfun SHA (`G/sources/pipfun/R/pip_create_globals.R:14-17,33-38,228-238`) documents noncreating lookup but lists absent cache. Retained pipaux `R/zzz.R:1` eagerly calls globals. `W:19` owner direction is appropriate proposal, not an applied fix. No new pipaux installation ran here. |
| V5 all roles and final light verify | Review routing/artifact completion supported; does not independently rerun V1-V4 | All ten completed full-role handoffs listed at `FR:49-58` and both completed light handoffs at `VR:32-33` were actually opened/read in this audit; all have nonempty Gaps. They explicitly inspect source/retained evidence, not rerun. `FR:60-61`, `VR:35,40-41` retain limitations. Closure claims share parent-attested equality limitation; role count alone cannot fill it. |

Current setup.log is NOT a clean setup pass: `G/logs/setup.log:3-4` has successful installation commands, then `:26-29` a real base-namespace audit failure. `W:11` discloses it; current base handling at `S/setup.R:39-41` and later check/diagnose logs support corrected acceptance. This history is accurately retained, not grounds to erase later passes or pretend pristine setup ran again.

Original seven scopes map as follows: prewrite, installer-child isolation, no-overlay source reuse, behavioral baseline, current-install provenance, real negatives, and caller restoration (`2026-11-09-installed-package-one-survey-example-review.md:26-45`). Follow-up review IDs differ; in particular follow-up P2.4 is dependency identity, original P2.4 is caller restoration. Six scopes have specific retained exercised evidence; seventh has assertion source plus parent execution attestation and real-child corroboration, but no independent parent comparison result.

## Package provenance

No live external package checkout/repository was opened or modified by this audit. Retained snapshots under pipsystem were read for pipfun/pipaux only. Their recorded full SHAs are pipfun `0c6a78d9884ed0965a524311537eec2a5095d60b` and pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` (`G/pins.tsv:3,7`). Snapshot identity is recorded provenance, not freshly rehashed archive attestation.

Other recorded pins, read in `G/pins.tsv:2-8` but no package implementation read: stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6`; wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`; pipdata `13a38280c1eafe7e03a97837cdb57833fbe9d926`.

## Changes
Only this exact requested pip-handoff-v2 file, created at start and finalized here. No implementation, Plan, other report, active-state, package, shared R, runtime-evidence or Git mutation. No pipeline, fixtures, children, tests or installers started. No new dependencies/framework/safeguards.

## Checks run
- Read project charter/design/harvest instructions and handoff contract; loaded required technical communication and R-testing skills.
- Read both Plans and Work Reports; original and both historical/latest follow-up full/verify reports; primary handoff; all ten latest full-role and both latest light-role handoffs; all four current harness files; actual retained baseline, boundary transcript, install dependency/success/failure, setup, check, forced-child, startup and diagnosis logs; readable pin/dependency tables; two source snapshots identified above.
- Read-only Git identified pipsystem main at f9454707b292a620e25abef17f2e515794020ba7. Finish read-only diff-name checks retain tracked dirt only at .gitignore and .cg-docs/active-state/current.json; staged diff empty. Pre-existing untracked artifacts retained. Whitespace warnings about existing LF/CRLF are not test results.
- Only read-only Git and system-clock terminal commands were run. All report writes used apply_patch at the exact E-local path. No agent-created temp/cache outside E:.
- Functional check of this report change: re-read the saved report to confirm pip-handoff-v2 fields, required headings, nonempty Gaps, evidence citations and review-only scope. Required acceptance runtime checks were NOT re-executed; this task expressly prohibits implementation/pipeline execution.

## Gaps
- Parent environment-equality success is reported, not independently captured in retained green-helper evidence. No contrary equality result found; do not call it fabricated or failed.
- No runtime rerun, RDS deserialization, archive/tree byte comparison, OS-wide write tracing, compiled-hook certification or payload attestation. This audit does not conclude absence of all historical indirect writes.
- Original survey numerical, metadata/data exact-version readback and malformed-rejection evidence remain absent; original work is incomplete. Later live-DLW/deflation/mean/incremental/historical-after-later-save certifications remain excluded.
- Package remedy is unimplemented. Any further execution/correction is outside this review, not authorized by a finding or report. Separate harness-safety audit may find additional implementation constraints; this report evaluates completion evidence only.
