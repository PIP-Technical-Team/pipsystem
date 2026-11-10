---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T130229Z-completion-testing
status: completed
updated: 2026-11-10T13:07:11Z
owner: completion-testing-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator integrates this full testing role with other reviews and final light verification.
---

# One-survey completion testing review

## Summary
FULL testing review completed. No new actionable P0/P1/P2/P3 findings identified. The five previously open follow-up findings have source corrections and current executed evidence supporting closure. Two previously narrow fixed scopes remain supported. This is completion of the testing review role, not completion of the original survey Plan or the coordinator's full-review/final-verify route.

Reviewed all of `experiments/one-survey/{paths.ps1,run.ps1,checks.ps1,setup.R}`, the resumed TOP of the Work Report, approved Plan and prior November 9 consolidated review. No scripts, R, Pester, tests or diagnostic were executed by this reviewer. Latest completion authorization in Work Report:3-4 supersedes its historical budget-stop narrative; no old approval gate is revived.

## Findings
No new actionable P0-P3 issues in this scope. Counts: P0=0, P1=0, P2=0, P3=0. The package ENOENT is a successfully observed diagnostic result, not a new harness failure or a numerical correctness claim.

## Evidence notation
- `H/` means `experiments/one-survey/`.
- `W` means `.cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md`.
- `PR` means `.cg-docs/reviews/2026-11-09-one-survey-harness-repair-and-diagnosis-review.md`.
- `G/` means `.tmp/one-survey/20261110T125325Z-completion-green/`.
- `F/` means `.tmp/one-survey/20261110T125325Z-completion-green-fixtures/`.
- `R/` means `.tmp/one-survey/20261110T125325Z-completion-red/`.
- Source line citations below use the currently read working files, not their old line numbers in PR.

## Five prior closures
| Prior ID | Current conclusion | Source correction and executed evidence |
|---|---|---|
| P1.1 helper unchecked writes / RunId | CLOSED in reviewed scope | `H/checks.ps1:1-9,38-43` validates RunId and actual output tree before fixture creation; `H/paths.ps1:1-32` checks checkout confinement, ancestors, recursive links and hardlinks. Helper entrypoint traversal/redirect controls run against the helper itself (`H/checks.ps1:47-65`). `F/checks.log:22-25,49` records rejection and completed controls; target-empty assertions precede the final marker. |
| P1.4 nonexported acceptance | CLOSED | `H/setup.R:31-44` uses exported `pipfun::log_names` and deterministic/different-input `stamp::st_hash_obj`, with explicit private base path handling. Archived stamp `G/sources/stamp/NAMESPACE:17` exports the chosen function. `G/logs/check.log:1-36` reaches all acceptance controls and PASS, rather than merely DONE install commands. The intermediate base-namespace lookup failure is retained at `G/logs/setup.log:26-29`, not concealed. |
| P1.5 hardlink fixtures poison runtime | CLOSED | `H/checks.ps1:37-44,86-100` places negative fixtures and hardlink target in siblings, outside the accepted green runtime, and rechecks the positive runtime at :101. `F/checks.log:42-49` records linked-file/ancestor controls and final success. Subsequent actual green and intentional-failure children reached R (`G/logs/child-startup.log:9-10`); original cross-file blocking effect no longer occurs. |
| P2.3 any exception accepted | CLOSED | `H/checks.ps1:11-28` requires expected outcome plus reason-specific error regex and caller-state equality. Redirect controls require redirect diagnostics, not existing-attempt failure; prewrite assertions check untouched targets. `F/checks.log:26-48` shows distinct redirect, populated-attempt, hardlink and ancestor diagnostics. `H/checks.ps1:113-116` refuses an old forced-child log and requires the intentional marker, independently present at `G/logs/forced-failure.log:1`; real child at startup log:10. |
| P2.4 dependency provenance unreconciled | CLOSED for current copied metadata / loaded-path scope | `H/setup.R:150-189` reconciles current TSV membership with inventory, rejects duplicates, and checks each recorded version/origin/destination/DESCRIPTION digest against current copied metadata; it binds required receipt SHA/root/archive/installed metadata/DONE evidence and exact loaded paths. Five mutations at :194-208 run after successful unmodified verification. `G/logs/check.log:1,36` confirms rejection controls and PASS; `G/dependencies.tsv:2-54` contains 53 records and `G/namespace-paths.tsv:2-17` records 16 loaded namespaces. Not a whole-payload attestation claim. |

