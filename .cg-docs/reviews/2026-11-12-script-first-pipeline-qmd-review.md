---
date: 2026-11-13
depth: full
type: standard
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md
findings:
  P2.1: fixed
  P3.1: fixed
  P3.2: fixed
---

# Script-first Qmd Review

## Scope and Routing
Full auto route: survey/reproducibility signals plus launcher render/output paths.
Required ten agents dispatched once; data quality, reproducibility and testing
have mandatory emphasis. Owned Qmd/fixture/check files, launcher qmd additions,
setup.R one-line mode default, four instruction additions and Work records only.
Inherited survey/helper/pin changes are not part of this review.

## Findings
- **P2.1** `cg-testing`, `cg-code-quality`, `check-qmd.R:23-25`, safe_auto:
  dependency-skip test evaluates only the already failed release chunk; untouched
  NOT RUN defaults do not prove actual dependent chunks skip execution. Evaluate
  the actual downstream chunks in the failed state before assertions.
- **P3.1** `cg-documentation`, `pip-pipeline.qmd:30`, safe_auto: prose does not
  name the launcher/mode/runtime identifiers and evidence destination. Add brief
  execution instructions and explicit missing-prerequisite/no-install boundary.
- **P3.2** `cg-documentation`, `qmd-fixtures.R:45`, safe_auto: transport helper
  comment lacks input, isolated namespace side-effect and cleanup return contract.
  Add a short comment; no new abstraction needed.

## Passed
All three findings corrected and checked in one targeted review-fix set. P2.1 now evaluates
all five actual downstream chunks in the failed state; P3.1 names launcher,
identifiers/evidence destination and blocked prerequisite boundary; P3.2 adds
the helper input/side-effect/cleanup-return contract. `qmd-check` passes after
correction. Fresh render `qmd-20261113T113400Z-reviewed` passes document generation
and retains the actual 4 PASS / 1 FAIL / 2 NOT RUN. Final light verification
passed with both agents; see the adjacent `-verify-review.md` report.

Version control: no remaining actionable findings. Stale current pointer was
corrected during report bookkeeping and independently rechecked. Main/HEAD/index
unchanged; render runtime ignored; JSON diff contains only prompt text.

## Agent Reports
Reports under `.cg-docs/orchestration/outputs/pipsystem/script-first-approach/`:
- `20261113T114000Z-review-quality/handoff.md`
- `20261113T114000Z-review-testing/handoff.md`
- `20261113T114000Z-review-documentation/handoff.md`
- `20261113T114000Z-review-git/handoff.md`
- `20261113T114000Z-review-performance/handoff.md`: no issues.
- `20261113T114000Z-review-architecture/handoff.md`: duplicate P2.1.
- `20261113T114000Z-review-learnings/handoff.md`: duplicate P2.1 (rated P3).
- `20261113T114000Z-review-adversarial/handoff.md`: no issues.
- `20261113T114000Z-review-reproducibility/handoff.md`: no issues; independently
  compared saved immutable oracle excerpt against all visible assertions.
- `20261113T114000Z-review-data/handoff.md`: no issues; independently compared
  classification/diagnostic, exact returned pins, paired numeric and no-output
  assertions against saved immutable oracle excerpt.

## Result
Ten usable agent reports. Three deduplicated findings (P0: 0, P1: 0, P2: 1,
P3: 2); all fixed, none skipped/open. The dependency-test issue was independently
reported by code-quality, testing, architecture and learnings reviewers.

Implementation-to-review advisory: reliable tool use, narrow diffs and critical
cross-package evidence checking favor Powerful capability, high effort; Standard
can suit bounded follow-up. These are suggestions, availability varies, and the
user selects model/effort. No selection or setting was changed by this workflow.

## Gaps
Final light verify passed; all three findings independently verified closed.
The real package context
failure remains; original survey acceptance/B6/later stages are not certified.
No Problems/get_errors tool is available; no such diagnostics pass is claimed.
