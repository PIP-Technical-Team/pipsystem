---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T223219Z-qmd-acceptance/reproducibility
status: completed
updated: 2026-11-13T22:53:36Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinator incorporates this review into continuation V5 and light final verification.
---

# Narrow Qmd acceptance reproducibility review

## Summary
No supported P0-P3 reproducibility issues found in this narrow continuation.
This conclusion covers the updated exact pipdata archive pin and retained fresh
first-save acceptance evidence, not a repeat package/style review or B6 approval.
Scope and provenance: review-brief.md:3-35; canonical work report
`.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:160-228`.

## Review findings

Explicitly no issues found; no safe_auto/manual/advisory findings raised.

- Exact source selection is explicit: `experiments/one-survey/setup.R:9-22`
  and `:119-138` archive full immutable SHAs, not working-tree contents.
  Fresh runtime `pins.tsv:2-8` agrees with the seven source pins, including
  pipdata `53a76e379c81a3ac70b39925954981ae6a691459`. Receipt verification
  checks inventory equality, archive/installed metadata digests, installer
  completion and actual loaded namespace paths (`setup.R:203-241`).
- Fresh installation and separate check evidence are consistent:
  `logs/setup.log:1-9,31-33,126` and `logs/check.log:1-3,96`. The first stamp
  failure is a deliberately absent-cli negative control, enforced by
  `setup.R:145-153`, not an ignored final install failure. Seven archive
  pax-header warnings are visible (`logs/setup.log:17-30`); successful installs
  and real namespace/QS2/hash usability gates follow (`setup.R:38-56`).
- Private runtime/library and dependency provenance are retained:
  `dependencies.tsv:2-108`, `installed-packages.tsv:2-8`,
  `logs/session-info.txt:1-35`, and `logs/child-startup.log:1-26`.
  The render child uses the same private libraries (`child-startup.log:26`).
  Launcher redirects temporary, home, configuration, library and cache roots
  before child startup (`run.ps1:37-66`) and requires fresh render/store paths
  (`:67-96`). Tree redirection checks are in `paths.ps1:1-33`.
- Fresh execution evidence is not inferred from render success alone:
  `qmd-20261113-acceptance/results.tsv:2-8` contains seven PASS rows;
  `quarto.log:3-35,62` records all chunks and HTML completion. Actual HTML
  reports run start `2026-11-13 22:51:21 UTC` (`pip-pipeline.html:2349-2350`),
  the invalid diagnostic (`:2571`), returned clean/metadata pins
  (`:2630-2641`), and paired actual values (`:2690-2696`).
- Exact returned-pin reads and original numerical expectations remain intact
  (`experiments/pip-pipeline.qmd:236-261`). Completed valid/invalid
  classification and actual missing-weight diagnostic precede real public
  processing and no-output checks (`:164-228,275-288`). External fixture
  substitutions remain transport-only (`qmd-fixtures.R:48-94`); auxiliary
  producers are explicitly not certified (`pip-pipeline.qmd:138`).
- Failure propagation is supported by `logs/qmd-check.log:1-4` and the actual
  negative-control checks in `check-qmd.R:14-31`. Cache/freeze are disabled
  (`pip-pipeline.qmd:7-10`). Explicit fixture inputs introduce no randomized
  sampling requiring seed control; timestamp reporting is run provenance,
  not a fixed expected analytical value (`:56-61,72-94`).
- First-save limitations remain visible in source (`pip-pipeline.qmd:18,294,
  309`) and executed HTML (`:2923-2927`). No historical pin-selection or B6
  certification is implied by this review.

Runtime-relative paths above are rooted at
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/`.
Reviewed source pin inventory: stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25;
pipfun 7d534516a8c17c33d537681610eccd4c29211762;
pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5;
wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f;
dlw 12faa058b521ef511073a7b21b1b1dd7993c9649;
pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be;
pipdata 53a76e379c81a3ac70b39925954981ae6a691459.
Repository statuses are retained in `logs/repository-status.txt:1-24`;
pipload HEAD differs from its intentionally archived pin. No live package
repository was directly inspected by this reviewer.

## Changes
Only this exact report created and finalized. No other writes, source changes,
process launches, tests, installs, downloads, pipeline runs or Git operations.

## Checks run
Static inspection only: review brief, contract, project constraints, original
Plan, current continuation handoff and appended work report; canonical Qmd,
setup/launcher/path/fixture/focused-check sources; fresh setup/check/focused
logs, source-hook excerpt, dependency/pin/installed inventories, child startup
and session information; actual rendered HTML excerpts, render log and results.
Loaded shared, technical, data.table, collapse, testing R skills and technical
communication skill before R review. All PASS statements above describe
retained executed evidence, not checks independently run by this reviewer.

## Gaps
- No independent execution, binary RDS receipt decoding or checksum
  recomputation performed. Source SHA256 equality is recorded by the launcher
  and continuation report, not independently recomputed here.
- Existing local dependency shelves and Windows/private-R setup are the
  deliberately bounded environment, not a new portable lockfile/archive
  restoration promise. No scope-expanding renv/installer work recommended.
- B6 later-refresh/history remains excluded and failed/open; live DLW,
  production, auxiliary producers and later pipeline stages are not certified.
- Overall V5/final verification remains the coordinator's pending work;
  this completed specialist review does not complete the original Plan.
