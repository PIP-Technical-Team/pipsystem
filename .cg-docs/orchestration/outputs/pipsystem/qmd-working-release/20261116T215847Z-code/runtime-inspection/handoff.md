---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T215847Z-code/runtime-inspection
status: completed
updated: 2026-11-16T22:21:54Z
owner: runtime-inspection
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md revision 2
next: Execution owner uses these inputs for provenance verification and two sandbox children under approved Plan revision 2; no execution performed here.
---

# Runtime Inspection

## Summary
Read-only runtime research completed. Reuse the existing private R 4.5.2 and
its dedicated contributed library, not the ambient installation. Historical
check.log records receipt verification PASS, not a current rerun. Exact
verification procedure, startup redirects and credential limitations follow.
No R, namespace load, network, package mutation, installation, Git mutation or
session startup occurred. No Qmd/checker implementation was duplicated.

## Changes
Only this requested research handoff. No source/package changes or commits.

## Checks run
Read Plan revision 2, project contracts, setup.R, run.ps1, paths.ps1,
pins.tsv, dependencies.tsv, namespace-paths.tsv and historical check/session logs.
Read-only git rev-parse HEAD returned the recorded pipsystem full SHA.
Read-only git branch --show-current returned main. Read-only pipfun
rev-parse HEAD returned 7d534516a8c17c33d537681610eccd4c29211762.
Read-only git config --show-origin --get-all credential.helper returned manager
from C:/Users/wb384996/.gitconfig; this reads configuration, not credentials.
Get-Command gh located C:/Users/wb384996/tools/gh/gh.exe without invoking it.
Presence-only checks found GH_PASS, GH_TOKEN, GITHUB_TOKEN, GITHUB_PAT and
GITHUB_PAT_GITHUB_COM absent from this process; no values were emitted.
Clock snapshot: 2026-11-16T17:21:54.2086855-05:00 (ET).
Only the requested handoff was written, initially, at checkpoint and at finish.

## Runtime And Library Inputs

All relative paths below are relative to
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem unless stated otherwise.
For compactness, P denotes that absolute checkout; T denotes
P/.tmp/one-survey/qmd-acceptance-20261113. These are report abbreviations, not
variables already configured in a shell.

- Installed original runtime: C:/Program Files/R/R-4.5.2, read-only source.
  The existing launcher copies selected runtime components and only
  base/recommended packages into T/r (run.ps1:22-35,98-106).
- Recommended child executable: T/r/bin/Rscript.exe, with --vanilla and an
  execution-owner task-local harness filename as its script argument.
  This is the exact existing launch target (run.ps1:133). Rscript.exe exists
  in the inspected T/r/bin directory. Do not invoke original C: R for this test.
- Historical runtime identity: R 4.5.2 (2025-10-31 ucrt), x86_64-w64-mingw32/x64,
  Windows Server 2022, recorded in T/logs/session-info.txt:1-3.
- Required .libPaths order: T/library then T/r/library. R_LIBS=T/library;
  R_LIBS_USER=NULL and R_LIBS_SITE=NULL (literal strings). Ambient contributed
  libraries, load_all(), overlays, installs and pin changes are excluded.
  Evidence: run.ps1:46, setup.R:37,234-240, historical check.log:1-3.
- The original dependency shelves are provenance only, not library fallbacks:
  E:/PovcalNet/01.personal/wb384996/R/win-library/4.5, except qs2, stringfish and
  RcppParallel from the sibling 4.5-pipapi shelf (setup.R:25-30;
  T/dependencies.tsv:10-12). All 107 dependency records point to T/library.
- T/r/library/base/R/Rprofile:219-231 already logs child startup into
  T/logs/child-startup.log, restricts library paths and disables pipfun logging.
  Keep ONE_SURVEY_ROOT=T, even when the new sandbox/output root is elsewhere.
  Changing it to a new harness root breaks this hook's expected library paths.
  Preserve this historical runtime; do not rewrite its base profile.

## Receipt Verification Procedure

Procedure is existing code, not new implementation: setup.R:203-242. The
execution owner must re-verify before claiming current provenance.

1. Deserialize T/inventory.rds in the contained R child. Check inventory root
   exactly T; package table exactly setup.R:9-22; receipt names exactly the
   seven required packages; dependency records nonempty.
2. Compare the dependency table exactly with T/dependencies.tsv, rejecting
   duplicate names. Each dependency's destination must equal T/library/name;
   its origin must match dependency_origin(); its installed DESCRIPTION version
   and MD5 must equal the receipt. Apply actual path containment.
3. For each package receipt require root T, exit zero, matching full source SHA,
   exact T/library/package destination, matching MD5 for T/sources/package.tar,
   matching MD5 for T/library/package/Meta/package.rds, and DONE (package) in
   its named install log (setup.R:223-232).
