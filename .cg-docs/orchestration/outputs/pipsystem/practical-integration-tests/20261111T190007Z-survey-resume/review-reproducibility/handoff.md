---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-reproducibility
status: completed
updated: 2026-11-11T19:12:35Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1 Phase 2
next: Coordinator incorporates the manual package-context blocker and keeps Phase 2 acceptance blocked; no rerun authorized by this review.
---

# Fresh installed-package reproducibility review

## Summary
Full reproducibility review of the original Plan revision 1 Phase 2 and fresh `.tmp/one-survey/n11` evidence completed. Environment/install evidence supports the reported fresh setup PASS. The actual survey attempt is NOT a Phase 2 pass: validation completed, but cleaning stopped at the public package release-context boundary. Numerical results, clean metadata and their exact saved-version readbacks were not reached; invalid classification does not certify downstream rejection.

One supported P1 manual package-integration finding below; no additional reproducibility defects found in the reviewed harness. Known P2 evidence-mode and P3 stale-header corrections are source-confirmed. Final reread of refreshed `n11/logs/evidence.log:161-163` confirms executed truthful blocked-run wording; the successful-run branch remains unexecuted because cleaning failed.

## Changes
Created and finalized only this requested review handoff. No package/source edits, downloads, package installations, scenario/reproducer execution or Git mutations by this reviewer. Existing concurrent changes were preserved. All reviewer writes are this E-drive checkout report.

## Checks run
- Loaded technical communication, R technical and R analytical skills.
- Read project constraints, coordination contract and original Plan Phase 2.
- Read-only Git checks: main, HEAD e9c71e3190f1ce88a017ae25af7c373a64c655a2; existing mixed-owner changes retained.
- Read all six `experiments/one-survey/` scripts; inspected current Git diff and `git diff --check` (PASS; only Git LF/CRLF notices). Authorized package-pin changes are pipload and pipdata only (`setup.R:16-22`); narrow concurrent evidence/header/reproducer changes are separate harness changes, not package changes.
- Inspected fresh pins, all 107 dependency rows, installed versions, namespace paths, setup/check/forced-failure/child/scenario/evidence logs, first-failure text, substitutions and source-hook capture. Did not execute package failure or infer results from prior runs.

### Provenance of package material read

Package source inspection used only the already extracted n11 Git archives and captured hook output, not dirty package working files. These are the exact archive revisions recorded in `.tmp/one-survey/n11/pins.tsv:2-8`:

| Package | SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | c5b27fa4458d7175aca81a203762bae81e9f0b40 |

### Review results

- **Exact clean archive inputs:** `setup.R:119-138` archives explicit SHAs, extracts those tar files and separately records repository status. `n11/logs/repository-status.txt:1-23` openly records dirty stamp/pipload checkouts and pipload HEAD differing from the selected archive. These are not silently installed dirty sources: installation targets extracted `source` paths (`setup.R:103-113`). Archive receipts and installed metadata checks are implemented at `setup.R:223-240`; successful fresh checks appear at `n11/logs/check.log:1-3,96`. No claim that all original working trees were clean is supported or needed for exact archive isolation.
- **Fresh installs and no contributed fallback:** `n11/logs/setup.log:1-9,31-33,126` records actual missing-dependency failure followed by seven successful installs and receipt checks. `n11/logs/install-missing-declared-cli.log:1-4` confirms absent dependencies, including cli, are not taken from ambient libraries. `n11/namespace-paths.tsv:2-47` puts every recorded namespace under n11's dedicated library or private base/recommended library. `n11/logs/child-startup.log:1-28` similarly records installer, staged load, check, forced failure and scenario children with only private n11 paths; allowed staged `00LOCK` paths remain private.
- **Dependency/OS environment record:** `n11/dependencies.tsv:2-108` records exact versions, E-drive copy origins, destination paths and DESCRIPTION MD5s; QS2 0.2.2/stringfish 0.19.2/RcppParallel 6.2.0 come explicitly from the 4.5-pipapi shelf (`:10-12`), not an ambient lookup fallback. `n11/installed-packages.tsv:2-8` records all seven installed versions. R 4.5.2, Windows Server 2022, locale, LAPACK and timezone are recorded at `n11/logs/session-info.txt:1-16`. Actual QS2 save/read and hash behavior are checked at `setup.R:38-55`, reached by fresh verification, rather than treating copied package existence as usability.
- **E-only writes and startup:** `run.ps1:12-19,35-60,65-100` checks output trees, redirects temporary/home/config/cache/library/history/Git configuration paths before R startup, copies a private runtime and logs every child. `paths.ps1:1-33` rejects redirected ancestors, descendants and hard links. Restoration is implemented in `run.ps1:103-108`, with success/forced-failure comparison in `checks.ps1:105-121`; fresh intentional child failure is visible at `n11/logs/forced-failure.log:1-8`. Source hooks were read (`n11/logs/source-hooks.txt:1-324`); the manifest cache default uses redirected `tools::R_user_dir` (`:294-317`), and scenario explicitly sets its manifest under n11 (`scenario.R:10-12`). The C-drive R path in `run.ps1:20` is a read-only copy input, not the executable write root. No C-drive write appears in reviewed evidence; this is path/startup evidence, not a system-wide filesystem audit.
- **Inputs and substitutions:** `scenario.R:15-42,56-85,90-120` and `n11/substitutions.txt:1-5` disclose synthetic survey/catalog/release/PPP and normalized auxiliary fixtures. Download transport writes via real pipload/stamp. Namespace bindings are restored with `on.exit`. This does not certify live DLW/GitHub or pipaux producer behavior.
- **Randomness/determinism:** Fixture construction is deterministic, with no random sampling, simulation or estimation in the scenario; a seed is not required for the fixed four-row fixture. Runtime timestamps/receipt identifiers are provenance, not expected numeric equality. Exact integer-like daily welfare/person-weight comparisons and exact saved data/metadata selectors are present at `scenario.R:148-178`, but were not executed after cleaning failed. No applicable research-results-manifest workflow is established by this Plan; do not add research scaffolding or a general lock framework to this minimal example.
- **Actual fresh survey outcome:** `n11/logs/scenario.log:103-160` records successful validation, SYNA valid, SYNB invalid and zero execution failures; `n11/logs/evidence.log:26-37` supplies the missing-weight diagnostic. The before-clean catalogs have zero rows (`evidence.log:161`). The first cleaning failure is recorded at `n11/first-failure.txt:1-2` and `scenario.log:255-258`; it is not malformed-input rejection, clean-data acceptance or a successful saved-version readback.

