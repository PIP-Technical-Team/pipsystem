---
schema: pip-handoff-v2
project: pipsystem
task: qmd-real-data-setup
run: 20261116T194917Z-col-geih
status: completed
updated: 2026-11-16T20:36:25Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE
next: Approved follow-up implementation is running; see 20261116T202500Z-implementation/handoff.md. Discovery and module selection are complete, not real-survey acceptance.
---

# COL 2010 GEIH real-data setup

## Summary

The user selected COL 2010 GEIH as the first real survey. The fixed context
is release `20260401`, identity `TEST`, main folder
`//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2`. Synthetic fixtures are for
isolated setup/tests, not replacements for real-data development.

Read-only inspection found two matching entries in the stored TEST release
inventory: `COL_2010_GEIH_V04_M_V01_A_GMD_ALL` and
`COL_2010_GEIH_V04_M_V01_A_GMD_GPWG`. Both carry stored `status = valid`,
which is historical inventory state, not current-run validation. The user
subsequently selected GPWG. The starting survey is therefore
`COL_2010_GEIH_V04_M_V01_A_GMD_GPWG`, with PIP ID
`COL_2010_GEIH_INC_GPWG`. This selection does not establish fresh numerical
acceptance or authorize processing.

Follow-up: the user approved the setup-only contract on existing main.
Implementation and scoped review now belong to the separate run report
`../20261116T202500Z-implementation/handoff.md`. Discovery and module
selection are complete; no fresh survey acceptance is claimed here.

## Changes

- This report and one ignored inspection script:
  `.tmp/real-data-setup/20261116T194917Z-col-geih/inspect-inventory.R`.
  No project source, package files or Qmd chunks were changed.
- All mixed-owned pending source files were preserved. No commit or push.
- No downloads, processing, installations, shared-folder writes or Git
  mutations are authorized or performed in this investigation.

## Checks run

- Verified expected pipsystem root and existing `main`, HEAD
  `e9c71e3190f1ce88a017ae25af7c373a64c655a2`.
- Read current Qmd and checker. Qmd remains synthetic-only, with private
  runtime and storage overrides (`experiments/pip-pipeline.qmd:45-109`).
- Shared DLW inventory and TEST PIP inventory directories can be listed.
- Package source identities read:
  - pipfun: `7d534516a8c17c33d537681610eccd4c29211762`, clean.
  - pipdata: `53a76e379c81a3ac70b39925954981ae6a691459`, with unrelated
    vignette, active-state and B6 artifacts pending. None changed here.
- Ran the supporting inventory inspection with installed system R 4.5.2,
  `--vanilla`, and qs2 from the already installed private library at
  `.tmp/one-survey/qmd-acceptance-20261113/library`. Redirected temp, home,
  cache, config and log settings into this task's E: scratch directory,
  disabled user/site profiles and environment files, and left
  `PIP_ROOT_DIR` empty in that child. Checked output ancestry with the
  existing `Assert-OneSurveyTree`. No pipfun/pipdata setup or pipeline
  function was called.
- Read only inventory metadata, not household data, from:
  - `//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2/dlw_repository/dlw_inventory/dlw_gmd_inv.qs2/dlw_gmd_inv.qs2`
    (10,582 catalog rows, 11 matching COL 2010 GEIH file entries).
  - `//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2/pip_repository/pip_inventory/20260401_TEST/pip_release_inventory.qs2/pip_release_inventory.qs2`
    (4,148 inventory rows, 2 matching COL 2010 GEIH entries).
- Both reads succeeded. The release inventory contains these existing pins:

| Module | Survey ID | PIP ID | Clean version | Metadata version |
|---|---|---|---|---|
| ALL | `COL_2010_GEIH_V04_M_V01_A_GMD_ALL` | `COL_2010_GEIH_INC_ALL` | `7469bbcb348e9406` | `f5d2b717c27b41a7` |
| GPWG | `COL_2010_GEIH_V04_M_V01_A_GMD_GPWG` | `COL_2010_GEIH_INC_GPWG` | `7060d4cad2d1686a` | `0371212271f5db53` |

