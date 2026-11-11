---
schema: pip-handoff-v2
project: pipsystem
task: runtime-folder-hygiene
run: 20261111T141952Z-renv-assessment
status: completed
updated: 2026-11-11T14:21:12Z
owner: renv-assessment
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 506d8aa80230a32f6f6beee478c98a65488aa74e
plan: NONE
next: Parent integrates recommendation with its existing runtime-folder exclusions and count verification; no renv implementation recommended.
---

# renv Assessment

## Summary
Recommend against introducing renv for the current 9k+ untracked generated test-runtime files. This is a runtime-folder Git hygiene problem, not evidence that package-version restoration is needed now. No bounded trial is warranted for this task.

Expected root, branch and starting HEAD match read-only Git output: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem, main, 506d8aa80230a32f6f6beee478c98a65488aa74e. No environment switch or creation occurred.

### Reasons

1. renv does not remove the sources of generated runtime files. The launcher creates temp, home, cache, config, logs, library, sources, store and manifest directories per attempt, and copies R executable/support directories and base/recommended packages (`experiments/one-survey/run.ps1:10,35-37,65-73`). renv manages installed R packages and lockfile restoration, not the R interpreter or arbitrary filesystem writes. Its own project library/cache still need exclusions; adopting it would not clean up existing attempts. Official renv introduction, Getting started and Caveats: https://rstudio.github.io/renv/articles/renv.html (accessed 2026-11-11).

2. Much of the relevant package separation/provenance already exists. The launcher sets a dedicated R_LIBS and disables user/site libraries (`run.ps1:44-48`); setup pins seven source SHAs, recursively gathers required dependencies, records versions/origins/DESCRIPTION hashes and checks installed paths (`setup.R:9-29,148-180,193-230`). Actual records exist at `.tmp/one-survey/resume-20261110-full/pins.tsv:1-8` and `dependencies.tsv:1-12`; for example cli 3.6.6 and data.table 1.18.4 have E:-based origin/destination paths and hashes. The earlier `20261110T125325Z-completion-green/dependencies.tsv:1-12` records the same example versions. These inventories are not a portable renv restore lockfile; that is a possible later benefit, not a fix for Git status noise.

3. Introducing renv would require integration rather than simplify the existing harness unchanged. Normal renv activation uses project .Rprofile, whereas the launcher disables profile startup, disables renv autoloading and invokes Rscript with --vanilla (`run.ps1:45-54,99`). renv normally links project packages to its global cache (official introduction, Installing packages), but this harness rejects reparse points/hardlinks (`paths.ps1:9-15,20-29`) and requires loaded namespaces to resolve inside the attempt (`setup.R:32-37,51-55`). Default cached links are therefore not drop-in compatible; a future evaluation would need deliberate activation and a non-linked configuration or a separately approved change to isolation requirements. No such change is proposed here.

4. renv cannot replace E:-only runtime containment or the existing architectural ownership. TEMP/TMP/TMPDIR, user/cache/config locations, R home and output roots are independently configured before startup (`run.ps1:38-59`). renv's Windows global state defaults to `%LOCALAPPDATA%/R/cache/R/renv`; root, cache, source, binary, staging and sandbox paths remain explicit E:-only concerns. The existing launcher already sets RENV_PATHS_ROOT under the attempt (`run.ps1:54`), which must not be mistaken for a complete filesystem sandbox. Official paths reference: https://rstudio.github.io/renv/reference/paths.html (accessed 2026-11-11). The charter places runtime concepts in packages and pipsystem in design/evidence (`compound-gpid.md:31-33`); ecosystem installation and SHA-pinned lockfile ownership already belong to metapip (`SYSTEM_DESIGN.md:297`). This assessment does not change that Decided responsibility or claim to inspect metapip's implementation.

### Minimal alternative

Keep the current launcher, runtime directories and provenance records unchanged. Parent completes narrowly scoped generated-folder exclusions and verifies resulting Git visibility/counts, preserving source scripts and durable evidence. Exclusions address untracked-file noise, not disk usage; do not delete retained attempts as part of this assessment.

### Later

Only reconsider renv if repeatable restoration on a fresh machine becomes an actual requirement or manually maintaining dependency installation becomes a demonstrated burden. Evaluate it within existing metapip ownership, with recoverable package sources/binaries, deliberate --vanilla integration, E:-only caches/temp/staging and compatibility with the no-redirect attempt policy. No trial, new dependency, generic isolation framework or additional safeguard is needed for current folder hygiene.

## Changes
Only this required report created and finalized. No source, settings, exclusions or Git changes; no installations or R/test/pipeline execution. No package repositories read, so no current package HEADs collected. Package SHAs quoted above are existing experiment pins, not newly verified repository HEADs.

## Checks run
- Read-only Git root/branch/HEAD verification passed.
- Read charter, design, harvest brief, report contract and R technical renv reference.
- UTC clock obtained with `(Get-Date).ToUniversalTime()`; initial `Get-Date -AsUTC` failed because PowerShell 5.1 does not support that parameter. No files were produced by either clock command.
- Static comparison of launcher/setup/path checks with two existing dependency records and one pins record completed. No generated-file count or exclusion audit attempted; parent owns those.
- Official renv introduction and paths documentation fetched read-only; distinction between package restoration and runtime/filesystem containment confirmed in their documented scope.
- No executable feature check applies: the only change is this report. Final report readback is the working check; R, tests, pipeline and renv commands intentionally not run.

## Gaps
- User-supplied 9k+ generated-file count not independently checked; parent owns counts and exclusions.
- Runtime usability, provenance accuracy beyond the read records, package source availability for restoration, installed renv availability and fresh-machine restoration are UNKNOWN; no R or package repository inspection was needed for this recommendation.
- Official renv web documentation is live, not a version-pinned package-source audit. The local skill reference's generic Unix cache example (`.kilo/skills/cg-skill-r-technical/references/renv-reference.md:35`) must not be treated as the Windows default; official paths documentation provides the OS-specific default.
- Folder exclusions will not reclaim disk space. Any later cleanup/retention decision is separate and was neither requested nor performed here.
