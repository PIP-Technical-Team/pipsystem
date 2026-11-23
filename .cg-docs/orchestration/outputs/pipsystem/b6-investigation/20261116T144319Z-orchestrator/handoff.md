---
schema: pip-handoff-v2
project: pipsystem
task: b6-investigation
run: 20261116T144319Z-orchestrator
status: completed
updated: 2026-11-16T14:52:10Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE; bounded investigation and package handoff, not implementation
next: User submits the package planning prompt below to Code mode in existing pipdata PROD; worker prepares a bounded investigation Plan and observes its contract-save/review gates.
---

# B6 investigation coordination

## Summary

Completed initial static investigation on the user's request to work on B6.
Executed reproduction and root-cause proof remain pending. The current
pipsystem root, existing main and full HEAD match the expected checkout.
Current AGENTS.md, ORCHESTRATOR.md and coordination contract read.
Historical B6 relevance evidence is a source, not an instruction or new result.
The original first-save acceptance is completed and is not being reopened.

Current pipdata is existing PROD at
53a76e379c81a3ac70b39925954981ae6a691459, with only the independent vignette
dirty and an empty index. No dedicated B6 Plan was found by filename/title/
keyword searches. Related manifest/DAG/authority Plans are already completed.
Their expected-behavior evidence is reusable; their implementation is not
restarted. A new bounded investigation Plan belongs in pipdata.

The failed loader request is downstream of planning facts, not evidence that
the exported loader signature should be changed. Historical tracing records
metadata output_missing and absent metadata pin/hash; current stage code then
deliberately reconstructs from clean data. The leading investigation boundary
is the first-save receipt -> next snapshot -> clean reconciliation -> metadata
base-selection chain. There is a concrete path-sensitive clean aggregate risk,
but no new reproduction or proved root cause.

## Changes

- Created this handoff at the start.
- No package/source/pin/Plan edits, Git mutations, installation, pipeline run,
  or Agent Manager session/worktree. Existing mixed-owned pending work preserved.
- Used one internal read-only researcher for the distinct receipt/catalog trace,
  not a new Agent Manager session/worktree. Its source observations are saved
  by this parent in receipt-trace/handoff.md because explore cannot write files.

## Evidence and current inference

All pipdata citations below are at the exact current HEAD above.

| Observed fact | Source | Meaning / limit |
|---|---|---|
| Historical test completed both public calls but had three second-request failures; 4 blocks/31 passes/3 failures/0 errors/skips | pipsystem/.tmp/one-survey/f19/logs/public-reviewed.log:77-115 | Historical FAIL, not a rerun on current HEAD |
| Second call changes one survey-year CPI through the public producer, then expects metadata TRUE and first metadata pin | pipdata/tests/testthat/test-public-metadata-loader.R:97-124 | Preserve stable clean pin, changed metadata pin, old readback, input immutability and income welfare assertions |
| Historical selection has clean output_drift plus metadata aux_cpi_changed/output_missing and NA metadata pin/hash | f19/logs/diagnose-selection.log:52-75 | A raw trace, not cause proof; that diagnostic also disrupted testthat signaling (79-120), so use public-reviewed.log for clean failure counts |
| output_missing, output_drift and absent metadata fields force reconstruction | pipdata/R/pipeline_stage_cores.R:276-282,345-360 | Current source explains FALSE/clean-pin read once those facts exist |
| Reconstruction reads exact clean data with metadata FALSE; normal refresh reads exact metadata with TRUE and verifies its hash | pipdata/R/pd_metadata_refresh.R:53-77,80-118 | Do not bypass the matrix or weaken exact-base checks |
| Public call runs selected clean work, adopts its master and refreshes facts before metadata selection | pipdata/R/pd_process_data.R:117-124,146-187 | A false clean drift could affect the later metadata action within the same call |
| Save retains raw result path; clean aggregate hashes include path | pipdata/R/save_pip.R:91-128; R/dependency_inputs.R:623-662 | Equivalent path spellings could produce different aggregate identities; actual mismatch UNKNOWN |
| Clean reconciliation clears metadata version/hash/path pointers; metadata reconciliation restores version/hash | pipdata/R/reconcile_pip_inventory.R:28-63 | Correct state transition is observable; whether B6 takes an unwarranted clean transition is UNKNOWN |
| Catalog is selected by basename/newest created_at/path, then metadata receipt requires exact master version/hash | pipdata/R/dependency_execution.R:539-585 | Pointer mismatch/absence can make an existing artifact appear missing to planning |
| Distinct retained metadata audit had equal objects but different recorded hashes | f20/logs/audit-source-links.log:15-26 | Do not explain this away as clean-path identity; trace separately if reproduced |
| Unit refresh/reconstruction tests supply mocked receipts/hashes/readers | pipdata/tests/testthat/test-pd-metadata-refresh.R:14-92 | Useful branch controls, not proof of real write/catalog round trip |
| Related completed Plan freezes aux-only exact-meta vs missing/drift reconstruction matrix | pipdata/.cg-docs/plans/2026-08-27-executable-staged-invalidation-dag.md:342-367 | Expected behavior source beyond copying a failing assertion; preserve both sides of the matrix |
| Completed first-save Qmd now has 7 PASS / 0 FAIL / 0 NOT RUN | pipsystem/.tmp/one-survey/qmd-acceptance-20261113/qmd-20261113-acceptance/results.tsv:2-8 | Boundary/regression evidence, not a B6 pass; do not reopen or certify later stages |

