---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T025013Z-metadata-loader-fix
status: completed
updated: 2026-11-12T13:04:27Z
owner: cg-architecture independent B4 public-contract review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator consumes completed B4 review; B5 and real second-path acceptance remain OPEN/manual, outside this review.
---

# B4 Architecture / Public Contract Review

## Summary
No new supported P0-P3 architecture/public-contract issues found in these four B4 files against m17/baseline:
- R/pd_metadata_refresh.R
- tests/testthat/test-pd-metadata-refresh.R
- tests/testthat/test-pd_process_data.R
- tests/testthat/test-public-metadata-loader.R

Both production calls now use the pinned exported API with named id_name, unchanged exact version, and explicit metadata selection. No caller-side wrapper, positional country-code misuse, worker replacement or fence bypass was added. Review completion is NOT public acceptance: B5 and the unexecuted real second refresh remain OPEN/manual. The six earlier context/B2/B3 fixes remain closed, not re-reviewed as new work.

## Changes
Only this assigned E: report created, checkpointed and completed. No implementation, scripts, tests, dependency pins, protected artifacts, prior reports or Git state changed. No commit, branch/worktree/session creation, download or installation.

Minimal first applied: bounded review of the smallest existing caller fix, no new abstraction or safeguards, dependencies, Plan, scope expansion or out-of-scope B5 fix proposed. Almost-irreversible safeguards only; one functional check per change; installed dependencies only when worthwhile; Plans about two pages. Protected artifact paths in the brief remain untouched.

## Checks run
### Scope and provenance
- Read this run's review-brief.md and coordinator handoff.md and orchestration/CONTRACT.md:34-76. Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable and cg-skill-r-testing before source review.
- Read-only Git commands confirm existing PROD and HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40; status matches the ten pending source/test files, comprising six preserved earlier files plus four B4 files. No Git mutation.
- Compared the three modified files to m17/baseline and read all 124 lines of the new public test. Whole baseline-to-candidate-verified Git no-index stat reports exactly four files, 158 insertions and 24 deletions. m17/install.R:8-24 copies baseline then overlays only these four, hashes unchanged files, and records candidate-verified authority before install. install-verified.log:1,9-25 records successful staged/final package loading with retained CSS-copy warning, not a silent clean-install claim.
- Independently recomputed current B4 SHA256 values and compared each with candidate-verified: all equal. Values match candidate-verified-source-sha256.tsv:157,230,235,245:
  - Source b746cdd5f751e37f5be1b395c7c419765ac727b5d8d1b2f61ec78d5adc3a74cd.
  - Metadata unit 855333782ca84ce9cccc9a8b76ca44ed561d6a16c5237b65f484eb67a661c999.
  - Adapter unit b5f6b490d2cfc34f472f3bf5716184ee32ee1857eef10f89f747309ac1909513.
  - Public test 2cf0311e032ea9154da97671b9e09b9e4144e6337cf67549d7feb2fcc91998ff.
- All six prior checkout source/test hashes independently equal their baseline counterparts. Fence source has no textual baseline-to-checkout diff and identical normalized Git object hash 21169352ab49446f777a42e750cf77c3e1267f81; its raw bytes differ, so no checkout byte-identity claim is made for that file. Frozen baseline-to-candidate scope remains only the four B4 files.
- Final red-verified and affected-verified test manifests independently have identical SHA256 c1821d831697cea1ac6f61cc3b38c501240b16190717188eba5362120c9d979b. Earlier metadata-unit/public-final manifests match each other but differ from final only in the later corrected adapter mock; they are not presented as identical final-payload runs. The metadata test and public test themselves are unchanged across those manifests.

