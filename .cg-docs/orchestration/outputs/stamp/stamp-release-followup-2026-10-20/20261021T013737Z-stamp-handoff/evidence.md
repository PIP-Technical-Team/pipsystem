# Stamp Release Follow-Up: Sanitized Supporting Evidence

Task: `stamp-release-followup-2026-10-20`; milestone `m2-walking-skeleton`; feature `close-stamp-gaps-for-skeleton`.

Owner: existing user-controlled stamp session; native session ID `UNKNOWN`.

Initial capture: `2026-10-21T11:48:59.646Z`. Evidence-collection checkpoint: `2026-10-21T11:53:38.510Z`. Substantive saved-output readback and completion checkpoint: `2026-10-21T11:59:48.090Z`. Both owned files were read in full after substantive saving. This is reporting evidence, not a new runtime verification result.

## Evidence Classes

- `OBSERVED`: permitted tools read source/document bytes or Git results in this reporting run. Reading a report observes its text, not the execution it describes.
- `DOCUMENT-REPORTED`: a canonical repository-local Plan, work report or review records a historical result/approval.
- `WORKER-REPORTED`: a result carried from the existing sanitized handoff or this session's earlier observations; not independently reopened in this reporting run.
- `PROPOSED`: future work with no execution approval.
- `UNKNOWN`: no sufficient permitted evidence.

No credentials, tokens, production data or raw conversation transcript is copied. No Temp or private-state access is performed.

## Approval And Output Ownership

The current user answered `Approve Two Reporting Files` to `Reporting Write Approval`, which displayed the exact handoff.md and evidence.md paths for this run. This is direct reporting approval only. The native approval ID and exact approval timestamp are `UNKNOWN`; approval preceded the first write.

The user states this draft is not registered in pipsystem REQUESTS. Registration is not inferred from reporting approval. STATE, REQUESTS and roadmap are neither updated nor used to manufacture assignment authority.

Before creation, bounded `Test-Path` checks reported:

```text
OutputsParentExists : True
StampParentExists   : False
TaskParentExists    : False
RunFolderExists     : False
HandoffExists       : False
EvidenceExists      : False
```

Only the two approved files are authored; required containing directories are file containers, not additional report artifacts. No .gitkeep or other output is created.

## E1. Fresh Repository Capture

Working directory: `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp`.

Command:

```text
git rev-parse --show-toplevel --absolute-git-dir --git-common-dir --is-inside-work-tree
```

Observed result:

```text
E:/PovcalNet/01.personal/wb384996/Rpackages/stamp
E:/PovcalNet/01.personal/wb384996/Rpackages/stamp/.git
.git
true
```

Command: `git status --porcelain=v2 --branch --untracked-files=all`.

Sanitized observed result:

```text
branch.oid 235a18a58eabe15d5c98e7e4ee0e582eac60b4f5
branch.head ready_cran
branch.upstream origin/ready_cran
branch.ab +0 -0
unstaged modified: .gitignore
unstaged modified: compound-gpid.local.md
untracked: .compound-gpid/active-manifest.json
staged changes: none reported
```

UTC command: `[DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ss.fffZ')`.

Result: `2026-10-21T11:48:59.646Z`.

The branch/upstream comparison is cached; no fetch or network check occurred. Dirty-file contents were not inspected or copied. A full writer/session inventory is outside scope.

## E2. Instruction Readback

Observed stamp instructions: `.kilo/AGENTS.md:1-26` and `compound-gpid.md:10-35`. No root AGENTS.md was found by an exact filename search.

Applicable destination instructions were read from pipsystem AGENTS.md, compound-gpid.md, SYSTEM_DESIGN.md, HARVEST_BRIEF.md and ORCHESTRATOR.md. They reinforce narrow worker-output ownership, explicit approval, evidence classes, non-empty Gaps, package neutrality and the separation of reporting from runtime/release authority. The reporting worker did not activate the coordinator role or inherit authority to mutate its registers.

Destination root/branch were also independently observed as `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`, branch `main`, HEAD `f1863d2e80471616842aebfa5918651c947ba50d`. Destination instructions were read as working-copy context; their committed-content identity was not separately checked. No claim attributes their current text or this new report to that existing commit. No coordinator-register ownership or assignment registration is inferred.

