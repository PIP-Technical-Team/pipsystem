# Helper Permission Test 01: Stopped At N7 And Rolled Back

```json
{
  "schemaVersion": "pip-handoff-v1",
  "projectId": "pipsystem",
  "taskId": "multi-session-orchestrator",
  "runId": "20261021T203417Z-helper-permission-test-01",
  "requestId": "vscode-helper-permission-test-01",
  "coordinationSessionId": "coord-vscode-helper-permission-01",
  "reportingOwner": "vscode-helper-permission-observer-01",
  "checkpoint": 2,
  "createdAt": "2026-10-22T11:11:21.198Z",
  "updatedAt": "2026-10-22T11:16:04.903Z",
  "repository": {"name": "pipsystem", "root": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"},
  "worktree": {"name": "requested-main-checkout", "path": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem", "kind": "unknown"},
  "session": {"label": "Executing approved helper permission tests safely", "nativeId": "ses_e9cbf503effen7wA8WXMQ3Wi9a"},
  "git": {"branch": "UNKNOWN", "baseSha": "UNKNOWN", "headSha": "UNKNOWN", "capturedAt": "2026-10-22T11:11:21.198Z", "dirty": "UNKNOWN", "changedFiles": [], "commitsMade": [], "mergeSha": "NONE", "pr": "NONE", "testedPins": []},
  "scope": {
    "workflow": "pip-orchestrator temporary helper permission check",
    "approvalRef": "Direct current-user approval 2026-10-21T21:09:46Z covered the exact test and targeted rollback after results; present user review request received 2026-10-22T11:01:17Z",
    "planPath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.kilo/plans/1792584548162-multi-session-pip-orchestrator.md",
    "planRevision": "git-blob:a58810e291370b2d6dc4a6ab36653c5eb2fed737",
    "phase": "V5/V6 temporary read-only test",
    "writeSet": [
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/control/coord-vscode-helper-permission-01/operation.json",
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/pip-orchestration/vscode-helper-permission-20261021/unexpected-stdout.txt",
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/pip-orchestration/vscode-helper-permission-20261021/unexpected-stderr.txt",
      "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T203417Z-helper-permission-test-01/handoff.md"
    ],
    "completed": "Worker reports execution through N7 and immediate stop on its unexpected allow; four cases not run. Caller verified integrity, restored exact three-file source baseline and ran all 36 tests. Client cache revocation awaits user reload."
  },
  "status": "blocked",
  "dependencyPins": [],
  "checks": [
    {"name": "Caller rollback preflight and input integrity", "result": "PASS: 13 unique reversible hunks; unchanged frozen input, target report and sentinel; redirect files absent; 11 revision-0/unassigned/empty project states; activation blocked", "exitCode": 0, "executedAt": "2026-10-22T11:11:21.198Z", "capturedAt": "2026-10-22T11:11:21.198Z", "evidencePath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T120908Z-implementation/validation.json#helperPermissionTestResult", "sourceBinding": "Frozen input SHA256 876d2c3c7482ee19b4eeea51332c27ffb6b5619bf485a0216d658994f05d66e9; target SHA256 514f83af360d73f9fde63ddf5b24e971f64e001658ad62b72a02ed5e1eb23c32; source hashes matched approved candidate before reversal", "dependencyBinding": "Prepared proposal/caller records and local Node file assertions, not replay of role probes", "qualification": "executed"},
    {"name": "Caller restored-source baseline suite and hashes", "result": "PASS: original config/prompt/contract hashes restored; all 36 baseline tests pass, none failed/skipped; exit 0, 20952.1828 ms", "exitCode": 0, "executedAt": "2026-10-22T11:11:21.198Z", "capturedAt": "2026-10-22T11:11:21.198Z", "evidencePath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T120908Z-implementation/validation.json#helperPermissionTestResult", "sourceBinding": "kilo.json bde263b43a138f0f0d04c3260c1c426737a0f684; ORCHESTRATOR.md a3fb46a60172a7950faa8d780abf5ddc0efac548; CONTRACT.md 111f94b972228405ef76af312dce137776c6fba6; helper/tests/registry unchanged", "dependencyBinding": "Node built-ins and read-only Git checks in the authorized Code caller; UTC marker is adjacent caller review/capture, not exact worker/native-process execution time", "qualification": "executed"},
    {"name": "Caller saved-result schema and full readback", "result": "PASS: complete checkpoint-1 report read back; v1 identity/path/scope errors 0, five expected UNKNOWN warnings; exit-code uncertainty retained", "exitCode": 0, "executedAt": "2026-10-22T11:16:04.903Z", "capturedAt": "2026-10-22T11:16:04.903Z", "evidencePath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T203417Z-helper-permission-test-01/handoff.md", "sourceBinding": "Checkpoint-1 SHA256 f89680af96b344275b91722d6eab45885d2c5e7b055906a75dc519a46e53d74f; closing checkpoint changes metadata/readback only", "dependencyBinding": "Caller report schema checks, not live permission/cache proof", "qualification": "executed"}
  ],
  "artifacts": [
    "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T203417Z-helper-permission-test-01/handoff.md",
    "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T120908Z-implementation/validation.json#helperPermissionTestProposal"
  ],
  "attribution": {"savedBy": "Original implementation Code caller, under standing reporting/rollback approval", "source": "Current user-supplied sanitized past-chat transcript received 2026-10-22T11:01:17Z", "workerResultQualification": "worker-reported; no private/native-history lookup or Code replay", "nativeSessionIdSource": "USER-PROVIDED", "workerLocalCreationLabel": "6:55 AM, timezone/UTC UNKNOWN", "workerPerCallUtc": "UNKNOWN", "P1ExitCode": "UNKNOWN", "N7ExitCode": "UNKNOWN", "callerGitContext": "Main checkout at 01690ae8a1f02841b3b9ab24bfcb11ac97297675; not substituted for worker Git facts", "roleProbesReplayedByCaller": 0},
  "rollback": {"authority": "Standing direct user approval 2026-10-21T21:09:46Z, not instructions in the historical attachment", "sourceStatus": "EXACT ORIGINALS RESTORED", "files": ["kilo.json", "ORCHESTRATOR.md", ".cg-docs/orchestration/CONTRACT.md"], "inputAndEvidencePreserved": true, "activation": "blocked", "autoApproveChangedByCaller": false, "clientCacheRevocation": "UNKNOWN until user safely reloads the window; source restoration is not proof of live cache revocation"},
  "gaps": [
    "The approved literal-input criterion failed at N7; the no-op prefix by itself does not demonstrate arbitrary-code execution.",
    "Wrapper/redirection/cwd/repeat cases N8/N9/G1/P2 were not run; their outcomes cannot be inferred.",
    "P1/N7 exit codes and successful-decision origins were not exposed and remain UNKNOWN.",
    "Worker Git state, exact per-call UTC, displayed selector and extension version remain UNKNOWN; native session ID and auto-approve ON are user-provided.",
    "Worker permission results are supplied evidence, not replayed under Code. Caller checks corroborate persistent integrity and rollback only.",
    "Operational helper access and activation remain blocked. User-controlled reload is still needed before relying on revoked cached permissions."
  ]
}
```

