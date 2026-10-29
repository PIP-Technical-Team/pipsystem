# Pipsystem User Wiki

```json
{
  "schemaVersion": "pip-handoff-v1",
  "projectId": "pipsystem",
  "taskId": "user-wiki",
  "runId": "20261022T153921Z-code",
  "requestId": "direct-user-wiki-20261022",
  "coordinationSessionId": "code-refocus-20261022",
  "reportingOwner": "user-wiki-code-session",
  "checkpoint": 4,
  "createdAt": "2026-10-22T15:40:43.333Z",
  "updatedAt": "2026-10-22T15:52:19.326Z",
  "repository": {"name": "pipsystem", "root": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem"},
  "worktree": {"name": "main-checkout", "path": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem", "kind": "main"},
  "session": {"label": "same-code-session-user-wiki", "nativeId": "UNKNOWN"},
  "git": {
    "branch": "main", "baseSha": "a919aaeebd7ad105534775709c1dacfcfc9bd008", "headSha": "a919aaeebd7ad105534775709c1dacfcfc9bd008",
    "capturedAt": "2026-10-22T15:49:45.379Z", "dirty": "dirty",
    "changedFiles": ["README.md", "wiki/README.md", "wiki/usage.md", "wiki/configuration.md", "wiki/cli-reference.md", "wiki/_wiki.yml", ".cg-docs/orchestration/outputs/pipsystem/user-wiki/20261022T153921Z-code/handoff.md"],
    "commitsMade": [], "mergeSha": "NONE", "pr": "NONE", "testedPins": []
  },
  "scope": {
    "workflow": "documentation-only user wiki and README navigation",
    "approvalRef": "direct user request 2026-10-22T15:39:03Z",
    "planPath": "NONE", "planRevision": "NONE", "phase": "documentation",
    "writeSet": ["README.md", "wiki/README.md", "wiki/usage.md", "wiki/configuration.md", "wiki/cli-reference.md", "wiki/_wiki.yml", "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/user-wiki/20261022T153921Z-code/handoff.md"],
    "completed": "Six documentation files completed; links/manifest/managed ownership and existing static checks passed; sixteen protected pins and canonical-source preservation verified; substantive wiki/report readback complete. No required followup."
  },
  "status": "completed", "dependencyPins": [],
  "checks": [
    {"name": "Read-only in-memory Node wiki assertions", "result": "PASS: four auto pages, wiki-v1 schema/date-only manifest diff, 11 balanced registered managed sections, outside-marker text preserved, 62 relative links to 15 existing tracked targets, navigation/backlinks and no scanner placeholders/trailing whitespace", "exitCode": 0, "executedAt": "UNKNOWN", "capturedAt": "2026-10-22T15:49:45.379Z", "evidencePath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/user-wiki/20261022T153921Z-code/handoff.md", "sourceBinding": "README/wiki dirty working files based on a919aaeebd7ad105534775709c1dacfcfc9bd008; comparisons with Git HEAD", "dependencyBinding": "Existing Node built-ins and read-only Git; no installation or permanent validator", "qualification": "executed"},
    {"name": "node --test --test-name-pattern \"project config|active instructions\" \"tests/pip-orchestration.test.mjs\"", "result": "PASS: 2 tests, 2 pass, 0 fail/cancel/skip/todo; 128.2534 ms", "exitCode": 0, "executedAt": "UNKNOWN", "capturedAt": "2026-10-22T15:49:45.379Z", "evidencePath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/user-wiki/20261022T153921Z-code/handoff.md", "sourceBinding": "Unchanged operational instructions/config/static test at a919aaeebd7ad105534775709c1dacfcfc9bd008; dirty documentation only", "dependencyBinding": "Two named static tests only; no helper/functional fixture operation", "qualification": "executed"},
    {"name": "Final whitespace, protected-input pins and read-only Git audit", "result": "PASS: git diff --check exit 0, sixteen protected blobs unchanged, protected canonical-source diff empty, HEAD unchanged; only six intended docs and new owned report added to initial pending set", "exitCode": 0, "executedAt": "UNKNOWN", "capturedAt": "2026-10-22T15:49:45.379Z", "evidencePath": "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/user-wiki/20261022T153921Z-code/handoff.md", "sourceBinding": "Baseline a919aaeebd7ad105534775709c1dacfcfc9bd008 plus sixteen initial working-file content pins", "dependencyBinding": "Read-only Git commands and dedicated file readback", "qualification": "executed"}
  ],
  "artifacts": ["README.md", "wiki/README.md", "wiki/usage.md", "wiki/configuration.md", "wiki/cli-reference.md", "wiki/_wiki.yml", "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/user-wiki/20261022T153921Z-code/handoff.md"],
  "gaps": ["Documentation/static checks do not establish live Kilo permission enforcement, pipeline readiness or package execution; no package repository was read.", "No browser/HTML rendering or separate GitHub Wiki publication was performed; exact process-start timestamps were not collected."]
}
```

## Results Summary

