---
date: 2026-10-07
title: "PIP Backend Pipeline Roadmap"
trigger: "new-project"
outcome: "roadmap-updated"
---

# Strategy Session: PIP Backend Pipeline Roadmap

## Context at Session Start

The roadmap had no milestones or features. The charter objective is an incremental build system for the PIP Technical Team across more than 2,000 survey databases (`compound-gpid.md:10-12`). Current Focus was Phase 1 discovery, with auxiliary consumption granularity as the first question (`compound-gpid.md:35-37` before this update; preserved in `.cg-docs/archive/charter-history.md`).

Configuration: R, data.table and collapse, project type `tool`, standard review depth (`compound-gpid.local.md:2-5`). The strategy brief treats this as a technical infrastructure and pipeline project (`STRATEGY_BRIEF.md:15-19`). Package repositories are read only from pipsystem (`compound-gpid.context.md:15-26`). No package repository was read in this session, so no package commit SHA was collected.

Recent brainstorms and plans were not scanned because the trigger was starting fresh. The design distinguishes Decided items from Open proposals; roadmap approval does not change that distinction (`SYSTEM_DESIGN.md:9-18`).

## Discussion Summary

The user described a new backend pipeline that turns more than 2,000 harmonized household surveys and more than 20 auxiliary series into files served by the PIP API. The users are the PIP Technical Team and the consuming API. The user selected the existing system design scope (`STRATEGY_BRIEF.md:21-37`).

M0 and M1 start in parallel. Discovery has no prerequisite. M0 covers eight proposal decisions and one feature to update the design after approval. M1 covers code evidence and the decisions that need that evidence. The module identity decision requires S6, custom metadata support in stamp. Its dependent M0 decisions also wait for that decision (`STRATEGY_BRIEF.md:86-124`; user clarification in this session).

The first useful result is M2: one country, CPI, PPP, PFW, one survey, the mean, and one test release through stamp. Run twice: the second run does no work. Change one CPI value: only artifacts that use it rerun (`STRATEGY_BRIEF.md:48-52`).

Technical constraints include a domain-agnostic stamp, platform-independent planner logic, Y drive storage, fst, and the current API format until the planned PPP conversion change. pipster calculation-only responsibilities and engine-first work remain decisions to make, not approved design changes (`SYSTEM_DESIGN.md:194,268-272,283,297-301`; `STRATEGY_BRIEF.md:54-60`).

The delivery target is end of January 2027, with at most two extra weeks, so the release around mid March 2027 can use the new pipeline. Several agents can work in parallel. These dates are targets, not verified effort estimates (`STRATEGY_BRIEF.md:64-80`).

## Proposed Changes

Add all section 9 milestones and feature titles as written. All features start at `idea`; no feature has a linked plan. Meanings, dependencies, and dates are stored here rather than as unsupported roadmap fields (`STRATEGY_BRIEF.md:13,82-84`). No existing work was retired or moved.

| Milestone | Objective | Features | Target |
|---|---|---:|---|
| M0 Settle the design | Decide every proposal in SYSTEM_DESIGN.md so build work starts from a stable design. | 9 | Mid October 2026 |
| M1 Know the code | Answer the Open questions that only code can answer, with file and line evidence. | 13 | End October 2026 |
| M2 Walking skeleton | Prove incremental rebuild end to end on one survey, one estimate, and one test release through stamp. | 9 | Mid November 2026 |
| M3 Widen to all surveys | Run stages 1 to 5 and stage 9 for every survey and auxiliary series. | 17 | Mid December 2026 |
| M4 Lineups and missing countries | Port stages 6 and 7 from the current pipeline and track their dependencies. | 7 | Mid January 2027 |
| M5 Release and API | Produce a full release the API can serve, and prove it matches the current pipeline. | 7 | End January 2027 |
| M6 Interface and platform | Give analysts a way to run the system: plain R functions in January, the rest after March. | 4 | Analyst documentation in January 2027; other work after March 2027 |

Sources for the tables below: `STRATEGY_BRIEF.md:86-211`. A dash means the brief lists no feature-level prerequisite; it does not remove the approved M2 start gate. User corrections recorded under Decision take precedence over the brief.

### M0 Settle the design

