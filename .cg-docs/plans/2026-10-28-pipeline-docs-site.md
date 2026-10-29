---
date: 2026-10-28
title: "PIP Pipeline Documentation Site"
status: superseded
superseded-date: 2026-10-29
superseded-by: "Plan A, pipsystem info tools v1 (minimal local Quarto site and /pip-site)"
scope: "Deep"
brainstorm: null
language: "R"
estimated-effort: "large"
deviation-policy: "autonomous"
artifact-schema-version: 1
phases: 3
plan-revision: "r3"
execution-report: ".cg-docs/work-reports/2026-10-28-pipeline-docs-site.md"
tags: [pipeline-documentation, quarto, website, accessibility, evidence, publishing]
---

# Plan: PIP Pipeline Documentation Site

> **Superseded on 2026-10-29. Do not execute.** The user replaced this Plan
> with a minimal local Quarto site that shows all Plans, built under Plan A
> ("pipsystem info tools v1"). No phase of r3 was implemented. Closing record:
> `.cg-docs/orchestration/outputs/pipsystem/close-website-plan-r3/20261029T173700Z-close/handoff.md`.

## Objective

Build a small Quarto documentation website for the PIP pipeline, with eight initially empty project-content pages, evidence-qualified metadata, generated visual summaries, local search and filters. This is not a pipeline execution interface, an agent-operations site, a second task register, or a new source of policy.

Planning approval: the user selected `Approve to save and review` for the completion-contract preview on 2026-10-28. This approves saving, validation, critic review and up to two correction/re-review rounds, not implementation, Git mutations, deployment or repository settings changes. Implementation requires a subsequent explicit `/cg-work` instruction covering this exact reviewed revision.

Follow-up approval: on 2026-10-29 the user explicitly requested a fresh `/cg-plan-review`, correction of all findings in this Plan and readiness for `/cg-work` in another session. Revision r3 resolves that pass's advisory-check timing/authority finding; no implementation starts from this review/correction instruction. Prior r1/r2 review history remains in the assigned planning reports.

## Context

- Repository root `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`; observed HEAD `ad326f7ee1b7bcc1262757636efbcbc08314ecff`; branch main. Unrelated dirty README/wiki, agent/configuration and coordination artifacts must be preserved. Planning stays on main; no branch/stash/staging/commit/push is authorized. Optional future branch `docs/pipeline-site` needs direct authorization, not a Plan inference.
- Charter `compound-gpid.md:10-37`: incremental pipeline design and evidence workspace; PIP execution belongs in packages. This site supports documentation and does not start M2 or alter Current Focus.
- `SYSTEM_DESIGN.md:143-180` gives stage labels, not a complete edge list; ALL processing is separate. `:172-176,323-341` retains unknown lineup/missing-country inputs. `:284-320` fixes ownership and evidence rules. No numbered-stage linear chain or new policy may be inferred.
- Root, tools, tests and workflows directory reads found no existing site or Quarto build. `tools/` contains only the deferred coordination helper. Do not run or reuse that helper. `tests/pip-orchestration.test.mjs:1-16` supplies a Node built-in runner/fixture style only, not an authorized regression suite for this task.
- No matching site Plan/brainstorm exists among the three Plans and seven brainstorms observed. Brain index `.cg-docs/BRAIN.md:12-17` has no website topic. No remote team-brain pull/index rebuild was run: it is unnecessary to this bounded source research and can create network/cache side effects.
- Relevant learning: `.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md:22-31,62-71` separates policy, approval, document validation and runtime evidence. Empty site content must remain unassessed.
- Tool discovery: Node `v22.16.0` actually observed; npm, Python, `cg-render-artifact` available; Quarto not on PATH. Portable distribution feasibility verified upstream, not an installed/rendered pass. No package repository read; inherited package SHAs in design documents are not current package checks.
- Evidence and upstream URLs/checksums: `.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028T203647Z-code-plan/evidence.md`. Registry fetch initially failed transport; GitHub Playwright package/browser manifests succeeded. npm reachability is a setup acceptance check, not an assumption of successful installation.
- Project language frontmatter remains R; implementation files here are Markdown/YAML, JavaScript, CSS and Pandoc Lua. No R dependency or R code is added.

## Requirements

| ID | Requirement | Source |
|----|-------------|--------|
| R1 | Eight named project pages have empty authored bodies; titles/metadata only, useful navigation and Not yet assessed output | User content skeleton and empty-state requirements |
| R2 | Reuse Quarto Markdown rendering and local assets with minimal dependencies; no custom Markdown parser/framework | User preferred solution |
| R3 | One editable Markdown metadata source generates dated, evidence-qualified cards/diagrams; no separate task register or authored status dataset | User living-documentation requirements; evidence learning |
| R4 | Topology supports branches/fan-in/separate ALL path and unknown dependencies without inferred sequential edges | User; SYSTEM_DESIGN.md:143-180,323-341 |
| R5 | Search, package/stage/status filters, responsive accessible controls and no-JS reading | User interaction requirements |
| R6 | Local build/localhost preview, offline browser operation and project-site base paths are tested and documented | User acceptance requirements |
| R7 | Rendering never executes R/PIP/pipeline work; safe input/output allowlists prevent private-content publication | User safety requirements; charter constraints |
| R8 | Stale output/search removed; malformed/unsafe metadata and build failures fail safely | User acceptance requirements |
| R9 | Single least-privilege site-only Actions workflow; deploy only on explicit manual choice; no publication now | User workflow requirements |
| R10 | Exact pins, E:-bounded local runtime, isolated synthetic fixtures, maintainable build/preview instructions | User reproducibility/write-set requirements |
| R11 | Preserve protected/unrelated files; exact lifecycle/report/reviewer permissions, all-phase execution and final verification | User execution/review requirements; installed contracts |

## Design Decisions

### Sources And Metadata

