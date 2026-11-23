---
schema: pip-handoff-v2
project: pipsystem
task: qmd-folder-setup
run: 20261116T160641Z-path-check
status: completed
updated: 2026-11-16T19:27:05Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE
next: Review real-data setup in the Qmd; the user selects the first real survey to anchor the subsequent walkthrough. No shared writes or execution started.
---

# Qmd folder setup inspection

## Summary

The user fixed the development context to release `20260401`, identity
`TEST`, and asked to verify the pipfun folders. This is a read-only folder
diagnosis, not a pipeline run. Continue the agreed Qmd-led collaboration.

Observed: the R startup configuration specifies `//w1wbgencifs01/pip/`.
The inspected pipfun source derives main directory
`//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2`. All 14 checked directories
exist and are reachable by metadata lookup. Listing the main folder also
succeeded. This is not confirmation of the active interactive R options or
write permission. The Qmd still overrides both roots for synthetic fixtures.

The user subsequently confirmed this exact main directory. Release
`20260401`, identity `TEST`, and the shared main directory are settled
development inputs. This confirmation did not authorize a pipeline run or
shared-store writes.

The user then clarified the development direction: use real data for
`20260401` / `TEST`; retain synthetic data only for isolated basic setup
checks, analogous to mocked unit tests. Synthetic success is not real-data
acceptance. The Qmd's real-data path must not substitute fixture transport
or fixture auxiliary tables. No Qmd implementation or execution was done
in recording this decision. Proposed first end-to-end scope: one real
survey chosen by the user, after reviewing setup.

## Changes

- This report only. Existing mixed-owned changes are preserved.
- No package edits, configuration changes, Git mutations or pipeline runs.

## Checks run

- Observed expected pipsystem checkout and existing `main`; HEAD
  `e9c71e3190f1ce88a017ae25af7c373a64c655a2`.
- Observed pipfun on `PROD`, clean, HEAD
  `7d534516a8c17c33d537681610eccd4c29211762`.
- `experiments/pip-pipeline.qmd:11-13` already names the requested context.
- `experiments/pip-pipeline.qmd:97-103` overrides `pipfun.main_dir` and
  `PIP_ROOT_DIR` with a per-render fixture store.
- `C:/Users/wb384996/Documents/.Renviron:39` specifies
  `PIP_ROOT_DIR=//w1wbgencifs01/pip/`. Only relevant startup path settings
  were searched; unrelated environment values were not copied.
- `pipfun/R/zzz.R:2-14` derives the default main directory by appending
  `PIP_ingestion_pipeline_v2` to `PIP_ROOT_DIR`.
- `pipfun/R/working_release.R:204-278` defines the repository layout below.
  These functions were inspected, not called: they create directories and
  can initialize stamp.
- The coordinator shell has no process/user/machine `PIP_ROOT_DIR` setting.
  The normal R startup file and the isolated Qmd launcher are distinct
  configuration sources; `experiments/one-survey/run.ps1:40-61` disables
  normal startup files and sets its own private store.
- PowerShell `Test-Path -PathType Container` returned `True`, without an
  access error, for every path in this table. `M` means
  `//w1wbgencifs01/pip/PIP_ingestion_pipeline_v2`.

| Name | Checked path | Result |
|---|---|---|
| PIP root | `//w1wbgencifs01/pip` | Exists |
| pipfun main | `M` | Exists; directory listing succeeded |
| Stamp metadata | `M/.stamp` | Exists |
| Auxiliary data | `M/aux_repository/aux_data/20260401_TEST` | Exists |
| Auxiliary metadata | `M/aux_repository/aux_metadata/20260401_TEST` | Exists |
| DLW data | `M/dlw_repository/dlw_data` | Exists |
| DLW inventory | `M/dlw_repository/dlw_inventory` | Exists |
| DLW metadata | `M/dlw_repository/dlw_metadata/20260401_TEST` | Exists |
| PIP surveys | `M/pip_repository/pip_data/surveys` | Exists |
| PIP metadata | `M/pip_repository/pip_data/surveys_metadata/20260401_TEST` | Exists |
| PIP inventory | `M/pip_repository/pip_inventory/20260401_TEST` | Exists |
| Master inventory | `M/pip_repository/pip_data/master_inventory` | Exists |
| Legacy welfare input | `//w1wbgencifs01/pip/PIP-Data_QA` | Exists |
| Legacy DLW input | `//w1wbgencifs01/pip/DLW-RAW` | Exists |

- The first PowerShell attempt had a parser error because a `foreach`
  statement was piped directly. It performed no checks or writes; the
  corrected array expression produced the results above.
- `git diff --check` found no whitespace errors in tracked pending changes;
  Git printed existing LF/CRLF notices. No tracked source was changed here.
- The final pipfun Git check remained clean at the same full SHA.
- No R process, installation, data read, folder creation on the share,
  write-permission probe, or pipeline execution was performed. The only new
  artifact is this report under the E: checkout.

## Gaps

- The user confirmed the main directory, but existing directory names do not
  establish release contents or readiness for processing.
- The first real survey is not selected. The suggestion to start with one
  survey rather than the entire release is proposed, not executed.
- The user's interactive R session is not accessible through these shell
  tools. Its actual `getOption("pipfun.main_dir")`, loaded package and
  in-memory release state are UNKNOWN. No ambient package was loaded.
- Existence and top-level list access passed; data validity and write access
  remain NOT RUN. The shared UNC location is not an authorized write target
  for this task. Keep all agent writes in this E: checkout.
- Do not simply remove the Qmd overrides and run it: that would direct its
  synthetic fixture writes into the shared release. A read-only path display
  and an explicit separation of shared inputs from development outputs must
  be discussed before changing the executable setup.
- B6 investigation belongs to the other session and was not inspected here.
