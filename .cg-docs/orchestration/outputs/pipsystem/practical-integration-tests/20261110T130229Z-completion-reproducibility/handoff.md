---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T130229Z-completion-reproducibility
status: completed
updated: 2026-11-10T13:07:18Z
owner: reproducibility-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator incorporates this completed role review into the full review and final light verification.
---

# Completion reproducibility review

## Summary
No new actionable P0-P3 reproducibility findings identified in the reviewed scope. All five previously open follow-up findings have supported corrections and retained regression evidence. The two previously narrow-fixed boundaries (actual installer isolation and fresh-source/library reuse rejection) remain supported. This is completion of the reproducibility review role, not overall Plan/V5 or original survey certification.

Reviewed the current `experiments/one-survey/{paths.ps1,run.ps1,checks.ps1,setup.R}`, approved follow-up Plan, previous full-review findings, and the resumed section at the TOP of the Work Report. Historical blocked sections are preserved history, not current resumed status. The latter reports V1-V4 passing and V5 pending (`.cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md:3-29`).

The actual diagnostic reproduces the missing-cache ENOENT while the diagnostic root/cache remain absent. It is not successful pipaux installation or original survey execution.

## Changes
Only this requested report was created and finalized. No code, package, Plan, other report, protected artifact or Git mutations. Existing tracked/untracked changes preserved. No R, launcher, helper, setup, tests, installation, downloads or fixes executed by this reviewer. No additional dependencies, framework or attestation system recommended.

## Checks run
### Review methods and checkout

- Read-only `git status --short`, `git branch --show-current`, `git rev-parse HEAD`: existing main at `f9454707b292a620e25abef17f2e515794020ba7`. Tracked changes at review entry were `.cg-docs/active-state/current.json` and `.gitignore`; task reports/Plans/reviews/experiments were untracked. No staging or Git mutations performed.
- Read project charter, design, harvest brief and coordination contract. No Decided item changed or newly contradicted by this bounded harness.
- Loaded `pl-clear-technical-communication`, `cg-skill-r-technical` before R review, and `cg-skill-r-testing` for assertion review. No data.table manipulation, grouped statistics or Stata/Python code was reviewed.
- Inspected source and retained text logs/TSVs only. No independent rerun, RDS deserialization or package payload attestation. Read system clock for final report update (08:07:18 EST / 13:07:18Z).

### Evidence shorthand

`G` = `.tmp/one-survey/20261110T125325Z-completion-green/`.

`F` = `.tmp/one-survey/20261110T125325Z-completion-green-fixtures/`.

`R` = `.tmp/one-survey/20261110T125325Z-completion-red/`.

`W` = `.cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md`.

### Closure of five previous findings

IDs refer to the previous follow-up full review (`.cg-docs/reviews/2026-11-09-one-survey-harness-repair-and-diagnosis-review.md:21-35`), not similarly numbered original findings.

| Previous finding | Reproducibility conclusion | Current source and retained exercised evidence |
|---|---|---|
| P1.1 helper unchecked RunId/fixture writes | Closure supported | `checks.ps1:1-9` validates RunId and runtime; `:39-44` checks fixture destination before creating it. `paths.ps1:1-32` checks checkout containment, ancestors, reparse points and recursive hard links. `F/checks.log:22-25` shows helper traversal/redirect rejection; `:26-49` shows launcher controls and completion. |
| P1.4 nonexported stamp control | Closure supported | `setup.R:31-44` uses `pipfun::log_names()` and exported `stamp::st_hash_obj()` behavior: shape, same input/same hash and different input/different hash. `:39-41` explicitly handles base namespace with private `.Library/base`. `G/logs/check.log:1-36` passes usable behavior, namespace provenance and mutation controls. |
| P1.5 fixture hardlink poisons positive runtime | Closure supported | `checks.ps1:37-44,86-101` puts targets in a checked sibling fixture root, with negative-runtime siblings separate from the positive runtime. `F/checks.log:42-49` shows linked-log rejection and unlinked-positive completion. Actual later check/forced-failure/diagnostic children appear in `G/logs/child-startup.log:9-11`. |
| P2.3 unrelated exceptions accepted as expected controls | Closure supported | `checks.ps1:11-28` matches explicit error reason and caller state; `:49-65,73-100` adds boundary-specific errors and no-write assertions. `:113-116` requires fresh intentional R child marker. `F/checks.log:22-49` contains the distinct controls; `G/logs/forced-failure.log:1` and child startup `:10` confirm actual R entry, not only prelaunch rejection. |
| P2.4 dependency rows not reconciled | Closure supported for required current-copy provenance | `setup.R:150-189` compares inventory against current dependency TSV, uniqueness, exact copied paths, fixed origin convention, copied DESCRIPTION versions/digests, receipts and actual loaded paths. `:194-208` rejects missing receipt, stale SHA, wrong root, stale dependency version and truncated table. `G/logs/check.log:1,36` retains all five rejections and PASS; `G/dependencies.tsv:2-54` retains 53 records; `G/namespace-paths.tsv:2-17` captures actual loaded destinations. |

