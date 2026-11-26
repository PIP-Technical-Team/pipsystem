---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T215847Z-plan/plan-critic
status: completed
updated: 2026-11-16T22:08:22Z
owner: plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md revision 1
next: Coordinator resolves P2.1 in the Plan before Code-mode implementation; this review grants no execution authority.
---

# Independent Plan critique

## Summary
Read the entire revision 1 Plan and narrowly relevant current sources. One P2
planning gap found; no supported P0/P1/P3 findings. Expected checkout and existing
main verified. No implementation or acceptance execution performed.

- **[P2.1]** [cg-plan-critic] Step 1: `Add the manual cell and focused source checks` — The promised offline checker still depends on the shared filesystem.
  **Issue**: The Plan requires an offline focused checker but does not account for
  its existing unconditional evaluation of the shared-root context cell. Adding
  only PPP and new-cell source oracles does not make that checker offline.
  **Evidence**: `.cg-docs/plans/2026-11-16-qmd-working-release-initialization.md:67-72`
  requires offline/read-only source checks; `:100-102,135` repeats that boundary.
  `experiments/one-survey/check-qmd.R:31-44` evaluates the actual context cell with
  base `dir.exists` and requires both paths to exist. That cell selects the UNC
  share at `experiments/pip-pipeline.qmd:26,31` and probes it at `:35-41`.
  Only the later negative case substitutes `dir.exists`
  (`experiments/one-survey/check-qmd.R:47-54`).
  **Impact**: The required source-check gate can fail or stall on share/VPN
  availability before checking the new initialization slice, despite needing no
  live metadata or shared storage. It is not actually an offline check.
  **Fix**: Explicitly include a small checker-only change: retain exact literal
  shared-context assertions, but bind deterministic `dir.exists` responses in
  the isolated success and failure evaluation environments. Label those as
  source/control-flow checks, not shared-folder acceptance. Keep the manual Qmd
  cell unchanged except the approved PPP context change, and leave the new
  initializer/live readbacks completely unmocked in the separate E: harness.
  No new framework, dependency or package patch is needed.

## Changes
Only this assigned report created/updated. No Plan, source, configuration,
package, installed-runtime or Git changes. All pre-existing dirty work preserved.

## Checks run
- Read the complete 166-line revision 1 Plan, compound-gpid.md,
  SYSTEM_DESIGN.md, HARVEST_BRIEF.md, orchestration CONTRACT.md and both named
  inspection handoffs. Loaded communication and all five requested R skills.
- Read-only Git verified coordinator root, existing main, HEAD
  `e9c71e3190f1ce88a017ae25af7c373a64c655a2`; no environment mismatch.
- Verified full current pipfun SHA
  `7d534516a8c17c33d537681610eccd4c29211762`; clean worktree. Inspected
  working_release.R, pip_create_globals.R, zzz.R, and bounded metadata helper
  sections. `git diff HEAD` for these files was empty.
- Verified full current stamp SHA
  `95890411e8bf9db842593c2b0ab68ec4f2a66b25`. Existing dirty .gitignore,
  compound-gpid.local.md and untracked .compound-gpid/ preserved. Read
  R/IO_core.R:1-132 and R/aaa.R:1-110; inspected source diffs were empty.
- Verified manual `eval: false` baseline and source-preservation surface in
  experiments/pip-pipeline.qmd:20-47,153-170,273-347 and current checker.
  The new manual cell does not exist yet, as expected for planning review.
- Confirmed explicit root_dir/out_dir can pass through public setup's `...`
  (pipfun/R/working_release.R:54-66,110-119); legacy output creation is
  unconditional at pipfun/R/pip_create_globals.R:165-173. Automatic log startup
  must be disabled before namespace load (pipfun/R/zzz.R:22-32).
- Confirmed specified-release lookup reaches authenticated GitHub metadata
  (pipfun/R/working_release.R:94-102;
  R/release_management.R:415-431,499-517; R/get_from_gh.R:264-279).
  The Plan correctly requires actual errors as FAIL and dependents NOT RUN,
  without seeded release rows or package binding replacement.
- Confirmed nine aliases are always re-registered, even when main/.stamp
  exists (pipfun/R/working_release.R:262-265,469-480,509-519). Stamp alias
  registration is memory-only (stamp/R/aaa.R:32-36,61-77); st_init ensures
  .stamp/temp/logs under each root (stamp/R/IO_core.R:110-121). The Plan's
  fresh-process existing-directory test and exclusion of an undocumented
  default-alias expectation match this behavior.
- Inspected existing private provenance evidence under
  .tmp/one-survey/qmd-acceptance-20261113/: pins.tsv:2-3 match current SHAs;
  library/pipfun/DESCRIPTION:3,27 identifies version 1.0.1 and November 13 build;
  logs/install-pipfun.log:15 and logs/install-stamp.log:13 record DONE;
  logs/check.log:1,10-11,44-45,96 records historical receipt checks and private
  namespace paths. experiments/one-survey/setup.R:191-241 shows serialized
  receipt creation and SHA/archive/installed-Meta/path verification. This is
  historical evidence, not a fresh runtime certification. The Plan correctly
  requires re-verification and rejects version-only provenance.
- Read the existing launcher's containment settings and startup handling
  (experiments/one-survey/run.ps1:40-62,107-124,133-141) as reference only;
  did not invoke it. Separate new harness and no full renderer are appropriate.
- Minimal first: bounded Qmd/checker delta and task-local harness, no new
  framework or dependencies. No unrelated completed-code review was performed.
- NOT RUN by instruction: all R execution, namespace loading, functional tests,
  GitHub/network requests, credential lookup, installations, live setup or shared
  probes. No current runtime PASS is claimed.

## Gaps
- P2.1 requires Plan clarification before the promised offline gate is reliable.
- Serialized inventory.rds receipts were not deserialized: doing so through R
  is prohibited for this reviewer. Historical receipt-check code/logs were
  inspected; fresh verification of receipt values, hashes and actual namespace
  origins remains required during the later authorized Code-mode execution.
- Real metadata/credentials, PPP vintage availability, actual startup/cache
  destinations and resolved future sandbox paths remain untested. Their runtime
  status is UNKNOWN, not PASS. The Plan explicitly stops if provenance or E:
  containment cannot be established.
- No initialization was executed. Both fresh-store and fresh-process
  existing-store acceptance, and all shared-store acceptance, remain NOT RUN.
