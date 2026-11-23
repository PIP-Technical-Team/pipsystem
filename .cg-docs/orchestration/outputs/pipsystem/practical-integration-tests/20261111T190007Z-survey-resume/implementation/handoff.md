---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume-implementation
status: blocked
updated: 2026-11-11T19:14:25Z
owner: survey implementation worker
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent reviews preserved package-boundary evidence and directs pipdata owner; no further survey execution past this failure.
---

# Survey Implementation

## Summary
Fresh n11 setup passes: all seven exact archive installs, required QS2 roundtrip,
namespace-path checks and five stale/incomplete receipt controls. Real acquisition
and validation completed: SYNA valid, SYNB missing-weight invalid, zero execution
failures. Real public clean wrapper now fails at release-context creation:
`A single working release and identity are required.` Minimal public-call
reproducer independently confirms this error in a separate fresh store. No
daily welfare or exact clean/meta saved-version readbacks exist. A failed wrapper
is not a malformed rejection pass.

## Changes
- Created this worker-owned handoff at the exact requested path.
- setup.R pin changes are only the two authorized literals (pipdata c5b27fa and pipload 4ef0d90).
- Subsequent narrow correction: setup.R evidence output handles absent failure files and uses actual acceptance artifacts rather than unconditional failure wording; scenario.R header identifies setup.R's exact pin instead of the historical pin.
- reproduce.R now targets the newly observed release-context failure, not the old fixed master bootstrap symptom. It preserves returned public release, missing context options, exact error class/message, zero master versions and zero downstream catalog counts in reproducer-context.rds.
- No package edits, Git mutations, or parent artifact edits.

## Checks run
- Read original Plan and pip-handoff-v2 contract.
- Read charter/design/harvest brief, original Work Report and all three requested handoffs.
- Inspected launcher/path controls, original R startup profile and exact pinned hooks; changed pins have unchanged hooks/declared dependencies.
- `checks.ps1 -Phase baseline -RunId n11-red`: expected real missing pipfun baseline, caller restoration passed.
- `checks.ps1 -Phase boundaries -RunId n11`: ten path/reuse/redirect controls passed; transcript n11-fixtures/checks.log.
- `run.ps1 -Mode setup -RunId n11`: seven installs exit zero after intentional missing-cli negative control; real storage usability and receipt controls passed. Logs n11/logs/setup.log and install-*.log.
- `checks.ps1 -Phase green -RunId n11`: installed paths/receipt/QS2 checks pass and caller environment/error preference restored after success and intentional child error. Child logs n11/logs/check.log and forced-failure.log.
- `run.ps1 -Mode scenario -RunId n11`: exit 1, first new package-path failure. Acquisition 2/2; validation 1 valid, 1 invalid, n_failed 0. Actual diagnostic: `weight variable should be in the data`. No clean/master/readback acceptance artifacts written.
- `run.ps1 -Mode evidence -RunId n11` before correction: actual blocked output reproduced; static success-path defect independently identified by documentation review. This was a baseline, not a fabricated failing success run.
- `run.ps1 -Mode reproduce -RunId n11` after updating target: exit 0 because the exact failure is reproduced, NOT because scenario passed. Public setup returns 20260401/TEST/2021 while both pipfun.working_release and pipfun.identity options are NULL. Public pd_process_data raises pipdata_dependency_context_error; master versions and both downstream catalogs remain empty. Logs/reproduce.log and reproducer-context.rds retained.
- `run.ps1 -Mode evidence -RunId n11` after correction: exit 0, actual completed-invalid diagnostic and blocked V3/V4 status printed accurately; logs/evidence.log retained. First-failure.txt/RDS and scenario.log untouched.
- Read back current `logs/evidence.log:161-163` after correction: 0/0 BEFORE catalogs, V3 NOT PASSED, V4 downstream rejection NOT CERTIFIED. `git diff --check` PASS (LF/CRLF notices only); complete owned source diff reviewed; unchanged launcher Parser.ParseFile reports zero syntax errors. Index diff empty; fresh runtime pins/log/archive ignored via .gitignore:36. These checks do not certify numerical logic or unreachable assertions.

