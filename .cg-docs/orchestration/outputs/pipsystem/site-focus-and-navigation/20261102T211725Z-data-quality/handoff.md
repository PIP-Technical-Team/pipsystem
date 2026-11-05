---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T211725Z-data-quality
status: completed
updated: 2026-11-02T21:19:57Z
owner: cg-data-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r2
next: Implementation coordinator triages the two safe_auto P2 findings; no fixes applied by this reviewer.
---

# Data-quality review

## Summary
Completed scoped static data-quality review against main baseline HEAD. Findings: P0 0, P1 0, P2 2, P3 0. No numerical data processing is in scope. Both findings concern evidence fidelity in the newly added focus display, not statistical results or package readiness.

## Findings

### P2.1 — Full-evidence link targets a nonexistent optional file [safe_auto]

**[P2]** `tools/pipsys/pipsys.R:1170` -- The handoff-only recommendation path still links to assessment.md.

**Issue**: Line 1159 correctly falls back to handoff.md content when assessment.md is absent, but line 1170 unconditionally emits the assessment.md URL. This affects the currently selected completed run, not only a hypothetical input: `outputs/pipsystem/pip-next-global/20261102T210006Z-assessment/` contains only handoff.md; that handoff has updated 2026-11-02T21:01:54Z and a Recommendation section at lines 21-26. It sorts ahead of the other completed run updated 2026-11-02T20:46:14Z. Paths in this paragraph are beneath `.cg-docs/orchestration/`.

**Impact**: On both the homepage and overview, “Full assessment and evidence” opens a missing file rather than the selected assessment's evidence and gaps. The separate Source handoff link still works, so the evidence is not wholly inaccessible.

**Fix**: Resolve the actual source once (`assessment.md` if present, otherwise `handoff.md`), then read and link that same source. Add one fixture assertion for a Recommendation section in a handoff-only run, verifying the full-evidence link targets the handoff. No new validation framework is needed.

### P2.2 — Eligible lenient handoff loses its recorded next action [safe_auto]

**[P2]** `tools/pipsys/pipsys.R:1153` -- Focus fallback does not use the reader that made the handoff eligible.

**Issue**: `read_handoff()` accepts `pip-handoff-v2` through `simple_frontmatter()` when full YAML parsing fails (`tools/pipsys/pipsys.R:335-349`). `focus_page()` subsequently rereads only strict `read_frontmatter()`. For a supported lenient completed/dated handoff without a Recommendation section, its valid recorded next field becomes UNKNOWN at line 1172 even though eligibility and the CLI reader successfully recognized it. Existing tests demonstrate the supported input class (`tests/pipsys/test-pipsys.R:151-156`), and the contract documents lenient reading (`.cg-docs/orchestration/CONTRACT.md:91-93`). A strict handoff with an absent next field instead renders '-' via as_chr, contrary to the explicit UNKNOWN convention.

**Impact**: The site can select a real saved assessment but hide its available next action, making missingness appear to be in the evidence rather than in the new display path. The CLI's successful/truncated read and the site's UNKNOWN result disagree.

**Fix**: In this site-only path, apply the existing simple_frontmatter fallback when strict parsing returns NULL, preserve the full next text, and map absent/blank next values to UNKNOWN. Keep the CLI's 100-character projection unchanged. Add one focused fixture with a lenient handoff and full next text; include the missing-next expectation in that fixture/test group.

## Reviewed conclusions

- Selection uses only direct `pip-next-global/<run>/handoff.md` inputs, completed status, parseable updated values, descending assessment time and descending run-ID tie order (`tools/pipsys/pipsys.R:1129-1145`). Invalid completed dates are excluded and listed; no assessment execution is triggered (`:1178-1183`). No issue found in the new ordering/eligibility logic on static inspection.
- `context[rows, on = "feature_id"]` preserves roadmap rows/order and uses companion context only for presentation. Current CSV has one row per current feature ID; source inspection and the existing test assertions cover duplicate IDs and set equality (`tables/site_task_context.csv:2-67`; `tests/pipsys/test-pipsys.R:929-946`). No current cardinality or package-token defect found. Missing context is normalized to UNKNOWN (`tools/pipsys/pipsys.R:1230-1234`). No generic validation framework recommended.
- Reviewed all context descriptions against their cited current design/harvest requirements, bounded M2 requirements (`.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:134-142`), and compatible strategy lines 168,184,198-199,208. They retain module-bearing identity, Open R1, independent result storage, stamp rebuild authority, pipdata coordination, and pure pipster calculations. They describe intended results, not delivery certifications (`tools/pipsys/pipsys.R:1469`).
- Target package roles are copied from the current design table, with wbpip Open and piptm out of scope; pipsystem's added boundary is design/evidence/development coordination, not pipeline execution (`tools/pipsys/pipsys.R:1237-1250`; `SYSTEM_DESIGN.md:284-311`; `compound-gpid.md:31-33`). No mistaken author-as-action-owner, fresh readiness or integration certification was introduced by the reviewed display path. Recorded charter focus is explicitly distinguished from a current integration check (`tools/pipsys/pipsys.R:1192-1195`).
- Package filters split semicolon-separated values and combine exact membership with all selected dimensions and search terms; status text is preserved (`site/assets/table-tools.js:40-70,86-108`). No data loss/filter semantic issue found in static inspection.

## Changes
Only this report was created and finalized. No implementation, package, protected-history, charter, configuration, roadmap or unrelated dirty-file changes. No commits, pushes, merges, deletions or Git mutations.

## Checks run
- Read-only Git: `git rev-parse HEAD`, `git branch --show-current`, scoped `git diff --stat`, scoped implementation/test diff and scoped changed-path list. HEAD is 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39 on main. Git emitted line-ending warnings only.
- Static inspection of all 11 named implementation/context/site/test files, including new/untracked files read directly. Read Plan r2, current design, charter/config, harvest brief, handoff contract, roadmap feature metadata, cited strategy excerpts and bounded M2 requirements. Read the two global handoffs and confirmed the selected run directory's contents using the read tool.
- Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable, cg-skill-r-collapse and cg-skill-r-testing. Local Brain index/targeted metadata provided no additional directly relevant site/parser lesson; no remote Brain or other process was launched.
- Tests, browser checks and site generation: NOT RUN, as explicitly requested. Existing test source and browser fixtures were inspected, not executed. The passing outcomes stated in the request remain user-reported.
- No package repositories or `.cg-docs/views` bodies read. Package SHAs were not collected because no package repository was inspected. Package provenance appearing in saved assessments remains inherited, not independently verified.
- All reviewer writes are confined to this E: report; no cache/temp/browser/test processes were started.

## Gaps
- Findings are demonstrated by static branch/source and directory inspection, not new runtime executions. Suggested fixture checks remain for the implementation coordinator under the approved execution scope.
- Prior passing test/browser results are user-reported, not independently executed here. Date parser edge cases outside the changed eligibility logic were not exhaustively tested.
- The review does not certify package implementation, integration, scientific contracts, installed runtime identities, production behavior or numerical results. No numerical data was processed.
- No fixes were applied; both P2 findings remain open for triage. Broader reversible hardening is Later, not a requirement of this review.
