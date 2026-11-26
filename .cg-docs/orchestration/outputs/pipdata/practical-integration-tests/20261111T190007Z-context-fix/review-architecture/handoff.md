---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T190007Z-context-fix
status: complete
updated: UNKNOWN
owner: independent architecture/API-contract reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: NONE; independent architecture/API-contract review complete, no implementation authorized.
---

## Summary
No issues found (P0-P3) in the named changed files: `R/dependency_contract.R` and `tests/testthat/test-public-working-release-context.R`, within this bounded architecture/API-contract review. The correction is minimal and pipdata-only, uses the actual public pipfun assignment contract, preserves explicit arguments, and keeps context fences coherent. No option fallback is required by the inspected shipped paths.

## Findings And Contract Evidence

- **Public getter contract confirmed.** Retained `pipsystem/.tmp/one-survey/n11/sources/pipfun/R/working_release.R:121-126,154-158` builds and stores the descriptor in `.pipenv`. The exported getter (`NAMESPACE:28`; `R/working_release.R:315-328`) fetches it and performs `assign(name, wrk_release, envir = parent.frame())`. The direct call at pipdata `R/dependency_contract.R:271` therefore creates `wrk_release` in the resolver's invocation frame; lines 272-273 consume that object correctly. This assessment relies on the executable assignment, not on the getter's inaccurate return-value prose at lines 299-301. No conventional-return assumption is introduced.
- **Explicit arguments preserved.** `R/dependency_contract.R:266-274` calls the getter only if either value is NULL and replaces only NULL components. Supplying both bypasses the getter entirely; supplying one retains that supplied value while resolving the other. Existing validation, roots, namespace, schema and hashing remain unchanged (`:275-293`). The existing explicit-context test `tests/testthat/test-dependency-contract.R:11-20` exercises distinct release/identity scopes without public setup. Partial-argument behavior was reviewed by source, not separately executed.
- **Context fences coherent.** Public processing resolves context through this same helper (`R/pd_process_data.R:117-124`), as do planning and other public wrappers. Snapshot revalidation (`R/dependency_execution.R:945-950`) and refresh fencing (`:1090-1103`) recompute the same active context. The write fence retains lease assertion, snapshot revalidation and manifest-parent checking (`:1171-1179`). Manifest scope/hash matching (`R/dependency_contract.R:241-245`) and pipeline context consistency (`R/pipeline_context.R:30-44,70-84`) are unchanged. The fix neither freezes a stale descriptor globally nor weakens a fence or bootstrap selector.
- **No demonstrated shipped need for legacy option fallback.** Production R source search found no remaining `pipfun.working_release`/`pipfun.identity` mechanism. The public setup stores the descriptor, not these options. The older acceptance helper's options (`tests/testthat/helper-one-survey-upstream-acceptance.R:66-71`) are not evidence of an option-only production contract: the same helper also installs its descriptor in `.pipenv` (`:83-95`). No catch/fallback or other-package/API change is warranted for this correction.
- **Regression respects the integration boundary.** New test `:24-41` substitutes only external release/PPP transport and calls public setup. It requires absent legacy options (`:44-45`), supplies completed inventory fields (`:50-59`), passively traces the real context return with cleanup (`:60-69`), and calls public processing with bootstrap (`:72-75`). Assertions require the specific missing-auxiliary class, the real descriptor/root and no new master version (`:76-86`). State restoration (`:6-19`) cleans/restores existing private state rather than seeding a simulated setup. The trace is observational, not a substituted planner/worker. This is a context-boundary regression, not survey-success evidence.

## Changes
Only this assigned E: report created and checkpointed. No implementation, Git mutation, dependency installation, tests, or runtime scripts executed. No other file was intentionally written by this review.

## Checks run
- Loaded pl-clear-technical-communication, cg-skill-r-technical and cg-skill-r-testing.
- Read review brief, charter, changed source/test and pinned pipfun working-release implementation.
- Read-only Git status, diff and HEAD inspection confirms expected baseline and two changed files.
- Read-only `git branch --show-current` confirms PROD; HEAD is the full SHA in the metadata. Tracked diff is seven insertions/two deletions in the resolver; the new regression is untracked and was read directly.
- Read context construction, manifest/pipeline consistency checks, snapshot/refresh/write fences and existing explicit-context test. Searched R sources and tests for context callers and legacy options.
- Inspected retained c11 logs, not independently rerun: `logs/red-confirmed.log:26-49` records five passing preconditions then the exact baseline context error; `logs/green.log:26-29` records 10 assertions, no failures/errors/skips; `logs/affected.log:34,47-51` records bootstrap coverage and 110 blocks/549 passing assertions with no failures/errors/skips. Those logs include PowerShell NativeCommandError formatting around trace messages; the test result summaries are distinguished from those diagnostic records.
- `logs/expanded.log:16-21` had progress only and no terminal result at inspection; no expanded-suite pass is claimed. The root implementation handoff still describes green execution as pending, so its checkpoint is stale relative to the inspected green/affected logs.

## Gaps
- Source review is independent; runtime evidence is retained implementer evidence, not independent execution. No R, shell scripts, tests, survey runs, or Pester were executed by this reviewer. No Problems/get_errors or execution_subagent result is available or claimed.
- Expanded suite completion, full-package R CMD check, other pipfun revisions, and independent runtime testing are not verified here. Review is bounded to this diff and its relevant contracts, not a full repository architecture audit.
- The regression intentionally stops at missing auxiliary inputs; survey numeric/readback acceptance and the original survey Plan remain outside this review. Explicit partial-argument combinations and descriptor changes during execution were assessed structurally, not separately exercised by this reviewer.
- No exhaustive OS write audit was performed. The only authored artifact is this report on E:. All shell invocations were read-only Git; no test/cache/temp-producing command was launched. `updated` is UNKNOWN because this review did not query a UTC clock.
- Minimal first applied: smallest complete correction, no unrelated safeguards/dependencies or speculative fallback. No implementation, restructuring or extra validation is requested by this review.
