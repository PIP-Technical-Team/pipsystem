---
date: 2026-11-18
title: "Dispatch PIP package assignments without copying prompts"
status: completed
scope: Standard
brainstorm: null
language: R
estimated-effort: small
deviation-policy: autonomous
artifact-schema-version: 1
tags: [pipsystem, coordination]
---

# Plan: Dispatch PIP package assignments without copying prompts

## Objective

Use `pipsystem` as the existing coordination hub. Put an approved package task
in the right package session and collect its verified handoff without relaying
prompt or result text. Keep package and pipeline ownership unchanged.

## Context

`ORCHESTRATOR.md` already defines the setup card and handoff. `CONTRACT.md`
defines the run layout and `pip-handoff-v2`. `tools/pipsys/packages.csv` maps
package IDs. Agent Manager's live list from pipsystem exposed only that project;
the chat tool has no arbitrary repository selector for new sessions.

## Requirements

| ID | Requirement | Source |
|---|---|---|
| R1 | Parent saves one assignment in the report's run folder and verifies the exact result; preserve existing approval boundaries. | Approved Home Repo approach; `SYSTEM_DESIGN.md:319` |
| R2 | Kilo package sessions can load one assignment by ID; use an exposed, verified package session if available. No new worktree or package changes for the pilot. | Approved pilot; current `agent_manager` interface |
| R3 | Final endings track the overall outcome, not the session checkpoint. | Direct user correction, 2026-11-18 |

## Implementation Steps

1. Add the durable global preference and align pipsystem references. Preserve
   existing dirty changes and the read-only role of `/pip-next`.
2. Define dispatch alongside the handoff contract. Expose a small global Kilo
   command and use the existing pipsys tool to resolve one literal run from its
   package checkout. No new state system, background launcher, or dependency.
3. Save one read-only package assignment with a known checkout, branch and
   SHA. Run it in the package context, then verify its exact handoff using
   Git and cited source. Record any blocked stage; do not substitute a parent
   subagent's result for a package session. Use `pipaux` for the resumed pilot
   so it does not depend on or interrupt the `pipdata` B6 session.

## Testing Strategy

- V1: Verify installed command and references, precise patch boundaries, and
  that wrong IDs, checkouts, or already started attempts do not execute.
- V2: The package session loads the specific assignment, records its checkout
  and full SHA, and saves a completed or no-change `pip-handoff-v2`; the parent
  checks the actual result. Unavailable package execution is NOT RUN.

### Verification Status

- V1 passed: pipsys tests and a real path lookup from `pipaux` passed. The
  standalone CLI discovered the command in the package context.
- V2 passed for the file-based workflow. A real `pipaux` session resolved
  the [assignment](../orchestration/outputs/pipaux/dispatch-pilot/20261119T144229Z-pickup/assignment.md)
  by ID and saved the [completed handoff](../orchestration/outputs/pipaux/dispatch-pilot/20261119T144229Z-pickup/handoff.md).
  The parent's scheduled check found it without a relay of the result. The
  parent validated the v2 schema and run identity, confirmed a clean `PROD`
  checkout at `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, and checked both
  committed `DESCRIPTION` citations. No monitoring remains scheduled.
- Gaps: The worker reported running the pickup helper but did not record
  whether the slash command or the plain-message fallback invoked it. On
  2026-11-19, after the user confirmed `pipaux` was listed in the panel,
  the parent Agent Manager tool still returned only `pipsystem` sessions.
  No direct send was attempted without a verified target. Pickup by ID remains
  the tested fallback when work requires a separate package session.
- An [internal Task probe](../orchestration/outputs/pipsystem/subagent-check/20261119T163727Z-pipaux/handoff.md)
  verified that a pipsystem subagent can use the registered `pipaux` checkout
  explicitly, prepare a candidate patch in pipsystem, and check the patch
  against the real checkout without a package session. The package stayed
  clean. That probe did not test direct package writing.
- Direct-edit follow-up passed on 2026-11-19 after the user approved the
  pilot and replaced the read-only rule in `SYSTEM_DESIGN.md:319`. An
  [internal Task](../orchestration/outputs/pipaux/direct-edit-pilot/20261119T165548Z-internal-task/handoff.md)
  edited `DESCRIPTION:2` in a disposable `pipaux` sibling clone on `PROD`
  at `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` and returned its handoff
  without a package chat. The parent independently checked the pinned SHA,
  sole one-line diff and exact metadata with base R. The live checkout stayed
  clean. The pilot did not run package code, the full suite, or the pipeline.

## Risks & Mitigations

Only a direct user invocation or authorized dispatch can start a task. A
saved assignment, peer note or worker report is not permission to mutate Git,
edit package code, or bypass a Plan gate. Do not read secret files, copy env
files, run production code, or write outside E: except authorized Kilo config.
The direct-edit pilot authorized no new commits, pushes or merges. No new
Agent Manager sessions unless explicitly requested or separately confirmed.

## Completion Contract

One real package round trip and a parent-verified result without pasting
task or report text. The preferred route is now a direct internal Task in
the approved target checkout. When a package session is necessary and the
parent cannot reach it, the user starts pickup by ID. Minimal first:
smallest end-to-end change, safeguards
only for nearly irreversible harm, one functional check per change, installed
tools only, and no new architecture until there is evidence it is needed.