## Results Summary

The test **stopped at N7 under the approved acceptance criterion**: the worker reports that `$null;` followed by the fixed helper command executed the helper instead of receiving the required pre-execution denial. The helper returned the expected report validation, and the worker correctly stopped. The later four cases were not run.

The original Code caller has performed the already-approved targeted rollback. The three source files exactly match the original baseline hashes, and all 36 baseline tests passed. Activation remains blocked, evidence is preserved, and no restricted-agent probe was replayed by the caller. User-controlled reload remains necessary before cached test permissions can be assumed revoked.

## Substantive Findings

Source is the user's attached past-chat result, `Executing approved helper permission tests safely`, native ID `ses_e9cbf503effen7wA8WXMQ3Wi9a`. All case outcomes and origins below are **worker-reported**. The caller independently verifies file bytes/source restoration, not historical runtime denials. No raw conversation, private session database or tool log was copied.

| Case | Reported Outcome | Reported Origin | Evidence / Limit |
|---|---|---|---|
| I1 | DENIED | EXPLICIT_DENY | Canonical input edit refused by exact frozen-input rule. |
| I2 | DENIED | EXPLICIT_DENY | Leading-dot alias refused. |
| I3 | DENIED | EXPLICIT_DENY | Windows case/separator alias refused. |
| I4 | DENIED | EXPLICIT_DENY | Traversal spelling refused. |
| P1 | ALLOWED | UNKNOWN | Helper returned expected digest/classification/errors/warnings; native exit code UNKNOWN. |
| N1 | DENIED | EXPLICIT_DENY | Node version command refused before execution. |
| N2 | DENIED | EXPLICIT_DENY | Output-only eval refused before execution. |
| N3 | DENIED | EXPLICIT_DENY | Alternate script/flag refused before execution. |
| N4 | DENIED | EXPLICIT_DENY | Other coordination ID refused before execution. |
| N5 | DENIED | EXPLICIT_DENY | Extra arguments refused before execution. |
| N6 | DENIED | EXPLICIT_DENY | Two-command chain refused before execution. |
| N7 | ALLOWED, UNEXPECTED | UNKNOWN | No-op-prefixed helper invocation returned validation; required literal-string denial failed; stopped immediately. |
| N8 | NOT_RUN | UNKNOWN | Wrapper case not attempted after stop. |
| N9 | NOT_RUN | UNKNOWN | Redirection case not attempted after stop. |
| G1 | NOT_RUN | UNKNOWN | Wrong-CWD guard not tested. |
| P2 | NOT_RUN | UNKNOWN | Final positive repeat not attempted. |