## Findings

**[P1]** `.tmp/one-survey/n11/sources/pipdata/R/dependency_contract.R:266-273` -- [manual] Public release setup and cleaning disagree on where release context lives.

**Issue**: At pipdata c5b27fa4458d7175aca81a203762bae81e9f0b40, `pd_dependency_context()` requires options `pipfun.working_release` and `pipfun.identity`. At pipfun 7d534516a8c17c33d537681610eccd4c29211762, `R/working_release.R:150-169` persists the release descriptor into `.pipenv` and returns it, without setting those options. The documented clean wrapper requests that context at archived `pipdata/R/pd_process_data.R:117-123`. The real fresh attempt calls public setup (`scenario.R:89`) but stops at cleaning (`:143-145`), with the exact context error (`n11/logs/scenario.log:255-258`). Consequently the approved installed combination cannot complete the required clean/save/pinned-readback example; no stochastic or dependency fallback explanation is needed.

**Fix**: Package owners must reconcile the public release-setup/access contract, with a focused public-call check before proposing another pinned combination. Preserve n11 as failed evidence. Do not seed hidden context options, fabricate a master, switch to internal workers, edit package code from this review or rerun the unchanged package failure. Exact choice of package fix is owner work, not approved here. This is the captured new package blocker, not a reassertion of the superseded old master-inventory failure.

No additional supported P0-P3 reproducibility issues found. The existing P2 evidence-mode/P3 header findings are not duplicated: corrected `setup.R:63-84` conditionally prints failure or acceptance evidence and `scenario.R:1` references the current pin. Final refreshed `n11/logs/evidence.log:161-163` says BEFORE clean wrapper 0 0, V3 NOT PASSED, and V4 downstream rejection NOT CERTIFIED. This confirms the narrow correction's actual blocked-run evidence check, not a successful scenario or an executed successful-run exporter branch.

## Gaps
- Phase 2 remains blocked: V3 numerical/data/metadata exact-version acceptance and completed downstream rejection checks are not reached. Validation success alone does not pass V2/V3/V4.
- This reviewer did not rerun any R/package command, rehash archives independently, deserialize binary evidence, or perform OS-wide write tracing. Conclusions trace to readable fresh evidence plus source; no claim of whole-system write certification.
- Dependency copies are a recorded local installed snapshot, not an independently downloadable environment lock. Recreating it elsewhere requires the recorded installed versions/binaries and R runtime; no new lockfile/download scope is proposed for this bounded offline example.
- Independent negative path controls were inspected in script, not rerun by this reviewer; previously green controls are not fresh survey acceptance. Subsequent concurrent evidence/reproducer checks and consolidated final `/cg-review mode:verify` are coordinator responsibilities.
- Historical pin selection after a later save, live transport, production releases, deflation and estimates remain outside this example's certification.
