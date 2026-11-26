# B4 Data-Risk Review

## Scope
NEW B4 only, existing pipdata PROD, E:/PovcalNet/01.personal/wb384996/PIP/pipdata,
HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40. Compare to m17/baseline.
R/pd_metadata_refresh.R corrects both load_pip_data callers to explicit id_name,
unchanged exact version, metadata FALSE(clean) or TRUE(metadata), no alias.
Existing test-pd-metadata-refresh.R and one test-pd_process_data.R mock now use
the real public signature and stronger named ID/version/kind assertions. New
test-public-metadata-loader.R is a real two-phase public regression. All six
prior context/B2/B3 source/test hashes remain unchanged; do not reopen reviews.
Resolved route data-risk:8 standard roles, testing/data/repro emphasis.

## Contract And Actual Results
- m17/logs/proof.log and evidence/pinned-public-contract.rds compare actual
  installed public loader formals/body with exact retained pipload4ef0d90a974cb6ff0725da69373bde421dd04ad5
  source. First argument country_code, explicit id_name/version, metadata default
  FALSE selecting pip_data vs pip_metadata, no alias/dots; version forwards to
  pip_read. No other-package edit or caller-side wrapper.
- Final candidate is frozen B3 snapshot plus ONLY4 B4 files, not dirty-tree install.
  m17/candidate-verified, logs/candidate-verified-source-sha256.tsv are current.
  baseline-source is pre-B4; candidate-first/candidate manifests are historical.
- source SHA b746cdd5f751e37f5be1b395c7c419765ac727b5d8d1b2f61ec78d5adc3a74cd;
  metadata unit test855333782ca84ce9cccc9a8b76ca44ed561d6a16c5237b65f484eb67a661c999;
  adapter unit testb5f6b490d2cfc34f472f3bf5716184ee32ee1857eef10f89f747309ac1909513;
  public test2cf0311e032ea9154da97671b9e09b9e4144e6337cf67549d7feb2fcc91998ff.
- Final frozen red-verified:13blocks25passes0assertion-failures5 old alias errors,
  zero skips; explicit old installed package from baseline-library. Covers both
  callsites in strengthened unit contracts and first actual public reconstruction.
- Candidate metadata-unit:12blocks37passes0fail/errors/skips. Both callers'
  named-ID/version/kind, existing hashes/strictness/fallback/error tests retained.
- Candidate public: actual reader accepts explicit ID, NULL country filter,
  pinned data version, metadata FALSE;4 passive entry assertions pass, plus
  validation assertion. Does NOT reach post-return or metadata-only phase because
  an independent strict fingerprint fence aborts. NO all-green/public acceptance.
- Final affected-verified:146blocks671passes0assertion-failures3 B5 errors0skips.
  The B3 public two cases +new public case fail at the same unchanged strict fence.
  No successful-return assertions removed; no alternate narrowed green result.
- Intermediate first-call-only install was intended to expose second alias
  independently but hit B5 first. No claim second callsite executed in real public
  flow. Its executable unit contract passes; actual public refresh/version-kind
  proof remains BLOCKED, explicitly report that residual gap.
- B5 passive diagnosis logs/diagnose.log and evidence/fence-diagnostic-1.rds:
  contexts identical, ZERO differing component hashes; only difference is
  snapshot fingerprint components' data.table secondary index [stage]. Existing
  R/dependency_execution.R:945-949 uses identical() on the full object and aborts.
  Untraced preserved B3 tests reproduce it (first-untraced.log), so it is not
  solely the new reader trace. Guard/index options/code not changed or bypassed.
- New real public test uses exported setup/aux producers/acquisition/validation/
  processing, transport-only substitutions. Passive public loader observer does
  not replace workers/returns; observes exact arguments before read. Country/pop/
  GDP/PCE remain declared fixtures. Planned CPI-only refresh makes real producer
  input change and asserts pinned old metadata remains readable, clean pin stable,
  caller immutable and welfare income. These later assertions are not reached on
  B5, not skipped/waived or falsely claimed passing.

## Constraints And Output
Read-only review; no implementation/R/tests/scripts. Read-only Git/Get-Date allowed.
Load pl-clear-technical-communication, Rtechnical/datatable; testing Rtesting.
ALL direct/indirect writes E: ONLY assigned report in this new run. apply_patch,
pip-handoff-v2 completed UTC clock/UNKNOWN, project pipdata, task practical-
integration-tests, run20261112T025013Z-metadata-loader-fix, repo/fullhead above,
branchPROD,owner role,planNONE,next; Summary/Changes/Checks run/nonempty Gaps.
Findings P0-P3 file/line/impact/remedy/[safe_auto]/[manual]/[advisory], or explicit
no new issues in named B4 files. Retain OPEN/manual B5 +real second-path gap.
No API/worker mock added to real regression, no master/pointer fabrication,
historical catalog rewrite, strict-fence relaxation, datatable index-option hack,
downloads, other-package edits, Git mutations, Plan/pin changes, original full
survey, shared/production writes, new Agent Manager sessions/worktrees. No prior
reports changed. get_errors/execution_subagent unavailable, no invented result.
Never propose deleting/replacing/renaming/moving protected .cg-docs/brainstorms/,
solutions/,archive/,compound-gpid.md,compound-gpid.local.md,roadmap.json,
SCHEMA_VERSION,.github/. No generated HTML body reads. Minimal first: smallest
complete fix; safeguards only almost-irreversible; one functional check/change;
installed deps only when worthwhile; Plans about2pages. Return report/findings/
limits and exact blocked acceptance, never certify green from these results.
