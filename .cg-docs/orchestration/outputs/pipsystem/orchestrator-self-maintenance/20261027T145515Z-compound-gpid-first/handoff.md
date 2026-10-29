# Compound GPID First Coordination Rules

```json
{
  "schemaVersion": "pip-handoff-v1",
  "projectId": "pipsystem",
  "taskId": "orchestrator-self-maintenance",
  "runId": "20261027T145515Z-compound-gpid-first",
  "requestId": "direct-user-compound-gpid-first",
  "coordinationSessionId": "UNKNOWN",
  "reportingOwner": "pip-orchestrator; human reporting owner UNKNOWN",
  "checkpoint": 2,
  "createdAt": "2026-10-27T14:56:41Z",
  "updatedAt": "2026-10-27T14:59:53Z",
  "repository": {"name": "pipsystem", "root": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"},
  "worktree": {"name": "main", "path": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem", "kind": "main"},
  "session": {"label": "pip-orchestrator approved self-maintenance", "nativeId": "UNKNOWN"},
  "git": {
    "branch": "main",
    "baseSha": "ad326f7ee1b7bcc1262757636efbcbc08314ecff",
    "headSha": "ad326f7ee1b7bcc1262757636efbcbc08314ecff",
    "capturedAt": "2026-10-27T14:56:41Z",
    "dirty": "dirty",
    "changedFiles": ["ORCHESTRATOR.md", "AGENTS.md", ".cg-docs/orchestration/CONTRACT.md", ".cg-docs/orchestration/outputs/pipsystem/orchestrator-self-maintenance/20261027T145515Z-compound-gpid-first/handoff.md"],
    "commitsMade": [],
    "mergeSha": "NONE",
    "pr": "NONE",
    "testedPins": []
  },
  "scope": {
    "workflow": "User-Approved Self-Maintenance; directly requested Git publication subject to mandatory preflight and live permissions",
    "approvalRef": "Direct user message 2026-10-27T14:55:15Z: make Compound GPID usage explicit in reference files, then commit and push; routing preference clarified at 2026-10-27T14:52:01Z",
    "planPath": "NONE",
    "planRevision": "NONE",
    "phase": "NONE",
    "writeSet": [
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/ORCHESTRATOR.md",
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/AGENTS.md",
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/CONTRACT.md",
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/orchestrator-self-maintenance/20261027T145515Z-compound-gpid-first/handoff.md",
      "Git staging/commit/normal push of these four paths only on pipsystem main, if mandatory preflight is permitted"
    ],
    "completed": "All three approved rule edits applied and completely read back; initial report read back; final blocked checkpoint saved for final readback. Compound GPID-first routing and command-first prompts are explicit and consistent. No permissions changed. Git diff preflight denied; no staging/commit/push attempted."
  },
  "status": "blocked",
  "dependencyPins": [],
  "checks": [
    {
      "name": "Git metadata preflight",
      "result": "Expected E: root and Git directory; main at ad326f7ee1b7bcc1262757636efbcbc08314ecff; no ahead/behind count against local origin/main; staging area empty; target rule files not listed dirty; unrelated changes present; recent ten commits inspected",
      "exitCode": 0,
      "executedAt": "UNKNOWN",
      "capturedAt": "2026-10-27T14:56:41Z",
      "evidencePath": "this handoff: Checks Actually Run",
      "sourceBinding": "Observed root/main/HEAD and working-tree metadata, not content equivalence",
      "dependencyBinding": "NONE",
      "qualification": "Executed read-only Git metadata; no package tests or remote refresh"
    },
    {
      "name": "Required Git diff preflight",
      "result": "DENIED: git --no-optional-locks -c core.fsmonitor=false diff --no-ext-diff --no-textconv -- ORCHESTRATOR.md AGENTS.md .cg-docs/orchestration/CONTRACT.md. Tool reported: The user has specified a rule which prevents you from using this specific tool call. Relevant rule: permission=bash, pattern=*, action=deny, source=global.",
      "exitCode": null,
      "executedAt": "UNKNOWN",
      "capturedAt": "2026-10-27T14:56:41Z",
      "evidencePath": "this handoff: Blockers And Decisions",
      "sourceBinding": "Required content-diff inspection unavailable",
      "dependencyBinding": "NONE",
      "qualification": "Tool-level denial, not a native Git exit or missing user approval; no alternate command/tool workaround"
    },
    {
      "name": "Rule edits, scope and saved-file readback",
      "result": "PASS for file-only maintenance: all three affected rule files read completely after editing; initial handoff read completely; new Compound GPID-first rules agree on command-first prompts, qualified lightweight routing, preserved framework gates and bounded exceptions. Git status adds only the three target rule files and this run to the pre-existing pending path set.",
      "exitCode": null,
      "executedAt": "UNKNOWN",
      "capturedAt": "2026-10-27T14:59:53Z",
      "evidencePath": "this handoff: Substantive Findings; Saved-Output Readback",
      "sourceBinding": "Working-copy ORCHESTRATOR.md:195-232,271-274,451-459; AGENTS.md:75-89; CONTRACT.md:3,135-160",
      "dependencyBinding": "Installed command definitions are reference evidence only; no package runtime dependency",
      "qualification": "Manual Read/patch-scope verification and successful Git status, not an executed validator, Git diff, runtime test, commit or permission-reload certification"
    }
  ],
  "artifacts": ["E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/orchestrator-self-maintenance/20261027T145515Z-compound-gpid-first/handoff.md"],
  "gaps": [
    "Rule edits and full rule-file readback completed; final checkpoint report readback follows its save. No runtime enforcement/reload test was run.",
    "Required Git diff inspection was denied; no staging, commit or push has been attempted.",
    "Current-session reload and future-session workflow enforcement are unverified; static rule edits cannot prove runtime enforcement."
  ]
}
```

