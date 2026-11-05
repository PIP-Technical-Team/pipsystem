---
schema: pip-handoff-v2
project: pipsystem
task: site-focus-and-navigation
run: 20261102T204600Z-plan-critic
status: completed
updated: 2026-11-02T21:00:22Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md r1
next: Plan author resolves the findings before implementation; this review makes no Plan or implementation changes.
---

# Site focus and navigation Plan critique

## Summary
Full saved r1 Plan reviewed against repository sources. Findings: 0 P0, 1 P1, 1 P2, 1 P3. Resolve the restart-record boundary conflict before execution. Browser executables are installed, but E:-only browser execution is not yet demonstrated. No implementation or Plan edits were made, and no approval was inferred from prior execution authorization.

## Findings

- **[P1.1]** [cg-plan-critic] Step 4 / Constraints and Boundaries: `Preserve dirty work versus required restart record` — the default workflow cannot meet both instructions as written.
  **Issue**: The Plan requires preserving every pre-existing dirty path and does not allow active-state writes, while the execution workflow requires replacing the already-dirty shared current pointer. Merely inspecting its diff does not resolve the conflict.
  **Evidence**: Plan `.cg-docs/plans/2026-11-02-site-focus-and-navigation.md:26,90,116,121-122` requires preservation and bounds the write set. `.kilo/commands/cg-work.md:115-120` requires an execution report and updates to `.cg-docs/active-state/current.json`; `.kilo/shared/active-state.contract.md:9-13,59-64` names that exact current pointer and its resume consumer. The read-only Git diff confirms it is already modified. Its working content refers to the completed pip-next task, not this Plan (`.cg-docs/active-state/current.json:3-8,18-24`).
  **Impact**: Normal cg-work would overwrite unrelated uncommitted restart information outside the Plan boundary; silently skipping the update would fail the default restart contract and leave cg-resume pointing at another task.
  **Fix**: Specify a narrow, task-specific exception before execution: leave the existing current.json byte-for-byte unchanged, save this task's compact restart record in its assigned run folder, and put that exact pointer and resume command in its durable execution report/handoff. Explicitly document that default current.json-based discovery is not updated for this run; use the named Plan/report to resume. Do not claim this satisfies the default shared-pointer behavior without the explicit exception. If the default pointer must remain mandatory instead, that is a boundary decision to resolve before implementation, not permission to overwrite the dirty file. Do not rename, move, delete, or replace protected history. One check: compare current.json before/after and confirm the task-local record references the correct Plan, phase, report, and next command.

- **[P2.1]** [cg-plan-critic] Step 4 / Testing Strategy: `E:-contained browser verification` — installed browsers exist, but the launch containment is underspecified.
  **Issue**: The Plan names profile/cache/temp containment without a concrete launch recipe covering browser-local application data, logs, and crash outputs. The R wrapper's temp redirects and Quarto redirects do not automatically contain an independently launched browser. A browser fixture passing is not proof that all indirect writes stayed on E:.
  **Evidence**: Plan `:73,77,107,115,132` requires actual browser execution, E:-only writes, and stopping an unsafe browser launch. `tools/pipsys/pipsys.cmd:9-18` redirects only TEMP/TMP/TMPDIR for its R child; `tools/pipsys/pipsys.R:1489-1506` redirects LOCALAPPDATA/APPDATA/DENO_DIR only inside the R rendering path. Read-only executable inspection found Chrome `156.0.8078.76` at `C:/Program Files/Google/Chrome/Application/chrome.exe` and Edge `156.0.4314.58` at `C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe`. No browser launcher/containment recipe was found by targeted search of `tests/pipsys` for headless/profile/cache/log redirection terms.
  **Impact**: V2/V3 could either stop late despite an installed browser or launch with default user-local outputs on C:, violating C1. Executable installation on C: is not itself a problem; uncontrolled output there is.
  **Fix**: Add one small process-local launch recipe, not a new harness/dependency: choose either installed executable; use a fresh resolved E:-contained run directory; set TEMP/TMP/TMPDIR, LOCALAPPDATA and APPDATA there; use explicit absolute E: `--user-data-dir`, `--disk-cache-dir`, and `--crash-dumps-dir`; disable first-run/default-browser/background-update behavior; disable browser logging or redirect its configured log destination to E:. Verify the chosen browser's effective output destinations before launching; do not use an existing user profile. Retain E: evidence from one headless file:// fixture run covering the already-required interactions and record the executable/version/environment/arguments. Stop if any necessary output cannot be contained. These are launch prerequisites, not a recommendation for a new general validation framework.

