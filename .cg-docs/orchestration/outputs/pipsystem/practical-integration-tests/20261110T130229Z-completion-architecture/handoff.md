---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T130229Z-completion-architecture
status: completed
updated: 2026-11-10T13:07:04Z
owner: completion-architecture
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md (approved follow-up; resumed authorization recorded at WorkReport lines 3-4)
next: Coordinator integrates this completed role report into full review and required final light verification; no architecture correction requested.
---

# Completion architecture review

## Summary
FULL architecture review completed: no actionable P0-P3 architecture findings in the four requested harness files and their current completion evidence. P0: 0; P1: 0; P2: 0; P3: 0. The five previously open findings have supported closure in this role's inspected scope. This does not complete the coordinator's full ten-role/final-verification gate or the original survey Plan.

Reviewed existing main at HEAD f9454707b292a620e25abef17f2e515794020ba7 using read-only Git identification. No test, setup, diagnostic or helper was executed by this reviewer. Execution outcomes below are retained evidence, not reviewer reruns. Latest resumed WorkReport, rather than its historical blocked sections, governs the reviewed checkpoint (`.cg-docs/work-reports/2026-11-09-one-survey-harness-repair-and-diagnosis.md:3-29`).

## Changes
Only this handoff, created at review start and finalized here. No implementation, package, Plan, WorkReport, shared-state or Git mutations. No protected artifact deletion/replacement/rename/move proposed.

## Checks run
### Review inputs and method
- Loaded `pl-clear-technical-communication` and `cg-skill-r-technical` before substantive review. Read project charter, SYSTEM_DESIGN and HARVEST_BRIEF; reviewed coordination handoff contract.
- Read all of `experiments/one-survey/paths.ps1` (33 lines), `run.ps1` (103), `checks.ps1` (122) and `setup.R` (238). Each remains below the review protocol's 300-line split threshold. Evaluated entry points, dependency direction, local state, responsibility boundaries and configuration in context, not package-layout conventions applied to an experiment.
- Read approved follow-up Plan, TOP resumed WorkReport and previous five-open full review at `.cg-docs/reviews/2026-11-09-one-survey-harness-repair-and-diagnosis-review.md:21-35`.
- Read current completion red baseline, green check, actual install-child startup, missing-dependency and successful-install logs, forced-child failure log, boundary transcript, pins and 53 dependency rows.
- Ran only read-only `git rev-parse HEAD`, `git branch --show-current`, and system clock/time-zone queries. No R, PowerShell harness, Pester, fixture, install or pipeline execution.

### Actual separation and minimality
1. `paths.ps1:1-33` owns one filesystem boundary: output lexical containment plus existing ancestor/recursive reparse and hard-link rejection. Both launcher (`run.ps1:12-13`) and checker (`checks.ps1:8-9,39-42`) consume it before their writes. This is useful shared policy, not a new framework.
2. `run.ps1:20-34,35-64,65-97` owns process/bootstrap concerns: approved copy inputs, isolated destinations/environment, private base/recommended runtime and child invocation. `run.ps1:98-103` restores caller environment and preference. It neither runs PIP survey stages nor chooses rebuild work.
3. `checks.ps1:11-29,30-35,36-104,105-122` owns behavioral regression assertions and fixture orchestration. Negative fixtures use sibling IDs and a sibling fixture tree, not the accepted runtime (`:37-44,66-100`). Fixtures may retain links precisely because positive execution never scans those siblings.
4. `setup.R:9-24,60-71,72-149` owns fixed source provenance, local dependency copying and actual installation. `:31-45,150-216` owns reusable installed-runtime verification; diagnose mode reuses that verification before the exported package call (`:217-238`). Functions and mode blocks are sufficiently cohesive for this bounded experiment; extracting more modules or introducing a configuration framework would not remove a demonstrated problem.
5. Installation bootstrapping changes only the private copied base profile (`run.ps1:74-91`). Recorded actual resolver/lazy-load processes, rather than the launcher's parent state alone, show private library lookup. `setup.R:24,133-145` installs only stamp/pipfun for this follow-up while retaining all seven original pins; it does not grow into ecosystem installation or release orchestration.
6. The hardcoded checkout/R version and ambient-copy origin (`run.ps1:9,20`; `setup.R:4,102`) are deliberate local-experiment coupling. No supported portability requirement or current break justifies externalizing them. Configuration responsibilities are coherent: launcher establishes OS/runtime paths; R declares package pins/required set. No circular module dependency, new package dependency, rebuild authority, global framework or production path was introduced.

### Prior five-open closure mapping
IDs here are the previous follow-up review's IDs, not newly assigned findings.

