---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-architecture
status: completed
updated: 2026-11-02T21:19:56Z
owner: cg-architecture
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Review coordinator triages P3.1; no implementation was authorized in this review.
---

# Architecture review

## Summary
Read-only architecture review completed against main baseline 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39 and Plan r2. One P3 finding; no P0-P2 findings.

The implementation is a bounded extension of the existing Quarto generator: site-only projections and wrappers preserve the fixed CLI functions, task presentation joins on roadmap feature IDs, and canonical package-table rows come from SYSTEM_DESIGN.md. Saved advice is selected from completed dated global handoffs and is explicitly not reassessed; no planner or readiness execution was added. Local controls have no external-library dependency and leave complete static tables in place. Evidence: tools/pipsys/pipsys.R:1130-1250,1253-1275,1363-1380,1627-1657; site/assets/table-tools.js:1-116; site/index.md:8-17; tables/site_task_context.csv:1-67.

### Findings

**[P3.1] [safe_auto]** `tools/pipsys/pipsys.R:1158-1170` -- Inline-assessment fallback links to a nonexistent detail file.

**Issue**: When assessment.md is absent, the reader deliberately extracts Recommendation and related sections from handoff.md (line 1159), but the full-assessment source link still targets assessment.md (line 1170). A completed handoff containing those sections therefore produces a broken evidence link even though the evidence was successfully read.

**Impact**: The source presented as the full assessment does not match the source actually rendered, weakening the generator's otherwise explicit source-to-presentation boundary. The separate Source handoff link remains available, so this is a minor navigation/traceability defect rather than loss of evidence or a readiness error.

**Fix**: Resolve one actual source path first: use assessment.md if it exists, otherwise handoff.md. Read sections and build the full-assessment link from that same path. Add one fixture with Recommendation in handoff.md and no assessment.md; check that the evidence link names handoff.md. No parser framework or additional validation layer is needed. Tag indicates a narrowly mechanical fix, not authorization to apply it.

## Changes
Only this required handoff was created and updated. No implementation edits, commits, pushes, merges, deletions or protected-asset recommendations. Unrelated dirty work was preserved.

## Checks run
- Read project rules, design, harvest brief, Plan r2, and handoff contract.
- Git status and HEAD confirm main at the requested baseline, with unrelated dirty work present and preserved.
- Inspected scoped Git diffs for generator, site sources and R regression tests; read the new CSV, local JavaScript, browser driver and both browser fixtures.
- Static inspection confirms existing CLI schemas remain in unchanged report functions; new site wrappers are applied only during generated-site assembly (tools/pipsys/pipsys.R:1627-1657). Regression assertions explicitly check CLI projection names (tests/pipsys/test-pipsys.R:904-905).
- Final read-only Git diff path listing and HEAD check retained the baseline and existing tracked dirty paths.
- Tests, Quarto rendering, browser execution and other process launches were NOT run, per request. Earlier passing checks are user-reported, not independently rerun evidence from this review.

## Gaps
- Review is static; runtime behavior and reported prior passing checks were not independently verified.
- No package repositories or .cg-docs/views bodies were read. Package runtime readiness, production data, publication and numerical correctness are outside this UI architecture review.
- P3.1 is not implemented or tested; this review authorizes no code changes. Reversible hardening and broad module splitting are not recommended for this bounded extension.
