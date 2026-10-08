# M1 Harvest Record

Collection date: **2026-10-07**. Scope: exactly the questions and outputs in `HARVEST_BRIEF.md:19-127`, at pipsystem SHA `84c384f78ed44bcb96bb19c6d364519df5b5db6f` (**D**).

Output worktree: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.kilo/worktrees/docs-m1-harvest-8658eaafa47c46e5`.

## Source Record

These are verified absolute source paths. The stamp source is also listed by the available workspace file `E:/PovcalNet/01.personal/wb384996/VScode/workspaces/pipsystem-and-packages.code-workspace:30-31`. That workspace file was used for location only, not package behavior evidence.

| Key | Package | Absolute source path | Recorded commit SHA | Source state from Git commands |
|---|---|---|---|---|
| S | stamp | `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp` | `b6e5e2c5519a7c00dbb8f815a59aeac2daf9592e` | Empty status; cited R, NAMESPACE, and tests match HEAD. |
| A | pipaux | `E:/PovcalNet/01.personal/wb384996/PIP/pipaux` | `27c5a3c8eab8ddcabb032d620af6a1f76e62f444` | Only untracked `compound-gpid.local.md`; cited R, tests, and DESCRIPTION match HEAD. Untracked content not used. |
| Dp | pipdata | `E:/PovcalNet/01.personal/wb384996/PIP/pipdata` | `84442e979c98d33fa5565ab9e56d3179cc7d5278` | Empty status; cited R, tests, YAML specification, and DESCRIPTION match HEAD. |
| L | pipload | `E:/PovcalNet/01.personal/wb384996/PIP/pipload` | `ff9a81e386a09fb2531c154f63fd2b91521313c6` | Only untracked `sessionInfoLog`; cited R and tests match HEAD. Untracked content not used. |
| F | pipfun | `E:/PovcalNet/01.personal/wb384996/PIP/pipfun` | `0c6a78d9884ed0965a524311537eec2a5095d60b` | Empty status; cited source and tests match HEAD. |
| P | pipster | `E:/PovcalNet/01.personal/wb384996/PIP/pipster` | `828064e406e07e711c34d2ba725746e367d35f9b` | Empty status; cited R, tests, data-raw, NAMESPACE, and DESCRIPTION match HEAD. |
| W | wbpip | `E:/PovcalNet/01.personal/wb384996/PIP/wbpip` | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` | Empty status; cited R, tests, and NAMESPACE match HEAD. |
| I | pipapi | `E:/PovcalNet/01.personal/wb384996/PIP/pipapi` | `280af151d05902a550d5dea18cd4bf1a3d013239` | Empty status; cited source and tests match HEAD. |

State entries are direct observations of `git rev-parse HEAD`, `git status`, tracked-path checks, and `git diff HEAD` collected by the package workers. No cited relevant file required a dirty-source fallback. Citations in `notes/FINDINGS.md` use these keys; each package note defines its own full-SHA citation keys. D always identifies the project documents, not pipdata.

Coordinator final verification: path-scoped `git diff --exit-code <recorded SHA> -- <cited source/test areas>` returned no differences for all eight packages. Protected project documents and roadmap also returned no differences. Generated harvest outputs are uncommitted and are not attributed to D. In this record, `strategy` or `approved strategy` means `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md` at D.

## Completed Outputs

Eight Task workers, one per package, completed their evidence collection. The pipster and wbpip workers returned evidence without writing files. The coordinator wrote their combined note and, after all eight workers finished, this record and `notes/FINDINGS.md`.

| Harvest | Output | Coverage | Residual limit |
|---|---|---|---|
| stamp | `notes/stamp.md`, `tables/stamp_fit.csv` | S1-S7; all 15 required fit rows | Partition-parent integration, planner/executor correctness, concurrency, scale, metadata transitions, and release semantics have gaps. |
| pipaux | `notes/pipaux.md` | A1-A4 | Remote graph content/SHA, external PFW choice semantics, and exclusions remain UNKNOWN. |
| pipdata | `notes/pipdata.md` | D1-D4 | Preferred-module decision and post-format validation contract remain incomplete. |
| pipload | `notes/pipload.md` | L1 | Adapter role is a proposal; actual fst/release integration is not executed. |
| pipfun | `notes/pipfun.md` | F1 | Actual caller that skips passed work is UNKNOWN. |
| pipster and wbpip | `notes/pipster_wbpip.md` | P1-P2 | Full stage 5 coverage is not in pipster; full stages 6-7 are deferred to M4. |
| pipapi | `notes/pipapi.md` | I1 | Source-consumed fields are documented; complete production schemas/writer units are UNKNOWN. |
| Findings | `notes/FINDINGS.md` | All 15 Open questions; four recommendations; Decided conflicts/gaps | All design changes require Andres approval. |