## E3. Fresh Git History And Content Comparisons

All stamp observations in this report refer to HEAD `235a18a58eabe15d5c98e7e4ee0e582eac60b4f5` and the status captured in E1. No package source, test, DESCRIPTION, NAMESPACE, Rd, vignette or build-setting working-copy change was reported.

Command: `git log -9 --format="%H %P %cI %s"`. Selected sanitized results:

| Role | Commit | Parents | Commit time, UTC |
|---|---|---|---|
| Original recorded base | `ad9a483b6261166a6feefc64baea5d602198977b` | `ff5fbe18fb34b9dadd8dc58cdb05cdef365f93ab` | `2026-10-02T18:35:41Z` |
| Original M2 implementation | `9a894f7ed2982424a5bd1a131df5867600029399` | `ad9a483b6261166a6feefc64baea5d602198977b` | `2026-10-15T19:27:03Z` |
| Later target audit | `0fb2a9cb4b3f37f59c9282f06f2bddd6a8a88ceb` | `ad9a483b6261166a6feefc64baea5d602198977b` | `2026-10-19T18:58:35Z` |
| Feature-side target integration | `ecea4c11c9753f5e44c3be54cb2232bf999d6796` | `868ff12472e95164ef1d101d949fba79c3299530`, `0fb2a9cb4b3f37f59c9282f06f2bddd6a8a88ceb` | `2026-10-19T21:54:12Z` |
| Final feature source | `5d1ddebdc926dad9c6ec99c08a65e74baee0da92` | `5e90a6f13d935bccbe7d1bdc82f11feb87eaf08d` | `2026-10-20T16:46:50Z` |
| PR #18 merge | `f7af3eda85565647fde9ca7f84e0f1147ddfac15` | `0fb2a9cb4b3f37f59c9282f06f2bddd6a8a88ceb`, `5d1ddebdc926dad9c6ec99c08a65e74baee0da92` | `2026-10-20T17:48:58Z` |
| Current ready_cran | `235a18a58eabe15d5c98e7e4ee0e582eac60b4f5` | `f7af3eda85565647fde9ca7f84e0f1147ddfac15` | `2026-10-20T18:41:47Z` |

The history establishes a two-parent merge, not a squash/rebase. Original branch-creation baseline remains UNKNOWN; the Plan records an observed base, not a branch-creation audit.

Commands actually executed now:

```text
git diff --exit-code 5d1ddebdc926dad9c6ec99c08a65e74baee0da92 f7af3eda85565647fde9ca7f84e0f1147ddfac15
git diff --name-status f7af3eda85565647fde9ca7f84e0f1147ddfac15 235a18a58eabe15d5c98e7e4ee0e582eac60b4f5
git rev-parse "5d1ddebdc926dad9c6ec99c08a65e74baee0da92^{tree}" "f7af3eda85565647fde9ca7f84e0f1147ddfac15^{tree}" "235a18a58eabe15d5c98e7e4ee0e582eac60b4f5^{tree}" "235a18a58eabe15d5c98e7e4ee0e582eac60b4f5:DESCRIPTION"
git worktree list --porcelain
```

Observed results:

```text
source -> merge diff: exit 0, no output
merge -> current diff: M NEWS.md
source tree:  12ea22c4b2eaa0b2e1d93ea79d1cd20ca60cb4cb
merge tree:   12ea22c4b2eaa0b2e1d93ea79d1cd20ca60cb4cb
current tree: 678e3c41e0b0dd6a583890624d3960895c718e05
DESCRIPTION:  aa8d965194fb73ff19fc2cc0751cf51d4410bcd9
worktree: E:/PovcalNet/01.personal/wb384996/Rpackages/stamp
worktree HEAD: 235a18a58eabe15d5c98e7e4ee0e582eac60b4f5
worktree branch: refs/heads/ready_cran
```

This covers all tracked package inputs, including DESCRIPTION, NAMESPACE, R, tests, generated man files, vignettes, .Rbuildignore and other build/check inputs. Matching complete source/merge trees is stronger than matching a branch name or package version. It does not itself identify what an earlier test process loaded.

## E4. Tested Source, Package And Archive Identities

