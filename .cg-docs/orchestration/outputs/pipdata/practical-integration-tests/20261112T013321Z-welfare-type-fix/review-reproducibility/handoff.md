---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T013321Z-welfare-type-fix
status: completed
updated: 2026-11-12T02:18:32Z
owner: cg-reproducibility independent B3 reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Retain B4 manual blocker and no parent acceptance; coordinator retains ownership of remaining integration verification.
---

# Independent B3 reproducibility review

## Summary
No supported new P0-P3 reproducibility defect found in the B3 delta:
`R/pd_process_data.R:321-324` and
`tests/testthat/test-public-clean-welfare-type.R:1-124`, compared with
`pipsystem/.tmp/one-survey/w15/baseline` rather than Git HEAD alone.
Review completion is NOT candidate acceptance. Final regression has 10 passes
and 2 B4 errors; final affected selection has 626 passes and 2 B4 errors.
Neither is green. Complete-parent and survey acceptance remain blocked.

## Changes
- Created only this assigned report; no package, runtime, test, Plan, pin,
  historical report or protected artifact changed. No implementation or execution.
- Applied minimal-first review: four-line trusted-attribute projection, one public
  regression file with two scenarios, no new dependency or speculative safeguard.
- Loaded required communication, R technical, data.table and testing skills.

## Checks run
- Read this run's review brief and handoff. Read-only Git confirmed existing PROD,
  full HEAD above, four preserved context/B2 files plus only two B3 files in scope.
  Git no-index baseline/candidate-final diff confirms only the four-line projection
  in the source worker. Projection follows inventory join and exact clean-ID match;
  validated clean attributes, not inventory text, determine welfare_type.
- Reviewed `w15/install.R:3-25`: candidate-final is a baseline copy overlaid only
  with the two B3 files; all other snapshot files checked against baseline before
  installation. Install target is candidate-final, NOT dirty checkout.
  `logs/install-final.log:10-25` records staged/final load checks and DONE, retaining
  an R.css-copy warning. `logs/child-startup.log:13-20` names candidate-final and
  private E: libraries and temp paths for installation children.
- Reviewed `w15/check.R:10-32`: red-final explicitly loads baseline-library copied
  from r14; deparsed installed worker body must equal baseline or candidate-final
  source respectively. All four prior owned files are checked against baseline.
  Final red/green/affected logs each record worker-body match and preserved files
  at line 3. This is recorded execution evidence, not an independent R rerun.
- Manifest scopes are distinct: `baseline-source-sha256.tsv` is inherited PRE-B3
  r14 authority (`run.ps1:45-53`); `candidate-source-sha256.tsv` is first B3 snapshot,
  test b0289f19f6a9613a23c028bc4ba562f4ded6ca37112a6fa60135bf9ecce7d13a;
  `final-candidate-source-sha256.tsv` is final B3 authority. Final source at line158
  is a5b7bac456507fb9cc2aa1c4dae17ff1813bdf7862ed3bbe2de9dea624d0cb1c;
  final test at line244 is
  2d9f59fd3c602f8c481c93b9f229de6a84bb7cfa5741d4c0bdc14890bb1de503.
  All three final test manifests record that test hash at line47. First harness
  red-test hash cd049906... is historical, not frozen final red proof. Four prior
  owned hashes agree in baseline/first/final source records; prior tests also agree
  in final red/green/affected records. Earlier context/B2 reviews remain closed.
- Read-only Git no-index comparisons additionally found no differences between
  the complete final red/green/affected test manifests, or between candidate-final
  and checkout copies of either B3 file. These are content comparisons, not a
  fresh SHA256 recomputation. Git retained LF/CRLF normalization warnings.
- Read `logs/proof.log:24-28`: recorded passive baseline observation distinguishes
  trusted PFW/validated clean/metadata income from missing receipt/master field.
  `.validate_clean_survey` in `R/pd_dlw_clean.R:662-672` enforces the scalar domain
  used by the new vapply. Inspected `logs/pins.tsv` explicitly records the seven
  package HEADs, including pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5.
- `check.R:33-54` hashes tests before/after execution, records results and rejects
  non-red errors/failures/skips. `red-final.log:45-93` records 2 blocks,8 passes,
  4 intended failures,0 errors/skips. `green-final.log:45-100` records 2 blocks,
  10 passes,0 assertion failures,2 errors,0 skips. `affected-final.log:68-127`
  records old context/reconciliation assertions plus 132 blocks,626 passes,
  0 assertion failures,2 errors,0 skips. Wrapper halts on these errors; no waiver.
- Regression reads actual saved clean/master, checks income and inventory
  immutability, and rethrows unexpected downstream errors after boundary checks
  (`test-public-clean-welfare-type.R:93-115`). The known strict-key condition is
  captured only to fail the no-condition assertion. No worker replacement or
  manufactured master; auxiliary/pop/GDP/PCE fixture limits are explicit.
- Reviewed E-only process settings `run.ps1:4-37`: temp/home/user/cache/config,
  R binary/library/profiles/history, renv/pkg caches, stores/logs/manifest and OAuth
  caches are redirected before R launch. Logs show E: libraries/temp/output and
  native QS2 writes. This bounded harness uses copied installed dependencies and
  pinned commit records, not fresh dependency resolution or a new renv restore.
  `experiments/one-survey/paths.ps1:1-33` checks allowed checkout output ancestry
  and rejects reparse/hard-linked source/output paths; reviewed, not executed.
- UTC timestamp obtained from `(Get-Date).ToUniversalTime()`; PowerShell 5.1
  rejected the initial read-only `Get-Date -AsUTC` attempt. No R/scripts/tests run.

## Gaps
- **B4 MANUAL BLOCKER (existing, outside B3):**
  `R/pd_metadata_refresh.R:63-67,101-103` passes positional pip_id plus unsupported
  alias to `pipload::load_pip_data`. Public formals in `pipload/R/load_pip_data.R`
  use country_code/id_name and metadata, with no alias/dots. Final regression
  log46,72 and affected log73,99 retain the actual unused-alias errors. Remedy:
  coordinator must obtain separate B4 authorization, align these calls with the
  pinned public API, then rerun required gates. No such fix or waiver is made here.
- No independently executed tests, binary RDS/installed-function decoding, fresh
  cryptographic rehash, dependency reinstall, full package check, exhaustive OS
  filesystem-write audit, or cross-platform rerun. Body equality and copied pins
  are supported by inspected harness/logs, not independently re-executed proof.
- No complete current-parents.rds or new expanded-test acceptance established.
  Passing saved-field assertions are not successful public return, completed
  parents, or original full-survey acceptance. Historical context/B2/expanded
  counts must not be relabeled as final B3 proof.
- get_errors/execution_subagent unavailable; no fabricated Problems/Pester result.
  Protected documentation/archive/brainstorm/solution/config/roadmap/.github
  artifacts and old reviews were not edited; no generated HTML body read.
