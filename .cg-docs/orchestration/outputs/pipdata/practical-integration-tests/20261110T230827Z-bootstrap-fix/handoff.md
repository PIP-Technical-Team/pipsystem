---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261110T230827Z-bootstrap-fix
status: complete-local-checkpoint-no-push
updated: 2026-11-11T18:53:30Z
owner: Code mode pipdata bootstrap fix
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
starting-head: 13a38280c1eafe7e03a97837cdb57833fbe9d926
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
next: Nothing pending for the requested local checkpoint. No push, further commit, survey rerun or broader package change is authorized.
---

# Fresh-master bootstrap fix — handoff

## Summary
The scoped bug-fix arc and newly authorized local checkpoint are complete. Commit `c5b27fa4458d7175aca81a203762bae81e9f0b40` on existing PROD has sole parent `13a38280c1eafe7e03a97837cdb57833fbe9d926` and message `fix(pipeline): allow fresh-master bootstrap`. It contains exactly the reviewed source, matching help, regression tests and confirmed bug document; all four matched their preserved SHA256 values before staging. Pipdata status is clean. No push occurred and no branch/worktree/configuration change or amend was performed. The earlier 109-case/539-assertion green result remains scoped to approved isolated pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5` and the approved short temporary root. Original Plan/pins, red/green evidence and retained installations remain untouched; the original ff9a81e-pinned context is NOT retroactively green and the complete survey is not certified. Tests were not rerun or represented as newly executed by the commit.

Historical investigation completed at 11:49 AM EST established that neither blocker could be resolved without an exception: same-pin reinstall cannot add the API, and permitted relative-path variants failed native publication. The two proposed exceptions below were subsequently approved and applied. Only green checks needed for the new dependency/runtime context were rerun; original red reproduction, diagnosis, implementation and closed review were not reopened. No package source or test expectation was changed during either continuation.

## Changes
- `R/pd_process_data.R`: public wrapper now uses a narrow internal master-loading helper. Only explicit bootstrap with one matching configured alias, warning-free zero versions and no surviving master storage can use empty in-memory state. Existing history/non-bootstrap retain the normal reader. Catalog/listing/read failures propagate; corruption warnings and storage contradicting absence reject bootstrap.
- `man/pd_process_data.Rd`: synchronized directly corresponding bootstrap help; no unrelated documentation build.
- New pipdata test: `tests/testthat/test-pd-process-fresh-bootstrap.R`, seven cases covering fresh public preparation entry, existing-reader delegation, non-bootstrap behavior, listing/read errors, warnings, missing alias and missing-catalog/surviving-history contradiction.
- Test uses the real exported wrapper, real pipload reader and real empty stamp repository. A passive trace observes preparation entry; no worker replacement or fabricated master. Completed-valid synthetic inventory fields use the package survey-ID parser; expected empty master and required entry derive from the user requirement, not implementation output.
- Dedicated candidate R/library, source snapshots, launcher, test scripts, review report and logs are under `runtime/` beside this report. Separate pinned baseline is under `b/`; fresh temporary/storage attempts are also under this authorized run root. No original runtime modified. Those implementation/verification phases performed no Git mutation or other-package source edit; the subsequent user-authorized pipdata-only commit is recorded below.
- After explicit fixed confirmation, created `.cg-docs/solutions/bugs/2026-11-11-fresh-master-bootstrap-boundary.md` in pipdata. No other pipdata documentation was edited and no source/test implementation changed during closure.
- Continuation added runtime-only diagnostic scripts/logs and byte-identical copies of the two blocker test files plus NAMESPACE. No new pipdata source/test modifications occurred during that continuation. The original source/help/test payload and subsequent bug document are now committed unchanged. Original test files, candidate/baseline libraries, frozen red/green evidence and completed review are preserved.
- Approved verification added fresh `v/{r,library,sources,home,config,cache,logs,store,manifest}` under this run and temporary attempts only under `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/bf-20261110/tmp`. Only the new verification library receives the approved pipload revision; original `runtime/`, `b/`, retained survey installation and original Plan/pins are not replaced.
- User-authorized checkpoint commits exactly the four intended pipdata files, with no source/content edits during commit preparation. This handoff update is separate from that pipdata commit; no sibling package source was modified or committed.

## Source provenance
- Original pre-fix baseline: existing PROD at `13a38280c1eafe7e03a97837cdb57833fbe9d926`, before this task modified `R/pd_process_data.R`. Initial pre-check compared that original function body with the installed namespace and found them identical.
- R 4.5.2 and installed contributed library copied from `pipsystem/.tmp/one-survey/resume-20261110-correction1/{r,library}` into this run's `runtime/{r,library}`. Prior package pins/provenance remain in that retained run and its original handoff. This is copied installed baseline provenance, not a new candidate installation or corrected immutable source revision.
- Missing testing tools copied explicitly from `E:/PovcalNet/01.personal/wb384996/R/win-library/4.5/`: testthat 3.3.2 (Built R 4.5.2), brio, callr, pkgload, praise, processx, ps, waldo, diffobj, pkgbuild. Existing dedicated packages were not overwritten. No ambient contributed library fallback or downloads.
- Inspected R base startup profile and package hooks for pipdata/pipfun/pipload/pipaux/stamp. TEMP/TMP/TMPDIR, home, R user/site profiles, libraries, caches, logs and package roots redirected before R children. Source/destination trees checked for reparse points and hard links. Private startup audit checks library destinations and logs child starts. No exhaustive OS-write audit claimed.

### Final candidate provenance
- The first source-provenance bullet above describes the original pre-fix baseline only. At test execution, the final installed candidate was an uncommitted working-tree build. Its reviewed payload is now recorded in local commit `c5b27fa4458d7175aca81a203762bae81e9f0b40`; no new package build/test execution from the commit itself is claimed.
- Final package snapshot: `runtime/final-source/pipdata`; per-file SHA256 pairs against working tree: `runtime/logs/final-source-provenance.tsv`. Initial candidate snapshot/hash report retained separately.
- Final `R CMD INSTALL --no-multiarch --with-keep.source` uses only the task-local library; `runtime/logs/install-final.R.log` records successful installation. `runtime/logs/final-green.R.log:1-4` verifies installed wrapper/helper executable bodies against current working tree. Rd parse succeeds at line 39.
- Independently installed old baseline: `b/library/pipdata`, copied from retained pinned baseline with separately copied tools and R. Its wrapper body matched the retained old source (`b/logs/baseline-existing.R.log:1-4`). No candidate-library fallback.
- Candidate and baseline startup logs confirm only their own contributed library plus their own R base library. Temporary directories are now fresh per attempt directly under the authorized run, shortening paths while preserving E-only physical destinations. Launcher checks actual destination ancestors before child startup rather than recursively traversing unrelated retained Windows-long-path artifacts.

## Checks run — earlier checkpoints retained
- Initial root/branch/HEAD and clean status: PASS.
- Existing `test-pd_process_data.R`: 31 assertions passing; `runtime/logs/precheck.R.log`, serialized results `runtime/logs/precheck-results.rds`. These tests use different inputs/master substitutions, not the triggering absent history.
- Red regression: `fresh bootstrap reaches preparation with genuinely empty master`: 2 assertions passing, 2 failing, zero test errors. Both failures carry `No version files found in 'pip_master_inventory.qs2'`; preparation was not entered. `runtime/logs/red.R.log:15-37`, serialized results `runtime/logs/red-results.rds`.
- Empty master-version catalog checked before and after the public call; both checks pass.
- Fixture development initially exposed mismatched survey fields and slash-normalization mismatch; corrected before recording the genuine symptom failure. Those failures are not used as red proof. Initial missing-testthat and PowerShell native-stderr handling issues were resolved in this run's launcher/library only.
- `runtime/red.R` intentionally exits successfully only if the test result contains exactly two failures and no errors. Test failures are visible in the testthat transcript; successful launcher exit does NOT mean the regression passed.
- At the earlier pre-fix checkpoint, only the new test was untracked and source was unchanged. `git diff --check` passed (does not inspect untracked content). This is historical state, not the final three-file working tree described above.
- Direct reproduction rerun after the user's instruction: same two assertion failures, zero test errors, unchanged source/HEAD. The user is not being asked to execute or attest to tests the agent can run.
- Diagnostic run `runtime/diagnose.R` reuses the actual retained completed-valid row from `validation-result.rds`, creates a new isolated master store, and passively traces the real public call. `runtime/logs/diagnose.R.log:12-21`: one valid row, one exact matching alias, zero master versions before/after, zero catalog warnings, master reader entered, preparation not entered, exact reported error, native QS2 roundtrip PASS. Serialized evidence: `runtime/logs/diagnosis-evidence.rds`.

## Diagnosis — approved and implemented after these observations
- Root cause: `R/pd_process_data.R:114` unconditionally invokes `load_pip_master_inventory()` before `pd_prepare_execution(..., bootstrap = bootstrap)` at lines 115-120. The pinned pipload reader intentionally rejects zero versions, so the wrapper's explicit bootstrap permission cannot take effect.
- Considered six possible sources: invalid completed inventory (ruled out by real normalization), wrong alias/root (one exact match), installed/source drift (baseline body comparison and unchanged HEAD), native QS2 failure (real roundtrip passes), unreadable/corrupt history (warning-free empty catalog in this reproduction), and wrapper/preparation ordering (supported by trace and source).
- Test gap classification: `integration-gap` — unit tests supply in-memory masters and miss the real reader/bootstrap interaction.
- Proposed minimal correction: only for explicit bootstrap, establish trustworthy absence at the configured master root before using empty in-memory state. Keep the normal reader for existing history and non-bootstrap calls. Propagate read/listing errors and treat catalog corruption warnings as failures, not absence. No populated master creation or worker bypass.
- Pinned stamp `R/version_store.R:288-299` can warn while dropping corrupt rows and return zero rows. A bare `nrow(st_versions(...)) == 0` is therefore insufficient evidence of trustworthy absence. Pinned pipload `R/pip_read-write.R:92-97` intentionally throws on empty history; changing that package is unnecessary and outside scope.

## Final checks and red/green evidence
- **Original red before source edits:** actual installed pinned wrapper, exact missing-version symptom; `runtime/logs/red.R.log`. The original one-test run is not an all-red execution of the later expanded suite.
- **Frozen final boundary replay:** `runtime/frozen-boundary-test.R`, SHA256 `385ab06c66fd6c3b557a6e4b51045c6b18c464a3a04c15ff374bdf248af6d772`. Separate installed baseline gives two symptom failures (`b/logs/frozen-red.R.log`); unchanged final candidate test gives seven passing assertions (`runtime/logs/final-green.R.log:35-38`).
- **Review-found P0 red/green:** actual saved EMPTY master with its catalog moved aside exposes the invalid empty-state fallback on v1 (`runtime/logs/review-red.R.log:14-34`). Added surviving-storage rejection; final installed regression passes three assertions (`runtime/logs/final-green.R.log:19-34`). No populated master fabricated and no storage repair/reconstruction.
- **Final new test file:** seven test blocks, 19 assertions passing, zero failures/errors. Fixture restores pipfun state, stamp aliases/state and passive observer trace/options.
- **Real storage:** final installed public wrapper with the actual retained completed-valid row reaches `pipdata_dependency_aux_missing` rather than missing master; actual saved EMPTY master reads through normal reader; corrupt version-row warning rejected with parent retained; malformed catalog raises its real error. `runtime/logs/real-storage-final.R.log:1-8`, serialized evidence `runtime/logs/real-storage-evidence.rds`. This is boundary evidence, NOT full processing acceptance.
- **Affected suite:** 109 test blocks, 535 assertions pass, 1 assertion fails, 1 test errors, 0 skips. `runtime/logs/affected-final.R.log`, `runtime/logs/affected-final-results.rds`. Same failure/error identities as separately installed old baseline: 102 blocks, 516 assertions pass, 1 assertion fails, 1 test errors (`b/logs/baseline-existing.R.log`, `b/logs/baseline-results.rds`). Thus zero new regressions, but not all-green. No expectation weakened or test skipped.
- API-contract failure: `tests/testthat/test-dependency-api-contract.R:36` requires `metadata_only`, absent from pinned `pipload::pip_read()` formals. Unchanged before/after this fix; no dependency pin or other-package change made.
- Environment error: `tests/testthat/test-dependency-manifest.R:10`, Windows `fs::path()` PATH_MAX 260 in the required long run root. Shorter per-attempt temporary paths resolved a second lease-recovery path error; the immutable-manifest path error remains on both baseline and candidate.
- Full independent review completed ten roles, followed by scoped P0 closure from data-quality reviewer and light code-quality/testing `mode:verify`. P0 surviving storage, P2 bootstrap documentation and P3 exact red-source preservation are all closed; no supported open review findings. Report: `runtime/review-report.md`.
- Final root/branch/HEAD verified unchanged; only source/help/test listed above differ. `git diff --check` passes. No commit/push/merge, production/shared changes, original Plan/pin changes, downloads or full survey rerun.

## Runtime setup limitations encountered
- Copying a deeper baseline with PowerShell 5.1 hit long paths in static dependency assets. That partial `runtime/baseline` attempt is retained but is NOT used as baseline evidence. Successful separate baseline `b/` was copied with installed long-path-capable Robocopy; retained copy logs record completion.
- Temporary-root attempts that hit Windows long-path cleanup/enumeration limits are retained under the run. An initial real-storage attempt used the Windows reserved folder name `aux`; corrected to `store-aux` before successful checks. These are launcher/fixture issues, not additional package fixes or qualifying red proofs.
- One candidate test launch timed out while recursively enumerating retained test artifacts, before recording suite output; successful replacement used actual-destination ancestor checks and the tracked monitor. No timeout result is counted as a passing check.

## Baseline-blocker investigation — completed continuation

### Pinned producer API
- Retained source pin: pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6`, recorded in `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/resume-20261110-correction1/pins.tsv:4`. Its `sources/pipload/R/pip_read-write.R:48-54` has only `id, format, version, alias, verbose`, neither `metadata_only` nor `...`.
- New runtime check parsed that exact retained function definition without executing it, then compared formals and executable body with loaded `pipload::pip_read()`: both identical. `runtime/logs/blocker-focused-child.log:19-20`. This is not a stale-install mismatch and has no same-pin reinstall remedy.
- The contract is substantive, not a loose test expectation: `pipdata/R/code_fingerprint.R:145-163` checks capability; `R/dependency_execution.R:176-183` uses exact-version `metadata_only = TRUE`; `.cg-docs/plans/2026-10-26-m2-pipdata-authority.md:378-384` requires that behavior. No capability check or test assertion was weakened.
- The M2 Plan names delivered producer revision `4ef0d90a974cb6ff0725da69373bde421dd04ad5`. Main-session read-only Git checks confirmed the local commit object exists and its `R/pip_read-write.R` blob is `5daa56b1cf2a40db3f373b1f692d13e479a95018`. `git show` of that exact immutable object confirms `metadata_only = FALSE`, exact-character-pin validation, and direct `stamp::st_read_sidecar(..., version_id = version)` return before payload loading.
- **Do not build from the named adapter worktree as a substitute for that commit.** Its current reader hashes to `b85be3ac068fd5b222526a6b0aeb291a13bedd16`, not the committed blob above. That worktree was read only; its unrelated changes were preserved. Any authorized candidate export must use the exact immutable Git revision, not current worktree contents.
- The proposed revision is a code-level candidate only, not installed compatibility certification. Its broader loader changes and interaction with the retained stamp build still need testing after authorization. No archive export, installation, library replacement, download or pin-file edit was performed during this continuation.