OBSERVED current source: `DESCRIPTION:1` says `Package: stamp`; `DESCRIPTION:7` says `Version: 0.0.11`. These lines are at the current SHA and DESCRIPTION blob recorded in E3. Author/contact fields are not needed and are not copied.

DOCUMENT-REPORTED source identity in `.cg-docs/work-reports/2026-10-15-m2-stamp-generic-gaps.md:319`:

> Observed unchanged base HEAD remains ad9a483b6261166a6feefc64baea5d602198977b; the tested implementation is the uncommitted working-copy manifest, not that base commit alone.

WORKER-REPORTED prior read-only handoff observations, captured during the October 20 handoff (a reported capture point was `2026-10-20T18:54:57Z`; not a per-command timestamp):

```text
ORIGINAL_M2_CHECK_COMPARISON ref=9a894f7ed2982424a5bd1a131df5867600029399 selected=137 missing=0 different=0
SOURCE_COMPARISON ref=5d1ddebdc926dad9c6ec99c08a65e74baee0da92 selected=160 missing=0 different=0
CHECK_INPUT_COMPARISON_WITHOUT_BUILD_TRANSFORMS selected=151 different=0
```

These earlier comparisons used Git-normalized content, not a universal Windows byte-for-byte line-ending assertion. The packaged-source exceptions were R-build transformations of DESCRIPTION and omission of vignettes/.gitignore. The 160 staged inputs also covered .Rbuildignore, _pkgdown.yml and staged wiki files. The later original-source matches were not evidence that those commits were checked after they were created.

The earlier worker also reported four ignored root vignette byproducts absent from its curated staged source: stamp-algorithm.R, stamp-algorithm.html, stamp.R and stamp.html. Their present existence was NOT rechecked. A build from an arbitrary dirty root folder is not automatically the previously checked curated artifact.

| Identity | Recorded value | Class / limit |
|---|---|---|
| Exact clean tested commit at execution time | UNKNOWN | No report proves a clean checked checkout at a commit. |
| Supported October 20 tested-content pin | `5d1ddebdc926dad9c6ec99c08a65e74baee0da92` | WORKER-REPORTED content matching; fresh Git proves its equality to merge result. |
| Original M2 final source manifest | `final-source-manifest.csv`, MD5 `302c32dc5945df7875c192f7ae6aa9c2` | DOCUMENT-REPORTED at work report:319; earlier worker rehashed it; not reopened now. |
| Original October 15 archive | `stamp_0.0.11.tar.gz`, MD5 `5643aa2026c3ef9dc80340304b9b7549` | DOCUMENT-REPORTED at work report:319. Original archive is not asserted to remain at the shared filename. |
| October 20 built/checked archive | `stamp_0.0.11.tar.gz`, 369197 bytes | WORKER-REPORTED prior raw archive/log read. |
| October 20 archive SHA-256 | `5e87cacfcc9005bdb03ae2b7652e55fbdf4821f71af91ec0efda224eaf0444fe` | WORKER-REPORTED prior Get-FileHash result; not recalculated now. |
| October 20 archive Packaged time | `2026-10-20 16:41:00 UTC` | WORKER-REPORTED archive DESCRIPTION. |
| October 20 filesystem modification times | archive `16:41:01Z`; test output `16:44:40Z`; check log `16:45:11Z` | WORKER-REPORTED prior file-metadata read. Not test-start timestamps. |
| October 20 archive source commit embedded in archive | UNKNOWN | It used staged working-tree content; later matching a commit is a separate observation. |
| Archive/check representing current HEAD's NEWS.md | UNKNOWN / not run | No complete current candidate equivalence. |
| CRAN submitted version/archive/hash/date | UNKNOWN | No sanitized submission receipt available. |
| CRAN accepted version/archive/hash/date | UNKNOWN | No sanitized acceptance/release receipt available. |

Checksums identify reported local content; they do not establish authenticity, current availability, submission or acceptance. The two different archives share a filename/version but are not interchangeable.

## E5. Self-Contained Canonical Completion And Local-Case Evidence

Canonical stamp prefix for all relative paths below: `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp`. Records were read in this reporting run at observed HEAD `235a18a58eabe15d5c98e7e4ee0e582eac60b4f5`; Git status reports no working-copy changes to them. Their historical statements remain DOCUMENT-REPORTED, not independently repeated runtime evidence.