- The inventory labels both entries income (`welfare_type = INC`). These
  are observed saved metadata; payload existence, numerical values and
  fresh validation are NOT RUN. No raw/clean household file was read or
  copied into the project.
- Inspected `pipdata/R/pipdata_dlw_process.R:8-40,663-685`: the wrapper
  takes a scalar inventory artifact ID, not country/year/module filters,
  and calls working-release setup. Do not substitute the entire shared
  catalog into a supposed single-survey acquisition run. Defining a
  bounded acquisition input is a later step, not executed here.
- Read the completed Qmd Plan and the installed light-work/Plan workflows
  to bound the next change. The prior completed Plan is offline-only;
  real-data setup is a follow-up, not a reopened style review. Light-work
  cannot edit an overlapping pre-existing untracked Qmd under its own
  overlap rule (`cg-light-work.md:130-134`). No implementation command
  was invoked and no Plan was saved without its required approval.
- Whitespace check on the named source paths produced no output. They
  remain pre-existing untracked files, so this is not a task-diff or
  implementation verification. The new inspection script itself executed
  successfully, and both inventory reads printed PASS.

## Proposed first Qmd change

Proposed completion contract, not an approved or saved implementation Plan:

Minimal first: smallest end-to-end setup slice; safeguards only for almost-
irreversible harm, otherwise record under Later; one functional check per
change; installed tools and only worthwhile dependencies; keep the eventual
Plan about two pages. Ask only for almost-irreversible actions, protected or
scope changes, Git mutations and non-generated file deletion; otherwise
proceed safely within the approved slice.

- Outcome: a clearly labelled manual real-data setup section at the top of
  `experiments/pip-pipeline.qmd` shows the agreed release, identity, shared
  main directory and exact survey identity. It sets only process-local
  folder configuration and checks directory access. It does not initialize
  release state, aliases or storage; those stages remain NOT RUN.
- Keep the isolated synthetic acceptance path intact and visibly separate.
  Do not allow default synthetic rendering to execute the manual shared
  setup, or direct any fixture writes into the shared store.
- Verification V1: all Qmd R chunks parse. V2: execute the exact new
  read-only setup chunk in an E:-contained R child and verify the selected
  values, folder settings and access. V3: run the existing focused checker,
  compare original synthetic chunks and preserve every numerical,
  exact-version and invalid/no-output assertion. No pipeline or full
  synthetic rerun is required for this context-only slice.
- Allowed implementation files: Qmd and its focused checker, plus normal
  Plan/review/work-report/handoff artifacts. Preserve mixed-owned content.
- Constraints: no downloads, package edits, installations, shared writes,
  pipeline execution, data copying, pin changes, B6 work, roadmap/design
  changes, or Git commits/pushes. All agent writes remain in this E: checkout.
- Iteration: at most two targeted corrections per failed required check;
  stop and report if required evidence still fails or a shared write,
  pipeline run, installation or broader scope is needed. Only reversible
  in-scope Plan adjustments can proceed autonomously after approval.
- Proposed environment: existing main checkout. If the user prefers a new
  branch, proposed name is `feat/qmd-real-data-setup` (not currently present).
  No new worktree is needed. No branch mutation has been authorized.

After approval, save and independently review the bounded Plan before source
edits; fix all Plan-review findings. Approval must explicitly cover
implementation if execution is to proceed without another authorization.

## Gaps

- GPWG and existing main are selected. The setup-only contract was subsequently
  approved; remaining implementation evidence belongs to the follow-up report.
- Real-data setup and processing have not run. Active interactive R state,
  installed package provenance and shared write permission remain UNKNOWN.
- The stored inventories are mutable shared metadata, not an immutable
  acceptance baseline. No freshness claim was made about their contents.
- The approved follow-up Plan covers only manual context/path setup, not a
  complete real-data pipeline or fresh household-data acceptance.
- Safe single-survey acquisition input through the scalar-ID public wrapper
  is not yet designed. It is not a reason to process all 10,582 catalog rows.
- B6 belongs to the other session and is outside this task.
