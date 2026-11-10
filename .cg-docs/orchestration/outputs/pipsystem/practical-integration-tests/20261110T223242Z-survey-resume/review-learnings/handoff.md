---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-learnings
status: completed
updated: 2026-11-10T22:40:47Z
owner: cg-learnings-researcher
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent and concurrent implementation worker use these learnings during original V1-V5 execution and review; this research role is complete.
---

# Survey resumption learnings review

## Summary
Read-only evidence research complete. No supported current implementation P0-P3 defect is asserted: this role intentionally did not inspect concurrently edited experiments or execute tests. Seven actionable historical lessons below identify specific false-pass and isolation risks. Their P1/P2 labels prioritize application, not newly reproduced defects. Original Plan completion remains dependent on fresh full-seven setup and survey evidence, not the completed diagnostic follow-up.

## Changes
Only this required handoff created and updated. No experiment, package, environment, protected artifact or Git changes. No downloads or new processes that could create runtime/cache files.

## Related Learnings

All evidence paths below are relative to pipsystem. O = `.cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/`. Historical source claims are attributed to those reports, not independently refreshed package-source inspection.

### Directly Relevant

1. **[P1 priority, historical isolation risk] Actual child lookup differs from parent `.Library` rebinding.**
   **Evidence:** `.cg-docs/reviews/2026-11-09-installed-package-one-survey-example-review.md:26-33` identifies real destination checks, installer ambient fallback and mutable source overlays. `.cg-docs/reviews/2026-11-10-one-survey-harness-repair-and-diagnosis-review.md:24-30,35-45` records repaired private-child roots, fresh archives, namespace checks and successful stamp/pipfun loading. `O/20261110T130229Z-completion-learnings/handoff.md:31-44` separates actual installer/lazy-load logs, current receipt/dependency reconciliation and helper-own prewrite validation.
   **Key takeaway:** retain the repaired launcher/path/helper design; execute fresh full-seven installer and usable namespace evidence. Exact Git archives and parent library declarations alone cannot establish this boundary. Negative fixtures remain siblings, not contaminants inside the positive runtime (`completion-learnings:46-49`).

2. **[P1 priority, historical noncreating-path caveat] The authorized pipfun commit fixes NULL-vintage cache discovery, not every globals write.**
   **Evidence:** `.cg-docs/orchestration/outputs/pipfun/practical-integration-tests/20261110T152620Z-cache-fix/handoff.md:24,32-33,63,73,87-94`. The local corrected commit is `7d534516a8c17c33d537681610eccd4c29211762`; non-NULL vintage still creates an output directory independently of create_dir=FALSE. Thirteen tests/69 expectations establish that bounded package patch, not pipaux/full survey compatibility.
   **Key takeaway:** use the newly authorized exact archive pin and keep explicit-vintage setup contained; never infer that create_dir=FALSE universally forbids writes. The earlier missing-cache diagnosis is preserved history, not an unresolved missing-commit gate or current failure prediction.

3. **[P2 priority, full-seven proof] Two-package follow-up acceptance cannot satisfy original V1.**
   **Evidence:** `.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:43-57,87-90`; `.cg-docs/reviews/2026-11-10-one-survey-harness-repair-and-diagnosis-verify-review.md:19,37-41`; `O/20261110T143615Z-evidence-audit/handoff.md:59-65,73-81`. Original attempt installed five packages with --no-test-load, failed pipaux, never attempted pipdata. Later follow-up demonstrated only stamp/pipfun; original seven pins were retained as inventory, not seven successful loads. The repaired follow-up preserves a real intermediate setup.log failure beside later passing checks.
   **Key takeaway:** record fresh full-seven successful installation/loading and current copied-dependency provenance; do not reuse inventory existence, install DONE or reduced diagnostic exit zero as a full compatibility pass. Retain outer caller-restoration assertion evidence: the follow-up's equality claim was parent-attested without its own green-helper transcript (`evidence-audit:37-41`).

4. **[P2 priority, offline public-path boundary] An explicit release still needs release-catalog acquisition; substitute transport, not package setup.**
   **Evidence:** `O/20261109T214400Z-plan-review/handoff.md:39-42` traces pipfun working_release.R:79-103 to get_pip_releases even for explicit release; real folder/alias registration follows at :128-158. It traces pipdata's completed-validation inventory to pd_process_data.R:108-187. Recorded source identities are pipdata `13a38280c1eafe7e03a97837cdb57833fbe9d926`, pipfun then `0c6a78d9884ed0965a524311537eec2a5095d60b`, pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` (`plan-review:60-66`). Current resumption explicitly authorizes release-catalog transport fixture (`O/20261110T223242Z-commit-verification/resume-prompt.md:53-64`).
   **Key takeaway:** fixture the external catalog acquisition if needed while executing documented exported validation, clean/metadata and actual storage. Do not replace working_release, mutate private package state or call internal workers to make the example pass. Exact current-pipfun catalog behavior is not independently rechecked here.

5. **[P2 priority, non-vacuous invalid control] Missing output does not establish missing-weight rejection.**
   **Evidence:** `O/20261109T213600Z-plan-critic/handoff.md:38-42` cites pinned Validating-Data.Rmd:71-102,156-170: completed invalid differs from failed/no_work/disabled/blocked, and existing survey/checksum keys can skip work. The corrected Plan requires fresh identity/store, completed invalid and missing-weight diagnostic (`.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md:49,90`). `O/20261109T214400Z-plan-review/handoff.md:30,32` also records a stale processing-vignette assertion: source already filters valid/Yes and validates clean output; that documentation discrepancy is not an observed runtime failure.
   **Key takeaway:** bind diagnostic and classification to the actual fresh malformed input; require no downstream clean/metadata artifacts for that identity. An exception/no_work/absent output alone cannot pass V4. No historical successful raw missing-weight recipe was found.