The eight project-content files are `pipeline-docs/index.md`, `roadmap.md`, `stages.md`, `packages.md`, `next-steps.md`, `open-questions.md`, `decisions.md`, `validation.md`. Initially each contains only YAML `title` and `pipeline-docs: {schema: 1, records: []}`; no project prose, live assessment, staged graph nodes or synthetic statuses. Create maintenance.md, minimal CSS and no-op JS in Phase 1 so the entire fixed staging inventory exists before the first render. Later phases enhance these existing files. Add substantive technical instructions separately in `pipeline-docs/maintenance.md` and `tools/pipeline-docs/README.md`; no root README/wiki edit.

Metadata lives in the appropriate page frontmatter, under `pipeline-docs.records`. Use ordinary YAML parsed by bundled Pandoc, not a new parser. The filter reads the eight fixed source files with `pandoc.read(..., 'markdown')`, validates the complete combined record set before emission, and builds every diagram/card/filter attribute from it. No editable JSON snapshot or manually duplicated HTML data. Generated search.json, HTML and DOM attributes are disposable views. Non-owning pages can summarize records by kind using the same in-memory combined set.

| Field | Contract |
|---|---|
| `id`, `kind`, `label` | Required nonempty strings; id globally unique `[a-z][a-z0-9-]*`; kind one of milestone, stage, package, next-step, question, decision, validation; labels plain text, maximum 160 characters |
| `summary` | Plain text, maximum 2000 characters; no raw HTML, includes or executable syntax |
| `status` | not-assessed, proposed, planned, in-progress, blocked, complete; missing becomes not-assessed, never complete |
| `qualification` | unknown, proposal, reported, verified; independent of status; missing becomes unknown |
| `as-of` | ISO calendar date required for every nonempty assessment; reject impossible/future dates relative to explicit build assessment date; do not invent today's date for content |
| `evidence` | List of public-safe HTTPS URL plus locator and revision strings. Verified qualification requires at least one evidence entry and explicit revision; full 40-hex SHA for repository-backed claims. Evidence URLs do not prove actual test success; label author-qualified verification visibly |
| `package`, `stage` | Optional references to existing package/stage IDs; invalid reference fails. These supply filter options; no hardcoded status arrays separate from schema |
| `depends-on` | Omitted means dependency knowledge unassessed; explicit [] means author explicitly assessed no parents; populated list holds `{id, qualification, evidence}`. Validate targets, duplicates, self-edges and cycles; only explicit edges render; proposal edges visibly dashed/labeled |
| `lane` | Optional plain label for display grouping only, not an inferred edge or execution priority; supports an ALL lane |

Unknown keys/types, oversized lists (>500 records or >2000 edges total), duplicate IDs/anchors, invalid date/enums, unsupported schema or unsafe URLs fail with source filename/field error before a publishable build. Use deterministic page/record ordering. `complete` plus `reported` remains reported, not verified. No progress percentages, no empty "no blockers" claim, no auto-refresh/current-status inference. Qualify stale dates visibly by showing as-of, not by inventing expiry policy. Website summaries are not approvals or canonical task state.

Evidence must be deliberately authored public-safe references; never import internal .cg-docs/notes/handoffs to populate pages. Initially there are no evidence links. Reject absolute workstation/file URLs, .cg-docs/session/credential/production references and links escaping the public site; support only site-relative page/anchor links and explicitly public HTTPS references. Links to unknown/private evidence must instead remain a plain unknown assessment until sanitized public evidence exists. No network checking during rendering.

### Presentation

Use Quarto sidebar/navbar navigation with locally bundled font stack and CSS, not remote fonts, analytics, Algolia or CDN assets. Native locally generated Quarto search indexes rendered text. Lua emits semantic static record sections/cards, anchors and a deterministic clickable inline SVG DAG with a nearby full linked dependency list/table. Use validated explicit edges only; lay out by topological level and stable ID within lanes. Links lead to canonical record anchors on owning pages; unknown dependency knowledge is explicit. Diagram is supplemental; static list and all record content work without JavaScript.

Local `site.js` progressively enables native labeled select controls for package, stage and status, reset button, result count with polite live region and no-match state. Combine filters by AND; blank means all; unknown records remain discoverable. Keep filter controls hidden/disabled until JS initialization, not a dead UI without JS. Quarto search is JS-enhanced; no-JS fallback is navigation and static pages plus explicit search-unavailable text. Keyboard focus, Escape/search focus return, skip link, visible non-color-only status, reduced motion and readable small-screen SVG overflow are required. No custom chart dependency is needed.

### Build Isolation And Failure Semantics

`site.mjs` is a small Node CLI, not a general build framework. Commands: init, build, preview, check-output. Build requires --runtime, --base-path and --assessment-date YYYY-MM-DD, with no implicit date; validate a real UTC calendar date. Receipts record that date, and output checks require the same value. Local instructions/tests use explicit 2026-10-28; remote CI computes UTC date once at job start, passes it explicitly and records it. Fixed fixtures test before/on/after that reference date. Never synthesize content as-of from the build date. No arbitrary Quarto options or shell strings.

Use spawn argument arrays with shell:false for actual executables. Windows Quarto's trusted .cmd launcher is the one narrow exception requiring a command interpreter: spawn the verified system cmd.exe with /d /s /c and windowsVerbatimArguments:true, passing one correctly quoted fixed command string for the verified QUARTO_BIN and fixed render/Pandoc argument vocabulary. The interpreter itself is launched with shell:false. Validate paths/arguments before constructing this one string; support spaces but reject quotes, percent/exclamation expansion, control characters and cmd metacharacters (& | < > ^ parentheses) in launcher/runtime paths. Do not concatenate metadata, arbitrary filenames/options or user shell input. Add actual pinned Quarto smoke tests with runtime subdirectory `cases/path with spaces`; document supported path restrictions. Linux uses the verified executable directly with shell:false. No general shell runner. Existing system executables may be read on C:; every local writable path must resolve E:. Guard runtime/output roots against filesystem roots, checkout root, source directories, parent traversal and symlink/reparse escapes. Refuse concurrent use of one runtime root via exclusive owned lock; independent test builds get distinct runtime subdirectories. Never remove an unowned root or another attempt's outputs.

