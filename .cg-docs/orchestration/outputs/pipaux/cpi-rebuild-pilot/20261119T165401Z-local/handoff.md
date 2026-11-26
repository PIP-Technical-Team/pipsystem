---
schema: pip-handoff-v2
project: pipaux
task: cpi-rebuild-pilot
run: 20261119T165401Z-local
status: blocked
updated: 2026-11-19T19:25:45Z
owner: pipaux package session
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: Parent verifies this blocker and supplies the two approved local input paths and immutable source identities in a new run assignment.
---

# Isolated CPI Rebuild Pilot

## Summary
Blocked at `assignment.md:32-36`: no approved local input manifest or provenance record was identified for either required input. No candidate was produced.

- Raw CPI: the approved local bytes for `PIP-Technical-Team/aux_cpi`'s `cpi.csv`, with the exact source commit/blob reference and expected SHA-256. The source name follows `pipaux/R/zzz.R:9`, `pipaux/R/aux_cpi.R:163-169` and the local `pipfun/R/load_from_gh.R:18-24,55-59`. The approved source revision, expected checksum and staged path are unknown.
- Country list: the approved local `country_list` artifact used to filter `country_code` in `pipaux/R/aux_cpi.R:135-137`, with an exact upstream artifact/version reference and expected SHA-256. The approved version, expected checksum and staged path are unknown. A test-store filename alone does not establish approval or identity for this run.

## Changes
Only this handoff was written. No package or Git changes, downloads, installs, credential access, shared-store or production operations.

## Checks run
`pickup-path` returned this exact run folder. Git top-level, Git directory and common directory, branch, and full HEAD matched `assignment.md:20-24` and `tools/pipsys/packages.csv:4`. Before writing, verified the exact handoff path was absent and the run folder and its ancestors were not reparse points.

- Checked the assignment, its referenced diagnostic, hub orchestration text, package `data-raw` and `.tmp`, and filename patterns under the package and hub `.tmp`. The assignment did not name staged input paths or immutable input identities; the diagnostic documents the missing historical byte evidence (`handoff.md:26-30,108-116` in the referenced diagnostic run), not a source for raw CPI. No input payload was opened.
- Static trace: `R/aux_cpi.R:163-183,239-260` fetches and validates raw CPI, cleans it, and validates and saves the long output. `R/aux_cpi.R:135-137` loads `country_list` without an explicit version. `R/utils.R:477-482,524-536` uses the cached alias when no alias is supplied and delegates the save to `pipload::pip_write`. `R/zzz.R:16-61` sets the default Y: path, resolves and caches release/folder/alias context on load, and initializes a log. An explicit save alias alone would not confine acquisition or package startup. `git diff --exit-code HEAD -- R/aux_cpi.R R/utils.R R/zzz.R` confirmed the inspected files match HEAD.
- Final `git rev-parse --verify HEAD` returned `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, unchanged.

## Gaps
- Runtime, script/log paths, output ID and checksum: not applicable; no R process or qualified Stamp namespace was started. Isolation was not proven; save, exact readback, byte checksum, schema, key uniqueness and numeric checks did not run.
- The requested R skills were not exposed in this session's skill catalog. The missing approved inputs are the first execution blocker regardless.