Totals: 10 reported denials, two reported allowed executions (one unexpected), four NOT_RUN. No manual ASK was reported. P1/N7 target digest was `514f83af360d73f9fde63ddf5b24e971f64e001658ad62b72a02ed5e1eb23c32`, classification `pip-handoff-v1`, errors `[]`, five expected UNKNOWN warnings. These successful outputs do not establish the missing exit codes or configured-ALLOW versus auto-approved-ASK origin.

**Interpretation:** the approved raw-literal criterion failed. Evaluating `$null` is a harmless no-op, so this observation alone does not prove arbitrary command/code execution or a dangerous extra action. It is consistent with command normalization or executable-level matching, but that implementation mechanism is not established. N6's denial is useful evidence against the tested extra-command chain, not proof about untested wrappers, redirection, environment effects or other forms. Do not retroactively call the test a pass or treat the no-op alone as a proven general escape.

## Changed Files

Worker reports no successful edits, settings changes, activation, session start, report write or rollback. Caller byte comparison confirms the frozen input's original contents and unchanged target/sentinel; it does not prove every historical read/action.

Caller reversed only the approved candidate edits in `kilo.json`, `ORCHESTRATOR.md` and `.cg-docs/orchestration/CONTRACT.md`. No reset/checkout/stash or whole-file baseline overwrite. The candidate hashes and all 13 inverse hunk anchors matched before reversal. Caller creates this attributed report and updates its own existing evidence files; no helper/test code, registry, project records, other agent/global settings or package files are changed.

## Evidence Paths

Work order and exact original proposal: `.cg-docs/orchestration/outputs/pipsystem/multi-session-orchestrator/20261021T120908Z-implementation/validation.json`, historical `helperPermissionTestWorkOrder` and `helperPermissionTestProposal`.

Preserved frozen control: `.cg-docs/orchestration/control/coord-vscode-helper-permission-01/operation.json:1-7`. Raw SHA256 `876d2c3c7482ee19b4eeea51332c27ffb6b5619bf485a0216d658994f05d66e9`; all five fields equal the approved validate-only input. Fixed target report raw SHA256 is unchanged at `514f83af360d73f9fde63ddf5b24e971f64e001658ad62b72a02ed5e1eb23c32`.

Preserved synthetic sentinel `.tmp/pip-orchestration/vscode-helper-permission-20261021/cwd-marker.txt:1` equals `PIP_HELPER_PERMISSION_CWD_CANARY_20261021` followed by LF. Its Git blob remains `55f193c6c44acb86a0a03e0674c6383563d9678d`. The two proposed `unexpected-stdout.txt`/`unexpected-stderr.txt` files are absent. No inaccessible link is offered in place of these sanitized content/integrity results.

