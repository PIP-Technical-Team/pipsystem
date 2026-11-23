---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T211207Z-inspection/stamp-aliases
status: completed
updated: 2026-11-16T21:14:43Z
owner: stamp-aliases inspection
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE
next: No further inspection pending; source findings available to coordinator.
---

# stamp initialization write destinations

## Summary

Read-only source trace complete. At this stamp HEAD there is NO disk alias
registry, alias-registry location selector, alias-registry lock or alias config
file in the st_init call chain. Registration is an in-memory environment update.

### Provenance and environment

- Coordinator: expected existing main at
  E:/PovcalNet/01.personal/wb384996/PIP/pipsystem, verified; HEAD
  e9c71e3190f1ce88a017ae25af7c373a64c655a2. Existing modified/untracked paths
  were present, including CONTRACT.md and the qmd-working-release output tree;
  none were changed except this new report. No checkout mismatch or switching.
- stamp: E:/PovcalNet/01.personal/wb384996/Rpackages/stamp, HEAD
  95890411e8bf9db842593c2b0ab68ec4f2a66b25, existing ready_cran,
  behind origin/ready_cran by 4 according to local tracking state. Pending:
  modified .gitignore and compound-gpid.local.md; untracked .compound-gpid/.
  Recorded before reading package source. Inspected R files match HEAD.
- pipfun: E:/PovcalNet/01.personal/wb384996/PIP/pipfun, HEAD
  7d534516a8c17c33d537681610eccd4c29211762, existing PROD tracking origin/PROD,
  clean pending state. Recorded before reading package source. Inspected R
  files match HEAD. This additional read was limited to initialization and
  the necessary default root/alias mapping.

### Exact st_init write trace

All stamp citations below are relative to its repository and recorded SHA.

- Defaults: root = ".", state_dir = ".stamp", alias = NULL (mapped to
  "default"). root is made absolute; state path is built from root and
  state_dir, not alias (R/IO_core.R:32-41,58-60).
- Filesystem effects: ensure <absolute-root>/.stamp/,
  <absolute-root>/.stamp/temp/, and <absolute-root>/.stamp/logs/
  exist, using the default state_dir (R/IO_core.R:110-113).
  The helper checks directory existence and calls fs::dir_create with
  recurse = TRUE, so missing ancestors can also be created
  (R/utils.R:14-26). No files are written in this call chain.
- Alias registry: .stamp_aliases is rlang::env(), with alias mapping to
  list(root, state_dir, stamp_path), not an on-disk registry
  (R/aaa.R:32-36,61-66). Lookup uses env_get, not file I/O
  (R/aaa.R:71-78). st_init invokes that registration at
  R/IO_core.R:115-121. Default-alias legacy state is also memory-only:
  R/IO_core.R:105-108; R/aaa.R:46-49.
- Lock/config destinations: NONE in st_init or the above called helpers.
  The full executable st_init body is R/IO_core.R:32-132; its only
  filesystem-mutating calls are the three directory helper calls.

### pipfun destinations using default state_dir

All pipfun citations below are relative to its repository and recorded SHA.
Let M = main_dir and T = paste0(release, "_", identity).
For EACH root in this table, st_init ensures root/.stamp/ plus its temp/
and logs/ subdirectories; alias names do not add path components.

| Alias | Root |
|---|---|
| default | M (only initialized when M/.stamp is absent) |
| aux | M/aux_repository/aux_data/T |
| aux_meta | M/aux_repository/aux_metadata/T |
| dlw | M/dlw_repository/dlw_data |
| dlw_inv | M/dlw_repository/dlw_inventory |
| dlw_meta | M/dlw_repository/dlw_metadata/T |
| pip | M/pip_repository/pip_data/surveys |
| pip_meta | M/pip_repository/pip_data/surveys_metadata/T |
| pip_inv | M/pip_repository/pip_inventory/T |
| pip_master | M/pip_repository/pip_data/master_inventory |

Evidence: root layout R/working_release.R:216-256; default-root st_init
R/working_release.R:258-265; folder keys R/working_release.R:267-279;
alias mapping and st_init calls R/working_release.R:469-480,509-519.
include_release changes selected alias STRINGS, not roots
(R/working_release.R:482-507). setup_working_release forwards main_dir to
set_pip_folders and passes its result to init_pip_aliases
(R/working_release.R:133-148). The returned pipfun aliases and folders are
stored in memory via env_poke, not registry files
(R/working_release.R:150-158).

### Existing path controls

- stamp public root argument controls the root; public state_dir argument
  replaces the default .stamp component (stamp R/IO_core.R:32-40,58-60).
  An explicit absolute E:/... root and default relative .stamp keep these
  traced writes beneath that E: root. Relative root = "." uses the process
  working directory; it is not a fixed user-profile destination.
- pipfun setup_working_release(main_dir = ...) and set_pip_folders(main_dir
  = ...) expose the root; omitted arguments use getOption("pipfun.main_dir")
  (pipfun R/working_release.R:64,204-209). The package default for that option
  is fs::path(Sys.getenv("PIP_ROOT_DIR"), "PIP_ingestion_pipeline_v2")
  (pipfun R/zzz.R:2-14). Preexisting option values are preserved at load
  (pipfun R/zzz.R:22-24). These are existing ways to select an E: main_dir.
- pipfun's two st_init call sites do NOT forward state_dir; each uses .stamp
  (pipfun R/working_release.R:264,515-519). No alias-registry file override is
  needed or available in the traced stamp registration, because it is memory.

## Changes

Only this report created and updated. No package or configuration changes,
commits, Git mutations, sessions, installs or downloads.

## Checks run

- Read-only git rev-parse HEAD and git --no-optional-locks status --short
  --branch in stamp and coordinator checkout.
- Same provenance checks in pipfun before its source was read.
- git diff HEAD -- R/IO_core.R R/aaa.R R/utils.R in stamp: empty.
- git diff HEAD -- R/working_release.R R/zzz.R in pipfun: empty.
- Static functional trace: matched each st_init filesystem call to
  .st_dir_create and each pipfun alias to its constructed root; matched
  registration and lookup to memory-only helper bodies.
- Required project context and shared/technical/data.table/collapse R skills
  loaded. Testing skill not applicable: no test source reviewed or written.
- Get-Date -AsUTC failed because PowerShell 5.1 lacks that parameter;
  no filesystem effect. Retried successfully using
  (Get-Date).ToUniversalTime().ToString('o').
- No R, package namespaces, pipeline, permission probes, credentials or
  household data read/executed. No tests executed, as required.

## Gaps

- Actual runtime PIP_ROOT_DIR, pipfun.main_dir option, current R working
  directory, and installed stamp implementation are UNKNOWN; not read or
  loaded. Default destinations above are exact source formulas, not claims
  about a particular future process's resolved paths.
- E: symlink/junction resolution and future root existence are UNKNOWN;
  no path permission probes or runtime checks performed.
- This narrowly scoped trace establishes st_init/alias-path writes only.
  It does not certify every indirect write of a complete pipfun setup,
  package loading, R startup, dependencies, logs, caches or later pipeline.
  Full future sandbox containment beyond this trace is UNKNOWN.
- No evidence here applies to origin's four newer stamp commits or any
  different installed build. No fetch or package execution performed.