Completed means evidence collection is complete, including explicit UNKNOWN answers. It does not mean the target capabilities work or that roadmap feature statuses were changed. The fit CSV statuses summarize source support, not executed test results.

## Evidence Versus Execution

- Source and tests were read at the recorded SHAs. No tests, pipeline runs, API calls, builds, or setup/update commands were executed. There are no passing-test claims.
- The pipdata keyed-invalidation test replaces the numerical workers with synthetic outputs; its assertions do not prove real deflation (Dp: `tests/testthat/test-pd-run-pipeline.R:1547-1628`; `tests/testthat/helper-dependency-fixtures.R:506-616`).
- The stamp manual test assertions conflict with current planner code and use an undefined builder helper; they are not success evidence (S: `R/rebuild.R:495-518`; `tests/manual/test_stamp_smoke.R:264-292`).
- Coordinator cross-package D2 check: exact welfare conversion is `welfare_mean / ppp / cpi` (W: `R/deflate_welfare_mean.R:32-35`; inspected test source `tests/testthat/test-deflate_welfare_mean.R:1-15`). Those files match W; this fact is not attributed to the pipdata SHA.
- S6 was reported before the other workers finished, with the absolute `notes/stamp.md` path, SHA, source/test references, and metadata-update limitations. The final S6 evidence is in S: `R/IO_core.R:193-207,310-348,630-660`; `R/format_registry.R:319-347`; `notes/stamp.md`.

## M2 Prerequisite Readiness

The approved nine-feature gate takes precedence over the brief's whole-milestone dependency (D: `.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:151-170`). The current roadmap still records these features as `idea`; this harvest does not write roadmap statuses (D: `roadmap.json:10-14,27-29,36-37`).

| Approved M2 prerequisite | Readiness from this harvest |
|---|---|
| Decide module out of survey ID | Evidence ready: S6 supports custom fields/current data-free reads. Andres decision pending; metadata-only and historical-read limits remain. |
| Decide engine first interface later | Andres decision pending; no approval inferred from roadmap approval. |
| Decide pipster calculations only | Andres decision pending; P1 gives the current calculation/I/O boundary. |
| Decide stage 5 output shape | Andres decision pending; P2 and I1 show reference list outputs and current wide API tables. |
| Decide orchestrator location | Evidence-backed recommendation ready; Andres decision pending. |
| Decide code version rule | S2 evidence and recommendation ready; Andres decision pending. |
| Harvest stamp | Evidence collection complete, with S1-S7 and CSV gaps stated. |
| Harvest pipaux | Evidence collection complete, with A1-A4 gaps stated. |
| Harvest pipdata | Evidence collection complete, with D1-D4 gaps stated. |

**M2 is not authorized to start by this harvest.** Three harvest prerequisites have evidence; six design decisions remain pending. Required stamp gaps must still be closed in its own repository before M2 finishes (D: approved strategy `:170`). Row-level detection and pipload-role decisions are required M1 recommendations but are not additional members of the approved nine-feature start gate (D: strategy `:72-75,158-170`).

No design update was integrated. The M0 and M1 design-update features remain pending; evidence and a recommendation do not complete them (D: strategy `:58,76,174`; `SYSTEM_DESIGN.md:16-18`). SYSTEM_DESIGN.md, roadmap.json, the charter, configuration, and .gitignore were not edited. The pre-existing .gitignore change was left unchanged. No package/main-checkout write, branch creation, stash, commit, or push was made.

## Gaps

- UNKNOWN: all executed test results, production numerical equivalence, target-scale performance, and Y-drive parallel-write safety. Source and test assertions are not runtime verification.
- M2 capability gaps include transitive planning, unchanged-output parent refresh, failed/missing artifact handling, explicit code-currentness integration, and safe pinned persistence (S: `R/rebuild.R:253-342,434-518`; `R/version_store.R:1176-1217`; `R/IO_core.R:253-279,1014-1044`).
- No dedicated mean estimator was found in harvested pipster; the M2 mean feature remains build work, not a completed calculation (P: `NAMESPACE:3-12`; `R/pipgd_params.R:93-98`).
- Full lineup and missing-country inputs and targets replacement remain UNKNOWN and are assigned to M4. No current-pipeline targets repository was substituted or harvested in M1 (D: `HARVEST_BRIEF.md:129-131`; approved strategy `:116-126`).
- Remote auxiliary manifest contents/SHA and complete production release schemas are not established by this harvest (A: `R/utils.R:490-500`; I: `R/create_lkups.R:79-123,406-477`).
- Andres approval and integrated design edits remain outstanding. The protected design and roadmap remain unchanged.
