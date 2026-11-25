---
date: 2026-11-25
title: "Verify Quarto HTML Navigation Offline Without Running Cells"
category: "testing-patterns"
language: "both"
tags: [quarto, offline-render, html-links, no-execute, pinned-evidence]
root-cause: "On Quarto 1.9.37, standalone and default-project renders kept cross-page links as QMD paths instead of linking generated HTML."
severity: "P2"
plan: ".cg-docs/plans/2026-11-25-historical-quarto-record.md"
related: [".cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md"]
---

# Verify Quarto HTML Navigation Offline Without Running Cells

## Problem

The PIP historical record needed working HTML links between the pipeline
overview, indexes, and evidence pages. Valid QMD source links and a successful
render did not show that the generated HTML was navigable. The check also had
to leave survey and pipeline cells disabled. See the [Plan](../../plans/2026-11-25-historical-quarto-record.md),
lines 65-76, at `9909d6fd9a16996de3663d29a0d8b8900f6280bc`.

## Root Cause

On Quarto 1.9.37, single-document and default-project renders preserved the raw
`.qmd` hrefs. A website project converted them to `.html`, but its default
discovery also treated some linked Markdown evidence files as render inputs.
Restricting `project.render` to the QMD pages kept the evidence files as source
links. See the [work report](../../work-reports/2026-11-25-historical-quarto-record.md),
lines 13-15, and the linked handoff, lines 37-42, at the same revision.

## Solution

1. Stage only the required QMDs and inspected local evidence files in a fresh
   scratch tree. Preserve their relative paths. Do not copy caches, old HTML,
   survey data, credentials, or the full checkout.
2. Put a temporary `_quarto.yml` in the scratch root. List every QMD to render;
   leave linked Markdown evidence out of the list. Keep relative `.qmd` links
   in the source. Example for a two-page fixture:

   ```yaml
   project:
     type: website
     output-dir: .
     render:
       - index.qmd
       - records/example.qmd
   ```

3. Block network access in the test environment. Render each listed page from
   the scratch project root with execution off. `--no-execute` does not block
   network access by itself.

   ```sh
   quarto render index.qmd --no-execute
   quarto render records/example.qmd --no-execute
   ```

4. After all renders finish, use Python's standard-library `HTMLParser` to
   collect actual anchor hrefs and destination IDs. Use `urlsplit` and `unquote`
   to resolve local paths relative to the containing HTML file. Require each
   navigation target to be HTML from this run and each fragment to match a real
   ID. Traverse from the overview to each record and back. Check source-evidence
   files separately. Do not fetch external links or count them as offline passes.

The [handoff](../../orchestration/outputs/pipsystem/historical-qmd/20261125T214856Z-backfill/handoff.md#checks-run),
lines 37-44 at the revision above, records 29 fresh renders, 23 record round trips,
496 valid fragment references, and 110 local evidence hrefs. The existing Step 05
page was a forward-only check. No survey or pipeline cells ran.

## Prevention

- State the Quarto version, scratch configuration, page list, and expected
  forward and return routes before testing. Do not rely on HTML file counts.
- Treat links to checkout copies as convenience links. Cite the Git revision,
  path, and line range for exact historical evidence.
- Report document navigation, pinned-record checks, and runtime checks
  separately. A successful offline render is not a package or pipeline test.

## Related

- [Verify design integration without claiming runtime completion](2026-10-07-evidence-gated-design-integration.md).
- [Historical Quarto verification report](../../work-reports/2026-11-25-historical-quarto-record.md#evidence).

## Gaps

- Verified against Quarto 1.9.37 on macOS. Other versions and platforms were not
  checked. Standalone cross-page HTML navigation is not certified.
- Offline link checks do not prove external link availability, package behavior,
  or production acceptance.
