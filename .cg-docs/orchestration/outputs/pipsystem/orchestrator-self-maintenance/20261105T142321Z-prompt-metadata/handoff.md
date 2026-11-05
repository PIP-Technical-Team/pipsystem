---
schema: pip-handoff-v2
project: pipsystem
task: orchestrator-self-maintenance
run: 20261105T142321Z-prompt-metadata
status: completed
updated: 2026-11-05T14:26:46Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f0eb0d2950f24a67270a6ba946de9df9fae4ccdf
plan: NONE - explicitly requested own-rules maintenance
next: User reloads project configuration or starts a fresh session to activate the updated agent prompt; file changes and verification are complete.
---

# Standard user-command and prompt metadata

## Summary
Implemented the user's explicitly requested standardized metadata for every command/prompt provided to them: Project Name, Branch, Worktree Requirement, Model Family Recommendation (Powerful/Standard/Small) and Effort (low/medium/high/extra high). The recommendation is task-based, not a statement of the responding model. Existing Target Project/Environment/Agent fields remain in the same eight-field header for compatibility. Scope now expressly covers same-session recommendations, cross-environment commands and saved execution prompts. The agent configuration and three instruction/contract files agree.

This uses the explicit own-rules maintenance path in ORCHESTRATOR.md (Changing These Rules), not a package implementation or a claimed cg-light-work run. The installed light-work procedure was read but not invoked. The requested policy change is fully specified; scope is four synchronized instruction/configuration files, a mandatory handoff and an E-local executable consistency check. No permission, model-selection setting, client setting, package, design, roadmap, command definition or historical prompt is changed.

## Changes
- `ORCHESTRATOR.md:134-197`: canonical field definitions/template, tier/effort examples, branch-versus-worktree distinction, placement/shared-block rules, explicit UNKNOWN and advice-only boundaries.
- `kilo.json:7`: synchronized the pip-orchestrator prompt reminder; preserved include, description/mode and all other configuration. No model/provider/variant or client-setting selection changed.
- `AGENTS.md:77-95`: same coordinated command/prompt requirement and retained existing target fields.
- `.cg-docs/orchestration/CONTRACT.md:78-108`: same contract and placement/compatibility rules; no handoff schema change.
- This handoff and ignored E-local check script `.tmp/pipsys/check-orchestrator-metadata-20261105.py`. No historical prompt/report rewrite or command-definition install was needed.

All four rule/config files were clean before edits. Existing unrelated dirty root files/reports/site/tools were preserved. No Git mutation, new branch/worktree, package change, roadmap/design/global-config edit or client-setting change. Resulting tracked diff: four files, 101 insertions / 29 deletions (configuration prompt remains one JSON string).

## Checks run
Clock/timezone and root Git checked at 2026-11-05T14:23:21Z (9:23 a.m. ET); HEAD f0eb0d2950f24a67270a6ba946de9df9fae4ccdf, current/default main (origin/HEAD -> origin/main). Targeted git status/diff were empty for all four intended rule files. Existing pipsys check-path returned inside/exit 0 before report creation. Root and .tmp/pipsys are on E with no links shown.

- Tool-side config validation after patch: successful.
- Executed `python .tmp/pipsys/check-orchestrator-metadata-20261105.py`, exit 0: all eight exact labels, three tiers, four effort levels, same-session/saved scope, UNKNOWN/verbatim/placement boundaries exist in all four sources; canonical template fields are ordered and complete; JSON parses; comparison with `git show HEAD:kilo.json` proves all configuration outside the agent prompt unchanged. The ORCHESTRATOR file include is retained.
- `git diff --check -- ORCHESTRATOR.md AGENTS.md kilo.json .cg-docs/orchestration/CONTRACT.md`: exit 0. Git printed existing LF-to-CRLF normalization warnings, not whitespace errors; no line-ending normalization/config change was performed.
- Read the complete intended four-file diff and targeted final status; only intended rule sections and agent prompt changed. E-local script is ignored, not staged. No stage/commit/push/merge occurred.
- Check execution used process-local TEMP/TMP/TMPDIR/XDG data/state/cache on E `.tmp/pipsys` and Python bytecode disabled. No package code, pipeline or package tests were run.
- Final verification clock 2026-11-05T14:26:46Z (9:26 a.m. ET). No reload/activation probe or model switch was attempted.

## Working principles
Minimal first: one coherent header rule, no schema/version/dependency framework; safeguards only for almost-irreversible harm, reversible extras Later; one functional configuration/content check; installed tools first, dependency only if worthwhile; any Plan about two pages. Authorized reversible work proceeds; protected/Decided or scope changes, near-irreversible actions, Git publication and nongenerated deletion retain existing approval rules. No branch/worktree/model/effort selection is authorized by a recommendation.

## Gaps
Saved instruction/configuration parity is verified, not guaranteed behavioral compliance by future model responses. Reload/fresh-session activation and a post-reload user-facing prompt have not been observed. The user must reload project configuration or start a fresh session for the persisted agent prompt to take effect. The rule does not add a runtime enforcement engine, change client settings or retroactively rewrite historical examples/reports; internal tool calls and verbatim source output are deliberately excluded. Changes remain uncommitted because no commit/push/merge was authorized. No package work was executed.
