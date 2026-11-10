---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T021917Z-followup-implementation
status: blocked
updated: 2026-11-10T02:32:44Z
owner: followup-implementation
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Parent reviews blocked implementation; another functional correction requires an explicitly revised budget before step 2 can resume.
---

# Harness Repair And Diagnosis

## Summary
Execution authorized by current task for steps 1 and 2, sequentially. Step 1 is BLOCKED after initial implementation plus both authorized targeted corrections. Step 2 NOT STARTED because V1-V3 do not all pass. Parent owns full review and final verification. No original survey scenario executed or original gate passed.

Final setup installed pinned stamp and pipfun through real restricted installer children, then stopped on a harness bug: usable() calls stamp::st_extmap_defaults(), which is not exported. Exact first final-attempt failure: .tmp/one-survey/20261110T024500Z-followup-correction2/logs/setup.log:26. This is not a pipaux diagnostic, invalid-survey rejection, or package defect claim. No further functional fix made after budget exhaustion.

## Changes
- experiments/one-survey/run.ps1: fresh named attempts; recursive reparse/hard-link rejection including ancestors/files; no populated attempt reuse; E-only process environment restored in finally; private R copy containing only base/recommended packages; copied base startup profile audits real children before resolution.
- experiments/one-survey/setup.R: preserved seven pins; bounded stamp/pipfun installs; actual missing declared-dependency failure; copied dependency provenance; current-install receipts and candidate exact-path/stale-inventory checks; candidate diagnostic code (NOT RUN).
- experiments/one-survey/checks.ps1: direct PowerShell assertions, written before harness edits; usable-package red baseline and prewrite/reuse/restoration checks. No Pester/framework/download.
- This exact fresh handoff updated at checkpoints and final. No Plan, parent Work/Review Report, active-state, old handoff or original runtime modified by worker. No package/shared/production/Git mutations.

Fresh runtime folders created by this attempt: 20261110T022500Z-followup-red, 20261110T023500Z-followup-green, 20261110T024000Z-followup-correction1, 20261110T024500Z-followup-correction2, plus fresh -negative-* and -populated-* test sibling directories. All are below .tmp/one-survey/. These labels identify distinct fresh attempts; do not infer execution times from the labels. Prior .tmp/one-survey/{logs,sources,library,store,inventory.rds,reproduce-pipaux.R} untouched. No attempt was reused for setup or cleaned/deleted.

## Checks run
Read canonical Plan thoroughly, charter, SYSTEM_DESIGN, HARVEST_BRIEF, contract, prior seven-open review, prior Work Report and old scripts. Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-shared and cg-skill-r-testing.

Historical executed commands below are evidence, not prompts to rerun. PowerShell, current pipsystem root; launcher sets child environment before every R launch and descendants inherit it:

| Invocation | Result |
|---|---|
| checks.ps1 -Phase baseline -RunId 20261110T022500Z-followup-red | expected child exit 1: actual pipfun load absent; restoration assertions passed |
| run.ps1 -Mode inspect -RunId 20261110T022500Z-followup-red | exit 0; actual installer code, R home/base priorities/copy size recorded |
| checks.ps1 -Phase boundaries -RunId 20261110T022500Z-followup-red | 6 prewrite/reuse controls passed |
| run.ps1 -Mode setup -RunId 20261110T023500Z-followup-green | real missing-dependency control passed; stamp lazy-load child rejected legitimate staging path; setup exit 1 |
| run.ps1 -Mode setup -RunId 20261110T024000Z-followup-correction1 | base startup stopped because tail() not available before utils attaches; setup exit 1 |
| run.ps1 -Mode setup -RunId 20261110T024500Z-followup-correction2 | real missing-dependency control passed; stamp/pipfun installs exit 0; usable control failed on non-exported stamp function; setup exit 1 |
| checks.ps1 -Phase boundaries -RunId 20261110T024500Z-followup-correction2 | 8 controls passed: 4 redirected directories, 2 populated destinations, hard-linked setup.log, redirected runtime ancestor |
| direct caller snapshot/assertion block invoking inspect then forced-failure on final attempt | FAILED before child: boundary-test hard-link target now causes recursive guard rejection; success/forced-failure pair NOT verified |

Command count: 8 harness/assertion invocations above; 5 top-level R invocations attempted (including startup failure), 5 actual R CMD INSTALL invocations total across setup runs: 2 expected missing-dependency failures, 1 staging-guard failure, 2 successful installs. Both successful installs used --no-test-load; installed runtime acceptance did not pass. No forced-failure R child ran. No diagnostic or scenario command ran. Initial red baseline was behavioral, not inventory absence. Old unsafe implementation was not run merely to manufacture a red result.

