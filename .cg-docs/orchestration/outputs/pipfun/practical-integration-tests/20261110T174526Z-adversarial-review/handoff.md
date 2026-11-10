---
schema: pip-handoff-v2
project: pipfun
task: practical-integration-tests
run: 20261110T174526Z-adversarial-review
status: completed
updated: 2026-11-10T17:47:05Z
owner: independent-adversarial-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipfun
branch: PROD
head: 0c6a78d9884ed0965a524311537eec2a5095d60b
plan: NONE
next: Review complete; no actionable findings. Commit authorization and a fresh experiment remain separate from this review.
---

# Independent Adversarial Review

## Summary
No actionable P0/P1/P2 bugs or regressions found in the current two-file uncommitted change against base HEAD 0c6a78d9884ed0965a524311537eec2a5095d60b. This is an independent static review, not a runtime certification. No package edits, installs or test execution were performed.

The missing/empty-cache fallback implements the noncreating contract at `pipfun/R/pip_create_globals.R:14-17`. The populated-cache branch retains the previous greatest-basename selection and path composition (`:232-243`). The new tests cover absent, empty and populated caches with explicit expected paths and absence/tree-preservation assertions (`pipfun/tests/testthat/test-pip_create_globals.R:8-56`). No new dependency is needed: withr is already in DESCRIPTION:45.

### Actual caller analysis
- The reported diagnostic uses an absent root with `vintage = NULL`, `create_dir = FALSE`, `verbose = FALSE` (`pipsystem/experiments/one-survey/setup.R:218-229`). The changed branch returns its scalar cache-parent path without creating directories; the former unconditional listing was the failure point.
- `pipaux/R/zzz.R:1` initializes globals with the default NULL vintage. Its observed globals consumers use `PIP_DATA_DIR` and `PIP_REF_YEARS` (`pipaux/R/aux_cpi.R:272`, `R/aux_missing_data.R:48`), not a required versioned cache path. Those fields are unchanged.
- pipload's deprecated wrapper forwards NULL vintage and create_dir (`pipload/R/pip_create_globals.R:31-45`). Default-path callers obtain unrelated root fields, e.g. `pipload/R/pip_load_cache.R:32-48` and `R/pip_find_cache.R:23-24`; cache loading resolves its own version rather than interpreting the new cache-parent fallback as a release.
- The active legacy pipeline passes an explicit vintage list (`pip_ingestion_pipeline/_common.R:5-13`); `pipfun/R/working_release.R:110-119` also passes an explicit list. Both bypass the changed NULL-vintage branch. `add_gls_to_env` defaults to explicit `"latest"` and forwards it (`pipfun/R/pip_create_globals.R:508-511,561-574`).
- No matching active caller was found in pipdata/R by the targeted search. Discovery also surfaced historical checkouts and copied runtime sources; those were not treated as authoritative current callers.

### Rejected finding candidates
- Selecting a stray file instead of a directory, lexicographic selection of a cache child, and absent `glbs$cache_ppp` under NULL vintage are inherited behavior, not introduced regressions. This patch preserves selection semantics for an existing nonempty cache.
- Permission/listing failures or concurrent deletion of an existing cache can still fail; the patch does not claim general filesystem-error suppression or concurrency guarantees. No concrete new caller failure was established.
- Explicit-vintage unconditional directory creation at `pipfun/R/pip_create_globals.R:171-173` remains outside the changed branch and was already disclosed in the prior handoff:61. It is not a new finding against this diff.

## Changes
Only this report created and finalized, under pipsystem on E:. No package changes, commits, staging, branch/worktree operations, installs, tests, downloads or configuration changes. Minimal first: bounded review; no new safeguards, dependencies or implementation Plan.

## Checks run
- Read scoped diff against pipfun HEAD, matching requested base 0c6a78d9884ed0965a524311537eec2a5095d60b.
- Read prior cache-fix handoff and pipsystem required instructions/design/contract.
- Repository SHAs: pipsystem f9454707b292a620e25abef17f2e515794020ba7; pipfun 0c6a78d9884ed0965a524311537eec2a5095d60b.
- Skill loaded from E:/PovcalNet/01.personal/wb384996/kilo-config; git reports that directory is not a repository, so its SHA is UNKNOWN/not applicable.
- Verified pipfun current branch PROD, unchanged full HEAD, and status containing only the two requested modified files. Scoped diff totals 58 insertions and 7 deletions across those files.
- Static branch/path equivalence check for absent, empty and nonempty cache states; traced callers listed above. These are source checks, not executed R assertions.
- `git diff --check HEAD -- R/pip_create_globals.R tests/testthat/test-pip_create_globals.R`: passed; only LF-to-CRLF configuration notices.
- Verified report directory and ancestors have no reparse-point attribute. All agent-created output is this E:-local report; no agent-started process with temp/cache output was needed.
- Loaded R testing guidance and test-integrity reference. No test commands run, as requested. Prior report's 13 tests/69 expectations are inherited claims, not independently reproduced here.
- Read-only caller-discovery provenance (all full SHAs recorded by git):

| Repository | HEAD |
|---|---|
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipsystem | f9454707b292a620e25abef17f2e515794020ba7 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |
| pip_ingestion_pipeline | 38d066e42b5b913b520c7d533d10ff63006030b6 |
| Old_ingestion_pipeline_2021 | 20046a8feb50156bc2f9b46645902de7cf5c4bea |
| Old_ingestion_pipeline_2017 | deb8fd4b74741c0ba6657751ee710acc097c260b |
| pipeline_refactor | 1c2fd47a752c424cc13930fc20e1b17456fe2d46 |
| unnest_interpolation | 49d177839daf283b62c515f571139c011de3449e |
| pipdm | 3058d1060290e4c9edaced632f267b16c7b62017 |
| temp-prosperity-gap | 1d5c24cec2fb865e8d0ac820b474c8b6e6c83cee |
| pipload-m2-stamp-adapter | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| pipfun-check-baseline | 35f68b3e3d3fb08fedfba80441f1534f0c878f2f |

- Initial broad discovery returned snippets in `pipload-m2-stamp-adapter-runtime` and `pipdata.Rcheck/00_pkg_src/pipdata`; neither is a Git repository, so copy provenance is UNKNOWN. No conclusions depend on those copies. The broad search reached its 180-match limit; subsequent targeted searches covered pipfun/R, pipaux/R, pipload/R and pipdata/R.
- A timestamp command using unsupported Windows PowerShell 5.1 `Get-Date -AsUTC` failed; corrected with `(Get-Date).ToUniversalTime()`. This did not affect source/diff checks or change files.

## Gaps
- No package tests, installs, full R CMD check, live services, production data or downstream one-survey experiment were run. Test passes in the prior handoff were not independently verified.
- Review is limited to the requested uncommitted diff and directly relevant caller behavior, not a certification of all globals behavior, filesystem races, permissions, Windows path-length limits or downstream numeric results.
- pipfun HEAD remains the unfixed base; the fix exists only in the working tree. The prior handoff's separate commit authorization and fresh immutable-source experiment remain outside this review and have not been performed.
