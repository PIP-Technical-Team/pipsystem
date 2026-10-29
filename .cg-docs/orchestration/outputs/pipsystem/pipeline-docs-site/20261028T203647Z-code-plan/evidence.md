# Pipeline Documentation Site: Planning Evidence

Capture date: 2026-10-28. Repository HEAD observed: `ad326f7ee1b7bcc1262757636efbcbc08314ecff`, branch `main`. Read contents include pre-existing uncommitted changes; SHA does not certify those changed files. No package repository read.

## Local Findings

| Evidence | Observation | Planning consequence |
|---|---|---|
| `compound-gpid.md:10-37` | Evidence workspace; portable pipeline logic; no M2 implementation from documentation task | Static documentation only; no pipeline execution or policy amendments |
| `compound-gpid.local.md:1-12` | R project; standard review default | Site tooling is JS/Lua/Markdown, not a new R pipeline; publishing raises future review to full |
| `SYSTEM_DESIGN.md:143-180` | Numbered stages and separate ALL-module output | Never infer edges from numbering; support disconnected branches |
| `SYSTEM_DESIGN.md:172-176,323-341` | Some exact dependency inputs remain Open | Missing edges are unknown, not evidence of independence |
| `SYSTEM_DESIGN.md:284-320` | Package ownership and protected decisions | Do not change package responsibilities or design policy |
| Repository root directory read | No pipeline-docs directory, package.json, Quarto project or website build configuration at root | Dedicated bounded site; no suitable existing site build observed |
| `tools/` directory | Only `pip-orchestration.mjs` | Deferred coordination helper must not be reused/executed |
| `tests/` directory and `tests/pip-orchestration.test.mjs:1-16` | Existing Node built-in test runner and synthetic fixtures | Reuse runner style only; do not execute deferred coordination suite |
| `.github/workflows/` read | Directory not found | Create only named workflow later; preserve all other .github content |
| `.gitignore:1-33` | Managed adapters ignored while workflows remain trackable | Only scoped generated-site/runtime ignore additions |
| `.cg-docs/plans/` directory; three existing Plan frontmatters | Harvest, design integration, M2 skeleton only; no site Plan collision | Named canonical Plan may be created after contract approval |
| `.cg-docs/brainstorms/` directory | No directly matching website brainstorm | No unrelated decision-artifact body needed |
| `.cg-docs/BRAIN.md:12-17` | Harvest/design/stamp topics only | No matching website Brain topic; no broad partition expansion |
| `.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md:22-31,62-71` | Approval, policy, document checks and runtime verification differ | Separate reported status, evidence and proposals; empty is unassessed |
| `.kilo/shared/review-routing.contract.md:8-14,52-60` | Publishing/install/schema changes require full route | Later ten-reviewer route; only plan critic now |
| `.kilo/shared/artifact-view.contract.md:18-39` | --no-html still requires validate-only | No generated Plan HTML this planning run |

## Executed Read-Only Commands

- `git status --short`: success, existing unrelated dirty README/wiki, agent rules/configuration, coordination reports and other untracked attempts. Preserve all.
- `git rev-parse HEAD`: `ad326f7ee1b7bcc1262757636efbcbc08314ecff`.
- `git branch --show-current`: `main`.
- `Get-Command quarto,node,npm,python,cg-render-artifact,cg-index -ErrorAction SilentlyContinue | Format-Table Name,Source -AutoSize`: Node/npm/Python/validator/index commands found; Quarto not found on PATH. This is not an exhaustive installation search.
- `node --version`: `v22.16.0`.
- No test, install, rendering, browser, pipeline or Git mutation command executed.

## Dependency References And Selected Pins

These are upstream metadata observations, not installed/tested results. All fetched 2026-10-28.

- Quarto `1.8.27`: official release API `https://api.github.com/repos/quarto-dev/quarto-cli/releases/tags/v1.8.27`; release commit `3977c9d40b46fa7ab5fc4ba38315034c3c69b8e4`.
- Portable Windows asset: `https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.27/quarto-1.8.27-win.zip`; published SHA-256 `b1d69b7abbc4664d438c85709b11170def5010b886a9f91482cb9b55f43cbd08`.
- Linux x64 asset for future remote Actions build: `https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.27/quarto-1.8.27-linux-amd64.tar.gz`; SHA-256 `bdf689b5589789a1f21d89c3b83d78ed02a97914dd702e617294f2cc1ea7387d`.
- Node baseline `22.16.0`, actually available locally. No global runtime change required.
- `@playwright/test` exact `1.56.1`: `https://raw.githubusercontent.com/microsoft/playwright/v1.56.1/packages/playwright-test/package.json`; Node requirement >=18, exact dependency playwright 1.56.1.
- Browser manifest `https://raw.githubusercontent.com/microsoft/playwright/v1.56.1/packages/playwright-core/browsers.json`: Chromium/headless-shell revision `1194`, version `141.0.7390.37`. Select Chromium only for bounded browser acceptance; no production browser dependency.
- npm registry fetch for the Playwright version returned a transport error. Upstream package and browser manifests were fetched successfully through GitHub; registry reachability and lockfile integrity resolution remain implementation setup checks.
- GitHub action refs verified by official Git ref APIs: checkout v4.2.2 `11bd71901bbe5b1630ceea73d27597364c9af683`; setup-node v4.4.0 `49933ea5288caeca8642d1e84afbd3f7d6820020`; upload-pages-artifact v3.0.1 `56afc609e74202658d3ffba0e8f6dda462b719fa`; deploy-pages v4.0.5 `d6db90164ac5ed86f2b6aed7e0febac5b3c0c03e`.

