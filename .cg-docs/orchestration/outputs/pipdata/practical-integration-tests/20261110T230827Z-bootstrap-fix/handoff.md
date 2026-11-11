---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261110T230827Z-bootstrap-fix
status: scoped-fix-verified-full-green-gate-blocked
updated: 2026-11-11T16:14:54Z
owner: Code mode pipdata bootstrap fix
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: 13a38280c1eafe7e03a97837cdb57833fbe9d926
next: No further source changes within approved scope. Full-green workflow closure requires resolving or explicitly authorizing treatment of the existing dependency/path blockers; no final bug document yet.
---

# Fresh-master bootstrap fix — handoff

## Summary
The scoped fresh-master fix is implemented and verified on the final installed candidate. Root, PROD and HEAD still match requested provenance; initially clean and now only three intended pipdata files differ. Expected-behavior source: user-requirement. The user delegated reproduction execution/confirmation to the agent, then explicitly approved the diagnosis through the question tool. Original red preceded implementation; unchanged frozen boundary replay is red on a separately installed baseline and green on the final candidate. Seven new test blocks / 19 assertions pass. Full independent review and final light verification completed with all three findings closed. Full affected suite is NOT all-green: 535 assertions pass, one assertion fails and one test errors, matching the same failure identities on the unchanged pinned baseline (516 pass, one failure, one error). No full-green completion checklist or final bug document is issued.

## Changes
- `R/pd_process_data.R`: public wrapper now uses a narrow internal master-loading helper. Only explicit bootstrap with one matching configured alias, warning-free zero versions and no surviving master storage can use empty in-memory state. Existing history/non-bootstrap retain the normal reader. Catalog/listing/read failures propagate; corruption warnings and storage contradicting absence reject bootstrap.
- `man/pd_process_data.Rd`: synchronized directly corresponding bootstrap help; no unrelated documentation build.
- New pipdata test: `tests/testthat/test-pd-process-fresh-bootstrap.R`, seven cases covering fresh public preparation entry, existing-reader delegation, non-bootstrap behavior, listing/read errors, warnings, missing alias and missing-catalog/surviving-history contradiction.
- Test uses the real exported wrapper, real pipload reader and real empty stamp repository. A passive trace observes preparation entry; no worker replacement or fabricated master. Completed-valid synthetic inventory fields use the package survey-ID parser; expected empty master and required entry derive from the user requirement, not implementation output.
- Dedicated candidate R/library, source snapshots, launcher, test scripts, review report and logs are under `runtime/` beside this report. Separate pinned baseline is under `b/`; fresh temporary/storage attempts are also under this authorized run root. No original runtime modified. No Git mutation or other-package source edit.
- No bug document created: Step 4 confirmation is still required before documentation.

## Source provenance
- Original pre-fix baseline: existing PROD at `13a38280c1eafe7e03a97837cdb57833fbe9d926`, before this task modified `R/pd_process_data.R`. Initial pre-check compared that original function body with the installed namespace and found them identical.
- R 4.5.2 and installed contributed library copied from `pipsystem/.tmp/one-survey/resume-20261110-correction1/{r,library}` into this run's `runtime/{r,library}`. Prior package pins/provenance remain in that retained run and its original handoff. This is copied installed baseline provenance, not a new candidate installation or corrected immutable source revision.
- Missing testing tools copied explicitly from `E:/PovcalNet/01.personal/wb384996/R/win-library/4.5/`: testthat 3.3.2 (Built R 4.5.2), brio, callr, pkgload, praise, processx, ps, waldo, diffobj, pkgbuild. Existing dedicated packages were not overwritten. No ambient contributed library fallback or downloads.
- Inspected R base startup profile and package hooks for pipdata/pipfun/pipload/pipaux/stamp. TEMP/TMP/TMPDIR, home, R user/site profiles, libraries, caches, logs and package roots redirected before R children. Source/destination trees checked for reparse points and hard links. Private startup audit checks library destinations and logs child starts. No exhaustive OS-write audit claimed.

### Final candidate provenance
- The first source-provenance bullet above describes the original pre-fix baseline only; source is now intentionally modified. Final candidate is an uncommitted working-tree build, NOT a corrected immutable Git revision.
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

