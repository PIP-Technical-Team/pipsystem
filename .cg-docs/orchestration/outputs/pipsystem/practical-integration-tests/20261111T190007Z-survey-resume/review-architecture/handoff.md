---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-architecture
status: completed
updated: 2026-11-11T19:09:43Z
owner: cg-architecture
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1 Phase 2
next: Coordinator combines static review with ongoing fresh execution and required final verification; runtime acceptance remains pending.
---

# One-survey architecture review

## Summary
No additional supported P0-P3 architecture issues found beyond the already-triaged P2 evidence-mode and P3 stale header findings. Static route is appropriately bounded for original Plan Phase 2; this does not assert execution acceptance.

### Architecture evidence (advisory, no requested source changes)
- Public route: `scenario.R:87-125` configures a TEST release, supplies fixtures through real storage, initializes the catalog and calls `pipdata::pipdata_dlw_process()`. `scenario.R:143-158` calls `pipdata::pd_process_data(inv = inv, bootstrap = TRUE)` and reads the returned master inventory's separate data/metadata version IDs through public `pipload::pip_read()` calls. No fabricated master or internal-worker bypass appears in the route.
- Smallest documented path: pipdata `vignettes/articles/PIP-data-pipeline.Rmd:39-47` explicitly retains independently callable `pd_process_data()` with a master-inventory return and no deflation. Using the larger `pd_run_pipeline()` would needlessly extend this clean/metadata-only example. The target orchestration decision remains unchanged.
- First-run initialization remains package-owned: pipdata `R/pd_process_data.R:117,190,194-226` loads the master, returns it, and handles explicitly requested bootstrap only after checking absence of trustworthy historical state. The example does not synthesize an empty master to evade that boundary.
- Validation handoff remains real: `scenario.R:128-138` requires completed success, valid/invalid classifications and a missing-weight error; `scenario.R:173-178` requires no malformed-identity data/metadata artifacts. Pinned pipdata `R/pd_process_data.R:282-286` independently checks clean eligibility and formatted output. These are inspected assertions/source, not observed passes.
- Substitution boundary: `scenario.R:35-40,56-85` names release/PPP-vintage/catalog/download transport replacements, restores namespace bindings on exit and uses real `pipload::pip_write()` for downloaded fixture persistence. `scenario.R:90-119` supplies normalized auxiliary fixtures directly; these are not real CPI/PPP/PFW producer runs. Real validation, cleaning, auxiliary attachment and output storage are not replaced. No test acceptance harness is invoked.
- Exact storage/access boundary: `scenario.R:150-161` takes distinct saved data and metadata pins, rather than substituting latest or a sidecar. pipload `R/pip_read-write.R:119-134` checks history and delegates the provided version directly to `stamp::st_load()`. The `pip_meta` object read here is a separate artifact, not proof of custom historical sidecar coverage.
- Separation remains sufficient: launcher/environment in `run.ps1:9-100`; path checks in `paths.ps1:1-33`; package pin/install/verification in `setup.R:9-55,93-232`; scenario in `scenario.R:14-190`. No general installer framework or new orchestrator is warranted. Source scripts are all below 300 lines at inspection.

### Recorded package provenance
Only the following two package repositories were read, using immutable Git object contents rather than current working-tree files:
- pipdata: `c5b27fa4458d7175aca81a203762bae81e9f0b40`.
- pipload: `4ef0d90a974cb6ff0725da69373bde421dd04ad5`.

Other five declared pins retained in `setup.R:16-21` (repositories not read): stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; pipfun `7d534516a8c17c33d537681610eccd4c29211762`; wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`; pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`.

## Changes
Only this requested report. No source, package, Git, installation or runtime changes.

## Checks run
- Loaded technical communication and R technical/analytical skills.
- Read project charter, system design, harvest brief, handoff contract and original Plan.
- Read-only Git identity: main at e9c71e3190f1ce88a017ae25af7c373a64c655a2.
- Read coordination board: existing P2 evidence-mode and P3 header findings already assigned to execution worker; no independent edits.
- Read all six experiments/one-survey scripts; none exceeds 300 lines (setup.R:285, scenario.R:191 at inspection).
- Read-only `git show`/`git grep` inspected the pinned pipdata overview, processor and acquisition/processing documentation references, and pinned pipload `R/pip_read-write.R` with numbered evidence above.
- Initial lookup `R/pip_read.R` failed because that path does not exist; corrected using pinned `git grep` to `R/pip_read-write.R`. No missing adapter evidence was assumed.
- `git diff -- experiments/one-survey/setup.R experiments/one-survey/scenario.R`: only the two authorized pin substitutions appeared at inspection. Existing evidence/header issues were still present and already assigned to the execution worker.
- No R, PowerShell launcher, scenario, installation, download, package tests or Git mutation executed by this reviewer. No runtime artifacts read or numerical pass inferred.

## Gaps
- Fresh runtime execution is ongoing. Numerical equality, malformed rejection without output, successful first-run bootstrap, loaded package paths and actual exact-pin readbacks remain UNKNOWN to this review.
- Already-triaged P2 `setup.R:63-74` failure-only evidence output and P3 `scenario.R:1` old-pin header were not independently edited or closed; coordinator must verify the execution worker's corrections.
- The staged package planner is not certification of the target stamp-only rebuild authority (`SYSTEM_DESIGN.md:186-192,307,380`). This review approves no new currentness authority and makes no incremental/restart/production claim.
- Direct auxiliary fixtures intentionally do not certify upstream auxiliary producers. `reproduce.R:44-55` is a historical expected-master-failure reproducer, not current-pin acceptance; it was not executed or used as fresh evidence.
- Single saved-version readback cannot establish historical selection after a subsequent save (Plan:64). Live DLW, production, deflation, mean, broader workflow reviews and final `/cg-review mode:verify` are not covered.
- Only this report was written, at start/checkpoint/final, within the E checkout. No source edits, extra dependencies, safeguards, downloads or protected-path restructuring recommended. Concurrent later changes are outside this snapshot.
