---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-reproducibility
status: completed
updated: 2026-11-10T02:38:17Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates review; implementation remains blocked pending a revised correction budget.
---

# Follow-up reproducibility review

## Summary
FULL reproducibility review completed with two P2 findings. Step 1 remains BLOCKED after 2/2 corrections; Step 2 NOT RUN. Two successful install exits are supported by retained logs, but do not establish usable exact-path acceptance or closure of the seven original findings. No R/setup/scripts/tests/fixes executed by this reviewer.

## Findings

**[P2]** `experiments/one-survey/setup.R:33-34` -- Usable-package acceptance calls an unavailable public API.
**Issue**: `stamp::st_extmap_defaults()` is not exported by pinned stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`. Both installs finish, but this expression stops verification before namespace capture, loaded-path checks and stale/incomplete inventory controls. FINAL/logs/setup.log:26-27 records the exact runtime error; FINAL/sources/stamp/NAMESPACE:4-42 lists the public exports without this function. Independently inspected that NAMESPACE directly from the Git object; it agrees with the extracted file. Therefore no usable-package GREEN evidence exists, and the clean installed pipfun diagnostic cannot proceed through this gate.
**Fix**: Within a newly authorized correction budget, select a read-only exported behavior actually present in the pinned public API, without changing pins, patching namespaces or using an internal accessor. Rerun the required acceptance and receipt-mutation checks in a fresh attempt before the diagnostic. No fix applied.

**[P2]** `experiments/one-survey/checks.ps1:31,56-57` -- Boundary fixture makes the reviewed attempt unusable for subsequent checks.
**Issue**: The hard-link target is retained at `<runtime>/boundaries/log-target`; both target and negative-case log become hard-linked files. The next launcher invocation recursively scans that same runtime (`run.ps1:24-38`) and rejects the target before launching R. Thus the boundary test obstructs the successful-check/forced-child-failure pair at checks.ps1:75-76, rather than testing caller restoration across those child outcomes. Worker handoff:45,63-65 reports the actual pre-child stop. Static control flow supports it; this reviewer did not rerun it.
**Fix**: In an authorized correction, place newly created negative-case fixtures in a separate fresh E-local sibling test area outside the successful attempt's scanned tree, retaining existing evidence. Then demonstrate both a successful child and an intentional failing child with prior/unset caller keys restored. Keep the recursive guard intact. No fixture cleanup or code change performed.

No supported P0/P1 or additional P3 reproducibility findings identified in this bounded review. Missing renv/lockfile is not added as a speculative requirement: the approved minimal local experiment explicitly uses exact project archives and recorded preinstalled dependency copies, not a portable replication distribution.

## Changes
Only this report was created and finalized. No code, package, Git, protected-record or runtime-artifact changes. No new framework/dependency/safeguard proposed. Review evidence was communicated to coordinator on the shared board.

## Checks run
Loaded required R technical/analytical and communication skills. Read charter, SYSTEM_DESIGN, HARVEST_BRIEF, approved Plan, coordination contract, worker handoff and all three requested harness files. Read targeted existing evidence only. `FINAL` below means `.tmp/one-survey/20261110T024500Z-followup-correction2`.

| Surface | Evidence inspected | Conclusion and limit |
|---|---|---|
| Checkout | Read-only `git rev-parse HEAD` and `git branch --show-current` | main / f9454707b292a620e25abef17f2e515794020ba7. No Git mutation. |
| Behavioral RED | `.tmp/one-survey/20261110T022500Z-followup-red/logs/baseline.log:1,8-9` | Actual absent pipfun namespace, not missing-inventory proxy. Historical line numbers in log are not current-source locations. |
| Real child isolation | FINAL/logs/child-startup.log:1-8; FINAL/r/library/base/R/Rprofile:134-153,219-231; run.ps1:45-58,90-116 | Actual dependency-resolution and staged lazy-load children show dedicated E library and private E base/recommended library; staging is inside the dedicated library. This specifically improves the former parent-only .Library mutation. Not a complete namespace or OS-write audit. |
| Missing dependency control | FINAL/logs/install-missing-declared-cli.log:1-4; setup.R:88-96 | Real pinned stamp INSTALL fails for declared cli/fs/rlang/secretbase/jsonlite/data.table/nanoparquet/qs2. Not a fabricated requireNamespace failure. |
| Successful installations | FINAL/logs/install-stamp.log:1-13; install-pipfun.log:1-15; setup.log:1-4 | stamp and pipfun DONE, exit 0 reported. Both use --no-test-load (setup.R:57-59), so no installed usability pass inferred. Missing E-private R.css and pipfun byte-compile notes remain visible. |
| Fresh source destinations | run.ps1:38-44; setup.R:68-79; worker handoff:29,40-44,59 | Code rejects prior attempts and populated sources/library before extraction; worker reports executed sentinel preservation/rejection. No extraction overlays in current source. Reviewer did not independently rerun boundary controls or prove extracted-tree equality. |
| Receipts | setup.R:132-181; FINAL directory listing; worker handoff:61 | inventory.rds exists, creation follows both exit-zero installs. Verification checks current root/pins/receipt names, archive and installed-metadata digests plus DONE logs before usable(). But inventory contents were not decoded here; negative mutation controls at :169-177 and namespace-path output :178-180 are unreached after observed usable() failure. Receipt existence is not provenance closure. |
| Pins and dependencies | FINAL/pins.tsv:1-8; dependencies.tsv:1-54; setup.R:97-131 | Seven fixed source SHAs and 53 copied dependencies recorded with versions/origins/destinations/DESCRIPTION MD5. Copies come from E ambient installations into fresh library; neither source builds nor byte-identical dependency reconstruction independently proved. |
| Hooks | FINAL/logs/source-hooks.txt:1-324; setup.R:82-87; run.ps1:63-85,103-114 | Source hook text saved before installs; pipfun auto logging disabled before resolution. stamp hook adjusts options/environment; pipfun hook respects log.auto. pipaux top-level globals and pipdata logging hooks are retained evidence, not newly executed here. This filename-based hook listing is not exhaustive arbitrary-code analysis. |
| Caller restoration | run.ps1:86-89,123-128; checks.ps1:8-23,68-81; worker handoff:38,45,63 | finally restores saved values in source; worker reports baseline/prewrite failure comparisons passed. Successful and forced-failure child pair remains unverified. Static finally code does not close the finding. |
| Diagnostic boundary | setup.R:186-207; worker handoff:74,107; FINAL directory listing | Diagnostic exists only as candidate code; diagnostic.rds and namespace-paths.tsv absent in inspected final listing. Step 2 NOT RUN; no current package-cause confirmation. |
| Historical pipaux failure | `.tmp/one-survey/logs/install-pipaux.log:7-11` | Original missing clean_survey_data lazy-load error retained. Not evidence that repaired runtime reproduces it; not original survey acceptance. |

Read-only exact-object command: Git show of stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25:NAMESPACE`. No scripts or tests executed. No process that creates cache/temp/home/log files was started. All report writes used apply_patch at the single authorized E-local path.