### Retained ten boundary controls

`checks.ps1:47-102` and `F/checks.log:22-49` support exactly ten controls: helper traversal; helper fixture-root junction; launcher recursive redirects for base-library, logs, sources and library (four); populated sources and populated library (two); hard-linked log; redirected runtime ancestor. Assertions require target preservation/no early runtime writes. The positive runtime is not used as the fixture target. These are actual retained controls, not this reviewer's execution.

### Original seven-finding mapping and remaining narrow boundaries

| Original scope | Evidence supporting current closure |
|---|---|
| Pre-write confinement | Above P1.1 closure; launcher validates runtime before output creation (`run.ps1:9-36`), including all descendants, and validates recursive R copy inputs before destination creation (`:20-33`). |
| Actual child library isolation | Private base/recommended-only R copy and augmented private base startup (`run.ps1:65-91`); real resolver/lazy-load children in `G/logs/child-startup.log:2-8` use only dedicated/private-default libraries with contained 00LOCK staging. `G/logs/install-missing-declared-cli.log:1-4` is a real stamp declared-dependency failure before copies, not an artificial package-absence check. |
| Fresh exact source/library snapshots | `run.ps1:14-18` rejects existing setup/baseline attempts; `setup.R:73-84` extracts the seven fixed Git objects into empty source destinations; `:124-125` rejects existing dependency destination directories. Populated-source/library controls are retained in `F/checks.log:38-41`. |
| Behavioral baseline | `R/logs/baseline.log:1,8-9` is actual missing-pipfun red. Later `G/logs/check.log:1-36` demonstrates green after installs using current exported behavior. |
| Current-install provenance | `setup.R:150-189` validates successful current receipts, source-archive and installed-metadata digests, required pins, exact dependency destinations and namespace paths. `G/logs/install-stamp.log:13` and `G/logs/install-pipfun.log:15` record DONE; subsequent usable checks distinguish install exit0 from runtime acceptance. |
| Real negative controls | Actual missing-dependency failure plus ten reason-specific boundary controls, five receipt/dependency mutations, and actual forced R-child failure. |
| Caller restoration | `run.ps1:61-64,98-103` preserves/restores previous or unset process values and error preference. `checks.ps1:11-28,105-121` compares all environment keys/values and preference on success and intentional child failure, including previously-unset R_TESTS. W:12 reports this pair passed; retained check, forced-failure marker and real child startup independently establish both R executions. Full before/after environment dumps are not retained; see Gaps. |

### Environment, paths, determinism and reconstruction assessment

