# Work Order Authoring Template

The helper emits an immutable request with initial `pip-work-order-v1` JSON metadata and a self-contained Prompt. The coordinator prepares the following complete request object in its own bounded control file. All paths/IDs must be filled before registration; this template is not an assignment or approval.

```json
{
  "schemaVersion": "pip-work-order-v1",
  "projectId": "PROJECT-ID", "taskId": "TASK-ID", "requestId": "REQUEST-ID", "runId": "RUN-ID",
  "milestoneId": "UNKNOWN", "featureIds": [],
  "coordinationSessionId": "COORDINATION-SESSION-ID", "reportingOwner": "WORKER-REPORTING-OWNER",
  "status": "PROPOSED", "approvalRef": "NONE", "createdAt": "2026-10-21T00:00:00Z",
  "purpose": "planning", "workflow": "/cg-plan", "objective": "EXACT-OBJECTIVE",
  "repositoryRoot": "EXACT-REGISTERED-ROOT", "worktreeRoot": "EXACT-REGISTERED-WORKTREE",
  "branchName": "UNKNOWN", "branchEvidence": "UNKNOWN", "worktreeReason": "UNKNOWN",
  "planPath": "NONE", "planRevision": "NONE", "phase": "planning", "planApproved": false,
  "writeSet": ["EXACT-CANONICAL-AND-REPORTING-PATHS"],
  "prohibitedSet": ["registry/state/other reports, roadmap, Git mutations, private storage, production data"],
  "lifecyclePaths": ["EXACT-COMMAND-OUTPUTS-INCLUDING-RENDERED-VIEWS-AND-ACTIVE-STATE-WHERE-REQUIRED"],
  "prerequisites": ["Direct approval, installed command contract, fresh worker baseline, scope and ownership checks"],
  "acceptanceEvidence": ["Substantive report and saved-output readback, exact source/dependency binding"],
  "stopConditions": ["Denied path, changed scope, unknown required input, conflict, missing reporting access"],
  "dependencyPins": [], "sharedContracts": [], "supersedes": null,
  "outputPath": "EXACT-ABSOLUTE-CENTRAL-HANDOFF", "supportingOutputs": [],
  "commandContract": {"available": false, "path": "UNKNOWN", "digest": "UNKNOWN", "capturedAt": "2026-10-21T00:00:00Z", "requiredWriteSet": []},
  "outerReporting": {"authorized": false, "owner": "UNKNOWN", "approvalRef": "UNKNOWN"}
}
```

## Prompt Assembly

Generated prompts must embed the complete current CONTRACT.md and handoff.md template, not links alone. Include a filled initial handoff with exact task/request/run/coordinator/reporting owner/output scope. Preserve the independently authorized outer Code caller for a restricted command's central reporting and supporting copies. Never override plugin File Permissions.

Use `/cg-brainstorm --no-branch`, `/cg-plan`, repository-local approved `/cg-work`, or `/cg-review --report-only` as appropriate. Branch/worktree recommendations are not permission to create/switch; no stash. Check complete lifecycle write sets, shared active-state pointers, glob overlaps, cycles, shared contracts and exact producer/consumer pins before proposing parallel execution. An unavailable installed command contract blocks readiness. Registration always remains PROPOSED; the user approves and starts work separately.

## Gaps

This authoring template has intentionally unfilled identifiers and unknowns; it must never be issued as a worker assignment. Target-session command contracts and outer reporting access require task-specific evidence.
