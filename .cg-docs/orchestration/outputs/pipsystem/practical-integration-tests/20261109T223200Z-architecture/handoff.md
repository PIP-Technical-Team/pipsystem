---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-architecture
status: completed
updated: 2026-11-09T22:33:38Z
owner: architecture-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinator incorporates this review; implementation remains blocked, with no execution or fixes authorized by this review.
---

# Installed-package one-survey architecture review

## Summary

FULL static architecture review completed for setup.R, run.ps1, approved revision 1 Plan and implementation handoff. One P2 manual finding: install children do not inherit the setup process's restricted base-library search. No P0, P1 or P3 findings. The two-script structure is appropriate; no framework, additional installer, dependencies or module split is warranted.

Installation remains blocked at pipaux lazy loading; scenario execution has not started. Review completion is not Plan completion or a passed V1 installation gate.

## Findings

### [P2] [manual] experiments/one-survey/setup.R:20-23,103-107 — installation isolation stops at the parent R process

**Issue**: The script replaces `.Library` and restricts `.libPaths()` only in its current R process (lines 20-23). Each install starts a separate R executable (lines 104-107). The launcher sets `R_LIBS` to the dedicated library and disables user/site libraries (`experiments/one-survey/run.ps1:29`), but does not change that child's built-in `.Library`. This matters because setup explicitly identifies contributed packages in the original R installation library (`setup.R:7-11`). The closure copy and final parent namespace check therefore do not establish the same restricted search boundary during package installation. The worker independently discloses this gap (`20261109T222400Z-implementation/handoff.md:85`). This is a demonstrated architectural opening, not proof that an ambient dependency was actually used.

**Impact**: Lazy loading or install-time dependency resolution can consult an unrecorded contributed package from the R installation, weakening the claim that installation used only the copied dependency closure. A successful parent check later would not retrospectively establish install-child isolation. This falls short of the approved no-ambient-fallback boundary (Plan lines 38,85,95).

**Fix**: In an authorized correction, make the existing install invocation use the same dedicated-plus-base/recommended search boundary in its child R processes, not just the parent. Keep this within the two scripts and verify the effective install-child library paths once. Do not add an installer framework, downloads or a new dependency. Preserve the pipaux failure evidence; the isolation correction is not permission to bypass that failure or declare setup usable. Classified manual because it changes the installation process boundary and must be coordinated with the recorded correction budget (worker lines 77-80; Plan lines 102-109).

## Architecture assessment

- **Structure and modularity**: setup.R is 134 lines; run.ps1 is 50 lines. The launcher owns process environment and child invocation, while setup owns exact source extraction, dependency copying, installation and setup checks (`run.ps1:17-50`; `setup.R:35-134`). These are cohesive responsibilities for this bounded experiment; splitting them further would add indirection without demonstrated benefit.
- **Documented boundaries**: The launcher selects scenario.R only for scenario mode (`run.ps1:44`); the experiment directory currently contains only setup.R and run.ps1. Worker lines 19-24 explicitly stop before scenario creation. No reviewed code implements survey processing, statistics, rebuild authority or a second orchestrator. This respects the separation in `SYSTEM_DESIGN.md:186-192,284-307` and the Plan exclusions at lines 74-75. The documented processing path is not yet implemented or tested, not silently substituted.
- **Source isolation**: Committed snapshots are extracted with `git archive` at the seven explicit SHAs (`setup.R:35-48,55-66`), while dirty working-tree records are saved separately (lines 60-62). This excludes dirty worktree content rather than modifying package checkouts; the worker clearly reports that distinction (handoff lines 38,57-66). No package source repository was independently read in this review.
- **Dependency scope**: A small recursive Depends/Imports/LinkingTo traversal copies existing installed third-party dependencies, with version/source/destination/DESCRIPTION provenance (`setup.R:68-100`). It does not download, upgrade, load development namespaces or introduce a dependency-management framework. The explicit seven-package order is reasonable for this fixed experiment; no general resolver or lockfile system is requested. Install-child fallback is the finding above, not a reason to replace this design.
- **Output configuration**: The launcher rejects reparse-point ancestors and top-level runtime directories before creating outputs, then redirects process-local temp/home/cache/config/log/R roots before starting R (`run.ps1:7-43`). setup configures PIP store/manifest options and checks normalized runtime destinations (`setup.R:24-34`). This is evidence of intended E-checkout isolation, not an OS-level proof of every package hook's writes.
- **Failure ownership**: The preserved log shows missing clean-survey cache during pipaux lazy loading (`.tmp/one-survey/logs/install-pipaux.log:6-11`); setup stops on a nonzero install exit (`setup.R:108-109`). Worker lines 45-55 identify a suspected pipaux/pipfun startup boundary and label the reduced reproducer unexecuted. Retaining that stop instead of creating dummy production-style directories respects Plan lines 50,70-71,105-111. Root-cause/package-change conclusions are not independently established here.

## Changes

Only this review report created and finalized. No implementation, package, protected documentation or Git mutations. No setup/R execution or fixes.

## Checks run

- Loaded cg-skill-r-technical and pl-clear-technical-communication.
- Read project charter, SYSTEM_DESIGN.md, HARVEST_BRIEF.md and coordination contract.
- Read the two scripts, approved Plan, worker handoff and retained setup/pipaux install logs; checked experiment directory contents.
- Read-only Git results: current branch main; HEAD f9454707b292a620e25abef17f2e515794020ba7. Existing dirty status includes active-state/current.json and untracked orchestration outputs, Plan, work report, .tmp and experiments; none were staged or altered except this report.
- Static cross-check of parent/child dependency boundary, responsibility separation, install order, source archive provenance and mandatory failure stop.
- No runtime checks, setup, R, package tests, install commands or final verify execution performed; expressly outside review authorization.

## Gaps

- V1 is partial/failed; no successful fresh setup check exists. V2-V4 remain not run, as worker lines 68-75 report. No survey rejection, numerical correctness, storage or exact-version readback result can be certified.
- The child-library fallback is statically established; actual dependency paths used during the five successful installations are UNKNOWN. No claim of observed contamination or external writes.
- No package source repository was read. Worker SHA inventory (lines 57-66) is inherited provenance only; this report does not independently validate its proposed package root cause.
- Third-party hooks and OS-level writes were not audited. Launcher configuration does not prove absence of hardcoded external writes (worker lines 85-86).
- Architecture review alone does not satisfy the full review/final verification gates at Plan lines 55-58,89. Integration and owner action remain the coordinator's responsibility; this report grants no correction-budget extension, package edits or execution authorization.
- Later: no additional framework, speculative safeguards or dependencies recommended.
