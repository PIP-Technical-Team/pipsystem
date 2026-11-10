---
schema: pip-handoff-v2
project: pipfun
task: practical-integration-tests
run: 20261110T152620Z-cache-fix
status: completed
updated: 2026-11-10T20:58:04Z
owner: pipfun-cache-fix
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipfun
branch: PROD
head: 7d534516a8c17c33d537681610eccd4c29211762
plan: NONE
next: Corrected local revision is available for a separately authorized fresh installed-package experiment; no push or experiment execution is part of this checkpoint.
---

# Fresh-root Cache Initialization Fix

History note: The implementation sections below, through the first Gaps section, preserve the pre-commit checkpoint. The appended Local Commit Checkpoint is current for Git revision and status and resolves the earlier missing-immutable-revision gap.

## Summary

Repository root and existing branch verified using `git rev-parse --show-toplevel` and `git branch --show-current`: expected pipfun checkout on PROD. Starting full HEAD is `0c6a78d9884ed0965a524311537eec2a5095d60b`. Starting `git status --short --untracked-files=all` is empty. No branch switching or worktree creation.

The bounded package fix is complete and verified against an actual working-tree package installation. With `vintage = NULL` and `create_dir = FALSE`, absent or empty caches return the scalar unversioned clean-survey cache path. Existing entries retain greatest-basename selection. The diagnostic root and cache both remain absent. Thirteen tests passed with 69 expectations, zero failures/errors/skips and zero test warnings. The original one-survey experiment was not resumed, and no corrected immutable Git revision exists yet.

At the starting SHA, the documented noncreating contract (`R/pip_create_globals.R:14-17`; `man/pip_create_globals.Rd:36-39`) conflicted with unconditional cache enumeration at `R/pip_create_globals.R:228-242`. Prior evidence was read without modification: pipsystem work report `2026-11-09-one-survey-harness-repair-and-diagnosis.md:16-19` and `20261110T125325Z-completion-green/logs/diagnose.log:36-40`.

Minimal first: smallest complete fix, one functional check per change, existing tools, no added safeguards for reversible failures, no new dependencies unless they save more work than they cost. No separate Plan is needed.

## Changes

- `pipfun/R/pip_create_globals.R:235-243`: default to the cache parent, enumerate only an existing directory, and append the existing greatest child basename only when entries exist. No creation, fabricated vintage, new returned field, directory-only filtering or broad error suppression. Explicit-vintage behavior is unchanged.
- `pipfun/tests/testthat/test-pip_create_globals.R:8-56`: three focused functional cases for absent, empty and populated caches; verify scalar fs_path/list shape, unchanged version-field shape, and no directory creation or fixture-tree changes. All three cases passed (16 expectations).
- This report plus supporting `run-checks.ps1` and `checks.R` record the E:-local baseline/install/verification route. Installed R 4.5.2 and existing dependencies were reused; no downloads or new dependencies. Data.table is used for the local PPP fixture and result summary; collapse is not applicable to this scalar filesystem-path correction.
- Generated evidence and private runtime are under this run's `runtime/`; short-path test temp is `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/pipfun-cache-fix-20261110T152620Z/temp`. Runtime copies/libraries/homes/caches are test artifacts, not package changes or commit inputs.
- No commits, staging, pushes, merges, branches, worktrees, client settings, other-package changes, production/shared-state changes or pipsystem design changes.

## Checks run

