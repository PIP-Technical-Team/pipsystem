---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T222400Z-implementation
status: blocked
updated: 2026-11-09T22:31:11Z
owner: implementation worker
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent assesses preserved pipaux installation boundary and coordinates owner action and reviews; step 2 has not started.
---

# Installed-Package Survey Example

## Summary
Step 1 attempted and blocked at the first package boundary. Five exact-snapshot installations succeeded; the sixth, pipaux, failed during lazy loading. Step 2 was NOT started. No package fixes, dummy directories to bypass the failure, or internal-worker substitutions were attempted. Parent owns reviews and final state. This is not Plan completion.

## Changes
- Added `experiments/one-survey/setup.R` and thin PowerShell launcher `experiments/one-survey/run.ps1`.
- Runtime only under `.tmp/one-survey/`: exact Git archives and extracted sources, copied dependencies with provenance, base/recommended subset, dedicated installed library, logs, inventory and unexecuted reduced reproducer.
- `scenario.R` not created: the mandatory package-boundary stop occurred before step 2.
- No Git mutations or package edits. Parent-owned Plan, work report, active state and handoff untouched. Initial unrelated status included active-state modification and untracked Plan/work report.

## Checks run
### Inspection and baseline
- Read full approved revision 1 Plan, compound-gpid.md, SYSTEM_DESIGN.md, HARVEST_BRIEF.md and handoff contract.
- Tools found: Rscript `C:/Program Files/R/R-4.5.2/bin/Rscript.exe`, Git and Windows tar. No downloads or shared library mutations.
- Inspected R site/base startup: `C:/Program Files/R/R-4.5.2/etc/Rprofile.site` and `library/base/R/Rprofile`. Site Renviron absent; project .Rprofile absent. Launcher uses `--vanilla`, disabled explicit profile/environment/Makevars paths, clears R_TESTS, redirects home/temp/cache/config/log and PIP/DLW roots before R launch.
- Inspected project-package startup: pipfun/R/zzz.R:1-37; pipdata/R/zzz.R:1-32; pipaux/R/zzz.R:1-64; pipload/R/zzz.R:1-49; stamp/R/zzz.R:1-108; dlw/R/zzz.R:1-24; wbpip/R/zzz.R:1. Relevant package configure/Makevars/install-library searches returned none. Inspected pip_create_globals path logic before installation, but its missing-cache assumption was not identified until the observed failure.
- One targeted test scan: pipdata tests matching `*one-survey*`; read the upstream helper and acceptance test as reference only, never sourced or executed them. Fixture values were not reached in execution.
- Actual PowerShell invocation `& ./experiments/one-survey/run.ps1 baseline`: expected failure at missing inventory before implementation installation. PowerShell stderr handling interrupted log capture; literal observed output preserved at `.tmp/one-survey/baseline-observed.txt` (not represented as a captured child log).

### Actual installation commands and results
- Actual invocation `& ./experiments/one-survey/run.ps1 setup` first failed at the harness assertion that every package in R's installation library has a base/recommended priority. This installation contains contributed packages too.
- Actual invocation `& ./experiments/one-survey/run.ps1 setup` after correction archived the exact SHAs below using `git -C <repo> archive --format=tar --output=<runtime>/sources/<package>.tar <SHA>`; archives exclude all uncommitted/untracked working-tree content.
- Dependency closure traversed Depends/Imports/LinkingTo without loading the ambient library; existing third-party installations copied from `E:/PovcalNet/01.personal/wb384996/R/win-library/4.5`. `.tmp/one-survey/inventory.rds` retains version, resolved source and destination, DESCRIPTION MD5 for each copied dependency, source SHAs and excluded dirty-tree records. No downloads. Exact dependency count was not separately rendered before stop.
- Per-package executed command is constructed as `file.path(R.home("bin"), "R.exe")` with arguments `CMD INSTALL --no-multiarch --no-test-load --library=<runtime>/library <runtime>/sources/<package>`; exact R.home('bin') string was not separately rendered. Each installation inherited launcher process-local redirections.
- Results in order: stamp 0.1.0 exit 0; pipfun 1.0.1 exit 0; pipload 1.0.0 exit 0; wbpip exit 0; dlw exit 0; pipaux 0.3.0 exit 1. pipdata installation not attempted. Five successful install commands out of six attempted, seven snapshots archived. Successful install is NOT certified runtime loading because `--no-test-load` is explicit.
- Package logs: `.tmp/one-survey/logs/install-{stamp,pipfun,pipload,wbpip,dlw,pipaux}.log`; overall `.tmp/one-survey/logs/setup.log` retains final setup output.
- `git diff --check` exited successfully, with an unrelated active-state LF/CRLF warning; untracked owned files are not covered by this Git check. Final status showed no tracked source edits by worker.