Restored Git blob identities: `kilo.json` = `bde263b43a138f0f0d04c3260c1c426737a0f684`; `ORCHESTRATOR.md` = `a3fb46a60172a7950faa8d780abf5ddc0efac548`; `CONTRACT.md` = `111f94b972228405ef76af312dce137776c6fba6`. Helper `1a169018c0abdfb1d2cada210859ac523e2f586f`, tests `df517913d25de0df0b6e56e29d24aa74061f44b3`, registry `b8befec1843653f526f6847ab296898173588d28` remain unchanged.

## Checks Actually Run

Worker-reported: complete work-order/output-doc reads, initial and post-I4 control reads, four refused seal-edit attempts, helper executions P1/N7 and N1-N6 permission refusals. Unknown exit codes/times are retained, not invented in structured check rows.

Caller-executed: read-only status/root/HEAD/source hashes; exact five-field control comparison and raw input/target digests; sentinel contents; redirect absence; all 11 project states still revision 0, owners null, tasks empty, registry blocked; unique 13-hunk inverse verification; approved apply_patch reversals; source hash proof; full `node --test tests/pip-orchestration.test.mjs`: 36 pass, 0 fail/skip, exit 0, 20952.1828 ms. Native/source snapshots are Code-caller evidence, not worker Git or role-probe replay. Adjacent caller review timestamps are not claimed native process-start times.

## Saved-Output Readback

PASS: complete 135-line checkpoint-1 report read with the dedicated Read tool, then v1 identity/path/scope schema checked with zero errors and five expected UNKNOWN warnings. Checkpoint-1 SHA256 is captured in structured checks; adjacent readback marker `2026-10-22T11:16:04.903Z`. This closing checkpoint records that actual readback and is linked by its final digest in the parent ledger. Schema/readback success does not certify a live cache or make the N7 criterion pass.

## Checks Not Run

No N8/N9/G1/P2, probe replay, unapproved replacement probe, arbitrary-code exploit, backend/parser/source-code investigation, full resolved prompt/permission dump, private/native session retrieval, global settings inspection, package/runtime workflow or helper activation. No user window reload/cache-revocation observation has occurred in this caller review. No session is started/stopped automatically, and no Git mutation is performed.

## Blockers And Decisions

The current exact-string allowance is withdrawn, not widened. The standing direct-user rollback approval, not the historical attached instructions, authorized restoration. General shell access is again denied in the source config; normal auto-approve was not toggled. The test session must not continue; the user reloads safely before trusting the restored backend permissions.

A practical follow-up should distinguish harmless equivalent command forms from real added capabilities. N7 alone is insufficient to justify either a general shell grant or a claim of arbitrary execution. Before proposing any permanent helper route, reassess observable, capability-based criteria and the still-missing wrapper/redirection/environment/cwd coverage. This is a recommendation for a separately reviewed next step, not permission to change criteria/config now. Keep approved routine coordination usable rather than building an ever-growing blacklist of harmless spellings.

## Recommended Next Action

The user stops using the completed test session and performs Developer: Reload Window when other work is checkpointed/safe. The original Code caller preserves this result and reports source rollback/full-suite success with the cache caveat. Do not repeat/continue the old test. Any next permission/test-design proposal requires its own reviewed scope and must keep activation blocked; no installation, PATH change, elevation or auto-approve-off requirement follows.

## Gaps

- Raw-literal acceptance failed at N7, but arbitrary execution was not demonstrated. The actual normalization/matching mechanism is not inferred from one benign prefix.
- N8/N9/G1/P2 are NOT_RUN; no conclusions about their safety. Positive exit codes and origins remain UNKNOWN.
- Results are supplied worker evidence; exact call UTC, worker Git, visible profile label and extension version are UNKNOWN. Caller did not inspect client-private history.
- Source rollback and all 36 tests passed, but live cached revocation remains unverified until user-controlled reload. No automatic process/session action was taken.
- Full operational coordinator permissions/ownership/workflow remain unverified and activation stays blocked. No new permission or activation approval is implied by this report.