| Prior ID | Architecture conclusion | Current source and retained evidence |
|---|---|---|
| P1.1 helper-owned unchecked writes/RunId | Closed in inspected helper/launcher entry points | `checks.ps1:1-9,39-45,53-65` validates IDs and guards each fixture root before creation/transcript. `paths.ps1:1-33` is shared with launcher. `20261110T125325Z-completion-green-fixtures/checks.log:22-49` identifies traversal, helper-root redirect, nested redirects, hard-linked log, populated reuse and ancestor redirect; no-write assertions are in `checks.ps1:65,74-75,83-84,92-93,100`. |
| P1.4 nonexported stamp acceptance | Closed; no private package API required | `setup.R:31-45` calls `pipfun::log_names()` and deterministic/different-input `stamp::st_hash_obj()`. Current green `logs/check.log:1-36` reaches exact namespace paths and PASS, unlike the old nonexported stop. |
| P1.5 fixture link poisons runtime | Closed by actual separation, not weaker guards | `checks.ps1:37-44,86-100` puts target/link fixtures under sibling roots/negative IDs. Boundary transcript `:49` records completion with positive runtime unlinked; current green check and forced-child logs subsequently contain actual R results. `run.ps1:13` still scans the accepted tree. |
| P2.3 unrelated exception accepted | Closed for exercised controls | `checks.ps1:11-22` matches expected boundary reason; `:31-34` checks actual missing pipfun; `:112-116` demands successful current check, absent old forced log and actual intentional child marker. Current red `logs/baseline.log:1,8-9` is missing pipfun; green `logs/forced-failure.log:1-8` is intentional R failure; child startup `:9-10` records both R entries. |
| P2.4 copied dependency provenance not reconciled | Closed for required current-copy identity | `setup.R:150-189` reconciles table equality, unique membership, expected paths/origins, copied DESCRIPTION versions/digests, receipts and loaded namespace paths. `:194-208` rejects five incomplete/stale mutations. `dependencies.tsv:2-54` contains 53 records; `logs/check.log:1-36` records verification and exact paths. This is bounded identity reconciliation, not whole-binary attestation. |

All runtime paths in the table are relative to `.tmp/one-survey/`; green logs/table are under `20261110T125325Z-completion-green/` and red log under `20261110T125325Z-completion-red/`.

### Inherited boundaries and diagnostic separation
- Fresh setup/baseline attempts reject any existing attempt before destination creation (`run.ps1:13-18`); extraction/copy use fresh destinations (`setup.R:72-84,124-125`). No overlay reuse or cleanup is needed.
- Actual install-child restricted lookup is visible in green `logs/child-startup.log:2-8`, including contained 00LOCK staging. `logs/install-missing-declared-cli.log:1-4` records true declared dependency rejection before copies. `logs/install-stamp.log:13` and `logs/install-pipfun.log:15` show DONE, while green `logs/check.log:1-36` separately supplies usability/namespace evidence. Install completion is not used alone as acceptance.
- Caller restoration has code assertions for every environment key and preference (`checks.ps1:12-28`), plus previously-set HOME/unset R_TESTS around the successful and intentionally failing child pair (`:105-121`). Resumed WorkReport `:12` records that pair passed; retained child logs independently corroborate child entry and intended failure. No standalone green-helper transcript was read, so the all-key assertion outcome is attributed to WorkReport rather than claimed independently re-executed.
- `setup.R:217-238` keeps diagnosis behind current inventory verification, uses a fresh absent root with `create_dir=FALSE`, and persists the first condition instead of installing pipaux or manufacturing a cache. Green `logs/diagnose.log:36-40` confirms ENOENT, root/cache absent and downstream NOT RUN. This is correct diagnosis/evidence ownership, not a failed survey acceptance or original pipeline success.

### Provenance
No external package repository or archived package source file was read by this reviewer. Source-owner causality is taken from the Plan/WorkReport, not presented as independently inspected package-source proof. Retained pin records inspected at green `pins.tsv:2-8` agree with harness `setup.R:16-22`:

| Package | Retained source SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 0c6a78d9884ed0965a524311537eec2a5095d60b |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

Only stamp/pipfun are installed project packages in this follow-up; the other rows are source pins, not runtime installation claims.

## Findings
No actionable P0-P3 architecture issues identified. No implementation correction or structural refactor recommended. Keep the bounded helper/launcher/R separation and actual behavioral evidence; no speculative safeguards, framework, dependency additions or unrelated cleanup.

## Gaps
- Static architecture review plus retained evidence only: no independent rerun, binary RDS decoding, exhaustive compiled dependency audit, race/sandbox proof or OS-wide filesystem-write audit. E-local library/environment evidence does not certify arbitrary native code cannot write elsewhere.
- Current-copy metadata/loaded-path verification is not whole installed-payload/source-tree byte attestation, and no such framework is recommended for this task.
- Install logs retain missing private documentation CSS warnings (`install-stamp.log:8-9`, `install-pipfun.log:10-11`) and pipfun byte-compile notes (`:6-7`). Both installs reach DONE and exported runtime checks pass; documentation rendering and arbitrary package functionality are not certified.
- Coordinator's full-role integration and final light verification remain pending at this role's handoff. Historical Plan `failing-steps: [1]` and blocked review fields are not edited by this reviewer; the resumed TOP WorkReport is explicit about current V1-V4 evidence and V5 pending (`:21-29`).
- Original survey scenario, live DLW, deflation/mean, storage/incremental/history and original Plan completion remain excluded and unexecuted. Architecture role completion does not authorize resumption or package remedies.