### First package failure and owner direction
`logs/install-pipaux.log:7-11` records:

```text
Error : [ENOENT] Failed to search directory 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/store/pip_ingestion_pipeline/pc_data/cache/clean_survey_data': no such file or directory
Error: unable to load R code in package 'pipaux'
Execution halted
ERROR: lazy loading failed for package 'pipaux'
```

Executed reproducer is the pipaux install command above with the retained archive/source and launcher environment. Reduced suspected root call is preserved at `.tmp/one-survey/reproduce-pipaux.R`, NOT separately executed. Source direction: pipaux `R/zzz.R:1` evaluates `gls <- pipfun::pip_create_globals()` at source/lazy-load time; pipfun `R/pip_create_globals.R:228-238` unconditionally lists the clean-survey-data cache for vintage=NULL even with create_dir=FALSE. Proposed owner direction: pipaux/pipfun owners assess fresh-root initialization and avoid requiring a preexisting production-style cache during package installation. No package change proposed as already approved or applied.

### SHA inventory (every package repository read)
| Package | Full Git snapshot SHA | Source working-tree state |
|---|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 | Dirty config/docs; archive excludes changes |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b | Clean |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 | Dirty .gitignore/untracked docs/config/sessionInfoLog; archive excludes changes |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | Clean |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 | Clean |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | Clean |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 | Clean |

### Verification status
| Surface | Status | Evidence |
|---|---|---|
| V1 | PARTIAL / FAILED gate | inventory.rds, snapshots, launcher, setup/install logs; fresh runtime setup check not reached |
| V2 | NOT RUN | Required installed pipaux unavailable; step 2 not started |
| V3 | NOT RUN | No cleaned data, saved version receipts or metadata readback |
| V4 | NOT RUN | No malformed control; no-work/error was NOT called invalid rejection |
| V5 | Parent-owned | No reviews run by this worker |

### Correction budget and deviations
- Step 1: two harness corrections used. (1) PowerShell 5 native stderr capture set nonterminating only around the R invocation. (2) R installation contains third-party packages, so setup copies only base/recommended into a runtime subset and changes the setup process's .Library binding; no ambient third-party fallback in its intended functional check.
- Step 2: zero corrections, no execution.
- Autonomous deviation: base/recommended subset is copied into runtime instead of exposing the mixed installation library. No dependency additions. No Plan/scope/protected changes.
- Minimal first: no new framework; only setup and launcher; stop instead of extra compatibility or package fixes.

## Gaps
- Full usable isolated environment was not achieved: pipaux installation fails; pipdata not installed and final fresh-process paths/version check not run. Required missing-dependency and unsafe-path functional checks after installation were not reached.
- The installation children inherit environment redirections but retain R's built-in .Library search path during byte compilation; no full child namespace-path inventory or OS-level write audit was produced. The parent setup process applied its .Library restriction before installation; final namespace/path verification was not reached. Do not call isolation fully certified. This chronology wording was corrected by the coordinator during documentation review; execution evidence is unchanged.
- Third-party provenance is retained in inventory.rds, not separately rendered to a human-readable dependency table. Third-party package hooks were not exhaustively inspected; standard home/cache redirections are not proof against hardcoded paths.
- Valid survey, malformed missing-weight control, row-aligned daily welfare/weights and exact data+metadata readback remain untested. No transport substitutions were executed.
- Live DLW, deflation, mean, incremental behavior and historical-after-second-save selection remain explicitly uncertified/out of scope.
- No reviews or verify review were run; parent coordinates those. Minimal reproducer was saved but not separately executed after mandatory stop.
