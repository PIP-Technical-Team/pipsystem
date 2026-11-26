---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-code-quality
status: completed
updated: 2026-11-11T19:12:31Z
owner: review-code-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1 Phase 2
next: Coordinator consolidates reviews and worker evidence; package context incompatibility still blocks Phase 2 acceptance.
---

# Code-quality review — fresh n11 example

## Summary
Read all six scripts in `experiments/one-survey/`, original Plan Phase 2 and fresh available n11 evidence. One P1 manual package integration blocker is supported; no additional actionable harness code-quality issues found. Known P2 evidence-mode and P3 header corrections are now present in source, but the inspected evidence-mode log predates its correction. Review completion is not Plan completion: no annual-to-daily, clean data, metadata exact-readback or downstream invalid-rejection gate passed.

Snapshot: existing main checkout, HEAD `e9c71e3190f1ce88a017ae25af7c373a64c655a2`; scripts were concurrently edited by the execution worker. This reviewer made no implementation changes and ran no R, installer, package test, download or pipeline.

## Findings

**[P1]** `.tmp/one-survey/n11/sources/pipdata/R/dependency_contract.R:266-273` -- [manual] Public clean wrapper reads release context from options not populated by the pinned public setup.

**Issue**: At pipdata `c5b27fa4458d7175aca81a203762bae81e9f0b40`, `pd_process_data()` invokes `pd_dependency_context()` (`R/pd_process_data.R:117-124`). The latter defaults to `getOption("pipfun.working_release")` and `getOption("pipfun.identity")` and aborts when these are absent. Pinned pipfun `7d534516a8c17c33d537681610eccd4c29211762` stores the descriptor as `wrk_release` in `.pipenv`, not these options (`.tmp/one-survey/n11/sources/pipfun/R/working_release.R:121-126,150-158`); its public retrieval function is `get_wrk_release()` (`:314-329`). The harness does invoke public setup (`experiments/one-survey/scenario.R:87-89`). Fresh `n11/logs/scenario.log:255-258` records the exact failure, and `n11/logs/reproduce.log:1-33` shows successful returned release/identity, absent options and the same typed error. Thus the required public path fails before cleaning, not because validation failed or no work was selected.

**Fix**: Package owner should reconcile pipdata's context discovery with the supported pipfun working-release contract, retaining the release and identity requirement. Use `experiments/one-survey/reproduce.R:40-67` as the concrete reproduction and add/run the functional public setup-to-clean check in the package's authorized environment. Do not seed private options, fabricate a master, invoke internal workers, change an unapproved pin or claim a scenario pass in this checkout. Package edits remain outside this review's permission.

No supported P0 or additional P2/P3 harness finding was identified in the inspected snapshot.

### Already-triaged corrections (not duplicate open findings)

- **P2 [safe_auto], corrected in source; executed export confirmation pending:** `experiments/one-survey/setup.R:70-84` now reads first-failure only if present, and distinguishes a saved assertion/readback outcome from incomplete acceptance. This removes the old unconditional first-failure assumption and blanket NOT REACHED wording. The inspected `n11/logs/evidence.log:161-163` still has old output; it does not verify the changed exporter. The success branch also has no real successful scenario to exercise. Coordinator must use the worker's subsequent evidence check if available, rather than count this static review as that check.
- **P3 [safe_auto], corrected:** `experiments/one-survey/scenario.R:1` now points to setup.R's exact pipdata source pin rather than ambiguously referring to old `13a38280`. The original Plan's historical context remains unchanged and is not misrepresented as the new pin.

## Changes
Only this authorized handoff was created and finalized by this reviewer. No package, source, runtime, configuration, Git index, commit or remote changes. Worker-owned script edits were read, not modified. No deletion, replacement, rename or move recommendations for protected project artifacts.

## Checks run

### Reviewer checks (read-only)

