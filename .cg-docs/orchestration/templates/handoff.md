# Required Worker Handoff

```json
{
  "schemaVersion": "pip-handoff-v1",
  "projectId": "PROJECT-ID",
  "taskId": "TASK-ID",
  "runId": "RUN-ID",
  "requestId": "REQUEST-ID",
  "coordinationSessionId": "COORDINATION-SESSION-ID",
  "reportingOwner": "ASSIGNED-REPORTING-OWNER",
  "checkpoint": 1,
  "createdAt": "2026-10-21T00:00:00Z",
  "updatedAt": "2026-10-21T00:00:00Z",
  "repository": {"name": "PROJECT-ID", "root": "UNKNOWN"},
  "worktree": {"name": "UNKNOWN", "path": "UNKNOWN", "kind": "unknown"},
  "session": {"label": "ASSIGNED-REPORTING-OWNER", "nativeId": "UNKNOWN"},
  "git": {
    "branch": "UNKNOWN", "baseSha": "UNKNOWN", "headSha": "UNKNOWN",
    "capturedAt": "2026-10-21T00:00:00Z", "dirty": "UNKNOWN",
    "changedFiles": [], "commitsMade": [], "mergeSha": "NONE", "pr": "NONE", "testedPins": []
  },
  "scope": {
    "workflow": "UNKNOWN", "approvalRef": "UNKNOWN", "planPath": "NONE",
    "planRevision": "NONE", "phase": "NONE", "writeSet": ["EXACT-ASSIGNED-OUTPUT"], "completed": "not started"
  },
  "status": "blocked",
  "dependencyPins": [], "checks": [], "artifacts": [],
  "gaps": ["Replace identifiers, output scope and real UTC capture times before use; UNKNOWNs need explicit limits."]
}
```

## Results Summary

Concise substantive result and separately identified reported status.

## Substantive Findings

File/line/full SHA evidence, capture times, claims and their qualification; UNKNOWN if absent.

## Changed Files

Task-owned files and separately identified pre-existing dirty paths; NONE when applicable.

## Evidence Paths

Exact canonical deliverables and exact assigned central report/supporting paths. Save needed sanitized content, not inaccessible links alone.

## Checks Actually Run

Commands, results/exit codes, execution/capture times, saved evidence, source/dependency bindings and executed/document-reported/worker-reported distinction. No commands executed: NONE.

## Saved-Output Readback

Actual readback result/time and limitations; not run until executed.

## Checks Not Run

Explicit checks not run; include runtime, integration and current-HEAD gaps.

## Blockers And Decisions

Exact blocker/required direct decision or NONE. Validity, verification, integration readiness and execution approval are separate.

## Recommended Next Action

Concrete next action with owner and prerequisite; no worker/session starts without approval.

## Gaps

Non-empty substantive limits, unknown facts and coverage. Never claim unknown liveness or tested-HEAD equivalence from folder dates or reported completion.
