---
schema: pip-handoff-v2
project: pipsystem
task: m2-aux-inputs
run: 20261119T215954Z-cpi-review
status: completed
updated: 2026-11-19T22:08:55Z
owner: Review Colombia CPI projection proof
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: Coordinator can cite the saved PASS for the local CPI source-function projection only; no review correction required.
---

# Colombia CPI boundary review

## Summary

The saved evidence supports **PASS at the first local CPI boundary only**:
the pinned retained candidate `b857f991a3c4579f` produces the four national
CPI attributes for COL 2010 GEIH (2005, 2011, 2017 and 2021), matching the
independently constructed raw-CSV expectation within the specified comparison
tolerance. The 2021 value is finite and positive. No findings require changes
for this claim (`local-boundary/probe.R:20-70`, `cpi-projection.log:2-4`; run
`20261119T215954Z-local-boundary`).

## Changes
This handoff only; no code or commits.

## Checks run

- Verified the E: report path and the pipsystem `main` and pipdata `PROD`
  HEADs with read-only PowerShell and Git. At pipdata
  `53a76e379c81a3ac70b39925954981ae6a691459`, HEAD and the working
  `R/pd_aux_attr.R` both have blob `e12b8daf70c8e6527485a2b243036bdc1b971fc4`.
- Cross-checked `probe.R:20-41,64` against
  `cpi-rebuild-pilot/20261119T202215Z-release-inputs/inputs.tsv:2` and
  `candidate.tsv:2`. The probe pins raw CSV, retained payload and consumer
  source bytes, and checks the candidate's Stamp object hash `50007cdf16a77744`.
  It reads `.tmp/cp26/store/cpi.qs2/versions/b857f991a3c4579f/artifact` directly.
  The retained SHA-256 is
  `a8afe07d62fb4d7268b9870e0c195919e252f7a61d0e3ddfec4b407de669ec22`;
  `131b3fe928e817b7` is the byte checksum recorded by the earlier pilot, not
  an additional checksum verified by this probe.
- The single saved functional check calls unchanged `filter_aux_data()`
  and `create_attr()` in an isolated environment (`probe.R:37-41`, pipdata
  `R/pd_aux_attr.R:135-143,195-202`). The expected vector is derived from
  the pinned wide CSV with base R, not from the rebuilt table or the helpers.
  The assertions require nonempty raw selection and known levels, reject
  duplicate names, compare the exact name set and values by name at
  `all.equal` tolerance `1e-14`, and require positive finite 2021 coverage
  (`probe.R:43-65`). The saved log records four national matches.
- `run.ps1:23-25,37-46` points to local libraries and fails on nonzero R exit;
  `probe.R:4-13,65` checks that session's R version, scratch location, library
  order and absence of four PIP namespaces. These are diagnostic conditions,
  not installed-package checks. This review did not run R, tests or network
  calls and did not inspect other pending producers.

## Gaps

- The probe does not exercise the Stamp catalog/version resolver, full
  `pd_aux_attr()` wrapper, PIP installation/startup, or a supported runtime.
- The result covers one national slice, not other reporting levels or keys,
  the full CPI series, historical/shared equivalence, or producer publication.
- Full auxiliary inputs, release setup, survey processing, and deflation are
  not established by this run (`cpi-projection.log:4`, local-boundary
  `handoff.md:69-74`).