| Feature | What it means | Depends on |
|---|---|---|
| Decide module out of survey ID | Decide section 4 proposal, conditional on stamp custom metadata support. | Harvest stamp: S6 |
| Decide decisions become data | Store the module rule and survey choices as tables if approved. | Decide module out of survey ID |
| Decide stage 5 output shape | Decide the proposed long table of estimates. | Decide module out of survey ID |
| Decide engine first interface later | Decide the plain R engine proposal, run(release, scope, mode). | - |
| Decide pipster calculations only | Decide separation of calculations from scheduling and saving. | Decide engine first interface later |
| Decide plan only mode | Decide whether to show work without running it. | Decide engine first interface later |
| Decide transient and permanent failures | Decide section 7 failure proposal. | - |
| Decide corrections keep history | Decide section 8 correction history proposal. | - |
| Update SYSTEM_DESIGN with M0 decisions | Mark approved proposals Decided only with Andres approval. | All eight M0 decisions |

### M1 Know the code

| Feature | What it means | Depends on |
|---|---|---|
| Harvest stamp | S1 to S7 and tables/stamp_fit.csv. | - |
| Harvest pipaux | A1 to A4. | - |
| Harvest pipdata | D1 to D4. | - |
| Harvest pipload | L1. | - |
| Harvest pipfun | F1. | - |
| Harvest pipster and wbpip | P1 and P2. | - |
| Harvest pipapi | I1. | - |
| Write harvest findings | notes/FINDINGS.md and HARVEST.md. | All seven harvests |
| Decide row level change detection | Partitions in stamp or a comparison step in pipsystem; Open questions 1 and 2. | Harvest stamp S1, Harvest pipaux A1, Harvest pipdata D2 |
| Decide code version rule | Open question 4. | Harvest stamp |
| Decide orchestrator location | New package or part of pipdata; Open question 10. | Harvest pipdata |
| Decide pipload role | Open question 12. | Harvest pipload |
| Update SYSTEM_DESIGN with M1 findings | Apply findings only after Andres approves each change. | Write harvest findings |

### M2 Walking skeleton

The nine-feature start gate in Decision applies to this milestone. It replaces the proposal to wait for all of M0 and M1.

| Feature | What it means | Depends on |
|---|---|---|
| Close stamp gaps for skeleton | Make required stamp changes in its own repository. | Harvest stamp |
| Create engine skeleton | Orchestrator with run(release, scope, mode), incremental and force modes. | Decide orchestrator location |
| Save CPI PPP and PFW through stamp | Stage 1 for three files; check commits and content hashes. | Create engine skeleton |
| Download one survey | Stage 2 with DLW version check. | Create engine skeleton |
| Format and validate one survey | Stage 3. | Download one survey |
| Deflate one survey | Stage 4; detect welfare_YYYY columns without hardcoded PPP years. | Format and validate one survey; Save CPI PPP and PFW through stamp |
| Compute the mean | Stage 5 through pipster. | Deflate one survey |
| Register test release | Test-purpose release ID linked to the stamp versions used. | Compute the mean |
| Test incremental reruns | No-change run does nothing; one CPI change reruns only dependents. | All preceding M2 features |

### M3 Widen to all surveys

| Feature | What it means | Depends on |
|---|---|---|
| All aux series through stamp | Stage 1 for all series with visible dependencies between series. | M2 |
| Legacy aux repos as inputs | Detect changes in outputs from repositories with their own processing code. | All aux series through stamp |
| Row level change detection | Rebuild only affected surveys after a PFW or CPI row changes. | Decide row level change detection |
| Module selection table | Generated module and data type per survey. | Decide decisions become data |
| Survey list from PFW | Inclusion, exclusion, one survey per country, year ID, and welfare type. | All aux series through stamp |
| DLW change detection for all surveys | New and corrected surveys become new versions. | M2 |
| Revision manifest | Mark incorrect downloads and stop those surveys from proceeding. | DLW change detection for all surveys |
| Format validate and deflate all surveys | Stages 3 and 4 for every survey. | Module selection table; Survey list from PFW |
| All stage 5 estimates | Mean, median, deciles, Gini, and others in the approved shape. | Decide stage 5 output shape |
| Per estimate dependencies | Population changes rerun only estimates that use population. | All stage 5 estimates |
| Failure handling | Record failures and continue; apply the approved failure policy. | M2 |
| End of run report | Report every success and failure. | Failure handling |
| Scoped mode | Limit runs to one country, auxiliary data, or CPI. | M2 |
| Plan only mode | Implement only if approved in M0. | Decide plan only mode |
| ALL module for Table Maker | Stage 9. | Format validate and deflate all surveys |
| Scale test | Full survey set with parallel workers. | Format validate and deflate all surveys |
| Compare survey estimates with current pipeline | Stage 5 results match or every difference is explained. | All stage 5 estimates |

### M4 Lineups and missing countries

