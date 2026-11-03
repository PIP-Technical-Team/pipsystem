---
schema: pip-handoff-v2
project: pipsystem
task: development-path-reassessment
run: 20261103T143258Z-orchestrator
status: completed
updated: 2026-11-03T14:40:08Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: NONE
next: User selects the proposed data-path-first direction; pip-orchestrator then prepares the one-survey acceptance Plan and concise command revision without executing package work.
---

# Development path reassessment

## Summary
User asks for a proper assessment of acquisition, cleaning and auxiliary integration before prioritizing calculations; options for revisiting pipster/wbpip; and a clearer pip-next response. This is research and a proposed sequence, not implementation or approval to change the roadmap or Decided design.

## Upstream findings at checkpoint
- The weighted mean is not a prerequisite of stages 1-4. SYSTEM_DESIGN.md:145-162 puts auxiliary cleaning, acquisition and survey formatting before deflation and estimates. Earlier advice selected an independently specifiable calculation, but did not justify it as the most valuable project bottleneck to resolve. That recommendation is withdrawn for this proposed development sequence.
- Current pipdata PROD fe075a6d49f37d6d131eeadfeb9219c2038899ea contains actual formatting and clean-validation code. R/pd_process_data.R:226-249 checks eligibility, loads the survey, merges PFW, calls pd_dlw_clean, validates its result and builds auxiliary metadata; :253-287 saves verified output receipts. R/pd_dlw_clean.R:74-83 calls weight/welfare formatting, recodes, wbpip cleaning and variable selection. A cleaning implementation exists; it is false to say there is no code that initiates cleaning.
- The main integration test tests/testthat/test-m2-one-survey-acquire-format.R:397-544 executes actual pd_execute_clean and real stamp readback, but :425-460 mocks DLW acquisition, PIP loading and the validation engine. :248-333 builds auxiliary data.tables by hand and saves them directly through stamp, rather than obtaining outputs from actual pipaux producers. :542-543 checks auxiliary-element presence, not complete numerical agreement. This demonstrates useful local wiring, not real DLW correctness or the complete producer-consumer chain. Broader tests were not exhaustively audited; this is not a claim that no other integration test exists.
- The original pipdata work report .cg-docs/work-reports/2026-10-30-m2-one-survey-acquire-format.md:22-24,43-49 reports prior fixture/package execution, with warnings/skips and one disclosed unexplained transient at :45. No tests were rerun here. It explicitly excludes live DLW and production/shared storage. No inspected evidence establishes a complete live survey run through the new path.
- pipaux's original .cg-docs/work-reports/2026-10-30-m2-aux-stamp-cpi-ppp-pfw-execution.md:18-24,33-45,51-69 reports focused CPI/PPP/PFW schema/persistence tests and later corrections using an isolated pinned runtime. This is not the same test as checking that pipdata selects the correct auxiliary values for a survey.
- Auxiliary matching code exists for CPI/PPP/pop/GDP/PCE (pipdata R/pd_aux_attr.R:129-165,189-210). The surveyed deflation implementation consumes CPI/PPP/pop (R/pd_deflation.R:144,219-223,287-300). Do not make all GDP/PCE producers or later lineup methods prerequisites of the first formatted survey or mean without establishing a real consumption dependency. Verify exact keys, values, levels, vintages and units at each consumer, not just presence in a metadata object.
- Current-stage scientific questions do exist, but are not primarily the mean formula: R/pd_dlw_clean.R:142-160 creates equal weights when no supported weight column exists; :203-205 divides welfare by 365. These are observed rules to validate against the chosen harmonized input and approved formatting policy, not permission to revise them or a proven defect for every module. SYSTEM_DESIGN.md:160 permits formatting, not inferred error repair.
- The pipeline has separate legacy and opt-in stamp-authoritative routes: R/pd_run_pipeline.R:295-301,341-348,407-439. Calling the default function does not prove one is exercising the intended M2 route; production Windows/SMB activation is separately gated at :341-344. An acceptance Plan must identify the route and runtime; do not casually prescribe running the full pipeline.
- pipdata still calls wbpip during cleaning (R/pd_wbpip_clean.R:37-47), recoding (R/recode_spec.R:310) and deflation (R/pd_deflation.R:922). Removing wbpip is broader than replacing pipster's import. No such removal is approved.

