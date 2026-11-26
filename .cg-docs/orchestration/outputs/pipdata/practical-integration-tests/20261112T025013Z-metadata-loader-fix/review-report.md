---
date: 2026-11-12
depth: data-risk
type: standard
plan: null
findings:
  P1.B4: fixed
  P1.B5: open
---

# B4 Scoped Review

## Status
All eight independent data-risk reports completed/read, no new supported B4
source/test finding. Both caller contracts are corrected and unit-verified.
**Acceptance remains BLOCKED by OPEN/manual B5.** There is no all-green public/
affected result and no actual second-public-path proof. Final light verification
complete (verify-review.md); no fence fix, option workaround or acceptance waiver.

## Scope And Findings
- **P1.B4 fixed, scoped contract:** R/pd_metadata_refresh.R:63-68,101-104 now
  calls the actual pinned export with id_name=pip_id, unchanged exact versions,
  metadata FALSE for clean reconstruction or TRUE for existing compact metadata.
  No alias, positional country-code misuse, wrapper, version fallback or new
  schema. Hash checks, base validation, reconstruction fallback and fence unchanged.
- Existing metadata/adapter mock signatures now reflect the real public API and
  assert exact named ID/version/kind/NULL country. All prior field/hash/no-error/
  schema/error assertions remain. The new public test executes actual exported
  setup/producers/acquisition/validation/processing with transport-only inputs
  and passive real-reader argument observation; no workers/returns replaced.
- **P1.B5 OPEN [manual], outside B4:** unchanged full-object identical() fence
  at R/dependency_execution.R:945-949 rejects a snapshot whose context/component
  hash values match but components table acquired a secondary index stage.
  Evidence m17/logs/diagnose.log + evidence/fence-diagnostic-1.rds. The same
  class reproduces in unchanged B3 public cases without new API tracing. No
  mutation to the guard, index options or snapshots is approved or performed.
- Real second metadata-only selection and post-return/pin-retention checks
  remain UNREACHED. The intermediate first-call correction hit B5 before second
  alias; it does not establish independent real second-site red/green coverage.
  Passing unit contracts and first-entry assertions do not close this gap.

## Independent Reports
All are pip-handoff-v2 under this new run with nonempty Gaps. Old context/B2/B3
reports were not reopened or modified.

| Role | Report | Result |
|---|---|---|
| Code quality | review-code-quality/handoff.md | No new B4 issue; B5 retained |
| Testing | review-testing/handoff.md | No new issue; second actual phase gap retained |
| Data quality | review-data-quality/handoff.md | Exact selection/hash/strictness preserved |
| Reproducibility | review-reproducibility/handoff.md | Snapshot scopes and frozen tests verified |
| Documentation | review-documentation/handoff.md | No misleading green/second-path claim |
| Version control | review-version-control/handoff.md | Rehashed252 source entries and all ten owned files |
| Performance | review-performance/handoff.md | Explicit ID bypasses country search; compact selection |
| Architecture | review-architecture/handoff.md | Public contract/owner boundary retained; rehashed owned files |

## Checks Run
- Installed public loader equals pinned pipload4ef0d90a974cb6ff0725da69373bde421dd04ad5
  body/formals before edit, recorded in m17/proof.log and pinned-public-contract.rds.
- Frozen old-baseline red-verified:13 blocks/25 passes/5 obsolete-alias errors/
  0 assertion failures/skips. Both caller unit contracts fail; actual public first
  reconstruction fails. No actual second-public-red claim.
- Metadata-only unit selection12 blocks/37 assertions passes; final affected
  subset confirms same. Actual first public reader passes4 entry assertions plus
  validation, then B5; successful-return checks do not execute.
- Final affected-verified:146 blocks/671 passes/0 assertion failures/3 B5 errors/
  0 skips. Harness exits nonzero. No narrowed replacement green result or skip.
- m17/logs/verified-provenance-audit.log + evidence/verified-provenance-audit.rds
  validate serialized totals, final frozen test bytes, source identities and six
  preserved file hashes; audit success is not public acceptance.
- Final source SHA b746cdd5f751e37f5be1b395c7c419765ac727b5d8d1b2f61ec78d5adc3a74cd;
  metadata test855333782ca84ce9cccc9a8b76ca44ed561d6a16c5237b65f484eb67a661c999;
  adapter testb5f6b490d2cfc34f472f3bf5716184ee32ee1857eef10f89f747309ac1909513;
  public test2cf0311e032ea9154da97671b9e09b9e4144e6337cf67549d7feb2fcc91998ff.
  Authority m17/candidate-verified and candidate-verified-source-sha256.tsv,
  not the historical first/intermediate manifests. No dirty-tree installation.

## Gaps
- OPEN/manual B5 requires separate approval. No true changed-code/changed-context
  rejection may be relaxed merely to clear an index-only failure. No index-option
  hack, fake parents/master, historical-catalog repair or worker bypass.
- Unit mocks are not real second metadata refresh. Public metadata publication,
  second exact version/kind, stable clean pin/old metadata/caller-immutability/
  welfare checks are not reached. No complete-parent/expanded/original-survey
  acceptance, new immutable revision or original pin change.
- Independent review is static source/log evidence, not R/test reruns. Version
  control/architecture independently rehashed files; others did not claim that.
  No exhaustive OS tracing/full package check or unavailable Problems/Pester.
- Final light code-quality/testing verification complete/read; fresh real retry
  follows. All failed intermediate/unit mock mismatch evidence is retained.
