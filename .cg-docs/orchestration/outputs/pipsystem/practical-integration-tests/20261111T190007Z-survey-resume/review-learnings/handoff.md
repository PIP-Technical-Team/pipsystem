---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-learnings
status: completed
updated: 2026-11-11T19:05:59Z
owner: review-learnings
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1 Phase 2
next: Execution owner finishes fresh attempt; coordinator evaluates original V1-V5 using completed evidence, not this historical review.
---

# Learnings review: installed-package one-survey resume

## Summary
No issues found: no supported new P0-P3 defect from this learnings review of the existing example scripts and historical evidence. This is not fresh runtime acceptance or whole-Plan completion. Requested fresh combination is pipdata c5b27fa4458d7175aca81a203762bae81e9f0b40 and pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5, with other pins retained. Current setup.R:9-22 declares that combination; installed/loaded agreement is not independently verified here. Partial runtime was not read as final evidence.

## Changes
Created this required report at review start and finalized it. No source, package, environment or Git changes; no downloads, R processes, installers or test execution.

## Related Learnings

Paths below are relative to pipsystem. Historical package-source claims are attributed to their reports, not independently refreshed package-source inspection. Advisory labels indicate application guidance, not new defect findings.

### Directly Relevant

1. **[.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md](../../../../../../solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md) — Verify Design Integration Without Claiming Runtime Completion.** [advisory]
   **Relevance:** Lines 22-31,60,64-71 distinguish approved changes, source/document checks and runtime capability; resolved approvals must not remain current blockers.
   **Key takeaway:** The newly authorized combination permits a new attempt, but proves neither numerical correctness nor rejection. Preserve the earlier first failure without assuming it still occurs at new pins. Do not request already-granted pin authorization again.

2. **.cg-docs/reviews/2026-11-10-survey-resume-review.md — Survey Resumption Full Review.** [advisory]
   **Relevance:** Lines 23-27 record fixed QS2 usability/provenance and diagnostic-wording findings. Lines 30-41,63-64 establish historical completed validation but a first-run master failure before clean/metadata; V3 was not reached and V4 downstream rejection was not certified.
   **Key takeaway:** Keep the actual storage smoke check, not just namespace checks: current experiments/one-survey/setup.R:25-30,38-55 retains existing compatible dependency origins and a real QS2 equality roundtrip. Do not report the historical P2/P3 as newly open. The old failure involved pipdata 13a38280c1eafe7e03a97837cdb57833fbe9d926 and pipload ff9a81e386a09fb2531c154f63fd2b91521313c6, not the fresh combination.

3. **.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T223242Z-survey-resume/review-learnings/handoff.md — Prior learnings review.** [advisory]
   **Relevance:** Lines 30-48 trace installer-child isolation, full-seven usable-package proof, bounded globals behavior, transport-only substitutions and non-vacuous malformed controls; lines 54-56 distinguish independent pip/pip_meta pins from custom sidecars.
   **Key takeaway:** Retain repaired isolation and provenance rather than add another installer/framework. Current run.ps1:35-60,74-90,99-108 establishes child environment, startup path audit and finally-restoration; setup.R:193-230 checks receipts, provenance and actual loaded paths. These are inspected mechanisms, not independently executed results in this review.

4. **.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md — Accepted synthetic fixture.** [advisory]
   **Relevance:** Lines 40-44,56-59 specify daily LCU 1,2,3,4 and person weights 10,20,30,40 with preserved alignment, not household-size multiplication or normalization.
   **Key takeaway:** Current scenario.R:16-22,162-172 compares paired literal rows after annual welfare conversion and checks total weight 100. No independent sorting, double daily conversion or deflation/population scope should be added. The brainstorm's later deflation controls are not this Plan's requirements.

5. **Original Plan revision 1, .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md.** [advisory]
   **Relevance:** Lines 49-53,64,89-92 require completed missing-weight invalid classification, specific diagnostic and no downstream artifact for a fresh malformed identity; an exception or no-work is not rejection.
   **Key takeaway:** Current scenario.R:27-34,75-84,124-138 uses a distinct SYNB identity/checksum and checks successful validation with invalid status plus the weight diagnostic. Lines 143-178 require the real clean path, successful valid-row readbacks and no SYNB artifact in both downstream catalogs. Empty catalogs from a failed clean wrapper cannot alone satisfy V4.

