---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-quality
status: completed
updated: 2026-11-09T22:34:18Z
owner: code-quality reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Review requester incorporates two code-quality findings; package installation and scenario remain blocked, not approved to resume by this report.
---

# Installed-package one-survey code-quality review

## Summary
Completed static code-quality review of the complete new experiments/one-survey/setup.R and run.ps1 against the approved Plan and retained implementation evidence. Two P2 findings; no P0, P1 or P3 findings. Review completion is not Plan or runtime completion. The pipaux installation blocker and absent scenario are accepted execution limits, not findings by themselves.

## Findings

### CQ-1
**[P2]** `experiments/one-survey/setup.R:104-107` -- Installation children do not inherit the restricted base-library binding. **Tag: manual**

**Issue**: Lines 20-23 change .Library and .libPaths() only in the running setup R process. Each R.exe CMD INSTALL starts another R process with its own original .Library. R_LIBS/R_LIBS_SITE redirection in run.ps1:29 does not replace that built-in library. This installation explicitly contains contributed packages (setup.R:7-11), so installation/lazy-loading can resolve ambient contributed dependencies outside the copied, recorded library. The later setup-process path assertion at line 114 cannot establish the installation children's isolation. This contradicts Plan C2 (Plan:95), independently of the legitimate pipaux missing-cache failure. The worker already discloses this limitation at its handoff:85; disclosure does not remove the code defect.

**Fix**: Make the actual installation R process use the dedicated library and copied base/recommended subset, rather than relying on an in-memory change in its parent. Keep the first pipaux failure preserved; do not initialize its missing cache or substitute a package to obtain a pass. The appropriate installation-child mechanism needs implementation-owner assessment, hence manual rather than a claimed automatic correction.

### CQ-2
**[P2]** `experiments/one-survey/run.ps1:43` -- Launcher leaves the caller's process environment redirected. **Tag: safe_auto**

**Issue**: SetEnvironmentVariable(..., 'Process') changes the hosting PowerShell process, not only Rscript. The documented direct invocation (implementation handoff:34,37-38) therefore leaves HOME, USERPROFILE, TEMP, R_LIBS, Git configuration and other settings redirected after either success or the throw at line 50. Subsequent unrelated commands in that same terminal use the experiment's home/cache/library and disabled Git configuration. This is a launcher side effect, not isolation confined to the child.

**Fix**: Capture the prior values (including unset values), apply overrides inside try, and restore them in finally after the child exits or fails. Restore the previous ErrorActionPreference as well, instead of assuming Stop is the caller's preference. Keep all child execution and log capture inside the override scope.

## Changes
Only this report was created and updated. No implementation, package, or Git mutations were performed. No fixes applied; tags classify proposed corrections, not authorization.

## Checks run
- Read project charter, design, harvest brief, local R dialect configuration, R instruction router, approved revision 1 Plan, pip-handoff-v2 contract and implementation handoff.
- Loaded clear technical communication and R technical, analytical, shared, data.table and collapse skills before inspecting R code. No analytical scenario exists to review.
- Read both changed files in full. Git status shows experiments/ is untracked; git diff and git ls-files for these files returned no tracked content. Reviewed complete additions, not an assumed tracked diff.
- Read-only Git confirmed existing main at f9454707b292a620e25abef17f2e515794020ba7. Unrelated tracked active-state modification and untracked Plan, work report, runtime and reports were left untouched.
- Read retained setup.log:1-7 and install-pipaux.log:1-11. Confirmed five installation exit-zero records followed by pipaux exit 1 during lazy loading with a missing clean-survey-data cache. Did not equate exit-zero installation with successful runtime loading.
- No setup, R process, package tests, package installation, scenario, dependency download or reproducer was run. No new runtime artifacts were produced.
- Timestamp read using Windows PowerShell. An initial Get-Date -AsUTC call was unsupported in PowerShell 5.1; replaced with (Get-Date).ToUniversalTime().ToString(...), successfully. No files written by either clock command.

## Package provenance
No package repository or retained package-source file was read in this review. Package behavior attribution remains inherited evidence, not independently re-reviewed source. The retained implementation handoff:57-66 and setup.R:35-48 agree on these snapshot SHAs:

| Package | Retained SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

## Gaps
- Static findings were not reproduced with new execution, as requested. Installation-child actual namespace resolution and filesystem writes remain unmeasured; CQ-1 identifies the implemented isolation gap, not proof of a particular ambient dependency being loaded.
- Setup remains blocked at pipaux installation (missing cache). No scenario exists, and survey validation, cleaning, storage, malformed control and pinned readback remain unreviewed/unexecuted rather than failed quality findings.
- This is the code-quality role only, not completion of other required execution-review roles or /cg-review mode:verify. Neither finding was corrected in this read-only review.
- The package root-cause attribution is inherited from implementation handoff:55; only the retained installation log was independently inspected here. No package fix or blocker bypass is recommended.