- No ambient contributed-library fallback is evident in recorded actual children. Parent-only `.Library` rebinding is no longer the mechanism: the default R library itself is a private copy containing base/recommended packages (`run.ps1:20-33,65-91`). Loaded contributed namespaces in `G/namespace-paths.tsv:3-4,7,11-12,14-16` resolve to the copied dedicated destinations.
- R 4.5.2 and local E:/ checkout/package/dependency roots are explicit prerequisites, not portable discovery. `run.ps1:9,20` and `setup.R:4,9-22,102` bind this bounded local experiment to this machine layout. C:/ installed R is read-only input; all copied/output paths are under the E:/ checkout, validated before creation. Temp/home/config/cache/log paths are set before launching children (`run.ps1:35-64`). No outside-E write was observed or alleged by this review.
- The harness uses no random sample, simulation, bootstrap, Monte Carlo, randomized split or stochastic estimator. No missing seed finding is applicable. The deterministic hash behavior is asserted directly (`setup.R:34-38`); diagnostic timestamps/run IDs do not constitute numerical outputs. No c-research manifest workflow is required here.
- The 53 copied dependencies are recorded with versions/origins/DESCRIPTION digests and reconciled against the current copy. This is not a committed renv lockfile or independent environment-restoration archive. Under the approved local, no-download harness contract this is a limitation, not a new required renv/framework feature. No claim is made that a clean external machine can recreate the environment from TSV alone.
- Exact package sources are full-SHA Git archives, not live dirty package working trees (`setup.R:76-86`). Receipts connect current runtime, pins, archives and installed metadata (`:171-180`). No pipeline data download occurs; the diagnostic uses a fresh absent root, not production data.

### Diagnosis and source provenance

`G/logs/diagnose.log:36-40` records the exact exported call with `vintage=NULL`, `create_dir=FALSE`, `verbose=FALSE`; the first error is `ENOENT,fs_error,error,condition` at absent `pip_ingestion_pipeline/pc_data/cache/clean_survey_data`. Both root and cache remain FALSE; downstream pipaux install, survey, storage and numeric scenario are explicitly NOT RUN.

Read retained source snapshots, not package checkouts, for the diagnosis: pipfun `R/pip_create_globals.R:14-17,33-41` promises noncreating discovery and defaults to NULL vintage; `:228-238` enumerates the absent clean-data cache. pipaux `R/zzz.R:1` eagerly calls those globals. Their full source pins are below. Owner direction is source-supported and runtime-confirmed for the reduced call: tolerate absent cache during noncreating discovery, or defer eager pipaux initialization. No package remedy is applied or required to complete this diagnostic deliverable; no new harness defect is created by the known package boundary.

All seven source pins are retained in `G/pins.tsv:2-8` and match `setup.R:16-22`:

| Package | Full SHA | Source read by this reviewer |
|---|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 | Pin and install evidence; no package source files |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b | Retained snapshot R/pip_create_globals.R:1-65,210-249 |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 | Pin only |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | Pin only |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 | Pin only |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | Retained snapshot R/zzz.R:1-65 |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 | Pin only |

The hub SHA is recorded in frontmatter. No package source was read without recording its full snapshot SHA. Package current HEADs were not refreshed or substituted for the source pins.

## Gaps
- This is independent source/retained-evidence review, not independent execution. No RDS files were deserialized, whole-package payload equality verified, compiled dependency closure audited or OS-wide write trace performed. Current recorded namespace/receipt checks do not claim such certification.
- The success/forced-child environment equality outcome is retained in W:12, supported by current assertions and independent child/check/error logs, but no standalone green-helper transcript or full environment dumps were found in the specifically reviewed evidence. This granularity limit does not establish an observed false PASS.
- `G/logs/setup.log:26-29` remains the real initial base-namespace audit failure after successful installs (`:1-4`). It is not relabeled successful setup. Current `setup.R:39-41` handles base explicitly and subsequent `G/logs/check.log:1-36` passes. Install logs retain missing R.css documentation-copy warnings (`install-stamp.log:8-9`, `install-pipfun.log:10-11`) and pipfun byte-compilation notes (`:6-7`), not usable-runtime failures.
- Machine-specific installed R and ambient dependency origins are prerequisites; the retained local runtime is not a portable replication bundle or lockfile-only restoration proof. No extra lock/dependency/framework work is required for this approved bounded task.
- Original survey Plan remains excluded and unexecuted: live DLW, full ecosystem installation, survey validation/storage/numeric output, deflation/mean, incremental and historical certifications are not demonstrated. Reduced ENOENT reproduction must never be presented as original success or a package fix.
- V5 full-role consolidation and final light verification are coordinator-owned and pending at W:27 when read. This completed role alone does not certify V5 or overall Plan completion. No user approval gate is requested by this review.
