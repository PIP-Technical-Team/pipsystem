---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/implementation
status: blocked
updated: 2026-11-10T22:59:26Z
owner: implementation worker
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 506d8aa80230a32f6f6beee478c98a65488aa74e
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: parent finalizes review and routes fresh-master bootstrap failure to pipdata owner
---

## Summary

Phase 1 full-seven installation, fresh-process namespaces and QS2 roundtrip
passed in corrected fresh runtime resume-20261110-correction1. Original
resume-20261110-full initially passed seven namespace checks but failed required
QS2 storage dependency usability; that initial V1 claim is superseded, not proof.
Phase 2 ran the real exported acquisition/validation route successfully: one
valid SYNA survey and one completed-invalid SYNB missing-weight control, with
the specific diagnostic and zero validation execution failures. Cleaning and
metadata are BLOCKED by the first new pinned-package public-path failure:
`pd_process_data(inv = inv, bootstrap = TRUE)` unconditionally tries to load an
absent master inventory. The minimal public-call reproducer reproduced this in
a separate fresh store. No numeric readback or full V4 acceptance is claimed.

## Changes

- Created this run-specific report. Scope is experiments/one-survey, fresh .tmp/one-survey runtime, and this report only.
- Planned setup change: only pipfun pin changed to 7d534516a8c17c33d537681610eccd4c29211762; all seven ecosystem packages installed from exact local Git archives in DESCRIPTION dependency order. Ambient copying is restricted to third-party dependencies, recorded with versions/origin/path/description MD5.
- Private base/recommended R and reviewed launcher/path/check helpers reused. R working directory moved inside runtime. No package edits or Git mutations.
- Added linear scenario.R, using all three pinned pipdata articles and only named AAA/2010/SYNA fixture values from the permitted fixture section (helper-one-survey-upstream-acceptance.R:116-183), not its workers/harness. Only external release/catalog/download transport is replaced and restored; normalized auxiliary tables are disclosed fixture inputs, not certified producers. Real validation engine, wrapper, pipload/stamp storage, and compatible clean/metadata wrapper remain unchanged.
- Added reproduce.R for the exact fresh-master blocker and thin launcher modes for scenario/reproduce/dependency-probe/evidence. paths.ps1 and checks.ps1 unchanged. Diagnostic report text no longer falsely says pipaux is uninstalled.
- No worker commit, push, merge, package edit, reviewer dispatch, Plan/frontmatter/work-report/main-handoff/active-state writes. Initial root/main HEAD was f9454707b292a620e25abef17f2e515794020ba7; final observed parent-owned HEAD is recorded above; unrelated changes preserved.

| Package | Exact Archive SHA | Installed Version | Source Checkout Status At Inspection |
|---|---|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 | 0.1.0 | Unrelated metadata dirty; excluded from archive |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 | 1.0.1 | Clean |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 | 1.0.0 | Unrelated metadata dirty; excluded from archive |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | 0.1.6 | Clean |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 | 0.1.2 | Clean |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | 0.3.0 | Clean |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 | 1.0.0 | Clean |

## Checks run