### Windows path limit and permitted runtime experiments
- Authorized run prefix is 145 characters. An ordinary generated immutable-manifest path is 271 characters, exceeding fs's 260-character PATH_MAX. The extended Windows prefix does not bypass that fs guard. Evidence: `runtime/logs/blocker-path-absolute.log:7-32`.
- Relative TMPDIR is supported by this R build, but it is sensitive to working-directory changes. The first syntax probe intentionally recorded this limitation; it is not functional success. Fixed-cwd follow-up children stayed physically inside the original authorized run, with temp/home/cache/log settings inherited before startup and only the existing dedicated candidate/R libraries (`runtime/logs/child-startup.log:33-39`). No drive mapping, junction, short-name creation or Windows policy change was attempted.
- Focused test copies and NAMESPACE are byte-identical to originals: `runtime/logs/blocker-focused-copy-provenance.tsv`. Executed files were limited to the API-contract and manifest tests; completed bootstrap reproduction/review were not rerun. Fixed nested-cwd attempt: 16 blocks, 82 assertions passing, 1 API assertion failure, 3 manifest native-path errors, 0 skips. These extra experiment errors are not new source regressions and do not replace the authoritative 535/1/1 affected-suite evidence. `runtime/logs/blocker-focused-child.log:31-120`.
- A final manifest-only check used the shallowest authorized cwd (the run root), unchanged test SHA256 `7f42b74712b4910cbea567c5fb101fd143219a78b8e751a54a9f9d47cc6192ba`, and relative temp paths. This bypassed fs's lexical length guard but still failed native `file.rename()` for the long immutable final filename. Result: 10 blocks, 27 assertions passing, 0 assertion failures, 1 test error, 0 skips. `runtime/logs/blocker-manifest-flat-child.log:1-43`; serialized results `runtime/logs/blocker-manifest-flat-results.rds`.
- Diagnostic launchers exit successfully when evidence capture completes; their zero exit does NOT mean tests passed. All original test expectations remain unchanged. Relative-path variants are retained failed experiments, not an adopted resolution or permission to move the runtime.

