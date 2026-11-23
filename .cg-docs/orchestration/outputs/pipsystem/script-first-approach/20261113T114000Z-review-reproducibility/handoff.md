---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-reproducibility
status: completed
updated: 2026-11-13T11:32:58Z
owner: reproducibility-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md rev1
next: Code coordinator integrates route reviews and performs authorized final verification; original survey acceptance remains blocked.
---

# Script-first full-route reproducibility review

## Summary
No actionable P0-P3 reproducibility issues identified in the owned Qmd route by
static inspection. This is not a certification of original survey acceptance.
Same-run evidence records four PASS, processing FAIL with the actual message
"A single working release and identity are required.", and two dependent NOT RUN
checks (`.tmp/one-survey/n11/qmd-20261113T114000Z/results.tsv:2-8`).

The review covers Qmd, fixtures, reporting checker, Qmd launcher modes/fresh-render
block, the setup.R source-safe mode default, and the four approved instruction
surfaces. Existing setup/receipt machinery was read as supporting context only;
mixed-owned content was not changed or treated as this task's new implementation.
Branch main is user-supplied; HEAD was not independently queried. The implementation
work report records e9c71e3190f1ce88a017ae25af7c373a64c655a2 at lines 9-12.

## Changes
Only this authorized handoff was created and finalized. No source edits, package
changes, installs, pins, Git operations or generated-view body edits. No files
outside this E: checkout were written. No deletion, replacement, rename or move of
protected project artifacts is proposed.

## Checks run
All checks below are file reads/static comparisons, not fresh command execution.
Loaded communication and R shared, technical, data.table, collapse and testing
skills, plus the testing integrity reference. Read project charter/design/harvest
brief, Plan revision 1 and handoff contract. No commands, tests, R, Quarto or Git
were executed in this review.

### Receipt, environment and source provenance
- Seven full SHA strings in `experiments/one-survey/setup.R:9-22` match the seven
  entries in `.tmp/one-survey/n11/pins.tsv:2-8`:
  stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25;
  pipfun 7d534516a8c17c33d537681610eccd4c29211762;
  pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5;
  wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f;
  dlw 12faa058b521ef511073a7b21b1b1dd7993c9649;
  pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be;
  pipdata c5b27fa4458d7175aca81a203762bae81e9f0b40.
  No package repository was read; these are recorded runtime source pins, not a
  new assertion about current package HEADs.
- `setup.R:203-241` validates inventory root/package identity, receipt names,
  dependency inventory/version/DESCRIPTION checks, installation return codes,
  pinned SHA, source archive and installed metadata MD5, DONE logs, and loaded
  namespace paths. `setup.R:38-56` additionally exercises qs2 save/read and stamp
  hashing. Qmd invokes this actual verifier before earning its first PASS
  (`experiments/pip-pipeline.qmd:63-66,116-120`). This review did not deserialize
  inventory.rds or recompute its checksums.
- Existing seven install logs contain DONE entries: install-stamp.log:13,
  install-pipfun.log:15, install-pipload.log:13, install-wbpip.log:15,
  install-dlw.log:12, install-pipaux.log:14, install-pipdata.log:14, all under
  `.tmp/one-survey/n11/logs/`. These are historical private-runtime installation
  receipts, not new installs performed for this review.
- Existing `logs/check.log:1,96` reports usable exact paths and rejection of five
  stale/incomplete controls. `namespace-paths.tsv:2-47` lists only n11 private
  library/base-library paths; `dependencies.tsv:2-108` records dependency versions,
  origins and private destinations. `logs/session-info.txt:1-16,22-35` records R
  4.5.2, Windows, locale, time zone and namespace versions. These files are shared
  runtime evidence, not independently timestamped current-render receipts.
- `setup.R:7` defaults sourced execution to library mode when trailing arguments
  are absent; setup/install bodies remain conditional on explicit setup mode.
  No installed-package failure is bypassed with load_all or a source overlay.

### Isolation and fresh store
- `run.ps1:13-20,37-66` checks the expected checkout/runtime tree and redirects
  temp, home, config, cache, R libraries, profiles, logs and package paths under
  n11. `paths.ps1:1-32` rejects output outside checkout and reparse/hard-link
  redirects. Reading the installed Quarto executable on C: is not a C: write.
- Qmd render uses installed Positron Quarto and private Rscript, rejects an
  existing render directory, creates fresh store/manifest/Deno directories,
  redirects Quarto/Deno outputs and restores process variables in finally
  (`run.ps1:67-97,137-142`). It does not call setup/install in this mode.
- Qmd sets both pipfun.main_dir and PIP_ROOT_DIR to the fresh render store and
  its dependency manifest to the fresh manifest (`pip-pipeline.qmd:109-115`).
  Directory/file inspection found run-local auxiliary, DLW and stamp metadata
  under `.tmp/one-survey/n11/qmd-20261113T114000Z/store`, consistent with fresh
  routing rather than old survey-output reuse. No runtime reparse scan was run.
