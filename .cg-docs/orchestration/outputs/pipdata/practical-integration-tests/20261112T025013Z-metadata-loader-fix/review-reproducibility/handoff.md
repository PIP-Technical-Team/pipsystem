---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T025013Z-metadata-loader-fix
status: completed
updated: 2026-11-12T13:03:55Z
owner: cg-reproducibility independent B4 data-risk reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator retains OPEN/manual B5 and real second-path acceptance gaps; this completed review does not authorize implementation or certify public acceptance.
---

# Independent B4 reproducibility review

## Summary
No new supported P0-P3 reproducibility issues found in the four named B4 files:
R/pd_metadata_refresh.R, tests/testthat/test-pd-metadata-refresh.R,
tests/testthat/test-pd_process_data.R, and tests/testthat/test-public-metadata-loader.R.
The explicit ID/version/artifact-kind changes match the retained pinned public
loader contract. Review completion is not public-workflow acceptance: the final
affected selection has 146 blocks, 671 passes, zero assertion failures, three B5
errors and zero skips. The actual second metadata-only phase remains blocked.

## Changes
- Created/checkpointed only this assigned report. No implementation, R, tests,
  scripts, earlier reports, protected artifacts, Plan, pins or Git state edited.
- Read the run review brief and existing handoff; loaded technical communication,
  R technical, data.table and R testing skills before reviewing R code.
- Applied Minimal First: read-only evidence review plus one report readback;
  no new scaffolding, dependency, safeguard, branch, session or worktree.

## Checks run
All runtime references below are relative to
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/m17.

### Checkout and frozen scopes
- Read-only Git confirmed existing PROD and full expected HEAD. Pending changes
  consist of the six preserved context/B2/B3 files and four B4 files. No prior
  review was reopened or rewritten.
- Compared complete baseline-source, candidate-first-source, candidate-source
  and candidate-verified-source SHA256 manifests with git diff --no-index.
  Baseline is PRE-B4 B3, not the clean Git tree. First snapshot changes metadata
  source/unit test and introduces the first public test. First-to-candidate changes
  source to both-callsite fix and public test to final observer assertions.
  Candidate-to-verified changes ONLY the obsolete adapter mock test. No other
  manifest entries change, including all six preserved files.
- Current authority is candidate-verified plus
  logs/candidate-verified-source-sha256.tsv. Earlier candidate/first manifests are
  historical, not interchangeable final proof. Recorded final SHA256 values:
  source b746cdd5f751e37f5be1b395c7c419765ac727b5d8d1b2f61ec78d5adc3a74cd;
  metadata unit 855333782ca84ce9cccc9a8b76ca44ed561d6a16c5237b65f484eb67a661c999;
  adapter unit b5f6b490d2cfc34f472f3bf5716184ee32ee1857eef10f89f747309ac1909513;
  public 2cf0311e032ea9154da97671b9e09b9e4144e6337cf67549d7feb2fcc91998ff.
- All four checkout files have no content diff against candidate-verified.
  Final red-verified-test-sha256.tsv and affected-verified-test-sha256.tsv have
  no diff across the entire test manifest. check.R:30-41 additionally hashes all
  test files before/after each run and persists results. git diff --check passes.
  These are independent content/manifest comparisons, not a fresh SHA256 audit.

### Installed API, source build and unchanged guards
- Inspected proof.R:9-32 and proof.log:1-51. The retained executed proof compares
  actual exported installed pipload loader formals and deparsed body to retained
  n11 pinned source and records evidence/pinned-public-contract.rds. It asserts
  first argument country_code, named id_name/version/metadata, no alias/dots,
  metadata default FALSE and six preserved file hashes. pins.tsv:4 records exact
  pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5.
- Read retained loader source load_pip_data.R:54-152: explicit id_name avoids
  inventory search; FALSE chooses pip_data, TRUE pip_metadata; registered alias
  lookup remains internal; version forwards unchanged to pip_read.
- Compared baseline-to-final source and both existing test diffs. Production
  changes only two caller selectors, retaining exact receipt versions and existing
  hash/schema/fallback/fence checks (pd_metadata_refresh.R:63-77,101-124).
  Updated mocks now reject unsupported alias and assert NULL country filter,
  explicit ID, exact version and metadata kind; previous assertions remain.
- install.R:8-28 copies frozen baseline, overlays only four owned files, verifies
  all unowned hashes, records a manifest, then R CMD INSTALLs the snapshot path.
  It never installs the dirty checkout. install-verified.log:1-25 confirms source
  staged install and successful temporary/final package loading. Missing R.css
  copy warning is retained, not a hidden successful full package check.
