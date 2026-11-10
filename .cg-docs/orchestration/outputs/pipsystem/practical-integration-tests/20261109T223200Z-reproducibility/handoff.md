---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-reproducibility
status: completed
updated: 2026-11-09T22:34:29Z
owner: reproducibility-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Parent integrates findings within approved correction budget; installation and scenario remain blocked.
---

# Full execution reproducibility review

## Summary
Read-only FULL execution reproducibility review completed with three P2 findings. This is review completion, NOT Plan completion. No R, setup, or package tests were run. No package or Git mutations were made.

Retained logs establish five installation commands exiting zero, followed by pipaux installation exit one (`.tmp/one-survey/logs/setup.log:1-7`). The lazy-load failure is a missing E-root clean-survey cache (`logs/install-pipaux.log:6-11`); it is not invalid-survey rejection. V1 remains partial/failed, V2-V4 unexecuted. No scenario was run, no runtime namespace/dependency provenance was certified, and no numerical or exact-version readback result exists in the inspected evidence.

## Findings

### R1 — Child library isolation
**[P2]** `experiments/one-survey/setup.R:104-107` -- Installation children regain the mixed R installation library. **Tag: safe_auto** (harness correction only; not authorization to execute or exceed correction budget).

**Issue**: Lines 20-23 restrict `.Library` only in the parent process. The separate `R.exe CMD INSTALL` starts a new interpreter; `C:/Program Files/R/R-4.5.2/library/base/R/Rprofile:134-153` reconstructs `.Library` from R.home and initializes library paths. `run.ps1:29` disables user/site libraries, not this built-in library. The installation is explicitly known to contain contributed packages (`setup.R:7-11`; implementation handoff:78). Consequently installation-time namespace resolution can use packages outside the dedicated library and recorded closure. Parent checks at lines 114-132 cannot certify an already-exited child's dependency resolution. No actual fallback load is proven by the logs.

**Fix**: Apply the base/recommended-only library restriction inside each installation R process before dependency namespace loading, using the existing R toolchain and a small E-local child bootstrap rather than changing the shared R installation. Record that child's effective library and loaded dependency paths as the functional evidence. Preserve the first pipaux failure and do not rerun it in this review.

### R2 — Exact snapshot extraction is not repeatable in reused directories
**[P2]** `experiments/one-survey/setup.R:58-66` -- Archive extraction overlays a reusable source tree. **Tag: safe_auto**.

**Issue**: `dir.create()` is skipped when the destination exists and `untar()` does not remove files absent from the archive. A prior or edited extra R file can therefore survive and enter installation while `packages$sha` still records the pinned commit. The same reuse issue applies to recursive dependency copies at line 89 and skip-existing base package copies at lines 15-18. The current archives' commit IDs match the declared pins; this finding does not assert that the current extracted trees are contaminated.

**Fix**: Use fresh, empty generated source/library destinations for each setup attempt, or refuse nonempty destinations and report that a fresh attempt is required. Keep recorded destinations aligned with the attempt; never merge old extracted sources or package contents into a newly claimed snapshot. No deletion of retained evidence or protected project records is needed for this correction.

### R3 — Base-library writes precede output-path validation
**[P2]** `experiments/one-survey/setup.R:12-17` -- An existing redirected base-library destination can receive writes before validation. **Tag: safe_auto**.

**Issue**: The launcher checks runtime children in `run.ps1:17-21` but omits `base-library`. Setup then creates/copies into that path before `safe_path` is defined at line 28. The later call at line 34 does not include base-library and cannot undo a write. An existing junction at `.tmp/one-survey/base-library` can therefore redirect these copies outside the allowed E-checkout. This is a source-level reachable condition, not evidence that a C: write occurred in the retained attempt.

**Fix**: Include base-library in the launcher's prewrite resolved-destination/reparse checks and validate the actual package-copy destinations before copying into an existing tree. Keep the check narrowly tied to the mandatory E-only write rule; do not add an unrelated audit framework.

## Preserved package boundary
The archived pipaux source evaluates `pipfun::pip_create_globals()` at top level (`.tmp/one-survey/sources/pipaux/R/zzz.R:1`). Its archived pipfun implementation calls `fs::dir_ls(clean_data)` for `vintage=NULL` (`sources/pipfun/R/pip_create_globals.R:228-238`), despite default `create_dir=FALSE` (line 38). This supports the implementation worker's owner direction but does not prove that a reduced reproducer has been executed or that a package repair is authorized. Do not manufacture a cache to turn this boundary into a pass.

## Changes
Only this report, created at review start and finalized here. No implementation changes, dependency additions, package edits, Git mutations, or protected-record changes.

## Checks run
Read approved Plan revision 1, worker handoff, setup.R, run.ps1, targeted setup and pipaux installation logs, selected archived startup/path sources, and installed R's base startup profile. Loaded R technical and analytical skills before R review.

Read-only Git identity check: root branch `main`, HEAD `f9454707b292a620e25abef17f2e515794020ba7`. System clock read returned `2026-11-09T17:33:37.3290937-05:00` (ET).

Read embedded commit IDs with `git get-tar-commit-id` for each retained archive; all seven matched setup.R:42-48. This verifies archive commit metadata, not installed runtime contents or all extracted-file equality. Package snapshots recorded below; archived source files were read only for pipfun, pipload, pipaux and pipdata. No live package working-tree source was read or modified.

| Package | Retained archive commit SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

Startup assessment: run.ps1:23-43 sets process-local temp/home/cache/log and package-root environment before the outer Rscript invocation; line 46 uses `--vanilla`. This is appropriate startup ordering for the outer process, subject to R3. Options in setup.R:24-27 are parent-local, not inherited R options. E-only environment redirections do inherit, but are not proof that all package hooks obey them. No observed external write is claimed.

Dependency provenance assessment: setup.R:74-100 records a Depends/Imports/LinkingTo closure from the named ambient installed E library, versions, source/destination and DESCRIPTION MD5, without network installation. This is an explicit copied-dependency approach permitted by the approved Plan, so the absence of a new renv lock is not itself a finding. The inventory is saved before package installation succeeds. It must not be treated as successful installation or observed runtime namespace provenance.

No R/setup/package tests, scenario, new reproduction, or final runtime verification were executed, as requested. Binary inventory.rds was not decoded through R. Cross-review material findings were reported to the parent on the board.

## Gaps
- pipaux installation is blocked; pipdata installation, fresh-process setup checks, scenario, malformed-input classification, row-aligned numerical assertions and data/metadata exact-version readback have not run.
- No complete child namespace-path inventory exists in the inspected logs. Source archive commit IDs and zero installation exits are not runtime dependency proof.
- inventory.rds exists and its writer was reviewed, but its binary contents were not decoded; exact copied dependency count and full version table remain unverified by this review.
- Current extracted-tree equality to archives, all third-party hook behavior, and an OS-level write trace were not verified. No existing redirect or actual outside-E write was demonstrated.
- Three source-level findings remain proposals, not fixes. Step 1's two reported corrections are already exhausted (implementation handoff:77-80); parent must respect the approved iteration/blocked-stop policy when integrating the findings.
- No seed finding is raised for installation-only code: stochastic scenario behavior is unassessed because the scenario does not exist in this attempt. Deflation, mean, live DLW and historical selection after a second save remain outside this review's certified outcomes.