## Proposed sequence (not a roadmap mutation)
1. Establish a one-survey upstream acceptance checkpoint under existing M2 work: reproduce/reuse existing checks, close the actual producer/loader/validator boundaries, compare expected versus actual formatting and matched auxiliaries, save/read the correct outputs. Clearly separate offline reproducible tests from an analyst-authorized real-DLW check. Do not restart all code or equate mocks with live validation.
2. Complete deflation through the intended stamp-authoritative path, with independently checked CPI/PPP and final-weight behavior. GDP/PCE enter only where their actual consumption is established; no widening to every auxiliary file.
3. Review calculation API/style/backend options separately before executing the saved pure-mean Plan; it does not gate upstream formatting. Keep tested legacy methods available during any migration.
4. Complete one estimate, independent save, test release and incremental demonstration in that order. Keep M2's one-survey scope; do not retire already implemented features or set new roadmap statuses just from this assessment.

## Proposed pip-next response contract
The current command explicitly demands seven dense response sections, full SHAs, raw output and a full prompt (.kilo/commands/pip-next.md:111-137); tests/pipsys/test-pip-next.R:67-74 enforces much of this vocabulary. This is a command-design problem, not merely a poor word choice in one answer.

Proposed default: one short decision brief (roughly 150-250 words, not a hard limit that hides risks): where the pipeline actually stands; one recommended deliverable and why; what can proceed and what cannot; the one decision needed from the user; link to evidence and any full prompt. Use plain stage names, not internal gate codes. Keep raw stdout/errors/exits, full SHAs, citations, complete prompts and secondary options in the saved record, not the default chat. Preserve uncertainty and approval boundaries. Save full original evidence; do not weaken research to make output shorter.

Priority rule to add: prefer the earliest unproven dependency needed for the next usable end-to-end result, not the easiest isolated feature with a reviewed Plan. Distinguish code present, reported local checks, producer-consumer integration, real-source validation and operational deployment; never collapse these into a single unexplained 'done'. Behavioral check for the revision: an apparent ready mean plus unproven upstream connection must produce a targeted upstream verification recommendation, not mean implementation; a second case must reject claiming live validation from mocked downloads. No command or tests changed yet.

The tracked command, installed copy, applicable output rule in ORCHESTRATOR/kilo configuration, and contract-check expectations must be reconciled when implementing concise output; do not silently violate the existing requirement to reproduce status stdout. Package/roadmap/design changes are not part of that command revision.

## Calculation architecture assessment
Read the completed independent source review calculation-options.md in this run, not an earlier pip-next assessment. Its full source/line evidence and proposals are retained there. Key evidence:
- pipster at 828064e406e07e711c34d2ba725746e367d35f9b is primarily a grouped-data wrapper/prototype, not a complete indicator engine (pipster NAMESPACE:3-12; R/pipster.R:1-10; R/pipgd_params.R:53-83). It has unfinished severity bodies (R/pipgd_pov.R:316-322).
- A current interface mismatch is visible in source: pipster R/pipgd_lorenz.R:73-87 passes seven positional values to a wbpip function declared with four parameters at wbpip R/gd_compute_pip_stats_lq.R:239-242. This is a static incompatibility, not a claim that execution failed in this assessment. Existing design cannot simply be assumed ready.
- Both packages use native pipe; syntax style alone is not a reason to rewrite mathematics (wbpip R/md_compute_poverty_stats.R:31-38). Exact input/output rules, global options, dynamic/private backend coupling and substantive numerical tests matter more. Pipster's distribution-test placeholder at tests/testthat/test-pipgd_dist.R:1-3 does not establish calculation accuracy.
- Three distinct choices must not be collapsed: methodological reference (retain documented mathematics/comparison cases), production runtime dependency (whether new code calls wbpip), public compatibility (which required caller/release outputs stay stable). Keeping the first does not require keeping the second. Replacing pipster imports alone does not retire ecosystem calls from pipdata.

