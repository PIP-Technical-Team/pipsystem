---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-testing
status: completed
updated: 2026-11-11T19:12:05Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md, Phase 2
next: Coordinator consolidates package-context blocker and unfinished V3/V4 acceptance; no affected package rerun.
---

# Testing review

## Summary
Full testing review of original Plan Phase 2, all six example scripts, and preserved fresh n11 logs completed. No additional harness testing defect found. One P1 manual package integration blocker is confirmed below; this is not a missing test assertion and is shared with the data-quality review, not a second independent defect.

The valid/invalid validation assertions passed. Cleaning fails before numerical or exact-version readback assertions; malformed downstream rejection is NOT certified. Original Plan Phase 2 remains blocked, not complete (Plan lines 50-53, 90-92, 110-114).

## Findings

**[P1]** `.tmp/one-survey/n11/sources/pipdata/R/dependency_contract.R:266-273` -- [manual] Public setup and clean wrapper disagree on release context.

**Issue**: At pipdata `c5b27fa4458d7175aca81a203762bae81e9f0b40`, `pd_dependency_context()` reads `pipfun.working_release` and `pipfun.identity` options, but pinned pipfun `7d534516a8c17c33d537681610eccd4c29211762` records the release descriptor in `.pipenv` (`.tmp/one-survey/n11/sources/pipfun/R/working_release.R:121-126,150-158`). The public wrapper calls that context at `sources/pipdata/R/pd_process_data.R:117-123`. Scenario actually calls public setup (`experiments/one-survey/scenario.R:89`), then the wrapper fails (`n11/logs/scenario.log:255-258`). The minimal public reproducer asserts successful returned setup descriptor, absent options, the exact error class/message, and empty master/data/metadata outputs (`experiments/one-survey/reproduce.R:40-68`; executed `n11/logs/reproduce.log:1-33`). This is a cross-package compatibility blocker, not evidence of invalid-survey rejection or incorrect numbers.

**Fix**: Package owner must reconcile public setup/context access and check the public setup-to-wrapper integration against the retained pipfun pin. Preserve this failure and do not seed hidden options, fabricate a master, invoke internal workers, change package pins, or rerun the affected route within this review. After an approved package correction, the original fresh functional example must reach its existing numeric/readback and downstream-absence checks. No new framework or expanded test matrix is needed.

No P0, additional P1, or unresolved P2/P3 harness testing findings identified. Previously reported evidence-mode P2 and stale-header P3 have narrow source corrections visible in `setup.R:70-84` and `scenario.R:1`; refreshed failed-run evidence output is truthful (`n11/logs/evidence.log:161-163`). The future successful-run evidence branch is statically reviewed only, not executed or certified.

## Changes
Only this reviewer-owned handoff created and finalized. No example source, package, download, installation, Git, or protected-path changes by this reviewer. Other workers' concurrent changes were read, not modified.

## Checks run
- Loaded technical communication, R testing, R technical, R analytical and data.table skills; read charter, design, harvest brief and pip-handoff-v2 contract.
- Read original Plan revision 1, especially Phase 2 and completion contract. Read `setup.R`, `scenario.R`, `reproduce.R`, `run.ps1`, `checks.ps1`, and `paths.ps1` in full. This is an installed-package integration example, not a package unit suite; no recommendation to convert it into one.
- Read-only `git status --short`, `git rev-parse HEAD`, and scoped `git diff` confirmed current pipsystem HEAD above and visible authorized two-pin changes plus narrow worker-owned evidence/header/reproducer deltas. Existing unrelated dirty paths were not staged or altered. Read system clock for report timestamp; no runtime started by reviewer.
- Reviewed `n11/pins.tsv:2-8`: stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; pipfun `7d534516a8c17c33d537681610eccd4c29211762`; pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5`; wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`; pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`; pipdata `c5b27fa4458d7175aca81a203762bae81e9f0b40`. Only archived pipfun and pipdata implementation source was inspected for this review; no external package checkout read or changed.
- Setup and dependency failure: `n11/logs/setup.log:1-9,31-33,126` records intentional missing-cli failure, seven zero-exit installations, usable packages and five rejected stale/incomplete controls. Actual QS2 roundtrip/hash/namespace checks are explicit at `setup.R:38-55,223-240`; setup PASS is conditional on them. `n11-red/logs/baseline.log:1-9` preserves expected missing-pipfun baseline.
- Boundary tests: read `n11-fixtures/checks.log:22-49`, covering traversal, redirects, source/library reuse, hard-linked log and ancestor controls, with specific rejection reasons. `checks.ps1:21-28` checks expected failure and caller environment/error preference, not simply any error.
- Caller restoration: `checks.ps1:105-121` covers successful check and deliberate failure with prior/unset values. `n11/logs/check.log:1-3,96` verifies usable package paths/receipt controls; `forced-failure.log:1-8` contains the deliberate failure. Worker reports successful parent-level restoration in `implementation/handoff.md:34`; child logs alone do not prove parent environment restoration.
- Real validation: `scenario.R:128-138` requires successful execution, exactly one SYNA valid and SYNB invalid row, zero validation execution failures, and specific missing-weight diagnostic. `n11/logs/scenario.log:103-160` and `evidence.log:1-37` confirm these outcomes. Distinct identity/checksum and actual missing weight are explicit (`scenario.R:27-34,75-83`). No stochastic fixture or external production input.
- Unreached acceptance: `scenario.R:148-172` takes actual master pins separately for data/metadata, passes exact versions to public reads, and compares paired welfare/weight rows against fixed expected daily values and total weight, with metadata assertions. `scenario.R:173-179` checks both catalogs for malformed identity absence and only then writes PASS. No missing assertion or premature PASS identified. Numeric equality intentionally checks this exact deterministic fixture, not stochastic estimation.
- Transport/mock review: replacements target release/catalog/download I/O and have on-exit restoration (`scenario.R:43-85`). Auxiliary fixtures are disclosed (`:35-40,90-119`), and real validation/clean/storage functions remain unmocked. Actual n11 run did not expose HTTP/mock-target drift; future paths remain unexecuted.
- First failure and reproducer: read `n11/first-failure.txt:1-2`, `scenario.log:255-258`, and `reproduce.log:16-33`. Reproducer success means reproducing the expected failure, not scenario acceptance.
- Reviewed worker correction diff and reread refreshed evidence log: `evidence.log:161-163` now says numerical/readback NOT PASSED and downstream rejection NOT CERTIFIED. Source header references the current setup pin, not the old revision. No scenario/package rerun, Pester, direct Invoke-Pester, get_errors, or execution_subagent used by reviewer.

## Gaps
- V3 numeric values, metadata values and exact saved-version readback have not been reached. Correct-looking assertions are not executed acceptance.
- V4 completed invalid classification and diagnostic are proven; no-output-before-failed-wrapper and empty reproducer stores are not proof that successful downstream processing rejects malformed data. The after-catalog assertion remains unreached.
- RDS evidence was assessed through executable assertion source, human-readable preserved logs, and directory entries, not independently deserialized or rerun by this reviewer. No claim of independent end-to-end execution.
- Successful-run evidence export branch has static review only; real successful data/readback artifacts cannot be generated without resolving the package blocker. Historical version selection after a later save remains explicitly outside this example's proof (Plan:64).
- Worker and coordinator artifacts were still being finalized concurrently. This report does not certify other roles or final `/cg-review mode:verify`; coordinator owns consolidation and owner direction.
- Scope retained: smallest deterministic functional example, one malformed control, installed tools, no new dependency/framework/extra safeguards. No package fixes or pin changes authorized by this review; all reviewer writes stayed in this exact E: pipsystem report.