Plan `.cg-docs/plans/2026-10-14-m2-stamp-generic-gaps.md:4-8`:

```yaml
status: completed
completed-date: 2026-10-15
completed-phases: [1, 2, 3, 4, 5]
current-phase: 5
execution-report: .cg-docs/work-reports/2026-10-15-m2-stamp-generic-gaps.md
```

The Plan's lines 24-28 preserve the planning-only approval. Lines 32-45 explicitly record the subsequent execution revision, applicable R1/R2 approvals and simplified local gate; do not read the earlier paragraph as the final phase status or the later paragraph as new approval for this follow-up.

Work report `.cg-docs/work-reports/2026-10-15-m2-stamp-generic-gaps.md:174,310-327`, sanitized excerpts:

> All five phases / Steps 1-9 completed on 2026-10-15. The requested final verify-mode review completed with one reporting correction; 25 findings across phase/final reviews are fixed, none skipped/open.

```text
Local gates: V1, V2, V3, V4, V5, V7, V8, V9
Final run: build/run-20261015-140103549/stamp.Rcheck
Native exit: 0
PASS1873 / FAIL0 / WARN9 / SKIP7
Only two known excluded-vignette check warnings
COMPLETED 2026-10-15T18:03:24Z
Not a clean full CRAN check claim
```

The final review `.cg-docs/reviews/2026-10-14-m2-stamp-generic-gaps-verify-review.md:16-26` records one corrected reporting finding: inclusive V1-V9 wording wrongly implied umbrella V6. It states 24 fixed parent findings plus one fixed verification finding, no open/skipped findings, and no independent reviewer runtime rerun.

| Local case | Sanitized existing result | Canonical reference |
|---|---|---|
| Fingerprints / V2 | Declared calculation/helper/constant/rule changes select work; requested missing proof blocks; absent legacy saved proof differs from corrupt modern proof; source audit SHA alone is not equality. | Work report:186,197-200,271-283. |
| Availability/failure / V4 | Deterministic/external/unknown failures persist; governing execution survives blocked observations; review-plus-change and analyst-started recovery gates are exercised. | Work report:189,283,287-289. |
| Graph / V2,V4 | Explicit recipes, finite cycles/order checks, effective parent revalidation, preserved explicit historical pins on skips, failed-child blocking. | Work report:271,283,287-289. |
| Receipts/convergence / V3,V8 | A1/B1/C1 -> actual A2 then B executes equal proof/output -> retained B1 and a new receipt binding A2; C call count zero; original B1 still binds A1 and original bytes remain unchanged. Repeats plus a genuine installed Rscript process have zero builders and unchanged store. | Work report:281-282. |
| Metadata/history / V5 | Typed JSON/QS2/both, exact historical metadata/physical-format reads, modern-protocol discrimination, no artifact deserialization for proof access, retained references protect pruning. | Work report:254-267,310. |

No consumer source was inspected or executed for this reporting task. V6/L-authority, pipload adapter round-trips, whole-M2, production/SMB/multiwriter or OS-sandbox certification must not be inferred from these local cases.

## E6. Historical Check Ledger, Commands And Sanitized Excerpts

All commands in this section are HISTORICAL EVIDENCE ONLY. None was executed for this report. Exact raw files are not available to this reporting run; paths below preserve provenance, not a requirement that the coordinator read blocked locations.

Historical root `S` means `C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps`. Historical root `A` means `C:/Users/wb384996/AppData/Local/Temp/2/kilo/stamp-reference-pilot-final3`.

