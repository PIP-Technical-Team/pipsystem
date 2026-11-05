---
schema: pip-handoff-v2
project: pipsystem
task: m2-phase-3-readiness
run: 20261102T135331Z-orchestrator
status: completed
updated: 2026-11-02T14:07:25Z
owner: pipster-storage-readiness-research
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: NONE; research input to Phase 3 local Plans
next: Coordinator uses this research for bounded local Plan preparation; scientific and execution approval remain separate.
---

# Pipster And Storage Phase 3 Readiness

## Summary
Research only. No package writes, R loads, tests, installs, network access or Git mutations authorized. Exact user-named output overrides generic cg-plan output location; no implementation Plan or approval is inferred from deviate:auto.

**Ready to prepare a small pipster-local Plan, not ready to implement or claim integration success.** No dedicated mean estimator exists at the inspected pipster checkout. Proposed smallest surface is `pipmd_mean(welfare, weight) -> list(mean = <double>)`, using `collapse::fmean`; identity, PPP-year iteration, storage, fingerprints and recovery stay in pipdata. Four package paths suffice provisionally. The exact name/result, weight/missingness rules, tolerance, dependency runtime and full-suite gate still need the applicable approvals.

The supplied pipaux pin exists at its feature-worktree HEAD, not canonical PROD. Public storage APIs needed for Phase 3 exist in current stamp and the pipload feature commit. Installed default-library metadata is older/different, so neither checkout HEAD nor package version alone identifies the runtime that would execute.

## Evidence Keys And Scope

Every package-relative citation below resolves to this ledger. Git facts are fresh local read-only command observations; source/test contents are inspection, not executed checks. Historical passes remain document-reported. Installed DESCRIPTION contents are metadata observations, not loaded-namespace or source-byte certification.

