---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T143615Z-harness-audit
status: completed
updated: 2026-11-10T14:38:19Z
owner: independent-adversarial-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Review complete; no implementation or pipeline execution performed.
---

# Independent harness audit

## Summary
Independent review of the four current uncommitted harness files against the follow-up Plan and five latest fixed findings found no substantiated consequential P0-P2 issue. This is source/evidence review, not a fresh execution certification. No implementation changes or pipeline execution performed.

The five latest closures are supported at the stated bounded harness surface:
- P1.1 helper write confinement: checks.ps1:1-9,38-44,53-65 validates IDs and destinations before fixture writes; paths.ps1:1-32 checks ancestors and recursive links. Existing fixture transcript lines22-49 records reason-specific rejection/no-write controls.
- P1.4 usable exported behavior: setup.R:31-44 uses exported stamp hash behavior and pipfun log_names, with explicit private-base namespace path; current check.log:1-36 records successful acceptance. Package export semantics were not independently re-read from a package repository.
- P1.5 fixture contamination: checks.ps1:37-38 places fixtures in a sibling tree, not the positive runtime. Existing child-startup.log:9-11 records subsequent check, intentional failure and diagnostic children.
- P2.3 real boundary failures: checks.ps1:11-28 requires failure reasons and caller-state equality; :112-116 requires the actual intentional-child marker. setup.R:93-100 checks a real declared-dependency install rejection. Existing boundary transcript lines22-49 supports specific controls, not merely any exception.
- P2.4 current dependency reconciliation: setup.R:150-189 compares inventory with the current dependency table, copied DESCRIPTION versions/digests and namespace destinations; :194-208 contains five explicit mutations. Existing check.log:1,36 records that these passed.

Inherited isolation boundaries also remain visible: run.ps1:13-18 rejects setup reuse; :38-64 redirects child environment; :65-91 creates/audits the private runtime; :98-103 restores caller environment. Existing child-startup.log:2-8 shows actual installer/lazy-load children using only the private libraries and contained staging paths.

## Changes
Only this required report created and finalized. No implementation, package, Git, or other project files changed. No commits.

## Checks run
- Read project constraints and handoff contract.
- Read-only git status, HEAD and current branch: main at f9454707b292a620e25abef17f2e515794020ba7.
- Read all four experiments/one-survey scripts, follow-up Plan, historical full review, latest verify review and resumed Work Report.
- Independently read retained completion-green boundary transcript, check.log, child-startup.log and diagnose.log. These are prior-run evidence, not runs performed by this reviewer.
- Small PowerShell missing-command semantics probe only (no harness/R/package process, no file output): an absent executable raised CommandNotFoundException through try/finally. The proposed stale-LASTEXITCODE false-success hypothesis was not supported and is NOT a finding. The probe errored as expected; no harness check was represented as passed by it.
- No package repository read. Consequently no newly inspected package-repository SHA exists to record; package pins mentioned above remain inherited evidence only.

## Gaps
- No pipeline, installation, R, Pester, package test, or current harness execution was performed, as requested. No fresh reproduction or OS-wide write tracing.
- Caller-state equality execution is asserted by the prior Work Report; there is no separate persisted green-helper transcript. Child logs corroborate child entry but cannot alone prove full parent-environment equality.
- Static pre-write checks/environment redirection are not a hostile-process sandbox or proof against concurrent filesystem replacement; no concrete current exploit was established, so this remains a limitation, not a reported defect.
- No package payload attestation, dependency-hook audit or package-root source verification was undertaken. No package repository was read or modified.
- Original survey/storage/numerical/live-DLW/deflation/mean/incremental/historical-after-later-save scenarios remain outside this follow-up. diagnose.log:36-40 records the expected fresh-root ENOENT and downstream NOT RUN, not original-Plan success.