| Run | Evidence class and result | Source/archive/time/limit |
|---|---|---|
| Original M2 final | DOCUMENT-REPORTED native exit 0; 1873 PASS, 0 FAIL, 9 WARN, 7 SKIP; two check warnings for unbuilt vignettes. | Work report:319-325. Working-copy manifest, not base HEAD alone. `S/build/run-20261015-140103549/stamp.Rcheck/{00check.log,tests/testthat.Rout}`. Completion UTC `2026-10-15T18:03:24Z`. |
| Separate audit `stamp-reference-pilot-final3` | DOCUMENT-REPORTED build/check 0; 2567 PASS, 0 FAIL/WARN/SKIP; 3 NOTEs. | `.cg-docs/reviews/2026-10-15-function-audit.md:488`. Earlier audit source, not proof of integrated M2 candidate. Exact clean checked source SHA, archive hash and exact run UTC time UNKNOWN in the copied evidence. |
| Audit extended/shuffle | DOCUMENT-REPORTED 2567 PASS, no test FAIL/WARN/SKIP; extended one existing NOTE; shuffle seed 20261019. | Same audit:489-490. Does not attest later integrated source. |
| October 20 integrated final | WORKER-REPORTED 4128 PASS, 0 FAIL, 0 WARN, 0 SKIP; `Status: OK`; examples/vignettes pass. Separate captured native exit UNKNOWN. | `S/build/run-20261020-124102245/stamp.Rcheck/{00check.log,tests/testthat.Rout}`; archive and timing E4; staged source later matching 5d1ddeb. Not run at current HEAD. |

Exact documented original wrapper invocation (work report:224), historical working directory `S/build`:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/run.ps1" -Mode check
```

The approved Plan:43 and report:224,250 establish the original R build/check flags and additional scratch library/output arguments. Effective expanded forms, reconstructed rather than a retained terminal transcript:

```powershell
& "C:/Program Files/R/R-4.5.2/bin/R.exe" --vanilla CMD build --no-build-vignettes --no-manual "C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/source/stamp"
& "C:/Program Files/R/R-4.5.2/bin/R.exe" --vanilla CMD check --no-manual --no-vignettes --no-examples --output="C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/build/run-20261015-140103549" --library="C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/library" "C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/build/stamp_0.0.11.tar.gz"
```

WORKER-REPORTED exact earlier audit check-command file `A/check-command.txt:1` and native exit file `A/check-exit.txt:1`, previously read by this worker, not reopened now:

```text
"C:/PROGRA~1/R/R-4.5.2/bin/x64/R.exe" CMD check --as-cran --no-manual "C:/Users/wb384996/AppData/Local/Temp/2/kilo/stamp-reference-pilot-final3/stamp_0.0.11.tar.gz"
check-exit.txt: 0
```

WORKER-REPORTED October 20 effective commands, reconstructed from the retained runner during the earlier handoff. The wrapper's exact saved terminal invocation and separate native exit file are UNKNOWN; do not manufacture them:

```powershell
& "C:/Program Files/R/R-4.5.2/bin/R.exe" --vanilla CMD build --no-manual "C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/source/stamp"
& "C:/Program Files/R/R-4.5.2/bin/R.exe" --vanilla CMD check --no-manual --output="C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/build/run-20261020-124102245" --library="C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/library" "C:/Users/wb384996/AppData/Local/Temp/2/kilo/m2-stamp-generic-gaps/build/stamp_0.0.11.tar.gz"
```

Sanitized prior raw-log excerpts, WORKER-REPORTED from earlier direct inspection:

```text
October 15 testthat.Rout:762,857
[ FAIL 0 | WARN 9 | SKIP 7 | PASS 1873 ]
October 15 00check.log:73
Status: 2 WARNINGs

