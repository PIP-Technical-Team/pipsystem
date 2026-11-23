# Work Report: Readable Script-first Pipeline Qmd

## Plan Reference
`.cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md`, revision 1.

## Active Deviation Policy
Stored `ask`; runtime `deviate:ask`. `review:auto`. No deviations authorized.

## Run 1: 2026-11-13
Verified existing root/main at `e9c71e3190f1ce88a017ae25af7c373a64c655a2`.
Canonical Plan validation passed before execution mutations. No matching roadmap
plan/title found in targeted search; no roadmap writes. Plan is non-phased.

## Completed Steps/Phases
Step 1: readable Qmd, explicit public calls, small fixture support and executable
reporting check drafted and rendered on 2026-11-13. Step 2 instruction text and
checks implemented; all full-route review fixes checked and final light verify
passed on 2026-11-13. Both steps complete for document/style scope only.

## Deviations
None.

## Accepted Exceptions
None.

## Evidence Table
| ID | Status | Actual evidence |
|---|---|---|
| V1 | passed | Qmd/fixture source reviewed; all nine R chunks parse |
| V2 | passed | `.tmp/one-survey/n11/qmd-20261113T113400Z-reviewed/pip-pipeline.html`, `quarto.log`, `results.tsv` |
| V3 | passed | Immutable oracle `e9c71e3:experiments/one-survey/scenario.R:123-179` against visible Qmd assertions; independent data/reproducibility review |
| V4 | passed | Four excerpts identical, JSON parsed, only prompt property changed; ten-agent full review, all fixes and two-agent light verify complete |

## Constraints Check
| ID | Status | Check |
|---|---|---|
| C1 | passed | Existing n11 private R/library; Quarto 1.11.9; existing path helper plus E: temp/home/cache/log/store settings |
| C2 | passed | Scoped status/diff and version-control review; no package/pin/Git mutations; initial mixed-owner work preserved |
| C3 | passed | Visible public calls, local table/error recorder, no independent execution engine |

### Executed Checks
- Red baseline: `qmd-check` failed `file.exists(document) is not TRUE` before
  the Qmd existed. Green: parsed all chunks; exercised actual error recorder
  with `synthetic package blocker`, checked FAIL/message and NOT RUN dependencies.
- Fixture support parsed and checked catalog/table names, CPI 1.4 and PPP 1.6.
- Four intended instruction excerpts agree after Markdown normalization. Parsed
  JSON, preserved original prompt prefix and verified every non-prompt property
  against HEAD unchanged.
- First fresh render truthfully reported preflight FAIL `argument is of length
  zero`; targeted correction 1: source-safe default mode in existing setup.R.
  This single-line change preserves all prior dirty content and seven pins.
- Render `20261113T113500Z` reached expected package context failure. Pre-review
  source rendered again as `20261113T114000Z` with SHA256
  `3BF38A85604B66551F5DFC20718A781C47C66330253833E7B2325172C99F83D2`.
- Current-run results: 4 PASS, 1 FAIL (processing: `A single working release and
  identity are required.`), 2 NOT RUN (exact readback and invalid/no-output).
  HTML contains actual error and `Original survey acceptance: NOT PASSED`.
- Existing setup validates exact receipts/namespace paths on this run; no setup
  installation, source download or package edit was performed.
- No `get_errors` tool is available in this session. Syntax/JSON checks and
  independent code review provide available diagnostics; no clean Problems
  result is claimed. No Pester run or unrelated full suite is authorized.

### Review Checkpoint
Full auto route executed (ten reviewers) because render/output paths combine
with survey/reproducibility risk. Three deduplicated findings: P2.1 downstream
test checked untouched defaults; P3.1 launcher prose incomplete; P3.2 transport
cleanup comment missing. All fixed in one targeted review-correction set, no
assertion changes or expectation weakening. Review report:
`.cg-docs/reviews/2026-11-12-script-first-pipeline-qmd-review.md`.

Post-fix `qmd-check` passes: parses nine chunks/support, evaluates all five
actual downstream chunks after injected failure, checks fixtures and all four
instruction excerpts/JSON scope. PowerShell AST parsing passed with zero errors.
Final reviewed source rendered fresh at
`.tmp/one-survey/n11/qmd-20261113T113400Z-reviewed/`; source SHA256
`244BE434E1F4172BE8C1B900AE517F5B2C58D94918B6BB972DD9833EA9D1AF3B`.
Still actual 4 PASS / 1 processing context FAIL / 2 NOT RUN, not original acceptance.
Data-quality and reproducibility reviewers independently compared the saved
immutable oracle excerpt with all assertions. No remaining route findings.
Final light verify passed: both agents verified P2.1/P3.1/P3.2, none reopened,
no new issues. Saved final report:
`.cg-docs/reviews/2026-11-12-script-first-pipeline-qmd-verify-review.md`.

## Test Index
No existing Qmd reporting tests. Existing survey scenario supplies the numerical,
exact-version and invalid/no-output checks; immutable baseline is HEAD
`experiments/one-survey/scenario.R:123-179`. Existing tests/pipsys and paused
orchestration tests do not cover this entry. No Pester is in scope. Private
library has knitr/rmarkdown but no testthat; focused executable base-R assertions
check reporting and the document, without installing dependencies.

## Mechanical Self-review
Reviewed new source and intended tracked diffs: no debug/import/TODO issues found.
Intentional `print()`/`cat()` calls are visible evidence output, not debug code.
No new library dependencies, public package exports, hardcoded credentials or
unresolved TODO/FIXME markers. Fixture values and fixed checkout/runtime targets
are deliberate, named/disclosed example inputs, not production configuration.
Owned tracked whitespace checks passed (only existing LF-to-CRLF notices).
Statistical and logical correctness are not established by this mechanical scan;
the full route's data-quality/reproducibility review separately checked assertion
preservation. Actual blocked downstream acceptance is still NOT RUN.

## Suggested Commit (Not Executed)
`feat(pipeline): add readable script-first Qmd evidence` for the owned entry,
fixture/test/launcher changes, source-mode line, instructions and associated
Plan/evidence reports only. No staging, commit, push or merge is authorized.

## Preserved Pending Work
Initial modified files: active-state/current.json; earlier pipdata bootstrap and
pipsystem gate-monitor handoffs; original one-survey Work report; reproduce.R,
scenario.R and setup.R. Existing untracked package/hub evidence, prior reviews,
and the approved Plan/prompt are not this implementation's changes.

## Remaining Uncertainty
Original survey, B6, later stages,
broader suite and production are not certified here. Unexecuted readback/no-output
assertions remain visible, not passed. Instruction reload is pending user action.

## Final Status
Completed. Required V1-V4 and constraints C1-C3 passed for the readable-document
contract. No exceptions or deviations. This does not complete the original survey
Plan, fix the package context blocker, or accept B6. Configuration activation
still needs reload/fresh session. No Git mutation was performed.

Final bookkeeping checks: completed Plan validates; active-state JSON parses,
all V1-V4 pointers have passed status and referenced handoffs exist; final owned
tracked whitespace check passes. Re-read Plan confirms only permitted status,
completed-date and execution-report fields changed. No roadmap feature matches
the Plan path/title in the targeted structured query; no roadmap writes made.
