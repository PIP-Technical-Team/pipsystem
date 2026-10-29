# M2 Authority Review Fixes

```json
{
  "schemaVersion": "pip-handoff-v1",
  "projectId": "pipdata", "taskId": "m2-authority-review-fixes",
  "runId": "20261028T133236Z-code-fixes", "requestId": "UNKNOWN",
  "coordinationSessionId": "UNKNOWN", "reportingOwner": "existing pipdata Code session",
  "checkpoint": 4, "createdAt": "2026-10-28T13:47:26Z", "updatedAt": "2026-10-28T14:26:32Z",
  "repository": {"name": "pipdata", "root": "E:/PovcalNet/01.personal/wb384996/PIP/pipdata"},
  "worktree": {"name": "pipdata", "path": "E:/PovcalNet/01.personal/wb384996/PIP/pipdata", "kind": "main"},
  "session": {"label": "existing pipdata Code session", "nativeId": "UNKNOWN"},
  "git": {
    "branch": "feat/m2-pipdata-authority", "baseSha": "4728a2b2d2aadb43ce72ddf6c19732f75188a208",
    "headSha": "4728a2b2d2aadb43ce72ddf6c19732f75188a208", "mergeSha": "NONE",
    "testedContent": "fresh182-file manifest SHA256 E96B7C6AE85D1AF0CB52C7CFF7E35DA1D20D209936396562D8BDEDF978480B82;46tests324expectations", "capturedAt": "2026-10-28T14:21:19Z",
    "dirty": "clean at start; now11 permitted package/report paths dirty, nothing staged", "changedFiles": ["R/code_fingerprint.R", "R/dependency_execution.R", "R/pd_run_pipeline.R", "tests/testthat/test-dependency-api-contract.R", "tests/testthat/test-m2-engine-authority.R", "man/pd_run_pipeline.Rd", "vignettes/articles/PIP-data-pipeline.Rmd", ".cg-docs/reviews/2026-10-27-m2-pipdata-authority-review.md", ".cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review.md", ".cg-docs/work-reports/2026-10-27-m2-pipdata-authority.md", ".cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review-2.md"], "commitsMade": [], "pr": "NONE", "testedPins": ["corrected uncommitted source manifest E96B7C6AE85D1AF0CB52C7CFF7E35DA1D20D209936396562D8BDEDF978480B82", "archive4B50A54C3CC100A02536BDEBB06CC4FFDA2DDB1498329C0834A439183BC21ABB", "stamp content5d1ddebdc926dad9c6ec99c08a65e74baee0da92", "pipload commit4ef0d90a974cb6ff0725da69373bde421dd04ad5"]
  },
  "scope": {
    "workflow": "/cg-fix-triage P0 P1 P2 P3; E5 R gate substitution; final /cg-review mode:verify",
    "approvalRef": "direct user instruction 2026-10-28T13:46:19Z",
    "planPath": ".cg-docs/plans/2026-10-26-m2-pipdata-authority.md",
    "planRevision": "3bf331d75ef536afd27095a4a5aea2aea243dcc1", "phase": "NONE; corrections only",
    "writeSet": ["W/R/code_fingerprint.R", "W/R/dependency_plan.R", "W/R/dependency_execution.R", "W/R/pd_run_pipeline.R", "W/tests/testthat/test-code-fingerprint.R", "W/tests/testthat/test-dependency-api-contract.R", "W/tests/testthat/test-m2-engine-authority.R", "W/man/pd_run_pipeline.Rd", "W/vignettes/articles/PIP-data-pipeline.Rmd", "W/.cg-docs/reviews/2026-10-27-m2-pipdata-authority-review.md", "W/.cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review.md", "W/.cg-docs/work-reports/2026-10-27-m2-pipdata-authority.md (append only)", "W/.cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review-2.md", "S/runner/run.ps1", "S/runner/gate.R", "S/source/**", "S/library/**", "S/tests/**", "S/tmp/**", "S/home/**", "S/cache/**", "S/stores/**", "S/evidence/**", "S/build/**", "S/docs/**", "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/m2-authority-review-fixes/20261028T133236Z-code-fixes/handoff.md", "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/m2-authority-review-fixes/20261028T133236Z-code-fixes/evidence.md", "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/m2-authority-review-fixes/20261028T133236Z-code-fixes/cg-code-quality.md", "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/m2-authority-review-fixes/20261028T133236Z-code-fixes/cg-testing.md"],
    "completed": "all3 findings fixed, red regressions reproduced, first corrected gate/build/install/fresh smoke pass, current bytes bound, native-selected19fixed parent and both light critics FIXED in round1"
  },
  "status": "completed",
  "reviewVerdict": "FIXED within covered scope; not blanket merge/whole-M2 certification",
  "dependencyPins": [
    {"projectId": "stamp", "kind": "content", "sha": "5d1ddebdc926dad9c6ec99c08a65e74baee0da92", "qualification": "original source/install records byte-preserved versus baseline; source/install byte assertions before/after children pass"},
    {"projectId": "pipload", "kind": "commit", "sha": "4ef0d90a974cb6ff0725da69373bde421dd04ad5", "qualification": "original source/install records byte-preserved versus baseline; actual corrected API/storage smoke passes; no global changes"}
  ],
  "checks": [{"name": "Git identity", "exitCode": 0, "result": "expected clean4728a2b at start; final same HEAD with scoped dirty corrections, no Git mutations"}, {"name": "red regressions", "exitCode": 1, "result": "46 cases14 failed expectations across all4 new negatives, prior cases green"}, {"name": "fresh corrected selected gate", "exitCode": 0, "result": "46tests324expectations, zero failures/errors/warnings/skips, no timeout"}, {"name": "source build/local install/fresh smoke", "exitCode": 0, "result": "engine built/skipped/empty, pinned42L and real rds/qs2/fst exact receipts/metadata pass"}, {"name": "current candidate binding", "result": "182 source and30 installed files match fresh manifests; new archive hash matches; immutable404-file post snapshot valid"}, {"name": "native mode:verify", "result": "exact standard parent selected19fixed from18eligible, no fallback, both authorized read-only critics FIXED round1"}, {"name": "scope/whitespace/readonly preservation", "exitCode": 0, "result": "diff check pass, protected files unchanged, Plan blob and existing commits preserved"}],
  "artifacts": ["handoff.md", "evidence.md", "cg-code-quality.md", "cg-testing.md", "W/.cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review-2.md", "S/evidence/history/gate-phase2-20261028T1406199320761Z-after"],
  "gaps": ["E5 three-file selected evidence only;41 excluded files remain explicit. No full-package check, production, SMB, full concurrency, merge or whole-M2 certification. Availability seam is not dependency-minimal installation; article not runtime-manifest-bound/rendered. Fixed export/signature capabilities do not establish arbitrary producer equivalence. Session/request/coordinator IDs UNKNOWN."]
}
```