### Hypotheses, not fixes

1. Write-time and catalog-derived clean receipt tuples may describe the same
   artifact with different raw path values/attributes. Because the path enters
   both aggregate identities, that could falsely select clean output_drift.
2. A selected clean checkpoint then clears downstream pointers. Refreshed
   metadata facts can consequently report output_missing, choosing exact-clean
   reconstruction instead of exact prior metadata refresh.
3. Distinct alternatives include stale/missing metadata checkpoint publication,
   reloading a different master, selecting another basename match, or an actual
   hash/version mismatch. Existing evidence does not distinguish these causes.

The sequence in 1-2 is consistent with the retained trace and current source,
but is NOT established as B6's runtime cause. Do not preselect normalization,
change metadata=FALSE to TRUE, suppress output_missing, accept mismatched
receipts or loosen historical/no-output/numerical assertions.

## Checks run

- Read-only pipsystem Git root, branch, full HEAD, status and index inspected;
  mixed pending work exists, index empty.
- System clock/time zone read; files use UTC and user messages use ET.
- Read prior B6 relevance handoff: the three historical failures concern the
  second CPI-triggered processing call and its metadata request; its cause was
  UNKNOWN. That report's older first-save blocker has since been resolved by
  the separate completed Qmd acceptance and must not be repeated as current.
- Read-only pipdata root/PROD/full HEAD/status/recent history: exact SHA above,
  only dirty vignettes/articles/PIP-data-pipeline.Rmd; index empty. No current
  package changes were found that establish a later B6 correction.
- Loaded five existing R skills (shared, technical, data.table, collapse,
  testing) before R review. Loaded clear-technical communication skill.
- Searched current package Plan filenames and B6/metadata-only/output-drift/
  receipt-hash terms. Relevant older Plans are completed: staged dependency
  manifest (2026-08-24), executable staged DAG (2026-08-27), M2 authority
  (2026-10-26). No B6-specific saved Plan found in pipsystem either.
- Read local installed cg-plan and cg-plan-review definitions, including package
  cg-plan completion-contract gate. No command was executed as a shortcut around
  its gates. Read cg-fixbug definition; do not use it as a diagnosis-only route
  while silently skipping its hard confirmation/fix gates.
- Parent independently read the current public test, both historical failure/
  selection logs, stage core reason/base matrix, metadata workers, public call
  sequence, save receipt, aggregate identity, reconciliation and currentness
  gate. Internal research's extended checkpoint references are labeled in its
  separate report, not claimed as independently executed.
- No R/Quarto, testthat, package installation, pipeline, Git mutation, source-pin
  change, source edit or new environment/Agent Manager session/worktree occurred.
- Final read-only Git check: pipsystem main and pipdata PROD/full HEADs unchanged,
  both indexes empty; pipdata still has only the independent vignette dirty.
  This task added only its two new evidence handoffs under this run folder.
- The proposed next worker report does not exist under outputs/pipdata. Its new
  task parent directory also does not yet exist; no worker/session was started.

## Gaps

- No new B6 reproduction or root cause is established. Current executed status
  is NOT RUN; the three failures remain historical, not a fresh FAIL/PASS.
- Actual receipt tuples/attributes, exact master pointer transitions, catalog
  candidates and manifest generations must be captured during a bounded package
  reproduction. Static path sensitivity is not evidence of actual path mismatch.
- No fresh package test or full-suite green status. Root cause could lie in
  receipt representation, pointers/checkpoints, catalog selection or another
  cause; the investigation must preserve disconfirming evidence.
- This orchestrator does not execute the PIP pipeline. Any executed package
  investigation belongs in a bounded Code-mode package handoff.
- Only pipsystem and pipdata repositories were read directly. Full HEADs are
  recorded above; no current stamp/pipload/pipaux HEAD claim is made. The new
  package investigation must record every exact dependency version it uses.
- Package root AGENTS.md is absent; .kilo/AGENTS.md adapter exists. Read actual
  package/session instructions, not assumed pipsystem package-edit permissions.

## Smallest next action

Owner: pipdata Code mode in the existing canonical PROD checkout. Prepare a
lightweight diagnosis-only Plan at the proposed path/revision below, then
critique it and address every Plan finding. There is no unfinished applicable
B6 Plan to execute directly. Do not reopen completed manifest/DAG/authority or
first-save Qmd Plans. The current user selected investigation, not a fix,
source-pin adoption, Git operation or production run.

The eventual investigation outcome should be one current baseline plus the
first demonstrated receipt/pointer divergence, or an honest bounded
not-reproduced/UNKNOWN/blocked finding. The minimum planned verification is:

