---
schema: pip-handoff-v2
project: pipsystem
task: stamp-path-binding-fix
run: 20261119T151908Z-tool-qualification
status: completed
updated: 2026-11-19T15:28:24Z
owner: code-corrected-stamp-qualification
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE
next: User may execute the separately scoped shared dry-run with the corrected, qualified launcher; Code reviews its saved results after a run is reported.
---

# Corrected Stamp Tool Qualification

## Summary

User approved local qualification on 2026-11-19. The source-only fix is in the
existing `feat/catalog-latest-reconcile` worktree at base
`db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`. It remains uncommitted. Exact
package-input identity is the previously tested 144-file manifest
`green-c1-source.sha256`, freshly hashed as
`5c9fd6893d259bdf8613641fb2762ffeca40df27534d675220547d73d1ed5546`.
See sibling `20261119T131936Z-source-fix/handoff.md:92-127` for the source,
diff identity and prior reviews.

The corrected development archive and fresh installed bytes passed the full
unfiltered installed suite and the guarded launcher local preflight. The
launcher now verifies and selects these exact bytes, not the first build.
Shared eligibility with the corrected build remains NOT RUN.

## Changes

- `qualify.ps1` and `test-installed.R` stage only the manifest files, build the
  development archive, install only into a fresh `.tmp/sq1/l`, and run the
  installed tests with existing dependencies. No Git, Stamp worktree, existing
  library or shared modifications.
- New `qualified-stamp.R` pins the archive and four installed files and verifies
  those hashes before loading Stamp. The original loader and old build remain.
- Repointed the guarded `run.ps1` at this loader and `.tmp/sq1/l`. Its shared
  mode is still user-only and its default is local. `worker.R` reuses the
  local smoke/checker and binds the updated Qmd cell to its exact new hash.
- The manual Qmd section names the historical failure and corrected candidate.
  Only the expected install path changed within the cell. The six version
  pairs, `eval: false`, `dry_run = TRUE`, and checking/reporting logic are
  unchanged. No changes to `check-qmd.R` or other Qmd cells.

## Checks run

- Read-only Git verified both HEADs above. Existing mixed changes are excluded.
  Initial manifest digest matches the source-fix handoff.
- Staged all 144 manifest files with matching byte hashes. `build.log:1-6` and
  `install.log:9-21` preserve the build and install; both native exits were 0.
  `tool.sha256` records the archive and four installed file hashes.
- Full unfiltered installed suite: 4,465 assertions in 40 contexts, 0 failures,
  errors, warnings or skips; native exit 0 (`suite.log:1280-1281`). The six
  prior `PATH_MAX` fixture errors did not occur at the short checkout path.
  `suite-origins.tsv:38` records the corrected install. `suite-dlls.tsv:23-27`
  records TBB, TBB malloc, RcppParallel, stringfish and qs2 origins.
- Rehashed the previous archive and four installed files; all five still match
  the unchanged first `qualified-stamp.R`. Rehashed the reviewed worktree
  manifest (`ad6d45e97903f75b19b14b4b9f0e7b830d60909f1d58d0e603494cdf60f2bfe8`)
  and task-only diff (`2753c61877621f318f43a04b32de8da104a6851aae5bdb5e495f947b6ddfe87d`);
  both match the source-fix handoff.
- Guarded local preflight, under the sibling `20261118T224533Z-guarded-launcher`
  evidence bundle:
  - `local-022d2d858cae.log:68-69`: old cell digest intentionally retained for
    a negative run; source mismatch refused evaluation, exit 1.
  - `local-450ff70584e9.log:1-8,30,54-84` and process receipt: exit 0; wrong
    fingerprint rejected before load, namespace origin and already-loaded
    refusal asserted, Qmd source/fixture checks and all five prerequisite
    refusals pass; synthetic dry-runs preserve the store tree and bytes.
    All four reviewed-cell mutation controls refuse evaluation. The run
    never attempts the shared lookup. Origin versions and paths are in the
    matching `*-origins.tsv`.
- PowerShell syntax checks passed for both launchers. Tracked checkout
  `git diff --check` passed with LF/CRLF notices; no Git mutations.

## Exact Tool Identity

`tool.sha256:1-5` records the complete local paths. The package version label
is still `0.1.1`, but this is a different development archive and installation.

| Input | SHA256 |
|---|---|
| `stamp_0.1.1.tar.gz` | `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586` |
| Installed `R/stamp.rdb` | `672fa1aa454ba935d2676afec9de789a75a6e36353d53b18529680c6b536c54a` |
| Installed `R/stamp.rdx` | `dce62ad5f7da48b733bf914114a48d6d67496555158046f532dfd856fac624ba` |
| Installed `Meta/package.rds` | `4946c2c5e3c02fac507605c76c35e56ef2f99906d4efbcd2844d4982b8ece041` |
| Installed `NAMESPACE` | `9b23ac6344a113ba7b39d1feee2442454483c23607672750ce123c22c4767ed2` |
| Current manual eligibility cell | `8c0148df9450191c74920dda56f2877137b4b989623234b571e8a812b10a9fda` |

## User-Only Retry Setup

This is a separate dry-run, not an apply. Keep the original R and Kilo sessions
open and leave `.tmp/sq1` in place. The command launches a fresh isolated R child.

- **Project Name:** pipsystem auxiliary eligibility.
- **Suggested Session Name:** Corrected Auxiliary Eligibility Dry Run.
- **Branch:** current `main`; existing.
- **Worktree Requirement:** No; existing checkout `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`.
- **Model Family Recommendation:** Standard, for bounded result interpretation.
- **Effort:** medium.
- **Target Project:** pipsystem, `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`.
- **Target Environment:** existing `main` checkout; Windows PowerShell with an isolated R child. No new session or worktree.
- **Target Agent:** Code mode for reviewing results; shared execution is user-only.

```powershell
& "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/20261118T224533Z-guarded-launcher/run.ps1" -RunSharedDryRun
```

The launcher prints the paths to the new log, process receipt and technical
rows if reached. It verifies the corrected archive and install plus the exact
cell source before any shared lookup, requires existing prerequisites, and
registers only `aux`. Exit 0 requires six technical PASS rows and unchanged
sampled catalog hashes; it does not grant apply or survey authority. An observed
hash change stops the run without rollback. No raw production data or credentials
are required to review the outcome.

## Gaps

- Prior user-run `shared-53c808a30b14` failed at the old tool's binding check.
  Corrected-tool shared eligibility, catalog apply, release/producer execution,
  and survey processing remain NOT RUN. Later live main/snapshot/provenance
  integrity may still fail. Sampled hashes are not writer locks.
- Development qualification only: no `R CMD check`, examples, or vignette
  rebuild. The earlier unbuilt-vignette warnings remain historical and are
  not cleared. The submitted CRAN archive was not re-certified. Editor
  diagnostics and full Qmd render were not run.