### Verification exceptions — proposed at 11:49 AM and approved at 12:39 PM EST
1. **Temporary files only:** permit a new dedicated temporary root at `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/bf-20261110/tmp` for R TEMP/TMP/TMPDIR and test fixtures. This 68-character root was absent at the inspection. It has not been created. Keep library, home, caches, logs, checkpoint and retained evidence in the existing authorized run; inspect the new physical destination before any child writes. No Windows/global policy or drive changes. Rerun the original manifest test unchanged after authorization; shorter path length is a proposed remedy, not yet a demonstrated green result.
2. **Test-only dependency revision:** permit exporting exact local pipload commit `4ef0d90a974cb6ff0725da69373bde421dd04ad5` and evaluating it in a new isolated verification library under the existing run, keeping other dependency pins unchanged. Preserve original survey Plan/pin files, retained installation and existing baseline/candidate evidence. Record the distinct verification revision and source hashes separately. Do not edit pipload source, use the changed adapter worktree, download, or use library fallback. Any green result applies to this explicitly different verification dependency context, not proof that the original ff9a81e-pinned context passes.

The numbered proposal above is retained as historical approval scope. The user's exact subsequent reply was `approve both verification exceptions`; those directories and the revised verification dependency are now created within that authorization. These exceptions do not authorize a full survey rerun, commits/pushes/merges, other-package source changes, original Plan/pin changes, or automatic workflow completion. No check was waived.

