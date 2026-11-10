---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T130229Z-completion-learnings
status: completed
updated: 2026-11-10T13:07:26Z
owner: completion-learnings
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates this full-role result with remaining reviews and final light verification; no new approval requested by this role.
---

# Completion learnings review

## Summary
FULL learnings-role comparison complete. **No supported current P0-P3 issues in this bounded comparison.** Current code and fresh text evidence address the historical helper pre-write, exported acceptance, fixture contamination, error-identity and dependency-reconciliation lessons. Actual installer-child isolation and fresh snapshot boundaries have affirmative evidence, not merely parent-only declarations. This is a review result, not independent re-execution, complete OS sandbox certification, final V5 completion or original survey completion.

The top resumed Work Report is the applicable current status (`.cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md:3-29`). Its earlier blocked sections and old review findings remain historical. Latest completion authorization is recorded at Work Report:4; no fresh approval gate is introduced here.

## Changes
Only this requested report, created immediately and finalized. No harness execution, fixes, package/source-repository reads, Git mutations, dependency additions or protected-record changes/reorganization recommendations.

## Related Learnings

### Directly Relevant
This is a closure comparison, not a duplicate historical learning dump. Citations use pipsystem-root-relative paths; G = `.tmp/one-survey/20261110T125325Z-completion-green`, F = `.tmp/one-survey/20261110T125325Z-completion-green-fixtures`, R = `.tmp/one-survey/20261110T125325Z-completion-red`.

1. **Actual child boundary, not parent-only isolation.**
   **Lesson:** [prior learnings](../20261110T022000Z-followup-learnings/handoff.md):36 and [prior testing](../20261110T023600Z-followup-testing/handoff.md):50-52,62 distinguish startup lookup from usable namespaces.
   **Current comparison:** `experiments/one-survey/run.ps1:20-33,65-90` creates a fresh private runtime from base/recommended packages and instruments its base startup before actual children. `setup.R:60-65,93-101` uses that runtime for a real declared-dependency failure. `G/logs/child-startup.log:2-8` records resolver and lazy-load children, including contained 00LOCK staging, with only dedicated/private libraries. `G/logs/install-missing-declared-cli.log:1-4` records actual missing stamp dependencies. `G/logs/install-stamp.log:13` and `install-pipfun.log:15` show DONE; `G/namespace-paths.tsv:3-4,11-16` now adds actual loaded contributed paths. No parent-only isolation defect is supported by this evidence.
   **Key takeaway:** retain the actual child and usable namespace evidence separately; neither replaces the other.

2. **Fresh pins, current receipts and copied dependencies are different evidence.**
   **Lesson:** [prior learnings](../20261110T022000Z-followup-learnings/handoff.md):38-40; [prior data-quality DQ-3](../20261110T023600Z-followup-data-quality/handoff.md):43-50.
   **Current comparison:** `run.ps1:13-18` rejects existing setup/baseline destinations before creation. `setup.R:73-86,124-148` prevents source/library overlays, archives exact full SHAs and writes receipts after successful installs. `setup.R:150-189` reconciles dependency table membership, exact destination/origin, current Version and DESCRIPTION digest, current package receipts and actual loaded paths. `setup.R:194-208` exercises five specific stale/incomplete mutations after good verification. `G/pins.tsv:2-8` matches the original seven full SHAs in Work Report:84-90; `G/dependencies.tsv:2-54` contains 53 copied dependency records. `G/logs/check.log:1-3,8-9,22-36` records usable exact-path acceptance and all five rejected mutations. `F/checks.log:38-41` independently retains populated-attempt rejection. No current dependency-reconciliation or overlay issue is supported.
   **Key takeaway:** these are bounded current-install provenance checks, not Git source pins for third-party dependencies or whole-payload attestation.

3. **The helper must protect its own writes.**
   **Lesson:** [prior adversarial](../20261110T023600Z-followup-adversarial/handoff.md):40-44 identified unchecked helper-owned paths, not an observed external write.
   **Current comparison:** `checks.ps1:1-9,38-45` validates RunId/checkout and checks the actual fresh fixture destination before directory/transcript creation. Shared `paths.ps1:1-32` checks normalized checkout containment, ancestors and recursive reparse/hard-link targets. `checks.ps1:47-65` exercises its own traversal and redirected-fixture entry points; `F/checks.log:22-25,49` retains the specific rejections and ten-control completion. Launcher's `run.ps1:13` precedes writes at :35-36. No current helper-own-prewrite issue is supported.
   **Key takeaway:** a child's preflight cannot retroactively protect writes made by its calling helper.

4. **Negative fixtures must not invalidate positive runtime checks.**
   **Lesson:** [prior testing](../20261110T023600Z-followup-testing/handoff.md):30-32 and [prior adversarial](../20261110T023600Z-followup-adversarial/handoff.md):52-56 identified the retained hard-link peer inside the positive runtime.
   **Current comparison:** `checks.ps1:37-44,86-101` puts fixture targets in a separately checked sibling root, preserving the recursive link guard. `F/checks.log:42-49` retains hard-link/ancestor rejection and positive-runtime-unlinked completion; later `G/logs/child-startup.log:9-11` proves check, intentional failed child and diagnose actually launched. No current fixture-poisoning blocker is supported.
   **Key takeaway:** isolate fixture effects rather than weakening the real guard or cleaning historical evidence.