PowerShell Parser.ParseFile checks on run.ps1/checks.ps1: zero syntax errors each. setup.R parsed/executed through final acceptance failure. Read-only git status and rev-parse confirmed main/f9454707b292a620e25abef17f2e515794020ba7; preexisting .gitignore and active-state edits and parent-owned untracked artifacts preserved. No review executed by worker.

## Finding-To-Check Evidence

Let FINAL mean .tmp/one-survey/20261110T024500Z-followup-correction2.

| Finding | Executed evidence and honest status |
|---|---|
| P1.1 actual prewrite destinations | 8 direct negative assertions passed. E-only junctions at base-library/logs/sources/library, hard-linked logs/setup.log, runtime junction ancestor all rejected before temp creation; redirected targets unchanged. Populated sources/library preserved sentinel. Recursive guard includes actual copied private r/library and all existing descendants. No outside-E exploit attempted. |
| P1.2 real installer child | FINAL/logs/child-startup.log:2-8 shows real dependency-resolution and lazy-loading children: dedicated library, private default library, and contained 00LOCK-*/00new only. FINAL/logs/install-missing-declared-cli.log:1-4 proves actual pinned stamp declared dependencies unavailable despite mixed original C library. Final namespace-path inventory NOT produced, so full runtime provenance remains incomplete. |
| P1.3 fresh exact snapshots | Existing populated sources/library rejected before writes in both boundary runs; new setup IDs used after every failed setup; seven Git-object archives extracted only into new directories; no overlay/reuse or original runtime change. |
| P2.1 real usable baseline | RED loadNamespace pipfun absence captured in red/logs/baseline.log; GREEN FAILED at non-exported stamp control after installs. This finding is NOT verified fixed. |
| P2.2 current install provenance | FINAL/inventory.rds saved only after successful installs, includes exact pins, current root/path, install exit/log/archive and installed Meta/package.rds digests. Receipt checks precede usable() but stale/incomplete mutation controls and loaded exact-path check occur after usable(), therefore were NOT reached. NOT verified fixed. |
| P2.3 real failures | Actual R CMD INSTALL pinned stamp fails declared cli/fs/rlang/secretbase/jsonlite/data.table/nanoparquet/qs2 resolution; not fabricated requireNamespace. Eight actual prewrite controls passed. |
| P2.4 caller restoration | baseline failure and prewrite failures compare all caller env keys and ErrorActionPreference successfully. Previous/unset success plus forced child failure pair NOT verified: benign hard-link target in FINAL/boundaries makes later recursive guard reject before child. Do not claim completion from finally code alone. |

The boundary tests themselves leave a benign hard-link target under FINAL/boundaries; later launches fail closed there. This is an additional test-layout limitation. No cleanup, relocation or code correction attempted after budget exhaustion.

## Verification Status

| ID | Status |
|---|---|
| Follow-up V1 | PARTIAL / failed gate: prewrite checks pass; success/forced-failure caller pair incomplete |
| Follow-up V2 | PARTIAL / failed gate: actual child isolation and real declared missing-dependency failure demonstrated, 2 successful installs, but complete usable exact-path acceptance not passed |
| Follow-up V3 | PARTIAL / failed gate: fresh/reuse controls and behavioral RED pass; GREEN, stale/incomplete inventory controls and namespace-path evidence incomplete |
| Follow-up V4 | NOT RUN: sequential step-1 gate did not pass |
| Follow-up V5 | Parent-owned reviews and verify pending; worker performed none |

Original Plan V1/V5 remain failed; V2-V4 remain NOT RUN. No validation, cleaning, storage, numeric, malformed-survey, live DLW, deflation, means or incremental scenario executed.

## Source And Installed Provenance

Every package repository read through exact-object inspection/archive is recorded here; these are the original seven SHA pins, not moving HEADs:

| Package | Exact SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

FINAL/pins.tsv records exact repository paths. FINAL/dependencies.tsv records 53 copied contributed dependencies with versions, E ambient origins E:/PovcalNet/01.personal/wb384996/R/win-library/4.5/<package>, exact FINAL/library/<package> destinations and DESCRIPTION digests. No source changes or downloads. Examples: cli 3.6.6, fs 2.1.0, rlang 1.3.0, data.table 1.18.4, qs2 0.2.2; complete table is the evidence, not this sample. Final successful install destinations are FINAL/library/stamp (0.1.0) and FINAL/library/pipfun (1.0.1); receipts bind current archive and installed metadata. Full loaded namespace paths UNKNOWN because usable() failed before capture. Package Version alone is not treated as pin proof.

## Startup, Paths And Deviations

Read shared R base startup profile (C:/Program Files/R/R-4.5.2/library/base/R/Rprofile:134-153 recreates .Library and .libPaths), site profile (only help option active), Rcmd_environ (R_HOME-relative paths and tools PATH), pinned stamp/pipfun startup hooks and pipfun control implementation before first installation. Private inspector saved actual tools:::.install_packages body before actual install. Pinned source hook text for all seven archives saved in setup logs/source-hooks.txt before install.

