---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-data-quality
status: completed
updated: 2026-11-10T02:38:23Z
owner: cg-data-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates findings; implementation stays blocked with correction budget exhausted.
---

# Follow-up full data-quality review

## Summary
FULL read-only data-quality review completed. Four actionable findings: one P1 acceptance blocker and three P2 evidence/test defects. No P0 or P3 findings identified. No numerical result, survey row, welfare value, weight or PPP conversion was processed by this follow-up; no observed silent data corruption or incorrect statistical result is alleged.

Step 1 remains BLOCKED after 2/2 corrections. Two successful install exits are not usable-runtime acceptance. Stale/incomplete receipt mutations were never reached. Step 2, reduced diagnostic and original survey scenario were NOT RUN. This report completes the review role, not the Plan.

## Findings

### DQ-1
**[P1]** `experiments/one-survey/setup.R:34` -- Acceptance calls a nonexported stamp function.

**Issue**: `usable()` calls `stamp::st_extmap_defaults()`. Final retained setup output reports exactly that this is not exported, after both source installs return zero (`.tmp/one-survey/20261110T024500Z-followup-correction2/logs/setup.log:1-4,26-27`).

**Impact**: Every otherwise-successful setup/check reaches this error before namespace capture and exact loaded-path verification (`setup.R:35-38,160-163`). Because `verify(inventory)` precedes mutations (`:168-177`), neither the three stale/incomplete controls nor the V2/V3 PASS marker executed. The error is a harness-control defect, not a demonstrated package or survey-data defect.

**Fix**: Under a separately authorized correction budget, use a documented exported stamp operation supported by the pinned snapshot with a minimal meaningful expected result. Retain both real namespace loading and exact-path acceptance; do not bypass the control with internal namespace access or weaken acceptance to installation exit/Version alone.

### DQ-2
**[P2]** `experiments/one-survey/checks.ps1:56-57` -- A negative-test fixture contaminates its own accepted runtime.

**Issue**: `$testRoot` is `$runtime/boundaries` (`:31`). The hard-link case retains its target at `$testRoot/log-target`, linked to a sibling attempt's `logs/setup.log`. Subsequent launches recursively scan the whole accepted runtime and reject that target as a hard-linked file (`run.ps1:24-38`). The worker records the actual subsequent pre-child failure (`20261110T021917Z-followup-implementation/handoff.md:44-47,63-65`); the retained boundary directory contains `log-target`.

**Impact**: Later check/inspect/forced-failure/diagnose launches cannot reach R in that attempt. Caller restoration after successful and intentionally failing R children remains unverified; a prewrite rejection is not evidence for those child outcomes. This is a fixture-layout problem, not evidence that the launcher should accept hard links.

**Fix**: In an authorized correction, construct negative fixture targets in a distinct fresh E-local test area outside the runtime that later positive launches must scan. Preserve existing evidence; keep the recursive guard. Re-establish a usable positive child and an actual intentional failing child before certifying restoration. No relocation, cleanup or rerun was performed or is authorized by this review.

### DQ-3
**[P2]** `experiments/one-survey/setup.R:145-148` -- Dependency inventory contents are recorded but not reconciled.

**Issue**: `verify()` requires only `nrow(inventory$dependencies) > 0L`. The dependency rows' package names, versions, origin paths, destination paths and DESCRIPTION digests (`:121-124`) are otherwise unused. Exact pin/receipt checks cover only `required = c("stamp", "pipfun")`; `safe(paths)` merely confines namespace paths below root, and `:161-162` compares exact paths only for those two project packages.

**Impact**: Once DQ-1 is corrected, a nonempty dependency table copied from another attempt, truncated to one row, or carrying stale version/path/digest values is not rejected by these checks. The harness could label its inventory current despite incorrect dependency provenance. This is a static false-pass path, not an executed stale-inventory acceptance or observed numerical error. The final table currently records 53 dependency rows; no present row mismatch is alleged.

