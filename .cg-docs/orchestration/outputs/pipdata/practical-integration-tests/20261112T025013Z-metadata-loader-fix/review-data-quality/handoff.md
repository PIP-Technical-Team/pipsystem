---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T025013Z-metadata-loader-fix
status: completed
updated: 2026-11-12T13:03:48Z
owner: cg-data-quality independent B4 data-risk reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator retains OPEN/manual B5 and real second-path coverage gap; no all-green acceptance or guard waiver from this review.
---

# B4 independent data-quality review

## Summary

No new supported P0-P3 data-quality issues found in the four named B4 files:
`R/pd_metadata_refresh.R`, `tests/testthat/test-pd-metadata-refresh.R`,
`tests/testthat/test-pd_process_data.R`, and
`tests/testthat/test-public-metadata-loader.R`, relative to `m17/baseline`.
Review completed does not mean public integration acceptance: B5 remains
OPEN/manual and actual second metadata-only public execution remains unproved.

## Changes

- Created/checkpointed only this report; no implementation, R execution, scripts,
  tests, dependency changes, Git mutations, prior-report edits, or protected
  artifact edits. All intentional filesystem writes are this E: report.
- Scope is the frozen `pipsystem/.tmp/one-survey/m17/candidate-verified` overlay
  against `m17/baseline`, not a dirty-tree installation and not historical
  `candidate-first`/`candidate` manifests. The six prior context/B2/B3 files were
  not reopened for review.
- Applied Minimal First: no speculative extra safeguards or refactor; no proposed
  B5 fix, index-option workaround, worker replacement, or validation relaxation.

## Checks run

These are source/evidence inspections and read-only Git/clock checks, not newly
executed test results.

1. Read the review brief and same-run coordinator handoff. Verified existing PROD
   and full expected HEAD with read-only Git. Read the system clock and timezone;
   `updated` is UTC (local clock uses Eastern Standard Time).
2. Loaded `pl-clear-technical-communication`, `cg-skill-r-technical`,
   `cg-skill-r-datatable`, `cg-skill-r-testing`, and `cg-skill-r-analytical`.
   Root `compound-gpid.local.md` was absent; project glob found none. Followed
   the brief's explicit data.table/package/testing scope rather than guessing a
   different dialect.
3. Compared complete frozen baseline and candidate-verified directories using
   read-only `git diff --no-index`: exactly the four B4 paths differ. Reviewed
   the functional diff and full metadata source/unit/public regression. Raw
   line-ending-sensitive statistics are not functional-change counts. No other
   frozen file differences, including the six preserved paths, appeared.
4. `R/pd_metadata_refresh.R:63-68` passes `id_name = pip_id`, untouched exact
   `action$data_version_id[[1L]]`, and `metadata = FALSE` for clean data.
   Lines 101-104 pass the same named ID, untouched exact metadata receipt
   version, and `metadata = TRUE` for compact metadata. Neither caller supplies
   `alias` or misuses the first `country_code` parameter.
5. Independently read pinned `n11/sources/pipload/R/load_pip_data.R:54-71,82-112,
   127-152`: first formal is `country_code`; explicit `id_name` bypasses inventory
   selection, the boolean chooses `pip_data` versus `pip_metadata`, and exact
   `version` forwards to `pip_read` unchanged. `m17/proof.R:15-25` and
   `logs/proof.log:1-51` record installed/public pinned formals and body equality,
   no alias/dots, and six preserved-file checks. This review did not rerun that
   proof or decode its RDS.
6. Existing exact clean receipt validation at source 54-61, object hash checks
   69-74 and 105-108, requested-measure schema checks, invalid-schema clean
   reconstruction 109-118, and pre-save strict fence 124 remain intact in the
   baseline diff. The fix changes selection, not object contents or safety gates.
7. Unit contracts now distinguish ID from country filter and clean from metadata:
   `test-pd-metadata-refresh.R:25-48,61-91,132-188,230-261` and adapter
   `test-pd_process_data.R:572-583,613-618`. Existing base-field, hash-mismatch,
   schema, fallback, and unexpected-error expectations remain, with stronger
   exact request assertions rather than deletion of previous successful checks.
