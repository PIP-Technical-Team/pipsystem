---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-documentation
status: completed
updated: 2026-11-02T21:20:05Z
owner: documentation-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Implementer triages P2.1 and P3.1 below within the approved Plan; no fixes applied by this reviewer.
---

# Documentation/content review

## Summary
Documentation/content review complete: 2 findings (P0: 0, P1: 0, P2: 1, P3: 1). Reviewed the 66 presentation-context rows against current design, harvest brief, roadmap and cited skeleton/strategy sections. No rejected module-free identity, mandatory long-table output, separate pipsystem runtime orchestrator, manual code-version rule or automatic retry mechanism was reintroduced. Target package responsibilities and intended task results are explicitly distinguished from implementation delivery (`tools/pipsys/pipsys.R:1244,1260,1452,1469`). No live readiness assessment performed.

## Findings

**[P2.1] [safe_auto]** `tools/pipsys/pipsys.R:1170` -- Full-assessment navigation points to a nonexistent file for the latest saved assessment.
**Issue**: The recommendation branch always links `detail` (`assessment.md`), even when the content came from `handoff.md` because the sibling was absent (`:1158-1160`). The latest eligible completed report is `outputs/pipsystem/pip-next-global/20261102T210006Z-assessment/handoff.md` under `.cg-docs/orchestration/` (status and update at lines 6-7; Recommendation at 21-26). Its `assessment.md` does not exist: read returned File not found and a read-only Test-Path returned False; the handoff returned True. Therefore the homepage/overview's "Full assessment and evidence" link is broken for the current input, hiding access to the additional Blockers, evidence and Gaps stored in that handoff (lines 42-47,56-64,133-139).
**Fix**: Retain the actual selected content-source path: existing sibling `assessment.md` when present, otherwise `handoff.md`; use that same path for both reading and the Full assessment link. Do not create a substitute historical assessment. One working check: exercise a handoff with Recommendation but no sibling and confirm its full-assessment URL targets the existing handoff. Suggested check only; not run here.

**[P3.1] [safe_auto]** `tools/pipsys/pipsys.R:1192-1195` -- Recorded charter focus has no visible as-of date.
**Issue**: The focus fragment labels charter text as recorded and warns it may be superseded, but extracts only the section body and links the charter without displaying its recorded `last-reviewed: 2026-10-30` (`compound-gpid.md:5`). This places a dated assessment beside an undated, older progress claim (`compound-gpid.md:37-40`), although Plan r2 R1 requires dated source context (`.cg-docs/plans/2026-11-02-site-focus-and-navigation.md:39,50`). The homepage itself supplies no build timestamp (`site/index.md:14,63-65`); its only concrete displayed timestamp comes from the assessment. Readers should not need to open the source to determine the charter snapshot's age.
**Fix**: Display "Charter last reviewed: 2026-10-30" from the existing frontmatter immediately beside the charter source, with UNKNOWN when missing. Keep this date separate from assessment/build timestamps and retain the existing no-integration-check caveat. One working check: a fixture with charter last-reviewed metadata yields that date in the fragment without replacing the assessment timestamp. Suggested check only; not run here.

## Changes
Only this assigned handoff created and finalized. No implementation edits, fixes, commits or Git mutation. Unrelated dirty work preserved.

## Checks run
- Read review instructions, Plan r2, coordination contract, charter, SYSTEM_DESIGN, HARVEST_BRIEF, all 66 task context rows, roadmap, homepage, current work report, cited skeleton requirements and relevant STRATEGY_BRIEF rows. The strategy citations used by the CSV concern comparison/documentation goals and do not reintroduce superseded mechanisms.
- Inspected the scoped R/site diffs, table-controls script, Quarto navigation/resources, status styling, and source of focused R and browser checks; no tests executed. Search/filter/reset labels match the implemented all-words/intersection/semicolon-package semantics (`site/assets/table-tools.js:33-44,86-106`).
- Inspected the two saved global handoffs only as static site inputs; did not validate or refresh their package claims. Latest eligible handoff holds Recommendation, Task states and blockers, and Parallel work directly; its missing sibling exposes P2.1.
- Read local Brain index and bounded design/harvest topic excerpt; its October 7 feature-status entries are stale against the current roadmap, so they did not supply delivery/readiness authority. No remote Brain retrieval or index tooling run.
- Read-only Git status/rev-parse/branch verified main at `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`. Git diff restricted to task implementation files; no unrelated dirty file bodies reviewed.
- Read-only Test-Path confirmed the latest report's `assessment.md` absent and `handoff.md` present. System clock at final checkpoint: 2026-11-02 16:20 EST / 2026-11-02T21:20:05Z.

## Gaps
- No tests, render, browser execution, package repository reads or generated .cg-docs/views body reads permitted or performed.
- Existing suite/render/browser passes were supplied by the requester, not independently reproduced. At the time read, the execution report still marked V2/V3/V4 pending (`.cg-docs/work-reports/2026-11-02-site-focus-and-navigation.md:28-31`); this review makes no claim about their later completion.
- Source-only navigation assessment, not an executed link crawl or visual/browser audit. Suggested functional checks belong to the implementer's authorized correction stage.
- No package repository was read; package SHAs appearing in saved assessments remain inherited evidence, not newly verified provenance. No live readiness or implementation-delivery certification is given.
- Reversible hardening and unrelated documentation coverage were not expanded into scope. No protected history, charter, configuration, roadmap, schema or .github asset is proposed for deletion, replacement, rename or move.