6. **[P2 priority, numerical oracle] Preserve row correspondence and person-weight meaning.**
   **Evidence:** `.cg-docs/brainstorms/2026-11-04-m2-phase3-deflation-gates.md:40-44,56-59`, at recorded upstream pipdata `5680d7848dccb5fb2563129bbcd25809093d52bd` (`:19-27`), identifies accepted daily LCU rows 1,2,3,4, person weights 10,20,30,40, urban/rural alternation. `O/20261109T214400Z-plan-review/handoff.md:42` confirms the fixture's source welfare is annual per capita, weights already person weights.
   **Key takeaway:** compare aligned household/person rows after annual 365,730,1095,1460 becomes daily 1,2,3,4. Do not multiply weights by household size, independently sort vectors or import the later deflation/population-adjustment controls into this Plan.

7. **[P2 priority, exact-version claim] Separate pip and pip_meta artifact pins from current custom sidecars and true historical selection.**
   **Evidence:** `O/20261109T214400Z-plan-review/handoff.md:31,42,51,72` identifies separately documented pip/pip_meta reads and pin forwarding. `.cg-docs/brainstorms/2026-10-07-m0-remaining-design-decisions.md:54-68` records older current-only custom-sidecar reader limitations, not a fresh package bug. Corrected Plan :62 expressly excludes historical selection after a later save.
   **Key takeaway:** read both artifacts using their actual returned saved IDs; do not substitute current metadata or private snapshot-path construction. One saved-version readback is the authorized proof, not a demonstration that old pins survive later writes. Do not add a second-save historical test just to expand this bounded task.

### Potentially Related

- **[.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md] — Verify Design Integration Without Claiming Runtime Completion.** Lines 22-31,60,64-71 distinguish approval, documentation verification and runtime capability, and warn against keeping resolved approvals as current blockers. Action: preserve original failures/history while recording the new authorized pin/budget and fresh outcomes separately; neither the successful commit nor reviewer completion proves scenario success.
- **[.cg-docs/brainstorms/2026-10-13-m2-stamp-contracts.md] — load-hook and helper risks.** Lines 186-190 identify defaults/hooks, alias/manifests and cross-file helper evaluation despite filtered tests. Line 198 proposes historical C: scratch paths; those conflict with today's E-only rule and must not be reused. No source helpers or historical full-suite command were executed here.

### Patterns to Follow
- Smallest public-path example, independent aligned numeric oracle, fresh malformed identity, exact saved receipts, fresh runtime with reused repaired helpers.
- Source SHA, installed dependency provenance, actual loaded paths, installer-child boundary and numerical success remain distinct claims.
- Preserve failed attempt evidence and distinguish later corrected acceptance; retain nonempty Gaps and unexecuted scope explicitly.

### Anti-Patterns to Avoid
- Treating follow-up repair IDs as original review IDs: original P2.4 was caller restoration; follow-up P2.4 was dependency identity (`evidence-audit:81`). Match by scope/evidence, not ID alone.
- Reopening already-fixed historic harness scopes solely because the original reports retain OPEN, or treating superseded missing-commit/approval prose as a new gate.
- Latest metadata fallback, error/no-work as invalid classification, internal-worker bypass, dirty-tree snapshots, overlays, parent-only isolation or inventory-exists acceptance.

### No Relevant Learnings Found
No directly applicable previously proven solution for a full seven-package installed documented offline scenario or completed raw missing-weight classification was found. Relevant exact evidence comes from the prior reviews/brainstorms/owner report above. One general evidence-gating solution was found and inspected; the earlier learnings report's statement that no solution files were returned is retrieval history, not current inventory fact.

## Checks run
- Read revision 1 Plan, authorized resumption task and handoff contract.
- Read required charter/design/harvest context, selected survey Plan/full/verify reports, original Work Report, prior learnings, independent evidence audit, package-owner handoff and targeted brainstorm passages. No generated views read.
- Tier 1/2 discovery: `.cg-docs` directory has neither DIGEST.md nor search-index.json; skipped to selected solution scan and targeted historical reports. Initial current-directory glob returned no files; explicit-root glob recovered actual review/solution files, so an empty relative glob was not treated as proof of absence.
- No direct package repository or installed source read: all seven package identities are historical report evidence, not refreshed package status/provenance. Original unchanged pins are recorded in original Work Report :49-57; only pipfun replacement is authorized by resumption :28-37.
- Read current HEAD using read-only Git.
- UTC clock query using unsupported PowerShell 5.1 Get-Date -AsUTC failed; corrected with ToUniversalTime().
- No tests run, as requested.
- Sent two early actionable board messages to implementation worker covering full-seven proof, globals write caveat, release-catalog transport, invalid controls and metadata-artifact distinctions. Completion summary also sent to parent.
- Functional report check: re-read own saved pip-handoff-v2 report, required headings, findings/limits and nonempty Gaps before stopping.

## Gaps
- Current experiment files deliberately not inspected or changed, and no test/harness/installer/R process run. This is historical evidence research, not final code review or fresh runtime certification.
- Historical package-source claims were not independently revalidated against the new pipfun pin or other recorded snapshots. Current source/installed/loaded identities, full-seven compatibility, transport behavior, invalid classification and saved-value readback remain for the implementation/review workers.
- No OS-wide write audit, compiled-hook assessment, binary deserialization or full dependency payload attestation performed or proposed. Existing small functional evidence is the intended scope.
- Original V1-V5 remain subject to fresh parent verification. Live DLW, deflation/mean, production, incremental certification and historical selection after a later save remain excluded. No unneeded approval request is introduced by this completed research role.