8. Public regression 46-79 uses exported setup, real auxiliary producers,
   acquisition and validation; country/pop/GDP/PCE are declared fixtures.
   Substitutions are transport-only. Observer 83-97 reads the real exported
   loader arguments and pinned inventory without replacing the loader return or
   any worker. First entry assertions cover exact named ID, NULL country filter,
   exact existing data version, and FALSE clean selection. Later CPI producer
   change, TRUE compact selection, clean-pin retention, readable old metadata,
   caller immutability and income checks at 99-123 remain present but are not
   demonstrated by the blocked run.
9. Read `logs/red-verified.log:32-88`: frozen current tests against explicit old
   baseline package record 13 blocks, 25 passes, zero assertion failures, five
   old-alias errors, zero skips. Both callsites fail their strengthened unit
   contracts; only the first clean reconstruction has actual public red evidence.
10. Read `logs/metadata-unit.log:1-7`: 12 blocks/37 passes, zero failures/errors/
    skips. Read `logs/public-final.log:32-61`: 1 block/5 passes (validation plus
    four first-entry checks), zero assertion failures, one B5 error, zero skips.
    This public log predates the adapter-mock-only final revision; final frozen
    `logs/affected-verified.log:95-189` confirms the same new public 5-pass/B5
    result within 146 blocks/671 passes/zero assertion failures/3 B5 errors/
    zero skips. This is not an all-green suite.
11. Read `logs/diagnose.log:31-42,73`: identical contexts, zero differing component
    hashes, fingerprint components secondary-index difference `[stage]` only.
    Read unchanged `R/dependency_execution.R:945-949`: strict full-object
    `identical()` aborts. `logs/first-untraced.log:50-117` records the same stale
    snapshot condition in both preserved B3 public cases without the new loader
    observer; it is not established as solely a new trace effect.
12. Inspected `logs/candidate-verified-source-sha256.tsv:143-248` and
    `check.R:9-29,37-48`: current authority records the brief's four B4 hashes,
    six prior preserved hashes, frozen installed worker body checks and unchanged
    test-file checks. No fresh cryptographic rehash was performed in this review.

## Findings

No new issues found in the four named B4 files. No silent data corruption,
incorrect-statistics pathway, receipt-version substitution, row-loss change, or
hash/strict-validation weakening is supported by this bounded delta.

Retained blocker, not a new B4 finding: **OPEN / manual B5** at
`R/dependency_execution.R:945-949`. The unchanged fence blocks publication and
public successful return on an index-only fingerprint object difference. Keep
the guard and failed evidence intact; do not treat an unavailable public phase
as passed, skipped, waived, or covered by the green mock-based unit contracts.

## Gaps

- Actual second public metadata-only call at public test line 113 and exact
  TRUE/version assertions 114-116 have not executed: the first processing call
  aborts at line 98 before any successful-return checks. The first-call-only
  intermediate candidate also encountered B5 before the intended second alias.
- Public metadata publication, CPI-driven refreshed values/version, unchanged
  clean pin, old pinned metadata readback, caller immutability, and post-return
  welfare checks remain unverified in this new two-phase test. Unit coverage is
  not actual second-path or full public acceptance.
- B5 is outside this read-only B4 scope and remains OPEN/manual; no guard fix or
  waiver is supplied. Full bounded preparation/expanded acceptance and original
  full-survey acceptance are not certified.
- No R/scripts/tests were executed, no RDS decoded, no new installed-body proof
  or hashes recomputed, and no exhaustive OS write tracing performed. Reviewed
  logs/manifests are retained evidence, not a fresh run. Kilo's own automatic
  runtime output uses its allowed runtime exception. Unavailable get_errors and
  execution_subagent results are not invented.
- Prior reviews, Plans/pins, historical catalogs, protected documentation and
  `.github/` are untouched. No fake master/parent/pointer, shared or production
  store write, download, new dependency, branch/worktree/session, or other-package
  change was made.
