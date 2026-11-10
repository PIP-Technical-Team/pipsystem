---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-testing
status: completed
updated: 2026-11-09T22:36:00Z
owner: testing-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Coordinator integrates findings; implementation remains blocked, with no rerun authorized by this review.
---

# Execution testing review

## Summary
Read-only execution testing review complete: five findings (one P1, four P2), no P0. The retained evidence establishes five successful installation commands and the first pipaux lazy-load failure, not a usable installed environment or a survey test pass. No scenario was created. Stopping at the package boundary was correct and was not misreported as invalid-survey rejection or Plan completion.

## Changes
Only this report created/updated. No setup, R, Pester, package, Git mutation, or source fix performed. No package repository source was directly read in this review; package facts below come from retained logs and the implementation handoff, not fresh package inspection.

## Checks run
Loaded R testing, R technical, and clear technical communication skills; read handoff contract, charter, design, harvest brief, approved Plan, both harness files and implementation handoff. Inspected retained baseline note, overall setup log and all six package installation logs. Read-only Git commands confirmed main checkout HEAD f9454707b292a620e25abef17f2e515794020ba7 and unrelated/mixed worktree changes; none were modified. Directory reads confirmed inventory.rds present, setup-check.rds absent, and scenario.R absent.

### Findings

**[P1]** `experiments/one-survey/run.ps1:17` -- [safe_auto] Base-library writes bypass the redirected-output check.
**Issue**: The launcher checks its listed runtime directories for reparse points, but omits base-library. setup.R:12-18 accepts an existing base-library directory and copies into it before safe_path is invoked at line 34; that invocation does not include base-library either. An existing junction there can redirect copies outside the checkout, including C:, despite the ancestor checks. This is a concrete unguarded path, not evidence that this run actually wrote externally.
**Fix**: Include the actual base-library destination in the launcher's pre-write resolved-path/reparse validation and check existing copy destinations before copying. Demonstrate rejection using a benign E-only redirected destination before a future authorized setup; do not create a C: test target. Keep the check targeted to this mandatory storage constraint, not a general filesystem framework.

**[P2]** `experiments/one-survey/setup.R:104` -- [safe_auto] Install children do not inherit the parent R library restriction.
**Issue**: Changing .Library in the current R process at lines 20-23 is not an environment setting inherited by R CMD INSTALL. The child starts with the installation's original .Library, which the code itself identifies as containing contributed packages (lines 7-8). R_LIBS_SITE/USER redirections do not remove that built-in library. Therefore successful installation can consume an unrecorded ambient dependency or pass despite an incomplete copied dependency closure. The parent-only assertion at line 114 cannot certify the child. The worker correctly acknowledges this limitation at handoff:85.
**Fix**: Restrict the installation child to the same intended base/recommended and dedicated libraries and retain child library/namespace-path evidence, or keep the isolation gate failed until that can be demonstrated. Do not add packages/downloads or treat the five exit-zero commands as isolated runtime loading proof.

**[P2]** `experiments/one-survey/setup.R:52` -- [safe_auto] Baseline passes on inventory existence even after failed installation.
**Issue**: inventory.rds is saved at lines 99-100 before any project package install. The current retained directory contains it despite the pipaux failure, so a later baseline invocation would satisfy its only assertion without pipaux/pipdata being usable. The initial observed failure proves absence of inventory, not failure of the desired installed-package behavior. baseline-observed.txt:3-8 accurately discloses the result, but it is not a behavioral red-to-green baseline for V1.
**Fix**: Make the baseline exercise the same usable installed-package criterion as the eventual setup check, with an explicit missing-package failure. Do not accept inventory existence as success. Preserve the original observation as historical evidence, not a passing or twice-passing baseline.

**[P2]** `experiments/one-survey/setup.R:116` -- [safe_auto] Negative controls do not exercise the implemented dependency/path failure boundaries.
**Issue**: requireNamespace on a fabricated absent package tests R's lookup, not visit()'s missing-dependency error at lines 80-82 or fail-fast setup behavior. safe_path(R.home()) only tests the final prefix helper after all setup writes; it cannot detect bypassing the launcher's pre-write ancestor checks or the unchecked base-library write. Neither assertion was reached in the retained run (setup.log:6-7). These cannot substantiate the Plan's functional missing-dependency/unsafe-path scenarios (Plan:39-41).
**Fix**: In a future authorized check, exercise the actual dependency resolver with one unavailable declared dependency, and the actual launch/pre-write path rejection with an E-only unsafe destination. Assert the relevant error and that installation/output did not proceed; no new test framework is needed.

**[P2]** `experiments/one-survey/setup.R:119` -- [safe_auto] Final check does not bind loaded installations to inventory revisions.
**Issue**: The check reads inventory but never compares it against the loaded installation; it only checks that namespace paths are somewhere under the runtime root and prints versions. It neither requires each namespace path to be the intended library/package nor matches the checked package set/revision provenance to inventory. A stale same-version installation left in the reused runtime can therefore satisfy the check after inventory changes; existence and version strings alone do not identify Git revisions. No such false pass occurred in the retained run because it stopped before this block.
**Fix**: Tie the final check to successful installation evidence for the current inventory and require exact intended installed package paths. Use small per-package installed revision provenance if needed; do not infer SHA equality from Version alone or introduce a general lockfile system.

### Evidence assessment
- Baseline: `.tmp/one-survey/baseline-observed.txt:1-8` is explicitly reconstructed terminal evidence, not a child log. It records the expected inventory-absence error and a stderr capture problem; no functional scenario baseline exists.
- Installation: `.tmp/one-survey/logs/setup.log:1-7` and `install-{stamp,pipfun,pipload,wbpip,dlw}.log` show five successful commands. `install-pipaux.log:7-11` shows missing clean_survey_data directory, lazy-load failure and removal of the incomplete installed pipaux package. pipdata was not attempted. No runtime-loading pass is implied by --no-test-load (setup.R:105).
- V1: partial/failed gate. Inventory binary content was not decoded because R execution is prohibited; provenance completeness remains independently unverified. Child isolation and usable loading remain unproved.
- V2-V4: NOT RUN. No scenario.R, row-aligned values, exact-version readback, malformed-control classification, or no-output evidence. This is an execution gap, not a defect in a nonexistent scenario and not a reason to bypass the mandatory stop.
- V5: this is the testing role's review only, not the full execution review or final verify gate. No speculative survey/statistical test recommendations were added while the prerequisite remains blocked.

### Package snapshot provenance (reported, not independently re-read)
Implementation handoff:57-66 and setup.R:35-48 record:
| Package | Snapshot SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

Tag meaning: safe_auto is a proposed in-scope harness correction for the coordinator to assess; no fix or execution is authorized by this review. No manual/protected-file changes are proposed.

## Gaps
- Setup, R, and Pester execution were prohibited; conclusions are static inspection and retained-log review, not independent rerun results.
- Binary inventory was not decoded, and installed dependency content/versions, actual child namespace paths, hooks and OS-level external-write behavior remain unverified. The unsafe-path finding establishes a bypass opportunity, not an observed out-of-checkout write.
- First pipaux installation failure remains unresolved; pipdata and all scenario assertions remain unexecuted. The reduced reproducer was not executed by this reviewer.
- This testing review is complete, but the Plan is not: other review roles, correction-budget decisions and final verify belong to the coordinator. No correction budget was consumed by this report-only review.