## Feasibility References

- `https://quarto.org/docs/websites/website-search.html`: built-in locally generated search index, no hosted search service necessary. Current documentation is capability guidance; behavior must be tested against pinned Quarto.
- `https://quarto.org/docs/projects/code-execution.html`: freeze is not a no-execution security boundary. Plan must use Markdown-only allowlisting, reject computational inputs/options and invoke render with execution disabled, not rely on freeze.
- Installed renderer wrapper at `C:/Users/wb384996/.compound-gpid/bin/cg-render-artifact.cmd:53-55` invokes its local Python script. Reading executable paths on C: does not authorize writes there. Validation must redirect runtime and disable bytecode before invoking.

## Proposed Design For Contract Approval

- Dedicated Quarto website with eight empty-body project pages. Titles and empty metadata lists only; filter emits explicit Not yet assessed placeholders. Separate technical maintenance page may contain substantive instructions.
- Markdown YAML metadata is the only authored summary source. Fixed renderer allowlist, Pandoc AST/Lua metadata validation and generation, local CSS/JS, no custom Markdown parser or application framework. Derived DOM attributes drive filters; Quarto provides local search. No separate hand-maintained status JSON.
- Future records require stable IDs, kind, label, dated status/claim qualification and public-safe evidence references; dependencies use explicit IDs and evidence-qualified edges, not stage-number adjacency. Unknowns, proposals, reported results and verified evidence remain separately labeled. No progress percentages.
- Empty lists render no invented dependency graph. Populated synthetic fixtures demonstrate branch/fan-in/disconnected ALL-style paths without becoming project content. Static accessible link/list representation accompanies the clickable diagram; JS is progressive enhancement.
- Node wrapper stages only exact approved authored site/config/assets/filter files into disposable runtime before invoking Quarto. No repository-root rendering, inherited hooks, resource globs, user-selected filters or computation engines. Reject symlinks/reparse escapes, unsafe includes/URLs, raw script content, execution options and metadata overrides; validate output allowlist and disclosure canaries before publication.
- Fresh per-build staging; clear only owned output with resolved-root guard. Successful validated output replaces prior output; failure leaves no publishable new artifact. Removed content must not persist in HTML/search.
- Actions builds on scoped changes or dispatch; deployment only explicit workflow_dispatch boolean, default false, trusted default branch and github-pages environment. Build token read-only; deployment-only pages/id-token write. No workflow execution or deployment authorized here.
- Local installation/cache/browser/test/log/temp paths stay under the approved E: runtime root, with environment redirects before every child. Remote hosted CI paths are explicitly separate and never executed by this planning assignment.

## Gaps

- Quarto portable installation and rendering not executed; feasible upstream distribution is verified, runtime acceptance is future required evidence.
- Browser accessibility/offline/base-path behavior, local registry access and all tests are unexecuted.
- No public project status or dependency records have been assessed. No package source, production data or remote workflow inspected/executed.
- Quarto not on PATH does not prove absent everywhere; only the planned isolated portable installation is selected.

## Final Planning Outcome

- User approved completion contract with `Approve to save and review`.
- Canonical Plan saved at `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-10-28-pipeline-docs-site.md`, revision r2, SHA-256 `139494b75970071a16177741a3697e6b4d838ab9b9ba17264daecec666abf616`.
- Exact final source validate-only passed, capture 2026-10-28T21:16:12Z. Initial requirement-list parser errors were corrected; details in plan-resolution.md.
- Restricted critic returned 1 P1 and 5 P2, all corrected and explicitly closed by r2 re-review. No significant new issues. See plan-review.md; no implementation reviewers dispatched.
- Final Git status has the same pre-existing unrelated dirty paths plus only this Plan and the assigned planning output run. Git metadata is not byte-level ownership proof; no unrelated files were edited by this caller.
- No website/runtime acceptance, install, pipeline, remote workflow or deployment check performed. HTML suppressed as requested, source validation not skipped.

## Fresh Review Outcome: 2026-10-29

- User requested fresh /cg-plan-review, all findings corrected in Plan, and readiness for /cg-work in another session. Current HEAD rechecked unchanged at ad326f7ee1b7bcc1262757636efbcbc08314ecff; unrelated dirty files preserved.
- Independent fresh critic read complete r2 and found 0 P1, 1 P2, 0 P3: advisory lookup required at review time without an authorized network route. Report maps pass-local P2.1 to stable P2.6 to preserve original finding IDs.
- r3 assigns advisory lookup to outer implementer during already authorized tooling setup, before invoking downloaded tools; source-qualified dated evidence saved privately; reviewers assess offline; material pin changes repeat lookup. Step 1/V1 enforce the requirement. No new network permission, helper, scanner or dependency.
- Re-review read complete 364-line r3 and explicitly closed P2.6; no remaining P1/P2/P3. Review and correction history saved in sibling plan-review.md / plan-resolution.md.
- Exact r3 source validate-only passed, no HTML. SHA-256 `68edebceb322f35889ea483c553df0d5d1c6216daaa08b379f2eb1fd77f64ee8`, UTC checkpoint 2026-10-29T13:11:15Z. This supersedes r2 as current execution binding.
- No website build/browser/install/advisory lookup/remote workflow/deployment executed during planning review. Existing upstream pin facts are historical observations; actual advisory evidence remains required future setup acceptance.