4. Then verify actual usable namespaces, not just DESCRIPTION versions: existing
   usable() loads the seven packages, tests qs2 save/read and deterministic stamp
   hashing, resolves every loaded namespace path and checks containment
   (setup.R:38-56). Assert pipfun and stamp originate exactly at T/library/pipfun
   and T/library/stamp, and loaded contributed dependencies at T/library/name.
   Base/recommended namespace paths belong to T/r/library.
5. Record the freshly resolved paths and source-SHA/receipt link in the new task
   evidence. Historical namespace-paths.tsv:5,22 and check.log:1-3,96 show an old
   success only. Version 1.0.1 alone is insufficient.

Do not source setup.R indiscriminately: it has mode-based install/diagnostic
branches and sets its working directory (setup.R:7,31,115-202,274-295).
Existing check mode also writes qs2-usability.qs2 and several historical evidence
files (setup.R:43-45,243-269). Therefore running run.ps1 check is not a read-only
receipt inspection and would overwrite old evidence. Reuse the verification
logic in the execution owner's already-required disposable harness, directing
its probe/log output to the new task root; do not create a second Qmd checker.

### Recorded Package Pins

T/pins.tsv:2-8 and setup.R:9-22 agree:

| Package | Full Source SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 53a76e379c81a3ac70b39925954981ae6a691459 |

Only pipfun package repository metadata was directly read this attempt; its
current full SHA is recorded above. Package source inspection used the retained
T/sources/pipfun archive extraction associated with that pin, not other package
repositories. Archive/installed receipt hashes were not recomputed here.

## Redirects Before Child Startup

Recommended new task root N:
P/.tmp/qmd-working-release/20261116T215847Z-code. This is a proposed path, not a
directory created by this research. Resolve/check it and its existing ancestors
before creating subdirectories; paths.ps1:1-33 provides the existing rejection of
reparse-point/hard-link escapes. All destinations must physically remain in P.

Use run.ps1:40-62 as the concrete environment inventory, with the following split:
keep private runtime/library inputs at T; send new scratch/cache/home/log/store
writes to N. Environment must be set in the parent before Rscript startup, not
after R tempdir or namespace initialization. Also redirect any parent PowerShell
module-analysis cache to N before starting another PowerShell process.

| Inputs | Recommended Values |
|---|---|
| TEMP, TMP, TMPDIR | N/temp |
| HOME, R_USER, USERPROFILE | N/home |
| APPDATA | N/config |
| LOCALAPPDATA, XDG_CACHE_HOME, R_USER_CACHE_DIR | N/cache |
| XDG_CONFIG_HOME, R_USER_CONFIG_DIR | N/config |
| XDG_DATA_HOME, R_USER_DATA_DIR, R_USER_DATA_DIR_BASE | N/home |
| XDG_STATE_HOME | N/logs |
| R_LIBS | T/library |
| R_LIBS_USER, R_LIBS_SITE | literal NULL |
| R_ENVIRON_USER, R_ENVIRON | N/config/disabled-Renviron, N/config/disabled-Renviron-site |
| R_PROFILE_USER, R_PROFILE | N/config/disabled-Rprofile, N/config/disabled-Rprofile-site |
| R_MAKEVARS_USER, R_MAKEVARS_SITE | N/config/disabled-Makevars, N/config/disabled-Makevars-site |
| R_TESTS, R_SESSION_TMPDIR | empty |
| R_HISTFILE | N/logs/history |
| R_DEFAULT_PACKAGES | utils,stats,methods |
| RENV_PATHS_ROOT, R_PKG_CACHE_DIR | N/cache/renv, N/cache/pkg |
| RENV_CONFIG_AUTOLOADER_ENABLED | FALSE |
| GIT_CONFIG_GLOBAL, GIT_CONFIG_NOSYSTEM | N/config/disabled-gitconfig, 1 |
| ONE_SURVEY_ROOT, R_HOME, R_ARCH | T, T/r, /x64 |
| R_SHARE_DIR, R_INCLUDE_DIR, R_DOC_DIR | T/r/share, T/r/include, T/r/doc |
| PIP_ROOT_DIR, DLW_local_dir | N/store, N/store/dlw |
| PSModuleAnalysisCachePath | N/cache/ModuleAnalysisCache |

Before any pipfun load explicitly set options(pipfun.log.auto = FALSE,
pipfun.verbose = FALSE), even though the existing base hook already does so.
Pipfun .onLoad otherwise calls log_init (T/sources/pipfun/R/zzz.R:9,17-32).
Set an E-contained working directory so relative outputs cannot escape.
Use separate fresh R processes for first/existing-store passes; no alias state
is inherited. Restore process-local parent environment after each child.

Public-call inputs: release 20260401, identity TEST, ppp 2021, main_dir
N/store/PIP_ingestion_pipeline_v2, root_dir N/store and out_dir N/store.
These explicit roots agree with the selected main directory's parent. The
legacy output may be created at N/store/pip_ingestion_pipeline/pc_data/
output-tfs-sync/ITSES-POVERTYSCORE-DATA even with create_dir FALSE
(T/sources/pipfun/R/pip_create_globals.R:32-38,165-173).
The share is not a permitted sandbox input. Some returned globals contain
legacy UNC source paths (same file:144-151); do not execute downstream consumers
or mistake these inert strings for sandbox destinations.

