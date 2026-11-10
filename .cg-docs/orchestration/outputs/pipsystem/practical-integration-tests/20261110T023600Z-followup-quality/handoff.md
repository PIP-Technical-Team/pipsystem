---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-quality
status: completed
updated: 2026-11-10T02:38:31Z
owner: code-quality-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates full review; implementation stays blocked with no further correction authorized.
---

# Follow-up execution code-quality review

## Summary
Code-quality review completed; implementation is BLOCKED, not accepted. Two P2 safe_auto findings; no supported P0/P1 findings in this role's bounded inspection. Step 1 has exhausted 2/2 corrections and Step 2 is NOT RUN (implementation handoff:19-21,111-112). No runtime execution, fixes, or correction-budget extension performed. This report completes this review role only, not the full ten-role route or final verify.

## Changes
Only this report created and finalized. No source, package, shared-runtime, protected-record or Git mutations. No deletion/rename/move recommendations for protected records. Minimal first: no new framework, speculative safeguards or dependencies proposed.

## Findings

**[P2]** `experiments/one-survey/setup.R:34` -- [safe_auto] Usable-package control calls a nonexported function.
**Issue**: `stamp::st_extmap_defaults()` cannot resolve through the public namespace at the pinned installed snapshot. FINAL/logs/setup.log:26-27 records the exact error and halted execution after both install exits were zero (:3-4). This always aborts the green control before namespace capture (:35-39), exact loaded-path assertions (:160-163), and stale/incomplete receipt controls (:169-180). Therefore successful installation does not close the behavioral/provenance findings. This is a harness defect, not the reduced pipaux diagnostic or a survey validation failure.
**Fix**: In a separately authorized correction, use a small genuinely exported stamp behavior available at the existing pin and assert its result, retaining actual namespace loading and exact-path checks. Do not bypass with `:::` or alter package namespaces/pins. Rerun green and affected provenance controls before claiming closure. safe_auto describes fix suitability, not permission to exceed the exhausted budget.

**[P2]** `experiments/one-survey/checks.ps1:56-57` -- [safe_auto] Negative fixture contaminates the runtime needed by later checks.
**Issue**: `$testRoot` is inside `$runtime` (:31); the hard-link control leaves `$testRoot/log-target` with another link at the negative sibling's `logs/setup.log`. The launcher's recursive guard rejects every hard-linked descendant (`run.ps1:24-38`), including the target inside the otherwise valid runtime. Thus later check/inspect/forced-failure launches reject before an R child, even if the nonexported-function defect is corrected. The implementation handoff:45,63-65 explicitly records that the attempted success/failure restoration pair was not reached for this reason. The guard is correctly failing closed; its test fixture placement is wrong.
**Fix**: In a separately authorized correction, create fresh E-local negative-control targets in a dedicated sibling fixture area outside the accepted runtime tree, while preserving existing evidence unchanged. Demonstrate that running boundaries does not prevent subsequent successful child execution and the intentional child-failure restoration check. Do not weaken the hard-link guard or clean preserved evidence to force a pass.

## Previous Seven Findings: Closure Assessment

Old IDs refer to `.cg-docs/reviews/2026-11-09-installed-package-one-survey-example-review.md:26-45`. Historical file/line numbers there describe the old implementation, not today's source. FINAL means `.tmp/one-survey/20261110T024500Z-followup-correction2`; RED means `.tmp/one-survey/20261110T022500Z-followup-red`.