## Results Summary

Rule-file maintenance is complete and read back. Compound GPID is now the explicit default workflow, with the actual slash-command invocation first in copy-ready task prompts. Permissions, package boundaries, worker-start restrictions and deferred shared-state rules remain unchanged. Overall request status is BLOCKED because the live client denied the required Git diff preflight. No staging, commit or push occurred.

## Substantive Findings

At baseline ad326f7ee1b7bcc1262757636efbcbc08314ecff, ORCHESTRATOR.md:409-418 and CONTRACT.md:133-143 named planning commands but did not explicitly require a command-first prompt or include the qualified /cg-light-work fallback. Baseline AGENTS.md:67-73 granted framework reference reads but did not state the default routing policy.

Applied and observed in the working copy:

- ORCHESTRATOR.md:195-232 adds Compound GPID First: actual invocation first; /cg-brainstorm for unresolved material choices, /cg-plan for structured planning, qualified /cg-light-work for bounded work, /cg-work for an approved local Plan, and verified review/specialized routes. It preserves framework gates and requires a concrete strong reason plus an already-authorized route before exceptions.
- ORCHESTRATOR.md:271-274 removes ambiguous command-spelling language in favor of verifying installed commands, without imposing a client version or session API. Lines 451-459 make the prompt checklist agree with the new section.
- AGENTS.md:75-89 repeats the coordinator-specific default, routing, command-first requirement, qualification/gates, bounded exceptions and no-permission-expansion limits.
- CONTRACT.md:3 records the approved date; lines 135-160 state the same prompt entry point, routing, qualification, gates and exception policy. Retained formal schemas/history are untouched.
- No kilo.json, generated adapter/command, roadmap, charter, design, package, registry/state or unrelated report edit was made by this task.

Installed command references were read in the preceding clarification: .kilo/commands/cg-plan.md:193-207 requires the completion-contract approval before Plan save; cg-brainstorm.md:234-275 requires design confirmation before capture; cg-light-work.md:77-106 qualifies small low-risk work and excludes architecture/public-interface/dependency/security risks; cg-light-work.md:136-166 still requires an approved saved validated Plan. The new routing must not equate lightweight work with bypassing Plan, review or evidence gates.

This maintenance uses the existing directly approved self-maintenance exception rather than running /cg-light-work. That command would require snapshots, Plan/work/review/active-state artifacts, execution and reviewer dispatch outside this coordinator's approved maintenance write set and capabilities. This reason was stated before editing. It is not a new execution or permission exception.

## Changed Files

Task-owned changes: ORCHESTRATOR.md, AGENTS.md, .cg-docs/orchestration/CONTRACT.md and this new report. All four exact paths are in scope.writeSet. kilo.json and all generated/framework files remain untouched. These changes are local and unstaged, not committed or published.

