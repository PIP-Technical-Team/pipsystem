---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-version-control
status: completed
updated: 2026-11-09T22:34:04Z
owner: version-control-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Parent incorporates P2 runtime-ignore finding into full execution review; implementation remains blocked.
---

# Version-control execution review

## Summary
Static version-control review complete with one P2 safe_auto finding. No P0 credential exposure identified in the two reviewed scripts. Implementation remains blocked, not Plan-complete: worker handoff lines 18-24,68-89 records pipaux installation failure and no scenario. No runtime execution performed by this reviewer.

## Findings

**[P2]** `.gitignore:35-43` -- [safe_auto] Dedicated experiment runtime is not ignored.
**Issue**: Existing ignore entries cover other named runtime directories but not `.tmp/one-survey/`. Read-only `git status --short --untracked-files=all` exposes copied libraries, package archives/extracted trees and logs as untracked staging candidates. `git check-ignore -v` returned no match for `.tmp/one-survey/inventory.rds`, `logs/setup.log`, or hypothetical runtime-home `.Renviron`/`.env` paths. This fails the requested runtime/secrets exclusion boundary; it is not evidence that secrets are actually present. Nothing under this runtime is currently tracked (`git ls-files .tmp/one-survey` empty).
**Fix**: Add the narrow root ignore entry `/.tmp/one-survey/`. Retain runtime failure evidence on disk and keep the Plan and task outputs outside that ignore rule. No deletion, rename, replacement or movement of project records is proposed. No fix applied by reviewer.

### Other reviewed boundaries: no additional version-control issues identified
- Exact full SHAs appear in `experiments/one-survey/setup.R:35-48`; `:60-66` records dirty status separately and uses `git archive <SHA>`, not the dirty checkout, for source extraction. Dirty stamp/pipload source trees are excluded by this mechanism rather than silently installed. This finding is static, not a byte-for-byte archive audit.
- Dependency provenance is explicitly saved at `setup.R:91-100` (version, resolved source, destination and DESCRIPTION MD5); worker handoff `:39,85-86` accurately limits the claim. No new renv project or lockfile requirement is imposed on this bounded installed-library experiment; no unpinned download/install helper appears in reviewed scripts.
- Launcher roots temp/home/cache/config/log and R library locations inside this checkout (`run.ps1:23-43`), with `--vanilla` at `:46`. Installation isolation remains uncertified as disclosed by worker handoff `:85`; Git review does not certify third-party hooks or OS writes.
- No staging/commit/reset/checkout/push/package-source-write operations appear in the reviewed scripts. `setup.R:63-66` writes archives/extractions under the pipsystem runtime; source repositories are read via status/archive only.
- Main branch is explicitly the authorized checkout, so no feature-branch finding is raised. Current HEAD matches worker baseline; staged diff is empty. The sole tracked pipsystem diff is parent-owned `.cg-docs/active-state/current.json`, not attributed to implementation. Plan/work/task-output paths were initially untracked per user context and worker handoff `:25`; their untracked state is not treated as lost work or unauthorized mutation.

## Changes
Only this review report created and finalized by reviewer. No source/ignore/Plan/package changes, staging, commits or runtime execution. Existing parent/worker artifacts preserved.

## Checks run
Read Plan revision 1, worker handoff, required project context, coordination contract, scripts and root .gitignore; loaded R technical skill.

Read-only Git checks (all with `--no-optional-locks`):
- Root status (normal and all-untracked), diff/stat, cached diff/stat/name-only, HEAD and current branch: main at SHA above; no staged changes; only tracked diff active-state/current.json. All-untracked output was large because runtime is visible.
- `check-ignore -v` on four runtime paths: no matches; `ls-files .tmp/one-survey`: empty.
- `diff --check`: no whitespace errors; preexisting active-state LF/CRLF warning. This check does not cover untracked scripts.
- Recent three commits: conventional `docs(...)` format; no commits made in this review.
- Package HEAD/status inspections below agree with worker handoff inventory and dirty exclusions. No package source files were read by reviewer; these are independently observed Git identities, not runtime provenance certification.

| Repository | HEAD | Current status |
|---|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 | Modified .gitignore and compound-gpid.local.md; untracked .compound-gpid/ |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b | Clean |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 | Modified .gitignore; untracked Plan/review/config/.github/skills/sessionInfoLog |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | Clean |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 | Clean |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | Clean |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 | Clean |

Package roots: stamp/dlw under `E:/PovcalNet/01.personal/wb384996/Rpackages/`; remaining packages under `E:/PovcalNet/01.personal/wb384996/PIP/`. Only read-only Git commands were run; no writing command/test/process was launched. Kilo's own saved tool output is runtime-managed, not a reviewer-created external artifact.

## Gaps
- V1 remains partial; V2-V4 are not run; full review/verify is parent-owned (worker handoff lines 68-89). This completed review is not completion of the approved Plan.
- No R/runtime commands executed; binary inventory.rds, archive contents, copied dependency binaries and all package hooks were not audited. Dependency provenance record presence is established by script and worker report, not independently deserialized.
- Current Git status plus worker baseline supports no new package mutations, but cannot prove historical absence of every transient write or restore. No OS-level write audit or exhaustive secret/PII scan of copied archives/libraries was performed. No actual credential exposure is alleged.
- Runtime ignore finding remains open until parent applies the narrow rule and verifies it. Existing unrelated package dirt and parent Plan/reports/active-state are excluded from reviewer ownership. No commits or pushes authorized.