Private runtime deviation: copied bin/etc/include/modules/share plus only 29 base/recommended library packages, not symlinks/hardlinks. The copy is E-local inside each fresh attempt, 2281 files / 137003995 bytes before setup (red inspector). Only copied base Rprofile is appended with child audit and E-contained library assertion/options; shared R and installed package namespaces remain unchanged. This avoids parent .Library rebinding and private installer internals. Actual install children resolve default .Library to FINAL/r/library, not mixed C library; legitimate installer staging is allowed only below FINAL/library.

Launcher redirects TEMP/TMP/TMPDIR, home/user profile, R user/site startup/Makevars/history/library paths, app-data/XDG/R cache/config/data, renv/pkg cache, Git config, PIP/DLW roots and R_HOME/share/include/doc before child execution. Child PowerShell dependency-copy scans use -NoProfile and inherit these settings. No Pester or unavailable execution tool used. No OS-wide write tracing or exhaustive audit of arbitrary third-party compiled code was performed; do not infer one.

Private doc directory is not copied: successful installs warn about missing private r/doc/html/R.css (install-pipfun.log:10-11); this is an E-local missing-file warning, not a fallback to C or install failure. Untar emits pax-global-header warnings for exact Git archives. Both limitations preserved, not hidden or corrected beyond budget.

## Diagnostic And Owner Direction

First reduced package diagnostic: NOT RUN. No current diagnostic.rds and no new missing-cache error claimed. Original preserved first package error remains .tmp/one-survey/logs/install-pipaux.log:7-11, ENOENT clean_survey_data during lazy loading. Exact source inspection supports pipaux R/zzz.R:1 calling pipfun::pip_create_globals(), whose NULL-vintage branch lists absent clean_survey_data (pipfun R/pip_create_globals.R:228-238) despite documented create_dir=FALSE path-return behavior (:14-17). Runtime confirmation in the repaired harness remains UNKNOWN; do not label original survey V1 or invalid-survey rejection as passed.

Owner direction remains proposed, not applied: pipfun/pipaux owners should decide startup behavior for absent cache and reconcile documented no-create path discovery with top-level startup assumptions. No package fix, missing-cache precreation, fake vintage, internal worker call or namespace patch was used. First fix required here is the harness's unusable exported stamp-control assumption and test target layout, subject to a revised correction budget; only then rerun step-1 evidence before step 2.

## Correction Budget
Step 1: 2/2 corrections used, 0 remaining. Step 2: 0/2 corrections used, 2 remaining. Initial implementation is not a correction. Correction 1 allows legitimate installer staging libraries contained below the dedicated library, rather than requiring exactly two paths. First setup stopped safely at the overly narrow startup assertion before lazy loading (install-stamp.log:6-10 in 20261110T023500Z-followup-green); preserve that attempt. Correction 1 attempt 20261110T024000Z-followup-correction1 then failed at startup because tail() is in utils, not yet attached at base-profile execution. Correction 2 replaces it with base indexing and adds explicit hard-linked-log/redirected-ancestor behavioral cases; no budget reset.

## Checkpoint 1
Safe red baseline executed in 20261110T022500Z-followup-red: actual pipfun namespace loading failed because package is absent, before any installation. Old unsafe baseline was not run. Six E-only boundary controls executed: redirected base-library/logs/sources/library and populated sources/library all rejected before temp/output creation; redirect targets remained empty and populated sentinels preserved. Private runtime inspection: 29 base/recommended packages, 2281 files, 137003995 bytes; no mixed contributed library. Real tools installer code saved before installation in red/logs/installer-source.txt (dependency resolver lines 715-779, staged paths 834-846, child lazy-loading 1375-1407). Five runtime directories plus base/recommended library copied, not shared R modified; private base startup audit is the documented bootstrap deviation.

## Gaps
- Required V1-V3 acceptance remains incomplete; final failure preserved and correction budget exhausted. Parent must not count successful install exits as full acceptance.
- P2.1 GREEN, P2.2 stale/incomplete inventory and loaded namespace checks, and P2.4 success/forced-failure child pair remain unverified. Test benign hard-link target contaminates later guard scans; no cleanup permitted/performed here.
- Step 2 and reduced pipaux/pipfun diagnostic NOT RUN; original survey Plan still blocked. Diagnostic code exists but is not evidence.
- Full ten-role review and final light verify belong to parent and were not run by worker. get_errors and execution_subagent unavailable; no Problems API or Pester result fabricated.
- No exhaustive third-party hook/compiled-code or OS write audit. Startup/child paths were observed, but this is not an OS sandbox certification. Copied dependency source versions/origins are recorded; original ambient installs themselves were not rebuilt.
- No commits/pushes/merges/reviews or package/protected/shared changes. Parent-owned dirty/untracked artifacts remain outside worker ownership.
