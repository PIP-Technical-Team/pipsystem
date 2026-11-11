---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/verify-testing
status: completed
updated: 2026-11-10T23:04:28Z
owner: cg-testing verify
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: parent consolidates light verification while retaining the unresolved package bootstrap blocker
---

## Summary
Final light-only cg-testing verification complete. No new issues found: P0 0, P1 0, P2 0, P3 0. Both parent-review closures are supported by current source and retained corrected execution evidence. No cross-file breakage identified across setup.R, run.ps1, paths.ps1, checks.ps1, scenario.R and reproduce.R. This completes this review assignment, NOT the original Plan or scenario.

Parent: `.cg-docs/reviews/2026-11-10-survey-resume-review.md:6-9,23-27`. Suppression restricted to explicitly fixed QS2 selection/copy/provenance/usability and diagnostic-wording blocks; no P0/P1 or cross-file issue suppressed. No candidate new finding required suppression.

### Closures

- P2.1 verified closed: `experiments/one-survey/setup.R:25-30` selects the three installed compatible origins; `:148-172` traverses, copies and records dependency provenance; `:193-211` binds inventory/table/origin/version/destination DESCRIPTION checksum; `:38-55,224-230` requires actual QS2 save/read exact equality and isolated loaded namespace paths. Corrected runtime `dependencies.tsv:10-12` records RcppParallel 6.2.0, stringfish 0.19.2 and qs2 0.2.2 from 4.5-pipapi. `logs/setup.log:3-9,31,54-65,92-93,126` reaches acceptance after this unmocked roundtrip gate. `logs/check.log:1-3` and `logs/outer-green.log:23-25,118-129` corroborate fresh verification and caller restoration, including actual intentional child failure. No inference that seven namespace loads alone establish QS2 usability.
- P3.1 verified closed: current `setup.R:264-284`, specifically `:277`, says `NOT RUN in diagnostic mode: survey, storage or numeric scenario`; it no longer falsely reports pipaux absent. Verified statically; diagnostic mode was not rerun by this reviewer. Parent review's older line number is not used as current-source evidence.

### Executed-evidence scope

All corrected runtime references below are relative to `.tmp/one-survey/resume-20261110-correction1/`.

- Seven successful installed-package exits and real missing-declared-dependency red are retained in `logs/setup.log:1-9`; five stale/incomplete controls in `:31`. `installed-packages.tsv:2-8` lists all seven private paths/versions; `logs/session-info.txt:1-3,25-35` records R 4.5.2 and native dependency versions. `dependencies.tsv:2-108` records 107 copied dependencies. `logs/child-startup.log:1-28` covers setup, installation/staging, actual scenario, reproducer, check, failure and evidence children with private library paths.
- `checks.ps1:11-29,105-121` checks all process environment keys and ErrorActionPreference, matching retained `logs/outer-green.log:119-129` actual intentional failure and final restoration assertion. Separate `.tmp/one-survey/resume-20261110-final-boundaries-fixtures/checks.log:22-49` supports ten specific unsafe/redirect/reused-root controls, not survey V3 numeric acceptance despite the historical marker's label.
- `scenario.R:123-138` requires real validation success, specific valid/invalid identities, zero execution failures and the exact missing-weight diagnostic before advancing. `logs/scenario.log:103-160` and `logs/evidence.log:1-37` show SYNA valid, SYNB invalid, n_total 2 and n_failed 0 with `weight variable should be in the data`. Distinct SYNB identity/checksum is visible in `scenario.R:27-34,75-83` and runtime `logs/scenario.log:43-48,123-130`; no no-work or execution-failure substitution.
- Validation report receipt `03ddb471b4d2dc93` and completed inventory receipt `e36551f8882dfe08` are real validation receipts (`logs/scenario.log:162-206`), NOT saved clean-data/metadata readback pins.
- `scenario.R:143-145` attempts public cleaning; `logs/scenario.log:255-258` halts on missing `pip_master_inventory.qs2`. `reproduce.R:9-13,40-55` uses a separate new store and an actual completed-valid inventory row, then the same public call. `logs/reproduce.log:1-16` reproduces the error and zero master versions; its successful diagnostic assertion is not scenario acceptance.
- Archived pipdata `R/pd_process_data.R:108-120` loads the master at :114 before passing bootstrap into execution preparation. Archived pipload `R/load_pip_data.R:327-360` delegates the absent read at :348-354. This supports the existing package-boundary blocker and proposed pipdata owner direction; no new harness finding and no bypass.
- `scenario.R:150-179` retains separate actual saved-pin reads, paired welfare/weight oracle and both no-invalid-output catalog checks. Those assertions are after the failure and did not execute. `logs/evidence.log:160-162` explicitly distinguishes empty BEFORE catalogs from downstream rejection proof. No false rejection, numeric-value, clean/meta pin, or full-pass claim found in the parent review/implementation handoff.

### Package provenance

Read package source only from the retained corrected Git archives, not sibling working trees:

| Package | Archive SHA | Files inspected in this pass |
|---|---|---|
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 | R/pd_process_data.R:85-154 |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 | R/load_pip_data.R:327-366 |

All seven pin records were also read in corrected `pins.tsv:2-8`: stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25; pipfun 7d534516a8c17c33d537681610eccd4c29211762; pipload ff9a81e386a09fb2531c154f63fd2b91521313c6; wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f; dlw 12faa058b521ef511073a7b21b1b1dd7993c9649; pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be; pipdata 13a38280c1eafe7e03a97837cdb57833fbe9d926. No source read from the other five package archives during this pass.

## Changes
Only this required E-checkout review handoff created and updated. No code/Plan/parent-review edits, package changes, Git commands/mutations, installs or downloads. Existing protected artifacts preserved; no view bodies read. Minimal-first applied: inspected existing smallest functional checks; added no dependencies, safeguards, or extra tests.

## Checks run
Read original revision 1 Plan, project charter/design/harvest brief, review command, handoff contract, parent review and implementation handoff. Loaded clear-technical-communication and R testing/technical/analytical skills. Inspected all six specified source files, corrected readable runtime logs/provenance/version tables and the two archived source excerpts above. Compared actual source progression with logged assertions, failure and receipts; outcome: both closures supported, zero new supported findings, existing blocked Plan status remains accurate.

No test, R, Pester or scenario execution performed. get_errors and execution_subagent unavailable and not invoked. Reporting-clock read only: initial PowerShell 7-only `Get-Date -AsUTC` failed under PowerShell 5.1; corrected `(Get-Date).ToUniversalTime().ToString(...)` returned 2026-11-10T23:04:28Z. Neither command wrote files. HEAD not independently queried because Git was excluded; implementation/handoff.md:11 reports 506d8aa80230a32f6f6beee478c98a65488aa74e, but this report deliberately retains head UNKNOWN.

## Gaps
- V1 supported by corrected retained setup/check evidence; this is not an independent rerun or exhaustive OS write audit. Binary RDS receipts were not decoded independently; used retained readable execution renderings and source gates.
- V2 partial: acquisition/validation completed, clean/metadata call blocked before formatting. V3 unexecuted: no actual daily welfare/weight numeric readback or saved clean/meta pins. V4 partial: completed invalid classification plus specific diagnostic proven, downstream processing rejection not established by an empty pre-call catalog and failed wrapper.
- Public first-run master bootstrap remains unresolved. Parent must preserve blocker/owner direction and consolidate this verify result; this pass grants no package edit, pin substitution, new session, execution or Git approval.
- Full Plan/scenario completion, historical pin selection after a later save, live DLW, production, deflation/mean and incremental certification remain unproven/outside scope. No new execution was requested or needed for this bounded evidence review.