| Key | Root | Observed HEAD |
|---|---|---|
| H | `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem` | `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39` |
| P | `E:/PovcalNet/01.personal/wb384996/PIP/pipster` | `828064e406e07e711c34d2ba725746e367d35f9b` |
| S | `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp` | `4a1fa5d92313aa223296fae0e29cf3446a314aea` |
| L | `E:/PovcalNet/01.personal/wb384996/PIP/pipload` | `ff9a81e386a09fb2531c154f63fd2b91521313c6` |
| LF | `E:/PovcalNet/01.personal/wb384996/PIP/pipload-m2-stamp-adapter` | `4ef0d90a974cb6ff0725da69373bde421dd04ad5` |
| A | `E:/PovcalNet/01.personal/wb384996/PIP/pipaux` | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` |
| AF | `E:/PovcalNet/01.personal/wb384996/PIP/pipaux/.kilo/worktrees/m2-phase-2-step-4` | `798242c91f661d259bc2c45cce032b6a93bb1d6b` |
| M | Installed metadata root `E:/PovcalNet/01.personal/wb384996/R/win-library/4.5` | No Git provenance asserted; RemoteSha fields reported literally below |

H `SYSTEM_DESIGN.md:162-168,186-205,291-309` controls dynamic welfare columns, independent estimate saving, stamp authority and pure pipster calculations. H umbrella Plan `.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:154-161,173-190,229-236,330-352,415-431` supplies the proposed E7/E8 contracts, D3/D4/D8 gates and separate local-Plan requirement. H charter `compound-gpid.md:35-40` identifies Phase 3 as current next work. No pipdata repository was opened; its work belongs to the sibling researcher.

## Instructions And Git Inventory

- Read H charter/design/harvest brief/coordination contract first. Read S and L `compound-gpid.md` and `compound-gpid.local.md` fully, and `.kilo/AGENTS.md:1-26`; read A charter and local config fully. AF charter matches the canonical charter text inspected; AF has no local config or `.kilo` directory. LF has the copied local config but no `.kilo` directory. Root AGENTS searches returned none for the four requested package roots; direct ancestor `Test-Path` checks through E:/, PovcalNet, personal/user, PIP and Rpackages also found no ancestor AGENTS file. Adapter files exist under S/L `.kilo` despite being omitted by the initial glob, and were read explicitly.
- P has no `AGENTS.md`, `compound-gpid.md`, `compound-gpid.local.md`, `kilo.json` or `.kilo` directory, confirmed by direct `Test-Path`, root directory read and recursive AGENTS search. All ten P R files, its five test files and test entrypoint were read completely. Tooling/configuration inspected: DESCRIPTION, NAMESPACE, Rproj, .Rbuildignore, _pkgdown.yml and the sole workflow. No new configuration/charter is needed for the mean.
- A local config `compound-gpid.local.md:23` says future branches must start from DEV and PRs target DEV; the supplied completed feature instead descends from PROD, as its own handoff records. Report this mismatch, do not retroactively correct history or infer approval. A charter `:50-51` assigns publish/skip authority to GitHub/Y-drive status; that is not approval of a numerical rebuild authority contrary to H design `:186-192,305-309`.
- No P-specific rule forbidding future Plan-only writes on existing PROD was found. This research authorizes none there. A later local planning request can explicitly retain PROD for Plan-only work and skip branch creation. If implementation needs a new branch, explicitly name and authorize that operation (candidate `feat/m2-pure-weighted-mean`), not an implicit cg-plan branch offer.

Fresh commands: `git --no-optional-locks -C <root> status --short --branch`, `rev-parse HEAD`, `worktree list --porcelain`, then `status --porcelain=v1 --untracked-files=all`. No fetch or ref mutation.

| Checkout | Branch and status | Worktrees returned by Git |
|---|---|---|
| P | `PROD...origin/PROD`; clean, no status paths | Only P at P SHA / `refs/heads/PROD` |
| S | `ready_cran...origin/ready_cran`; modified `.gitignore`, `compound-gpid.local.md`; untracked `.compound-gpid/active-manifest.json`; no source/test dirty path | Only S at S SHA / `refs/heads/ready_cran` |
| L | `PROD...origin/PROD`; modified `.gitignore`; untracked `.cg-docs/plans/2026-10-20-m2-pipload-stamp-adapter.md`, `.cg-docs/reviews/2026-05-28-pip-inv-enrich-fast-bulk-v3-verify-review.md`, `.compound-gpid/active-manifest.json`, `.github/skills/` tree, `sessionInfoLog`; no source/test dirty path | L at L SHA / PROD; LF at LF SHA / `feat/m2-stamp-adapter` |
| LF | `feat/m2-stamp-adapter...origin/feat/m2-stamp-adapter`; only untracked `.cg-docs/active-state/current.json` | Same two worktrees as L |
| A | `PROD...origin/PROD`; untracked `.cg-docs/plans/2026-10-30-m2-aux-stamp-cpi-ppp-pfw.md`, `compound-gpid.local.md`; no source/test dirty path | A at A SHA / PROD; AF at AF SHA / `feat/m2-aux-stamp-cpi-ppp-pfw` |
| AF | `feat/m2-aux-stamp-cpi-ppp-pfw...origin/feat/m2-aux-stamp-cpi-ppp-pfw`; only untracked `.cg-docs/active-state/current.json` | Same two worktrees as A |

L's entire untracked skill-file listing was captured by the command, not opened or changed. The table groups that unrelated tree rather than copying its hundreds of paths. Cached tracking labels do not prove remote freshness or current worker ownership. H closing status is `main...origin/main` with only the shared readiness run folder untracked; siblings own other files there.

**Expected pipaux pin:** `git cat-file -t 798242c91f661d259bc2c45cce032b6a93bb1d6b` returned `commit`; AF `rev-parse HEAD` returned exactly that SHA. `merge-base --is-ancestor <expected> A/HEAD` returned 1, while `merge-base --is-ancestor 27c5a3c8eab8ddcabb032d620af6a1f76e62f444 AF/HEAD` returned 0. Thus present, based on canonical PROD, not merged into it. `git show --stat HEAD` in AF shows one 17-file feature commit, including four R files, five manuals, five test files, Plan/review/execution artifacts. No fetch was used.

## Dependency Declarations

These are DESCRIPTION constraints, not immutable dependency locks. All four use testthat edition 3. No requested source DESCRIPTION pins stamp/pipload to the exact M2 feature SHAs.

| Source | Version and R bound | Relevant declared constraints/pins |
|---|---|---|
| P `DESCRIPTION:3,13-26` | `0.0.0.9002`, R >=2.10 | Imports cli, collapse, data.table, wbpip >=0.1.0.9002; Suggests testthat >=3.0.0, tibble, withr; no Remotes; roxygen 7.2.3 |
| S `DESCRIPTION:8,22-48` | `0.1.0`, R >=4.1 | cli >=3.4.1, fs >=1.5.2, rlang >=1.0.6, secretbase, jsonlite, data.table >=1.14.6, utils, nanoparquet, qs2; suggests fst >=0.9.8, testthat >=3.1.5, filelock, collapse, withr, pkgload, callr and docs tools; Config/roxygen2/version 8.0.0 |
| L/LF `DESCRIPTION:2,17-47` | `1.0.0`, R >=2.10 | stamp >=0.0.10, pipfun >=0.3.10, qs2, fst and the other listed imports; pipdata >=0.0.0.9017 is Suggests, not a hard import; no exact source pins; roxygen 7.3.2 |
| A/AF `DESCRIPTION:3,29-72` | `0.3.0`, R >=2.10 | stamp unbounded; pipload >=0.1.4.9002; pipfun >=0.0.2; collapse, data.table, qs2 plus existing imports; Remotes `github::PIP-Technical-Team/pipload@PROD`, `.../pipfun@PROD`, `.../myrror`; these mutable remotes do not select LF; roxygen 7.3.3 |

LF `R/load_pip_deflated_data.R:149-171` calls `pipdata::pd_deflation()` in an existing convenience path. Its Suggests edge must remain distinct from proposed hard dependencies: no need to add pipdata/pipload/stamp to pipster, and no need to call this convenience deflater from pipdata coordination. A full dependency-cycle result is outside this sibling's no-pipdata-source scope.

## Pipster Mean And Minimal Proposed Work

P `NAMESPACE:3-13` exports converters and grouped Lorenz/poverty/quantile functions, imports collapse, but exports no mean. Complete R reads found no dedicated mean calculation or `fmean` call. P `R/pipgd_params.R:33-36,93-96` accepts `mean = NULL` and stores the supplied scalar; `R/pipgd_dist.R:164-172,201-205` accepts `mean = 1` and multiplies derived quantiles by it. Lorenz and poverty signatures likewise accept a supplied mean (`R/pipgd_lorenz.R:30-41,166-176`; `R/pipgd_pov.R:113-125,272-283`). These are not replacement microdata mean estimators.

P calculations are in-memory, with no explicit read/save or network calls found in the ten R files. They are not all strictly side-effect-free: P `.onLoad` changes missing options (`R/zzz.R:1-16`), some functions read those global options, and `add_pip_class` mutates attributes before its returned copy (`R/as_pip.R:112-126`). Existing grouped paths use wbpip private functions (`R/as_pip.R:93-96`, `R/pipgd_params.R:55-83`). The new mean should not reuse those paths, identify data type heuristically, sort input, or change options. P `R/pipster.R:14` already imports collapse; no new dependency is needed.

**Proposed API, not approval:** `pipmd_mean(welfare, weight)` returns exactly `list(mean = <length-one unclassed double>)`. It computes through `collapse::fmean(welfare, w = weight, na.rm = FALSE)` after the approved input contract. Vector-first input is directly usable with the native pipe (`welfare |> pipmd_mean(weight)`); no new object system, options, format switch, dispatch/helper layer, or accumulator is required. Pipdata adds artifact/PPP/reporting/unit metadata and saves each successful result before assembly. The list shape satisfies the Decided list-or-data.table policy without adopting the umbrella's unapproved all-in-one result envelope inside pipster.

**Candidate D3/D4 selection for approval:** nonempty equal-length ordinary numeric vectors; finite welfare and weights; no implicit row removal; nonnegative weights with positive total; zero weights allowed; no normalization or population adjustment inside pipster. Whether negative welfare is admissible must be explicit, not inherited from weight validation. Preserve the supplied welfare units; pipdata owns the PPP-per-day unit assertion. Propose synthetic tolerance `1e-12`, subject to approval. Collapse skips missing values by default (M `collapse/DESCRIPTION:23-26`), so an implicit default is not an approved NA policy. No installed function was loaded to verify its actual formals.

| Exact candidate package path | Purpose |
|---|---|
| `R/pipmd_mean.R` | One exported function with roxygen, approved contract checks and qualified collapse call |
| `tests/testthat/test-pipmd_mean.R` | One self-contained test file: analytic 2.5 result for welfare c(1,3)/weight c(1,3), shape/type, input nonmutation, approved empty/mismatch/nonfinite/negative/zero/missing cases, common-weight scaling and zero-weight invariance if approved |
| `man/pipmd_mean.Rd` | Generated documentation for that one function |
| `NAMESPACE` | Generated addition `export(pipmd_mean)` only |

No DESCRIPTION, existing grouped functions, fixtures, README/site, data-raw script or old tests need an intentional change for this bounded feature. Existing package version remains unless separately scoped. Reject unrelated generator churn rather than expanding the edit set. Functional checks accompany the change; general validation frameworks, dependency discovery and additional modes go to Later.

Separate future local lifecycle candidates, not written here: `.cg-docs/plans/2026-11-02-m2-pipster-pure-weighted-mean.md`, `.cg-docs/work-reports/2026-11-02-m2-pipster-pure-weighted-mean.md`, matching review/verify reports, and `.cg-docs/active-state/current.json`. Exact lifecycle scope, saved-Plan contract and owner still require approval. This report is research input, not a saved execution Plan.

## Public Storage Surface

S `NAMESPACE:13,24-25,30-41` confirms the following are public. There is no exported `st_pin()` API; retain the real save/rebuild return pin, inspect public versions/latest where required, and pass explicit IDs for historical reads. Never build private snapshot paths in consumers.

| API at S | Source and use |
|---|---|
| `st_save(x, file, format=NULL, metadata=list(), code=NULL, parents=NULL, code_label=NULL, pk=NULL, domain=NULL, unique=TRUE, verbose=TRUE, alias=NULL, ..., request=NULL, semantic_schema=NULL)` | `R/IO_core.R:281-325,410-417`; request/semantic_schema exact-name-only after dots; unchanged save returns retained version. Raw save is not execution-success proof |
| `st_load(file, format=NULL, version=NULL, verbose=TRUE, alias=NULL, ...)` | `R/IO_core.R:630-668`; non-NULL version resolves then delegates to public version loading |
| `st_load_version(path, version_id, verbose=TRUE, ..., alias=NULL)` | `R/version_store.R:523-588`; exact snapshot, saved physical format; missing snapshot errors |
| `st_read_sidecar(rel_path, alias=NULL, version_id=NULL)` | `R/format_registry.R:487-529`; exact ID selects historical sidecar with no current fallback; no payload format reader |
| `st_plan_rebuild(targets, depth=Inf, include_targets=FALSE, mode=c('propagate','strict'), requests=NULL)` | `R/rebuild.R:540-566,591-600`; opt-in complete requests return run/skip/blocked including current rows; explicit proof/parents/semantics/registered format required |
| `st_rebuild(plan, rebuild_fun=NULL, dry_run=FALSE)` | `R/rebuild.R:202-243,274-277`; builder `(path, parents) -> list(x=..., ...)`; revalidates effective parents and publishes genuine success receipts; dry run invokes no builder/writes no outcomes |
| `st_execution_info(path, receipt_id=NULL, alias=NULL)` and `st_record_outcome(path, outcome, request, failure=NULL, alias=NULL)` | `R/execution_state.R:751-797,800-858`; data-free receipt/outcome access; public outcomes accept only failed/blocked, never manufactured success |

Request fingerprints must cover known result-affecting calculations/helpers/constants/rules; source SHA is audit provenance, not blanket currentness (`S R/rebuild.R:540-562`). Consumers should use public `st_hash_obj(list(formals=..., body=...))` under their approved fingerprint schema, not private `st_hash_code` (`S R/execution_state.R:831-842`; NAMESPACE). The installed collapse version/result policy must be bound to the later numerical test evidence, not assumed from source dependencies.

LF `R/pip_read-write.R:63-107,133-135` supplies `pip_read(id, format='qs2', version=NULL, alias=NULL, verbose=getOption('pipload.verbose'), metadata_only=FALSE)`. Exact character version + `metadata_only=TRUE` delegates to `st_read_sidecar(version_id=...)`; payload reads pass the same pin to `st_load`. LF `:185-221` supplies `pip_write(x,id,format='qs2',metadata=list(),code=NULL,alias=NULL,pk=NULL,verbose=getOption('pipload.verbose'),...)`, forwarding parents/request/semantic_schema through dots and returning the unmodified save result. It does not initialize roots, select work, or manufacture receipts. Both exported in LF `NAMESPACE:45-47`.

L has the same save formal list but **no metadata_only formal** on `pip_read` (`L R/pip_read-write.R:48-54,151-188`). Therefore L/default installation cannot substitute for LF on historical sidecar integration. `load_pip_data(metadata=TRUE)` selects a separate metadata artifact directory, not the sidecar-only API (`LF R/load_pip_data.R:54-87,146-152`). `load_aux_data(measure,version=NULL,format='qs2',verbose=...,ppp_defaults=TRUE)` uses configured release folders and filters PPP defaults unless disabled (`LF R/load_aux_data.R:15-33,75-90`). For already pinned Phase 3 inputs, the smallest public recommendation is explicit `pip_read` with known id/alias/format/version; avoid hidden latest/default filtering and acquisition setup.

AF public producers are `aux_cpi`, `aux_ppp`, `aux_pfw`; action defaults to update and requires initialized release state (`AF R/aux_cpi.R:18-65`, `R/aux_ppp.R:16-69`, `R/aux_pfw.R:15-44`). Their load branches do not forward an exact version selector. `pip_aux_save` and `aux_*_update` are internal (not exported in AF NAMESPACE); do not propose `pipaux::pip_aux_save()` as a public integration API. AF `R/utils.R:472-566` strips volatile gh only from the saved copy, forwards to public pip_write, and resolves missing skipped-save pins with public st_versions. CPI/PPP/PFW save keys are respectively `country_code,year,survey_acronym,reporting_level,cpi_year`; `country_code,reporting_level,ppp_year,release_version,adaptation_version`; `country_code,surveyid_year,welfare_type,is_alt_welf` (`AF R/aux_cpi.R:193-195,239-262`; `R/aux_ppp.R:262-275`; `R/aux_pfw.R:217-236`). This source evidence does not adopt a general survey-selection, scientific admissibility or M1 R1 mechanism.

## Tested Pins Versus Observed Commits

1. Historical Phase 1 stamp: H output `stamp/current-work-checkpoint/20261022T163746Z-stamp-session/handoff.md:28-30,62-64,117-135` preserves tested-content pin `5d1ddebdc926dad9c6ec99c08a65e74baee0da92`, not an exact clean execution-time tested commit. Its 4,128 assertion integrated report and older 1,873 assertion local gate are historical, not S-HEAD tests.
2. Newer stamp evidence: S `cran-comments.md:11-23` reports 0.1.0 macOS R4.6.1 check, 4,171 assertions, no failures/test warnings/skips, and manual/examples/vignettes success. `:35-60` reports eight successful CI jobs at `df2084e`. Fresh local `rev-parse df2084e` gives `df2084efb5f071cdaba2333f18b1b6d89e4494b4`; it is an ancestor of S (exit 0). `git diff --stat df2084e HEAD -- R tests NAMESPACE DESCRIPTION` shows only DESCRIPTION's version line changed; R/tests/NAMESPACE have no delta. No network/CI job was reopened. This is stronger source linkage plus reported results, not a fresh Windows/Phase3 run. `git diff --stat 5d1dde... HEAD -- R tests NAMESPACE DESCRIPTION` shows 21 changed files; the old paired pipload test cannot silently certify all of S.
3. Pipload adapter: H output `pipload/m2-adapter-final-handoff/20261023T012858Z-pipload-code/handoff.md:33-60,84-99,140-150` records a 78-test/1,047-expectation three-file subset against stamp `5d1dde...`, loaded as 0.0.11 in an isolated E library. Tested dirty content is manifest blob `7f2edb317a260fa2a7331646a3e49fc81892e51c`, manifest SHA256 `96a2c872ddde2ed7f2c144749529d51dbeb14024ce745b99f28204b948412d1b`, not the old base HEAD. Later H output `pipload/m2-adapter-commit-push/20261023T212536Z-pipload-code/handoff.md:21-31,54-80` binds that content to delivered LF through raw-file/CRLF-normalized blob comparisons; no new test was run in delivery. Eight excluded test files and historical C-write violations remain explicit in the original handoff. LF is not merged into L.
4. Later paired evidence exists in AF Plan `:16,80-90` and AF execution report `.cg-docs/work-reports/2026-10-30-m2-aux-stamp-cpi-ppp-pfw-execution.md:18-28`: five focused files report 22+25+33+50+76 = **206 passing assertions**, zero failures/warnings, using stamp `4a1fa5d` and pipload `4ef0d90` on E. Its review `.cg-docs/reviews/2026-10-30-feat-m2-aux-stamp-cpi-ppp-pfw-review.md:5-30` reports nine reviewers, fixed P2/P3 findings, final PASS/no unresolved findings. These two separate saved records corroborate the supplied handoff. They are narrow producer fixture evidence, not a full package suite, all adapter matrix checks at S, Phase3 deflation/mean integration, or general production certification.
5. The central supplied pipaux handoff `H .cg-docs/orchestration/outputs/pipaux/m2-aux-stamp-cpi-ppp-pfw/20261030T163258Z-pipaux/handoff.md:11,20,54-66` still names base A and says uncommitted. Fresh AF HEAD/stat supersede that stopping-state statement. The passing report predates AF commit publication and does not carry a retained raw source/install manifest proving a clean AF commit was the execution-time tested tree. Preserve the distinction: observed feature commit AF; reported tested working edits; dependency pins expanded by local Git; not a newly executed exact-commit pass.

## Installed Metadata Only

All rows below were read directly from M without R, package loading, source hooks, tests or installs. Actual `.libPaths()`, namespace loading and function formals were not probed. `Get-Command Rscript.exe` identifies `C:/Program Files/R/R-4.5.2/bin/Rscript.exe`; no execution follows, and this path is not a runtime-version check. C executables/base libraries may be read, but all future writes must be E.

| M DESCRIPTION | Literal metadata observed | Consequence |
|---|---|---|
| `stamp:7,31-48` | 0.0.11; RemoteSha `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e`; Built R4.5.2 | Not S, nor the historical 5d1dde installed export. Installed NAMESPACE lacks st_execution_info/st_record_outcome; older planner export alone is not the modern contract |
| `pipload:2,25-39` | 1.0.0; PROD RemoteSha `ff9a81e386a09fb2531c154f63fd2b91521313c6`; Built R4.5.2 | Matches canonical L metadata, not LF adapter despite unchanged package version |
| `pipaux:3,44-61` | 0.3.0; PROD RemoteSha `be7289f488f8c64df43283416e6e63639dc39e27`; Built R4.5.1 | Neither A nor AF; package version cannot identify Phase2 producer |
| `pipster:3,28-46,54` | 0.0.1.9003; DEV RemoteSha `1f6b1c845fd7fd2a11e1003a4cc6c4353463476e`; Built R4.5.1; collapse >=2.0.9, wbpip >=0.1.1.9000, vctrs >=0.6.4 | Different version and source from P. Do not run tests via an unqualified library(pipster) and label them P tests |
| `collapse:3,42-49,65-74` | 2.1.7; CRAN; RemoteSha `2.1.7` (a version, not Git SHA); Built R4.5.3; Rcpp >=1.0.1 | Available metadata only; actual loaded fmean API/result not verified |
| `wbpip:3,48-63,75` | 0.1.6; DEV RemoteSha `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; Built R4.5.1 | Existing P uses private wbpip helpers; compatible runtime behavior remains to be checked |
| `data.table:1-2`; `testthat:3,17-23,42`; `withr:3`; `pkgload:3` | 1.18.4; 3.3.2 (Built R4.5.2); 3.0.2; 1.5.3 | Installed tool metadata, not the earlier stamp/pipload test environment |
| `roxygen2:3,21-24,49`; `fst:7,27`; `qs2:4,19-23` | 8.0.0 (Built R4.5.3); 0.9.8 (Built R4.5.2); 0.2.2 | Generator differs from P's 7.2.3 record; storage metadata differs from historical producer-check versions |

