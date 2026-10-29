---
date: 2026-10-28
type: attributed-verification-output
agent: cg-testing
session-id: ses_e7d616f83ffe3M92YwNqyJueOg
saved-by: existing pipdata Code session
reviewer-role: read-only
---

# Testing Verification Result

Outer caller saved the assigned read-only critic's substantive result. No tests,
package processes, writes, Git mutations, helpers or subagents executed by critic.

## Verdict

NOT CONVERGED. One remaining P0 and one P2 compatibility/test gap. Apply genuine
light verification suppression from selected standard17-ID map, never suppress
P0/P1 or cross-file breakage. Existing direct protections are not proof of nested
dispatch completeness.

## Findings

### P0.2 / A2: Nested Classed Operands Still Dispatch Unfingerprinted Methods

R/code_fingerprint.R:340 checks is.object only on top-level argument values.
lengths is permitted at line180, and base lengths dispatches length methods for
individual list elements. Accepted recipe:

```r
function(path, parents) list(x = lengths(list(value)))
```

With constants=list(value=as.Date("2026-01-01")), Date validation succeeds while
the base boundary sees an unclassed list. A registered length.Date method can
change the result without changing calculation/constants/policy descriptors;
an unchanged request may skip stale output. Direct Date-operator regression at
tests/testthat/test-m2-engine-authority.R:599 does not cover this nested case.
This is a static correctness finding, not executed reproduction or sandbox claim.

Required next action: close nested dispatch for lengths/other retained recursive
operations, bind effective methods, or reject unsupported operations. Add a
deterministic method-mutation regression with cleanup proving rejection/truthful
invalidation, then rerun targeted bound verification under separate authorization.
Prior P0.2 is PARTIALLY UNRESOLVED and must be reopened; never suppressed.

### Local P2.13: Missing Consumed Dependency-Capability Assertions

Merged under canonical P1.4 with code-quality local P1.1 because both describe
the same dependency/API mismatch; this critic specifically identifies test gap.
tests/testthat/test-dependency-api-contract.R:5 checks pip_read version argument
only, not metadata_only now required at R/dependency_execution.R:177-178.
DESCRIPTION:25 admits pipload>=0.2.0.9005. Sibling version1.0.0 at
../pipload/R/pip_read-write.R:48-54 lacks metadata_only and ..., while tested
adapter1.0.0 supports it. A satisfying installation can fail only after publication.

Required next action: assert consumed modern pipload/stamp request/receipt APIs,
reject unsupported capabilities before lease/planning/publication, and add a
focused negative compatibility test. Version-only increase to1.0.0 is insufficient.

## Prior Fix Dispositions

- P0.1/A1 exact-parent reads and negative messages: present; no additional defect.
- P0.2/A2 direct class/collation checks: present but nested dispatch unresolved.
- P1.1/A3 lease and P1.2/A4 cancellation: present; no additional defect.
- P1.3/A5 and P2.1/A6: support exact-pin historical execution, not arbitrary installs.
- P2.2-P2.12/A7-A17: mapped corrections/regressions present; no additional issue
  in those fixed scopes. The new dependency gap is cross-file and reportable.

## Evidence And Limits

Read prior selected map/crosswalk, current scoped source/tests/docs, and native
records/logs. Independently read gate exit0 with41tests286expectations and
installed smoke exit0 (engine built/skipped/empty plus rds/qs2/fst exact checks).
No test was rerun. Current182-row/hash comparisons supplied by outer caller,
not independently recomputed. Historical evidence binds uncommitted content,
not a newly executed test of HEAD. .cg-docs excluded by .Rbuildignore:10.
Article rendering unverified.41 E5 exclusions and no full-suite/check/production/
SMB/multiwriter/umbrella certification remain explicit.

## Disposition

P0.2 and compatibility gap remain outside source-change authorization. This
output is usable and saved by outer caller, not by restricted reviewer.
