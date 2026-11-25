---
date: 2026-11-24
title: "PIP system roadmap and operating agreement"
status: decided
scope: "Strategic"
artifact-schema-version: 1
chosen-approach: "Agreement first; offline checks on both machines at milestone close"
tags: [roadmap, orchestration, verification, portability]
---

# PIP system roadmap and operating agreement

## Context

Open this agreement first on either machine. Use the [milestone register](../../roadmap.json) for current status and the exact work handoff for results. This agreement says what each milestone must prove; it is not a second status list. The [charter](../../compound-gpid.md#L24-L40) distinguishes branch-local fixture checks from integrated work. A recorded `done` label, a passing branch test, a merged change and a passing test of the integrated release are four different claims.

## Requirements

Andres sets objectives, parameters and scope with the orchestrator. Once work is authorized, the orchestrator drives changes in the registered repositories and retrieves the evidence itself. Andres does not relay package instructions or collect reports. Keep package code, Plans and tests with their owners; keep coordination evidence here. `pipdata` coordinates releases; `stamp` alone decides what reruns. Existing Decided design items remain fixed. See [package responsibilities](../../SYSTEM_DESIGN.md#L284-L319) and [registered checkouts](../../tools/pipsys/packages.csv#L1-L12).

## Approaches Considered

### Approach 1: Read the agreement first (selected)

The roadmap is readable even if R cannot start. Render the verification report to obtain fresh results, not to discover what to do. Maintaining one status register avoids conflicting updates. Checking both machines at executable milestone close, rather than after every change, allows daily work on either machine. The trade-off is that a platform-specific failure may surface later.

### Approach 2: Read the rendered QMD first

One screen could show the outcome and its evidence, but a broken render would hide the development entry point. Requiring both machines after every change would catch platform problems sooner but would slow ordinary package work. Neither alternative was selected.

## Decision

### Milestone outcomes and exit checks

These are acceptance conditions, not claims of completion. The existing [M0–M6 feature list](../../roadmap.json) retains the detail. Do not infer package edits merely because a repository is registered.

| Milestone | Owner and prerequisites | Evidence required to finish |
|------------------------|------------------------|------------------------|
| M0 — Settle the design | `pipsystem`; Andres decides design questions. | Link each agreed design item to its decision; list unresolved items separately. No runtime claim. |
| M1 — Know the code | `pipsystem` coordinates package evidence against the M0 questions. | File, line and SHA per finding; record gaps or contradictions. Resolve or retain explicit blockers against the [harvest questions](../../HARVEST_BRIEF.md#L36-L129). The open row-level invalidation rule blocks general selective rebuilds, not the bounded M2 proof. |
| M2 — Walking skeleton | `pipdata` coordinates `pipaux` inputs, `pipload` access, `stamp` versions and `pipster` calculations. Requires agreed fixture, verified package pins and permitted local storage. | Read the independently expected mean for one synthetic survey from a version-pinned test release. A second run with unchanged inputs executes zero stages. Complete the changed/unused input, code-change, failure-recovery and historical-read cases in the [M2 Plan](../plans/2026-10-10-m2-walking-skeleton.md#L15-L23). Retain both platform results. |
| M3 — Widen to all surveys | After the M2 path works, `pipaux` supplies auxiliary dependencies; `pipdata` handles selection, validation, deflation, scoped runs and ALL-module output; `pipster` supplies estimates. `stamp` and `pipload` support dependency and access checks. Resolve M1 questions before the features that need them. | Compare estimates with the reference at scale. Show affected estimates rerun, unaffected ones do not, and failures and blocked work appear in the run result. Table Maker internals remain outside scope. |
| M4 — Lineups and missing countries | Obtain the legacy `targets` methods and inputs first. `pipster` owns the calculations; `pipdata` coordinates; `stamp` tracks parents. | Match reference lineups and missing-country estimates. Change an input and verify which results change. Do not decide whether to retire `targets` before the harvest. |
| M5 — Release and API | `pipdata` assembles versioned releases after upstream results meet their contracts; `pipapi` ingests and serves them. `pipload` and `stamp` supply pinned reads. | Compare a complete served test release with the reference; retrieve prior and corrected versions. Verify release states and the planned PPP conversion change without silently changing API units. Test release is not publication authority. |
| M6 — Analyst operation | Once engine behavior is verified, `pipdata` exposes analyst functions; `pipsystem` coordinates workflow evidence. | An analyst can preview work without execution, run an authorized scope, and identify failures and blocked work. Decide interface and platform separately. A dashboard is not a prerequisite. |

Shared responsibilities across milestones: use `pipfaker` for reusable synthetic inputs where needed, `metapip` for pinned installations, `pipfun` for shared logging, and `wbpip` as a calculation reference. Do not move logging, retire `wbpip`, or require changes to those packages without evidence. See [design, sections 9–10](../../SYSTEM_DESIGN.md#L258-L313).

### First end-to-end step

**Next owner: `pip-orchestrator`.** Check the exact package revisions and latest M2 evidence before assigning work. Do not repeat a check already proved at the required integrated pins. Distinguish a branch-local result from a result available on both machines. The M2 umbrella Plan is a specification, not execution authority.

**First processing owner: `pipdata`.** Use the accepted synthetic survey and exact CPI/PPP versions. Save and read back the deflated rows through the agreed access route. Compare values, row order and weights with the [independent fixture expectations](2026-11-04-m2-phase3-deflation-gates.md#L42-L68). Then `pipster` computes the weighted mean and `pipdata` assembles the pinned test release. For example, the accepted 2005 factor is 1: values 1, 2, 3, 4 with weights 10, 20, 30, 40 give an expected mean of 3. A correct number alone does not prove a correct release: check the pinned read and count executed stages on the unchanged rerun.

### Operating routine

1.  On either machine, open this agreement. The orchestrator reads the milestone register and the handoff for the exact run; it verifies checkout, branch and full SHA before relying on an earlier result.
2.  Agree on one outcome and its functional check. Use short, reviewed package-local Plans. Start with the smallest end-to-end change, use installed tools, and defer recoverable extras. Split a Plan if it grows beyond about two pages.
3.  Within authorized scope, the orchestrator edits or delegates directly, verifies package diffs and tests, then checks the integrated revisions. Continue independent work when another check is blocked. Ask Andres only for a material choice, change of scope or Decided item, Git publication or commit, deletion of non-generated work, or an almost irreversible action. Present choices as buttons inside the Kilo console. If inline choices are unavailable, say so and leave the decision open. Do not use desktop pop-ups or treat silence as approval.
4.  Record each check and its limits in a sanitized handoff. After verifying the evidence, the orchestrator updates status through the roadmap agent and reads it back. Change the agreement only when the agreed process or scope changes, not to mirror progress. Keep the next owner and missing proof in the handoff.

### QMD verification contract (specification only)

- Each render runs the offline checks afresh, with the same synthetic fixtures and pinned package revisions on macOS and Windows. Reuse the package checks and public entry points; do not reimplement the pipeline in the QMD. The unchanged second run reuses the first run's isolated test store **within** that render.
- Show the platform, revisions, fixture, expected and actual output, and `PASS`, `FAIL` or `NOT RUN` with a reason for each check. Report render success separately. A rendered failure is still a failure. A stale render is historical evidence only.
- During development, check the available machine. At the close of a milestone that changes executable behavior, require fresh matching offline evidence on **both** machines at the same pins. A missing or failed required check leaves the milestone open. Documentation-only milestones do not need artificial runtime tests.
- Use configured paths, not OS names, to locate checkouts and approved runtime storage. On Windows, writes must resolve to the approved E: location. On macOS, send synthetic stores, libraries, temp, caches and raw logs to a separately approved restricted non-synced root. If unavailable, report `NOT RUN`. Keep only sanitized evidence in the hub. Live Dataly/DLW checks are separate, opt-in and require authorized access; an unavailable service does not fail the offline checks or establish a live pass.

## Next Steps

The next separately authorized development activity is the M2 evidence check above. Add the verification report and its cases in step with the milestones, not as a prerequisite for all package development. No package Plan, QMD, test, roadmap status change or pipeline run is authorized by this agreement.

## Gaps

Current integrated package revisions and fresh results on either platform are UNKNOWN here. Only the hub repository was read, at `1821c5526337d03b87a9e61ad934b3c7316c16cf`; no package execution took place. The [Mac migration report](../orchestration/outputs/pipsystem/machine-migration/20261123T225905Z-mac-onedrive/handoff.md#L26-L28) distinguishes document validation from runtime qualification. For remaining technical questions, use the [design's Open list](../../SYSTEM_DESIGN.md#L325-L343). Platform choice, new interfaces and general logging changes stay for later decisions.