No claim that these packages would win lookup under --vanilla, or that older isolated execution libraries still match manifests. Prefer explicit source/loaded-path binding in the later approved tests; do not update a shared library merely to make version strings agree.

## Suite And Documentation Safety

P has only five test files and no helper/setup/teardown scripts (complete tests directory glob/read). `tests/testthat.R:9-12` loads testthat/pipster and calls test_check. Tests use bundled data, local vectors and internal grouped calculations; no explicit network, DLW, Y-drive, save/delete or external data source calls were found. `test-identify_pip_type.R:1-3` skips without withr and temporarily sets verbose; `:81-84,113-134` uses unseeded random samples. `test-pipgd_lorenz.R:1-3` calculates at source time before test_that. `test-pipgd_dist.R:1-3` is a placeholder, not distributional evidence. Required new mean checks must not hide behind that placeholder or an optional skip.

P `.onLoad` only initializes options (`R/zzz.R:7-16`); no teardown. The existing suite requires installed imports including wbpip and its private helpers. No package/source/test execution was permitted here, so there is **no verified safe full-suite runtime command yet**. There is no direct project-test resource blocker from inspection, but exact E-only temp/home/cache/source paths and dependency loading remain unexecuted. A single `test_file` is not the umbrella full-suite gate; do not repeat the Phase2 focused subset as a general approval.