- `logs/child-startup.log:32-35` records separate render/check R processes using
  private n11 R and its two private libraries. This is consistent with isolation;
  the log alone does not map individual render PIDs to run IDs.

### Source-to-result and truthful failures
- Read canonical Qmd and saved `qmd-20261113T114000Z/pip-pipeline.qmd`; their
  displayed 338 lines agree. `run.ps1:88-95` copies and compares SHA256 before
  execution. Reported SHA256 is
  3BF38A85604B66551F5DFC20718A781C47C66330253833E7B2325172C99F83D2
  (`.cg-docs/work-reports/2026-11-13-script-first-pipeline-qmd.md:51-55`). It was
  not independently recomputed in this command-free review.
- Qmd disables cache/freeze (`:7-10`); each status begins NOT RUN (`:36-54`).
  Public release, auxiliary write, acquisition and processing calls are visible.
  Errors set FAIL with conditionMessage and gate dependent chunks. Processing
  context is deliberately not seeded to bypass the known blocker (`:224-227`).
- Saved `quarto.log:3-35,65` records all named chunks and HTML creation;
  `results.tsv:2-8` records four PASS, actual context FAIL and two NOT RUN.
  Render success is never equated with survey acceptance (`Qmd:23-26,335-337`).
  Generated HTML/view bodies were not consumed.
- Fixture substitutions are confined to release/PPP-vintage transport and DLW
  catalog/download (`qmd-fixtures.R:45-90`); the invalid download actually loses
  weight (`:79-82`). Validation, cleaning and storage are not replaced. Fixture
  auxiliary scope and public writer ownership remain visible (`Qmd:124-175`).

### Numerical oracle and instruction route
- Visible Qmd retains literal annual welfare 365/730/1095/1460 and paired
  weights 10/20/30/40 (`:84-105`), completed valid/invalid classification plus
  missing-weight diagnostic (`:194-210`), returned clean/meta version pins and
  exact pinned reads (`:238-270`), paired expected daily rows 1/2/3/4, exact
  survey/CPI 1.4/PPP 1.6 and total weight 100 (`:271-287`), and both-alias
  invalid/no-output checks gated after successful real processing (`:297-315`).
  No marginal sorting, tolerance weakening or empty-store shortcut was added.
- These match the working-tree counterpart `scenario.R:207-292`. The authoritative
  baseline is explicitly the immutable e9c71e3190f1ce88a017ae25af7c373a64c655a2
  scenario.R:123-179 (`Plan:31-33`), not that mixed-owned working-tree file.
  Directly compared the coordinator-saved immutable-source excerpt at
  `20261112T233858Z-code/oracle-excerpt.txt:4-60` under this task's output root.
  Its header (:1-2) attributes extraction to git show at that full SHA, not the
  working tree. Classification/diagnostic (:8-18), saved pins/exact reads
  (:28-38), paired numeric/metadata/total-weight expectations (:42-52), and both
  invalid-artifact checks (:53-57) are preserved in the visible Qmd. This reviewer
  read the excerpt but did not independently execute the Git retrieval.
- Instruction excerpts agree by inspection at AGENTS.md:126-139,
  ORCHESTRATOR.md:113-126 and CONTRACT.md:17-30. The checker reads these and
  checks the normalized kilo.json prompt suffix (`check-qmd.R:41-68`);
  existing `logs/qmd-check.log:1-4` reports chunk parsing, actual failure-recording,
  fixture checks and four-surface/prompt-only checks. No fresh JSON parse or
  instruction reload was performed by this reviewer.

## Findings
No actionable P0, P1, P2 or P3 finding in the reviewed owned scope.
No safe_auto or manual source fix proposed.

Advisory: preserve the explicit processing FAIL and dependent NOT RUN outcomes.
This known package-context blocker is an approved truthful document outcome,
not a new Qmd reproducibility defect. Missing renv scaffolding, broader package
pinning, new checksums or a new runner are not proposed for this bounded existing
private-runtime example. No stochastic fixture/analysis operation was identified;
process IDs and run timestamps are identity metadata, not numerical oracles.

## Gaps
- Original survey numerical/exact-version and invalid/no-output acceptance remain
  NOT RUN in this render. B6, deflation, means, incremental and production remain
  uncertified, as the Qmd itself states.
- No dynamic checks, binary receipt deserialization, cryptographic recomputation,
  file-system redirect audit, Git diff, package tests, JSON parse or render was
  executed in this review. Execution claims are attributed to existing artifacts.
- Immutable oracle assertions were directly compared against the saved excerpt;
  its Git extraction provenance is coordinator-reported, not independently
  retrieved by this command-free reviewer.
- Installed Quarto 1.11.9 is user/work-report supplied; its executable version was
  not independently queried. Full kilo.json prompt exceeds tool line display;
  four-surface equivalence is supported by checker source and saved check log.
- Coordinator integration/final verify and instruction reload remain outside
  this reviewer outcome. Package-context repair requires separate scope; no
  package edit, pin change, install or Git operation is recommended here.
- Timestamp is the board tool's observed UTC time, not a shell clock read.
