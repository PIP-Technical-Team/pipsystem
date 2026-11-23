---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-learnings
status: completed
updated: UNKNOWN
owner: review-learnings
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md revision1
next: Review owner integrates the P3 finding; implementation and execution are outside this read-only review.
---

# Script-first pipeline learnings review

## Summary
Read-only full-route learnings review completed for revision 1. One P3 finding
(safe_auto classification, not permission to implement); no P0-P2 findings
identified in the inspected material. Branch is user-specified, not independently
verified. The current render remains user-reported 4 PASS / 1 FAIL (context) /
2 NOT RUN, not original survey acceptance. No generated views were opened.

## Changes
Only this required handoff created and finalized. No implementation, instruction,
package, protected-path or Git changes. No commits.

## Checks run
Static reads/searches only:
- Read the Plan revision 1 and required charter/design/harvest context.
- Loaded shared, technical, data.table, collapse and testing R skills before
  reviewing R; also loaded the technical communication skill.
- Read all of experiments/pip-pipeline.qmd, one-survey/qmd-fixtures.R,
  check-qmd.R and run.ps1; inspected setup.R including the mode-default line 7
  and unchanged declared seven SHA values at lines 9-22. Read paths.ps1 solely
  to understand the existing containment helper used by the new render route.
- Compared the three Markdown instruction excerpts at AGENTS.md:126-139,
  ORCHESTRATOR.md:113-126 and CONTRACT.md:17-30 by inspection; they agree.
  Searched/read kilo.json:7, subject to the long-line limitation below.
- Directory inspection established DIGEST.md and search-index.json are absent.
  Direct scan found one solution Markdown file. Searched only brainstorm
  documents for relevant historical learnings; selected reads are listed below.
- No commands, tests, source evaluation, R, Quarto, Git operations, downloads,
  installation or package execution performed. All runtime checks NOT RUN in
  this review; the current render result was provided by the user, not rerun.

## Findings

### P3 — Downstream NOT RUN regression check does not evaluate downstream chunks

**Tag:** safe_auto (minimal local checker correction; not executed here).

**Evidence:** experiments/one-survey/check-qmd.R:16-24 initializes every row to
NOT RUN, records a synthetic Release setup failure, then evaluates only
release-setup. Its assertion inspects rows 3:7, but none of their chunks has
been attempted. The document initializes those rows at
experiments/pip-pipeline.qmd:38-46 and gates actual downstream calls at
:159-176,185-219,229-253,262-294,302-316. Removing a downstream gate would leave
this checker green because it never evaluates that chunk. The PASS description
at check-qmd.R:25 therefore overstates the exercised dependency behavior.

**Minimal fix:** In the existing synthetic-failure state, evaluate the actual
downstream chunks rather than only release-setup, then retain the existing
NOT RUN assertion. No new checker/framework/dependency is needed.

**One functional check for the change:** The existing qmd-check case should
evaluate those chunks after the synthetic failure and preserve rows 3:7 as
NOT RUN without invoking package work. NOT RUN here: execution prohibited.

**Learning connection:** The prior solution distinguishes a document check
from an actual runtime check and warns against relabeling inspected tests as
executed passes (solution below, lines 22-29,37,60,66-71). This finding is about
the synthetic regression check's coverage, not a claim that the supplied real
render incorrectly reported its context failure.

## Related Learnings

### Directly Relevant
1. **.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md**
   — Verify Design Integration Without Claiming Runtime Completion.
   **Relevance:** Separates successful documentation delivery from runtime proof.
   **Key takeaway:** A render/check must only claim the behavior it actually
   exercised; retain pending runtime gates and nonempty gaps (lines 22-29,
   37,60,66-71). The Qmd follows this separation at lines 23-26,224-227,321-337
   for its current blocked run; the checker coverage finding above is narrower.
2. **.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md**
   — M2 Phase 3: Bounded Deflation Decisions.
   **Relevance:** Supplies the same accepted synthetic row/weight semantics and
   exact-version expectations without certifying live services.
   **Key takeaway:** Use literal independent paired rows and actual saved pins,
   never latest fallback or historical pins as current evidence (lines 17,
   31-40,44,64,68,71,83). Qmd:240-246,265-286 preserves returned pins, literal
   paired values, survey/CPI/PPP metadata and total weight; fixture limitations
   are explicit at Qmd:126-130,154-157. No package repository was read to
   revalidate this historical learning's source citations.

### Potentially Related
1. **.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md**
   — Observed Setup, Teardown, and Resource Risks (lines 182-198 only read in
   detail, with targeted search matches elsewhere).
   **Relevance:** Explains why package loading, helpers, manifests, cache and
   logs require a fresh isolated child before namespace loading.
   **Key takeaway:** Set process-start roots before R; one unset variable or
   test filter is not containment. run.ps1:37-66,67-96 reuses the private child
   with E: output roots and renders a copied Qmd in a fresh directory; setup.R:
   31-55 checks resolved private paths. Static review is not a write audit.
2. **.cg-docs/brainstorms/2026-10-30-modernize-quarto-site.md**
   — Modernize pipsystem Quarto review site presentation.
   **Relevance:** Prior Quarto work required all render state/temp output on E:
   (lines 20,41-43). It records an E:-installed Quarto at line 18, whereas this
   route reads the installed Positron Quarto executable from C: (run.ps1:69).
   **Key takeaway:** Executable read location does not establish output
   location; preserve E:-only writes. The old site/branding scope is not a
   reason to expand this single-survey task.

### Patterns to Follow
- Keep actual FAIL messages and dependent NOT RUN distinct from document/render
  success; preserve B6 and original acceptance limitations.
- Keep private exact installed-source provenance, actual saved-version public
  reads, independent numeric expectations and real invalid classification.
- Reuse the existing isolated runtime and minimal fixture helper; do not add
  another execution engine, scheduler, new dependency or test framework.
- Each actual correction gets one focused functional check; this read-only
  review performs none and authorizes none.

### Anti-Patterns to Avoid
- Checking untouched initialized result rows as proof that dependent execution
  was skipped; the code being protected must be exercised by the check.
- Treating historical synthetic acceptance or a successful HTML render as
  current survey acceptance, or a package failure/empty store as rejection.
- Copying obsolete historical scratch paths: the 2026-10-13 record's candidate
  C: prefixes at line 198 conflict with today's E:-only rule and must not be
  reused. This historical proposal is reference information, not authority.
- Inferring that earlier source/version evidence proves current installed bytes
  or that environment redirection alone proves absence of every indirect write.

## Gaps
- HEAD, independently verified branch and current clock UNKNOWN: command
  execution prohibited. updated remains UNKNOWN rather than fabricating time.
- No immutable Git ORACLE was retrieved (Git commands prohibited); original
  assertion equivalence is therefore not independently certified. Compared
  visible expectations to Plan:60-73,134 and selected historical learnings only.
- kilo.json's prompt is a single line longer than the read/search output cap.
  The matching rule is present, but complete suffix byte-equivalence and valid
  JSON were not independently verified. These require the separately executed
  existing checker; no defect is inferred from a tool display limitation.
- No runtime/indirect-write audit, rendered HTML inspection or current results
  file read was performed; generated views excluded by request. The supplied
  4 PASS / 1 FAIL / 2 NOT RUN remains user-reported evidence, not reviewer-run.
- Original one-survey acceptance, B6 and later pipeline stages remain unproved
  here. This review does not fix the known package context blocker or waive it.
- Brain index reported by user as having no relevant topics; no full Brain,
  tactical logs, generated views, other review reports or package sources read.