- **[P3.1]** [cg-plan-critic] Step 1: `Latest completed assessment selection` — undated completed reports have no explicit eligibility rule.
  **Issue**: The Plan defines ordering by parsed updated time and a run tie-break, but does not say whether a completed handoff with an unparseable/missing updated time can become the selected advice when no dated completed report exists.
  **Evidence**: Plan `:36,47,50` requires dated recorded advice and completed-versus-running selection tests. The existing parser returns NA for invalid time (`tools/pipsys/pipsys.R:62-79` and `tests/pipsys/test-pipsys.R:109-110`), while handoff selection orders unknown times last but retains them (`tools/pipsys/pipsys.R:396-407`). The current real global assessment has a valid completed status and timestamp (`.cg-docs/orchestration/outputs/pipsystem/pip-next-global/20261102T203907Z-live-global/handoff.md:6-7`); this is an edge case, not an observed bad selection.
  **Impact**: A completed but undated report could be presented as the latest dated recommendation, or the implementation could make an unstated choice about its age.
  **Fix**: Require a parseable updated time for latest-advice eligibility. List excluded undated/malformed completed reports as a source gap; if no eligible completed report remains, show the existing missing-advice fallback. Add one fixture with only an invalid-date completed report. Reuse parse_utc; no new schema or broad validation layer.

## Other verified assumptions
- Milestone objectives and feature IDs exist in roadmap.json; current projections omit them (`roadmap.json:5-18,43-56`; `tools/pipsys/pipsys.R:418-466`). A site-only projection is appropriate and avoids CLI schema changes.
- Canonical package roles include Open wbpip and out-of-scope piptm (`SYSTEM_DESIGN.md:284-309`); the charter supplies pipsystem's design/evidence boundary (`compound-gpid.md:31-33`). The Plan correctly distinguishes these target roles from implementation.
- The actual global handoff stores its fuller assessment in sibling assessment.md but retains recommendation, blockers, and parallel conclusions in Summary (`.cg-docs/orchestration/outputs/pipsystem/pip-next-global/20261102T203907Z-live-global/handoff.md:18-23`). The Plan's labeled Summary fallback is therefore necessary and sufficient within its handoff-only read rule; do not promise structured sections absent from this source.
- The previous file:// classic-script decision is recorded at `.cg-docs/work-reports/2026-10-30-modernize-quarto-site.md:42`; current pages emit classic inline scripts (`tools/pipsys/pipsys.R:1134-1186,1218-1263`). No new JS dependency is necessary.
- Explicit enhancement wrappers, a small CSV joined on feature IDs, and a single installed-browser fixture are proportionate to the approved requirements. No additional framework or unrelated hardening is recommended.

## Changes
Only this assigned handoff created and finalized. No implementation, Plan, active-state, package, roadmap, design, or charter edits; no Git mutations; no commits.

## Checks run
- Read the FULL authoritative r1 Plan (137 lines), project charter/config, SYSTEM_DESIGN.md, HARVEST_BRIEF.md, review command, context-loading contract, and pip-handoff-v2 contract.
- Read targeted pipsys source, site configuration/assets, existing tests, roadmap ID/title/objective/status/Plan fields, pip-next assessment-format instructions, the actual global handoff, and the prior modernization report's file:// decision.
- Read the active-state contract, cg-work restart requirements, current.json, and its Git diff. Existing dirty current.json belongs to the completed pip-next workflow; it was not altered.
- `git status --short`, `git branch --show-current`, `git rev-parse HEAD`: main at supplied SHA 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39; unrelated pre-existing dirty paths preserved. Final targeted status showed current.json still modified, the Plan still untracked, and no tracked implementation/site/test modifications.
- Read-only Test-Path/Get-Item checks: installed Chrome and Edge executables and versions as above; `.tmp/pipsys` exists on E:. No browser was launched and no process cache was created.
- `Get-Date` / `Get-TimeZone`: local zone Eastern Standard Time; report updated timestamp recorded in UTC as the contract requires.
- No R/testthat, Quarto render, browser-interaction checks, or pipeline/package tests run: this assignment is research/report only and has no implementation to verify.

## Gaps
- Findings are recommendations only; the Plan remains r1 and unchanged. No findings have been implemented or accepted as risks by this review.
- Browser launch/output containment and actual file:// interactions remain UNVERIFIED. Installed executable availability is verified, not safe runtime behavior.
- Default cg-work shared restart-pointer behavior is incompatible with the current Plan boundary until the explicit task-local exception or another approved boundary resolution is recorded.
- No package repositories or generated `.cg-docs/views` bodies were read. Package SHAs quoted inside existing project evidence are inherited facts, not new package inspection or certification.
- No task scope, Decided item, production state, roadmap status, or execution approval was changed. The prior all-phase authorization does not authorize implementation in this research-only assignment.