**Fix**: Minimally reconcile the already-recorded dependency rows with the current attempt's copied dependency directories: expected package membership, current exact destination, Version and existing DESCRIPTION digest; bind loaded contributed dependency paths to those destinations. Add one directly targeted stale-dependency-row rejection alongside the existing receipt mutations. No new framework, dependency, general schema system or whole-library checksum scheme is proposed. This is a bounded completion of existing provenance checks, not a claim to certify arbitrary package binaries.

### DQ-4
**[P2]** `experiments/one-survey/checks.ps1:12-16` -- Redirected-target controls accept an unrelated rejection reason.

**Issue**: `Invoke-Expected` accepts any caught error when `$fails` is true. Each redirected-target case first creates an existing attempt (`:35-40,54-58,61-64`), and `run.ps1:39-40` independently rejects any existing attempt for setup. Consequently those cases can pass through the existing-attempt rejection even if the recursive redirect/hard-link guard regresses. Unchanged target/no-temp assertions also pass in that alternative path. The baseline does inspect its specific R error (`checks.ps1:26-27`); the redirect cases do not.

**Impact**: The emitted message claiming redirected targets were rejected (`:66`) cannot by itself distinguish the intended guard from the coarser reuse guard. Current source has the recursive guard, and the worker reports successful negative invocations, but the tests are not specific regression evidence for that guard. Similarly, a generic failure is insufficient to certify the forced-failure R child if it never starts.

**Fix**: Keep the small direct-assertion helper, but require the intended failure reason for each boundary case and evidence of actual child entry for the forced-failure case. Retain separate populated-attempt assertions. Do not manufacture a passing result from any exception or relax the prewrite guard. No tests were rerun here.

## Inventory, Pins, Receipts And Execution Assessment

Use FINAL = `.tmp/one-survey/20261110T024500Z-followup-correction2` throughout this section.

- **Source pins:** `FINAL/pins.tsv:2-8` agrees textually with the seven hardcoded package records at `setup.R:10-22` and worker table `handoff.md:83-91`. Pins are immutable full SHAs, not HEAD/latest lookups. `setup.R:68-79` rejects nonempty source/library trees then extracts archives into new package directories. `run.ps1:39-40` rejects any existing setup attempt before normal creation. No source overlay is claimed in this fresh attempt.
- **Actual bounded installation scope:** only stamp and pipfun are `required` (`setup.R:24,133-139`). All seven source pins being present does not mean seven packages were installed or runtime-verified. Retaining five uninstalled pins is not an error in this bounded follow-up.
- **Install evidence:** `FINAL/logs/install-stamp.log:13` and `install-pipfun.log:15` show DONE; `FINAL/logs/setup.log:3-4` records exit zero and the expected dedicated destination. Stamp is reported as 0.1.0, pipfun as 1.0.1 by their install logs (`:2` each). Both commands use `--no-test-load` (`setup.R:58`), so these are installation results, not proof of final usable namespace/path acceptance.
- **Current inventory timing:** `setup.R:132-142` constructs receipts only after each required installation exits zero, adds installed Meta/package.rds digests, then writes inventory. The final directory contains `inventory.rds`; the worker reports its successful creation (`handoff.md:61`). Unlike the original implementation, inventory is not written before installs. Its binary contents were not independently deserialized in this no-R review.
- **Intended receipt checks:** `setup.R:145-158` compares current root, exact seven-package data.frame, required receipt membership, required-package SHA/path, archive digest, installed metadata digest and DONE log marker. These are meaningful narrow improvements over inventory existence/Version alone. They do not establish an exhaustive code/binary audit, and are not represented as one. The final run reached `usable()` from `verify()`; source order plus the retained error supports that preceding assertions did not stop it, but is not an independent inventory revalidation.
- **Copied dependencies:** `FINAL/dependencies.tsv:1-54` has 53 rows with package/version/origin/path/DESCRIPTION digest. Origins are E-local ambient installed packages under `E:/PovcalNet/01.personal/wb384996/R/win-library/4.5`; destinations are under `FINAL/library`. They are copied installed dependencies, not rebuilt Git-pinned package sources. DQ-3 concerns validation of these existing records, not a demand to introduce dependency source pins.
- **Actual child lookup evidence:** `FINAL/logs/child-startup.log:1-8` records the top-level process, real installer children and lazy-loading children. Observed paths are `FINAL/library`, `FINAL/r/library`, with `FINAL/library/00LOCK-{stamp,pipfun}/00new` for staging. No ambient contributed-library path appears in those records. This is startup lookup evidence, not a final loaded-namespace inventory or an OS-wide write audit.
- **Real dependency failure:** `FINAL/logs/install-missing-declared-cli.log:1-4` reports unavailable actual stamp dependencies including cli, followed by removal of the attempted dedicated stamp installation. `setup.log:1-2` records the expected failed install and control confirmation. This is not a fabricated requireNamespace failure.
- **Behavioral red baseline:** `.tmp/one-survey/20261110T022500Z-followup-red/logs/baseline.log:1,8-9` records actual missing pipfun namespace failure. This is stronger than testing inventory absence. Baseline red is not green acceptance.
- **Stale controls, intended only:** `setup.R:169-177` would remove pipfun's receipt, replace its SHA, and replace its receipt root, then demand verification errors. None executed: the first good verification failed in `usable()` at `:168`. Do not describe these as passing negative tests. No final `namespace-paths.tsv` or `diagnostic.rds` appears in the retained FINAL directory listing.
- **Exact loaded paths:** `setup.R:160-163` intends to compare stamp/pipfun paths to `FINAL/library/<package>` after collecting all namespaces. This was not reached because DQ-1 precedes namespace collection. The observed installer lookup paths must not substitute for that missing evidence.
- **Status and downstream:** worker `handoff.md:69-77,107-112` accurately retains follow-up V1-V3 partial/failed, V4 not run, original V1/V5 failed and original V2-V4 not run. The diagnostic block at `setup.R:186-207` is candidate code only; there is no new runtime diagnosis, invalid-survey rejection, welfare/weight validation, join/cardinality result, deflation or numerical scenario to assess. No package diagnosis is promoted from source-supported to runtime-confirmed.

