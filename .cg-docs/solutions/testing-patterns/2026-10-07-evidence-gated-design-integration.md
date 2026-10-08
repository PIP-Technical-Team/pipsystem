---
date: 2026-10-07
title: "Verify Design Integration Without Claiming Runtime Completion"
category: "testing-patterns"
language: "R"
tags: [documentation-verification, approval-boundaries, roadmap, evidence-gates, restart-state]
root-cause: "Decision approval, exact edit permission, workflow progress, and runtime verification are different states that can drift when recorded together."
severity: "P2"
plan: ".cg-docs/plans/2026-10-07-m0-m1-design-integration.md"
---

# Verify Design Integration Without Claiming Runtime Completion

## Problem

An integration task had to turn approved design outcomes and source-inspection findings into current documentation and roadmap records. Some historical proposals were rejected by later decisions. A runtime ownership decision also required a separately approved charter sentence. Treating the saved plan or harvest as universal approval could change protected wording or claim capabilities that had not been tested.

During Phase 1 review, the compact restart record still listed an approval blocker after the user had supplied approval. Some report rows also described approvals and roadmap activity as pending after those events occurred. These were two P2 record-consistency findings, not package defects. Evidence: [work report](../../work-reports/2026-10-07-m0-m1-design-integration.md), lines 28-38,105-120.

## Root Cause

Four different claims were easy to combine:

- A decision record approves an outcome.
- An exact approval permits a bounded documentation edit.
- An executed document check proves that the edit matches the approved outcome.
- A runtime test proves that the implementation satisfies the policy.

Only the first three were available in this documentation task. Roadmap features represented decisions or evidence collection, not working runtime capabilities. Partial integration also meant that completion of this plan could not complete every related feature. See [plan](../../plans/2026-10-07-m0-m1-design-integration.md), lines 31-35,129-154,265-312.

The restart pointer and evidence descriptions recorded earlier states but were not updated with the completed approvals. A resolved decision should not remain a current blocker; pending verification should describe the check still needed, not repeat a completed approval request.

## Solution

1. Validate the canonical saved plan before mutation. Read current target wording and the controlling decision records. Keep historical records unchanged.
2. Obtain explicit approval for exact Decided replacements and a separate approval for the conflicting charter sentence. Record conditional Focus/title approvals separately from required approvals.
3. Apply small in-place edits. Compare each Integration Matrix and Open Register row with executed reads/searches and the actual diff. Preserve full inherited SHA and source-line references; do not relabel inspected tests as executed passes.
4. Send all roadmap writes to the sole roadmap writer, using exact milestone/feature ID pairs. Read back requested fields and compare stable IDs, counts, unrelated milestones and plan links. Never link a still-partial feature to a plan whose generic completion could mark it done.
5. Check the exact start-gate IDs in a fresh read after writer completion. Require each ID exactly once, the required status, and its decision/harvest evidence. Do not substitute milestone completion or approval alone for this check.
6. If conditional Focus approval exists and the gate passes, append the complete replaced Focus and prior review date to the archive first. Read the archive, then apply the exact Focus and paired local execution date. A same-day review date can remain unchanged in value.
7. At the phase boundary, remove resolved blockers from the compact restart record and correct evidence descriptions. Record authoritative phase completion before informational phase position. Preserve earlier report runs as history.

Example of the actual completed-plan progress record:

```yaml
status: completed
completed-date: 2026-10-07
completed-phases: [1, 2]
execution-report: ".cg-docs/work-reports/2026-10-07-m0-m1-design-integration.md"
```

Write the integer flow sequence first, re-read it, then remove informational `current-phase` for the final phase. Mark the plan complete only after its required final evidence passes. Do not change plan body/checklists during execution when permissions permit only progress fields.

## Verification

Executed checks established all 11 selected design outcomes, required approvals, all 15 Open Register treatments, nonempty gaps and historical preservation. The roadmap readback checked 22 records and preserved seven milestone IDs and 66 feature IDs; M2-M6 records were unchanged. A separate fresh read confirmed nine unique evidence-backed gate members done. M0 was 9/9 done; M1 remained 11/13 done, with R1 unchanged and partial design integration active/unlinked.

The exact approved Focus was applied after the gate check and archive append. Canonical plan validate-only and whitespace checks passed. Eight final architecture-route reviewers returned no findings. The two earlier P2 record issues were corrected at the lifecycle boundary. Evidence: [work report](../../work-reports/2026-10-07-m0-m1-design-integration.md), lines 185-299; [archive](../../archive/charter-history.md), lines 15-27.

No package tests, pipeline runs or API calls were executed. These results prove bounded documentation integration, not numerical correctness, storage safety or complete scheduling. The start gate permits later planning, not automatic implementation.

## Prevention

- Make verification rows state the remaining check. Do not keep asking for approval that is already recorded.
- Store only unresolved decisions in the restart pointer; resolved answers belong in the durable work report.
- Keep decision completion, harvest completion, document integration and runtime capability separate in status reports.
- Preserve rejected proposals as historical evidence, but remove them from active target instructions.
- Use exact stable IDs for status changes and gate membership; title correction must not change identity.
- Keep partial work active and unlinked when generic plan completion would make a false whole-feature claim.
- Require a fresh gate read before a readiness statement or conditional Focus change.
- Retain source/test inspection limits and nonempty Gaps even when the documentation plan is complete.

## Related

- [Integration plan and approval register](../../plans/2026-10-07-m0-m1-design-integration.md), lines 182-230,378-433.
- [Execution report and review corrections](../../work-reports/2026-10-07-m0-m1-design-integration.md), lines 105-120,185-299.
- [Design Open Register and capability gaps](../../../SYSTEM_DESIGN.md), lines 323-383.
- [Approved strategy start gate](../../strategy/2026-10-07-pip-backend-roadmap.md), lines 151-174.
- [Active-state contract](../../../.kilo/shared/active-state.contract.md), lines 44-66.

No prior solution documents were found for reciprocal cross-references. This entry records a local workflow pattern; it does not supersede historical decision or harvest records.

## Gaps

- Runtime behavior remains UNKNOWN: no package tests, numerical comparisons, pipeline/API checks or storage/concurrency tests were part of this solution.
- Git diffs cannot prove which agent wrote a file or the order of earlier writes; approval and writer history are traced through the conversation and durable report.
- The installed knowledge scanner reports that `work-reports` is not a recognized artifact directory. Direct report links remain necessary; brain retrieval must not be claimed to index the full execution report.