October 20 00check.log:2-11,52-60
* using R version 4.5.2 (2025-10-31 ucrt)
* using platform: x86_64-w64-mingw32
* running under: Windows Server 2022 x64 (build 20348)
* using option '--no-manual'
* this is package 'stamp' version '0.0.11'
* checking examples ... OK
* checking tests ... OK
  Running 'testthat.R'
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK
October 20 testthat.Rout:894
[ FAIL 0 | WARN 0 | SKIP 0 | PASS 4128 ]
```

Original skips/warnings, DOCUMENT-REPORTED at work report:235-236 and previously inspected raw output:

- Seven skips: automatic retention (`test-pruning.R:29`), missing-sidecar predicate (`test-should-save.R:37`), five partition/filter cases (`test-write-parts.R:104,156,236,302,337`). No required M2 skip was reported.
- Nine test warnings: eight missing-primary-key warnings and data.table built under R 4.5.3 while running R 4.5.2.
- Original gate excluded examples, full vignette build/execution and PDF manual. New examples/chunks were separately smoked, not a blanket legacy-example claim.
- The older audit's 3 NOTEs were new-submission feasibility, unavailable current-time verification and historical vignette dependency declarations. "New submission" is a local check diagnostic, not a submission receipt.
- October 20's reported check included examples and vignette rebuilding but omitted the manual; it was not an integrated `--as-cran` run. Zero test skips does not certify every backend/platform/operational scenario.
- Current-HEAD tests/checks, CRAN submission/acceptance, remote matrix results and PDF manual success: UNKNOWN/not run here.

## E7. Runtime, Dependencies And Harness Limits

DOCUMENT-REPORTED at work report:220-226:

```text
R version 4.5.2 (2025-10-31 ucrt)
platform x86_64-w64-mingw32
cli 3.6.5; fs 1.6.6; rlang 1.1.7; secretbase 1.2.1
jsonlite 2.0.0; data.table 1.18.2.1; nanoparquet 0.5.0; qs2 0.1.7
testthat 3.3.0; withr 3.0.2; filelock 1.0.3; fst 0.9.8
collapse 2.1.6; qs 0.27.3; pkgload 1.4.1; roxygen2 7.3.3
knitr 1.51; rmarkdown 2.31
```

The report records dependencies resolving from `C:/Program Files/R/R-4.5.2/library`, with the R 4.5 user library also in discovery. Check children installed stamp in the scratch library. WORKER-REPORTED earlier audit environment `A/environment.txt:25-44` additionally recorded covr 3.6.5 and callr 3.7.6; not reopened now. These are historical versions, not current probes.

The original report describes scratch TMPDIR/TMP/TEMP, R_USER/HOME/cache/library paths, `NOT_CRAN=true`, `R_PROFILE_USER=NUL`, `R_ENVIRON_USER=NUL`, empty R_TESTS, `_R_CHECK_FORCE_SUGGESTS_=false` and `_R_CHECK_CRAN_INCOMING_=false`. The earlier worker reported the October 20 runner also setting `DEV_VIGNETTES=false` and the installed Positron Pandoc tools path. These settings are process hygiene, NOT enforced filesystem/network containment.

Exact October 20 dependency versions, dependency source SHAs/transitive closure, current installed producer identity, pipload/pipdata actually tested SHAs and minimum-R/platform execution matrix: UNKNOWN. DESCRIPTION's R >=4.1 support floor is source metadata, not proof of an R 4.1 run. No dependency is installed, updated, loaded or tested now.

## E8. Exact Public Producer Surface And Compatibility

OBSERVED signatures below were read from current source at HEAD `235a18a58eabe15d5c98e7e4ee0e582eac60b4f5`, corroborated by generated help and NAMESPACE. This is source inspection, not package execution.

```r
st_save(x, file, format = NULL, metadata = list(), code = NULL,
        parents = NULL, code_label = NULL, pk = NULL, domain = NULL,
        unique = TRUE, verbose = TRUE, alias = NULL, ...,
        request = NULL, semantic_schema = NULL)
st_should_save(path, x = NULL, code = NULL, alias = NULL,
               request = NULL, semantic_schema = NULL, metadata = list())
st_plan_rebuild(targets, depth = Inf, include_targets = FALSE,
                mode = c("propagate", "strict"), requests = NULL)