| Feature | What it means | Depends on |
|---|---|---|
| Harvest targets project | Add the source to the workspace; answer Open questions 7 and 8. | - |
| Decide targets replacement | Open question 11. | Harvest targets project |
| Port lineups | Port stage 6 into pipster; do not redesign it. | Harvest targets project |
| Track lineup dependencies | Track the rule over surveys; a new survey can change inputs. | Port lineups |
| Port missing countries | Port stage 7 into pipster. | Port lineups |
| Track missing country dependencies | Track the widest cascade in the system. | Port missing countries |
| Compare lineups with current pipeline | Compare stages 6 and 7. | Port lineups; Port missing countries |

Stages 1 to 5 precede lineup execution, and stage 7 needs lineups (`STRATEGY_BRIEF.md:43-44`). Stage 9 requires stages 2 and 3 and can run alongside other M3 and M4 work (`STRATEGY_BRIEF.md:46`).

### M5 Release and API

| Feature | What it means | Depends on |
|---|---|---|
| Write release folder | Stage 8 in the current API format. | M3; M4 |
| Build a round | One release per PPP year with shared survey versions. | Write release folder |
| Release states | Building, published, frozen; correction history only if approved. | Write release folder |
| Ingest into pipapi | Stage 10. | Write release folder |
| Full test release | Complete end-to-end test release. | Write release folder; Build a round; Release states; Ingest into pipapi |
| Compare full release with current pipeline | Final check before March. | Full test release |
| Move PPP conversion out of pipapi | Planned API change; can follow March without blocking the release. | Full test release |

### M6 Interface and platform

| Feature | What it means | Depends on |
|---|---|---|
| Document run functions for analysts | Document incremental, force, scoped, and plan-only modes as available and approved. | Create engine skeleton |
| Decide interface | Shiny app or dashboard; after March. | - |
| Decide platform | Databricks or other options; after March. | - |
| Move logging to general package | Open section 7 item; after March, subject to design approval. | - |

## Decision

The user approved all seven milestones and 66 features, with these corrections:

1. M2 does not wait for all of M0 and M1. It starts when the nine features below are done.
2. Row level change detection depends on S1 (partitions as parents), A1 (auxiliary consumption granularity), and D2 (deflation inputs), not only S1 and A1.

### M2 Start Gate

- Decide module out of survey ID
- Decide engine first interface later
- Decide pipster calculations only
- Decide stage 5 output shape
- Decide orchestrator location
- Decide code version rule
- Harvest stamp
- Harvest pipaux
- Harvest pipdata

This user-approved gate replaces the whole-milestone M0/M1 prerequisite in the initial proposal and `STRATEGY_BRIEF.md:41`. M0 and M1 can continue their remaining work while M2 starts. stamp gaps required by the skeleton must still be closed before M2 finishes (`STRATEGY_BRIEF.md:42`).

The roadmap was updated through one cg-roadmap dispatch, then read once to verify the change. It contains 7 planned milestones and 66 idea features with null plan links (`roadmap.json:1-127`). Counts: M0 9, M1 13, M2 9, M3 17, M4 7, M5 7, M6 4. No GitHub Issues configuration is present. No code, tests, existing plans, or SYSTEM_DESIGN.md were changed. No commit was made.

Approval covers the roadmap structure, not the Open design proposals. The feature to move logging is not approval to change that Open design item. All design updates need the approval required by SYSTEM_DESIGN.md.

### Risks and Gaps

- stamp partition-parent support, metadata support, scale, and parallel-write safety remain UNKNOWN until M1 provides code and test evidence (`HARVEST_BRIEF.md:38-52`).
- Row level invalidation must use S1, A1, and D2 evidence. No mechanism was selected in this session.
- The targets project is not yet a workspace source according to `HARVEST_BRIEF.md:129-131`; its inputs remain UNKNOWN until M4 harvest.
- M4 ports existing methods; it does not redesign them. M3 is dense, and comparison work starts there rather than waiting until M5 (`STRATEGY_BRIEF.md:73-80`).
- The January schedule has not been checked against effort or staffing. The two-week fallback is a limit, not an approved scope change.
- Later Open decisions, including interface, platform, and logging, remain unresolved. This session grants no permission to modify other package repositories.

### Next Action

Start M0 and M1 in parallel. Use `/cg-brainstorm` to clarify the first feature, or `/cg-plan` if its requirements are already clear. This strategy session did not start implementation agents.

## Charter Updates

The user explicitly approved this exact Current Focus:

> M0 and M1 in parallel. M0: Andres decides the proposals in SYSTEM_DESIGN.md. M1: one agent per package answers HARVEST_BRIEF.md. Next: M2 walking skeleton, starting when its nine prerequisite features are done.

The replaced text was archived to `.cg-docs/archive/charter-history.md` before editing. Current Focus and `last-reviewed` were updated together; `last-reviewed` is now `2026-10-07`. No other charter field or section was changed.
