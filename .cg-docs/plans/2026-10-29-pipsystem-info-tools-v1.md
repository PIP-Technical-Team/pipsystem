---
date: 2026-10-29
title: "pipsystem info tools v1"
status: active
scope: "Standard"
brainstorm: null
language: "R"
estimated-effort: "medium"
deviation-policy: "autonomous"
artifact-schema-version: 1
phases: 2
plan-revision: "r2"
execution-report: ".cg-docs/work-reports/2026-10-29-pipsystem-info-tools-v1.md"
completed-phases: [1]
tags: [pipsys, status, commands, quarto, site]
---

# Plan: pipsystem info tools v1

## Objective

One R script gives the user and every agent the same fixed-format facts about the PIP packages: per-package status, an overview, and the latest handoffs. The same script builds a minimal local Quarto site with the overview, handoffs, roadmap, design, status pages and every Plan. Four Kilo commands run the script.

Approval: the user prompt of 2026-10-29T17:19:24Z (step 4) authorizes the route `/cg-plan deviate:auto`, `/cg-plan-review`, fix all findings, `/cg-work review:auto deviate:auto`, and asks for questions only on the Autonomy list in `AGENTS.md`. That instruction replaces the `/cg-plan` contract-preview question. No branch: work stays on `main`. No roadmap registration: adding a feature is a scope change and needs a separate question.

Revision r2 fixes the three `/cg-plan-review` findings of 2026-10-29 (P1.1 Quarto state inside pipsystem, P2.1 link policy, P3.1 overview columns); review record in `.cg-docs/orchestration/outputs/pipsystem/info-tools-v1/20261029T174648Z-plan-a/plan-review.md`.

**Minimal first** (`AGENTS.md`, "Working Principles"): build the smallest version that works end to end; add a safeguard only against an almost-irreversible failure and put other ideas under Later; one check per change shows it works; use installed tools; keep the Plan to about two pages.

## Context

- Packages and paths: `ORCHESTRATOR.md`, Packages table. `pipfaker` and `metapip` paths are UNKNOWN.
- Handoffs: `.cg-docs/orchestration/outputs/<project>/<task>/<run>/handoff.md`. v2 has YAML frontmatter (`.cg-docs/orchestration/CONTRACT.md`, "Handoff Format"). v1 starts with a JSON block (`schemaVersion: pip-handoff-v1`, `taskId`, `runId`, `status`, `updatedAt`). Older reports have neither. 41 reports exist on 2026-10-29.
- Plans: `<repo>/.cg-docs/plans/*.md` with YAML frontmatter (`title`, `date`, `status`, `completed-phases`). Counts on 2026-10-29: pipsystem 5, pipdata 45, pipload 7, stamp 4, pipapi 0.
- Roadmap: `roadmap.json`, `milestones[].features[]` with `id`, `title`, `status`, `plan`.
- Time: files and IDs keep UTC; people see New York time, "ET" (`ORCHESTRATOR.md`, Tools, "Time zone"; `CONTRACT.md`, handoff rules).
- Tools observed 2026-10-29: R 4.5.2 with yaml 2.3.12, jsonlite 2.0.0, data.table 1.18.4, collapse 2.1.7, testthat 3.3.2. Quarto 1.8.27 at `E:/PovcalNet/01.personal/wb384996/tools/quarto-1.8.27/bin/quarto.cmd`. On Windows, Quarto keeps state under `LOCALAPPDATA` and `APPDATA` (`bin/quarto.js:37159-37239`).
- The user `.Rprofile` prints to standard output, so the script runs with `Rscript --no-init-file`.
- `.kilo/` is gitignored (`.gitignore:2`); the command files are not tracked, so their full text is in this Plan.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | `status <package>` prints the sections Repository, Plans, Handoffs, Gaps in this order; every section is always present and says "none" when empty. | user request 2026-10-29 |
| R2 | `overview` prints one table with one row per package and fixed columns, then a roadmap milestone summary. | user request |
| R3 | `handoffs [project]` prints the latest run per project and task: project, task, run, status, updated, next. It reads v2 and v1; other formats show UNKNOWN. | `CONTRACT.md`, Gaps |
| R4 | Every printed time is New York time, for example `2026-10-29 13:40 EDT`. | time-zone handoff 20261029T172828Z |
| R5 | `/pip-status`, `/pip-overview`, `/pip-handoffs` and `/pip-site` run the script and print its output verbatim. | user request |
| R6 | `site` regenerates the pages and renders a local Quarto website, then prints the path of `index.html`. | user request |
| R7 | All writes go to E:. Generated files are gitignored. No write to a package repository, including its `.git` folder. | global storage rule; `AGENTS.md` rule 1 |
| R8 | R with data.table; no new dependency. | `AGENTS.md` |

## Phase 1: Status script and commands