## Results Summary

All3 findings corrected and verified FIXED by both light critics. Red/green
evidence preserved; fresh46tests324expectations plus source/build/local install/
fresh public smoke pass. Existing commits preserved; corrections uncommitted.

## Substantive Findings

P0.2 recursively rejects nested classed operands with active registered-method
mutation/cleanup proof. P1.4 checks consumed exported API signatures before any
modern preparation/lease/planning/publication. P2.14 explicitly requires optional
codetools before proof with actionable approved-library error, no auto-install or
bypass. Dependencies/API/proof schema unchanged.3 fixed,0 skipped/out of scope,
no applicable new findings.16 prior parent dispositions retained,19 now fixed.

## Changed Files

Seven permitted package files, three authorized report updates/new verification,
append-only work report, two runtime runner files and exact central outputs.
Package/index clean at start, no staging or commits. DESCRIPTION/NAMESPACE/hooks/
Plan/state/config/other repositories unchanged, except exact central outputs.
W=this repository; S=E:/PovcalNet/01.personal/wb384996/PIP/pipdata-m2-engine-runtime.

## Evidence Paths

Exact owned paths in scope.writeSet. New verify-review-2.md absent at inspection
and checkpointed here before writing; collision recheck required before save.
Supporting prior handoff/evidence/critics read; earlier attempts preserved.
New canonical verification written to reserved -verify-review-2.md after recheck;
no collision/suffix change. Both critics had distinct assigned paths and stayed
read-only; outer saved substantive attributed reports. Full fresh hashes/results
and41 E5 exclusion names saved centrally, not just links.

## Checks Actually Run

Charter/context/installed triage, source review and supporting reports read.
Existing runner and child redirects/timeouts inspected. Git config shows LFS/
textconv configuration; no candidate filters or hooks executed. Identity status
and HEAD exit0 with E temp and fsmonitor disabled. Initial UTC captured.
Preserved original404-file baseline and each before/after runtime snapshot;
all4 negative regressions red before source correction. Corrected selected gate,
source build/local install/fresh smoke pass first attempt. Independent outer
source/install/archive/snapshot hash checks pass; fixed producer records preserved.
Native19-ID selector exact, two light critics usable/FIXED. Final diff check pass,
same HEAD/Plan blob,182 current source rows rechecked no drift after review.

## Saved-Output Readback

Saved all four central outputs and canonical verification. Final substantive
readback and JSON/ten-heading validation recorded in evidence closing checkpoint.
Reviewer evidence reads are not independent executions or hash recomputation.

## Checks Not Run

Generic PowerShell/full ordinary R suite deliberately replaced by authorized
E5 selected gate.41 exclusions explicit, no full check or production/SMB/full
concurrency/merge/whole-M2 gate. No dependency-minimal install or article rendering.
No staged/committed corrected HEAD; tested identities are uncommitted content.

## Blockers And Decisions

NONE observed. Budget two correction/retest attempts per finding, two verify
rounds. No routine per-finding authorization requested. Preserve snapshots before
refresh; never recapture producer drift as truth. No downloads/global installs.
Used one corrective retest/finding and one verification round; no findings skipped,
assertion waivers, exhausted budget or denied action. No pending source correction
within covered IDs. Broader acceptance limits remain, no merge approval inferred.

## Recommended Next Action

Coordinator consumes final handoff/evidence and canonical verify-review-2.md.
No work pending in authorized correction task. Optional later commit suggestion:
fix(engine): close nested dispatch and dependency preflight gaps. No staging,
commit/push or compounding executed; separate instruction required for Git work.

## Gaps

No full-package/production/merge/whole-M2 claim. E5 exclusions explicit; codetools
controlled seam not dependency-minimal installation; producer capability guard
only exports/signatures. Article docs-only. UNKNOWN session/coordination IDs not
inferred. No new branch/worktree/Plan, production access, commits or pushes.