**Candidate full-suite command after D8/local scope approval, not run:** a fresh Windows PowerShell child invoking the discovered `Rscript.exe --vanilla -e "testthat::test_local('<approved E scratch source copy>/pipster', reporter='summary', stop_on_failure=TRUE, stop_on_warning=TRUE)"` with no filter. The local Plan must replace the scratch placeholder with one exact approved path. Set process-local TEMP/TMP/TMPDIR, HOME/R_USER, R_USER_CACHE_DIR, XDG cache/data/state, R_LIBS_USER and every tool output below that E scratch root before the first write-capable child; bind dependency libraries explicitly and preserve Windows runtime variables. Recheck resolved/reparse paths, then confirm the source copy loaded is P plus the approved delta rather than installed DEV pipster. This is ordinary disposable local verification, not a demand for a VM, exhaustive dependency security audit or new infrastructure. If a required dependency is unavailable or actual loading attempts shared/network/C writes, stop for a bounded gate decision rather than install or silently exclude tests.

P `NAMESPACE:1`, `man/as_pip.Rd:1-2`, `DESCRIPTION:13-14` and `pipster.Rproj:19-22` establish roxygen-generated docs/namespace. Proposed doc operation is installed `roxygen2::roxygenise(<same disposable source>, roclets=c('rd','namespace'))`; transfer only the new mean Rd and intended export after reviewing all deltas. The 8.0.0 generator can alter unrelated manuals/DESCRIPTION relative to 7.2.3: do not automatically copy those changes. No install, generator or package build ran here. P's sole `.github/workflows/pkgdown.yaml:33-48` installs dependencies and deploys docs; it is not a local safe test gate and must not be invoked for this task. `data-raw/pip_md.R:2-3,29,51,71` and `data-raw/pip_gd.R:33` prepare/write bundled data but are excluded by `.Rbuildignore:4` and not sourced by inspected tests; do not regenerate fixtures.