## Gaps
- Step 2 execution/confirmation and diagnosis approval completed. The user need not run or attest to any test the agent can execute.
- Required all-green existing-test gate remains blocked by the two baseline issues above. They are not regressions from this fix, but cannot be labeled passing. Correcting pinned dependency compatibility or permitting a materially shorter runtime root would require authorization beyond the current constraints.
- No final full-green checklist or fixed-confirmation closure claimed; no `.cg-docs/solutions/bugs/` document created, as that documentation gate has not been satisfied. The source defect and scoped review findings are verified fixed; the entire requested bug-workflow arc is not complete.
- Boundary regression intentionally supplies no complete auxiliary fixture; real public bootstrap stops at the missing auxiliary catalog. This does not establish successful survey processing, and a full rerun is expressly out of scope.
- No full survey rerun, original Plan/pin updates, commits, pushes, shared/production changes or immutable corrected revision authorized/performed.

## Handoff verification
Repository state rechecked on November 11, 2026 at 11:14:54 AM EST: requested root, existing PROD branch and HEAD still match. Exactly the intended two modified files and one untracked test remain; no new source/test changes were made while finalizing this handoff. Test results above are retained evidence from the earlier execution, not newly rerun at handoff time. Delayed initial review messages are superseded by their recorded final verification; the original P0 is closed, not an outstanding blocker.

## Continuation prompt
This prompt carries context and constraints only. It does not authorize dependency/pin changes, additional environments, writes outside the existing permitted run, or other-package edits.

```text
Target Project: pipdata; E:/PovcalNet/01.personal/wb384996/PIP/pipdata
Target Environment: Existing branch PROD, existing checkout E:/PovcalNet/01.personal/wb384996/PIP/pipdata; expected HEAD 13a38280c1eafe7e03a97837cdb57833fbe9d926. No new branch or worktree authorized.
Target Agent: Code mode

Resume the fresh-master bootstrap bug workflow from this complete handoff:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix/handoff.md

Read the original package specification's Task section, not as a recursive command:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T230827Z-monitor/pipdata-next-prompt.md

First verify repository/branch/HEAD/status without switching environments.
Preserve every existing source/test change and all runtime evidence. Expected
working tree: modified R/pd_process_data.R and man/pd_process_data.Rd;
untracked tests/testthat/test-pd-process-fresh-bootstrap.R. Report mismatches.

Confirmed fix: explicit bootstrap can use empty in-memory master only after
verified absence. Existing history uses the normal reader; listing/read errors,
corruption warnings and surviving storage with missing catalog are rejected.
The installed final candidate matches the working tree. Seven new cases / 19
assertions pass; exact frozen boundary test is red on installed old baseline
and green on candidate. Full review and light final verification are complete;
all review findings, including the original P0, are closed. Do not reopen
superseded initial findings merely because their messages arrived late.

Current blockers are baseline-equivalent, not new regressions: pinned pipload's
pip_read lacks metadata_only required by test-dependency-api-contract.R:36;
test-dependency-manifest.R:10 exceeds Windows PATH_MAX under the required
long output root. Candidate: 535 passing assertions, one failure, one error;
baseline: 516 passing assertions, same failure/error identities. No skips.
The full-green gate and final bug documentation remain incomplete.

Remaining work: inspect the two baseline blockers and existing evidence,
identify any smallest permitted resolution, and distinguish safe in-scope
execution from a needed permission change. Resolve and rerun affected checks
only within actual authorization; if current constraints prevent resolution,
report the exact required exception rather than silently changing pins or
runtime location. Do not ask the user to execute or confirm tests you can run.
The user already delegated reproduction execution/confirmation and approved
the diagnosis. Preserve the remaining bug-workflow documentation gate; do not
claim all-green or create a final bug document while required checks fail.

Authorized runtime/checkpoint root:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix
Read runtime/review-report.md, runtime/logs/final-green.R.log,
runtime/logs/affected-final.R.log, b/logs/baseline-existing.R.log,
runtime/logs/real-storage-final.R.log and
runtime/logs/final-source-provenance.tsv there.
Use runtime/run.ps1 only after inspecting startup hooks and destinations;
choose a fresh task-local TempName, never reuse an existing attempt.
Baseline and candidate have separate dedicated libraries; no fallback.

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
