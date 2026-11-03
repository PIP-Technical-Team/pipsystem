---
schema: pip-handoff-v2
project: pipsystem
task: development-path-reassessment
run: 20261103T143258Z-orchestrator
status: completed
updated: 2026-11-03T14:38:19Z
owner: calculation-architecture-research
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39
plan: NONE
next: Coordinator may use these options in its reassessment; no option or implementation is approved.
---

# Calculation architecture options

## Summary
Recommendation for consideration, NOT an approved choice: **B, incremental replacement behind a reviewed pure calculation API in pipster**, best fits the stated wish to supersede wbpip. A thin facade can be its first transition step; retaining wbpip forever is a different endpoint (A). Do not treat the old pipster implementation as an already working replacement or rewrite it wholesale before delivering a useful calculation (C).

Fresh source shows that pipster is primarily a grouped-data wrapper/prototype with direct wbpip runtime dependencies and current signature incompatibilities. wbpip contains substantially more implemented numerical work and more substantive test assertions, but it is neither a complete new-pipeline design nor a certified numerical oracle. Replacing its full responsibility is substantial reimplementation/migration work; it need not be a big-bang rewrite.

Research only. No interactive /cg-strategy workflow, implementation, package loading, tests, installation, network, roadmap edits or approval occurred.

## Provenance and policy boundary

All P citations below mean files freshly read under `E:/PovcalNet/01.personal/wb384996/PIP/pipster`; all W citations mean files freshly read under `E:/PovcalNet/01.personal/wb384996/PIP/wbpip`.

