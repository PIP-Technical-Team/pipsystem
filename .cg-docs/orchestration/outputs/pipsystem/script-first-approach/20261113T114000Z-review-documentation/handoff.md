---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-documentation
status: completed
updated: UNKNOWN
owner: documentation-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md rev1
next: Implementation owner triages two P3 documentation findings before final Plan verification.
---

# Script-first documentation review

## Summary

Read-only documentation review completed against Plan rev1. Two P3 findings;
no P0, P1 or P2 documentation findings. No fixes applied. The document makes
public package calls, ownership, synthetic transport/auxiliary limits and
expected numerical/exact-version/invalid-output assertions visible.

Current saved evidence is four PASS, processing FAIL with the actual context
message, and two dependent NOT RUN, not original survey acceptance
(`results.tsv:2-8` in the evidence directory below). B6 is explicitly deferred,
not waived (`experiments/pip-pipeline.qmd:23-26`). This review does not close
the implementation Plan's independent review/final verification gates.

## Findings

### DOC-01

**[P3]** `experiments/pip-pipeline.qmd:30` -- Entry does not identify how to select the isolated render route.

**Issue**: "Run through the existing isolated launcher" does not name its file,
the required mode or the difference between the existing private runtime ID
and a fresh render ID. The launcher defaults to `check`, not rendering
(`experiments/one-survey/run.ps1:1-6`), and requires an existing runtime for
`qmd-render` (`run.ps1:19-20,67-97`). A reader cannot reproduce this canonical
entry from its run guidance without inspecting the launcher implementation.

**Fix**: safe_auto (documentation only): identify
`experiments/one-survey/run.ps1`, mode `qmd-render`, `RunId` as the already
prepared exact-pin private runtime, and `QmdRunId` as the fresh render suffix;
identify `.tmp/one-survey/<RunId>/qmd-<QmdRunId>/` as the evidence destination.
State that missing runtime/packages block this route and do not authorize
setup/install. Plain prose is sufficient; no new runner or dependency.
Functional check for the correction: compare that paragraph with the existing
parameter block and render branch; no pipeline execution needed for this prose.

### DOC-02

**[P3]** `experiments/one-survey/qmd-fixtures.R:45` -- Transport helper omits its mutation and return contract.

**Issue**: The file's one-line header describes fixture scope but not that
`use_fixture_transport(raw, catalog, bad_id)` immediately replaces locked
bindings in the loaded `pipfun` and `dlw` namespaces and returns a zero-argument
cleanup function (`qmd-fixtures.R:47-58,59-90`). The Qmd currently uses cleanup
correctly (`experiments/pip-pipeline.qmd:107,334`); future reuse of the support
function alone would miss that lifecycle unless the reader inspects its body.
This is a local script helper, not an exported package function: roxygen export
documentation is not required.

**Fix**: safe_auto (documentation only): add a short function comment naming
`raw` as the valid synthetic microdata, `catalog` as its DLW file catalog and
`bad_id` as the module-bearing missing-weight control; state that this helper
mutates loaded namespace transport bindings, must run only in the isolated
child, and returns a zero-argument restoration closure to call after use.
Functional check for the correction: compare the comment with the five
replacement sites and the existing Qmd cleanup call; no added safeguards.

## Changes

Only this authorized handoff created and finalized. No source, package, Git,
execution-report or instruction changes. Mixed-owned scenario/reproduce/setup
content preserved. No protected records deleted, replaced, renamed or moved.

## Checks run

Static inspection only; no commands, tests, rendering, installations or Git
operations executed.

- Read project objective/design/harvest instructions, authorized Plan rev1,
  execution report, Qmd, qmd-fixtures.R, check-qmd.R, launcher run.ps1 and setup.R.
  Setup review focused on the single mode-default line (line 7) and context
  needed to evaluate the Qmd's installed-package claims. No scenario/reproduce
  edits or package-repository reads.
- Loaded existing clear-technical-communication and R shared, technical,
  data.table, collapse, testing and analytical skills.
- Inspected script-first paragraphs in `AGENTS.md:126-139`,
  `ORCHESTRATOR.md:113-126` and
  `.cg-docs/orchestration/CONTRACT.md:17-30`: matching content, correct ownership,
  explicit FAIL/NOT RUN and reload rule. No documentation finding there.
- Read `kilo.json:7`; its long prompt line is tool-truncated. Full JSON parsing
  and four-surface comparison are implementation-reported checks, not rerun
  here (`.cg-docs/work-reports/2026-11-13-script-first-pipeline-qmd.md:45-47`).
- Evidence directory:
  `.tmp/one-survey/n11/qmd-20261113T114000Z/`.
  Read `results.tsv:2-8`: four PASS, processing FAIL
  `A single working release and identity are required.`, exact readback and
  invalid/no-output NOT RUN.
- Inspected generated `pip-pipeline.html`: run identity at line 2338, actual
  context failure at 2607, summary failure/NOT RUN at 2713-2723, original
  survey acceptance NOT PASSED at 2757, B6/later stages NOT RUN at 2761.
  Saved HTML supports the visible execution status, not survey/B6 acceptance.
- Visible checks retain paired daily welfare 1/2/3/4 and weights 10/20/30/40,
  total weight 100, metadata survey/CPI/PPP, returned version pins and classified
  invalid/no-output expectations (`experiments/pip-pipeline.qmd:238-248,258-307`).
  They are not inferred executed passes: results.tsv marks the dependent rows
  NOT RUN.
- Execution report correctly leaves independent review/final verify pending
  and original survey/B6 uncertified (lines 77-83). No status-correction finding.

## Gaps

- Two documentation findings remain unapplied for the implementation owner's
  correction/verification stage. No implementation or final mode:verify here.
- Current checkout HEAD and current clock UNKNOWN: commands prohibited. Branch
  main is user-supplied, not Git-verified. Execution report line 10 reports
  baseline e9c71e3190f1ce88a017ae25af7c373a64c655a2, not a fresh HEAD check.
- Immutable committed scenario oracle not independently retrieved: no Git
  commands authorized. Assertion preservation assessed in visible Qmd against
  Plan rev1 requirements; report's historical comparison remains reported.
- Full kilo.json prompt/non-prompt comparison not independently established
  because the read tool truncates its long line and command execution is
  prohibited. No claim that JSON was independently parsed by this reviewer.
- Saved HTML/TSV inspected as historical execution artifacts; no render or
  package acceptance rerun. Package provenance comes from setup/report, not
  package source inspection; no additional package SHA records required.
- Original survey acceptance and B6 remain unpassed. Package-context repair is
  outside this review and this bounded Plan; do not infer invalid/no-output or
  numeric acceptance from the four upstream PASS rows.
- Instruction activation still requires reload/fresh session as documented in
  execution report line 80; this review does not activate changed instructions.