Pre-existing tracked changes are the implementation handoff and validation.json under .cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T120908Z-implementation/, README.md, wiki/README.md, wiki/_wiki.yml, wiki/cli-reference.md, wiki/configuration.md and wiki/usage.md. Pre-existing untracked roots/runs include outputs/pipload/, handoff-discovery-read-review/, two later multi-session-orchestrator runs, self-maintenance/20261022T220605Z-framework-command-reads/, self-maintenance/20261026T211134Z-publication/, user-wiki/ and outputs/stamp/current-work-checkpoint/. None was edited or staged by this task. Final Git status retained this path set and added only the three approved rule files and this maintenance run; unrelated content equality was not inspected.

## Evidence Paths

Canonical rule files are the three absolute main-checkout paths in scope.writeSet. This report is the only new maintenance output. The central template is .cg-docs/orchestration/templates/handoff.md. No supporting sidecar or transcript is created.

## Checks Actually Run

Read the contract, all three affected rule files and the central handoff template; read the existing maintenance parent directory and checked that this run path did not exist. Executed read-only Git status --short --branch, rev-parse --show-toplevel --absolute-git-dir HEAD, diff --cached --name-status (empty), log --oneline -10 and var GIT_COMMITTER_IDENT. Optional locks and fsmonitor were disabled. The Git clock returned Unix seconds 1793113001, corresponding to 2026-10-27T14:56:41Z; this is the preflight/checkpoint capture, not the exact start time of every command. No identity details are copied into this report.

The path-limited content diff was rejected by the live tool. No native exit code exists for the denied operation. It has not been retried through another command or tool.

Applied the approved changes using apply_patch. Read every changed rule file completely after editing: ORCHESTRATOR.md 761 lines, AGENTS.md 104 lines, CONTRACT.md 200 lines; initial handoff 126 lines. Manual scope/consistency check passed for the intended routing and unchanged authority boundaries. A second Git status --short --branch succeeded and showed the expected task-owned paths plus the original unrelated paths. The later Git clock returned 1793113193, corresponding to 2026-10-27T14:59:53Z. Git head/base identity remains the earlier observed preflight capture; no current-content tested SHA is claimed.

## Saved-Output Readback

Actual rule-file readback completed, untruncated, at checkpoint 2; initial handoff was read completely before this final report update. All three rule files consistently require the actual command first, the correct stage/qualification, retained framework gates, and a concrete reason for any authorized exception. This is file readback, not a substitute for the denied mandatory Git diff inspection. After saving this checkpoint, read the final report completely before the user response; do not claim its final bytes were read before saving them.

## Checks Not Run

Required Git content-diff review, whitespace check, staging, commit, push, remote SHA verification, package tests, pipelines, helpers, worker/reviewer dispatch, lifecycle operations and runtime reload/enforcement checks: not run. This is file-only maintenance, not package implementation or a test cycle. No alternate diff/content-comparison route was used to bypass the denied operation.

## Blockers And Decisions

The user approved this exact rule change and commit/push in the current session. No second approval task is needed. However, the tool denied the required Git diff preflight with a global bash deny rule. Publication cannot proceed without that mandatory inspection. The dependent commit/push was stopped; no configuration change, alternate command form/tool or worker bypass was attempted. The independently permitted file-only edits and readback are complete.

## Recommended Next Action

The user resolves the live permission blocker for the exact denied Git diff operation, without turning off auto-approve or granting broader execution authority. Then pip-orchestrator can resume required Git inspection, stage only the four authorized task files, commit and normally push main after verifying the intended remote and E:-only process outputs. Recheck current root/branch/status/history and preserve unrelated work on resume. The existing user instruction remains the operation's approval; do not demand another worker session or duplicate approval. No new package task or worker is started.

## Gaps

Actual runtime enforcement/reload, remote state at this checkpoint and complete unrelated dirty-file contents are UNKNOWN. The path-limited Git diff is unavailable because of the exact live denial above; therefore no commit or push is claimed. No package tests or lifecycle workflow has been run. Rule-file readback is complete; final report readback follows this save. The worktree remains dirty, and static instructions do not prove a session reload or future command dispatch. Individual tool execution clocks/native session identity and a clean tested-content commit are UNKNOWN/NONE as applicable.