The existing repository wiki is now a plain-language user guide, linked from the root README. It covers the project purpose, how to select and talk to pip-orchestrator, a six-step working cycle, five example messages, exact-path handoffs and their contents, missing/blocked evidence, source/privacy boundaries, optional work-session commands and future wiki maintenance. No agent behavior, permissions, design, helper or package was changed. This is a local repository wiki, not a separately published GitHub Wiki site. Documentation remains uncommitted; no commit/push was requested for this new task.

Checkpoint 2: six documentation files are drafted. Home explains the project and opens the right agent; Usage contains the six-step workflow, reporting/privacy rules, example messages and missing-evidence cases; Configuration explains authoritative files, permissions and deferred machinery; CLI Reference separates ordinary conversation from optional work-session commands and describes future wiki maintenance. The original outside-marker content is intentionally retained. Only the manifest date changes.

Checkpoint 3: documentation checks and preservation audit passed. Source-reviewed the completed root README and four pages. A final wording adjustment clarifies that Git/source changes belong to a separately approved working session, not the operational orchestrator; links/markers were not changed. Final whitespace check followed that adjustment. Checkpoint 4 records complete substantive report and final manifest/wording readback before adjacent marker `2026-10-22T15:52:19.326Z`. The requested wiki task is complete.

## Substantive Findings

- `wiki/_wiki.yml:1-50` has supported `compound-gpid-wiki-v1`, unique IDs/orders, flat Markdown filenames and four auto-owned pages with matching managed section IDs. `compound-gpid.context.md:39-42` points to `wiki`. No schema migration or config change is needed.
- All current wiki prose sits in managed markers except page titles, the Home Contents list and non-Home backlinks. Preserve those user-owned bytes. Only `lastUpdated` changes in the manifest; no new pages/sections are needed.
- Source basis: charter `compound-gpid.md:10-33`, decision rules `SYSTEM_DESIGN.md:5-18`, user workflow/discovery `ORCHESTRATOR.md:7-45,81-110,144-184,211-331,365-431`, report/privacy contract `.cg-docs/orchestration/CONTRACT.md:3-23,38-80`, static agent/config boundaries `kilo.json:4-38,121-138,141-204`. This is documentation of saved rules, not runtime certification.
- Completed guide evidence: root `README.md:3-20` is the entry point; `wiki/README.md:4-37,46-92` explains the project and startup; `wiki/usage.md:4-35,39-91,95-152` contains the working cycle, reporting rules, five messages and missing-evidence examples; `wiki/configuration.md:4-31,35-72,76-102` explains files, role boundaries, deferred formal machinery and troubleshooting; `wiki/cli-reference.md:4-33,37-76` separates optional commands from ordinary conversation and explains maintenance. Source links and line ranges are included in each managed guide block.
- All 11 pre-existing managed marker pairs remain balanced and registered. Existing titles, Home Contents and non-Home backlinks are preserved exactly as normalized text against HEAD. No manual-page ownership or source-access expansion was introduced. The manifest is identical to HEAD except `lastUpdated: "2026-10-22"`.
- The guide intentionally points readers to current authoritative decisions and handoffs instead of copying dated project status, old publication receipts or private chat history into the user manual. It explicitly says the wiki is not added to operational-agent reads and cannot grant permissions.

## Changed Files

Task-owned changes: the six documentation files and this report, exactly as listed in scope. Preserve the five existing pending paths: two modified old multi-session reports/validation and three untracked files (two old handoffs and `.cg-docs/brainstorms/2026-10-22-communication-instructions-review.md`). Do not modify prior refocus/followup reports.

## Evidence Paths

Main baseline: `a919aaeebd7ad105534775709c1dacfcfc9bd008`. No package source read, so no new package SHA claim. Preflight Git blobs for protected inputs: AGENTS `55e769b086bacaf6d7841a12b14fd38627abee25`; charter `8bc9c91a61d67d8d6437bfa7d1e1951efc479877`; context `9c9472ebcd3ebfb33050b39e9458cad9bd4bc6f9`; design `81ef84f72d4ea3b3724699552261482be0d5dc6e`; HARVEST_BRIEF `449528e59eff015fcc7010e76635051ff8a8a5d9`; ORCHESTRATOR `b3fd78846c1689ca06af1975048ce918e39006de`; kilo.json `115477073f09762a83a4d363b635f52d9aa6a9db`; contract `fc15d1f799241a28f9c0374d8f31132095887055`; handoff template `b5c4c34444e7208541d1d2658f9e68744642e6b6`.

Prior report/content pins: refocus `e510d6a8263725a694e88a55d7df8240f727767b`; followup `50d69bbf35cad329bb0512716a85742ab6c4e8cf`; multi-session handoff `f284916b32d87a7b023e3ed079e7f2be631697a8`; validation `c8231ab1a5cf2031031396773dc87cd15eabb44c`; autoapprove handoff `752d2a719ab90c763be478fd5c5dae601f0ac4ef`; helper-test handoff `571b157c230514d9d82f13d7394420886a01d783`; concurrent communication brainstorm `0692051512abe01b134350cc3ec37f95c64b1b1b`. These are byte/content observations, not new commits.

