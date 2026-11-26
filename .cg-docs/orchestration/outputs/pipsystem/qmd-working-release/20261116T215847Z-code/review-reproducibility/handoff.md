---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T215847Z-code/review-reproducibility
status: completed
updated: 2026-11-16T22:34:38Z
owner: review-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md revision 2
next: Code owner integrates scoped reviews and completes final Plan verification.
---

# Reproducibility review

## Summary
Explicit no issues found: no new supported P0/P1/P2/P3 reproducibility finding
in the scoped source delta and retained live evidence. This is not overall Plan
completion or shared-store acceptance. The retained source-4.log is an actual
historical FAIL; subsequently inspected source-5.log records passing source and
preservation checks after narrow exact-description reconciliation.

## Changes
Only this assigned report created and finalized. No source, package, protected
artifact or Git changes. No recommendations to remove or relocate artifacts.

## Checks run
- Loaded communication and R shared, technical, data.table, collapse and testing
  skills. Read the brief, Plan revision 2 and required project/contract rules.
- Read-only Git identity and two `git diff --no-index` comparisons against task
  baseline snapshots, not absent HEAD files. Qmd delta consists of explicit PPP
  2021 context/synthetic assertions and manual public initialization/readbacks;
  checker delta supplies offline directory test doubles and source/negative
  oracles. No original numerical or exact-version assertions removed in the
  inspected delta. Source preservation log: logs/source.log:29-31.
- Receipt verification: live.R:21-39 reuses only assignment-defined helpers from
  experiments/one-survey/setup.R and calls verify(inventory.rds). setup.R:203-240
  checks root/package identity, dependency inventory/version/DESCRIPTION hash,
  source archive MD5, install metadata MD5, completed install receipt and actual
  loaded namespace paths. This is more than a shared version-label check.
  logs/first-4.log:4-34 and logs/existing-4.log:4-34 record success and all seven
  private package origins.
- Fresh R children/no ambient library fallback: run.ps1:18-47 redirects startup,
  libraries, home/cache/temp/log and legacy roots before Rscript --vanilla at
  line 71. live.R:12-17 requires exactly the private contributed and runtime
  libraries. first-4.log:1 and existing-4.log:1 record different PIDs (26308 and
  25552); both logs:35-42 show empty initial alias state and the same store-4.
  live.R:59-63 distinguishes fresh from existing directories before setup.
- Exact cell/real metadata: live.R:46-68 extracts and evaluates the canonical
  manual cell with only context roots localized and fixed release/identity/PPP/
  survey identifiers. No fixture sourcing, namespace patch or synthetic metadata
  insertion appears in that live path. Pinned pipfun archive
  R/working_release.R:83-118 calls actual release resolution and globals creation;
  R/release_management.R:415-431 reads release metadata through get_file_from_gh;
  R/utils.R:47-61 reads PPP metadata. first-4.log:53-69 and :127-135, and
  existing-4.log:53-69 and :127-135 record requested 20260401/TEST/2021 and both
  initialization/readback PASS outcomes. Credential diagnostics at :44-52 are
  retained and not recast as absent; successful metadata-return assertions are
  distinct from those diagnostics.
- Containment: run.ps1:8-10 invokes the existing recursive path/reparse/hardlink
  checks in paths.ps1:1-33 for task and runtime trees. run.ps1:34 plus explicit
  root_dir/out_dir in the Qmd cell contain the known legacy output path
  (pinned pipfun R/pip_create_globals.R:170-173). live.R:69-74 asserts actual
  normalized store roots and .stamp/temp/logs. The GH_CONFIG_DIR C: location
  (run.ps1:46) is used only for the explicit existing-auth read at :59; caches
  and traces are separately redirected/disabled. No new C: write is evidenced.
- Offline evidence: source-red.log:1 records missing-cell red;
  logs/source.log:24-31 records the earlier green checker/preservation run.
  logs/source-4.log:24-36 records later source/control-flow passes followed by
  the real unchanged whole-config assertion failure. These are not an all-green
  final verification run. The subsequently read source-5.log:24-31 records all
  source/control-flow, instruction and baseline-preservation checks passing.
  Current check-qmd.R:173-183 asserts the exact description suffix and restores
  only that description before the original whole-config equality. Current
  check-source.R:37-55 excludes that block and restores the trailing label before
  the original checker-tail comparison. No broad equality waiver was found.
  Directory test doubles are labeled as such, not UNC access evidence.
- R/network/test/installer/full-render execution: NOT RUN by reviewer. Editor
  diagnostics: NOT RUN (tool unavailable). Only read-only Git and clock commands
  were run. Source and log inspection does not independently replay receipts.

### Recorded package provenance
No external package repository was read. Pinned archive source read for pipfun:
`7d534516a8c17c33d537681610eccd4c29211762`. Runtime pins are independently listed
in `.tmp/one-survey/qmd-acceptance-20261113/pins.tsv:2-8` and both live logs:

| Package | Recorded full SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 53a76e379c81a3ac70b39925954981ae6a691459 |

Paths prefixed logs/ or live.R/run.ps1 above are relative to
`.tmp/qmd-working-release/20261116T215847Z-code/`; pinned R/ paths are relative
to `.tmp/one-survey/qmd-acceptance-20261113/sources/pipfun/`.

## Gaps
- Source-5.log was inspected after the coordinator's update and supports the
  source/preservation rerun, while source-4.log remains historical FAIL. Review
  integration and final Plan verification belong to the Code owner; this report
  does not certify those subsequent stages or grant approval for any changes.
- Live evidence is sandbox initialization only, not shared-store, household,
  auxiliary processing or real-survey acceptance. No statistical randomness is
  introduced by this scoped initialization delta, so seeds are not applicable.
- Real remote metadata was consumed through mutable upstream branches. The
  inspected logs retain selected release/identity/PPP and package provenance,
  not a full immutable upstream metadata snapshot; this limited setup check does
  not claim full data-pipeline archival reproducibility.
- No reviewer execution or filesystem write tracing was permitted; containment
  assessment rests on launcher controls, assertions and retained logs, not an
  independent audit of every child-process filesystem operation.