## Fresh Provenance And Actual Results
Runtime root: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/n11`.
All seven packages installed there from exact local archives. Private R 4.5.2,
only `n11/library` and `n11/r/library`; installer/staging namespaces audited in
`logs/child-startup.log`. TEMP/TMP/TMPDIR, home, profiles, library/cache/log and
PIP roots redirected by the unchanged launcher before R children. No downloads,
contributed ambient fallback, package-tree installs or earlier runtime overlays.

| Package | Exact archive SHA | Installed version |
|---|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 | 0.1.0 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 | 1.0.1 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 | 1.0.0 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | 0.1.6 |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 | 0.1.2 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | 0.3.0 |
| pipdata | c5b27fa4458d7175aca81a203762bae81e9f0b40 | 1.0.0 |

`pins.tsv:2-8`, `installed-packages.tsv:2-8`, `inventory.rds` bind installation
receipts and exact archive/installed metadata checksums. `dependencies.tsv:2-108`
records 107 contributed dependency versions/origins/checksums. Suitable existing
RcppParallel 6.2.0/stringfish 0.19.2/qs2 0.2.2 copies come from 4.5-pipapi; all
other contributed copies come from explicit 4.5 paths, not search fallback.
`logs/repository-status.txt` records ambient HEADs/status separately: stamp and
pipload have preexisting dirty paths excluded by exact archive. Ambient pipload
HEAD ff9a81e differs from the approved archived 4ef0d90, deliberately. The other
five inspected package repositories were clean at setup. No package source edits.

Actual acquisition receipt f06316cf2ef761f9; validation-report receipt
c744743b7be70ef8; completed validation-inventory receipt f25f5e675fd52dc3. These
are NOT clean or metadata receipts. `logs/scenario.log:103-160` records completed
valid/invalid classification; `logs/evidence.log:26-37` records the specific
missing-weight error. First package failure is `logs/scenario.log:255-258` and
`first-failure.txt:1-2`. Input annual welfare 365/730/1095/1460 and person weights
10/20/30/40 are retained in `inputs.rds` and scenario.R:16-22; daily 1/2/3/4 and
clean/meta exact saved pins remain NOT REACHED, not observed or asserted passing.

Transport substitutions are saved in substitutions.txt: synthetic release CSV,
PPP vintage download/provenance, two-row DLW catalog and fixture survey download
through real pipload/stamp storage. Auxiliary PFW/CPI/PPP/pop/GDP/PCE are explicitly
normalized fixture inputs, not pipaux producer certification. No validator,
cleaner, metadata worker, rebuild selector or storage implementation replaced.

| Verification | Worker result |
|---|---|
| V1 | PASS tested isolation/install/provenance/usability surface |
| V2 | PARTIAL: real acquisition/validation success; cleaning attempted and blocked |
| V3 | NOT REACHED: numerical assertions and clean/meta exact-version readbacks |
| V4 | PARTIAL: completed-invalid + diagnostic; downstream rejection NOT CERTIFIED |
| V5 | Parent owns full review/final verify; no completion claim by this worker |

## Gaps
- Actual numeric, exact-version readback, and malformed-input evidence remain unverified in this attempt.
- Parent owns review and Plan/work-report updates; this report cannot claim phase completion.
- Fresh harness correction budget: step 2 one/two used for the narrow documentation/evidence correction; no retry beyond package boundary. Step 1 no corrections required in this run. Prior budgets/evidence remain historical and untouched. Parent owns step 3/review budget.
- The evidence renderer's successful-survey branch cannot be certified by this blocked runtime; no success evidence was invented. Full example functional surface includes baseline, boundaries, setup, green, real scenario and failure reproducer, not a direct Pester run. get_errors/execution_subagent unavailable.
- No exhaustive OS write audit, live DLW, shared/production, deflation, mean, incremental rebuilding or historical-version selection after a later save certified. No package suite from the earlier pipdata task is reused as survey proof.
- Only three experiment scripts and this exact worker handoff changed by this worker. Parent Work Report/Plan/active state/root handoff and concurrent changes were not edited. Pipsystem remains main at e9c71e3190f1ce88a017ae25af7c373a64c655a2 at last HEAD read; no Git mutations, staging, commits, pushes, new sessions/worktrees or source-library changes.

## Package Boundary And Owner Direction
Pinned pipdata c5b27fa, sources/pipdata/R/dependency_contract.R:266-273 defaults
release/identity from options pipfun.working_release/pipfun.identity and rejects
their absence. pd_process_data.R:117-123 reaches it after the new bootstrap helper.
Pinned pipfun 7d53451, sources/pipfun/R/working_release.R:121-126,154-169 returns and
persists the correct descriptor in .pipenv but does not set those options. The
example uses the documented exported release setup (scenario.R:89); no context
options or internal package state were seeded to evade this mismatch.

Proposed owner: pipdata package owner, coordinating the pinned pipfun public
release-state contract. Diagnose/reconcile context retrieval with the public
setup contract and add an integration check that starts from the real exported
setup. Do not hide the failure by injecting undocumented example options,
fabricating master state, or changing unrelated source pins. Package changes and
any future new immutable pin require separate authorization. This is source-backed
owner direction, not an implemented package fix or certification of a solution.