## Approved verification — green results

### Preparation and source provenance
- New isolated context: `v/` under this run. R and every dependency except pipload were copied from the existing candidate runtime. Installer comparison confirms 123 other packages retain their versions and R-code hashes: `v/logs/unchanged-dependencies.tsv`, `v/logs/install.R.log:26-29`. This comparison covers installed R-code databases (or DESCRIPTION for packages without one), not a claim of exhaustive hashing of all documentation/native assets. Robocopy logs record the raw-tree copy.
- Actual export comes from immutable Git commit `4ef0d90a974cb6ff0725da69373bde421dd04ad5`, NOT the differing adapter worktree. Selected package source inputs: DESCRIPTION, NAMESPACE, LICENSE, .Rbuildignore, R, man, tests. All 107 exported file contents match their committed Git blob IDs: `v/logs/pipload-source-provenance.tsv` and `v/logs/export.R.log:2-4`.
- Archive: `v/sources/pipload-4ef0d90.tar`, SHA256 `901da2165a44d9511553a73650c7c831999f5b86fd2862af92053931f4d444d7`. Package source extraction is `v/sources/pipload`.
- Installed only into `v/library/pipload` with `R CMD INSTALL --no-multiarch --with-keep.source`; successful load from staged and final locations. Installed `pip_read` formals/executable body match the immutable export. Machine-readable distinct context and revisions: `v/logs/verification-context.rds`.
- Before child execution, inspected candidate startup hook and copied base startup audit; redirected temp/home/R/cache/log paths. `v/logs/child-startup.log` confirms only `v/library` plus `v/r/library`, with installation staging under that same dedicated library. No user/site contributed-library fallback or downloads.
- Approved TEMP/TMP/TMPDIR attempts are `.../.tmp/bf-20261110/tmp/{export,install,blockers,affected}`. Home/cache/config/log and persistent evidence remain under `v/` within the original authorized run. No junction, mapping or Windows policy change.