- Read-only Git root, branch, full HEAD and initial status: matched expectations; clean checkout.
- Verified E: repository/output parent ancestry has no reparse points before writes.
- Read package source, DESCRIPTION, generated help, package startup, project instructions and handoff contract.
- Private `run-checks.ps1 -Mode prepare` runtime bootstrap: passed; copied an existing E:-local private R and restored its original base profile from the installed R, changing only the new E: copy. Prior runtime, sources, dependencies and logs remain unmodified.
- `run-checks.ps1 -Mode baseline`: reproduced the exact exported-call ENOENT using the earlier installed pipfun; root/cache remained absent. Evidence: `runtime/logs/baseline-20261110T161138117Z.log:8-10`.
- `run-checks.ps1 -Mode install`: actual `R CMD INSTALL --no-test-load --library=<this-run>/runtime/library <pipfun-repo>` completed, exit 0. Evidence: `runtime/logs/install-20261110T161144998Z.log:9-25`. This installed the modified working-tree source, not a new commit or the old pinned source archive.
- `run-checks.ps1 -Mode check`: passed, exit 0. First called the real installed `pipfun::pip_create_globals(root_dir = diagnostic_root, vintage = NULL, create_dir = FALSE, verbose = FALSE)` without mocking. Returned the exact expected cache-parent fs_path while leaving root/cache absent (`runtime/logs/check-20261110T161330960Z.log:8,18-19`).
- Same check then ran `testthat::test_dir(..., filter = "^pip_create_(globals|vintage)$")`: 13 tests, 69 passing expectations, 0 failures/errors/skips/test warnings (`runtime/logs/check-20261110T161330960Z.log:21-70`). Coverage includes the three new cases and existing creation, explicit/new vintage, invalid-input and vintage-conversion behavior. Existing vintage tests use a fixed local PPP metadata fixture instead of GitHub; only the test process temporarily substitutes a neutral `Sys.info()` user to exclude user-specific UNC outputs. Package/source files and the direct fresh-root check are not patched or mocked.
- Child settings are established before R startup and inherited by the real installer: TEMP/TMP/TMPDIR, HOME/R_USER/USERPROFILE, application/XDG homes, R libraries/profiles/history/Makevars, R/renv/pkg caches, Git config path and PIP/DLW storage all point to E:. Actual tempdir and all library roots are printed and checked on E: (`runtime/logs/check-20261110T161330960Z.log:1-8`). Dedicated installation only; existing dependency libraries were read, not installed into.
- Initial execution history is retained. `runtime/logs/baseline.log` contains an extra top-level testthat/withr deferred-cleanup error; moving test setup after baseline removed it and the clean baseline above was rerun. `runtime/logs/check-20261110T161159464Z.log` records three verification-setup failures (two legacy Windows PATH_MAX errors from long temp paths and one incomplete PPP fixture error). Short E:-local temp and a complete PPP fixture fixed the setup; no package changes followed the initial fix.
- The first legacy creation-test attempt, before test-only neutral-user substitution, consulted the two existing user-specific UNC paths in `R/pip_create_globals.R:145-151`. Read-only `Get-Item` verified that both predate this run: `//wbntpcifs/povcalnet/01.PovcalNet/` creation 2019-04-16T13:51:40Z / last-write 2023-08-17T15:03:47Z; `00.Master/02.vintage/` creation 2019-04-16T19:33:14Z / last-write 2023-06-05T15:54:17Z. `create_directories` only creates absent directories (`R/pip_create_globals.R:295-305`); no shared creation/change was observed. The final test run excludes these paths entirely.
- Final `git diff --check`: passed; Git emitted only LF-to-CRLF configuration notices. Final `git status --short --untracked-files=all` contains only the two intended modified pipfun files. `git rev-parse HEAD` remains the full starting SHA. No client settings changed.

## Immutable Revision Action

Separately authorize a commit on the existing pipfun PROD checkout containing only `R/pip_create_globals.R` and `tests/testthat/test-pip_create_globals.R`. After that commit, record its full 40-character SHA. That new SHA, not the unchanged current HEAD or this private working-tree installation, is the corrected immutable revision required by the original experiment.

The inspected pipsystem harness is on existing main at `f9454707b292a620e25abef17f2e515794020ba7`: `experiments/one-survey/setup.R:16-22` still pins the old pipfun SHA and `:78-83` archives sources from local Git objects. Once separately authorized, the experiment owner must substitute the corrected pipfun SHA in the applicable source-pin specification, retain the other package pins, and run a fresh isolated attempt without overwriting earlier evidence. No push is needed for that local Git-archive route. A remote installation would additionally require explicit push authorization. No experiment pin or Plan was changed here, and this report does not authorize that later work.

## Gaps

