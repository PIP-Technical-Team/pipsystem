# Code Review: pipsystem info tools v1 (review:auto, mode full)

Run by pip-orchestrator, 2026-10-29. Mode resolved to `full` because the
`site` subcommand deletes and recreates a folder ("destructive filesystem
behavior", `.kilo/shared/review-routing.contract.md:60`). Ten read-only
reviewers. User decision: fix all findings, including P3 (user prompt
2026-10-29T17:19:24Z; global rule "End-to-End Plan Execution").

| ID | Sev | Reviewer | Finding | Fix |
|----|-----|----------|---------|-----|
| ADV-1 | P0 | adversarial | `$ARGUMENTS` goes unquoted into a shell command in `/pip-status`, `/pip-handoffs` | Both commands now check the argument (empty, or one word of letters, digits, `-`, `_`) before running; otherwise print `pipsys: invalid argument` and stop. |
| ADV-2 / ARCH-01 | P0 / P1 | adversarial, architecture | Deletion guard accepted any `.../site/gen` with `_quarto.yml`; `PIPSYS_ROOT` could point anywhere | `PIPSYS_ROOT` removed; root comes from the script location. `reset_gen_dir(gen, root)` deletes only when the resolved path equals `<resolved root>/site/gen`, the root is on E:, and `site/_quarto.yml` exists. Junctions resolve (`normalizePath`), so a junctioned `site` is refused (test with `Sys.junction`). Quarto state folder must resolve inside the root before render. |
| TEMP-01 | P1 | reproducibility | Wrapper continued if `.tmp\pipsys` could not be created (R could fall back to a C: temp folder) | `pipsys.cmd` stops if the checkout is not on E: or the folder does not exist after `mkdir`. |
| ADV-3 | P1 | adversarial | `git status` could start an fsmonitor daemon or hook in a package `.git` | Every Git call adds `-c core.fsmonitor=false` with `--no-optional-locks`. |
| GIT-01 | P1 | version-control | Local commit `cac3388` had a 129 MB `quarto.zip` | Fixed by the user: `cac3388` replaced by `df37f94` (2026-10-29T14:39:28-04:00) without the archive; `git rev-list --objects origin/main..HEAD` has no `quarto.zip`; the file is gone from the working tree. |
| ARCH-02 / DQ-2 | P2 | architecture, data-quality | Failed `git branch`/`git status` became `(detached)` / `0` | Failures keep `UNKNOWN`/`NA`, the note names the failed query, overview and status Gaps show it; test with a mocked `run_git`. |
| DQ-1 | P2 | data-quality | `parse_utc` dropped fractional seconds, so ordering could pick an older run | Fractional seconds kept (`%OS` + explicit offset); test with `.900Z` vs `.100Z`. |
| DQ-3 | P2 | data-quality | Lenient v2 fallback could print `>-` or inline comments as values | Block scalars and empty values become `UNKNOWN`; quoted values unquoted; inline `#` comments dropped; format shown as `v2 (lenient)` with a Gaps line; test with a multi-line `next`. |
| WT-01 | P2 | reproducibility | The pipsystem row always read the main checkout | `read_packages()` sets the pipsystem path to the running checkout root; tested. |
| WT-02 | P2 | reproducibility | Commands named the main-checkout path | Commands run from the root of the current checkout (session working directory). |
| T1 | P2 | testing | Guard test could pass without the path check | New test: wrongly named folder next to `_quarto.yml`, another root's `site/gen`, and a junctioned `site`, each with a sentinel that must survive. |
| T2 | P2 | testing | Overview test never used a real repository | Test uses a temporary Git repo with one open and one closed Plan and a handoff; checks the full row and the row count. |
| T3 | P2 | testing | Latest-run test could pass on run-ID order alone | Fixture where the earlier run ID has the newer time; equal-time tie; fractional-time case. |
| PERF-1 | P3 | performance | `site` read all handoffs 13 times | Reports take an optional `ho` table; `build_site` reads handoffs once. |
| DOC-01 | P3 | documentation | `site/index.md` said all times are New York time | Now: generated report times are ET; times inside copied documents stay as recorded. |
| STYLE-01 | P3 | code-quality | Dense expressions in `copy_page` and long lines | Split into named steps and wrapped. |
| STYLE-02 | P3 | code-quality | `message()` in the top-level handler | `rlang::inform()`. |
| GIT-02 | P3 | version-control | Commit message "cg docs" | Not changed: the user's own commit message; recorded only. |
| LEARN | - | learnings-researcher | No action needed; supports "as recorded" Gaps and Source lines | None. |

Findings requiring revision: 17 fixed, 1 fixed by the user (GIT-01), 1
recorded without change (GIT-02, user's commit message). Accepted risks: 0.