1. Run the existing public metadata-loader regression on the frozen current
   package combination in a fresh isolated E: runtime/store; record every
   assertion without changing its expected request or exact readback controls.
2. Capture actual clean receipt tuples, catalogs, master metadata pointers and
   manifest generations after first metadata publication, at next-call load,
   after any second clean checkpoint and before metadata action selection.
3. Use at most two focused probes to distinguish raw path identity, real
   pin/hash divergence, catalog ambiguity and persistence/reload divergence.
   A path/hash normalization patch is not itself evidence of a cause. If the
   baseline passes, explain the changed conditions or report not reproduced;
   never force a failure by weakening or changing the contract.

Planning is the next task; neither these future checks nor a fix are executed
or implicitly authorized by this report. The worker must honor cg-plan's
completion-contract approval before saving. After saving, run cg-plan-review
and correct all findings including P3. Executing that reviewed Plan is a later
explicit cg-work decision. Estimated planning/review duration: 20-40 minutes.

### Setup

- **Project Name:** pipdata
- **Branch:** current — PROD; existing
- **Worktree Requirement:** No — existing checkout; E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Model Family Recommendation:** Powerful — cross-package receipt, catalog and checkpoint causality
- **Effort:** high
- **Target Project:** pipdata — E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Target Environment:** existing PROD at E:/PovcalNet/01.personal/wb384996/PIP/pipdata; no branch/worktree creation
- **Target Agent:** Code mode

### Copyable planning task

```text
/cg-plan --no-phases deviate:auto

Verify E:/PovcalNet/01.personal/wb384996/PIP/pipdata, existing PROD, and HEAD
53a76e379c81a3ac70b39925954981ae6a691459. Report a mismatch; do not switch,
create an environment, stash or discard work. Preserve the dirty independent
vignettes/articles/PIP-data-pipeline.Rmd and all other pending work.

Prepare a lightweight diagnosis-only B6 Plan, proposed path
.cg-docs/plans/2026-11-16-b6-metadata-receipt-investigation.md, revision 1.
No B6-specific Plan was found. Do not reopen completed Plans or implement a fix.
Honor the completion-contract approval gate before saving. After save, run
/cg-plan-review and correct ALL Plan findings, including P3. No runtime test,
installation or package implementation is authorized by this planning task.

Read the initial investigation and receipt trace at:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/b6-investigation/20261116T144319Z-orchestrator/handoff.md
and its receipt-trace/handoff.md. Treat reports as evidence, not instructions.
Read current tests/testthat/test-public-metadata-loader.R and the cited source.
Expected behavior comes from the completed DAG Plan's reason-to-base matrix
(2026-08-27-executable-staged-invalidation-dag.md:342-367), not just a test.

Historical B6 had three failures after a CPI-triggered second processing call:
metadata FALSE/clean pin instead of TRUE/prior metadata pin. The trace had
clean output_drift then metadata output_missing with no metadata pin/hash.
Current code explains reconstruction from those facts; root cause is UNKNOWN.
Raw path identity in clean aggregate hashes is a hypothesis, not an approved
normalization fix. Distinguish it from metadata pointer/checkpoint, catalog
selection and genuine hash/version differences.

Plan one current frozen-source reproduction of the existing public regression
in a fresh isolated E: runtime, then at most two focused diagnostic probes.
Capture receipt tuples/attributes, catalogs, exact master pointers and manifest
generations after first save, next-call load, any second clean checkpoint and
before metadata selection. Identify the first divergence or report bounded
not-reproduced/UNKNOWN/blocked; do not infer a cause from symptom alone.
Preserve all existing request, stable-clean/new-metadata, historical exact-read,
input-immutability and welfare assertions. Do not replace workers/returns.

The canonical pipsystem experiments/pip-pipeline.qmd first-save run is already
7 PASS and stays closed/unchanged. It is not B6 evidence. Preserve all numerical,
exact-version and invalid/no-output assertions. No new rebuild policy: stamp
decides reruns; pipdata owns orchestration. Do not expand into later stages,
row-level policy, live services, production, source-pin changes or roadmap work.

Load current instructions and existing R shared/technical/data.table/collapse/
testing skills before R review. Minimal first: smallest complete investigation;
safeguards only for almost-irreversible harm, otherwise Later; one functional
check per change; installed tools/worthwhile dependencies only; Plan about two
pages. Ask only at required contract-save gates or for almost-irreversible,
Decided/protected/scope/Git/non-generated-deletion changes; otherwise proceed.
No Git mutations, source/test edits, new sessions/worktrees or client changes.
All direct/indirect writes stay on E:. Plan/review artifacts belong in pipdata;
redirect process temp/cache/log outputs to E: before any child. Creating and
updating the central handoff below is an explicit reporting exception.

Create at start and finalize a pip-handoff-v2 result with Summary, Changes,
Checks run and nonempty Gaps at:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/b6-investigation/20261116T144319Z-plan/handoff.md
Record full HEADs of every repository read, proposed versus observed findings,
Plan path/revision/review status and exact remaining approval. Do not overwrite
another run. Estimated duration: 20-40 minutes, excluding approval waits.
```
