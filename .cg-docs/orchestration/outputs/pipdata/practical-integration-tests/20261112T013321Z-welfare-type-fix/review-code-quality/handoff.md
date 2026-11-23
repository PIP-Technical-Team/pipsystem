---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T013321Z-welfare-type-fix
status: completed
updated: 2026-11-12T02:19:05Z
owner: Independent B3 code-quality reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Retain manual out-of-scope B4 acceptance blocker; review completion does not authorize broader fixes or waive failed integration gates.
---

# Independent B3 Code-Quality Review

## Summary

No new actionable P0-P3 code-quality issues identified in the bounded B3 delta:
`R/pd_process_data.R:321-324` and
`tests/testthat/test-public-clean-welfare-type.R:1-124` (brief describes 123 lines;
the current numbered read includes the closing line at 124). Reviewed against
`w15/baseline`, not by reopening the four preserved context/B2 files.

The review is completed; candidate acceptance is BLOCKED. Frozen evidence is
red 8 passes/4 failures, candidate 10 passes/2 late B4 errors, and affected
132 blocks/626 passes/2 errors. Passing saved-field assertions are not successful
public completion, complete-parent evidence, or survey acceptance.

## Changes

- Created only this assigned report. No source, tests, scripts, pins, prior
  reports, protected artifacts, or Git state changed; no R or test execution.
- Applied minimal-first review: the four-line projection is sufficient under
  existing validation and output-set contracts. No speculative helper extraction,
  additional safeguards, dependencies, or broader implementation proposed.
- Loaded clear technical communication, R technical, data.table, testing, shared,
  and collapse skills; read the R dialect router and test-integrity reference.
  Root `compound-gpid.local.md` was absent, so router default
  `data.table-collapse` applies. Protected artifact rules remain intact.

## Checks run

### Read-only source and contract inspection

- Read run `review-brief.md` and `handoff.md`; checked read-only Git diff,
  status, full HEAD and branch. Existing checkout is PROD at the stated HEAD;
  scoped tracked diff is exactly the four added projection lines. Read baseline
  `w15/baseline/R/pd_process_data.R:278-338` for comparison.
- `R/pd_process_data.R:282-289` validates clean objects before projection;
  `R/pd_dlw_clean.R:665-672` requires a scalar character welfare attribute equal
  to income or consumption. `R/dependency_inputs.R:609-620` enforces the complete,
  uniquely named clean/metadata output set against accepted IDs. Thus typed
  `vapply(..., character(1L))` is supported by existing preconditions.
- The new assignment at `R/pd_process_data.R:321-324` matches each receipt's
  `pip_id` to its clean object, rather than recycling list order or parsing ID
  text. It executes after the inventory join and overrides any inventory welfare
  value. Existing `copy(inv_row)` at line 307 keeps caller inventory separate.
  No fallback, condition suppression, strict-key change, or new mutation of
  clean objects is introduced. `R/pd_aux_attr.R:34-39` extracts attributes rather
  than supplying an alternative welfare source.
- Read the whole new public test and referenced fixture declarations/identity/raw
  auxiliary inputs as context. Tests invoke exported setup, auxiliary producers,
  acquisition/validation and processing; transport mocks do not replace the clean
  worker or inject clean/master results. Supporting country/pop/GDP/PCE fixtures
  are explicitly labeled. Deferred cleanup restores captured package environments,
  options and environment variables. No `.pipaux` working-release state is seeded
  by the new test; its actual cached branch is checked by transport.
- `test-public-clean-welfare-type.R:90-100,118-124` covers absent and conflicting
  inventory values, hard-coded expected income, saved clean/master reads and
  input immutability. Lines 104-115 turn the known strict-key condition into a
  failed no-condition assertion, while unexpected errors run boundary checks
  and rethrow. Neither path accepts a downstream error as success.

### Existing execution evidence inspected, not independently rerun

Runtime root: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/w15`.

- `logs/proof.log:24-28`: passive baseline diagnostic records trusted PFW,
  validated clean and metadata income, but receipts and one-row master omit
  welfare_type. Binary RDS evidence was not decoded in this read-only review.
- `logs/red-final.log:45-92`: two scenarios, 8 passes, 4 intended assertion
  failures, 0 errors, 0 skips. Master welfare is NULL; captured strict-key error
  fails the no-condition expectation. This is discriminating baseline evidence,
  not a tautological test.
- `logs/green-final.log:42-100`: two scenarios, 10 passes, 0 assertion failures,
  2 errors, 0 skips. Late `unused argument (alias = "pip")` errors escape;
  successful public-return assertion is not reached. This is NOT green.
- `logs/affected-final.log:71-127`: 132 blocks, 626 passes, 0 assertion failures,
  2 identical B4 errors, 0 skips. Read summary/evidence only; did not re-review
  prior context/B2 source or tests.
- Read `logs/final-candidate-source-sha256.tsv`: source entry at line 158 is
  `a5b7bac456507fb9cc2aa1c4dae17ff1813bdf7862ed3bbe2de9dea624d0cb1c`;
  new test at line 244 is
  `2d9f59fd3c602f8c481c93b9f229de6a84bb7cfa5741d4c0bdc14890bb1de503`.
  Logs report installed worker match and four preserved files unchanged. These
  are inspected provenance records, not independently recomputed SHA256 values.
- Verified report destination ancestors exist on E: and are not reparse points
  before writing. Clock read produced UTC timestamp above. Initial PowerShell
  5.1 `Get-Date -AsUTC` was unsupported; corrected with `ToUniversalTime()`.
  Neither clock command executed tests or changed files.

## Findings

No new actionable issues in the named B3 source/test delta. The following is a
retained known blocker, not a newly discovered B3 defect or permission to fix it:

**[P1]** `R/pd_metadata_refresh.R:63-67,101-103` -- Existing loader API mismatch
blocks public metadata completion. **[manual]**

**Issue**: Calls pass unsupported `alias` and positional `pip_id` to
`pipload::load_pip_data`. Public formals in
`E:/PovcalNet/01.personal/wb384996/PIP/pipload/R/load_pip_data.R:48-65` have no
`alias` or dots, take `country_code` first, and expose `id_name` and `metadata`.
Frozen candidate and affected logs show the resulting two errors; therefore
neither integration gate can be accepted.

**Fix**: Retain B4 for a separately authorized API-alignment decision using the
actual pinned loader contract and subsequent verification. Do not change these
calls, another package, pins, tests, error expectations, or acceptance criteria
under B3. No automatic fix is authorized or applied.

## Gaps

- B4 remains a manual, out-of-scope acceptance blocker. No waiver, all-green
  claim, successful-public-return claim or complete-parent/survey acceptance.
- Source inspection and existing log review only: no independent R/test/script
  execution, package installation/check, Problems diagnostics, Pester, or binary
  artifact decoding. `get_errors`/`execution_subagent` are unavailable; no results
  for them are fabricated.
- New scenarios exercise one income artifact under absent/conflicting inventory
  input; they do not independently execute multiple mixed-welfare outputs or
  reordered clean lists. ID matching was assessed statically against existing
  output-set preconditions, not as additional runtime coverage.
- Complete current-parents and expanded acceptance evidence are not established
  by this review. The brief reports them pending; saved clean/master assertions
  and historical counts cannot substitute for them.
- No exhaustive storage/process audit or independent manifest hash recomputation.
  Only this assigned E: report was created; earlier context/B2 review outcomes,
  original Plan/pins and protected artifacts were not reopened or altered.
