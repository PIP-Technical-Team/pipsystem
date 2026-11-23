---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-documentation
status: completed
updated: 2026-11-11T19:07:10Z
owner: documentation-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1 Phase 2
next: Coordinator triages two findings and integrates fresh execution evidence before final verification.
---

# Phase 2 documentation review

## Summary
Static documentation review complete: two findings (P2 1, P3 1; no supported P0/P1). Fresh runtime remains in progress and is not accepted by this review. Findings are proposals only; no source edits made.

### Findings

**[P2] [manual]** `experiments/one-survey/setup.R:70-74` -- Evidence mode assumes the earlier failed scenario.
**Issue**: The generic `evidence` mode reads `first-failure.rds` unconditionally and states that numeric/readback work was NOT REACHED and downstream processing BLOCKED. A fresh successful scenario writes `exact-readbacks.rds` and `scenario-assertions.txt` instead (`scenario.R:159-179`), so this mode would either abort on the missing failure file or print a false failure narrative if reused with retained failure evidence. These statements describe an old attempt, not a checked current outcome. This is a static branch mismatch, not an observed failure of the ongoing run.
**Fix**: Make evidence reporting describe the selected runtime's actual saved outcome. Report the failure boundary when present; otherwise report available assertions/readbacks without claiming broader historical or numerical acceptance. Preserve the old failure report as historical evidence rather than unconditional current-status text. One functional check of evidence mode against the fresh scenario's final outcome is sufficient; no extra framework is needed.

**[P3] [safe_auto]** `experiments/one-survey/scenario.R:1` -- Header makes the historical article baseline look like the runtime pin.
**Issue**: The header says “at pinned 13a38280”, whereas `setup.R:22` selects pipdata c5b27fa4458d7175aca81a203762bae81e9f0b40 and the Work Report explicitly authorizes that revision (`.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:131-134`). The earlier SHA can remain as the article-inspection baseline, but is no longer the installed pipdata revision.
**Fix**: Clarify that the articles were originally inspected at 13a38280 and that actual installed source pins are declared in setup.R and recorded in the runtime inventory. Static comparison with setup.R suffices to check this comment-only correction.

### Documentation contracts without additional findings
- Fixture-only survey, normalized auxiliaries and country inputs are explicitly disclosed (`scenario.R:15-40,90-119`); no auxiliary producer certification is claimed. Release CSV, PPP-vintage CSV/provenance, DLW catalog and download endpoint substitutions are individually listed (`:35-40,56-85`). The download replacement uses real pipload/stamp storage rather than an internal acceptance worker (`:82-83`).
- Readable public path is visible in sequence: release setup, auxiliary fixture storage, acquisition list, public validation wrapper, public cleaning/metadata wrapper and public reads (`scenario.R:87-158`). These are source-level observations, not proof that the current installed combination completes them.
- Exact saved data and metadata pins are selected separately from returned master fields and supplied explicitly to reads (`scenario.R:148-161`); latest is not substituted. Single-version readback does not establish historical pin selection after later writes, explicitly retained as UNKNOWN in the Plan (`:63-64`).
- Completed validation success, valid/invalid classification, zero execution failures and the missing-weight diagnostic are required before the cleaning call (`scenario.R:128-145`). No-work or execution failure is not described as malformed rejection. Downstream absence checks precede the final PASS marker (`:173-179`); no claim here that they ran.
- Original Work Report preserves failed attempts and their limited evidence, then starts the two-pin resumption with V1-V5 pending (`:97-115,126-137`). This is not a completion claim for the original Plan.

## Changes
Created this report only. No package or Git changes.

## Checks run
- Loaded technical communication and R technical/analytical skills.
- Read project charter, system design, harvest brief and handoff contract.
- Read-only Git identified pipsystem main at e9c71e3190f1ce88a017ae25af7c373a64c655a2.
- Read original revision 1 Plan, original Work Report including November 11 resumption, and complete scenario.R/setup.R/run.ps1 sources.
- Static cross-check of setup.R:16-22 against Work Report:49-57,87-95,131-134 found the current two authorized changes and retained five other declared pins; these are declarations, not fresh installed-provenance certification.
- Read-only `git diff --check` for scenario.R/setup.R/run.ps1 passed (LF/CRLF notice for setup.R only). This is whitespace checking, not execution or untracked-file validation.
- No R process, installer, download, package-source read, package/Git mutation or runtime evidence export was run by this reviewer. No test acceptance inferred from other workers.

## Gaps
- Two findings remain open for coordinator triage; this reviewer made no source fixes and did not verify corrections.
- Fresh execution is in progress; no new numerical acceptance is claimed.
- Only authorized pin changes are pipdata c5b27fa4458d7175aca81a203762bae81e9f0b40 and pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5.
- Current installed provenance, functional scenario acceptance, downstream malformed-output absence and final full-review/verify acceptance must come from the execution coordinator's fresh evidence. No live DLW, production, deflation, mean, incremental rebuilding or post-later-save historical retrieval certification is provided.
- This bounded review does not audit every repository README or package function. Script-local helpers are not exported package APIs, so no new roxygen export contract is imposed.