| Repository | Full HEAD | Branch | Dirty paths at inspection |
|---|---|---|---|
| P: pipster | `828064e406e07e711c34d2ba725746e367d35f9b` | `PROD` | `?? .cg-docs/` only; no modified tracked package source reported |
| W: wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` | `DEV` | NONE |
| pipsystem policy root | `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39` | `main` | Existing tracked and untracked work; untouched; this report is the sole authorized write |

Provenance comes from read-only `git --no-optional-locks rev-parse HEAD`, `branch --show-current`, and `status --porcelain=v1` in each root. Branch names alone do not establish production deployment. Package HEADs happen to equal the old harvest keys, but these conclusions come from fresh source, not old reports.

Policy is unchanged: pipster owns stages 5-7; calculations receive data and return results, without I/O or work selection; pipdata coordinates and stamp decides rebuilds. Native-pipe growth is Decided. wbpip retirement is Open, not approved (`SYSTEM_DESIGN.md:145-176,284-307`). Independent list/data.table results and separate saving/assembly are Decided; exact result contracts are Open (`SYSTEM_DESIGN.md:164-168`). API-bound names, shapes, keys and units stay compatible; current API behavior changes only under the already planned PPP transition (`SYSTEM_DESIGN.md:166,313-317`).

## What is implemented today

1. **pipster has input conversion and grouped-data calculations, not a full indicator engine.** Its ten R files and export list expose `as_pip`, type identification, Lorenz parameter fitting/validation/selection, cumulative welfare shares, quantile shares and monetary quantiles, headcount and gap (P `NAMESPACE:3-12`; `R/pipgd_params.R:33-98`; `R/pipgd_dist.R:24-72,93-135,164-213`; `R/pipgd_pov.R:113-154,272-313`). Severity bodies are empty and the curve function returns TRUE (P `R/pipgd_pov.R:316-322`; `R/pipgd_lorenz.R:245-248`). No microdata indicator, full lineup-distribution, or missing-country-method implementation was found in the current R directory/export surface. Recognizing/converting micro or imputed inputs is not estimating their indicators: that branch sorts inputs and adds classes (P `R/as_pip.R:81-100,112-126,181-199`; `R/identify_pip_type.R:129-142`).
2. **Its original design is explicitly a wrapper**, not an independent numerical core (P `R/pipster.R:1-10`). Grouped fitting calls wbpip functional forms, regressions and key values; curve validation/selection and poverty/distribution functions also call wbpip directly (P `R/pipgd_params.R:53-83`; `R/pipgd_lorenz.R:57-104,195-232`; `R/pipgd_dist.R:52-61,195-205`; `R/pipgd_pov.R:205-215`). Reconsidering that implementation is compatible with the target calculation-only ownership; changing the Decided ownership itself would need approval.
3. **wbpip has separable numerical components already.** Microdata distribution stats assemble mean, median, Gini, MLD, polarization and quantile shares; poverty code chains FGT calculations and computes Watts (W `R/md_compute_dist_stats.R:19-64`; `R/md_compute_poverty_stats.R:21-60`). Grouped distribution stats fit LQ/LB curves, select a fit, and return mean, median, Gini, MLD, polarization and deciles (W `R/gd_compute_dist_stats.R:18-105`). The public combined dispatcher routes micro and grouped data, but returns NA for imputed data; a separate production dispatcher routes micro/imputed and grouped using precomputed statistics (W `R/compute_pip_stats.R:20-65`; `R/prod_compute_pip_stats.R:5-6,14-62`). Thus neither a single wrapper nor one entry point captures all present behavior.
4. **wbpip supplies lineup-related building blocks, not proof of complete target stages 6-7.** `predict_request_year_mean` receives survey means, years and proxy values; `fill_gaps` receives one/two survey datasets and predicted means and combines poverty statistics (W `R/predict_request_year_mean.R:69-105`; `R/fill_gaps.R:81-106,117-159`). This is not evidence that it builds the Decided lineup distributions or implements the published missing-country method. Full methodology/input selection remains Open and outside these roots (`SYSTEM_DESIGN.md:170-176,343`; `HARVEST_BRIEF.md:129-131`).

## Style, interfaces, dependencies and coupling

- **Native pipe is already present in both packages.** pipster supports a `params`-first Lorenz chain with nested list accumulation; `complete = FALSE` discards prior fields (P `R/pipgd_lorenz.R:21-24,30-41,122-128,166-176,236-241`). wbpip itself uses `|>` to accumulate FGT measures (W `R/md_compute_poverty_stats.R:31-38`). Native-pipe syntax is therefore not a reason to reimplement the mathematics. Retain optional chaining while returning independently usable estimates; do not make the whole chain one storage/rebuild unit (`SYSTEM_DESIGN.md:166,188,303-305`).
- **pipster is not currently pure in the strict explicit-input sense.** Calculations use global option defaults for completeness, and `.onLoad` initializes options (P `R/zzz.R:1-14`; `R/pipgd_dist.R:24-30`). Poverty functions offer dt/list/atomic formats, while complete results are allowed only in list format; default completeness is TRUE, but the function format defaults to dt (P `R/pipgd_pov.R:123-125,148-152`; `R/utils.R:34-43`). This is a source-visible interface inconsistency, not a reason to preserve that API unchanged. A proposed reviewed pure API should make result-affecting inputs and output semantics explicit, separate optional presentation, and avoid I/O/global state in calculation bodies.
- **Dependencies:** pipster imports cli, collapse, data.table and wbpip >= 0.1.0.9002, broadly importing collapse (P `DESCRIPTION:20-26`; `NAMESPACE:13`). wbpip imports dplyr, rlang, data.table, assertthat, cli, collapse >= 2.0.9, MASS and lifecycle (W `DESCRIPTION:53-61`). It is mixed-style rather than simply tidyverse: a grouped-data-frame convenience wrapper uses `dplyr::do`/captured names, while the scalar/vector Gini kernel uses collapse operations (W `R/get_gini.R:20-58`; `R/md_compute_gini.R:15-34`). MASS is used for regression covariance via `ginv`, not merely declared (W `R/gd_utils.R:24-44`). A facade retains wbpip's dependency requirements; fewer direct imports in pipster would not mean fewer runtime dependencies. Replacement could reduce them, but required dependency set and performance are UNKNOWN until functions are selected and checked.
- **Declared R floor is stale for the syntax:** pipster declares R >= 2.10 while using native pipe and the `_` placeholder (P `DESCRIPTION:25-26`; `R/pipgd_dist.R:52-54`); wbpip declares >= 3.5.0 but uses native pipe (W `DESCRIPTION:51-52`; `R/md_compute_poverty_stats.R:31-38`). This is packaging metadata debt, not a computation-rewrite justification.
- **I/O boundary:** no operational file read/save calls were found in pipster's R source scan; inspected functions consume supplied data and return results. The inspected wbpip kernels similarly operate on supplied vectors/lists. This is static boundary evidence only, not certification of all side effects or transitive behavior. Options, classes and by-reference handling still need deliberate API decisions.

## Source findings that affect the choice

**[P1]** P `R/pipgd_lorenz.R:57-87` -- current dependency signatures do not match.
**Issue**: pipster passes seven positional values to `check_curve_validity_lq`, but current wbpip accepts `(A, B, C, key_values)`; its derivative/headcount calls also use older argument shapes (W `R/gd_compute_pip_stats_lq.R:179-182,239-242,723-728`). Quantile/share/gap paths omit required LQ `key_values` too (P `R/pipgd_dist.R:52-61,195-205`; `R/pipgd_pov.R:205-215`; W `R/gd_compute_pip_stats_lq.R:353-362,756-762`).
**Impact**: the present pipster-to-wbpip combination cannot be assumed usable simply because DESCRIPTION accepts the wbpip version. Static argument incompatibility is established; no executed error or wrong published number is claimed.
**Fix**: for A or transitional B, isolate and reconcile current signatures in one reviewed adapter rather than spreading calls. For B's replacement slices, own the calculation and remove that slice's runtime call. Do not merely replace `:::` with `::` and call the migration complete.

**[P2]** P `R/pipgd_params.R:55-83`, `R/pipgd_dist.R:52-54,195-201` -- numerical backend coupling is scattered and partly dynamic.
**Issue**: literal `:::` calls and parse/eval-built calls tie the frontend to low-level backend details. However, **triple-colon syntax does not establish that every target is private**: current wbpip exports cleaning, functional forms, regression, validity, fit/selection, derive/value and poverty functions (W `NAMESPACE:3-57`). `gd_lq_key_values` is genuinely unexported (W `NAMESPACE:3-57`; `R/gd_compute_dist_stats.R:149-174`).
**Impact**: target changes ripple through multiple modules; dynamic dispatch obscures the boundary. Export status alone also does not prove stable semantic compatibility, as P1 shows.
**Fix**: use a small explicit backend adapter for genuinely needed public calls; if a private helper is still needed, choose deliberately between local ownership and a reviewed upstream API. Prefer an explicit LQ/LB dispatch table over parse/eval. No generic plugin system is needed.

**[P2]** P `tests/testthat/test-pipgd_dist.R:1-3`, `test-pipgd_params.R:1-9`, `test-pipgd_lorenz.R:5-29` -- replacement confidence is not supplied by current tests.
**Issue**: distribution tests check only `2 * 2`; parameter tests check class; Lorenz tests check class/composed-versus-direct equality, not independent numerical expectations. No dedicated poverty test file is present in the five-file pipster test directory.
**Impact**: old interfaces and wrong result semantics can survive without meaningful numerical evidence. wbpip offers useful numerical regression expectations, but is not infallible: microdata tests assert concrete mean/median/Gini and shares, while grouped tests explicitly skip a disputed MLD comparison (W `tests/testthat/test-md_compute_dist_stats.R:15-34`; `test-gd_compute_dist_stats.R:31-48,57-78`).
**Fix**: one focused functional check for each proposed calculation change, using a synthetic known-answer fixture plus reference comparison where applicable; document method/tolerance and review any disagreement before publishing numbers. Reuse useful existing tests, not their unexamined assumptions. No broad algorithm audit or new testing framework is proposed here.

## Three different meanings of superseding wbpip

| Meaning | What changes | What does not follow automatically |
|---|---|---|
| Methodological reference | Use wbpip source, documented methods, regression cases and independently reviewed known answers to establish intended behavior. | No runtime import is required; matching an existing bug is not a methodological requirement. |
| Runtime dependency | Production pipster functions call/import wbpip while doing calculations. This is the current grouped-data situation. | A new facade/name/native pipe does not retire that dependency. Test-only comparisons are not production runtime calls. |
| Public API compatibility | Preserve externally required behavior/files and, if explicitly chosen, existing R callers' signatures and result contracts. | Owning the same mathematics does not require reproducing every wbpip export, convenience wrapper or private nested object. Actual downstream R callers were not inspected. |

The first can remain after the second is removed. The third needs a defined boundary: API-bound release compatibility is Decided, whereas blanket compatibility with every wbpip R function is not established in the reviewed policy (`SYSTEM_DESIGN.md:166,295,313-317`).

**Coordinator-supplied ecosystem evidence, not independently inspected here:** the coordinator reports pipdata at `fe075a6d49f37d6d131eeadfeb9219c2038899ea` directly calls wbpip in `R/pd_wbpip_clean.R:42,128`, `R/pd_deflation.R:922`, and `R/recode_spec.R:310` (board message received during this research). This reinforces a conditional distinction: removing pipster's imports is package-local independence, not ecosystem retirement. The reported consumer paths and pipdata branch/dirty state were not verified within this two-package scope; no additional repository reads or writes were performed on that basis.

## Options, not approvals

| Option | Merits | Costs and limits | One initial functional check (proposed, NOT run) |
|---|---|---|---|
| **A. Keep wbpip core; thin facade in pipster** | Least duplicated mathematics; quickest reuse of existing kernels and regression cases; can satisfy pipster's calculation-facing ownership without new package. | Permanent runtime dependency and transitive dependency set; reconcile P1 first; combined dispatcher bundles unrelated stats/PPP handling, so select narrow kernels. Does not accomplish eventual runtime supersession. wbpip retention would need to be settled as an Open policy choice, not silently assumed. | For one selected microdata estimate, feed a synthetic known-answer input through the facade and verify its value and agreed standalone list/data.table contract against the reviewed core path. |
| **B. Incremental replacement behind reviewed pure API in pipster** | Best fit to supersession goal; makes numerical ownership real one calculation at a time; permits reusable methods/tests without production dependence; independently versionable estimates fit current policy. Existing wbpip kernels show feasible seams rather than forcing a new framework. | Temporary mixed backends; equivalence, units, weight handling, sortedness, zero/negative/missing values and grouped-curve selection must be reviewed per migrated function. Complete stages 6-7 still need separate evidence. Retirement cannot be declared until required runtime paths are replaced. | Implement one explicit-input mean calculation later; compare a hand-computable weighted fixture and the documented wbpip reference mean, checking the independent output contract. No package-wide benchmark or broad gate for the first slice. |
| **C. Rewrite pipster first** | Small prototype surface means local redesign is cheaper than preserving every prototype quirk; can simplify options/formatting/classes and eliminate dynamic calls. | A frontend rewrite alone leaves wbpip dependency intact; a full numerical rewrite adds substantial scope and delays a useful result. Old tests provide little protection. Calling all of this a pipster rewrite can hide unfinished micro/grouped/lineup/missing-country work. | If selected, replace one old pipeline chain with a simple two-calculation native-pipe chain; verify both independently usable results and that adding the second does not alter the first. |

**Interpretation:** B is an incremental migration with reimplementation of individual kernels where useful, not an all-at-once rewrite. A may be B's short-lived bridge, but is a different long-term decision if wbpip remains forever. A narrowly scoped refresh of pipster's interface can be part of B; it does not justify making C a prerequisite program. Start with the smallest useful calculation, not a complete mirror of wbpip's exports. No new package, general backend registry, mandatory long table, I/O layer in pipster, or roadmap change is proposed.

## Later (reversible extras, not prerequisites)

- Broader convenience API cleanup, package-wide import pruning, full performance comparisons, and support for old prototype callers if actual consumers require it.
- Whole-package numerical audit, complete lineage/fingerprint coverage, and full stage 6-7 migration design need separately authorized scope. Existing calculation fingerprint policy still applies (`SYSTEM_DESIGN.md:203-205`).
- Minimal first applied: smallest useful assessment; installed read-only tools; no new dependencies/frameworks; proposed checks demonstrate each first change. Additional safeguards are justified only against almost-irreversible harm, especially releasing wrong numbers. No Plan was created. Reversible research proceeded autonomously; protected design/scope changes and Git mutations remain unapproved.

## Changes
Only this requested report created, checkpointed and finalized at the exact authorized path. No package, design, roadmap, configuration or Plan edits; no branches, commits, workers or scheduling. No other file writes were requested or performed by research commands.

## Checks run
- Read root charter, design, harvest brief and pip-handoff-v2 contract; loaded R technical/testing and technical communication guidance.
- Read-only git provenance/status commands in all three roots; package dirty paths recorded above. Existing hub work left untouched.
- Fresh source and metadata reads, R/test directory listings, grep of dependency/pipe/I/O/function patterns; compared pipster call arguments with current wbpip declarations and export status.
- Read selected current tests as source; no claim of test passes. No package loading, tests, code execution, installation or network, as required. All proposed functional checks above remain NOT RUN.
- Report created running, checkpointed, then finalized; source claims include package/full-SHA keys and precise file:line references.
- Read back the completed report to check format, provenance, option labels, required sections, citations and nonempty Gaps; then added explicitly attributed coordinator evidence and updated time.
- System clock read three times; latest observed 2026-11-03 09:38:19 ET / 14:38:19Z. Commands were read-only git and clock/time-zone queries only; no process temp/cache/log output paths were created by command intent. Report writes remain on E:.
- Material interface/dependency findings shared with coordinator on the board, not as approval or a scope change.

## Gaps
- Numerical correctness, executed compatibility, installed versions, performance and release outputs are UNKNOWN; intentionally no package execution or full algorithm audit.
- Source presence and numerical assertions are not proof of passing tests or deployed production behavior. No generated/private fixture data were opened or copied.
- Exact new calculation contracts, downstream wbpip R consumers and compatibility needs, dependency-removal scope, full stage 6/7 inputs/methods and retirement timing remain UNKNOWN/Open. Only the supplied roots and policy documents were researched.
- No option is approved. Retirement/retention is an Open design decision; native-pipe growth and pipster/pipdata/stamp responsibilities remain Decided and unchanged.