AF safety evidence is narrower: execution report `:28` says PIP_ROOT_DIR was set to an E stub. Source `AF R/zzz.R:1,16,19-61` invokes pipfun globals at top level, defaults a Y path and initializes logging on load. Its L-aux helper `tests/testthat/test-m2-stamp-cpi-ppp-pfw.R:3-38,47-66` creates/cleans an isolated tmp store, restores environments and mocks release folders. Those mocks happen after package initialization and are not by themselves a guarantee against startup writes. Its temp guard rejects C, not every possible non-E/reparse path. Do not source/load pipaux during research or infer general E-only safety from 206 reported assertions.

## Approvals And Later

Before implementation: approve the exact pipster-local saved Plan and its four package/lifecycle write sets; D3 weight/missing/zero/population policy; D4 public name/result/units/tolerance and independent save format; D8 exact E-only runtime/full-suite or explicitly compatible substitute. H umbrella `:159,174,231-236,419-427` is the controlling proposal, not approval. The approvals sibling reports no newer D3/D4 scientific approval; that peer result is supporting context, not authority. The pipdata sibling owns its deflation/storage/fingerprint boundary and exact integration write set. No additional stamp/pipload/pipaux edit is shown necessary by this bounded pure-mean research.

The later integration check must use actual request-aware stamp planning/rebuild, public LF reads with exact data/sidecar pins, and an independently saved mean that remains reusable after assembly failure; it must record actual loaded dependencies/paths and exact source pins. This is a functional proof obligation, not permission to run the pipeline, fetch data or certify production equivalence. Keep M1 R1 Open, release registration in Phase4, and scientific selection separate.