### Checks run in approved context
- **Unchanged original blocker files:** `v/check-blockers.R` executes `test-dependency-api-contract.R` and `test-dependency-manifest.R` from the actual pipdata checkout, not modified copies. Result: 16 blocks, 89 passing assertions, 0 failures/errors/skips. `v/logs/check-blockers.R.log:1-43`; data `v/logs/blockers-results.rds`.
- **Functional producer check:** real two-version storage writes with literal unit metadata `old` and `new`; metadata-only exact-version reads return the respective values, and mutable selector `latest` is rejected. `v/logs/check-blockers.R.log:44-45`; data `v/logs/metadata-functional-check.rds`. No master populated and no processing worker bypass.
- **Full affected suite:** same original filter `^(dependency-|pd_process_data$|pipdata_dlw_process$|pd-process-fresh-bootstrap$)`. Result: **109 blocks / 539 assertions passing, 0 failures, 0 errors, 0 skips**. Existing: 102 blocks / 520 assertions; new bootstrap/control tests: 7 blocks / 19 assertions. `v/logs/check-affected.R.log:35-42`; data `v/logs/affected-results.rds`.
- Installed pipdata wrapper/helper still match unchanged working-tree executable bodies; source and corresponding help SHA256 match the original final candidate snapshot. Executed test files are hashed before and after and unchanged: `v/logs/executed-test-provenance.tsv`. `git diff --check` passes; root/PROD/HEAD and the same three intended changes verified after testing.
- Original ff9a81e context and its 535-pass/1-failure/1-error record are retained unchanged. Green approval applies only to the explicitly different verification dependency context. No original survey pin file was edited and no production/survey compatibility claim is made.
- Package installation emitted a help CSS-copy warning (`v/logs/install.R.log:15-19`) but completed and loaded successfully. Help styling is not verified. PowerShell's NativeCommandError wrappers around R stderr trace/progress messages are not test failures; authoritative R exit and test summaries are recorded separately.