Final `git hash-object` returned the same sixteen initial pins. The unrelated communication brainstorm was hashed but not read, copied or edited. No external package repository, private session storage or production data was read. No new package-SHA claim is made.

## Checks Actually Run

Read current README/wiki/manifest/context, required project documents, operational prompt/config and contract/template; verified manifest/section shape and existing managed ownership. Dedicated Read confirmed the assigned report did not exist. `git status --short --branch --untracked-files=all`, `git rev-parse HEAD` and protected-file `git hash-object` exited 0. Initial capture `2026-10-22T15:39:21.288Z`; report checkpoint marker `2026-10-22T15:40:43.333Z`.

Documentation assertions executed through a read-only `node -e` program using only `node:fs`, `node:path`, `node:assert/strict`, and read-only `git show`/`git ls-files` via `node:child_process`. No validator/test file, dependency or helper was added. The assertions checked the current expected manifest shape (not a general YAML parser), unique page IDs/orders and flat safe filenames; the date-only manifest change; all 11 registered marker pairs/no nesting and exact outside-marker text against HEAD; all 62 relative Markdown links and 15 unique existing tracked within-root targets; Home links/backlinks/root navigation; removed scanner placeholders and no documentation trailing whitespace. Exit 0 with all four grouped PASS results. This is a local Markdown/link check, not a browser or runtime-agent test.

The two existing static regressions were run unchanged:

```powershell
node --test --test-name-pattern "project config|active instructions" "tests/pip-orchestration.test.mjs"
```

Exit 0: 2 PASS / 0 FAIL / 0 SKIP, 128.2534 ms total; config 8.0009 ms, instructions 4.2386 ms. Only those two named static tests ran, not helper operations or functional fixture tests.

Final checks, observed before capture `2026-10-22T15:49:45.379Z`:

```powershell
git diff --check
git diff --stat -- README.md wiki
git diff --exit-code a919aaeebd7ad105534775709c1dacfcfc9bd008 -- AGENTS.md compound-gpid.md compound-gpid.context.md compound-gpid.local.md SYSTEM_DESIGN.md HARVEST_BRIEF.md HARVEST.md ORCHESTRATOR.md kilo.json tools tests roadmap.json .kilo .cg-docs/orchestration/CONTRACT.md .cg-docs/orchestration/templates .cg-docs/orchestration/projects .cg-docs/orchestration/registry.json .cg-docs/orchestration/STATE.md .cg-docs/orchestration/REQUESTS.md
git status --short --branch --untracked-files=all
git rev-parse HEAD
```

All exit 0. Whitespace checks show expected existing LF-to-CRLF warnings only. Protected source/config/design/charter/context/helper/tests/registry/project records/roadmap/template/adapter paths have no diff. HEAD remains `a919aaeebd7ad105534775709c1dacfcfc9bd008`. Six-file documentation diff: 405 insertions, 13 deletions. Sixteen protected working-report/source blobs match exactly. Status preserves the five pre-existing pending files and adds only the six documentation edits and this owned report. Process-start times were not separately collected; `executedAt: UNKNOWN` is intentional, while the capture time is real. No timestamps or runtime passes are fabricated.

## Saved-Output Readback

PASS: the root README, all four wiki pages and manifest were read through Read; automated comparison verifies preserved outside-marker content and the date-only manifest edit. The complete 118-line substantive checkpoint-3 report was read without truncation, together with final manifest and the clarified configuration block. Adjacent completion marker `2026-10-22T15:52:19.326Z`. This checkpoint records those actual observations; final metadata/status amendments are read back before returning. Readback is not a live-agent or runtime certification.

## Checks Not Run

Not run by design: browser/HTML rendering, a separate GitHub Wiki site deployment, general YAML/schema tooling installation, full functional/helper suite, permission experiments, runtime/package tests or pipelines, live agent/session reload checks, Git mutations or session starts. The requested documentation/link/ownership/preservation checks and existing two static regressions passed. There is no new test file, build configuration, validator service, dependency, permission rule or setup gate.

## Blockers And Decisions

NONE. Reused the already configured four-page wiki and managed sections; did not add a framework, service or duplicate wiki. Kept all project/agent decisions and historical reports unchanged. This documentation request does not reuse the earlier commit/push authorization for these new edits.

## Recommended Next Action

NONE required; the requested documentation task is complete. The wiki can be used immediately through the root README. Optional independent documentation review is useful but is not a new required task, approval gate or reason to start another session automatically. No commit/push is performed without a new direct request.

## Gaps

- Live operational-agent configuration/reload and cross-repository reporting permissions remain unverified by documentation reads.
- This guide cannot establish current pipeline capabilities or native-session liveness; it must distinguish project aims from implemented behavior.
- No browser/HTML rendering or separate GitHub Wiki deployment was performed; the deliverable is the repository's existing Markdown wiki.
- Documentation validation checks this manifest's expected shape and local tracked link targets, not all future YAML shapes or external sites. Exact command-start times were not collected.
