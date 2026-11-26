---
schema: pip-handoff-v2
project: pipsystem
task: instruction-setup-review
run: 20261125T225410Z-review
status: completed
updated: 2026-11-26T00:40:00Z
owner: Claude Code (Opus 5.5), VS Code, macOS
repo: /Users/acastanedaa/Developer/pip/pipsystem
branch: main
head: 8a140d151dd4c167722a6e07f220d72cd242bf4c
plan: NONE (user request in chat, 2026-11-25)
next: User reviews the uncommitted diff, then decides on commit and on deleting pip-pickup; reload the Kilo window
---

# PIP instruction setup review

## Summary
Six review rounds with read-only subagents: A Opus, B Fable, C Opus,
D Fable, E Opus, then F Opus and F Fable on the same version (v5). Both F
reviewers ended "NO FURTHER CHANGES WORTH INCORPORATING". v5 is applied to
the repository (uncommitted). A final read-only Opus check on the live repo
ended "CONSISTENT". The user answered four questions during the run (pipsys
must work on macOS and Windows; direct package edits instead of pickup;
add CLAUDE.md; charter text is proposed, not edited).

Working folder, round log and snapshots (backup = v0, v1-v5):
`/Users/acastanedaa/Library/CloudStorage/OneDrive-WBG/Documents/temp/pip-instruction-review/20261125T225410Z/`
(`round-log.md` lists every accepted and rejected suggestion).

## Changes
Uncommitted, in /Users/acastanedaa/Developer/pip/pipsystem (no commit, no push):
- AGENTS.md: new Rule "pipsys" (HUB vs the checkout that holds the files;
  Windows `<X>\tools\pipsys\pipsys.cmd`, macOS `Rscript --no-init-file
  <X>/tools/pipsys/pipsys.R`); handoff path points to it; direct package
  edits are the default, package session only when the user asks; raw-output
  rule held here only.
- CLAUDE.md (new): `@AGENTS.md`.
- ORCHESTRATOR.md: Packages table without paths; "Changes in packages",
  "Git" and "Changing These Rules" by pointer to AGENTS.md; macOS writes also
  in a linked worktree; pipsys and `.kilo/` notes; DST from the tz database;
  raw-output paragraph removed; Status step 1 uses the information command;
  setup card template compacted; no package-session prompt unless the user
  asks; Retained Records folder named.
- .cg-docs/orchestration/CONTRACT.md: "Shared Rules" merged into Scope;
  pickup is a fallback; pickup-path command for both platforms; Gaps updated.
- kilo.json: description "dispatches package sessions only when the user asks".
- tools/pipsys/kilo/commands/pip-status.md, pip-overview.md, pip-handoffs.md,
  pip-site.md: exact Windows and macOS lines against HUB.
- tools/pipsys/kilo/commands/pip-next.md: ROOT = HUB with a stop message;
  reads less (SYSTEM_DESIGN section 12 + touched sections, CONTRACT layout and
  format; ORCHESTRATOR/AGENTS only if not in context); `status pipsystem` in
  global mode; no roadmap dependency field; reads `experiments/` step
  documents; prompt contract by pointer; saved prompts target a pipsystem
  session; write limits for both platforms.
- tools/pipsys/kilo/commands/pip-doc.md and agents pip-doc-checker/-writer/
  -simplifier: RUN under HUB; PIPSYS(X) for both platforms; citations
  resolved through packages.csv; fallback when the E: style file is missing.
- tools/pipsys/pipsys.R: `same_repository()`; `read_packages()` accepts a
  linked worktree of the registered mac_path; DEFAULT_QUARTO is quarto on
  PATH off Windows; `reset_gen_dir()` requires E: only on Windows; render
  quoting by platform; comments. Windows branches unchanged in effect.
- tests/pipsys/test-pip-next.R: ROOT expectation updated; raw-output check
  reads AGENTS.md; run comment for both platforms.
- .kilo/ (gitignored): reinstalled with `install-kilo`.

## Checks run
- Start: Git root /Users/acastanedaa/Developer/pip/pipsystem, branch main,
  HEAD dcfd90671a25fd048162aead88e4674d3ec90e10; in-scope files clean.
- Main moved during the run (another session): 62f9f87, 9909d6f, e168334,
  8a140d1. Before applying, every in-scope live file was compared with the
  backup (`cmp`): no difference.
- Temp worktree /Users/acastanedaa/temp/pip-instruction-review/wt (detached
  9909d6f) with the patched script, macOS: status pipsystem, status pipdata,
  overview, handoffs pipsystem, check-path, check-doc exit 0; site exit 0
  (Quarto 1.9.37, 85 Plans, 75 s). v0 script in the same worktree: "No
  package mapping for this hub checkout"; v0 site: "Quarto not found at
  'E:/...quarto.exe'".
- On main after applying (HEAD 8a140d1, macOS): `install-kilo` ok; status
  pipsystem, overview, handoffs, check-path site/gen, check-doc
  docs/pipsys-tools.md, check-map: exit 0.
- `testthat::test_file("test-pip-next.R")`: v0 11 tests / 11 failures; v5 on
  main 11 tests / 0 failures (includes the `.kilo/` byte-parity test).
- `test-pipsys.R` on macOS: 1 failure + 14 errors in both v0 and v5, the same
  tests (fixtures without mac_path; `Sys.junction` is Windows only).
- Final read-only Opus check on the live repo: CONSISTENT.
- Windows: NOT RUN.

## Gaps
- Windows not tested: the pipsys.R Windows branches and the unquoted command
  forms are unchecked in PowerShell/cmd.
- Approval needed (deleting tracked files): retire `tools/pipsys/kilo/global/
  pip-pickup.md`, CONTRACT "Package Assignment Pickup" and `pickup_path()`
  if the package-session fallback is no longer wanted.
- Charter (user edits; proposed text in the chat reply): compound-gpid.md:27
  "commit SHA" -> "full commit SHA"; compound-gpid.md:38 does not name the
  live Phase 2 step-evidence Plans.
- Out of the review set, now stale: docs/pipsys-tools.md, docs/handoffs.md
  (old invocation and cited line numbers), README.md:97 (Windows-only
  install-kilo), the M2 Plan's package-session wording
  (.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:35,382,419,431),
  tests/pip-orchestration.test.mjs (paused workflow; failed on v0 too).
- tests/pipsys/test-pipsys.R fixtures are Windows-only; same_repository()
  has no automated test (manual macOS run above).
- Porting pip-orchestrator and /pip-* to Claude Code (`.claude/agents/`,
  `claude --agent`) not done; scope decision.
- Cosmetic, not changed after convergence: pipsys.R:1746 comment says "see
  the header" but the header does not mention DENO_DIR; double space at
  pip-next.md:28; some unwrapped lines (pip-next.md:101-102,162-163,215,220;
  CONTRACT.md:118,151).
- Kilo Agent Manager worktree location on Windows: UNKNOWN.
- The global `pip-pickup` is not installed on macOS.
- Uncommitted work by another session is in the same checkout (Brain files,
  experiments/, .Rprofile, tools/pipsys/dev-library.R, install-dev.R,
  outputs/pipsystem/dev-library/); not touched.
- Temp worktree /Users/acastanedaa/temp/pip-instruction-review/wt is still
  registered; remove when no longer needed.