st_rebuild(plan, rebuild_fun = NULL, dry_run = FALSE)
st_is_stale(path, alias = NULL, request = NULL)
st_execution_info(path, receipt_id = NULL, alias = NULL)
st_record_outcome(path, outcome, request, failure = NULL, alias = NULL)
st_read_sidecar(rel_path, alias = NULL, version_id = NULL)
st_prune_versions(path = NULL, policy = Inf, dry_run = TRUE, alias = NULL)
st_load(file, format = NULL, version = NULL, verbose = TRUE, alias = NULL, ...)
st_load_version(path, version_id, verbose = TRUE, ..., alias = NULL)
```

Source signature locations: `R/IO_core.R:244-260,588-595,1137-1139`; `R/rebuild.R:193,454-460`; `R/version_store.R:469-475,1292`; `R/execution_state.R:746,840-841`; `R/format_registry.R:456`; `R/retention.R:112-117`. Exports are in `NAMESPACE:13,21,24-25,30-34,38-39`. Request/schema arguments after `...` in st_save, and alias after `...` in st_load_version, require exact names.

### Request And Currentness

Self-contained contract from `man/st_plan_rebuild.Rd:20-36,49-80`:

- A request is a named list with exactly required schema=1L, path, root, parents, required_components, components, semantic_schema, semantic and format; only audit/review are optional. Unknown/duplicated fields reject.
- Parents are unnamed path/version_id records; empty parents require root TRUE. Effective pins are exact. NULL pins only represent selected deferred preview recipes and cannot certify success.
- Components exactly cover declared unique IDs including calculation; descriptors contain hash, algorithm and schema. siphash13 uses 16 lowercase hex characters, sha256 uses 64. Caller must include all known result-affecting helpers/constants/rules; stamp does not discover hidden closures. Audit source strings and review are excluded from equality.
- Complete valid requests may recover absent legacy proof; corrupt/contradictory modern proof blocks. Missing requested proof does not become equality. Legacy no-request parent inspection is not full modern currentness.
- Plans retain run/skip/blocked rows and columns level/path/reason/latest_version_before plus request list-column, request_id and receipt_id. Include targets explicitly when needed; default include_targets is FALSE. Mode controls the legacy route only. Rebuild revalidates candidates after actual upstream results.

`R/version_store.R:1278-1305`: request-aware st_is_stale returns TRUE for run, FALSE for verified skip, and raises stamp_blocked_request for blocked; it neither invokes builders nor writes state. `man/st_should_save.Rd:21-43`: save comparison is not rebuild selection; blocked proof raises, rather than returning a successful-shaped pin.

### Builders, Outcomes And Receipts

`man/st_rebuild.Rd:16-52` and `man/st_record_outcome.Rd:12-33`:

```text
builder: rebuild_fun(path, parents) -> list(x=..., format=?, metadata=?, code=?, code_label=?)
rebuild statuses: built, unchanged, skipped, blocked, failed, dry_run
result columns: level, path, reason, status, version_id, msg,
                request_id, receipt_id, outcome_id (request route)
