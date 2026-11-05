---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-testing
status: completed
updated: 2026-11-02T21:20:26Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Coordinator triages the two P2 testing findings in this handoff; no fixes applied by reviewer.
---

# Testing review: site focus and navigation

## Summary
Inspection-only mandatory-emphasis testing review complete against baseline 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39 and Plan r2. Two P2 findings; no P0/P1 findings. No tests, renders, browsers, servers, or other background processes started. Execution pass counts supplied in the request were not independently rerun.

### Findings

**[P2] [safe_auto]** `tests/pipsys/test-pipsys.R:859-889` -- Latest completed advice ordering is not actually exercised.
**Issue**: The focus fixture contains exactly one eligible completed report (the other reports are running or invalid-dated). It verifies eligibility, but would still pass if `focus_page()` selected the oldest completed report or used ascending run-ID tie order. Its own ordering at `tools/pipsys/pipsys.R:1143-1150` is separate from `handoff_table()` ordering tested at `tests/pipsys/test-pipsys.R:191-233`; those existing tests cannot detect a regression here. Selecting the latest completed global assessment is a required behavior (Plan r2:50,53).
**Fix**: Extend the existing tiny fixture with an older completed report whose run ID sorts later; assert only the newer completed report's distinctive advice and assessment time appear. Add an equal-time completed pair and assert descending run-ID tie selection. Keep the newer running/invalid-date cases. These are direct feature checks, not a new validation framework. No selection-code defect is asserted from inspection.

**[P2] [safe_auto]** `tests/pipsys/test-pipsys.R:859-889` -- Named recommendation/fallback variants lack tests, leaving broken source links and missing-value presentation undetected.
**Issue**: This test only exercises Summary/next fallback; it never writes a Recommendation section or `assessment.md`. In the untested named-section branch, `tools/pipsys/pipsys.R:1158-1170` reads `handoff.md` when `assessment.md` is absent, but still emits the full-assessment link to the nonexistent `assessment.md`. Missing blocker/parallel sections are silently omitted at lines 1163-1168, with no UNKNOWN equivalent to the fallback line 1176. Separately, a valid handoff with absent/null `next` renders `Recorded next action: -` at line 1172 because `as_chr()` returns `-` for missing values (lines 53-55). These conflict with R1's linked evidence and explicit absent values (Plan r2:39,50). The rendered-browser fixture checks only the general caveat, not the selected advice's fields or source targets (`tests/pipsys/site-render-browser.html:43-46`).
**Fix**: Add bounded focus fixtures for Recommendation in handoff without a detail file, Recommendation in an existing detail file with named blocker/parallel sections, and absent next/optional sections. Assert exact included advice, real source target, exclusion of unrelated/fenced sections, and explicit UNKNOWN labels where evidence is absent. Use the actual selected source path for the full-assessment link; normalize missing next to UNKNOWN and render an explicit absent-section/owner note in the named branch. Do not substitute the assessment author for the action owner. Preserve the CLI truncation/schema.

## Changes
Only this assigned handoff created/updated. Implementation, tests, protected artifacts, other reports, and unrelated dirty files unchanged. No commits or other Git mutation. No package repositories read.

## Checks run
- Read Plan r2 and coordination contract; loaded R technical and testing skills.
- Read-only Git confirms main at baseline 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39.
- Read task-only Git diffs and requested new files: `tools/pipsys/pipsys.R`, `site/index.md`, `site/_quarto.yml`, `site/custom.scss`, `site/assets/aos-body.html`, `site/assets/table-tools.js`, `tables/site_task_context.csv`, `tests/pipsys/test-pipsys.R`, `tests/pipsys/check-site-browser.py`, `tests/pipsys/site-table-browser.html`, `tests/pipsys/site-render-browser.html`.
- Inspected existing nearby R assertions relevant to CLI compatibility. Fixed overview header/content assertions remain at `tests/pipsys/test-pipsys.R:450-496`; roadmap CLI projections are explicitly checked at lines 905-906. The diff leaves CLI functions and the 100-character `read_handoff()` truncation unchanged (`tools/pipsys/pipsys.R:349`). No separate CLI regression found by inspection.
- Browser fixture genuinely loads the production local classic script and dispatches input/change/reset events. It checks multi-package membership, filter intersection, all-word text search, no matches, count, reset and two-table isolation (`tests/pipsys/site-table-browser.html:20-61`). The rendered-site fixture checks all six page types offline and actual roadmap row interactions (`tests/pipsys/site-render-browser.html:7-12,37-60`). No mock-target drift: production table code, rather than a mocked implementation, is exercised.
- Theme fixture evaluates computed foreground/background contrast for the five status legend classes in light/dark body-class states (`tests/pipsys/site-render-browser.html:62-70`); matching class-based styles exist in `site/custom.scss:323-345`.
- Static runner explicitly strips page scripts and supplies the original base URL, then counts each canonical feature ID exactly once and rejects scripts/controls (`tests/pipsys/check-site-browser.py:54-63,81-91`). This is honestly labeled script-free-copy evidence, not a successful native JavaScript-disabled Blink run.
- No runtime checks performed, per request. Reported prior checks: full testthat pass, site render exit 0, 17 native fixture checks, 34 rendered-site checks, and all 66 feature IDs in a script-free copy. These remain user-reported results.
- Read-only Git status showed pre-existing unrelated dirty/untracked paths; none were edited. A timestamp probe using unsupported PowerShell 5.1 `Get-Date -AsUTC` failed; corrected read-only UTC clock query succeeded. This had no effect on tests or findings.

## Gaps
- Tests and browsers will not be rerun, as requested. Prior passing execution results are user-reported rather than independently reproduced.
- Findings above are inspection-derived; no defect was dynamically reproduced or mutation-tested in this review.
- Script-free static coverage proves task IDs survive HTML parsing, not every page's full visual behavior with browser-level JavaScript disabled. This limitation is already explicitly disclosed; no additional framework or blocker proposed.
- Theme evidence exercises class-based badge contrast, not Quarto's actual theme-toggle/stylesheet-loading interaction or a visual review of every control. No concrete theme defect established; broader visual checks are deferred rather than required hardening.
- Context assertions verify ID coverage, nontrivial descriptions and citation bounds (`tests/pipsys/test-pipsys.R:924-945`), not semantic correctness of every cited sentence; the parallel data/documentation review owns that judgment.
- No current package readiness, pipeline numerical correctness, live service behavior, public deployment, or production-storage behavior certified by this UI testing review.