Later: general grouped/S3 statistics API, wider pipster cleanup, missing-data flexibility, packaging version cleanup, stronger containment, broader adapter/full-production tests, general dependency discovery and source-provenance automation. Build the smallest end-to-end mean path first; add safeguards only for almost-irreversible loss, wrong externally released numbers, secrets or production/shared-branch changes. Use installed tools, one functional check per change, and a local implementation Plan of about two pages. No new framework is justified here.

## Changes
Only this report created. No package changes or commits.

## Checks Run
- Specialized Read/Glob/Grep inspections of named contracts, package instructions/source/tests and installed DESCRIPTION/NAMESPACE metadata; complete P R/test coverage as described above.
- Read-only Git HEAD/branch/status/worktree, pin presence/ancestry and source-delta commands; exact observations recorded above. No Git mutations, fetch or network.
- Direct metadata path-ancestry inspection found no ReparsePoint attribute in the E report ancestry or the E library-root ancestry. No scratch/cache/tool-output file was created. No write-capable external command was run, so no unredirected R/install/test child existed.
- Get-Command for Rscript location only; system clock/timezone read (Eastern Standard Time, 2026-11-02). All report timestamps UTC.
- No R --vanilla metadata probe was needed; preferred metadata file reads. No loads/hooks, tests, installs, builds, generator, network/DLW/Y/production access, branch, stage, commit, push or merge.
- Full saved report read back through line 182 before this final check note. `git diff --no-index --check -- NUL <this report>` returned native exit 1; the only displayed diagnostic was the LF-to-CRLF normalization warning, with no displayed content-whitespace error. The no-index comparison differs from NUL; do not label this an exit-0 validation. No formal Plan renderer was run because this is the explicitly authorized research report, not a saved Plan or an HTML deliverable.

## Gaps
- D3/D4 scientific/API contract and D8 exact local suite/runtime/save/lifecycle approvals remain pending; this research is not a saved Plan or implementation approval.
- No actual R process/loaded library/formals/numerical result, full-suite success, docs-generation delta or Phase3 recovery result was verified. Installed metadata cannot certify loaded behavior or source bytes.
- Pipaux observed AF commit and reported precommit test content are distinct. Execution/review corroboration does not reconstruct a missing immutable tested-source/install manifest or full package-suite evidence.
- Stamp S has newer source/reported checks than the historical 5d1dde paired adapter run. Phase2 paired fixture evidence is limited, not a comprehensive requalification of pipload/pipdata at S.
- Canonical pipload/pipaux and default installed metadata do not contain the selected feature contributions. No merge/install or public package update was authorized; remote freshness and concurrent writer ownership remain UNKNOWN.
- Pipster lacks local charter/config; none was manufactured. Future Plan-only PROD use or feature-branch creation must be explicitly scoped; no branch operation occurred here.
- Pipdata source, complete dependency-cycle/fingerprint coverage, consumed-value mapping, production numerical equivalence, all T1-T12 integration, M1 R1, SMB/multiwriter safety, live-source and release registration remain outside this sibling research.