### 1. Script and reports
- **Requirements**: R1, R2, R3, R4, R7, R8
- **Files**: `tools/pipsys/pipsys.R`, `tools/pipsys/pipsys.cmd`, `tools/pipsys/packages.csv`, `tests/pipsys/test-pipsys.R`
- **Details**:
  - `packages.csv` (`package,path`): pipsystem, stamp, pipaux, pipdata, pipster, pipload, pipfun, pipapi, wbpip with the paths in `ORCHESTRATOR.md`; `pipfaker` and `metapip` with an empty path.
  - `pipsys.cmd`: set `TEMP`, `TMP` and `TMPDIR` to `<repo>/.tmp/pipsys` (create it), run `Rscript --no-init-file "%~dp0pipsys.R" %*`, return its exit code.
  - `pipsys.R` functions: `repo_info(path)` uses `git -C <path> --no-optional-locks` for branch, short HEAD, HEAD time (`%ct`) and the count of `status --porcelain` lines, and reads `Version` from `DESCRIPTION` (`none` if absent); `read_frontmatter(file)` returns the YAML list or `NULL`; `plan_table(path)`; `read_handoff(file)` (v2, then v1, else UNKNOWN; v1 `next` is the first non-empty line under `## Recommended Next Action`, cut to 100 characters); `handoff_table(outputs_dir, project)` keeps the latest run per project and task by `updated`, then run ID, and skips `runtime/` folders; `fmt_et(x)`; `md_table(dt)` escapes `|` and prints "none" for zero rows; `report_status()`, `report_overview()`, `report_handoffs()`; `main(args)`. An unknown package or subcommand prints the valid names and exits 1. Each report starts with `# <title>` and `Generated <ET time> by pipsys v1`.
  - Overview table columns, in this order: `package`, `branch`, `head`, `head_date` (ET), `uncommitted`, `version`, `open_plans` (Plans not `completed`), `last_handoff` (status and ET time of the newest run). One row per line of `packages.csv`; a package with an empty or missing path shows `UNKNOWN` in `branch` and `-` in the other columns. The roadmap summary follows: `milestone`, `status`, `features_done` (`done/total`).
  - Status, Plans section: counts by status, then one row for each Plan that is not `completed` (file, title, status, date, completed phases).
  - Status, Gaps section: always names the limits, for example "statuses are as recorded, not verified", unreadable frontmatter files, handoffs of unknown format, unknown path.
  - `main()` runs only when `sys.nframe() == 0`, so the tests can `source()` the script.
- **Test Scenarios**: v2, v1 and other handoffs; latest-run choice; EDT (2026-10-29) and EST (2026-11-02) output; malformed frontmatter; a temporary Git repository with `DESCRIPTION` and one uncommitted file; unknown package; package with an empty path; the overview header has the columns above in order and one row per configured package.
- **Tests**: `tests/pipsys/test-pipsys.R`
- **Acceptance criteria**: the tests pass; `status pipdata`, `overview` and `handoffs` exit 0 on the real workspace and print their headings in order.

### 2. Commands
- **Requirements**: R5
- **Files**: `.kilo/commands/pip-status.md`, `.kilo/commands/pip-overview.md`, `.kilo/commands/pip-handoffs.md`
- **Details**: each file has a `description` frontmatter line and the body in "Command body" below, with its own subcommand (`status $ARGUMENTS`, `overview`, `handoffs $ARGUMENTS`).
- **Test Scenarios**: not applicable (static text).
- **Tests**: the step 1 runs of the same subcommands.
- **Acceptance criteria**: the three files exist with this text.

Command body:

```text
Run this exact command with the shell tool, in the pipsystem root
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem:

tools\pipsys\pipsys.cmd status $ARGUMENTS

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
```

## Phase 2: Site

### 3. Site pages and render
- **Requirements**: R4, R6, R7
- **Files**: `tools/pipsys/pipsys.R`, `site/_quarto.yml`, `site/index.md`, `.gitignore`, `tests/pipsys/test-pipsys.R`
- **Details**:
  - `_quarto.yml`: website project, `output-dir: _site`, title "pipsystem", `sidebar: contents: auto`, HTML with a table of contents.
  - `index.md`: says the site is local and generated, and links to the overview, handoffs, roadmap and design pages.
  - `site` subcommand: delete and recreate only `site/gen/`, after checking that the resolved path ends in `pipsystem/site/gen`. Write `gen/overview.md`, `gen/handoffs.md`, `gen/roadmap.md` (every milestone and feature), `gen/design.md` (`SYSTEM_DESIGN.md` with a title block), `gen/status/<package>.md`, and `gen/plans/<project>/<file>.md` for every Plan of every repository with a path. Each Plan copy gets new frontmatter with only `title` and `subtitle` (`<project> · <status> · <date>`), and a first line `Source: <absolute source path>`.
  - Link policy for copied pages (design and Plans): a Markdown link with a relative target (not `http:`, `https:`, `mailto:`, `#` or `file:`) becomes an absolute `file:///` link to the original target, resolved from the source file's folder. The link then opens the source file on disk. This is the only body change.
  - Render: inside R, set `LOCALAPPDATA`, `APPDATA` and `DENO_DIR` to `<repo>/.tmp/pipsys/quarto-home/{local,roaming,deno}` (create them), then run `quarto render <site>`. The Quarto path comes from the environment variable `PIPSYS_QUARTO`, default above. Print the page count, the render exit code and the path of `site/_site/index.html`.
  - `.gitignore`, outside the Compound GPID blocks: `/site/gen/`, `/site/_site/`, `/site/.quarto/`, `/.tmp/pipsys/`.