- There is no corrected immutable Git revision until the separately authorized two-file commit. Current HEAD still identifies the uncorrected source, despite the dirty-tree installation passing.
- The original installed-package one-survey experiment, pipaux installation, survey/storage/numerical checks, full package suite and full R CMD check were not run. This evidence establishes the bounded initialization fix, not downstream success.
- Existing vintage checks ran against a local PPP metadata fixture, not live GitHub. The non-NULL-vintage branch still unconditionally creates its output directory at `R/pip_create_globals.R:171-173`, independently of this NULL-vintage bug; it was deliberately not changed.
- Nonfatal runtime messages remain: installed data.table 1.18.4 was built under R 4.5.3 while this runtime is R 4.5.2 (`check` log:17); installation reported two existing byte-compilation notes and missing R.css because the minimal copied runtime omits doc/html (`install` log:13-21). Installation, exported initialization and all selected tests nevertheless passed. No full warning-free build is claimed.
- No OS-wide write audit or exhaustive dependency attestation was performed. Explicit E:-local settings, actual temp/library output, source inspection and the shared-directory metadata above support the observed boundary; they are not an absolute sandbox certification.

## Local Commit Checkpoint

Recorded 2026-11-10 at 15:58 ET (2026-11-10T20:58:04Z). The user separately authorized one local commit of the two reviewed files, without pushing.

### Summary

Created local commit `7d534516a8c17c33d537681610eccd4c29211762` on existing PROD with message `fix(globals): handle missing clean-survey cache`. Its parent is the original `0c6a78d9884ed0965a524311537eec2a5095d60b`. The corrected immutable local revision now exists. No push occurred.

### Changes

- Committed only `R/pip_create_globals.R` and `tests/testthat/test-pip_create_globals.R`: 2 files, 58 insertions and 7 deletions, exactly matching the earlier reviewed patch.
- Updated this pipsystem handoff separately; it is not included in the pipfun commit. All earlier report text, test evidence, failed-attempt logs and limitations are retained as history.
- No source/test edits, unrelated staging, amend, merge, branch/worktree creation, force-push or Git configuration change. Existing Git configuration was read, not modified.

### Checks run

- Reverified root `E:/PovcalNet/01.personal/wb384996/PIP/pipfun`, current branch PROD and pre-commit full SHA. Inspected complete `git diff HEAD --`, complete initial staged diff, `git status --short --untracked-files=all` and `git log --oneline -10` before staging. Initial staging was empty; only the two intended unstaged paths existed. Their complete patches were unchanged from the earlier reviewed fix/tests.
- Inspected effective identity/hook/signing/filter configuration, hook-directory contents and attributes for both paths: no active hooks or applicable filters. Verified Git metadata and E:-local temporary/home/config/cache/log ancestry, including hidden `.git`, before mutation. Git child-process TEMP/TMP/TMPDIR, HOME/USERPROFILE, application and XDG homes were directed to existing E: directories. The existing C:-local global Git config was used read-only to preserve configuration and identity; no configuration was changed.
- `git diff --check` before staging: passed, with only LF-to-CRLF configuration notices. Staged only the two named paths, then inspected the complete staged patch and exact staged path list. `git diff --cached --check`: passed; staging contained no unrelated work.
- Local commit completed successfully. `git log -1` confirmed the full SHA, exact message and parent. `git show --stat HEAD` confirmed exactly the two files. `git show --format= --check HEAD`: passed.
- Final `git branch --show-current`: PROD. Final `git status --short --untracked-files=all`: empty, meaning the pipfun index and worktree are clean with no untracked files. No push command or remote mutation was performed.
- Functional tests were not rerun for this unchanged commit-only checkpoint. The earlier working-tree installation and 13-test/69-expectation result remain the bounded functional evidence; this commit contains the same source/test patch.

### Gaps

- The earlier missing-corrected-revision gap is resolved by local SHA `7d534516a8c17c33d537681610eccd4c29211762`. This commit has not been pushed; no remote availability is claimed.
- The original experiment still requires a separately authorized update of its pipfun source pin to this full SHA and a fresh isolated run. Its local Git-archive route can use this commit without a push. No experiment pin or Plan was changed and no experiment was run here.
- The earlier functional-evidence limits remain: no full package suite or R CMD check, no downstream pipaux/survey/storage/numerical verification, local PPP fixture rather than live GitHub, nonfatal runtime warnings/notes and no OS-wide write audit. This checkpoint does not broaden those claims.
