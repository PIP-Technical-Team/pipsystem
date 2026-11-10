---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T213600Z-plan-critic
status: completed
updated: 2026-11-09T21:38:12Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinator considers four P2 plan corrections; this review does not authorize implementation.
---

# Installed-package example plan review

## Summary
Review complete: four actionable P2 findings; no P0 or P1 established. The installed-library isolation and row-aligned numerical expectations are directionally sound. No execution, package edits, plan edits or scope changes performed. Requested resolution is supplied as specific proposed corrections, not applied edits, respecting review-only scope.

## Changes
Created and finalized this required report only. No commits, package changes or plan edits.

## Findings

- **[P2.1] [cg-plan-critic] Context: plan line 21 — Correct the stale invalid-row premise before interpreting failures.**
  **Issue:** The plan treats the vignette's invalid-row admission policy as the existing implementation, although the exact referenced source revision already rejects those rows and validates formatted output.
  **Evidence:** `Processing-Data.Rmd:83-100` does describe both valid and invalid rows, but pipdata at `13a38280c1eafe7e03a97837cdb57833fbe9d926`, `R/dependency_execution.R:214-231`, filters to valid/Yes only. `R/pd_process_data.R:226-248` enforces the same clean eligibility and calls `pd_validate_clean_output()`; its independently exported `process_data()` does so at lines 350-370 too. The source guard agrees with `SYSTEM_DESIGN.md:209-213` rather than contradicting it.
  **Impact:** A worker can mislabel a documentation discrepancy as an established package/design failure, prescribe the wrong owner action, or expect a rejection failure that this revision has already addressed.
  **Fix:** State that the cited vignette conflicts with current source; retain runtime verification as unexecuted. Report any actual reproduced failure separately. List the stale vignette as a documentation-owner direction without editing the read-only package.

- **[P2.2] [cg-plan-critic] Step 2: plan lines 44-47, V3 line 84 — One saved version cannot demonstrate historical exact-pin readback.**
  **Issue:** Saving one data/metadata pair and reading its pins cannot distinguish a genuinely version-pinned reader from one that ignores the supplied version and reads latest.
  **Evidence:** These are the only save/read scenarios in the plan; no later distinguishable version is required. `SYSTEM_DESIGN.md:135` explicitly requires historical data to use metadata from the same pinned version, and lines 139 and 309 identify version-aware metadata integration as Open. The cited `PIP-data-pipeline.Rmd:287-305` is a one-version illustrative read, not executed historical evidence.
  **Impact:** V3 can pass while the historical metadata failure explicitly named in the risk table (plan line 69) remains undetected.
  **Fix:** In the same isolated one-survey store, preserve the first pins, make a distinguishable second version through real public storage, then assert that reading each original exact pin still returns its original expected values/metadata while the newer version is distinguishable. If that is deliberately not tested, narrow the evidence claim to single-version readback and explicitly retain historical retrieval as UNKNOWN; do not claim the historical risk was checked.

- **[P2.3] [cg-plan-critic] Step 2: plan lines 44-46, V4 line 85 — Define a non-vacuous malformed-survey control.**
  **Issue:** The plan specifies no output but not the positive evidence that the malformed input actually reached validation and was classified invalid, nor how its key/store is kept distinct from the valid run.
  **Evidence:** At the recorded pipdata SHA, `vignettes/articles/Validating-Data.Rmd:71-102` distinguishes failed, no_work and disabled/dependency-blocked results; lines 156-170 select absent survey/checksum keys and distinguish completed invalid classifications from execution failures. Thus neither a skipped cached key nor a missing-dependency/load failure demonstrates malformed-input rejection. Plan line 45 names only a missing-weight control without these outcome criteria.
  **Impact:** A no-output run can be credited as rejection even though the intended validator never examined the malformed data; reusing the positive run's cached key can also prevent the control from executing.
  **Fix:** Give the control a fresh isolated store or distinct survey/checksum key, require a completed invalid inventory row and a missing-weight diagnostic for that exact input, assert no execution failures/no_work/not_run substitute, then prove no clean or metadata artifact was created for that identity. These are assertions within the existing single negative control, not another framework or package change.

- **[P2.4] [cg-plan-critic] Step 3: plan lines 49-55 — Move the work-command lifecycle outside its own executable steps.**
  **Issue:** Step 3 tells an implementing worker to run `/cg-work` while that command is already executing this plan, and places the before-work review instruction after the installation and scenario steps. Literal execution can re-enter the same incomplete phase instead of reaching final review.
  **Evidence:** Plan lines 31-47 place installation and scenario before Step 3; line 52 then says both run plan review before work and run `/cg-work`. `.kilo/commands/cg-work.md:69-89` selects the first incomplete phase; lines 176-188 only mark it complete after its steps. Lines 225-237 dispatch routed review after implementation. V5 at plan line 86 requires this lifecycle evidence before completion.
  **Impact:** Work can begin before plan-review corrections, or recursively re-execute Phase 2 while trying to satisfy its own review/completion gate.
  **Fix:** Put plan review and resolution in a pre-execution prerequisite. Treat `/cg-work` invocation as the outer execution instruction, not an executable step. Keep Step 3 for one explicit full review, in-scope corrections and final verify, with required reports saved before declaring completion. Preserve the package-failure blocked-stop rule and do not expand correction scope into package edits.

## Checks run
- Read plan, exact charter, SYSTEM_DESIGN.md, HARVEST_BRIEF.md and handoff contract.
- Read-only Git: pipsystem HEAD f9454707b292a620e25abef17f2e515794020ba7 on main; pipdata HEAD 13a38280c1eafe7e03a97837cdb57833fbe9d926 with clean status.
- Read the three cited pipdata articles (pipeline overview, processing and validation), acceptance fixture helper, public wrapper implementation, clean implementation and validation filter at that SHA.
- Read `.kilo/commands/cg-work.md` and `.kilo/shared/review-routing.contract.md` to verify lifecycle and review dispatch assumptions.
- Static charter/design comparison: no proposal to introduce PIP concepts in stamp, move runtime orchestration into pipsystem, implement deferred deflation/mean, or change protected decisions. Legacy stage reuse is not certification of stamp-selected orchestration (`SYSTEM_DESIGN.md:307`; overview article lines 312-314).
- Plan's explicit source snapshots, dedicated library, no ambient user/site fallback, pre-child environment isolation and resolved-path checks cover the main installation isolation requirements on paper. Row-aligned welfare 1,2,3,4 with unchanged person weights 10,20,30,40 matches the cited fixture semantics (`helper-one-survey-upstream-acceptance.R:122-130`); no independent-vector sorting loophole identified.
- Exit read-only checks: no Git diff for the reviewed plan; pipdata status remains clean. No R, installation, test suite or pipeline was run.

## Gaps
- Runtime isolation, dependency availability, public-path execution, numerical results and actual historical storage behavior remain unexecuted/UNKNOWN. This is a plan review, not a reproduced package failure or a readiness certification.
- Findings remain proposed corrections: user explicitly prohibited plan edits and package edits. Coordinator must consider them before implementation.
- Only pipdata package repository was read directly; its full SHA is recorded above. Other package behavior was not independently inspected or certified.