Stage exactly eight project pages, maintenance.md, the trusted _quarto.yml, local CSS/JS and the trusted Lua filter from the approved source paths. No directory-wide copy, implicit resource glob, repository-root render or inherited pre/post render hooks. Staged project is under runtime, away from parent Quarto configuration. Quarto config uses `project.type: website`, exact render filenames, local resources only, `execute.enabled: false`; invoke `quarto render <staged-project> --no-execute`. Disable source downloads, code tools, external math/assets, remote includes and executable shortcodes. Reject computational files/options/engines, unapproved filters/hooks/resources/includes and unsafe raw HTML. Validate frontmatter and Pandoc AST before the render step; plain code examples in maintenance docs are nonexecuting.

Trusted filter reads only fixed staged files; user metadata cannot override filters, hooks, include paths, project settings or resource selection. Preflight fixture canaries include R fenced chunks, inline execution, include/shortcode attempts, shell hooks, arbitrary resource globs, raw script/event-handler HTML and absolute/path traversal links. The documented supported build/preview route always uses this preflight; direct Quarto bypass is unsupported and must not appear as a safe maintenance command.

Each build starts a fresh owned staging/output directory, then checks links, assets, search and disclosure allowlists. `runtime/site` is the last successful output, replaced only after validation. Before any new build, invalidate `runtime/publish-ready.json`; on failure retain last successful site for reading but do not issue a current publish-ready receipt. Receipt binds current input SHA-256, output manifest SHA-256, base path, explicit assessment date and successful checks; check-output rehashes actual bytes and checks the expected date. Actions uses a fresh runtime and uploads only a successfully checked `runtime/site` with matching receipt, not the receipt itself. No stale fixture, page, asset or search entry may persist into the new build.

