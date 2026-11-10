---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T205401Z-assessment
status: completed
updated: 2026-11-09T20:55:50Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: NONE
next: User confirms or revises the proposed minimal experiment; pip-orchestrator can then prepare its short implementation Plan.
---

# Practical cross-package test approach

## Summary

The user proposes starting from pipdata documentation, testing existing package versions in isolated folders, and using results to direct package development. The assessment supports that direction, with a scripts-first, one-survey offline baseline before live-service or incremental extensions. This is a recommendation, not an approved design or implementation. No pipeline is run.

## Observed evidence

- pipdata documentation names auxiliary refresh, DLW acquisition/validation, and clean/metadata/deflate execution as the current three entry points (`pipdata/vignettes/articles/PIP-data-pipeline.Rmd:25-43`, package SHA below).
- The overview and both companion articles set chunk execution to false and describe the examples as illustrative (`PIP-data-pipeline.Rmd:5-18`, `Processing-Data.Rmd:5-18`, `Validating-Data.Rmd:5-17`). These pages are useful workflow specifications, not executed integration evidence.
- A synthetic one-survey integration source already exists. It checks real producer/consumer values and saved/read-back clean data (`pipdata/tests/testthat/test-one-survey-upstream-acceptance.R:70-151,153-256`). Its declared boundary substitutes transport and does not certify live DLW (`:1-2`). This session did not execute it or inspect its previous execution Work Report.
- The vignette describes the same acceptance example and explicitly excludes deflation, a mean, incremental/restart behavior, and complete M2 readiness (`PIP-data-pipeline.Rmd:277-316`). Those limits are documentation claims, not independently rerun findings.
- Existing `Pipdata_script.R` uses an ecosystem update and `load_all()` (`:3-9`) and later broad forced processing (`:49-57`). Copying it unchanged would not provide the proposed pinned, installed-package baseline.
- pipdata declares version 1.0.0 and several package remotes by mutable branch/default reference (`pipdata/DESCRIPTION:1-3,43-49`). Package version labels and branch names alone do not identify immutable source revisions.
- The overview distinguishes the existing staged currentness manifest (`PIP-data-pipeline.Rmd:127-131`) from the opt-in TEST recipe route where stamp selects work (`:150-157`). Only the latter is documented as the stamp-only route. Neither route was executed here. The target decision remains stamp-only rebuild authority (`SYSTEM_DESIGN.md:186,290,299-307`). A current staged-workflow baseline is not proof of target-design compliance.

All pipdata paths above are relative to `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` at `13a38280c1eafe7e03a97837cdb57833fbe9d926`, observed branch `PROD`.

## Proposed minimal experiment

1. Use an installation/setup R script and one readable scenario R script, derived from current pipdata documentation. Defer Quarto presentation until the scenario runs. Do not build a scenario framework or a version-combination matrix.
2. Start with one explicitly recorded set of existing package SHAs. Install it and its required dependencies into a dedicated library for that version set. Do not update packages during scenario execution or use `load_all()` as a substitute for installed-package testing. Record R version, dependency versions, exact source revisions where applicable, and actual loaded package paths.
3. Launch a fresh R process with explicit library selection and no ambient user/site package fallback beyond the intended R runtime libraries. Isolate data/artifact roots, stamp aliases/configuration, manifests, logs, temporary files, downloads, and caches under a disposable E-drive root too. Library isolation alone is not full machine, filesystem, or service isolation.
4. Use one tiny synthetic survey and the minimum auxiliary inputs. Reuse suitable existing fixture values, not its entire internal test harness by default. Keep actual cross-package processing and save/load functions real; disclose any substituted external transport or fixture-only producer output.
5. The first functional result is a documented input-to-cleaned-output chain with save/readback and independently stated welfare/weight expectations. Expose failures at the first failing boundary. Deflation and one mean are the next small extension, not a prerequisite for making the baseline useful. A synthetic external-acquisition substitute is not a live DLW test.
6. For each actual failure, retain the exact version set, smallest reproducing call, expected/actual output, and evidence for the owning package. Separate documentation errors, installation/configuration failures, package defects, and missing features before directing development. Rerun the same scenario after a fix, changing only the relevant package set where feasible.
7. Experiment scripts in pipsystem would remain development/evidence tools, not another release orchestrator or rebuild authority. Package fixes remain in their owning repositories. Pipeline execution belongs to a suitable package session, not pip-orchestrator. No runtime location or package change is authorized by this assessment.

Minimal first: build the smallest complete example; add safeguards only for almost-irreversible failures; use one functional check per change; use installed tools and add dependencies only when they save more work than they cost; keep any subsequent Plan to about two pages. E-only writes apply to setup processes and all indirect outputs. Do not change Decided design items, charter/roadmap scope, production/shared state, or make Git commits/pushes without the required approval.

## Later

- Quarto presentation after the R scenario works.
- Live DLW transport and authorized real-data testing.
- No-change and changed-input reruns after the function chain is established.
- Additional package combinations only to answer a reproduced compatibility question.

## Changes

- Created this coordination record. No package files, design decisions, charter, or roadmap changed.
- No commits or pushes requested or made.

## Checks run

- Read project charter, target design, harvest brief, brainstorm command, and handoff contract.
- Read-only Git commands observed clean pipsystem `main` at `f9454707b292a620e25abef17f2e515794020ba7` and clean pipdata `PROD` at `13a38280c1eafe7e03a97837cdb57833fbe9d926`.
- Read pipdata README, DESCRIPTION, existing session script, the three current vignette sources, and the first 260 lines of the named upstream acceptance test. Listed its test and vignette directories.
- Read local workflow configuration, context contract, and Brain index. The local Brain index has no specific isolation/test-scenario topic; no Brain partition or remote team-brain source was used. Listed prior brainstorm names; no same-topic record was selected. No formal brainstorm decision was captured because the proposed minimal experiment is not yet confirmed.
- Final read-only Git check still showed pipdata clean; the only new pipsystem path was this task's output folder.

## Gaps

- No package installation, R execution, integration test, or live-service check has run.
- Exact package SHAs beyond pipdata, the available installed dependency set, suitable runtime configuration seams, and a usable isolated baseline remain UNKNOWN. No other package repository was read.
- Prior execution reports, complete test helpers, the remaining acceptance-test lines, package implementation bodies, active Plans, full roadmap, and generated documentation were not read. Existing test source is not evidence of a passing run.
- The user has not confirmed the specific recommended first experiment, its artifact location, or a change to current charter/roadmap priorities. No implementation Plan exists for this task, and no implementation or formal brainstorm completion is claimed.
