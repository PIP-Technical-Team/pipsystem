---
schema: pip-handoff-v2
project: pipfun
task: practical-integration-tests
run: 20261110T174526Z-testing-review
status: completed
updated: 2026-11-10T17:47:28Z
owner: independent-testing-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipfun
branch: PROD
head: 0c6a78d9884ed0965a524311537eec2a5095d60b
plan: NONE
next: Review delivered; package owner may triage findings under separately authorized follow-up. No execution scheduled.
---

# Independent cache-fix testing review

## Summary
Independent static review completed. No new functional defect was established in the bounded NULL-vintage cache fix. The retained actual logs support the direct installed fresh-root behavior and 13 selected tests / 69 passing expectations, not full-suite or downstream integration success. Three P2 findings below distinguish a historical provenance gap from inherited test/functional defects. No P0 or P1 finding established.

Evidence abbreviations: `pkg/` = E:/PovcalNet/01.personal/wb384996/PIP/pipfun/; `run/` = E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipfun/practical-integration-tests/20261110T152620Z-cache-fix/. All cited lines were read from the current retained files; scripts were edited between earlier attempts, so their current contents are not proof of their exact historical contents.

## Findings

**[P2]** `run/run-checks.ps1:59-62` -- Exact dirty-tree installation provenance is not retained or tested.
**Issue**: Installation reads the live checkout rather than a captured revision/source snapshot. The install log identifies only pipfun 1.0.1 (`run/runtime/logs/install-20261110T161144998Z.log:9-25`); the successful check verifies the namespace directory (`run/checks.R:30-35`) and records its path/version (`run/runtime/logs/check-20261110T161330960Z.log:8,92`), but neither ties the installed source bytes and test bytes to a retained dirty diff/hash. There is no control that changes source after installation and demonstrates that stale installed/source provenance is detected. Therefore the historical tested dirty tree cannot be independently reconstructed from these logs alone. This is an evidence gap, not evidence that the wrong package ran: the direct functional pass is real retained evidence. The handoff correctly acknowledges that HEAD still denotes uncorrected source (`run/handoff.md:43,59`).
**Fix**: For the already proposed immutable-SHA experiment, install from the resulting commit's Git archive and retain the source receipt and that run's scripts. If dirty-tree verification is repeated instead, retain the exact two-file diff or source snapshot plus its identity beside the install/check logs; a minimal stale-source control can show that the claimed identity is actually checked. This is proposed verification work, not a new mandatory provenance framework or authorization to commit/run anything. Current review-time blob IDs below cannot retroactively attest the earlier installation.

**[P2]** `pkg/tests/testthat/test-pip_create_globals.R:58-75` -- Broader green results require out-of-package test setup.
**Issue**: The legacy creation tests call real vintage processing without a local PPP mock. `pkg/R/pip_create_vintage.R:103-110` reaches `load_from_gh()` before validating those vintage values, while `pkg/tests/testthat/test-pip_create_vintage.R:9-21,245-254` expects a hard-coded PPP table. Merely declaring `ppp_v` in the test is not mocking that I/O. The retained check supplies the needed mock only in `run/checks.R:39-54`; it also replaces base `Sys.info()` to avoid the authorized-user UNC branches (`pkg/R/pip_create_globals.R:145-157`). Thus the 13-test green result is valid under this wrapper, but the committed package tests themselves are not self-contained/offline and do not carry that isolation. Existing creation tests use fixed temp names without scoped cleanup (`pkg/tests/testthat/test-pip_create_globals.R:59,83-85`), so reruns may additionally inherit prior fixtures. These are inherited defects, not introduced by the new three tests.
**Fix**: In a separately scoped test correction, retain the small PPP fixture and scoped boundary mock in package tests, use scoped unique temporary roots, and isolate the user-specific legacy paths in the creation tests themselves. Verify the selected files independently and offline, without relying on this external wrapper. The mock is currently at the actual network boundary; no mock-target drift was found in this path.

**[P2]** `pkg/R/pip_create_globals.R:171-173` -- Non-NULL vintage still violates the documented noncreating contract, and selected tests do not assert it.
**Issue**: `OUT_DIR_PC` is piped unconditionally to `fs::dir_create()` even with `create_dir = FALSE`, contrary to `pkg/R/pip_create_globals.R:14-17`. This can create an output tree before subsequent vintage validation fails. The new no-write cases all use `vintage = NULL` (`pkg/tests/testthat/test-pip_create_globals.R:14-17,34-37,49-52`); existing non-NULL cases use `create_dir = TRUE` (`:64,71,87-90`). The 69-pass result therefore must not be generalized to all noncreating initialization. This is an inherited, already disclosed limitation (`run/handoff.md:61`), not a regression or a reason by itself to reject the explicitly bounded NULL-vintage fix.
**Fix**: Track a separate correction to gate output creation and make noncreating vintage lookup work without an existing output directory; add one fresh-root, non-NULL-vintage no-write behavior check using local PPP metadata. Do not just remove `dir_create()`: the later enumeration at `pkg/R/pip_create_globals.R:196-197` also assumes the directory exists. No scope expansion or package change was made here.

## Changes
Only this requested report created/finalized. No package edits, generated-script/log edits, staging, commits, branches, pushes, tests, R startup or pipeline execution performed. No new dependencies or safeguards added.