public outcome choices: failed or blocked
failure: list(class=<deterministic|external|unknown>, message=<scalar character>)
blocked facts require class unknown; output is NULL
```

Builder x must appear exactly once, including NULL where the format supports it; fully resolved parents are supplied. Optional builder format must equal the request's identifier, and semantic metadata must match. Only validated successful/reused outputs have a usable version_id; dry run invokes no builder and writes no receipt/outcome.

Public outcome recording cannot publish success or guess a class from a message. Deterministic retry requires changed input/component proof plus the governing failure's review ID; intervening blocks do not reset that failure. External retry is at most one new analyst-started attempt; unknown actual failures block. No Force/internal retry loop is present.

Raw save, including an unchanged save returning a retained pin, is not execution proof. A successful request-aware rebuild can append a new receipt binding new parents while retaining unchanged B1 and original producing provenance. Changed B producing component/semantic/format proof does not receive that bounded cutoff. A satisfied repeat creates neither version nor receipt. These are serial isolated guarantees, not SMB/multiwriter or cryptographic authenticity.

`man/st_execution_info.Rd:12-32`, sanitized result summary:

```text
fields: state, reason, receipt, outcome, version_id, receipt_id, outcome_id
absent: no committed record
invalid: contradictory proof/current storage
recorded: an outcome or historical success without a currently usable pin
success: validated selected success with a usable matching materialization
unavailable records: NULL; unusable IDs/pins: NA_character_
```

Explicit unknown receipt IDs error in a valid store and never fall back to latest. An old success remains inspectable but yields a usable pin only when current materialization also matches its retained output. This accessor inspects proof, not currentness for a new request. Checksums can stream file bytes without invoking an artifact reader.

### Metadata, Version Selection, Formats And Retention

From `man/st_save.Rd:26-45,70-102`, `man/st_read_sidecar.Rd:16-33`, `man/st_load.Rd:40-57`, `man/st_load_version.Rd:30-50` and `man/st_prune_versions.Rd:25-30,76-81`:

- Request format is an exact case-sensitive registered identifier. Omitted save format uses it; an explicit different format errors. Legacy no-request extension/default/override routing stays separate.
- RDS/QS2 support a real NULL payload. CSV/FST/Parquet reject NULL. Explicit NULL in comparison is a value; omit x to leave content unchecked.
- Semantic descriptors contain type (logical/integer/double/character), shape (scalar/vector), required, nullable, allow_na. Scalars have length one; vectors can be empty. Optional absence, explicit NULL, typed NA and empties differ; no coercion/classed/nested values/NaN/infinity. Modern metadata names are unique and avoid stamp-owned keys.
- Semantic schema/value changes create versions even for equal data; descriptive-only unchanged edits do not rewrite sidecars. Typed JSON/QS2/both preserve the declared semantics; required modern counterparts must agree. Legacy JSON-first metadata is not silently promoted to modern proof.
- st_read_sidecar(version_id=<exact ID>) reads only that snapshot and fails without required artifact/metadata; no current fallback. Its NULL version default preserves current-reader behavior.
- st_load(version=NULL) reads current live bytes; 0 selects latest committed snapshot, negative offsets count earlier retained snapshots, positive numbers error, exact IDs select snapshots (apart from interactive directives). st_load_version uses pinned physical format when available.
- Legacy historical data recovery may use extension/default when no readable modern marker identifies the snapshot. That data recovery does not certify execution proof or repair historical metadata. Readable modern markers require strict exact snapshot metadata validation.
- Native RDS/QS2 preserve only original data.table keys via sidecars/snapshots, never inferred from PK/columns/sorted rows. Invalid row-order descriptors abort rather than sorting; legacy missing keys cannot be reconstructed.
- Prune reports protected/reason; committed output/parent/original-ancestry references are protected alias-wide before destructive filtering. Invalid/protected selections refuse before deletion. Receipts have no garbage collection. policy=Inf is a no-op and can return a zero-column empty frame.
- Partition helpers, st_path and st_hash_code are not in the supported exports. This report does not establish arbitrary model/reference-object fidelity; the reference-copy environment pilot remains default off and narrowly scoped.

No pipload or pipdata code/dependency pin was executed against this producer. Adapter format/pinned-metadata round-trips, actual authority reconciliation, V6/L-authority and whole-M2 remain unresolved integration acceptance, not completed work or new stamp implementation approval.

## E9. Scope, Next Action And Non-Empty Gaps

Only handoff.md and evidence.md in the assigned run folder are written. No source/tests/DESCRIPTION/NEWS/generated/lifecycle/canonical deliverable, other handoff, STATE/REQUESTS, roadmap/design/configuration, Git state or release is changed. No helpers, sessions, network, Temp, private state, package execution or tests are used.

Smallest follow-up: coordinator readback of this report; if stronger evidence is needed, separately arrange a permitted sanitized copy of existing October 20 manifest/commands/exits/dependency/archive evidence, where available. Do not manufacture missing evidence or rerun completed tests merely to produce a report. Preserve content pin 5d1ddebdc926dad9c6ec99c08a65e74baee0da92.

The documentation-only NEWS.md change is a distinct candidate-input gap: only if releasing current HEAD is requested should a new explicit approval cover exact-candidate verification and its new archive identity. Optional CRAN/manual/platform/publication work stays separate. No new implementation Plan or runtime integration follows automatically.

Saved-output readback result: PASS. Both handoff.md and evidence.md were read in full after their substantive save; all Required Worker Handoff fields are present in handoff.md and supporting provenance/results/contracts/gaps are present here. The completion checkpoint updates only these two owned files. The stamp closing status matched E1 exactly. The destination scoped status command `git status --short -- <exact handoff path> <exact evidence path>` reported both outputs as untracked; no staging occurred. This does not claim a clean destination worktree or an inventory of other writers.

Gaps:

- Exact clean tested commit at execution time is UNKNOWN; tested-content matching is not the same fact.
- October 20 raw logs/archive/source manifest were not reopened, so inherited evidence remains WORKER-REPORTED here; its separate native exit and complete dependency snapshot remain UNKNOWN.
- Current-HEAD built/checked archive/hash and release readiness are not established.
- Submitted/accepted versions/archives/dates and live remote CI state are UNKNOWN.
- Pipload/pipdata tested pins, V6 and whole-M2 are not established; no adapter integration was run.
- No comprehensive concurrency, SMB, crash transaction, authenticity, hidden-dependency, minimum-R/platform or arbitrary-object guarantee follows from these local results.
- Native session/approval ID and exact approval time, independent writer liveness and REQUESTS registration remain unverified. This reporting approval is not a coordinated implementation assignment.