- **Test Scenarios**: a Plan copy drops the original frontmatter keys (for example `language`); a relative link becomes a `file:///` link and an `https:` link stays unchanged; the `gen` guard refuses another path; a missing Quarto path gives a clear error.
- **Tests**: `tests/pipsys/test-pipsys.R`; the real `pipsys.cmd site` run.
- **Acceptance criteria**: render exit 0; `site/_site/index.html` exists; one HTML page per Plan; the rendered design page has a `file:///` link to a brainstorm; `git status` shows no generated file.

### 4. /pip-site
- **Requirements**: R5
- **Files**: `.kilo/commands/pip-site.md`
- **Details**: the step 2 body with `tools\pipsys\pipsys.cmd site`, plus "use a shell timeout of 600000 ms".
- **Test Scenarios**: not applicable (static text).
- **Tests**: the step 3 run.
- **Acceptance criteria**: the file exists with this text.

## Testing Strategy

Unit tests: with `TEMP`, `TMP` and `TMPDIR` set to `.tmp/pipsys`, run `Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"`. End to end: run the four subcommands on the real workspace.

## Documentation Checklist

- Usage comment at the top of `pipsys.R`.
- `site/index.md` explains what the site is.

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| A Plan body breaks the Quarto render | Frontmatter is replaced and `.md` files run no code. If a file still fails, fix the cause during `/cg-work` and record it. |
| Quarto writes to C: | Redirect `LOCALAPPDATA`, `APPDATA` and `DENO_DIR`; V4 checks the C: Quarto folder after the render. |
| `git status` writes a package's `.git/index` | `--no-optional-locks` on every Git call. |
| Untracked command files are lost | Their full text is in this Plan. Later: track them in Git. |
| The site shows internal package Plans | The site stays local and is not published. |
| Links in copied pages break | Relative links point to the source files with `file:///`. Later: link Plans to their site pages. |

## Out of Scope

Publishing, CI, a privacy filter, a preview or watch server, roadmap registration, the dependency map (Plan C), the documentation agents (Plan B), and any package repository change.

**Later:** track `.kilo/commands/pip-*.md` in Git; preview server; publishing with a privacy filter; link roadmap features to packages; cache Git calls if the overview is slow.

## Completion Contract

### Outcome

The four subcommands run on the real workspace with exit 0, the unit tests pass, and `site/_site/index.html` opens a site with the overview, handoffs, roadmap, design, status pages and every Plan.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|----|-------|-------------------|------------------|----------|
| V1 | 1 | Unit tests pass | `testthat::test_file('tests/pipsys/test-pipsys.R')` | yes |
| V2 | 1 | `status pipdata`, `overview`, `handoffs` exit 0 with headings in order | `tools\pipsys\pipsys.cmd <subcommand>` | yes |
| V3 | 2 | Render exit 0; `index.html` exists; HTML page count under `gen/plans` equals the Plan count; design page has a `file:///` link | `tools\pipsys\pipsys.cmd site` | yes |
| V4 | final | `C:\Users\wb384996\AppData\Local\quarto` LastWriteTime is unchanged (2026-03-11) and `C:\Users\wb384996\AppData\Roaming\quarto` does not exist | `Get-Item` | yes |
| V5 | final | Only intended files changed; no generated file in `git status`; package repositories show the same `git status --porcelain` count as before | `git status --short`; `git -C <pkg> --no-optional-locks status --porcelain` | yes |
| V6 | final | The four commands appear in a fresh Kilo session | fresh session | no |

### Constraints

| ID | Constraint | Check |
|----|------------|-------|
| C1 | No package repository change | V5 |
| C2 | All writes on E: | V4; paths in code |
| C3 | Files keep UTC; output shows ET | V1 |
| C4 | Unrelated dirty pipsystem files stay as they are | `git diff --stat` before and after |

### Boundaries

- Allowed: the files named in the steps; `.tmp/pipsys/` (temporary files and Quarto state). Quarto itself is read from `E:/PovcalNet/01.personal/wb384996/tools/quarto-1.8.27` and not changed.
- Out of scope: everything in Out of Scope above; protected design, roadmap and charter files.

### Iteration Policy

1. Deviation policy `autonomous`: make a justified deviation and record it in the work report.
2. At most two fix attempts per failing step, then record the failure and continue.
3. Fix all review findings P0-P3 within this scope, then rerun the affected checks.

### Blocked-Stop Conditions

- The render needs a tool that is not installed.
- A write to C: outside the allowed list is detected.
- The work needs a change in a package repository.
