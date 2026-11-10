---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T022000Z-followup-learnings
status: completed
updated: 2026-11-10T02:21:08Z
owner: followup-learnings
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: UNKNOWN
head: UNKNOWN
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consumes historical requirements during already-authorized follow-up execution and review; research role complete.
---

# Follow-up harness learnings

## Summary
Bounded historical-document review complete. **No supported current P0-P3 issues:** current implementation was deliberately neither read nor executed. Historical findings below are follow-up requirements, not allegations against unseen repaired code or verification passes. Current user authorization permits full follow-up execution by its assigned workers, not package edits or original survey execution. The Plan's review-only wording at lines 21 and 100 records its earlier state; it does not override current authorization.

## Changes
Only this handoff created and finalized. No commands, runtime, implementation reads, package/Git mutations, dependencies or protected-path changes/reorganization recommendations.

## Related Learnings

Source links (file:line citations below use root-relative paths):
- [Prior review](../../../../../reviews/2026-11-09-installed-package-one-survey-example-review.md), abbreviated Review below.
- [Follow-up Plan](../../../../../plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md), abbreviated Plan below.
- [Prior learnings](../20261109T222600Z-learnings/handoff.md).
- [October contracts](../../../../../brainstorms/2026-10-13-m2-stamp-contracts.md).
- [November gates](../../../../../brainstorms/2026-11-04-m2-phase3-deflation-gates.md).

### Directly Relevant
1. **Pre-write confinement and environment restoration.** Review `.cg-docs/reviews/2026-11-09-installed-package-one-survey-example-review.md:26-27,44-45` found omitted base-library/nested/link destinations and unrestored process environment, not an observed C: write. Plan `.cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md:38-41,73,82` requires actual pre-write rejection with E-only fixtures and restoration on success/failure. **Key takeaway:** validate real recursive and log targets before writes; finally must restore previous values, including previously unset values.

2. **Actual installer-child isolation.** Review `:29-30`; Plan `:39-40,59,74,96`. Parent `.Library` restriction and disabled user/site libraries did not establish the actual installation-child boundary. **Key takeaway:** restrict the child before dependency resolution; retain child library/namespace paths, exercise declared missing-dependency failure without fallback, and install/load one clean pinned package through that child. Full ecosystem installation is not required for this check (Plan `:40`).

3. **Fresh snapshots, not mutable overlays.** Review `:32-33`; Plan `:39-41,75,83`. Historical extraction/copy overlays could retain extra/removed files while inventory named pinned archives. **Key takeaway:** preserve old evidence, use a new empty attempt and dedicated library, reject populated/redirected destinations, retain the same seven full SHAs and copied dependency versions/origins. No moving refs, downloads or load_all.

4. **Inventory versus current successful-install receipts.** Review `:35-42,59-60`; Plan `:39-41,54,75`. Historical inventory preceded installation; five zero exits with --no-test-load were not usable runtime proof. **Key takeaway:** match required inventory/pins to successful current-install receipts and exact loaded paths. Exercise stale/incomplete inventory rejection, a behavioral failing baseline, the real declared dependency resolver and actual pre-write boundary. Inventory existence, Version strings and fabricated absent namespaces are insufficient; no general schema framework is required.

5. **Hooks and actual loaded identity.** `.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md:55-65,79-80,186-190,198`; prior learnings `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261109T222600Z-learnings/handoff.md:28-30,45`. Historical records distinguish source SHAs from installed/tested identities and describe hooks/cache/log/manifest effects plus cross-file fixture evaluation despite filtered tests. **Key takeaway:** inspect hooks and set child temp/home/R/cache/log roots before loading; retain actual loaded identities. October `:198` C: scratch suggestions conflict with current E-only requirements and must not be reused. These historical package behaviors were not refreshed here.

6. **Diagnosis is not original completion.** Plan `:18,23-25,43-48,63-68,76-77,90-98`; Review `:56-60,75-76`. **Key takeaway:** after step 1 passes, use isolated installed pipfun for the smallest fresh-root diagnostic; retain first result, arguments, provenance, downstream state and owner direction. Separate source-supported from runtime-confirmed cause. Do not patch packages/namespaces, precreate the cache, fake vintages or force an error. A reproduced error is not original V1 success or survey rejection; original V2-V4 remain historically unexecuted unless separately resumed. Follow-up still requires full review, affected reruns and final light verification, within two targeted correction attempts per step.

### Potentially Related
1. **Old runner bindings are not reusable proof.** `.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md:63-65,70-71,82-83` distinguishes canonical/linked adapters and requires fresh branch/library/store preflight. **Relevance:** supports current identity evidence, not adding deflation, mean, production or incremental checks to this follow-up.

### Patterns to Follow
- Smallest complete bounded result; one functional check per demonstrated boundary; installed tools; no new framework/matrix. Safeguards only for almost-irreversible harm (Plan `:50-54,93`).
- Map all seven historical findings to specific executed regression checks; preserve prior failure evidence and nonempty Gaps (Plan `:41,48,54,73-77,82`).
- Distinguish source-supported, runtime-confirmed, failed, not-run and completed states. Reviewer completion is not Plan completion.

### Anti-Patterns to Avoid
- Post-write path checks, parent-only isolation assertions, mutable source/dependency overlays.
- Inventory presence, Version strings or install exit zero as proof of current usable runtime provenance.
- Fabricated missing namespaces instead of real resolver controls; reproduced installation failure as successful survey evidence.
- Historical C: scratch paths or importing unrelated original-scenario scope.

### No Relevant Learnings Found
No `.cg-docs/solutions/**/*.md` files returned. DIGEST.md and search-index.json reads returned absent. No additional child-restriction or environment-restoration implementation recipe was established by the targeted brainstorms; the current Plan and prior review supply requirements, not an already-proven mechanism.

## Checks run
- Read Plan, prior review, prior learnings and selected passages of the two linked brainstorms; no broad unrelated Brain reread.
- Read charter/design constraints and harvest evidence rules; loaded communication and R technical skills. No analytical/data-manipulation claims evaluated.
- Tiered retrieval: missing DIGEST/index, empty solution glob, then targeted historical passages.
- No package source read: package SHA refresh not applicable. Historical identities remain attributed to their records, not fresh observations.
- No shell/runtime/test/Git commands; no command environment setup or indirect command writes. Only exact report path on E: written through file tools.
- Document readback checked v2 fields, citations, research-only limits and nonempty Gaps; corrected source links. No harness check claimed.

## Gaps
- Current implementation, actual child paths, confinement, fresh-source equality, receipts, environment restoration and diagnosis are UNKNOWN to this researcher; implementation/runtime reviewers own them.
- Historical issues are not asserted to persist. No supported current P0-P3 issue identified in this non-overlapping scope.
- Branch/HEAD not independently inspected because commands were excluded. No package source read and no new package SHA observation.
- Missing DIGEST/index/solution files limit recipe discovery; no index generation or broad unrelated search warranted.
- Current execution approval covers follow-up only, not package edits or original survey execution; this role certifies neither runtime nor Plan completion.
