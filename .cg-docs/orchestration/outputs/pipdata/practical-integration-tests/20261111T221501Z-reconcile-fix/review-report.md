---
date: 2026-11-11
depth: data-risk
type: standard
plan: null
findings:
  P1.B2: fixed
  P2.1: fixed
---

# B2 Review

## Status
All eight routed data-risk roles returned usable independent reports, read by
the coordinator. No source/test defect found in the bounded new delta. One P2
evidence-scope ambiguity corrected through explicit provenance labels, without
overwriting historical records or changing executable code. Final light verify
complete, no new supported findings (verify-review.md). B1 real public preparation
and expanded gate are separate pending checks.

## Scope
Only R/reconcile_pip_inventory.R:23-25 and the three added tests at
tests/testthat/test-reconcile-pip-inventory.R:77-127 compared with r13/baseline.
Prior context fix and original full/light reports are preserved, not reopened.
Data-risk route follows the canonical join/inventory risk taxonomy, with testing,
data-quality and reproducibility emphasis. No new public API or durable schema.

## Findings
- **P1.B2 fixed:** carried-forward missing-pip_id clean checkpoint defect. The
  recorded installed baseline directly reproduces old=0 rows/0 columns joined
  to keyed verified result rows. Three local initialization lines give only
  zero-length character join keys to a columnless prior after receipt/output
  validation. Existing typed/nonempty/history/error paths are untouched, no
  stored fake master/observation or catch/fallback. Red exact native error is
  eliminated by the installed candidate's same frozen test (20/66), with
  typed-empty/error controls and all affected checks (130/616) passing.
- **P2.1 fixed [manual]:** version-control report identifies differently hashed
  `final-source-sha256.tsv` / `affected-final-test-sha256.tsv` in r13. These are
  deliberately preserved c11 pre-B2 copies from run.ps1, not current B2 source or
  executed tests. Added r13/logs/provenance-index.tsv and explicit handoff scope
  labels. Current B2 authority is candidate-source-sha256.tsv plus red/green/
  affected-test-sha256.tsv. No all-manifests-identical claim, historical overwrite,
  source change or test weakening. Audit confirms copied c11 bytes and current
  candidate/checkout/test identities in their distinct scopes. Reporter findings
  are retained verbatim; this consolidation records the resolution.

## Independent Reports
All are pip-handoff-v2 under this new run, with nonempty Gaps and explicit limits.

| Role | Report | Result |
|---|---|---|
| Code quality | review-code-quality/handoff.md | No issues |
| Testing | review-testing/handoff.md | No issues |
| Data quality | review-data-quality/handoff.md | No issues; evidence-scope gap addressed by P2.1 |
| Reproducibility | review-reproducibility/handoff.md | No issues; inherited manifest scopes recognized |
| Documentation | review-documentation/handoff.md | No issues |
| Version control | review-version-control/handoff.md | P2.1 resolved above |
| Performance | review-performance/handoff.md | No issues |
| Architecture | review-architecture/handoff.md | No issues |

## Checks Run
- Runtime r13: installed baseline matches recorded pre-B2 function; proof captures
  original join error/frame before editing. Red20 blocks/61 passes/1exact error,
  green20/66 and affected130/616 with zero failures/errors/skips. The twelve added
  assertions cover exact fresh rows/tombstones, typed-empty fields and propagation
  of malformed-history errors. All pre-existing assertions remain unchanged.
- Candidate constructed from frozen c11 baseline and only the two B2 owned files;
  unchanged payload file hashes checked. No dirty-tree installation, dependency
  resolution or ambient library fallback. CSS-copy help warning retained.
- r13/logs/provenance-audit.log and evidence/provenance-audit.rds validate
  serialized result totals, current hashes, identical new-test manifests, and
  exact preserved c11 historical-manifest copies (separate scope, not current).
- git diff --check passes. No get_errors/execution_subagent available; no claimed
  Problems/Pester result. No original full survey or full R CMD check performed.

## Gaps
- Reviewers independently inspected source/diffs and retained evidence, not
  independently executed R/tests or binary-evidence decoding. Coordinator's
  actual executions/audit are retained separately, not attributed to reviewers.
- Final light code-quality/testing mode:verify complete. No fixed finding skipped;
  no P0/P1 or cross-file issue suppressed. No source/test correction was needed
  after independent review; P2.1 changes only evidence labeling.
- Public durable parent preparation, same-store exact readbacks and unchanged
  expanded numerical/control assertions still must run after verification.
  Unit/affected green is not a waiver or original survey acceptance.
- E-only child settings are observed/configured, not an exhaustive OS audit.
  Original report/pins, context changes, Git and shared/production state untouched.