PR:22-35 defines the five prior findings. Original and follow-up ID namespaces differ (PR:44-54); specifically follow-up P2.4 is dependency provenance, whereas original P2.4 is caller restoration.

## Other required checks and claim assessment
- **Behavioral red then green:** `R/logs/baseline.log:1,8-9` is actual missing-pipfun namespace failure, not missing inventory. `H/checks.ps1:30-34` checks that exact reason. `G/logs/check.log:1-36` confirms usable exported behavior, private library paths, five mutations, and follow-up-specific PASS wording. This is not original V1 success.
- **Actual installation boundary / prior narrow P1.2:** `G/logs/install-missing-declared-cli.log:1-4` records real declared stamp dependency rejection and removal before copying dependencies. `G/logs/child-startup.log:2-8` records restricted resolver and staged lazy-load children; only dedicated/private library roots and contained 00LOCK staging occur. `H/run.ps1:74-90` installs the check in the private startup profile before child resolution. The parent-only .Library proxy is not being relied upon.
- **Successful installed packages:** `G/logs/install-stamp.log:1-13` and `G/logs/install-pipfun.log:1-15` show staged source installation and DONE; source versions are stamp0.1.0 and pipfun1.0.1. Missing private documentation R.css warnings and pipfun byte-compile notes remain visible; no fatal install error is hidden. Usability is independently checked later, not inferred from DONE or `--no-test-load`.
- **Fresh destinations / prior narrow P1.3:** `H/run.ps1:13-18` rejects baseline/setup reuse before directory creation at :35-37; `H/setup.R:73-84,124-125` requires empty source/library and refuses copied dependency overlays. `F/checks.log:38-41,49` records populated source/library rejection and completed preservation assertions.
- **Ten negative boundary controls:** exactly two helper controls, four redirected child directories, two populated destination controls, one hardlink log and one redirected ancestor (`H/checks.ps1:47-102`). `F/checks.log:22-49` records completion. Helper tests have explicit error identity and empty target assertions rather than accepting an arbitrary launch failure.
- **Caller restoration:** `H/run.ps1:61-64,98-103` restores saved process environment and error preference. `H/checks.ps1:11-28,105-121` compares all keys/count/values and preference after successful check and actual intentional R-child failure, with preexisting HOME and unset R_TESTS. W:12 reports the pair passed; `G/logs/child-startup.log:9-10`, `G/logs/check.log:36`, and `G/logs/forced-failure.log:1` independently corroborate both child executions. The PowerShell equality results themselves are not saved in a standalone green-phase transcript; see Gaps.
- **Diagnosis:** `G/logs/diagnose.log:36-40` records the exact exported call (`vintage=NULL`, `create_dir=FALSE`, `verbose=FALSE`), class ENOENT/fs_error/error/condition, expected missing clean-survey cache, absent diagnostic root/cache after the call, and downstream NOT RUN. `H/setup.R:217-237` requires fresh absent root, saves the first result and provenance, and distinguishes mismatch from reproduction. W:17-19 accurately limits the diagnosis; no pipaux install, original survey, numeric, storage or incremental scenario is claimed.
- **Source-supported owner direction:** archived pipaux `G/sources/pipaux/R/zzz.R:1` eagerly calls `pipfun::pip_create_globals()`. Archived pipfun `G/sources/pipfun/R/pip_create_globals.R:228-238` lists the cache for null vintage. That source chain and current reduced installed-pipfun result agree. Potential owner remedy is already recorded at W:19; no package change or bypass is part of this review.
- **Whole route:** W:21-29 explicitly marks V5 pending fresh full-role review and final light verify, and preserves original survey exclusions. This review supplies testing-role evidence only; it does not certify all other role outputs or final verify.