### Recorded Source Pins (Not Independently Re-archived)

| Package | SHA from FINAL/pins.tsv |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

## Changes
Only this exact report was created and finalized. No code, Plan, other handoff, package, protected artifact or Git writes. No commits. No recommendation to delete, replace, rename or move protected project records.

## Checks run
Read the approved Plan, worker handoff, all three requested harness files, project charter/design/harvest brief, reporting contract and local R dialect configuration. Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-analytical, cg-skill-r-collapse and cg-skill-r-datatable.

Inspected retained text pins/dependency table, setup/install/startup logs, red baseline and final/boundary directory listings using read tools. Reasoned through execution order and false-pass paths statically. Read-only `git rev-parse HEAD` / `git branch --show-current` returned main at f9454707b292a620e25abef17f2e515794020ba7. Read system clock for the UTC report timestamp; no output files were created by those commands.

No R, setup, script, test, Pester, diagnostic, scenario or fix executed. No package repository/source files were read directly by this reviewer; package SHAs above are retained pin evidence, not a fresh source-repository audit. No writing process needed temp/home/cache/log redirection because no such process was started; only the authorized E-local report was written through apply_patch.

## Gaps
- The inventory.rds binary was not independently deserialized; field/receipt construction and validation were assessed from code, retained installation output and the worker's explicitly attributed account.
- DQ-3 and DQ-4 are static false-pass analyses; no inventory mutation or guard-disable experiment was executed. DQ-1 is corroborated by retained failure output; DQ-2's actual subsequent-launch failure is attributed to the worker handoff, supported by fixture/guard source and retained target listing.
- Successful final namespace paths, stale receipt rejection, stale dependency rejection and restoration after both successful and intentional failing R children remain unverified. No numerical validation is inferred from installer DONE markers.
- Final reduced diagnostic, original scenario and exhaustive third-party/OS write behavior remain unexecuted or UNKNOWN, not silently passed.
- Two step-1 corrections are exhausted. This review grants no correction-budget extension, package edits, additional execution or protected-record changes. Coordinator owns consolidation and any subsequent approval request; no functional work continues from this report.