### Red-green gate evidence
1. Red phase: confirmed at Step 2 -- `fresh bootstrap reaches preparation with genuinely empty master` failed before source changes. Original and frozen baseline transcripts remain preserved; no new red reproduction was required.
2. Failure corresponds to reported symptom: exact absent `pip_master_inventory.qs2` version error before bootstrap preparation.
3. Implementation modified after the failing test was established; no subsequent source modification during verification exceptions.
4. Green phase: that same behavior and all seven new cases pass on the installed unchanged candidate in the approved context.
5. Existing tests: 102 passing cases / 520 assertions, zero regressions; full affected suite 539 assertions green as above.
6. No flawed tests to repair: gap is integration-gap, all old expectations preserved.

All executable checks required for this scoped gate are green in the approved verification context. The user subsequently supplied the separate `confirmed fixed` reply; approval of verification exceptions was not substituted for that confirmation. The bug document and its Lessons Learned were written only after the reply.

## Confirmed documentation
- User confirmation received November 11, 2026 at 1:35 PM EST: `confirmed fixed`.
- New document: `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/solutions/bugs/2026-11-11-fresh-master-bootstrap-boundary.md`.
- Required bug schema records severity P2 (first-run error handling), R, user-requirement, integration-gap and all three confirmation flags as quoted `yes`. It preserves the original symptom, source-before-test distinction, red/green proof, reviewed history guard, approved verification provenance and original-context limits.
- Documented facts use retained evidence; no completed tests, reproduction, diagnosis, implementation or review were repeated during documentation. No Brain/wiki/roadmap/Plan/pin update or automatic team-wide compound capture.
- Documentation/evidence audit passed: all required YAML fields and three quoted-yes flags, eight sections, three link targets, preserved frozen red/green hash/results, both verification revisions, and recorded 109-case/539-assertion totals. No test execution repeated. `v/logs/check-documentation.R.log:1-8`; machine-readable record `v/logs/documentation-validation.rds`.
- Bug document SHA256: `1ca1f835ff449345e8c7ce91def1d4b7eae1821e8ca2aca656650da0ccc27054`. At documentation closure, `git diff --check` passed with two modified source/help files, untracked regression and bug documents, and unchanged starting HEAD. Those exact four payloads are now in the authorized local checkpoint; their pre-commit wording is retained as historical evidence, not a claim that they remain uncommitted.

