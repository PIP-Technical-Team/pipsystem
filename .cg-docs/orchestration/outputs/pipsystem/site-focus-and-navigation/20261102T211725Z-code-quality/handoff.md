---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-code-quality
status: completed
updated: 2026-11-02T21:20:09Z
owner: code-quality-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Coordinating implementer triages the three findings; this review makes no implementation changes.
---

# Site focus and navigation code-quality review

## Summary
Completed a read-only code-quality review of the eleven user-named files, limited to the task diff/new files against main HEAD 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39 and directly relevant helper context. Found two P2 issues and one P3 issue; no P0 or P1 issues found within this inspection. No fixes applied.

### Findings

**[P2] [safe_auto]** `tools/pipsys/pipsys.R:1184-1195` -- Recorded charter focus loses its source date.
**Issue**: The generated focus fragment copies only the Current Focus body and adds an undated source link. It never displays the charter's `last-reviewed` value (currently 2026-10-30 at `compound-gpid.md:5`). Readers see an assessment timestamp above this separate block but cannot date the older charter claims without opening the source. This misses the approved Plan's R1 requirement for clearly separated, dated recorded focus and advice (`.cg-docs/plans/2026-11-02-site-focus-and-navigation.md:39`). The new fixture supplies `last-reviewed` but never checks its display (`tests/pipsys/test-pipsys.R:861-863`).
**Fix**: Read and display the charter's `last-reviewed` under an explicit "Charter last reviewed" label beside its source, using UNKNOWN if absent; do not present it as a fresh integration check. Add one assertion to the existing focus fixture.

**[P2] [safe_auto]** `tools/pipsys/pipsys.R:1161-1170` -- Recommendation detail bypasses explicit missing-field fallbacks.
**Issue**: When a Recommendation section exists, missing or empty "Task states and blockers" and "Parallel work" sections are silently omitted. This branch also omits the action-owner UNKNOWN caveat supplied by the Summary fallback at line 1176. A completed assessment containing only a recommendation therefore gives no explicit indication that blockers, parallel options, or action ownership are unrecorded. R1 explicitly requires absent values to be explicit (Plan line 39); silence must not look like an assessment of no blockers.
**Fix**: Emit the existing labeled UNKNOWN caveat in both branches, and emit a short UNKNOWN placeholder for each missing optional section. Preserve any recorded owner text and never substitute the handoff author. Add one recommendation-only detail fixture to check these fallbacks.

**[P3] [safe_auto]** `tools/pipsys/pipsys.R:1170` -- Handoff-contained recommendation links to a nonexistent assessment file.
**Issue**: At line 1159, the code intentionally falls back to handoff lines when `assessment.md` is absent. If those lines contain a Recommendation section, this branch nevertheless emits "Full assessment and evidence" pointing at `assessment.md`, which does not exist. The source handoff link remains valid, but the additional evidence link is broken.
**Fix**: Track the actual detail source (`assessment.md` when present, otherwise the selected handoff) and use it for both reading and the evidence link. Check a handoff with Recommendation but no sibling assessment file.

## Changes
Only this assigned handoff was created and updated. No implementation files, unrelated dirty files, protected records, or package repositories were modified. No Git mutation or commits.

## Checks run
- Read-only Git status, branch and HEAD inspection confirmed main at the supplied baseline.
- Existing unrelated dirty files remain untouched.
- Inspected the tracked diff for tools/pipsys/pipsys.R, site/index.md, site/_quarto.yml, site/assets/aos-body.html, site/custom.scss, and tests/pipsys/test-pipsys.R.
- Read new site/assets/table-tools.js, tables/site_task_context.csv, tests/pipsys/check-site-browser.py, tests/pipsys/site-table-browser.html, and tests/pipsys/site-render-browser.html.
- Statically checked data.table joins/projections, fixed CLI isolation, recommendation selection and source fallbacks, local filter/reset/status logic, fixture expectations, and context CSV descriptions against the supplied Plan/current design where applicable.
- Loaded cg-skill-r-technical, cg-skill-r-shared, cg-skill-r-datatable, cg-skill-r-collapse, and cg-skill-r-testing for the configured data.table-collapse dialect.
- Final read-only Git HEAD check remained 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39. No tests or browser processes were started.

## Gaps
- No tests, browser processes, or package reads are authorized for this review. Previously reported test results are user-supplied, not independently reproduced.
- Review is the code-quality component of the requested data-risk review, not an independently executed multi-agent review or final verification of fixes. Findings are based on static control flow, not reproduced browser failures.
- No package readiness, production pipeline correctness, live repository integration, or deployment is certified. No .cg-docs/views bodies were read.
- All reviewer writes were confined to this assigned E: handoff. No runtime caches or other artifacts were created by reviewer-started tests or browsers because none ran.
