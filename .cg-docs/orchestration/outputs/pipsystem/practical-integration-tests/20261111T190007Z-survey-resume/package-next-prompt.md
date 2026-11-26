# Proposed Package Context Follow-Up

This is a proposed separate package task. Saving it grants no execution or package-edit authority in the survey task.

## Setup
**Project Name:** pipdata public working-release context
**Branch:** Existing PROD; expected c5b27fa4458d7175aca81a203762bae81e9f0b40, verify before work.
**Worktree Requirement:** No new git worktree; existing E:/PovcalNet/01.personal/wb384996/PIP/pipdata checkout.
**Model Family Recommendation:** Powerful (Sol/Opus).
**Effort:** high.
**Target Project:** pipdata; E:/PovcalNet/01.personal/wb384996/PIP/pipdata.
**Target Environment:** Existing PROD branch and checkout above; report mismatches without switching or creating environments.
**Target Agent:** Code mode.

Examples are advisory, availability varies by platform/date, and the user selects model and effort. No model/provider/client-setting change is authorized.

## Task
```text
Diagnose and minimally fix pipdata's public working-release context integration.
Verify root E:/PovcalNet/01.personal/wb384996/PIP/pipdata, existing PROD and expected HEAD c5b27fa4458d7175aca81a203762bae81e9f0b40. Preserve unrelated changes; report mismatches without switching/creating environments.

Read the original reviewed revision 1 Plan and latest Work Report in sibling pipsystem, plus .cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261111T190007Z-survey-resume/{handoff.md,implementation/handoff.md} and fresh review/verify reports named there. Read experiments/one-survey/reproduce.R and .tmp/one-survey/n11/logs/reproduce.log as evidence, not as authorization to rerun the full survey.

New exact survey combination pipdata c5b27fa4458d7175aca81a203762bae81e9f0b40 and pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5 got past the old bootstrap boundary. With retained pipfun 7d534516a8c17c33d537681610eccd4c29211762, public setup_working_release returns release 20260401 and identity TEST, but pd_process_data(inv=completed_valid_inventory, bootstrap=TRUE) fails pipdata_dependency_context_error: A single working release and identity are required. Archived dependency_contract.R:266-273 reads options pipfun.working_release/pipfun.identity; pipfun stores working context in .pipenv and exposes a public getter. Confirm diagnosis before fixing. The old bootstrap regression must remain fixed.

Use the public pipfun context interface, not hidden-state fabrication, harness option seeding, internal-worker replacement or package-boundary bypass. Add the smallest regression reproducing the real exported setup-to-processing interaction, demonstrate failing baseline before implementation, minimally fix pipdata only, then rerun affected tests and required review including all applicable P0-P3 corrections and final mode:verify. Preserve prior evidence; do not weaken assertions or mask arbitrary read/context errors. No full survey, original pins/Plan changes, downloads, other-package edits, production/shared changes, Git mutations, new sessions/worktrees or environment switches. Any further boundary or unavailable dependency/check requires truthful blocked reporting.

All direct/indirect runtime writes must be E: under pipsystem .tmp/one-survey in a new short isolated attempt; redirect TEMP/TMP/TMPDIR, home, R profiles/library/cache/logs before children. Use exact local Git snapshots/recorded dependencies, no dirty-tree installation or ambient contributed-library fallback. Package source/test edits stay in pipdata; durable report goes at E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261111T190007Z-context-fix/handoff.md. Create at start and checkpoint pip-handoff-v2 with Summary, Changes, Checks run, nonempty Gaps, full SHAs, actual red/green results, review/verify links, limits and next owner. Do not claim original survey/Phase 2 acceptance; later immutable package revision and survey pin/resumption require separate approval.

Minimal first: smallest complete fix; safeguards only almost-irreversible failures; one functional check per change; installed tools and dependencies only when worthwhile; Plans about two pages. Preserve get_errors/execution_subagent limitations; no fabricated diagnostics or unsafe Pester commands. Show human times in local ET using system clock and machine evidence UTC.
```