### Architecture and public contract
- Read exact retained pipload source at n11/sources/pipload/R/load_pip_data.R:54-71,82-112,127-152. country_code is first; id_name/version are explicit formals; metadata defaults FALSE; alias and dots are absent. A supplied id_name bypasses country/inventory discovery; metadata chooses pip_metadata versus pip_data, and version forwards unchanged to pip_read. m17/proof.R:15-32 and logs/proof.log:1-51 record equality of actual installed exported formals/body with that pinned source, not an inferred mock contract. pins.tsv:2-8 retains pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5 and all other specified dependency pins.
- R/pd_metadata_refresh.R:63-77 requests id_name=pip_id, version=action$data_version_id[[1L]], metadata=FALSE; its existing clean hash check and frozen auxiliary reconstruction are unchanged. Lines101-118 request the metadata receipt's exact version with metadata=TRUE; existing metadata hash verification, strict schema validation and explicit reconstruction fallback remain. Lines120-140 retain the same refresh worker, execution fence before receipt write, canonical receipt writer and data-version/hash propagation. No alternative loader, alias adapter, broad error catch, version fallback or storage schema added.
- test-pd-metadata-refresh.R:25-48,61-91,132-188,230-261 now encode named ID/version/kind rather than the obsolete alias contract. NULL country filter is checked explicitly in core paths; data/hash receipt assertions and fallback/error coverage are retained. test-pd_process_data.R:572-585,613-619 aligns its existing unit mock and adds an exact P1/meta-v1/metadata=TRUE request assertion without deleting its validation or saved-value assertions. Existing isolated-unit worker/hash/fence mocks are not newly introduced public-flow bypasses.
- test-public-metadata-loader.R:26-79 uses exported setup, CPI/PPP/PFW producers, catalog acquisition and validation; substitutions are external transport/catalog boundaries. Country/pop/GDP/PCE are declared fixtures at48-59, not claimed as complete upstream production proof. Lines83-97 passively observe the real exported loader's ID, NULL country filter, exact current master receipt version and expected artifact kind; trace does not replace return values or workers and is deferred for cleanup. Processing at98 and113 remains exported pd_process_data. No fake master/pointer, fabricated worker output or strict-fence/index-option bypass is present.
- Planned second phase at107-123 changes a real CPI producer input, requests metadata-only refresh and retains assertions for old exact metadata readability, stable clean pin, changed metadata pin, caller immutability and welfare income. These are reachable test intentions, NOT executed passing evidence under B5.

### Retained execution evidence inspected, not rerun
- red-verified.log:33-87: final frozen tests on explicit old baseline install record 13 blocks / 25 passes / 0 assertion failures / 5 old unsupported-alias errors / 0 skips. This exposes both callsites via executable unit contracts and first actual public reconstruction; not real second-public-path execution.
- metadata-unit.log:1-7: 12 blocks / 37 passes / 0 failures / 0 errors / 0 skips. public-final.log:26-61: 1 block / 5 passes / 0 assertion failures / 1 B5 error / 0 skips; validation plus four real first-entry assertions pass, then processing aborts at test line98 before return or second phase.
- affected-verified.log:103-189: 146 blocks / 671 passes / 0 assertion failures / 3 B5 errors / 0 skips. Both retained B3 public cases and the new B4 public case fail at the same pd_assert_execution_fence -> pd_revalidate_snapshot boundary. No narrowed green result or successful-return acceptance substituted.
- diagnose.log:31-42 reports identical context and zero differing component hashes, with only secondary index [stage] distinguishing fingerprint components. R/dependency_execution.R:945-949 still uses strict full-object identical() and aborts. first-untraced.log:54-115 reproduces the fence in the preserved B3 cases without the new loader trace; diagnosis is not solely attributed to the new observer.
- Read m17/check.R:9-29,34-49: explicit baseline library for frozen reds; installed metadata-worker bodies checked against the selected snapshot; test hashes checked before/after; candidate errors fail the harness. run.ps1:11-37 redirects child temp/home/cache/library/log/output settings to E:. No driver, R interpreter, script, test or original survey executed by this reviewer. get_errors/execution_subagent unavailable; no invented Problems result.
- Initial clock command Get-Date -AsUTC failed on Windows PowerShell 5.1 without changing files; corrected to (Get-Date).ToUniversalTime().ToString(...). UTC completion timestamp above is from the system clock, not inferred from the user timestamp.

## Gaps
- OPEN/manual B5 at R/dependency_execution.R:945-949 remains the full-object/index comparison acceptance blocker. No waiver, guard relaxation, index-option hack, historical-catalog rewrite or out-of-scope fix is authorized or performed. 146/671/3 errors is NOT green.
- OPEN/manual real second-path gap: test-public-metadata-loader.R:99-123 is not reached, including the real metadata=TRUE read, second exact version/kind observations, metadata publication and pin-retention assertions. First-call-only intermediate install also hit B5 before the second alias path; no independent second public red is claimed. Passing units establish caller contract only, not successful real refresh or complete-parent/survey acceptance.
- Binary RDS evidence is not independently decoded; installed-body equality, index-only diagnosis and run counts are retained source/log evidence, not fresh execution by this reviewer. Original full survey, expanded acceptance, OS-level indirect-write audit and complete upstream-parent/public acceptance are not certified.
- Only assigned report writes were initiated, on E:. No prior report or protected artifact was changed. Kilo-managed tool-output/runtime persistence is outside manual report writes; no claim of exhaustive process-write tracing is made.
