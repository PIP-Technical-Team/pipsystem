---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T185509Z-b6-relevance
status: completed
updated: 2026-11-12T21:25:17Z
owner: Code mode B6 first-example relevance assessment
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Relevance assessment complete; any original-example resumption, pin change or B6 investigation requires its own authorization and applicable Plan gates.
---

# B6 First-Example Relevance

## Summary
**The specific three observed B6 assertions do not demonstrate a direct block
to the original example's first initial save and immediate exact-version
readback.** They test a subsequent CPI-triggered second processing call, which
the original scenario does not perform. The first example is NOT certified as
passing, and the three failures are NOT accepted or waived. B6's underlying
cause is unknown, so overlap with first-run correctness or receipt handling
cannot be ruled out. Broader package review/acceptance remains non-green.

## Evidence And Reasoning
- `pipdata/tests/testthat/test-public-metadata-loader.R:97-105` performs a first
  public `pd_process_data()` call, checks a single result and reads the initial
  metadata by its exact saved version. Lines 107-113 then change a survey-year
  CPI input, run the public CPI producer and call `pd_process_data()` a SECOND
  time. Lines 115-117 require the second read to use `metadata = TRUE` and the
  first metadata version; lines 118-124 check stable data pin, new metadata pin,
  old-version readback, input immutability and welfare.
- `pipsystem/.tmp/one-survey/f19/logs/public-reviewed.log:79-113` shows exactly
  three failures, all attached to that second request: actual `metadata = FALSE`
  versus expected `TRUE`, actual clean-version ID versus expected prior metadata
  version, and the full request equality. The file reports 4 blocks, 31 passes,
  3 failures, 0 errors/skips. Both public calls returned; successful return is
  not evidence that the second request selected the right artifact.
- `f19/logs/diagnose-selection.log:26-47,52-74` observed initial metadata
  `new_entity`/reconstruction and later `aux_cpi_changed` plus `output_missing`,
  missing metadata version/hash and reconstruction. The same capture also shows
  clean `output_drift` during the initial action. This is an observed planning
  signal, not an established root cause or a demonstrated wrong first result.
- The actual original `pipsystem/experiments/one-survey/scenario.R:116-125`
  writes fixture-only auxiliary inputs once and validates; lines 139-158 make
  one processing call and immediately read its returned clean and metadata pins.
  Lines 162-179 require aligned welfare/weight values, metadata survey ID/CPI/
  PPP, total weight and no malformed-survey outputs. There is no post-save CPI
  update, second processing call, or later historical metadata refresh in this
  scenario. Both initial metadata generation and later refresh use shared
  package machinery (`pipdata/R/pd_metadata_refresh.R:53-77,80-126`), so shared
  mechanics must not be mistaken for proof the same defect cannot affect it.
- The original Plan explicitly asks for initial documented-path save and exact
  saved-version readback at `.../plans/2026-11-09-installed-package-one-survey-example.md:46-53`;
  line 64 says single-version readback does not prove historical selection after
  a later save, and line 78 places incremental-rebuild certification out of scope.
  This distinguishes example scope from the still-failing broader package test;
  it does not authorize a test waiver or bypass Plan review requirements.
- Supporting, not original-example acceptance: `f20/upstream.R:105-133` uses
  real public setup/validation/processing and reads exact first clean/metadata
  pins, checking cleaned welfare/weights. `f20/logs/upstream.log:19-27` and
  `f20/logs/final-expanded-audit.log:1-14,28-29` retain completion and source
  versions; B5 handoff:175-188,217-236 documents certified synthetic parent
  lineage and 197 blocks/1552 expanded assertions. Its fixture/release and
  installed package candidate differ from the original scenario/approved
  immutable source combination, and it does not run the original malformed
  control or all scenario metadata assertions. It is not the original V2-V4 pass.
- Actual original pinned example remains blocked at the earlier context failure:
  `pipsystem/.tmp/one-survey/n11/first-failure.txt:1-2`; the prior work report
  `.../work-reports/2026-11-09-installed-package-one-survey-example.md:139-154`
  records validation completed but exact clean/metadata readback not reached.
  Pending local package fixes are uncommitted and not an approved immutable pin.

## Changes
- Created only this requested E: relevance handoff. No package/test/Plan/pin,
  Git, pipeline state, previous report, shared/production or runtime data edits.
- No implementation, package installation, test execution, full survey or
  acceptance waiver. Minimal first: the bounded dependency question only.

## Checks run
- Read-only `git rev-parse --show-toplevel`, `git status --short --branch` and
  `git rev-parse HEAD`: root `E:/PovcalNet/01.personal/wb384996/PIP/pipdata`,
  existing `PROD`, HEAD `c5b27fa4458d7175aca81a203762bae81e9f0b40`, twelve
  pre-existing pending paths, branch ahead of origin/PROD by one. No switch.
- Read complete requested B5 handoff, scenario and Plan; inspected actual failing
  test, retained failure/selection/producer/audit logs, relevant package call
  branches and original work-report checkpoint. No retained evidence was rerun.
- Report destination validated on E:; system clock 2026-11-12 4:25 PM EST
  (machine-readable report timestamp above is UTC).

## Gaps
- No proof that the original scenario passes with an approved immutable source
  combination: its last recorded run stopped before V3 exact readback. The
  separate f20 candidate and synthetic example do not establish V2-V4 acceptance.
- The root cause and reach of `output_missing`/`output_drift` are unestablished.
  The fact that the initial action also displayed `output_drift`, and that f20
  source/consumer metadata objects compared identical while their recorded hash
  strings differed (`f20/logs/audit-source-links.log:15-26`), leave a plausible
  but unproven receipt/hash risk. Neither observation proves a wrong first-save
  result or that the refresh failure is harmless to every first-run input.
- No subsequent historical-pin selection, incremental-refresh correctness,
  broader package green status, malformed downstream rejection, or original
  Plan V1-V5 completion is claimed. Existing three B6 assertions remain failed.
- No exhaustive OS-write audit, new test execution, branch switch, commit or pin
  change. This relevance assessment does not authorize a future run or acceptance.
