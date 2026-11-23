---
date: 2026-11-16
type: standard
depth: data-risk
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md
findings:
  P2.1: fixed
---

# Working-release initialization scoped review

## Outcome
All eight requested roles report no remaining supported P0-P3 findings within
the initialization delta. Prior broad Qmd/style work and B6 were not reopened.
Current source evidence is PASS in `source-5.log`; historical failures remain
failures. Final light verification is saved in the linked verify review, not
inferred from broad review.

## Fixed finding
**P2.1 [safe_auto], fixed:** The exact-description checker reconciliation needed
a matching narrow allowance in the task-local preservation oracle. Otherwise
the original checker-tail equality would reject the approved added block even
after the focused checker passed. `check-source.R` now removes only the marked
description reconciliation and restores its diagnostic label before comparing
the remaining original tail exactly. Code-quality reviewer observed and rechecked
this cross-file correction; `source-5.log:24-31` executes both comparisons PASS.
The user separately approved the exact existing description suffix; no rule file
was edited. No other fixed-finding suppression is authorized for final verify.

## Coverage
Reports below are under
`.cg-docs/orchestration/outputs/pipsystem/qmd-working-release/20261116T215847Z-code/`.

| Role | Report | Result |
|---|---|---|
| cg-code-quality | review-code-quality/handoff.md | No remaining supported P0-P3; source-5 reviewed |
| cg-testing | review-testing/handoff.md | No supported new P0-P3; source-5 reviewed |
| cg-documentation | review-documentation/handoff.md | No supported P0-P3; source-4 was inspection cutoff |
| cg-version-control | review-version-control/handoff.md | No supported P0-P3; source-5 reviewed |
| cg-reproducibility | review-reproducibility/handoff.md | No supported P0-P3; source-5 reviewed |
| cg-performance | review-performance/handoff.md | No supported P0-P3; no benchmark claimed |
| cg-architecture | review-architecture/handoff.md | No supported P0-P3; no package boundary expansion |
| cg-data-quality | review-data-quality/handoff.md | No supported new P0-P3; source-4 was inspection cutoff |

Reviews are static source/log reviews, not independent execution. Code ran in
the producer checks. Eight roles were explicitly requested by the user; route
is data-risk, with emphasis on data-quality, reproducibility and testing. Auth
and containment signals were included as focus, not grounds for widening the
explicit role set. No models or effort settings were changed.

## Evidence
- `first-4.log` and `existing-4.log`: exact unmocked public cell, selected
  20260401/TEST/2021, nine folder/alias readbacks, distinct PIDs 26308/25552,
  same E: store-4; both processes exit 0.
- `source-5.log`: source/control-flow tests, fixture/instruction checks and
  baseline preservation PASS after exact-description approval.
- Full logs and `namespace-paths.tsv` are retained next to the primary handoff.
- The runtime-inspection report records the actual PPP metadata route:
  `pip_create_vintage` -> `load_from_gh` -> aux_ppp `DEV/ppp_vintage.csv`.
  The reproducibility role's `utils.R:47-61` citation describes a different
  helper; it is not used here as evidence for the initializer metadata route.

## Mechanical self-review
No debug/import/TODO issues found in the owned delta. Public `print()` and
`cat()` calls are intentional visible readbacks/status output, not debug code.
No new imports/dependencies, hardcoded credentials, installation or Git mutation.
R chunks parse; launcher executes successfully; whitespace check succeeds.
Statistical and logical correctness are not established by this mechanical scan;
the scoped review roles separately inspected the initialization assertions.

## Advisory
Implementation-to-review capability profile: reliable R/public-API reasoning,
provenance checking and narrow diffs. Powerful (Sol/Opus), high effort is the
strong option; Standard (Sonnet/Terra), medium effort is economical for the final
bounded verification. These are suggestions, availability varies by platform
and date, and the user chooses model/effort. No selection was changed.

## Gaps
- Final light verification is a separate static source/evidence review. No claim of full Qmd render,
  shared-store initialization, auxiliary producer or real-survey acceptance.
- Editor get_errors is unavailable; Problems diagnostics NOT RUN. Executed R
  parse/source/live checks, rather than a nonexistent diagnostics tool, support
  the available evidence.
- Remote metadata branches remain mutable; this initialization slice does not
  claim immutable full-pipeline data provenance.
