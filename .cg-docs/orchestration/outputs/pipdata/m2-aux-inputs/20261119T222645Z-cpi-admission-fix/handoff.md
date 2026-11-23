---
schema: pip-handoff-v2
project: pipdata
task: m2-aux-inputs
run: 20261119T222645Z-cpi-admission-fix
status: completed
updated: 2026-11-19T22:34:11Z
owner: Fix bounded CPI admission
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: 53a76e379c81a3ac70b39925954981ae6a691459
plan: .cg-docs/plans/2026-11-05-m2-deflate-one-survey-approved-contract.md (pipdata, revision 2; contract reference only)
next: Coordinator collects the focused result; no further pipdata edit is pending.
---

# Bounded M2 CPI exact-key admission

## Summary

The bounded M2 route now admits exact 2021 CPI even when an unrelated 2005
CPI cell is plain `NA`. A selected `NA` or absent year/domain still fails; no
fallback, imputation, input mutation, or new dependency. The expected behavior
is grounded in the approved contract (`pipdata` Plan revision 2:50-52,65-67)
and the local boundary observations below.
Test gap: prior unused CPI fixtures were finite, so they could not expose the
full-vector NA check.

Supporting hub evidence: `outputs/pipsystem/m2-aux-inputs/20261119T215954Z-local-boundary/`
`pfw-cpi-admission.log:6-20`, `selected-keys.log:6-12`, `joint-projection.log:6-15`.

## Changes

- `pipdata/R/pd_deflation.R:43-66,194`: the fixed CPI call opts in to ignoring
  plain `NA` during the full-vector numeric pass, after shape/type/class
  validation. Names are still checked on the full original vector. Strict
  numeric validation then covers each exact selected CPI value. `NaN`, `Inf`,
  zero and negatives remain invalid everywhere. PPP and POP use the strict
  default; legacy deflation and public signatures have zero diff.
- `pipdata/tests/testthat/test-pd-deflation.R:884-943`: two synthetic tests
  exercise the frozen adapter, independent literal welfare, exact metadata
  keys, missing selection, and retained guardrails. Scoped review strengthened
  the invalid-name cases to put each bad name on the very cell carrying `NA`,
  so dropping missing cells before name validation would fail the test.
- No B6, fingerprint registration or engine test edits. No Git mutations.

## Checks run

- Initial/final read-only Git agreed with `tools/pipsys/packages.csv:5` on the
  existing PROD checkout and full HEAD. The two targets were initially clean.
  Final status adds only those two package paths; `git diff --check` exited 0
  (Git emitted its usual LF/CRLF conversion notice). Working-tree blobs for
  `R/dependency_inputs.R` (`df12148dc1bf1a3be12e06cb2203c145e5120651`) and
  `R/code_fingerprint.R` (`4b97d264642d922acd21161b4c51cc5b2fa4406e`) were unchanged.
- **RED (expected):** `red-confirmed.log:10-18` shows the new regression failing
  before the fix with `bounded CPI requires finite positive values (welfare permits zero)`.
- **GREEN:** `green-final.log:10-37` shows all 10 bounded blocks in
  `test-pd-deflation.R` passing, 82 expectations, with no errors, warnings or
  skips in offline R 4.5.2. `run.ps1` and `check.R` record the contained command
  and selected blocks; the earlier logs preserve runner-setup failures.
- **Exact method provenance:** `green-final.log:34-36` verifies the real
  `pd_engine_proof()` SHA-256 hashes against the canonical source and frozen
  function objects, for all three changed functions. The fixed registration
  and closure enforcement at `R/code_fingerprint.R:179-245` already cover them.
- **No-save path review:** selected invalid CPI raises before the calculation
  returns an output. The existing engine signals the calculation error before
  returning a saveable value (`R/dependency_execution.R:107-140`). Existing
  before/after zero-version assertions remain intact in
  `tests/testthat/test-m2-engine-authority.R:276-339`.
- Arithmetic dependency: existing E: `wbpip` 0.1.6 installed metadata names
  commit `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; the source checkout read
  for hook inspection independently reported that HEAD. The runner uses the
  installed arithmetic, not a substitute.

## Gaps

- Source-only test preflight: the harness substitutes only `pipdata` namespace
  lookup with the source environment. It runs the actual freeze/allowlist,
  arithmetic and proof hashing; does not load `pipdata`, `pipaux`, `pipfun`,
  `pipload`, `dlw`, or `stamp` or execute their hooks. The full deflation file's
  legacy blocks, full package suite, real Stamp request/save/no-save integration,
  and actual survey/target-release runs were **NOT RUN**. The no-save path review
  and existing untouched test are not a fresh storage-level proof.
- No release, shared I/O, network, pipeline, install or Git mutation was performed.
