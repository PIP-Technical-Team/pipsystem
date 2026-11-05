---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-reproducibility
status: completed
updated: 2026-11-02T21:19:52Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Coordinator triages two source-link findings; no fixes applied by this reviewer.
---

# Reproducibility review

## Summary
Completed the scoped static reproducibility review against main baseline `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`, Plan r2. Two P2 findings; no P0/P1 findings. No implementation edits, test runs, browser launches, pipeline runs, or package-repository reads.

### Findings

**[P2.1]** `tools/pipsys/pipsys.R:1127` -- Source URLs do not encode URL-significant checkout-root characters. **[safe_auto]**

**Issue**: `site_source()` encodes spaces only. For an otherwise valid Windows checkout such as `E:/work/pipsystem#review`, a generated URL becomes `file:///E:/work/pipsystem#review/SYSTEM_DESIGN.md`; the browser treats everything after `#` as a fragment rather than the file path. Literal `%` sequences in checkout names are likewise interpreted as URL escapes. The new handoff, charter, responsibility and task-evidence links therefore need not resolve after rebuilding in another checkout root. This is a static URL-semantics finding; the current root contains neither character.

**Fix**: Percent-encode path components when constructing the file URI, preserving drive/path separators and encoding literal `%`, `#` and `?`. Use an installed/base facility, not a new dependency. Add a focused expected-URI check for a root containing a space, `#` and `%`; do not alter canonical source paths.

**[P2.2]** `tools/pipsys/pipsys.R:1170` -- Handoff-only Recommendation fallback links to a nonexistent assessment document. **[safe_auto]**

**Issue**: Lines 1158-1159 deliberately read `handoff.md` when `assessment.md` does not exist. If that handoff contains a nonempty `## Recommendation`, lines 1160-1170 display its recommendation but unconditionally make “Full assessment and evidence” link to `assessment.md`. This supported input shape produces a broken evidence link despite having a valid source handoff. The earlier Source handoff link remains valid, so this is not loss of the underlying evidence.

**Fix**: Set one selected detail-source path to existing `assessment.md` or otherwise `handoff.md`; use it consistently for reading, relative-link context and the full-evidence link. Add one fixture with a completed dated handoff containing Recommendation but no assessment file.

## Changes
Only this requested handoff report. No code changes or commits.

## Checks run
Read-only Git status, branch, HEAD, scoped diff statistics and scoped tracked diffs inspected. Read all 11 requested implementation/context/test files, Plan r2, coordination contract, project charter/design/harvest brief and relevant existing date/link/render helpers. Required R technical and technical communication skills loaded; data.table and R testing skills also loaded.

Static checks found:
- Global advice is restricted to direct `pip-next-global` run handoffs, sorted descending by parsed updated time then run ID; incomplete and unparseable-date records do not qualify (`tools/pipsys/pipsys.R:1132-1145`).
- Recorded assessment time and no-reassessment caveats are explicit; charter focus is separately labeled (`tools/pipsys/pipsys.R:1147-1155,1184-1195`; `site/index.md:65`).
- Presentation context joins by feature ID and does not replace canonical roadmap status/Plan fields (`tools/pipsys/pipsys.R:1210-1234`; `tables/site_task_context.csv:1`). Intended results and package involvement are explicitly not delivery/assignment claims (`tools/pipsys/pipsys.R:1469`).
- New table controls are dependency-free classic JavaScript; only explicitly wrapped tables are enhanced, and static rows remain in the source (`site/assets/table-tools.js:14-27,86-115`).
- Browser runner resolves its root/base to E:, checks runtime child directories, redirects temp/profile/cache/crash/log outputs, and uses installed Chrome without download (`tests/pipsys/check-site-browser.py:34-49,64-78`). Existing Quarto redirects and CLI temp wrapper were inspected, not executed (`tools/pipsys/pipsys.R:1684-1711`; `tools/pipsys/pipsys.cmd:5-18`).
- No new stochastic analysis, dependency installation, or research-run manifest requirement was introduced in the scoped changes; seed/analysis-environment additions are not proposed for this presentation task.

Tests, rendering, browser fixtures, pipeline and package checks: NOT RUN, as expressly requested. Existing suite/render/17+34-browser/script-free-fallback passes are user-reported, not independently verified here.

## Gaps
- Static review only; the two described input/root variants were reasoned from source and URL rules, not executed.
- Runtime containment is source-reviewed, not an audit of all writes from Chrome/Quarto or their installed versions. Existing reported suite/render/browser passes are user-supplied evidence, not independently rerun.
- No package repositories or generated `.cg-docs/views` bodies were read; package provenance and pipeline numerical reproducibility are outside this review.
- No project Brain file was found by filename discovery. No broader cross-agent review is claimed; this is the requested reproducibility specialist result.
- Both findings remain open for the coordinator; no source edits, Git mutations, protected-history changes or unrelated dirty-file changes were made.