## Checks run
- Read project charter, SYSTEM_DESIGN, HARVEST_BRIEF and pip-handoff-v2 contract; loaded R testing guidance before reading R tests.
- Read-only Git in pipfun: HEAD and branch match requested base/existing PROD; status contains only modified `R/pip_create_globals.R` and `tests/testthat/test-pip_create_globals.R`. Diff is 8 additions / 7 removals in production source and 50 added test lines. `git diff --check` passed with LF-to-CRLF notices only. Rechecked status/HEAD; no package changes made by this review.
- Repositories actually read: pipfun HEAD `0c6a78d9884ed0965a524311537eec2a5095d60b` (dirty, PROD); pipsystem HEAD `f9454707b292a620e25abef17f2e515794020ba7` (main). No other package repository read. Reading historical pin strings in pipsystem is not inspection of those repositories.
- Read-only `git hash-object` of currently reviewed tracked working-copy files: `R/pip_create_globals.R` = `074edd712fb2682a76d284a2b2809fc2e27c9052`; `tests/testthat/test-pip_create_globals.R` = `dda1e7066823cb7518c90e9a48e9c314d0b7ebd3`. These are Git blob identities at review time, not an immutable corrected commit or a historical install receipt.
- Inspected both changed files, relevant vintage implementation/tests, DESCRIPTION, the prior handoff, `checks.R`, `run-checks.ps1`, and every retained log in that run's runtime/logs directory. Also inspected pipsystem `experiments/one-survey/setup.R`; it still pins old pipfun at lines 16-22 and archives Git objects at lines 78-83. Its existing stale/incomplete receipt controls at lines 194-208 do not test a dirty working-tree source mismatch.
- Actual retained baseline: `run/runtime/logs/baseline-20261110T161138117Z.log:8-10` loads the earlier installation, reproduces ENOENT, and reports root/cache absent. Its source SHA is inherited from the earlier experiment, not printed by this baseline log.
- Actual retained successful install: `run/runtime/logs/install-20261110T161144998Z.log:9-25` reaches DONE; byte-compilation notes and missing copied-runtime R.css warning remain at lines 13-21. No claim of warning-free R CMD check.
- Actual retained successful check: `run/runtime/logs/check-20261110T161330960Z.log:18-19` records the direct installed fresh-root pass and both paths absent. Lines 27-70 identify all 13 tests, zero failures/errors/skips/test warnings and 69 passing expectations. The three new tests account for 10 + 3 + 3 = 16. The external data.table built-version warning at lines 9-17 is not counted as a test warning.
- Earlier failures were not hidden: `run/runtime/logs/baseline.log:20-21` contains the deferred-cleanup error; `run/runtime/logs/check-20261110T161159464Z.log:24-52` contains two PATH_MAX errors and an incomplete PPP fixture error. The later passing log supports recovery under a shorter temp path and revised setup, not success of the initial attempts. The old log references script lines differing from current script lines, corroborating that retained scripts represent final rather than per-attempt contents.
- Source inspection supports the intended absent/empty/populated NULL-vintage branches and preservation of lexical greatest-basename selection. The three new tests are behavior-oriented and their absent-cache case would detect the original unconditional-enumeration failure. No need for a whole-package coverage campaign was inferred for this small change.
- All review writes were made through apply_patch to this E: report only; read-only Git and clock commands were used, no child runtime/test processes launched. One clock command used unsupported PowerShell 5.1 `Get-Date -AsUTC`; it failed after the preceding read-only Git commands completed. Corrected with `(Get-Date).ToUniversalTime().ToString('o')`.

## Gaps
- Static inspection of retained evidence is not an independent test rerun. No tests/pipeline were run, as instructed; log assertions and counts above are historical evidence only. Native child exit codes are asserted by `run/run-checks.ps1:64-65`, but the retained child logs themselves do not print the numeric exit codes.
- Exact historical dirty-source and per-attempt script identities remain unproven; no retroactive reconstruction was fabricated. The present working-tree diff is not a receipt for the earlier installed lazy-load database.
- No corrected commit exists in the reviewed state. Commit authorization and any fresh immutable-SHA experiment remain separate from this review; downstream pipaux, survey/storage/numerical checks, full suite and full R CMD check remain unexecuted here and are explicitly outside the prior bounded evidence (`run/handoff.md:59-63`).
- Cache entries that are files, a cache path that is a regular file, unreadable directories, relative/empty root values and hidden entries are not represented by the three new fixtures. No newly introduced functional failure was established for those cases; preserving existing greatest-basename/all-entry behavior was explicitly intended (`run/handoff.md:30`). These are coverage limits, not a request to add directory filtering or broad error suppression.
- No OS-wide filesystem write audit, UNC timestamp re-verification or exhaustive dependency attestation was performed. The prior report describes UNC directory metadata, but these retained five child logs do not independently establish all shared-state/write-boundary claims. E:-local temp/library paths are actually printed in the successful log at lines 1-8.
- Minimal first applied: smallest complete review, no extra dependencies/framework, no safeguards for merely reversible failures, no separate Plan. Recommendations are not execution authorization; each eventual correction should receive one direct functional check.