### Potentially Related

1. **.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md — Version Metadata: Safeguards Approved.** [advisory]
   **Relevance:** Lines 176-190 require data/metadata historical consistency but leave implementation mechanisms open. Current scenario.R:150-161 reads separate data and metadata artifact versions returned by the master, rather than substituting latest. Do not equate separate pip_meta artifacts with a custom stamp sidecar.
2. **.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md — Boundary contracts.** [advisory]
   **Relevance:** Lines 130-140 explicitly label detailed contracts PROPOSED; line 140 distinguishes separate QS2 metadata artifacts. Use the distinction as context, not permission to impose every proposed schema or expand this example. Original Plan:64 explicitly leaves selection after a later save UNKNOWN.

### Patterns to Follow
- Smallest complete exported public-path example; transport-only fixture substitutions are enumerated at scenario.R:35-43 and restored at :44-85. Real storage/validation/cleaning remain exercised rather than replaced.
- Keep fresh installed identity/provenance, actual numeric/readback values, completed invalid classification and no-output checks as separate evidence claims.
- Preserve first-failure evidence (scenario.R:181-187); previous reviewer completion and owner fixes do not establish a fresh pass.
- Use existing installed tools and data.table/collapse. Add no general framework or new safeguard for easily reversible failures; each implementation change still needs its functional check. Keep any Plan about two pages.

### Anti-Patterns to Avoid
- Latest metadata fallback, private-worker bypass, prepopulated fabricated master, independently sorted values, no-work/exception as rejection, inventory existence as namespace/storage usability, and reuse of an old successful run as current proof.
- Reopening fixed historical findings or declaring the old package blocker still current without the new attempt's evidence.
- Expanding to deflation/mean, production, historical multi-save certification or changes to protected knowledge/design artifacts.

### No Relevant Learnings Found
No previously proven solution for successful execution of this exact fresh pipdata/pipload combination was found. The sole solution document supplies evidence-gating guidance, not a successful one-survey runtime recipe.

## Checks run
- Loaded technical communication, R testing and R data.table skills; inspected R logic without running it. The Plan's installed-package restriction takes precedence over generic skill suggestions to use load_all().
- Read required charter/design/harvest context, pip-handoff-v2 contract and original Plan revision 1.
- Tier 1/2: explicit .cg-docs directory read shows neither DIGEST.md nor search-index.json. Queried solutions for survey/installed/missing-weight/exact-version/pipload/pipdata (no keyword hits); explicit recursive file lookup recovered the sole general evidence-gating solution and category .gitkeep placeholders. Read that full solution. Initial relative glob misses were not treated as proof of absence.
- Queried brainstorms before reading selected metadata/contract/fixture passages; read requested 2026-11-10-survey-resume-review.md and prior learnings report.
- Read current experiments/one-survey/scenario.R, setup.R and run.ps1; scoped inspection to historical lessons and existing mechanisms. No partial new runtime or logs used.
- Read-only Git recorded pipsystem main at e9c71e3190f1ce88a017ae25af7c373a64c655a2. No package repository was directly read, so no fresh package-source SHA claim is made.
- Read system clock for report timestamp. Only report writes occurred, under the exact requested E: pipsystem path.
- Functional report check: read back saved v2 metadata, findings, required headings and nonempty Gaps before stopping. R/PowerShell functional checks, V1-V5 acceptance and final mode:verify are execution/coordinator responsibilities and were not run here.

## Gaps
- Fresh numeric outputs, exact-version readbacks, malformed downstream rejection and installed/loaded compatibility of the authorized combination are not yet proven by this review; implementation was still executing when assigned.
- Current scripts are a concurrent source snapshot, not a frozen post-run full code audit. No direct package-source review, test rerun or OS-wide write trace was performed.
- Prior completed validation and corrected QS2 setup belong to the 2026-11-10 run, not fresh evidence. Its master-loading failure is retained history, not a current blocker declaration.
- No live DLW, production, deflation/mean, incremental-rebuild certification or historical pin selection after a later save is established or requested. Required outer full review and final verification remain with the coordinator.