- check.R:9-29 explicitly loads baseline-library for red-verified and compares
  installed metadata worker bodies to baseline; candidate-verified bodies are
  checked for affected-verified. Apparent candidate-verified source references
  inside red stack traces do not override that explicit body/library proof.

### Results and real public boundary
- Inspected red-verified.log:32-88: 13 blocks/25 passes/zero assertion failures/
  five unsupported-alias errors/zero skips. Both callsites fail strengthened unit
  contracts; real reconstruction fails old alias. Red wrapper success explicitly
  does not mean suite success.
- metadata-unit.log:1-7 records historical candidate 12 blocks/37 passes with no
  failures/errors/skips. Candidate-to-verified source and metadata test are
  unchanged, and affected-verified includes the same 37 passing assertions.
- affected-verified.log:103-189 records three snapshot-stale errors (two preserved
  B3 public cases and new public case), then 146/671/0 failures/3 errors/0 skips.
  Harness fails rather than turning errors into green acceptance.
- Read the complete new public test. Only GitHub/DLW transport is substituted;
  exported setup, CPI/PPP/PFW producers, acquisition, validation and processing
  execute normally. Supporting country/pop/GDP/PCE values are declared fixtures.
  trace at test-public-metadata-loader.R:83-97 observes actual loader entry without
  replacing its return or workers. Four entry assertions plus validation pass
  before first pd_process_data call at line 98 aborts. No later assertions removed
  or skipped; lines 99-123 cannot be claimed executed.
- diagnose.log:31-42 reports identical contexts, zero changed component hashes,
  and only a data.table [stage] secondary index difference in fingerprint
  components. This is historical first-candidate diagnosis, not final green
  evidence. Existing strict guard and index behavior were not bypassed by B4.

### E-only execution configuration
- run.ps1:4-37 sets E: root and process-local TEMP/TMP/TMPDIR, HOME/R_USER,
  profile/config/cache/XDG paths, libraries, R_HOME, history, Makevars, renv/pkg
  caches, OAuth caches and private stores before launching children. --vanilla,
  disabled user/site settings and private libraries prevent ambient fallback.
  Paths helper rejects reparse/hardlink redirects. install.R sends install output
  to the private E: library, not a production store.
- child-startup.log includes candidate-first/candidate/candidate-verified install
  children, staged load children, private E: libraries and temporary scripts.
  Final red/affected logs show E: temp/library locations. dependencies.tsv is
  inherited n11 origin/version evidence, NOT a claim its old paths are current
  m17 runtime paths. No downloads/resolution introduced by B4.
- Before report creation, checked existing output-run directory and every ancestor
  for reparse points; none found. All reviewer-authored writes are this E: report.
  UTC completion clock above was read from system clock (08:03:55 EST locally).

## Findings
No new supported P0-P3 issue in the four named B4 files within this independent
reproducibility scope. Existing B5 and unexecuted real second-path proof remain
OPEN/manual limitations below, not waived issues or requests to modify protected
artifacts. No broader environment-lock/replication migration proposed for this
bounded existing-library run.

## Gaps
- OPEN/manual B5: R/dependency_execution.R:945-949 full-object fingerprint guard
  aborts despite the recorded identical contexts/component hashes and index-only
  diagnostic. Final affected run remains three errors, not all green. This review
  neither fixes nor relaxes that guard; coordinator must retain the blocker.
- Actual metadata-only second call at test-public-metadata-loader.R:113 and its
  exact old metadata version/kind assertions, clean-pin stability, old-version
  readability, caller immutability and final income assertions remain UNREACHED.
  Unit 37-pass cannot establish that public behavior or metadata publication.
  Intermediate first-call-only attempt hit B5 before second alias; it is not real
  second-path red proof. Complete-parent preparation/expanded gate/full survey
  acceptance is not established here.
- Review used existing text logs, manifests and source, plus read-only Git and
  clock/path inspection. No R/scripts/tests/install/build executed, no binary RDS
  deserialization or independently rerun installed-API proof, no fresh cryptographic
  rehash or exhaustive OS write tracing. Retained RDS contents are supported by
  their writer/logs, not newly decoded by reviewer. Cross-machine recreation from
  lockfile alone and full session/system dependency audit are outside this scope.
- E-only redirects are supported configuration/child-log evidence, not proof of
  every OS-level indirect write. Kilo automatic runtime output exception remains
  distinct. get_errors/execution_subagent unavailable; no invented verification.
- Prior six fixes and prior reviews remain preserved; protected orchestration,
  brainstorm/solution/archive/config/schema/GitHub artifacts were not changed.