| Old finding | Current code and executed evidence | Review conclusion |
|---|---|---|
| P1.1 pre-write destinations | `run.ps1:12-38` checks ancestors/recursive targets before :60-62 creates directories; hard-linked files rejected :31-34. Worker handoff:44,57 reports eight executed prewrite controls. | Narrow old hole appears repaired with worker-attributed behavioral evidence. Not an OS write-audit or certification of arbitrary caller-mutated trees. |
| P1.2 actual installer child | Private runtime/bootstrap in `run.ps1:90-115`; FINAL/logs/child-startup.log:2-8 shows actual resolver and lazy-load child paths confined to dedicated/private base libraries and contained staging. | Old parent-only mechanism replaced; actual child lookup evidence exists. Full usable exact-path namespace acceptance still incomplete, so V2 does not pass. |
| P1.3 exact snapshots/freshness | `run.ps1:39-41` rejects any existing setup/baseline attempt; `setup.R:68-79` also requires empty source/library before archive extraction. Worker handoff:59 reports populated-destination checks. | Narrow overlay/reuse defect appears repaired, with worker-attributed behavioral evidence. Not a certification of all installed dependency contents. |
| P2.1 behavioral baseline | RED/logs/baseline.log:1,8-9 records actual pipfun namespace absence from `usable()`. FINAL/logs/setup.log:26 shows green failure. | OPEN / partial: real red established; green acceptance missing. |
| P2.2 current provenance | `setup.R:132-158` records successful current installs and checks pins/receipts before `usable()`; exact paths :160-163 and inventory mutation controls :169-180 follow it. | OPEN / partial: downstream controls and namespace-path evidence NOT executed successfully. Inventory existence and DONE logs are insufficient. |
| P2.3 real negative boundaries | `setup.R:90-95`; FINAL/logs/install-missing-declared-cli.log:1-4 is the real declared dependency error, not a fabricated namespace. Worker handoff:44 reports eight actual prewrite controls. | Narrow proxy-control defect appears repaired. Boundary test layout itself has the new P2 finding above. |
| P2.4 environment restoration | `run.ps1:86-89,123-128` captures/restores caller process variables in finally. `checks.ps1:8-22,68-81` asserts caller equality and previous/unset settings. Worker handoff:38,63 reports baseline/prewrite failure restoration but not the successful/forced-failure pair. | OPEN / partial: static fix exists; required success/forced-child-failure pair NOT verified. |

These are role-local conclusions for consolidation, not edits to the historical review or a declaration that all seven are verified fixed. Required Plan:40-41,73-77 executed acceptance remains incomplete.

## Checks run
Static reads: charter, SYSTEM_DESIGN, HARVEST_BRIEF, approved follow-up Plan, previous seven-open review, implementation handoff and all three current scripts. Loaded R technical, analytical, shared, data.table, collapse and testing skills per `.kilo/instructions/r.instructions.md:7-19`; dialect confirmed in `compound-gpid.local.md:3`.

Read saved RED baseline and FINAL setup, child-startup, missing-dependency, stamp-install and pipfun-install logs. Independently confirmed their text: real missing declared dependencies; two DONE installs with missing E-local R.css warnings; nonexported-function failure. Boundary assertion outcomes and caller restoration execution are attributed to the worker handoff, not independently rerun here.

Read-only Git commands `git rev-parse HEAD` and `git branch --show-current` returned the full SHA above and `main`. Clock read recorded completion timestamp. No R, PowerShell harness, Pester, installer, scenario, diagnostic or verify execution. No write-capable shell commands used; therefore no child temp/home/cache/log defaults were invoked. All agent-authored writes were this E-local report via apply_patch.

No package repository sources were read in this review. Inherited pins from `setup.R:16-22` and worker handoff:83-91 (not independently refreshed or runtime-certified here): stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; pipfun `0c6a78d9884ed0965a524311537eec2a5095d60b`; pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6`; wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`; pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`; pipdata `13a38280c1eafe7e03a97837cdb57833fbe9d926`.

## Gaps
- Step 1 V1-V3 remain partial/failed; 2/2 correction budget exhausted. No new functional correction or rerun authorized by this review.
- Step 2 diagnostic NOT RUN. `setup.R:186-207` is unexecuted candidate code, not runtime confirmation of a pipaux/pipfun cause. Original survey gates unchanged; no numeric/statistical acceptance assessed.
- Exact loaded namespace paths, stale/incomplete inventory controls and successful/forced-child-failure restoration pair remain missing executed evidence. Binary inventory was not decoded by this static reviewer.
- Boundary negative assertions were not independently executed/read from a dedicated transcript; their results are worker-attributed. No exhaustive hook/compiled-code/OS write audit was performed.
- Full ten-role review consolidation and final light verify are coordinator-owned and outside this role's completed static review. No completion of the approved Plan is claimed.