5. **Behavioral acceptance and reason-specific failures, not proxy passes.**
   **Lesson:** [prior testing](../20261110T023600Z-followup-testing/handoff.md):26-36 and [prior data-quality DQ-4](../20261110T023600Z-followup-data-quality/handoff.md):52-59.
   **Current comparison:** `setup.R:31-44` uses exported `stamp::st_hash_obj` with deterministic, format and changed-input checks, plus `pipfun::log_names`; no internal namespace bypass. `R/logs/baseline.log:1,8-9` records actual absent-pipfun RED; `G/logs/check.log:1,36` records usable GREEN. `checks.ps1:11-28,73-99` checks intended rejection reasons and caller state. `checks.ps1:106-120` explicitly covers previous/unset environment values, refuses an old forced-failure log and requires its intentional-child marker; `run.ps1:98-103` restores environment/preference. `G/logs/forced-failure.log:1,8` and `G/logs/child-startup.log:10` establish the actual failed R child rather than prelaunch rejection. Full environment-comparison pass is attributed to resumed Work Report:12,23 and inspected assertion code, not independently rerun or separately console-transcribed by this reviewer. No current reason-identity/exported-acceptance issue is supported.
   **Key takeaway:** a matched exception plus the current child marker is materially stronger than accepting any failure.

6. **A reproduced package boundary is diagnosis, not original survey completion.**
   **Lesson:** [prior learnings](../20261110T022000Z-followup-learnings/handoff.md):44 and [approved Plan](../../../../../plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md):18-19,47-49,67-77.
   **Current comparison:** `setup.R:217-237` uses a fresh absent root, exact installed-pipfun call, NULL vintage and create_dir=FALSE, retaining the first result and downstream state. `G/logs/diagnose.log:36-40` confirms ENOENT at the absent clean-survey cache, root/cache still absent and no pipaux installation/survey/storage/numeric scenario. `setup.R:215` and `G/logs/check.log:36` explicitly disavow original V1 success. Resumed Work Report:17-19 links owner direction to recorded pipfun/pipaux SHAs while :29 keeps original gates unchanged. Runtime-confirmed scope is the reduced pipfun missing-cache result; this reviewer did not independently refresh package source lines or infer a new successful pipaux installation.
   **Key takeaway:** preserve the original failed installation and unexecuted scenario status; diagnostic exit zero is not pipeline success.

### Potentially Related
No additional brain/solution search was needed. The directly applicable prior role reports supplied sufficient signal; unrelated deflation, mean and later-release lessons were not imported into this bounded diagnosis.

### Patterns to Follow
- Keep the current small direct assertions and fresh sibling runtime/fixture layout; no new framework, matrix, dependency or speculative safeguard is justified by this review.
- Preserve failed setup evidence beside later acceptance: `G/logs/setup.log:26-29` retains the base namespace lookup failure; the current `setup.R:39-42` handles base explicitly, and later `G/logs/check.log:34-36` records successful capture. Do not relabel setup.log as a clean setup PASS.
- Separate current evidence from historical blocked reports, and role completion from consolidated V5/final light verification.

### Anti-Patterns to Avoid
- Reopening already-addressed historical findings solely because old reports remain open, or treating old budget-stop prose as a new approval requirement after the recorded completion instruction.
- Promoting source declarations, install DONE, diagnostic exit zero or binary file existence into broader runtime/scenario certification.

### No Relevant Learnings Found
Not applicable: directly relevant lessons were found and compared above. No additional previously proven implementation recipe was sought or claimed.

## Checks run
- Read the approved Plan, top resumed same-basename Work Report, prior learnings/consolidated review and targeted prior testing, data-quality and adversarial handoffs.
- Read all four current harness files and fresh baseline/boundary/setup/install/startup/check/forced-failure/diagnosis text evidence, pins, 53 dependency rows and namespace paths. No broad brain/solution search or duplicate learning archive created.
- Read project charter/design/harvest constraints and pip-handoff-v2 contract. Loaded communication, R shared and R testing skills. These skill examples do not override this Plan's installed-package/no-load_all/no-framework boundary. No statistical/data-transformation claim evaluated.
- Read-only Git returned existing main at f9454707b292a620e25abef17f2e515794020ba7. Clock read supplied UTC update timestamp. No writing command/process was started, so no command-created temp/home/cache/log output required redirection.
- No R, PowerShell harness, installer, tests, Pester, diagnostics, scenario or fixes executed. Only this authorized E-local report was written through apply_patch. No package source repository read; source SHA refresh is not applicable. Recorded pins above remain retained pin evidence, not independently re-archived certification.

## Gaps
- No independent rerun, binary inventory/diagnostic RDS deserialization, byte-for-byte archive/install-tree comparison, OS write audit or exhaustive compiled hook audit. Narrow path/metadata evidence is not an OS sandbox or whole-library attestation.
- Environment restoration comparisons are supported by inspected current assertions and the coordinator's top resumed Work Report; actual successful/intentional failing children are independently visible in retained logs. The complete parent environment snapshots were not independently captured here.
- The retained setup.log is a real intermediate failed acceptance, not a successful setup log. Later check and diagnose logs provide corrected acceptance evidence without erasing that failure; no additional pristine setup rerun is claimed by this role.
- Other full-role results and final light verification are coordinator-owned and were pending in the top Work Report at review time. This completed role does not assert V5 or whole-Plan completion.
- Original survey/numerical/storage/live/incremental/historical certifications remain outside this follow-up; no package fix or original survey completion is claimed or requested.