- Read `compound-gpid.md`, `SYSTEM_DESIGN.md`, `HARVEST_BRIEF.md`, handoff contract, original Plan, local dialect configuration and R instruction router.
- Loaded technical communication, R technical, analytical, shared, data.table, collapse and testing skills. Dialect is `data.table-collapse` (`compound-gpid.local.md:2-5`).
- Full static inspection: `setup.R` (295 lines), `scenario.R` (191), `reproduce.R` (70), `run.ps1` (108), `paths.ps1` (33), `checks.ps1` (122). Inspected naming/style, helper use, control flow, error handling/restoration, fixture disclosure, assertions and saved-version selectors. The small standalone example does not justify a new helper framework, installer dependency or general refactor solely to shorten its scenario function.
- `git status --short`, `git rev-parse HEAD`, `git branch --show-current`, `git diff -- experiments/one-survey`, `git diff --check -- experiments/one-survey`: observed main and above SHA; no whitespace errors, only Git LF/CRLF notices. Concurrent changes preserved. The two source-pin substitutions are exactly authorized pipload and pipdata SHAs; other five setup pins are unchanged.
- Read n11 pins, installed paths, setup/check/forced-failure/scenario/evidence/reproduce logs and first-failure text. No HTML body was read or copied. Read extracted package source only where needed to establish the context incompatibility, not mutable package working-tree source.

### Existing fresh evidence inspected (not executed by reviewer)

- `n11/logs/setup.log:1-9`: intentionally missing-dependency installation fails, then all seven real installs exit zero. `n11/installed-packages.tsv:2-8` records dedicated n11 library paths.
- `n11/logs/check.log:1-3`: usable exact-path check and five stale/incomplete receipt controls reported passed; only private library/base paths printed. QS2 behavior is part of `setup.R:38-56` and is called by verification (`:234`).
- `n11/logs/forced-failure.log:1-8`: intentional restoration child failure recorded. Complete caller/path-control PASS is reported by execution; this reviewer did not independently re-execute those controls.
- `n11/logs/evidence.log:1-37` and `scenario.log:103-160`: SYNA valid; SYNB invalid; total 2, valid 1, invalid 1, failed 0; specific missing-weight diagnostic present. This establishes completed malformed-input classification, not downstream rejection.
- `n11/first-failure.txt:1-2`: clean wrapper fails with `A single working release and identity are required.` The reproduced error has class `pipdata_dependency_context_error` (`n11/logs/reproduce.log:16-31`).
- `experiments/one-survey/reproduce.R:54-67` asserts zero master versions and empty clean/metadata catalogs in its separate reproducer store; `n11/logs/reproduce.log:32-33` reaches its explicit nonacceptance completion marker. This is failure-localization evidence, not proof of invalid rejection after successful valid processing.
- `scenario.R:148-178` retains real saved data/metadata version selectors, paired welfare/weight comparison, metadata comparisons, collapse weight sum and invalid-identity absence assertion. These checks were not reached; source presence is not passing evidence.

### Package provenance

Only pipdata and pipfun archived source was inspected for this code review. Their full SHAs are recorded above and in `n11/pins.tsv:3,8`. The complete installed evidence inventory (`n11/pins.tsv:2-8`) is:

| Package | Exact source SHA |
|---|---|
| stamp | `95890411e8bf9db842593c2b0ab68ec4f2a66b25` |
| pipfun | `7d534516a8c17c33d537681610eccd4c29211762` |
| pipload | `4ef0d90a974cb6ff0725da69373bde421dd04ad5` |
| wbpip | `fd2c687ed527ebe33d0a7addf9859f72f71ff39f` |
| dlw | `12faa058b521ef511073a7b21b1b1dd7993c9649` |
| pipaux | `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` |
| pipdata | `c5b27fa4458d7175aca81a203762bae81e9f0b40` |

## Gaps

- Phase 2 remains blocked at the public context boundary. Annual welfare conversion 365/730/1095/1460 to daily 1/2/3/4, paired weights 10/20/30/40, clean metadata values and exact saved data/metadata readbacks have no pass.
- Completed invalid classification is verified, but absence of invalid downstream artifacts after a successful valid cleaning path remains unverified. Empty catalogs during a setup failure are insufficient.
- Executed evidence-mode correction confirmation was not available at this review snapshot; worker was still finishing narrow corrections. No successful-scenario branch was exercised, and this review does not create synthetic success evidence.
- No reviewer R/lint/runtime rerun: review is intentionally read-only except this report. Fresh worker logs are evidence inspected, not independently rerun tests. Caller/path controls are not fully recertified by this code-quality report.
- Later concurrent edits and final consolidated `/cg-review mode:verify` are coordinator responsibilities; this report is one review role, not all review gates.
- Historical readback after a later save, live DLW, real auxiliary production, deflation, estimates and production are outside this example and uncertified. No new safeguards or dependency/framework expansion recommended; fix the smallest public compatibility boundary first.