- Fresh red baseline: checks.ps1 baseline, resume-20261110-red; actual missing pipfun error, expected exit 1, caller restoration checked.
- Full setup: run.ps1 setup, resume-20261110-full; seven exact archive installs and namespace checks PASS. Runtime evidence root: .tmp/one-survey/resume-20261110-full/ (pins.tsv, dependencies.tsv, inventory.rds, namespace-paths.tsv, logs/setup.log, logs/source-hooks.txt, logs/repository-status.txt, logs/child-startup.log).
- checks.ps1 green PASS; logs/outer-green.log retains outer assertions on success and actual intentional child failure, including restored process environment keys and ErrorActionPreference. Real missing-declared-cli install control PASS in setup log.
- Source HEADs equal all selected pins. stamp status: modified .gitignore and compound-gpid.local.md, untracked .compound-gpid/. pipload status: modified .gitignore plus untracked plan/review/.compound-gpid/.github/skills/sessionInfoLog. Other five repositories clean. Dirty checkout files excluded by Git archives; exact committed hooks/DESCRIPTION inspected before install.
- First failure retained in resume-20261110-full/first-failure.{txt,rds}: exported pipdata::dlw_gmd_list aborted with pipdata_dlw_inventory_save_error before validation. Minimal public-call reproducer executed without aux/download/validation/clean; original reproducer-result.rds, reproducer-detail.rds and reproducer-verbose.rds retained. Direct public pip_write returned NULL version/metadata; verbose warning exposed unavailable qs2 despite copied inventory. dependency-probe.rds/log identified stringfish native DLL LoadLibrary failure. This was an unsuitable third-party copy, not established pipdata defect.
- Step 1 targeted harness correction 1: select existing suitable qs2 0.2.2, stringfish 0.19.2 and RcppParallel 6.2.0 built for R 4.5.2 from E:/PovcalNet/01.personal/wb384996/R/win-library/4.5-pipapi, record each provenance, and add real qs_save/qs_read roundtrip. Full seven archive installs + checks PASS again in fresh resume-20261110-correction1. No source/library overlay, download or ecosystem pin changes.
- Conservative fresh correction accounting: step 1 TWO targeted corrective edits (P3 stale diagnostic wording plus third-party dependency-suitability correction); only the latter required a fresh full install attempt. Step 2 ZERO corrections; scenario unchanged after its first executed attempt. Earlier messages counted only the functional correction and called the wording part of planned metadata editing; this report counts both conservatively, leaving no assumed step 1 correction allowance. Baseline, original planned full-seven/scenario changes and diagnostic-only reproducer refinement are separate from correction attempts.
- Corrected runtime evidence root: .tmp/one-survey/resume-20261110-correction1/. Seven-install setup.log, pins.tsv, dependencies.tsv (107 copied third-party dependencies), inventory.rds, namespace-paths.tsv, installed-packages.tsv and logs/session-info.txt show R 4.5.2/private roots and exact versions. Child startup auditing covers actual installer/staged/scenario/reproducer/check/failure children.
- Corrected checks.ps1 green PASS, retained logs/outer-green.log: all process environment keys and ErrorActionPreference restored on success and actual intentional child failure. Ten unsafe/redirected/reused-root negative controls PASS in .tmp/one-survey/resume-20261110-final-boundaries-fixtures/checks.log. No Pester was invoked.
- Corrected scenario: exported pipdata_dlw_process outcome success; acquisition 2/2 successes, validation n_total=2, n_valid=1, n_invalid=1, n_failed=0. Saved validation-result.rds and validation-report.rds. Durable validation report pin 03ddb471b4d2dc93; completed inventory pin e36551f8882dfe08. Real malformed diagnostic: description `weight variable should be in the data`, type `error`, one violation, table AAA_2010_SYNB_V01_M_V01_A_GMD_GPWG. SYNB has a distinct checksum/identity; not no-work/error-as-rejection. Readable rendering: logs/evidence.log.
- First new pinned-package failure: corrected first-failure.txt:1-2 and logs/scenario.log:255-258 show pipdata::pd_process_data -> pipload::load_pip_master_inventory -> pip_read, `No version files found in 'pip_master_inventory.qs2'.` No downstream processing was attempted beyond this boundary. downstream-before.rds shows pip and pip_meta catalogs each had zero rows before this call.
- Executed minimal reproducer: current experiments/one-survey/reproduce.R, launched through run.ps1 reproduce against corrected runtime. A separate empty store/reproducer-master, real setup_working_release with external release/PPP-vintage transport only, one actual completed-valid inventory row, then public `pipdata::pd_process_data(inv = inv, bootstrap = TRUE, verbose = FALSE)`. Same missing-master error; st_versions confirms zero master versions. Evidence reproducer-master.rds and logs/reproduce.log:1-18. This reproducer check PASS means blocker reproduced, NOT scenario acceptance.

### Concrete Owner Direction

pipdata owner: fix first-run master handling at pinned R/pd_process_data.R:108-120,
especially the unconditional `load_pip_master_inventory()` at line 114 before
`pd_prepare_execution(..., bootstrap = bootstrap)` at lines 115-120. Confirm
absence from a trustworthy empty catalog, and route a genuinely empty initial
master through the package's bootstrap handling; do not mask arbitrary load
errors or require the example to fabricate a populated master. Pinned pipload
R/load_pip_data.R:327-360 delegates the absent read unchanged, so deciding the
first-run behavior belongs at the processing/bootstrap boundary. Add one
functional first-survey/fresh-store check, then rerun the documented example
from fresh archives with the agreed fix pin. Package edits are outside this
worker's authority; the direction is a proposal, not an applied design change.

## Gaps

- V1 PASS only for corrected runtime including actual QS2 usability. V2 partial: real acquisition/validation completed, clean/metadata route attempted but blocked. V3 NOT REACHED: expected paired daily welfare 1,2,3,4 and weights 10,20,30,40 remain executable assertions only; no exact saved clean/metadata pins or readback values exist. V4 partial: completed invalid classification and exact diagnostic proven; cannot certify downstream processing refusal because the whole clean wrapper failed before work selection. Zero artifacts due execution failure is not a rejection pass.
- Parent owns Plan/work/review records, final source/report fixes, complete review and verify. Worker dispatched no reviewers and does not claim V5.
- Initial QS2 native incompatibility is fixed by suitable copied binaries, but the exact missing native module in the older stringfish 0.19.0 chain was not conclusively determined; objdump establishes its RcppParallel/tbb imports only. No unsupported native root-cause claim.
- No live service, production, deflation, mean, or historical selection-after-later-save claim.