## Source SHAs

Source hooks from all seven retained snapshots were read; their recorded pins (FINAL/pins.tsv:2-8 and setup.R:16-22) are:

| Package | Source SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

Only stamp's public namespace was independently inspected from its repository's exact Git object in this review; other package evidence is retained snapshot/hook evidence, not refreshed package HEAD or installed namespace proof.

## Gaps
- Follow-up V1-V3 remain partial/failed, not closed by static review. Step 1's 2/2 correction budget is exhausted (worker handoff:111-112); this review authorizes no additional fixes or runs.
- Step 2/V4 NOT RUN; original survey V1/V5 remain failed and V2-V4 NOT RUN (worker handoff:77). No survey/means/deflation/storage/manifest scenario or stochastic analysis executed. Seed and research-results manifest requirements do not apply to these nonstochastic install controls; they remain unevaluated for the unrun survey.
- No reviewer R, setup, script, test, diagnostic or inventory-deserialization execution. Eight boundary assertions and caller-failure restoration results are attributed to worker evidence, not independent reruns. Binary inventory internal values remain UNKNOWN in this review.
- Child library startup observations are not full loaded-namespace provenance, an OS sandbox or exhaustive third-party/native-hook audit. Dependency versions/origins/DESCRIPTION hashes document the local copies, not a lockfile-only portable rebuild.
- Full review aggregation, correction decisions and final light verification belong to coordinator. Review role completed does not mean Plan completed. Parent must obtain an explicitly revised correction budget before more functional repair; protected records must remain untouched.