## Authorized local checkpoint
- User explicitly requested one focused local commit, no push, with starting root/PROD/HEAD verification and preservation of unrelated work. Initial status contained only the four intended paths; index was empty and no unrelated changes were found.
- Before staging, inspected full tracked diff, both complete new files, index/status and ten recent commit messages. SHA256 checks matched all four files to reviewed/validated evidence: source/help to `runtime/logs/final-source-provenance.tsv`, regression to `v/logs/executed-test-provenance.tsv`, and bug document to `v/logs/check-documentation.R.log`.
- Git hook directory contained samples only, signing was already disabled, and selected paths had no clean/LFS or working-tree encoding filters. No Git configuration was changed. Repository metadata/object/log destinations were verified on E: and process-local TEMP/TMP/TMPDIR pointed to the approved E: temporary root for staging/commit.
- Staged only the explicit four paths. Staged name list/stat/check passed; no unstaged changes to them and starting HEAD still matched. One ordinary commit was created, without amend or hook bypass.
- Commit: `c5b27fa4458d7175aca81a203762bae81e9f0b40`.
- Message: `fix(pipeline): allow fresh-master bootstrap`.
- Parent: `13a38280c1eafe7e03a97837cdb57833fbe9d926`.
- Commit time: November 11, 2026 at 1:52:58 PM EST. Post-commit check: 1:53:30 PM EST.
- Exact committed files: `R/pd_process_data.R`, `man/pd_process_data.Rd`, `tests/testthat/test-pd-process-fresh-bootstrap.R`, `.cg-docs/solutions/bugs/2026-11-11-fresh-master-bootstrap-boundary.md`. Stat: four files, 429 insertions, three deletions.
- Verified full SHA, exact parent and file list using `git rev-parse`, `git show` and `git diff-tree`. `git show --format= --check HEAD` passed. `git status --short --untracked-files=all` was empty. Branch remained PROD. No push, remote update, branch switch, worktree creation or Git configuration edit was performed.
- The 539 assertions were previously run against the approved isolated pipload revision and short temporary root, not rerun for this checkpoint. All four current file hashes matched their recorded reviewed payloads. This commit does not certify the original ff9a81e-pinned context or full survey; original Plan/pins and prior evidence remain unchanged.

## Gaps
- Step 2 execution/confirmation and diagnosis approval completed. The user need not run or attest to any test the agent can execute.
- No verification blocker remains in the approved context. The original survey-pin context still has its recorded baseline issues and was not changed or reclassified. Passing tests with pipload 4ef0d90 do not certify the original Plan's ff9a81e dependency or the full survey.
- User fixed confirmation, bug documentation and documentation/evidence validation are complete. No implementation, verification or documentation blocker remains within this scoped task.
- Boundary regression intentionally supplies no complete auxiliary fixture; real public bootstrap stops at the missing auxiliary catalog. This does not establish successful survey processing, and a full rerun is expressly out of scope.
- No full survey rerun, original Plan/pin updates, push, merge or shared/production deployment was performed. Only the separately authorized local checkpoint above was created; no further Git mutation is authorized.
- Installation help-CSS copy warning retained; package load and functional/test checks pass, but help styling is not verified. No unrelated package-doc fix was added.

## Handoff verification
Repository state rechecked on November 11, 2026 at 11:14:54 AM EST: requested root, existing PROD branch and HEAD still match. Exactly the intended two modified files and one untracked test remain; no new source/test changes were made while finalizing this handoff. Test results above are retained evidence from the earlier execution, not newly rerun at handoff time. Delayed initial review messages are superseded by their recorded final verification; the original P0 is closed, not an outstanding blocker.

Continuation recheck on November 11, 2026 at 11:49:41 AM EST confirmed the same root, PROD, HEAD and three intended changes. `git diff --check` still passes. New focused tests and failed runtime alternatives are explicitly separated above from preserved bootstrap red/green evidence and earlier full-suite counts.

Approved verification recheck on November 11, 2026 at 12:50:49 PM EST confirmed root, PROD, HEAD and the same three intended changes; `git diff --check` passed. New context is all-green as recorded above; no source/test expectation or original Plan/pin changes were made.

Documentation recheck on November 11, 2026 at 1:35:24 PM EST confirmed the same repository root, PROD and HEAD before creating the bug document. Only that new document is added to the previously preserved source/help/test changes; all old evidence remains intact.

Final closure check on November 11, 2026 at 1:42:31 PM EST verified HEAD unchanged, exactly those four intended paths in pipdata and a passing `git diff --check`. The documentation audit passed without repeating completed tests. Task closed with the nonempty scope/compatibility/help-styling Gaps above retained.

Local-checkpoint check on November 11, 2026 at 1:53:30 PM EST verified the requested starting HEAD is the new commit's exact parent, the four intended files are the complete commit scope, PROD is unchanged, committed whitespace checks pass and pipdata is clean. No push was performed. This handoff records the actual SHA without changing historical verification evidence or the original Plan/pins.

## Continuation prompt
This prompt is an archived closure context, not a new assignment. The scoped task and documentation validation are complete. It authorizes no further dependency changes, environments, runtime boundary changes, other-package edits or phase restarts.