No Quarto/full render is needed or permitted by this Plan step. The Quarto,
DENO and output-copy branch in run.ps1:67-96 is not the initialization harness.

## Credentials And Live Metadata

Existing package behavior, not a credential-changing recommendation:

- T/sources/pipfun/R/load_from_gh.R:187-212 calls gitcreds::gitcreds_get(), then
  uses GH_PASS if the result is NULL or missing username/password. Comments
  mention GITHUB_PAT but this function does not directly read GITHUB_PAT.
- get_file_info_from_gh obtains credentials itself and passes creds$password
  to gh::gh for a contents GET (get_from_gh.R:264-279). Supplying creds to the
  outer setup call alone is not a reliable replacement: get_file_from_gh does
  not forward that argument into its metadata helper (same file:13-24).
- Gitcreds' installed documentation describes its in-process cache environment
  GITHUB_PAT_GITHUB_COM (T/library/gitcreds/doc/package.Rmd:103-141). If a real
  existing credential is safely obtained in memory, this cache is an existing
  supported input, not a metadata mock. Never seed a fake token or fake rows.
- Existing local Git helper is manager, from the user's C: .gitconfig. The
  launcher intentionally replaces HOME/USERPROFILE and disables global/system
  Git configuration, so it cannot be assumed to find that helper or credential.
- The five checked credential environment variables are absent here. This does
  not prove the Windows credential store or existing gh authentication is empty.
  Installed gh path is C:/Users/wb384996/tools/gh/gh.exe; historical evidence
  describes per-command !gh auth git-credential use without persistent config
  changes (.cg-docs/orchestration/outputs/pipsystem/git-delivery/
  20261103T162831Z-orchestrator/handoff.md:39,45).
- Recommended input to the later child is a real existing token held only in
  process memory via GH_PASS and/or the documented gitcreds cache. Obtain it
  only through a verified read-only existing credential route; never write a
  credential/config file, print the token, place it in argv, dump environment,
  print credentials/requests/headers or retain auth tracing. Do not run login,
  gitcreds_set, credential approve/reject, setup-git or persistent config changes.
- A child credential helper would also need E-only temp/cache/log settings and
  noninteractive behavior (GIT_TERMINAL_PROMPT=0, GCM_INTERACTIVE=Never), with
  trace/debug variables removed rather than treated as safely disabled by 0.
  If gh is used, its writable cache/state/log roots must first be E-contained;
  its existing authentication source and read-only behavior must be established.
  Do not blindly reenable the whole user Git config or normal startup files.
  Credential acquisition was deliberately NOT attempted in this research, so
  neither gh nor manager is certified here as a zero-write credential route.

Required genuine metadata sequence:

1. PIP-Technical-Team/pip_info, branch releases, releases.csv contents GET,
   parsed in memory (release_management.R:415-431; get_from_gh.R:54-60,264-279).
2. Vintage naming invokes pip_create_vintage via check_and_create even when
   create_dir FALSE (pip_create_globals.R:185-190,460-464). It calls
   load_from_gh(measure='ppp', branch='DEV', filename='ppp_vintage', ext='csv')
   (pip_create_vintage.R:16-22,103-110). Actual URL is
   https://raw.githubusercontent.com/PIP-Technical-Team/aux_ppp/DEV/ppp_vintage.csv;
   a temp file is downloaded/read/deleted, then a contents GET fetches its SHA
   (load_from_gh.R:28-32,44-59,87-93). This requires the E temp redirect.
3. Do not substitute utils.R:47-51 get_ppp_versions()'s DEV_v2 branch for the
   initializer's actual DEV metadata path. Both endpoints' current availability
   remains UNKNOWN. No live request occurred.

## Minimal First

Smallest slice: one disposable initialization harness using existing runtime,
existing receipt logic and the exact Qmd cell; no package repair, dependencies,
framework or alternate checker. One functional execution check per change.
Path containment and secret suppression prevent almost-irreversible shared/C:
writes or credential disclosure; defer unrelated safeguards. Installed tools
only. Existing acceptance reports and runtime remain preserved.

## Gaps
- inventory.rds has not been deserialized or rehashed; no current loaded namespace
  or installed provenance verification is claimed. Historical PASS is not new PASS.
- Actual credential availability, scopes/expiry and a zero-write retrieval route
  under the redirected environment are UNKNOWN. Presence-only checks cannot
  resolve this. Execution owner must verify the existing read-only route before
  live acceptance; if unavailable, record actual FAIL and dependents NOT RUN.
- The report records literal launcher settings; it does not establish a complete
  operating-system write audit for R, Git Credential Manager or GitHub CLI.
- Live metadata and runtime execution are outside this research task.
- Both sandbox initialization passes and Plan implementation/review remain with
  the execution owner; this report completes research only.