Use explicit generated asset families from pinned Quarto (site_libs/** plus local assets) and the nine HTML pages/search.json; validate actual output manifest after first pinned render and lock the expected families in tests. Reject Markdown, YAML, scripts other than approved browser assets, source maps exposing workstation paths, hidden files, symlinks, arbitrary attachments and private canaries. Never include .cg-docs or authored sources in publication. Browser request capture is an additional required disclosure/dependency check, not replaced by filename checks.

### Pins And Installation

| Dependency | Pin / verification | Purpose |
|---|---|---|
| Node | 22.16.0, observed installed | Node CLI and built-in tests; CI uses same exact version |
| Quarto Windows | 1.8.27 portable zip; SHA-256 b1d69b7abbc4664d438c85709b11170def5010b886a9f91482cb9b55f43cbd08 | Local renderer including bundled Pandoc/Lua/browser libraries |
| Quarto Linux x64 | 1.8.27 tar.gz; SHA-256 bdf689b5589789a1f21d89c3b83d78ed02a97914dd702e617294f2cc1ea7387d | Future remote hosted CI renderer |
| @playwright/test | exact 1.56.1, no caret; generated committed lockfile with npm integrity | Browser acceptance only, never a browser runtime dependency |
| Chromium | Playwright revision 1194; 141.0.7390.37 | Deterministic bounded browser suite |
| actions/checkout | 11bd71901bbe5b1630ceea73d27597364c9af683 (v4.2.2) | Future remote checkout, persist-credentials false |
| actions/setup-node | 49933ea5288caeca8642d1e84afbd3f7d6820020 (v4.4.0) | Future remote exact Node |
| actions/upload-pages-artifact | 56afc609e74202658d3ffba0e8f6dda462b719fa (v3.0.1) | Upload checked site directory only |
| actions/deploy-pages | d6db90164ac5ed86f2b6aed7e0febac5b3c0c03e (v4.0.5) | Manual deployment job only |

Official release URL prefix `https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.27/`; filenames `quarto-1.8.27-win.zip`, `quarto-1.8.27-linux-amd64.tar.gz`. Pin sources/action refs were fetched via official GitHub APIs; see planning evidence. These are explicit reproducibility selections, not latest/security certification. During authorized tooling setup, before invoking the downloaded tools, the outer implementer performs bounded read-only advisory lookups for the selected Node, Quarto, Playwright/Chromium and action pins using their official security/release notices and applicable GitHub Advisory Database entries. Record capture date, sources, queried pins, applicability assessment and any unavailable source/coverage limit in the existing private implementation evidence.md. No credentials, new scanner/helper, global changes or automatic upgrade. Reviewers later assess this saved evidence offline; network access is not granted to reviewers or to rendering/tests. Material pin changes require the outer implementer to repeat this setup advisory check for changed pins and update the saved evidence before using them. A known material vulnerability affecting this use blocks completion and requires a justified in-scope pin correction; if no safe verified pin can be selected within scope/budget, stop the affected action. Do not claim absence of advisories proves security or present an unavailable required lookup as passed.

No installer, global npm install, R packages, external Quarto extension, new YAML parser, diagram library or web framework. Local portable extraction goes under runtime/tools/quarto-1.8.27, downloads under runtime/downloads; verify archive checksum before extraction/invocation. Do not execute MSI. Validate extracted paths remain under destination and reject archive traversal/reparse entries. Windows Expand-Archive and Linux tar are permitted only for checksum-verified official archives into fresh owned directories.

Author `tools/pipeline-docs/package.json` and generated `package-lock.json`. Generate the initial lock in runtime/node-deps using npm --package-lock-only --ignore-scripts --no-audit --no-fund, verify the exact Playwright dependency graph/integrities and promote only that generated lock into the authored tool directory. Later setup copies those two files into runtime/node-deps and runs npm ci there, not in the repository root. Browser tests/config use Node createRequire anchored at runtime/node-deps/package.json to load @playwright/test; no NODE_PATH or symlink trick. Install only Chromium through its pinned CLI with PLAYWRIGHT_BROWSERS_PATH redirected. Network is allowed solely during explicitly authorized tooling setup; render, preview, output checks and browser use require no external network.

## Implementation Steps

## Phase 1: Isolated Build And Metadata

### 1. Pin Tooling And Create Safety Tests
- **Requirements**: R2, R7, R10, R11
- **Files**: tools/pipeline-docs/package.json, package-lock.json, site.mjs; tests/pipeline-docs/build.test.mjs; runtime paths below.
- **Details**: Capture fresh Git/path baseline, initialize unique runtime, redirect child environments, verify tools/pins/checksums and perform the outer-owned advisory lookup during authorized network-enabled tooling setup as specified above; save dated applicability evidence for later offline reviewers. Establish red-phase tests for source allowlist/path escape/lock behavior before implementing CLI. Structural file creation needs no fake failing baseline. Preserve unrelated changes and do not execute orchestration tests.
- **Test Scenarios**: valid portable renderer; missing pin; bad checksum; existing runtime ownership collision; C:-resolved/junction output; traversal and concurrent build.
- **Tests**: setup commands below; node --test tests/pipeline-docs/build.test.mjs.
- **Acceptance criteria**: pinned renderer/browser installation succeeds under E:, environment audit and isolated CLI safety tests pass; dated setup advisory evidence covers selected pins, with no unresolved material applicable vulnerability or silently omitted required source. Installation failure never falls back to C: or global configuration.

### 2. Define Empty Skeleton And Metadata Validation
- **Requirements**: R1, R3, R4, R7, R8
- **Files**: eight project pages; pipeline-docs/_quarto.yml; pipeline-docs/maintenance.md scaffold; pipeline-docs/assets/site.css minimal base; pipeline-docs/assets/site.js no-op scaffold; tools/pipeline-docs/metadata.lua; tests/pipeline-docs/fixtures/**; build.test.mjs.
- **Details**: Validate fixed-file metadata/AST through bundled Pandoc before Quarto rendering; filter reads all eight staged files, validates references/dates/edges and emits empty-state component when empty. AST parsing is bundled tooling reuse, not a Markdown parser implementation. Empty bodies remain empty in authored files.
- **Test Scenarios**: empty input; missing page; invalid YAML; duplicate IDs; invalid dates/type; cycle/dangling edge; unknown versus explicit empty dependencies; reported-complete versus verified-complete.
- **Tests**: node --test tests/pipeline-docs/build.test.mjs; fixture validation using pinned Pandoc through CLI.
- **Acceptance criteria**: malformed inputs fail with actionable source/field errors; all empty records are unassessed; no topology/status is inferred.

### 3. Render Through Fresh Allowlisted Staging
- **Requirements**: R1, R2, R6, R7, R8, R10
- **Files**: site.mjs; _quarto.yml; build.test.mjs; runtime/staging, site, publish-ready.json.
- **Details**: Build only fixed staged project, disable execution, preflight unsafe content, validate generated output and implement receipt/failure semantics. Add scoped ignore entries for generated local artifacts only; do not change existing ignore rules.
- **Test Scenarios**: empty successful render, forbidden resource/canary, executable snippets never spawn R, failed build after previous success, removed page/search content, tampered receipt/output, unrelated files untouched.
- **Tests**: node tools/pipeline-docs/site.mjs build --runtime "$R" --base-path / --assessment-date 2026-10-28; node --test tests/pipeline-docs/build.test.mjs.
- **Acceptance criteria**: complete nine-page/config/filter/CSS/JS staging inventory exists and renders; unassessed states/navigation visible; current receipt only after successful safe output checks. Pinned Windows launcher including paths with spaces and explicit date validation tests pass. V1-V3 pass before phase completion.

## Phase 2: Progressive Presentation And Browser Acceptance

### 4. Generate Cards And Nonlinear Diagrams
- **Requirements**: R3, R4, R5
- **Files**: metadata.lua; pipeline-docs/assets/site.css; fixtures/valid/**; tests/pipeline-docs/site.spec.mjs.
- **Details**: Render accessible static cards/SVG and equivalent linked dependency list from shared metadata, not a second authored dataset. Design a restrained technical reference style, strong typography and non-color-only evidence/status labels. Keep the production skeleton empty.
- **Test Scenarios**: synthetic branch/fan-in and disconnected ALL-style lane; proposal edges; unknown parent list; 500-record limit; hostile labels; repeated anchors; no records.
- **Tests**: browser suite below against isolated synthetic copy and empty site.
- **Acceptance criteria**: every card/node has valid canonical link; only explicit qualified edges render; empty site has no invented graph or percentage.

### 5. Add Local Filters And Search
- **Requirements**: R3, R5, R6
- **Files**: pipeline-docs/assets/site.js; _quarto.yml; metadata.lua; site.spec.mjs.
- **Details**: Replace Phase 1's no-op JS scaffold with progressively enabled native controls and DOM-based AND filtering/reset/count. Use native Quarto local index/search, no hosted provider. Search and visual components index the same rendered records, including qualification/as-of text.
- **Test Scenarios**: each filter/combination/reset/no-match/unknown; keyboard select; search title and unique synthetic summary; search destination anchor/focus; empty index; labels with punctuation.
- **Tests**: pinned Playwright CLI/config/site.spec.mjs.
- **Acceptance criteria**: search/filter workflows succeed without external requests or independent data maintenance; no dead no-JS controls.

### 6. Verify Accessible Offline Hosting And Rebuilds
- **Requirements**: R5, R6, R7, R8, R10
- **Files**: site.mjs preview/check-output; tests/pipeline-docs/playwright.config.mjs; site.spec.mjs; build.test.mjs.
- **Details**: Static localhost server binds only 127.0.0.1, serves checked generated site, denies traversal/symlinks and maps root/project base path. Does not watch or rerender arbitrary source on requests. Test at 1440x900 and 390x844; JS-disabled reading and full external-request blocking.
- **Test Scenarios**: root and /pipsystem/ prefixes; relative assets, search, hash navigation; Tab/Enter/Escape/focus return, skip link, live regions; no-JS static links/text; external network aborted; rebuild removes stale search/card; failed build receipt invalidation.
- **Tests**: complete build and browser suites; check-output; preview smoke tests. Browser tests start/stop their own bounded server and child trees via test hooks.
- **Acceptance criteria**: V4-V8 pass. Automated accessibility checks plus saved focused visual/keyboard observations substantiate accessibility; do not claim full WCAG certification. file:// is unsupported for enhanced search/filters and documented as such; localhost is the supported local mode.

## Phase 3: Publication Guardrails And End-To-End Verification

### 7. Add Site-Only Workflow And Maintenance Instructions
- **Requirements**: R6, R7, R9, R10, R11
- **Files**: .github/workflows/pipeline-docs.yml (new only); tests/pipeline-docs/workflow.test.mjs; pipeline-docs/maintenance.md; tools/pipeline-docs/README.md; scoped .gitignore additions.
- **Details**: Workflow triggers push/PR path filters restricted to pipeline-docs/**, tools/pipeline-docs/**, tests/pipeline-docs/** and itself; workflow_dispatch input deploy boolean defaults false. Build job uses permissions contents:read, persist-credentials:false, fresh runtime, pinned actions/archives/Node and no secrets, runs same safe build/tests/check-output. Compute ASSESSMENT_DATE once using date -u +%F at job start, validate/pass --assessment-date explicitly to build/check-output and bind receipts/evidence. No pull_request_target, branch push, repository-wide Quarto render, untrusted output command interpolation or artifact of checkout root. Remote hosted CI uses ubuntu-24.04 and runner.temp explicitly; this is future user-triggered remote execution, not permission for local non-E: writes or running Actions now.
- **Details**: Deployment job exists only for workflow_dispatch with inputs.deploy == true and ref == refs/heads/<repository-default-branch>, uses environment github-pages, pages:write/id-token:write only there, depends on successful build/output verification. Upload only validated runtime/site; build-only path may upload that generated artifact but cannot deploy. No configure-pages/settings mutation. Resolve default-branch name via read-only metadata at implementation preflight; never assume it from stage numbering or a hardcoded main if metadata disagrees. Use repository name to build project base path, tested with pipsystem fixture. Document separate future user decision to enable Pages/settings and dispatch deployment; no workflow execution now.
- **Test Scenarios**: automatic/PR/dispatch-false never deploy; dispatch-true wrong ref never deploy; correct dispatch requires build success; token permissions scoped; hidden/canary/source fixture cannot enter uploaded directory; no source archive or private metadata.
- **Tests**: node --test tests/pipeline-docs/workflow.test.mjs; same output checks; inspect workflow via fixed expected-structure assertions and event/ref truth table. This proves local workflow structure/guards, not a successful remote deployment.
- **Acceptance criteria**: V9-V11 pass; technical instructions contain exact tested portable commands, pins, public-evidence editing guidance and offline/file:// limitations. Public maintenance accepts a caller-supplied E: runtime root (illustrative E:/pipeline-docs-work only, not permission for this worker to write there); tests substitute the approved runtime/cases/public-docs root and execute that recipe. Only private reports record actual workstation/internal report paths; never copy the private Testing Strategy root into published maintenance. Scan the actual workstation prefix, .cg-docs/orchestration fragments and synthetic canaries out of all final HTML/search/assets. Existing workflows/wiki/config/design stay unchanged.

### 8. Full Review, Corrections And Verification
- **Requirements**: R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11
- **Files**: all task-owned source/tests/docs; exact lifecycle and reporting artifacts below.
- **Details**: The independently authorized outer caller controls final lifecycle ordering. After Steps 1-7 pass, invoke the native cg-work Step 3.9 review:auto routing stage exactly once as this Step 8's authoritative review dispatch; publishing/install/schema selects full. Its review content/dispatch follows /cg-review full using cg-code-quality, cg-testing, cg-documentation, cg-version-control, cg-reproducibility, cg-performance, cg-architecture, cg-data-quality, cg-learnings-researcher and cg-adversarial. Record dispatch and report identity in the execution report; this is execution of the automatic handoff stage early, not a separate initial full review plus another automatic handoff. Hold phase-3/final completion writes behind V12; do not invoke a second whole cg-work finalizer that would repeat the automatic stage. After corrections and verification, outer caller performs native evidence checks and permitted lifecycle writes in their required order. If the active host forces duplicate dispatch or completion before final evidence and cannot execute this outer stage ordering, report that host limitation as blocked; do not claim a supported dedup flag or alter installed commands. Each actual review within the two-round budget has a unique saved identity.
- **Details**: Save canonical review before fixes; invoke /cg-fix-triage P0 P1 P2 P3 bound to that exact saved review; address ALL applicable findings and affected/full site regression tests. Its installed command protects .github and .cg-docs beyond finding statuses: workflow fixes and execution/report/lifecycle updates are performed by the independently authorized outer Code caller outside that restricted subworkflow, never by reviewers or permission override. No roadmap/strategic doc fix is authorized. Finish with the /cg-review mode:verify selection preflight: inspect only date/type/findings/parent/plan metadata needed to reproduce native selection (cg-review.md:86). Continue native light verify only when its selected parent is this task's canonical review and it has fixed entries; save the exact task verify artifact. Never use an unrelated parent or suppression context.
- **Details**: If this task had no findings/fixes, or native selection would pick an unrelated fixed review, the outer caller records native verify unavailable for this parent and explicitly uses a fresh ordinary full verification fallback on this task's exact files, with no suppression. This is not a successful native light mode:verify claim. The restricted review stage returns findings to the outer caller, which saves them to the distinct verify fallback artifact below with depth:full, type:verification-fallback, requested-mode:verify, actual-mode:full and parent-review referencing this task's canonical report. Preserve canonical report bytes/status history; do not let ordinary default save overwrite it or route to another latest Plan. Final V12 accepts the stronger full fallback when every named reviewer is usable, all findings are resolved, required tests pass and mode/parent are recorded honestly. No staging/commit is implied by verify suggestions; review explicit task-owned tracked diff and untracked file contents. If a host requires staging, stop that action and report missing Git authorization.
- **Test Scenarios**: reviewer output incomplete; protected-file recommendation; new regressions; verify fallback; unrelated dirty edits; lifecycle/report inconsistency; exhausted budget.
- **Tests**: full command bundle below, scoped whitespace/path diff, Plan validate-only and review-resolution evidence.
- **Acceptance criteria**: V12 and all final constraints pass, no applicable unresolved finding, honest known gaps and no deployment claim. Mark Plan complete only after these final gates, not merely before auto-review dispatch.

Dependency graph of implementation phases: Phase 1 -> Phase 2 -> Phase 3; this is implementation sequencing, NOT a claim about PIP stage topology.

## Testing Strategy

All commands below are future implementation commands, NOT checks already executed. Use repository workdir above; PowerShell 5.1 for local environment. `R` below is a variable, not the R language interpreter. The fixed implementation runtime/report run is separate from this planning attempt:

```powershell
$R = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028-implementation-01/runtime'
$env:PIPELINE_DOCS_RUNTIME = $R
$env:TEMP = "$R/tmp"
$env:TMP = "$R/tmp"
$env:TMPDIR = "$R/tmp"
$env:XDG_CACHE_HOME = "$R/cache"
$env:XDG_CONFIG_HOME = "$R/config"
$env:XDG_DATA_HOME = "$R/data"
$env:XDG_STATE_HOME = "$R/state"
$env:npm_config_cache = "$R/npm-cache"
$env:npm_config_userconfig = "$R/config/npmrc"
$env:npm_config_logs_dir = "$R/logs/npm"
$env:PLAYWRIGHT_BROWSERS_PATH = "$R/browsers"
$env:QUARTO_CACHE_DIR = "$R/cache/quarto"
$env:DENO_DIR = "$R/cache/deno"
$env:PYTHONDONTWRITEBYTECODE = '1'
node tools/pipeline-docs/site.mjs init --runtime "$R"
```

The init command creates only the guarded runtime child directories (including config/npmrc if needed); verify parent/resolved roots before creation. Every subsequent command/child inherits these redirects. Browser launch adds userDataDir/downloads/traces/screenshots under R/browser-output, and disables persistent profiles/crash output outside R. Do not redirect USERPROFILE/HOME and thereby read private state; use tool-specific settings and temp paths. Audit pinned Quarto/Deno/cache behavior before rendering; unsupported redirects that still write C: block execution rather than silently falling back.

After init, download with `Invoke-WebRequest -Uri 'https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.27/quarto-1.8.27-win.zip' -OutFile "$R/downloads/quarto.zip" -UseBasicParsing`, assert `(Get-FileHash -LiteralPath "$R/downloads/quarto.zip" -Algorithm SHA256).Hash.ToLowerInvariant()` equals the Windows checksum above, then `Expand-Archive -LiteralPath "$R/downloads/quarto.zip" -DestinationPath "$R/tools/quarto-1.8.27"`. Abort before extraction on mismatch. Verify entry paths before extraction and expected executable at `$R/tools/quarto-1.8.27/bin/quarto.cmd`; if archive contains another fixed top-level directory, record actual verified layout and bind QUARTO_BIN to its exact E: path, never search a different install implicitly.

Set `$env:QUARTO_BIN = "$R/tools/quarto-1.8.27/bin/quarto.cmd"` after layout verification. Establish the initial lock as specified in Pins And Installation; copying generated dependency descriptors is a generated-file operation, not hand-authoring lock integrities. Then:

```powershell
npm ci --prefix "$R/node-deps" --ignore-scripts --no-audit --no-fund
node "$R/node-deps/node_modules/@playwright/test/cli.js" install chromium
node --test tests/pipeline-docs/build.test.mjs
node tools/pipeline-docs/site.mjs build --runtime "$R" --base-path / --assessment-date 2026-10-28
node "$R/node-deps/node_modules/@playwright/test/cli.js" test --config tests/pipeline-docs/playwright.config.mjs
node --test tests/pipeline-docs/workflow.test.mjs
node tools/pipeline-docs/site.mjs check-output --runtime "$R" --assessment-date 2026-10-28
```

Playwright config fixes testDir to tests/pipeline-docs, workers:1, retries:0, Chromium only, HTML/JSON/trace/test-results destinations beneath R/browser-output; JSON evidence includes exact input/lock/output hashes. Test server and fixture builders use R/cases/<case-id>/ exclusively. For browser suite, test root and project-prefixed hosts for both empty/synthetic builds, using distinct runtime children and a route that aborts all non-loopback requests. Tests never modify production site pages. Node fixtures create invalid/executable canaries only under runtime; permanent fixture Markdown in tests/pipeline-docs/fixtures is inert and excluded from site input allowlist.

For manual localhost smoke check use tracked background process tooling, not shell backgrounding:

```text
node tools/pipeline-docs/site.mjs preview --runtime <exact R above> --host 127.0.0.1 --port 4173
```

Stop the tracked server after inspection. Browser tests manage their own bounded server lifetime. Do not rely on file:// fetch behavior. Acceptance requires all anchor/asset requests return success under root and /pipsystem/ and no external requests; fixture-derived status text must be absent from the final empty skeleton/search artifact. No Pester/R/testthat/coordination helper suite is required or authorized for this JS-only bounded site; tests use Node and Playwright.

## Documentation Checklist

- Explain empty skeleton, metadata ownership, status versus qualification, dates and public-safe evidence; no current project assessments.
- Document pinned portable setup, exact safe parameterized build/check-output/localhost preview and test commands, E: redirects, output locations, cleanup ownership and failure/receipt semantics. Public docs use a caller-supplied E: runtime parameter, not this workstation's path; exact resolved local paths belong only to private execution reports. Test the public recipe after substitution inside approved runtime.
- Document supported HTTP/base-path/search/no-JS behavior and file:// limitation, accessible filter/diagram fallback, local assets.
- Document manual-only future publication, least privileges, Pages prerequisite decision and no source/private artifact uploads.
- Explain that canonical policy/task records remain elsewhere without copying/linking private internal artifact contents into public output; update instructions as commands change.

## Risks & Mitigations

| Risk | Mitigation |
|---|---|
| Empty content misread as no blockers/completion | Explicit unassessed state, no percentages, test absence of false claims |
| Diagram creates a false linear model | Explicit qualified edges, unknown parent distinction, branched/disconnected fixtures, static relationship list |
| Markdown/metadata escapes Quarto boundary | Fixed source/config/filter allowlists, AST validation, no-execute, path guards, disclosure/execution canaries |
| Hidden CDN/search/base-path dependency | Pinned local assets, external requests aborted, two-prefix browser tests |
| Stale/failed build accidentally published | Fresh staging, invalidate receipt before build, content-bound manifest/receipt and guarded upload |
| Remote automation broadens permissions or deploys on push/PR | Default read-only build, manual boolean/ref/environment gate, deploy-only privileges, event truth-table tests |
| Portable tooling writes C: or pin cannot install | Isolated E: redirects/layout/cache audit; stop affected action, no fallback/global install |
| Fragile screenshot-only accessibility assurance | Semantic assertions, actual keyboard/no-JS tests, mobile screenshots and bounded manual observations; no WCAG certification claim |
| Scope grows into a generic status platform | One site wrapper/filter, native search, no framework/custom parser/task register; no assessed content in this implementation |

## Out of Scope

No live assessments, production data, package source edits, pipeline execution, agent operations UI, backend, automatic status ingestion, roadmap linking/feature registration, wiki regeneration, policy/charter updates, global configuration, Git mutations, Actions execution, Pages settings or deployment. No browser support claim beyond tested Chromium; additional engines are future work, not implied by responsive design.

## Execution Authority And Exact Artifact Paths

All paths below are repository-relative under the exact absolute repository root given in Context, unless explicitly absolute. This definition fixes their absolute identity; do not infer another worktree. Implementation approval must include the whole bundle. It is not granted by this planning task.

| Category | Exact path / permitted change |
|---|---|
| Canonical Plan | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-10-28-pipeline-docs-site.md; implementation may change only status, completed-date, failing-steps, completed-phases, current-phase, execution-report |
| Authored pages/config | pipeline-docs/{index,roadmap,stages,packages,next-steps,open-questions,decisions,validation,maintenance}.md; pipeline-docs/_quarto.yml; pipeline-docs/assets/site.css; pipeline-docs/assets/site.js |
| Tooling | tools/pipeline-docs/site.mjs; metadata.lua; package.json; package-lock.json; README.md |
| Tests | tests/pipeline-docs/build.test.mjs; workflow.test.mjs; site.spec.mjs; playwright.config.mjs; fixtures/** (synthetic inert Markdown/expected fixtures only) |
| Publishing | .github/workflows/pipeline-docs.yml new file only; no existing workflow replacement; .gitignore scoped appended ignore entries only |
| Execution report | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/work-reports/2026-10-28-pipeline-docs-site.md |
| Canonical full review | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/reviews/2026-10-28-pipeline-docs-site-review.md |
| Resolution evidence | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028-implementation-01/resolution.md |
| Final verify review | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/reviews/2026-10-28-pipeline-docs-site-verify-review.md; second pass suffix -2 before .md |
| Full verify fallback | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/reviews/2026-10-28-pipeline-docs-site-verify-fallback-review.md; second pass suffix -2 before .md; separate identity, never overwrite canonical full review |
| Active restart pointer | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/active-state/current.json, compact task refs/status/evidence IDs/nextCommand only; refresh and preserve unrelated active workflow if ownership conflicts |
| Plan rendered view | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/views/plans/2026-10-28-pipeline-docs-site.html; expected identity only, no HTML write authorized by this --no-html task or implementation bundle; always validate source. Any optional future HTML needs separate scope |
| Implementation central report | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028-implementation-01/handoff.md |
| Implementation supporting outputs | Same implementation run: evidence.md, resolution.md, reviewers/<agent-name>.md, diagnostics.md; outer worker saves attributed results |
| Implementation generated/runtime | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028-implementation-01/runtime/**; tools/downloads/node-deps/node_modules/temp/cache/profile/browser/test/logs/staging/site/receipts only beneath this root |
| Planning reports only | E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028T203647Z-code-plan/{handoff,evidence,plan-review,plan-resolution}.md and runtime/**; no implementation worker edits this attempt |

Before implementation check exact authored targets and report/run collisions. If a target is newly occupied by someone else, do not overwrite. Report/run same-day collisions may use deterministic -2, -3 suffix only after binding all references and informing the user; owned resume appends history rather than replacing it. A conflicting canonical Plan or unrelated active-state owner requires a decision; no lock takeover/canonical registry mutation. For stable lifecycle file dates, use the Plan-named 2026-10-28 paths as explicit execution-report pointer; actual execution dates are recorded inside reports.

Outer owner is pipeline-docs-code-implementer. It may run the named site checks and named reviewers after explicit work approval and save attributed durable results, corrections and lifecycle updates inside this bundle. Give each future reviewer the exact central reviewers/<its-name>.md path; reviewers have bounded read-only access to this Plan, task source/tests/docs, relevant contracts, scoped diffs and sanitized runtime evidence. No reviewer writes, tests/processes, network, Git mutations, source outside this checkout, credentials/private native Kilo state or further helpers. Their outer caller saves required reports because restricted reviewers cannot write them. cg-learnings-researcher additionally reads targeted .cg-docs/solutions/ and brainstorm metadata/matched entries only, excluding generated view bodies/raw sessions.

cg-fix-problems is the only conditional diagnostics helper: errors from actual available IDE diagnostics on touched site files, at most two rounds, code/test fixes only within authored site/tool/tests paths; no .github/.cg-docs/global writes, shell, network or further helpers. Outer worker owns workflow/report fixes. If IDE get_errors is unavailable, explicitly record that limitation, run Node syntax checks, actual build/test checks and reviewer static inspection; do not claim IDE diagnostics were clean. No execution subagent is needed: outer caller runs Node/browser tests. No additional helper authorization is inferred.

Planning critic is cg-plan-critic only, with read-only bounded Plan/charter/design/contract/source/test/evidence access, no writes, shell/tests/process/network/other helpers; outer planner writes attributed review and resolution into the planning run above. Durable reports use pip-handoff-v1 template and all ten required headings; create before work, update at checkpoints and every stop, read back saved outputs. JSON captures actual UTC/repository/Git/pins/scope/checks/artifacts and nonempty Gaps; UNKNOWN for missing native identity. No publication of these reports.

## Completion Contract

### Outcome

The eight empty project-content pages render as a navigable Quarto documentation website with explicit Not yet assessed states. Safe tooling supports future evidence-qualified Markdown visual summaries, search and filters without pipeline execution, private-content leakage or automatic publication.

### Verification Surface

| ID | Phase | Evidence Required | Command/Artifact | Required |
|----|-------|------------------|------------------|----------|
| V1 | 1 | Pinned E:-only installation/checksums, environment/path audit and outer-owned setup advisory evidence | Setup commands and runtime/evidence.json; lockfile/checksum/version records; private implementation evidence.md with dated advisory sources/applicability | yes |
| V2 | 1 | Empty eight-page rendering, navigation/unassessed semantics, empty authored bodies | site.mjs build; build.test.mjs; checked output manifest | yes |
| V3 | 1 | Invalid metadata/path/execution/resource inputs rejected safely | node --test tests/pipeline-docs/build.test.mjs, actual negative fixtures | yes |
| V4 | 2 | Synthetic cards/nonlinear clickable diagram and separate ALL-style path | site.spec.mjs fixtures; browser evidence | yes |
| V5 | 2 | Links/anchors/package-stage-status filters/reset/search work | Pinned Playwright test command in Testing Strategy | yes |
| V6 | 2 | Keyboard/focus/mobile/no-JS reading work | 1440x900 and 390x844 tests; JS-disabled tests; focused observations | yes |
| V7 | 2 | No external browser network; root and project base paths work | Browser request log and root,/pipsystem/ matrix | yes |
| V8 | 2 | Stale content removed; failed/tampered builds cannot provide current receipt | build.test.mjs rebuild/failure/manifest checks | yes |
| V9 | 3 | Site-only workflow and manual-only deployment/least privileges | node --test tests/pipeline-docs/workflow.test.mjs; event/ref matrix; upload allowlist | yes |
| V10 | final | No private/source/workstation paths or synthetic statuses in final output | site.mjs check-output; disclosure canaries and fixture-isolation test | yes |
| V11 | 3 | Technical setup/build/localhost-preview/maintenance instructions match executed commands | maintenance.md; tools README; preview smoke evidence | yes |
| V12 | final | Full review, ALL applicable findings fixed/retested and final verification | Exact full-review/resolution/verify reports; fallback explicitly identified | yes |

### Constraints

| ID | Phase | Constraint | Check |
|----|-------|------------|-------|
| C1 | final | Preserve protected/unrelated docs/config/packages/coordination machinery and roadmap | Fresh scoped changed-path comparison, no Git mutations; unrelated changes not attributed to task |
| C2 | final | One Markdown metadata source, qualification/dates explicit, no invented completion/percentages | Metadata-to-output, empty-state and no-independent-dataset assertions |
| C3 | final | No R/PIP/pipeline execution, production data or unsafe renderer hooks | Fixed allowlist, no-execute, AST/resource/execution-canary tests |
| C4 | final | Local writes resolve to approved E: runtime/source/report paths | Root/junction/child-env audits; no global install/C: fallback |
| C5 | final | Required browser assets local; no external search/font/diagram service | Output asset audit plus external-request-blocked browser tests |
| C6 | final | No unauthorized publication/settings/Git changes or new canonical task register | Workflow truth table, job permissions and actual performed-action log |

### Boundaries

- Allowed: exact authored source/test/docs/workflow/scoped ignore paths and lifecycle/report/runtime bundle above, after implementation approval.
- Out of scope: assessed project content, canonical policy/task-state changes, private evidence ingestion, R/pipeline execution, package edits, global config, Git mutations, remote workflow runs and publishing/settings.
- Synthetic metadata belongs only to tests/runtime; renderer-required empty states are presentation, not authored project assessments.

### Iteration Policy

1. Execute the complete approved Plan sequentially from the first incomplete phase; advance without routine authorization only after that phase's evidence passes. Phases are parsed from headings; steps globally numbered 1-8. No commit/branch is implied.
2. Under stored autonomous policy, record justified reversible in-scope adjustments; material policy/scope/safety/publication changes need a decision. Do not alter protected boundaries or substantive Plan body during cg-work.
3. Apply at most two targeted functional-test correction attempts per step. Record failing evidence and stop the affected phase if still failing. Do not weaken tests or mark a skipped required check as passed.
4. Full implementation review followed by /cg-fix-triage P0 P1 P2 P3, affected retests/full site regression and /cg-review mode:verify; at most two correction/verification rounds. Address all applicable findings including P3. Incomplete reviewer output blocks that required review evidence; no automatic alternate-model retry.
5. Restricted workflows retain their permissions. Outer authorized caller separately owns workflow corrections and report/lifecycle saves. Verify fallback is reported honestly; staging is never inferred. No generic phase-by-phase reapproval; stop only for real boundary/evidence/budget failure.
6. Planning review allows two correction/re-review rounds; material revisions require revalidation and re-review. Final Plan revision and saved validation/review evidence must be named before declaring work-ready. A schema pass/clean critic alone is not runtime proof or execution approval.

### Blocked-Stop Conditions

- Required action denied; output resolves outside approved paths/E:; reporting save/readback fails; unsafe ownership/active-state/Plan collision.
- Selected dependency/checksum/integrity cannot be verified/obtained; pinned tool writes outside E: and cannot be safely redirected; known material applicable vulnerability remains unresolved.
- Required acceptance check fails or cannot safely run within correction budget; incomplete required review, unresolved applicable finding, unsafe publication allowlist or unverified no-execution boundary.
- Required change alters Decided policy, source scope, permissions, Git state, private-content boundary or publication authority without its exact approval.
- User stops; correction budget exhausted; required evidence is missing. Schedule waits only when an authorized asynchronous operation can actually carry progress; no monitoring/worker starts implied.

## Gaps

- Planning verifies source/distribution/contract facts, not installed Quarto, browser behavior or deployment; all runtime surfaces above are future required checks.
- Actual package dependency topology and project statuses remain unassessed. No package source was read; no current package SHA/test/numerical/production claims are made.
- Actions guard tests prove local structure, not successful remote deployment; remote execution and Pages prerequisite settings are outside this assignment.
- npm registry initially failed transport; setup must verify registry availability and generated lock integrities before implementation acceptance. Pin maintenance/security and broader browser certification remain explicit limits, not silent passes.