Options to discuss, not approvals:
| Option | Benefit | Cost | Assessment |
|---|---|---|---|
| Keep wbpip as numerical core behind a clean pipster interface | Least immediate numerical duplication | Runtime coupling and compatibility repairs remain | Credible bridge or deliberate permanent choice, but not supersession |
| Replace calculations incrementally behind a reviewed pure pipster API | Own methods one tested slice at a time; preserve useful references without production calls | Temporary mixed backends and per-method equivalence work | Recommended direction for consideration if eventual supersession is the goal |
| Redesign/rewrite all pipster calculations before returning to the data path | Broad architectural freedom | Delays upstream proof and expands numerical risk; frontend rewrite alone still leaves backend calls | Not recommended as the immediate prerequisite |

A bounded interface/style review can proceed in parallel with upstream acceptance planning because it only reads package source and writes separate design evidence. Do not start concurrent implementation workers or assume all future edits are independent. Current Decided package roles remain fixed; retaining or retiring wbpip is Open. No original pipster API, saved mean signature, alternative package, bulk migration or roadmap re-scope is approved here.

## Proposed next usable deliverable and discussion
Recommended primary direction: **data path first, with a bounded calculation design review in parallel, not as a prerequisite.**

Deliverable: one clearly selected GMD survey can be accepted from acquisition through validation, formatting, correct auxiliary matching and stored-output readback, with a concise expected-versus-actual result. The Plan must separate (a) reproducible offline producer-consumer checks and (b) an analyst-authorized actual-DLW check when access/input/data location is approved. Do not imply the offline fixture establishes live availability. Keep private microdata and credentials out of repositories/handoffs. Do not activate production/shared storage or make the orchestrator run the pipeline.

Discuss now: chosen example input/module and welfare-period/weight assumptions; what a correct formatted output and auxiliary match must show; which boundaries are checked offline versus with actual DLW access. Verify required CPI/PPP/PFW and population behavior before using those outputs. GDP/PCE checks belong at their relevant consuming boundary, not an invented blanket precondition. The mean formula, complete indicator inventory and full pipster rewrite are not prerequisites for this step.

After the user selects the direction, prepare a compact acceptance Plan in the responsible package context, reuse current source/tests and the deflation Plan rather than regenerate all work, then review it before any authorized implementation. Roadmap scope/status mutations, if needed, are proposed separately and applied only through cg-roadmap after approval. Choosing a sequencing direction does not approve a new calculation method or live/production execution. Installed cg-strategy.md:131-175 has the proposal/approval gate; cg-plan.md:20-38,61-98 specifies the local planning route. This assessment did not execute either workflow or claim Plan approval.

## Repository provenance
Paths are the current registry paths at tools/pipsys/packages.csv:2-12. All source claims use these full SHAs (or the explicitly named adapter feature ref). No current source claim is inferred from a short overview prefix alone.
| Repository | Branch | Full HEAD | Dirty state / inspected scope |
|---|---|---|---|
| pipsystem | main | 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39 | Pre-existing source/site/docs/state and untracked task work in initial git status; left untouched. This run adds only handoff.md and calculation-options.md. |
| stamp | ready_cran | 4a1fa5d92313aa223296fae0e29cf3446a314aea | M .gitignore; M compound-gpid.local.md; ?? .compound-gpid/; overview/Git only |
| pipaux | PROD | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | Clean; original work report and integration ancestry |
| pipdata | PROD | fe075a6d49f37d6d131eeadfeb9219c2038899ea | Clean; selected source/tests/Plan/work report |
| pipload | PROD | ff9a81e386a09fb2531c154f63fd2b91521313c6 | M .gitignore; ?? .cg-docs/plans/2026-10-20-m2-pipload-stamp-adapter.md; ?? .cg-docs/reviews/2026-05-28-pip-inv-enrich-fast-bulk-v3-verify-review.md; ?? .compound-gpid/; ?? .github/skills/; ?? sessionInfoLog; Git/overview only |
| pipster | PROD | 828064e406e07e711c34d2ba725746e367d35f9b | ?? .cg-docs/; source/test architecture research by internal reviewer |
| wbpip | DEV | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | Clean; source/test architecture research by internal reviewer |
| pipfun | PROD | 0c6a78d9884ed0965a524311537eec2a5095d60b | Clean; Git/overview only |
| pipapi | DEV | 280af151d05902a550d5dea18cd4bf1a3d013239 | Clean; Git/overview only |
| pipfaker | dev_update | f7e48defc9ce868df7667c846d5087ff947ab44e | Clean; Git/overview only |
| metapip | master | c4be592ac9008749dcb13627510ac24ccbeea2ed | Clean; Git/overview only |