```text
Target Project: pipdata; E:/PovcalNet/01.personal/wb384996/PIP/pipdata
Target Environment: Existing branch PROD, existing checkout E:/PovcalNet/01.personal/wb384996/PIP/pipdata; current local checkpoint c5b27fa4458d7175aca81a203762bae81e9f0b40 with starting parent 13a38280c1eafe7e03a97837cdb57833fbe9d926. No new branch or worktree authorized.
Target Agent: Code mode

Read-only closure record for the completed fresh-master bootstrap task:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix/handoff.md

Read the original package specification's Task section, not as a recursive command:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T230827Z-monitor/pipdata-next-prompt.md

Read-only checkpoint checks may verify root/PROD/current HEAD/status without
switching environments. User-authorized commit c5b27fa4458d7175aca81a203762bae81e9f0b40
contains exactly the source/help/test/bug-document payload, message
"fix(pipeline): allow fresh-master bootstrap", parent 13a38280c1eafe7e03a97837cdb57833fbe9d926.
Pipdata was clean afterward; no push occurred. Preserve all evidence and any
subsequent user work; report mismatches rather than reverting it. The bug
document's pre-commit wording is historical. No further commit/amend/push is
authorized by this closure record.

Confirmed fix: explicit bootstrap can use empty in-memory master only after
verified absence. Existing history uses the normal reader; listing/read errors,
corruption warnings and surviving storage with missing catalog are rejected.
The installed final candidate matched the subsequently committed payload. Seven new cases / 19
assertions pass; exact frozen boundary test is red on installed old baseline
and green on candidate. Full review and light final verification are complete;
all review findings, including the original P0, are closed. Do not reopen
superseded initial findings merely because their messages arrived late.

Both verification exceptions were explicitly approved and applied; do not
re-ask that approval or repeat completed investigation/review. Separate v/
context uses exact immutable pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5
and approved temporary root
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/bf-20261110/tmp.
The other 123 copied packages retain versions/R-code hashes. Original survey
Plan/pins and old libraries remain unchanged. Do not use the adapter worktree
whose reader differs from the immutable revision. No downloads/fallback.

Verification is green: unchanged blocker files, 16 blocks / 89 assertions; full
affected suite, 109 blocks / 539 assertions, zero failures/errors/skips, including
102 existing cases / 520 assertions and 7 new cases / 19 assertions. Real exact-version
metadata reads pass. Evidence v/logs/check-blockers.R.log,
v/logs/check-affected.R.log, v/logs/verification-context.rds and provenance
TSVs. Original 535-pass/1-failure/1-error context is retained, not retroactively
green. Package help CSS-copy warning is retained as nonfunctional gap.

The user supplied "confirmed fixed"; the bug document is written with the
original schema, user-requirement source and integration-gap classification.
Its schema, links, preserved red/green evidence and recorded result counts
passed validation; see v/logs/check-documentation.R.log. The scoped task is
closed and the separately authorized local checkpoint is created. Do not rerun
completed tests/reviews, automatically run cg-compound, update other .cg-docs
artifacts, create another commit, amend, push, or run the survey. No further
confirmation, new session or phase restart is required. Any future survey
execution or original-pin compatibility change is a separate authorized task,
not completion work hidden in this handoff. Retain all nonempty Gaps.

Authorized runtime/checkpoint root:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix
Read preserved runtime/review-report.md and red/green evidence alongside
current v/logs/verification-context.rds, v/logs/pipload-source-provenance.tsv,
v/logs/check-blockers.R.log and v/logs/check-affected.R.log. New v/run.ps1
enforces approved short temporary attempts and dedicated v/library+v/r/library;
never reuse an attempt or fall back to ambient contributed libraries.

All direct and indirect writes must remain on E:, physically under authorized
destinations. Redirect temp, home, R profiles/libraries, caches and logs before
children. Do not download, edit other packages, modify original Plan/pins,
change production/shared systems, commit/push/merge, create Git environments,
fabricate populated masters, bypass public workers, or run the full survey.
Do not modify other .cg-docs documents. Keep updating this required handoff
with truthful Summary, Changes, Checks run, nonempty Gaps, provenance and
red/green evidence. Source/test edits must stay within pipdata.

Minimal first: smallest complete fix; safeguards only for almost-irreversible
failures; one functional check per change; installed tools; dependencies only
when worthwhile; plans about two pages. Show human times in local ET using
the system clock; retain UTC in machine-readable evidence.
```
