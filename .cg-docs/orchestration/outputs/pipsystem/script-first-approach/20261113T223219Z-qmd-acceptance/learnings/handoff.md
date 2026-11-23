---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T223219Z-qmd-acceptance/learnings
status: completed
updated: 2026-11-13T22:54:39Z
owner: cg-learnings-researcher
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinator consolidates continuation reviews and performs required light verification before V5 closure.
---

# Narrow Qmd acceptance learnings review

## Summary
No issues found in this narrow learnings review; no supported new P0-P3
finding. Applicable local lessons are already respected by the inspected
continuation. This is a static source/evidence review, not an independent
runtime rerun or closure of V5. Scope follows ../review-brief.md:3-62.

## Changes
Only this authorized report created and finalized. No source changes, other
file writes, Git mutations, remote retrieval, installs or pipeline runs.

## Checks run
### Executed read-only checks
- Git status, rev-parse HEAD and branch confirmed existing main and HEAD above;
  mixed-owned dirty/untracked files preserved. No package repository read.
- Get-FileHash SHA256 on canonical Qmd and actual render-directory source copy
  returned identical
  `62024e63b62c0d2999df6fc5cdb5837ec32f1956ea221930976016ba96b39c88`.
- Local tiered retrieval: DIGEST.md and search-index.json absent. Explicit
  solutions-directory scan located one solution; selected relevant Plans and
  linked historical review/work-report records supplied sufficient signal.
- Loaded technical communication and R shared, technical, data.table, collapse
  and testing skills before R inspection. No broad style/package re-review.

### Static inspection of retained execution evidence
- `.tmp/one-survey/qmd-acceptance-20261113/pins.tsv:2-8` matches
  `experiments/one-survey/setup.R:16-22`, including authorized pipdata
  `53a76e379c81a3ac70b39925954981ae6a691459`.
- Runtime `qmd-20261113-acceptance/results.tsv:2-8` records seven PASS rows
  and returned clean/metadata pins `ab5f8ecf4163c542`/`68b3b5b50c5dc90b`.
  Its `quarto.log:19-35,62` records acquisition, processing, exact readback,
  invalid/no-output and summary chunks plus actual HTML creation.
- Runtime `logs/qmd-check.log:1-4` explicitly distinguishes the synthetic
  blocker FAIL from three passing focused groups. No real package failure
  inferred from the negative control.
- `experiments/pip-pipeline.qmd:173-189,208-224,239-264,273-285`
  preserves completed valid/invalid classification and missing-weight
  diagnostic, real public processing, returned-version reads, paired values,
  metadata/CPI/PPP/weight-total assertions and invalid/no-output gating.
- `.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:160-185,214-228`
  records the bounded approval/pin delta, V1-V4 PASS, V5 pending and B6 open.

## Related Learnings

### Directly Relevant
1. **[Verify Design Integration Without Claiming Runtime Completion](../../../../../../solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md)**
   — `.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md:22-31,35-41,52,60-71`.
   **Relevance:** completed document/review work must not imply full runtime or
   roadmap completion.
   **Key takeaway:** close only the gates demonstrated by current evidence,
   keep partial work active, and retain historical records as history.
   **Application:** original Plan remains active at lines4,13-15; current work
   report lines216-228 keeps V5 pending and B6 open. No status-drift defect
   supported in the inspected continuation.
2. **[Installed-package one-survey offline example](../../../../../../plans/2026-11-09-installed-package-one-survey-example.md)**
   — `.cg-docs/plans/2026-11-09-installed-package-one-survey-example.md:50,63-67,88-92`.
   **Relevance:** defines the original acceptance oracle, not a replacement
   test contract.
   **Key takeaway:** preserve paired rows and actual returned pins; an empty
   store after failure is not invalid-input rejection, and a single saved
   version proves no later historical selection behavior.
   **Application:** visible Qmd assertions and same-run results above satisfy
   the inspected first-save evidence; B6 is explicitly excluded at Qmd18,309.
3. **[Two-Pin Survey Resumption Review](../../../../../../reviews/2026-11-11-survey-resume-review.md)**
   — `.cg-docs/reviews/2026-11-11-survey-resume-review.md:15,38-46,51-55`.
   **Relevance:** previous P1 public-context failure must not be bypassed or
   concealed by a successful document render.
   **Key takeaway:** use the actual public processing path; leave dependent
   evidence NOT RUN on failure instead of seeding context options.
   **Application:** Qmd203-228 calls the public wrapper without context
   seeding; current results contain actual saved pins. The older P1 applies
   to the older immutable combination; it is not automatically a new finding
   against the authorized newer pin.

### Potentially Related
1. **[Readable script-first pipeline Qmd](../../../../../../plans/2026-11-12-script-first-pipeline-qmd.md)**
   — `.cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md:65-74,95-103,125-128,167-169`.
   **Relevance:** completed Qmd delivery establishes honest failure reporting,
   not original-survey acceptance. Its historical no-pin-change scope does
   not contradict this separately approved continuation (work report163-176).

### Patterns to Follow
- Keep exact source identity, current-run evidence and gate closure distinct.
- Preserve old failures; compare the current authorized immutable combination.
- Require successful processing before invalid/no-output earns PASS.
- Keep B6/later historical selection outside first-save certification.

### Anti-Patterns to Avoid
- Treating render exit, a reproduced failure, prior green tests or completed
  review roles as proof that all original acceptance gates passed.
- Replacing a saved metadata pin with latest data or sorting welfare and
  weights independently, which could conceal broken row correspondence.
- Reopening completed broad style/package reviews or adding optional framework
  safeguards to a pin-only acceptance continuation.

## Review Findings
No issues found. No new supported P0/P1/P2/P3 finding, remediation or
safe_auto/manual classification is warranted. The lessons above are
non-finding guidance, not new safeguards or a request to widen scope.

## Gaps
- No tests, setup/check execution, render, install or pipeline rerun performed
  by this reviewer; recorded runtime evidence was inspected statically.
- This role did not repeat full isolation/provenance, package implementation,
  data-quality or broad Qmd/style reviews; seven package SHAs above are runtime
  receipt evidence, not claims of fresh package-source inspection.
- Original V5 awaits coordinator consolidation and final light verification;
  this report does not mark the original Plan/Phase 2 complete.
- B6 remains historically failed/open; later-save history, live DLW,
  production, deflation, means and incremental behavior are not certified.
- Generated `.cg-docs/views/**` bodies were not read. Actual HTML existence
  and renderer log were inspected, not a broad rendered-content audit.
- Local generated knowledge indexes are absent; selected direct files are the
  evidence, not an exhaustive indexed search or remote Brain synchronization.