Canonical local ancestry was freshly checked, not carried over from yesterday: pipdata Phase 2 57006c2f39fc6f3e03413515ee941d122e44c6dd is ancestor of refs/heads/PROD (exit 0); pipaux feature 8675cd6ccc77bfcebc53530d60ec39016a318d1a is ancestor of refs/heads/PROD (exit 0). Missing former feature worktrees do not mean missing source. Existing pipload adapter worktree is listed at E:/PovcalNet/01.personal/wb384996/PIP/pipload-m2-stamp-adapter, feat/m2-stamp-adapter, HEAD 4ef0d90a974cb6ff0725da69373bde421dd04ad5; no adapter source/canonical integration certification added here.

## Changes
Only two new assessment records in this run: this handoff and calculation-options.md. No package work was executed. No roadmap, Plan, design, charter, command, site, active-state, configuration or paused formal record was changed; no Git mutation or production operation.

## Checks run
- Fresh system clock/time zone, root/path and Git state. Final assessment time 2026-11-03T14:40:08Z (9:40 a.m. ET). Exact output paths passed existing pipsys check-path before writing; .tmp/pipsys resolved to an E path without link attributes.
- Original charter, staged design, roadmap fields, orchestration rules, contract, installed pip-next/information/strategy/plan command definitions; pip-next implementation Plan and command-contract tests. No prior assessment was used as evidence of current package readiness.
- `tools\pipsys\pipsys.cmd overview` exit 0, generated 2026-11-03 09:35 EST; `tools\pipsys\pipsys.cmd handoffs` exit 0, generated 09:34 EST. stdout printed by the tool without row changes; no stderr. These are recorded statuses, not execution certification. No fabricated worker state or readiness follows from the rows.
- Fresh package branch/HEAD/status/worktree commands and targeted ancestry checks; current source and test inspection cited above; independent read-only calculation architecture research completed with its file-based result. No package tests, loads, installs, numerical execution, API or network queries. R ran only the required pipsys information/path tooling.
- Current command source and installed copy both hash to 663a8b37c190341d574d2217319cec9e11407143 via read-only git hash-object (no -w). The dense output requirement is genuinely installed. Relevant command and test files are already untracked task work; no overwrite occurred.
- Governing-file git diff --name-only is empty for AGENTS.md, ORCHESTRATOR.md, SYSTEM_DESIGN.md, compound-gpid.md, roadmap.json and the coordination contract. Final pipdata/pipaux status is clean. Root's unrelated changes remain preserved.
- Minimal first applied: no new runtime dependency/framework, no duplicate implementation or blanket rewrite. One proposed functional result per next deliverable. Do not create defensive bureaucracy for reversible work; keep future Plans compact. Scientific/protected/scope decisions remain explicit, not inferred.

## Gaps
- This is a bounded source assessment, not a full package test audit, complete methodological validation or proof that no other integration test exists. Existing reports' test results are historical worker-reported execution, not current passes. Live DLW access, installed library bytes, actual selected survey/private storage location and full new-path execution remain UNKNOWN.
- Full numerical equivalence, all downstream wbpip callers, complete GDP/PCE/lineup consumption and retirement scope remain unestablished. Do not choose to remove a library based only on package age or coding syntax. Preserve already approved method/API boundaries until explicit changes are agreed.
- Deflation and mean Plans remain saved, unexecuted and gated; no Plan was deleted, silently superseded or approved. Any new milestone/feature or scope change requires user agreement and cg-roadmap, not this report.
- The shorter pip-next output and upstream-priority correction are proposals, not implemented changes. Existing rules demand verbatim status output; implementing a saved-record/short-chat split requires a consistent bounded command/rule/test revision. No claim that future invocations are already fixed.
- The prior pip-next-global record remains historical; this new record explicitly withdraws its primary prioritization. The site may still show that prior global assessment until a separately requested update/fresh global assessment; no site write was performed.
- Next development stage waits for the user's sequencing decision, not a running worker or automatic callback. This research and its internal architecture review are complete. No visible Agent Manager session, worktree, schedule, package worker or pipeline run was started.
