---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/verify-quality
status: completed
updated: 2026-11-10T23:04:36Z
owner: cg-code-quality verification
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Parent integrates this verification; original Plan stays blocked on pipdata fresh-master handling.
---

# Final light code-quality verification

## Summary
Final light-only cg-code-quality verification completed. P2.1 and P3.1 closure verified against current source and retained execution evidence. No new supported P0, P1, P2 or P3 issues found in the six scoped experiment files, including no supported cross-file breakage. This is review completion, NOT original Plan or scenario clearance.

Parent review: `.cg-docs/reviews/2026-11-10-survey-resume-review.md:6-8` explicitly marks both findings fixed. Applied the requested suppression only inside the QS2 selector/copy/verification/usability and diagnostic downstream-wording blocks; no P0/P1 or cross-file breakage suppressed and no other code inferred fixed.

### Verified finding closure

- **P2.1 fixed:** `experiments/one-survey/setup.R:25-30` explicitly selects the existing 4.5-pipapi origins for qs2, stringfish and RcppParallel. Dependency traversal/copy records each selected origin, installed version, destination and DESCRIPTION MD5 (`setup.R:148-180`); verification binds those records back to the same selector and copied installation (`setup.R:193-211`). The real unmocked `qs2::qs_save()`/`qs_read()` exact-object roundtrip is mandatory (`setup.R:38-45`) before setup acceptance through `verify()` (`setup.R:224-235,262`). Corrected `dependencies.tsv:10-12` records RcppParallel 6.2.0, stringfish 0.19.2 and qs2 0.2.2 from those origins. Corrected `logs/setup.log:3-9,31,54-65,92-93,126` retains seven successful installs, verification progress, native namespace private paths and the final acceptance marker. The log does not separately print a QS2 success marker: roundtrip success follows from source control flow reaching acceptance, corroborated by actual scenario storage/validation evidence.
- **P3.1 fixed:** current `setup.R:277` stores `NOT RUN in diagnostic mode: survey, storage or numeric scenario`, and `setup.R:284` prints that field. It no longer claims pipaux is absent. Current line numbering differs from the parent's earlier snapshot; the referenced block and correction remain present. Diagnostic mode verifies installed packages first (`setup.R:233-235`) without invoking scenario.R. This closure is source-inspected; diagnose mode was not rerun.

### Cross-file coherence

- `run.ps1:1,94-100` accepts the new modes and dispatches scenario/reproduce to their actual corresponding files, with dependency-probe/evidence handled in setup.R (`setup.R:63-83`). Arguments preserve the shared setup script's mode discrimination (`setup.R:7`); sourcing setup from scenario/reproduce does not rerun installation or diagnostic blocks.
- `scenario.R:8-9` and `reproduce.R:5-6` both use the same inventory verifier. Launcher run-root and environment setup/restoration (`run.ps1:9-19,35-64,103-108`) remain coherent with paths.ps1 and checks.ps1. `checks.ps1:112-116` exercises the actual forced-failure mode; retained corrected `logs/outer-green.log:119-129` shows the expected R child failure and restoration assertion result.
- `scenario.R:128-145` requires successful completed validation, fresh SYNA valid/SYNB invalid classifications, zero validation execution failures and the actual missing-weight diagnostic before invoking the real exported clean wrapper. Corrected `logs/scenario.log:103-160` and `logs/evidence.log:1-37` corroborate those completed checks.
- `scenario.R:150-179` retains separate actual saved clean/metadata pin reads and a paired welfare/weight oracle, plus downstream absence assertions. These are coherent executable assertions but unexecuted after the package failure, not achieved outcomes.
- Current `reproduce.R:9-13,40-55` selects a separate new store, real release setup and the saved completed-valid inventory, calls the exported `pd_process_data(inv, bootstrap = TRUE)`, then requires the precise missing-master error and zero master versions. `logs/reproduce.log:1-16` corroborates that exact boundary and explicitly denies scenario acceptance. Reproducer mode needs scenario validation-result.rds as an input; that artifact exists in the retained corrected runtime and is generated at `scenario.R:126`. It is not a setup-only standalone numeric example.

### Blocked scope preserved

Corrected `logs/scenario.log:255-258` fails on absent `pip_master_inventory.qs2`; current reproducer confirms the same public-call boundary. V2/V4 remain partial and V3 not reached, consistent with implementation handoff `:78-83` and Plan `:88-92,110-114`. Empty downstream catalogs before a globally failed clean wrapper are not proof of invalid-survey downstream rejection. No master seeding, internal-worker bypass, package patch, changed pin, budget expansion or Plan clearance proposed. Conservative accounting remains two step-1 corrective edits and zero step-2 corrections (implementation handoff `:57`). Parent owns the separate package-owner direction and final review consolidation.

## Changes
Only this exact required handoff created and finalized. No source, canonical review, Plan, package, configuration, Git or derived-view changes. No fixes required from this bounded review.

## Checks run
Executed: specialized file reads, skill loading, board coordination reads, this report's two writes through apply_patch, and `[DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ')` solely for the UTC report timestamp (result 2026-11-10T23:04:36Z).

Read: parent review, original revision-1 Plan, implementation handoff, project charter/design/harvest brief, local dialect and R instruction router, coordination contract/review command, all six current scoped source files in full; corrected runtime setup/dependency provenance excerpt, installed-packages.tsv, session-info.txt, outer-green tail, scenario validation/failure section, evidence.log and reproduce.log. Loaded R technical, analytical, data.table, collapse and shared-style skills plus technical communication.

No tests, R/PowerShell example scripts, parser/linter, Git commands, installations, package operations, downloads or functional reruns executed by this reviewer. Reported runtime results are retained logs read, not independent execution. No RDS binary body decoded. All reviewer writes are this report under the exact E checkout; no agent-started process created files or caches. No derived view body read.

No package repository or archived package source read in this pass; therefore no newly inspected package-repository SHA to record. Exact source pins inspected in setup.R:16-22 and inherited implementation handoff:39-47 are stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25; pipfun 7d534516a8c17c33d537681610eccd4c29211762; pipload ff9a81e386a09fb2531c154f63fd2b91521313c6; wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f; dlw 12faa058b521ef511073a7b21b1b1dd7993c9649; pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be; pipdata 13a38280c1eafe7e03a97837cdb57833fbe9d926. These are recorded pins, not independently reverified repository HEADs.

## Gaps
Original Plan remains blocked; source convergence does not establish clean/metadata generation, exact clean/meta readbacks, paired numeric values or full V4 rejection. The current reproducer demonstrates failure, not a successful scenario. Package-owner direction remains the parent's next development stage.

No independent runtime execution, binary/RDS inspection, exhaustive OS write trace, package implementation reread or Git root/branch/HEAD verification. Requested root/existing main was used; HEAD stays UNKNOWN for this reviewer (implementation handoff:11 records 506d8aa80230a32f6f6beee478c98a65488aa74e as inherited observation, not this reviewer's check).

Minimal first honored: smallest complete example remains the target; safeguards only for almost-irreversible failures, one functional check per change, installed tools/dependencies only when worth the cost, Plans about two pages. No additional changes, dependencies, safeguards or Plan proposed by this review.
