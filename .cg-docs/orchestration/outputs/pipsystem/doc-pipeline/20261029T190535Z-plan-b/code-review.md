# Code Review: Documentation pipeline (review:auto, mode full)

Run by pip-orchestrator, 2026-10-29. Mode `full`: an agent file sets
permissions (`.kilo/shared/review-routing.contract.md:60`). The ten roles ran
as three read-only subagents (work report D10): code quality with testing,
architecture, documentation and performance; adversarial with version
control and reproducibility; data quality with the learnings-researcher role.
User decision: fix all findings.

| ID | Sev | Reviewer | Finding | Fix |
|----|-----|----------|---------|-----|
| ADV-1 | P0 | adversarial | TARGET reached a shell command unquoted | Step 0 allows only relative paths of letters, digits, `.`, `_`, `-`, `/`, no `..`; shell calls quote the argument. |
| ADV-2 | P0 | adversarial | A failed meaning check restored the baseline over user edits | TARGET and `checked.md` are left as they are; handoff `blocked`. |
| ADV-3 | P1 | adversarial | No containment check before writing (junctions) | `check-path` subcommand (`check_path()`, junction-safe) on TARGET and RUN in step 0; tests. |
| ADV-4 / CQ-4 | P1 / P2 | adversarial, code | Agents hardcoded the main checkout | ROOT input in all agents, passed by the command. |
| ADV-5 | P1 | adversarial | Ignored `.kilo` files not recoverable from Git | Tracked canonical copies in `tools/pipsys/kilo/{commands,agents}/`; `install-kilo` copies them into `.kilo/`; tests. |
| CQ-1 / ADV-6 | P2 | code, adversarial | `extract_citations` accepted a valid prefix (`1, 999`, `1-bad`) | Whole list taken; `check_citations` reports the bad part; tests. |
| CQ-2 | P2 | code | Windows paths ignored or misread | Drive and backslashes kept; `\` normalized; absolute paths rejected; tests. |
| CQ-3 | P2 | code | Correction round omitted writer inputs | Step 2 passes ROOT, TARGET, SOURCES, PURPOSE, FIX LIST. |
| DQ-1 | P2 | data-quality | Trial document citations too broad | Writer: smallest range, one fact per sentence; checker `broad` verdict; document rewritten (trial 1c). |
| DQ-2 | P2 | data-quality | Checker evidence did not cover each fact | Checker splits atomic claims, needs an exact line and excerpt per claim. |
| T1-B | - | trial 1 | Facts checker skipped cited Gaps items | Checker counts Gaps items that state a cited fact. |

Runtime enforcement of subagent `permission:` is UNKNOWN (adversarial
reviewer; V5).

## Verify rounds

- Round 1 (code-quality, read-only): 6 fixes verified; 3 partial. New: backtick citations with malformed suffixes or a leading `/` were cut to a valid prefix; trial evidence condensed; `tools/pipsys/kilo` uncommitted.
- Fix: `backtick_citations()` takes a backtick citation whole (test added; 170 passing). Condensed evidence and the uncommitted folder are recorded in the work report (Accepted Exceptions; Remaining Uncertainty).
- Round 2: backtick fixes verified; no new findings. Bare (non-backtick) citations keep prefix matching; recorded as a known limitation (Later).