## Coverage and test quality assessment
- Critical harness boundaries have direct, deterministic controls: path confinement and redirects, fresh/reused destination behavior, actual missing declared dependencies, usable exported behavior, changed-input hash, receipt mutations, dependency metadata reconciliation, exact namespace paths, and both child outcomes with environment restoration assertions.
- Tests are explicit PowerShell/R assertions rather than a new testing framework, appropriate for the bounded experiment. No new dependency, CI matrix, general schema/checksum framework or speculative safeguard is recommended.
- Fixture layout deliberately separates negative and positive state; attempted old-runtime overlays are rejected rather than cleared. No test relies on network or random draws. setup/check/green have an intentional lifecycle dependency on one fresh runtime; this is an integration experiment, not purported independently ordered unit tests.
- The real installer is the I/O boundary; no mock is masking child resolution. No reviewed test mocks an internal function with possible target drift. Empty/invalid inputs relevant to this entrypoint include invalid RunId, missing/present attempts, populated sources/libraries, absent dependency, incomplete/stale receipts/dependencies, and nonexistent diagnostic cache. Survey numeric/missing-data edges are excluded because no analytical scenario runs here.

## Changes
Only this report was created and finalized. No harness, Plan, Work Report, package, protected record or Git mutation; no fixes, deletions or cleanup. Preserved source and historical failed attempts.

## Checks run
Reviewer performed read-only source/log inspection and read-only `git rev-parse HEAD`, `git branch --show-current`, and `Get-Date -Format o`. Verified current root is existing main at f9454707b292a620e25abef17f2e515794020ba7. No script, R, Pester, test, package installation or runtime regeneration was run. No tool-specific temp/cache outputs were created by reviewer commands; only this E-local report was written through apply_patch.

Loaded `pl-clear-technical-communication`, `cg-skill-r-testing`, and `cg-skill-r-technical`. Read required project documents and pip-handoff-v2 contract. Read both implementation and its saved assertions, not only claimed status. R API mocking skill references were not required: this is installation/path diagnosis, not plumber or httr2 request testing.

## Package source provenance
No live package repository source or working tree was inspected. Archived source/evidence under G was read. These exact recorded pins agree between `H/setup.R:16-22` and `G/pins.tsv:2-8`; archive commit identity/content was not independently rehashed in this nonexecuting review:

| Package | Recorded SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

## Gaps
- No fresh executions were permitted; all runtime outcomes are conclusions from preserved logs plus the source that produces their assertions. Binary inventory.rds and diagnostic.rds were not deserialized by this reviewer.
- Saved check/forced-child logs prove the R paths/outcomes; the all-key PowerShell environment-equality pass is attributed specifically to W:12 and current assertion source, not to a nonexistent standalone green-helper transcript. No contradictory outcome was found.
- Dependency DESCRIPTION digests, installed metadata and archive receipts establish the stated bounded provenance, not whole compiled-payload byte equality, exhaustive namespace loading, hostile concurrent mutation resistance or OS-wide write auditing. No such broader certification is claimed or required for this review.
- Setup log intentionally retains the intermediate base-namespace audit failure; current check after the bounded audit correction is green. Do not rewrite that failed history as a successful setup acceptance run.
- Original survey/malformed-input/numerical/storage/live-DLW/incremental/historical-version certification remains unexecuted and outside this follow-up. Reproduced ENOENT is not package repair or original Plan completion.
- Other full-review roles and final light verify are coordinator-owned stages, not certified by this testing-role report. No additional approval is requested and no historical budget gate is reopened.
