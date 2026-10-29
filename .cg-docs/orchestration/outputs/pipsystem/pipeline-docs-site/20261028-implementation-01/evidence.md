# Implementation Evidence: pipeline-docs-site (run 20261028-implementation-01)

Plan: `.cg-docs/plans/2026-10-28-pipeline-docs-site.md`, revision r3, SHA-256 `68edebceb322f35889ea483c553df0d5d1c6216daaa08b379f2eb1fd77f64ee8` (verified 2026-10-29 before any mutation).
Captured: 2026-10-29 (UTC date of run; exact timestamps in handoff.md).

## 1. Preflight (executed)

- `git rev-parse HEAD` = `ad326f7ee1b7bcc1262757636efbcbc08314ecff`; branch `main`.
- `git status --short`: unrelated dirty files present (README, wiki/*, AGENTS.md, ORCHESTRATOR.md, kilo.json, CONTRACT.md, multiple orchestration output folders). None touched by this run.
- Target collisions: `pipeline-docs/`, `tools/pipeline-docs/`, `tests/pipeline-docs/`, `.github/workflows/pipeline-docs.yml`, `.cg-docs/work-reports/2026-10-28-pipeline-docs-site.md`, `.cg-docs/active-state/current.json` (existing, unrelated owner state not yet inspected) — none of the task targets exist.
- Tools observed: Node `v22.16.0`, npm `10.9.2`, `cg-render-artifact` at `C:\Users\wb384996\.compound-gpid\bin\cg-render-artifact.cmd` (system executable on C:, read/execute only; no write to C:).
- `cg-render-artifact --validate-only .cg-docs/plans/2026-10-28-pipeline-docs-site.md`: `Validated ...`, exit 0.
- Roadmap: no `roadmap.json` feature with a `plan` path matching this Plan; no roadmap write performed.

## 2. Runtime root (executed)

Runtime root: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/pipeline-docs-site/20261028-implementation-01/runtime`
Created child directories: tmp, cache/quarto, cache/deno, config, data, state, logs/npm, npm-cache, browsers, downloads, tools, node-deps, staging, site, cases, browser-output.

## 3. Quarto 1.8.27 Windows portable archive (executed)

- Source: `https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.27/quarto-1.8.27-win.zip` (official GitHub release URL from plan).
- Size: 129,453,414 bytes.
- SHA-256 observed: `b1d69b7abbc4664d438c85709b11170def5010b886a9f91482cb9b55f43cbd08` = pinned value. **Match.**
- Archive listing before extraction: 2,539 entries, zero entries with `..` or rooted paths; top-level folders `bin`, `share`.
- First extraction with `Expand-Archive` failed partway with Windows path-length (260 character) errors under the runtime path. The partial output lived only under this run's runtime `tools/quarto-1.8.27` and was removed before retry.
- Retry: .NET `ZipFile` entry-by-entry extraction into the fresh owned directory `runtime/tools/quarto-1.8.27` using `\\?\` extended paths, with a per-entry guard that every resolved target stays under the destination. Result: 2,484 files extracted; `bin/quarto.cmd` present.
- **Quarto has NOT been invoked.** Invocation is blocked pending the advisory decision in section 5.

## 4. Pinned Node/Playwright metadata (executed, read-only)

- Node 22.23.4 official SHASUMS256 (`https://nodejs.org/dist/v22.23.4/SHASUMS256.txt`) fetched. Windows x64 zip SHA-256: `cbc74b5e0982c9dbb41525fd8fb5dcd32fbee237863f7829072f4639a1ce5f20`. Not downloaded (see section 5).
- Playwright 1.64.1 `packages/playwright-core/browsers.json` from the official repository (`raw.githubusercontent.com/microsoft/playwright/v1.64.1/...`): chromium revision `1248`, browserVersion `156.0.8078.4`.

## 5. Advisory lookups (outer-owned setup check; read-only; capture 2026-10-29)

Sources queried through the web search and fetch tools: nodejs.org security release pages (2026-06-18, 2026-07-29, 2026-10-21), NVD entries, the GitHub Advisory Database index, Snyk and secure.software package pages, Chrome release CVE records via cve.org/NVD, CISA KEV entry for CVE-2026-85046. Coverage limits are listed in section 6.

| Pin | Plan value | Finding | Applicability assessment | Decision |
|---|---|---|---|---|
| Node.js | 22.16.0 | Node 22.x security releases of 2026-06-18, 2026-07-29 and 2026-10-21 fix issues affecting all active 22.x lines (for example CVE-2026-48617 permission-model path bypass, affecting `<=22.22.3`; HTTP/2 memory-limit bypass CVE-2026-56846; undici, llhttp, nghttp2 and OpenSSL updates). Latest 22.x fixed line: 22.23.4 (2026-10-21). | Affects this use: the Node CLI runs the local static preview server (`http`) and undici/fetch-based tooling. High likelihood of applicability. | **Material applicable vulnerability. Pin correction required: 22.23.4 (SHASUMS verified above). Not yet applied; requires tooling-install step under the user's go-ahead for this blocked decision.** |
| Playwright `@playwright/test` | 1.56.1 | GHSA-7mvr-c777-76hp / CVE-2025-59288 (browser download without SSL verification) affects `< 1.55.1`; 1.56.1 is fixed. Snyk and secure.software report no known direct vulnerabilities for 1.56.1 (secure.software result is for a beta build tag of 1.56.1). | Not applicable to 1.56.1. | Pin unchanged for the Playwright package itself. |
| Chromium (bundled by Playwright) | Playwright revision 1194 / 141.0.7390.37 | Chrome 141 is far below 2026 fixes: CVE-2026-85046 (V8 type confusion, CISA KEV, fixed in 152.0.7977.82), CVE-2026-11650 (V8 UAF, fixed in 149.0.7827.103), CVE-2026-113343 (sandbox memory corruption, fixed in 156.0.8078.47), and others fixed in 150-156. | Applicability: the browser is limited to locally generated synthetic pages with external requests aborted, so exposure is reduced but not eliminated (V8/renderer bugs are triggered by crafted HTML). CISA KEV listing makes the risk material. | **Material applicable vulnerability; no verified safe pin found in the stable line.** Playwright 1.64.1 (latest stable verified) bundles Chromium `156.0.8078.4`, still below the `156.0.8078.47` build fixing CVE-2026-113343 and the other listed Chrome CVEs. A pre-release Playwright line (for example 1.65.0-alpha series, seen on Snyk) is not an accepted pin. |

## 6. Coverage limits (not silently passed)

- Search results are not an exhaustive advisory feed. An absence of a Quarto 1.8.27 advisory in the lookups is recorded as "no advisory found in the sources searched", not as "no advisories exist".
- Chromium lookups were partial; the list of 2026 Chrome CVEs above is a sample, not a full inventory.
- Snyk and secure.software results are third-party scanner views, not primary sources.
- No Quarto, npm or Playwright package has been installed or executed in this run.
- No security conclusion is claimed. Advisory presence does not prove exploitability here.

## 7. Not performed

- No Node or npm download; no `npm --package-lock-only`; no Chromium download.
- No Quarto invocation, no `site.mjs` implementation, no tests, no browser run, no review dispatch.
- No Git writes, no staging, no branch, no roadmap writes, no C: writes by this run.
