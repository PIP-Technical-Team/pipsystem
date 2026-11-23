---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-data-quality
status: completed
updated: 2026-11-11T19:12:12Z
owner: review-data-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Coordinator consolidates the package-context blocker and execution worker reproducer; Phase 2 remains blocked.
---

# Phase 2 data-quality review

## Summary
Full data-quality review completed for original Plan Phase 2 against current harness and saved n11 evidence. One supported P1 manual package-integration blocker; no additional supported harness data-quality defects found. This is review completion, NOT Phase 2 acceptance.

Real validation completed: SYNA valid, SYNB invalid, missing-weight diagnostic, n_failed = 0. Cleaning stopped at the public pd_process_data boundary. Annual-to-daily values, retained person weights, exact saved clean/metadata readbacks and invalid-input downstream rejection are NOT certified.

## Findings

**[P1]** `.tmp/one-survey/n11/sources/pipdata/R/dependency_contract.R:266` -- [manual] Public setup and cleaning consume incompatible release-context representations.

**Issue**: At pipdata SHA `c5b27fa4458d7175aca81a203762bae81e9f0b40`, `pd_dependency_context()` defaults to `getOption("pipfun.working_release")` and `getOption("pipfun.identity")` and rejects missing/non-scalar values at lines 270-273. The public clean wrapper calls this context at `R/pd_process_data.R:117-124`. Pinned pipfun SHA `7d534516a8c17c33d537681610eccd4c29211762` instead constructs the working-release list and saves it in `.pipenv` (`R/working_release.R:121-126,154-158`); its public getter retrieves that list (`:315-329`). Neither option name occurs in archived pipfun R sources. Harness setup is present (`experiments/one-survey/scenario.R:89`), and the real validation wrapper also calls setup (`pipdata/R/pipdata_dlw_process.R:681-686`).

**Impact**: The legitimate configured public path aborts before clean/metadata processing: `.tmp/one-survey/n11/logs/scenario.log:255-258` and `first-failure.txt:1-2` record “A single working release and identity are required.” The saved condition is `pipdata_dependency_context_error` (`logs/evidence.log:38-46`). This blocks V3 and the downstream part of V4. It is a fail-fast integration error, not evidence of silent corruption, incorrect statistical results, or a completed invalid-control rejection; P0 is not supported.

**Fix**: Package owner should reconcile dependency-context resolution with pipfun's public configured-release contract, preserving scalar validation and adding one functional public setup-to-clean check. Do not seed undocumented options in this harness, fabricate a master, invoke an internal worker, or bypass this boundary. Package source edits are outside this review. The execution worker owns the minimal reproducer; this review independently inspects existing saved evidence and archive source only.

## Evidence and data-quality assessment

- Installation/provenance: seven exact installation exits are zero (`.tmp/one-survey/n11/logs/setup.log:3-9`); usable-path and five stale/incomplete receipt controls passed (`:31`), V1 prints PASS (`:126`; `logs/check.log:1,96`). The preceding stamp exit 1 is the intentional missing-dependency control, not an unnoticed installation failure (`setup.R:145-153`). This reviewer did not rerun installs or revalidate binary contents.
- Schema and fixture inputs: annual welfare is explicitly numeric 365,730,1095,1460; weights are numeric 10,20,30,40; row identifiers are explicit (`scenario.R:15-22`). The malformed control has a distinct survey, checksum and artifact identity (`:27-34`) and removes only weight while renaming the survey (`:75-83`). Auxiliary keys and fixture-only provenance are explicit (`:35-40,91-119`); no producer certification is inferred.
- Actual classification: `logs/scenario.log:103-160` records validation success, two inventory rows with valid/invalid states and zero execution failures. `logs/evidence.log:1-37` independently renders saved validation/report objects and the exact missing-weight diagnostic. This is completed classification, not no-work or a swallowed validation exception.
- Harness gates: `scenario.R:128-138` requires successful wrapper/stage outcomes, one valid SYNA row, one invalid SYNB row, zero failed validations and the missing-weight report. `:139-145` saves before-state catalogs and calls the public clean wrapper. The saved before-state catalogs have zero rows in both downstream aliases (`logs/evidence.log:161`); before-state emptiness alone is NOT a rejection test.
- Numerical and row integrity: code compares paired welfare/weight rows against `(1,10),(2,20),(3,30),(4,40)`, rather than independently sorting vectors, checks total person weight 100 and metadata survey/CPI/PPP (`scenario.R:162-172`). These checks are present but NOT reached. No realized conversion, retained weight, type, row-count or metadata-value pass is claimed.
- Exact storage: code takes separate returned data and metadata version IDs and passes each to the public reader (`scenario.R:148-161`); this path is NOT reached. The n11 directory listing contained no `master.rds`, `exact-readbacks.rds`, `downstream-after.rds` or `scenario-assertions.txt` at inspection. No saved-pin correctness or historical-version selection is certified.
- Invalid downstream control: after-catalog assertions and PASS marker occur only after successful clean/readback assertions (`scenario.R:173-179`). Their absence and the context abort prevent claiming invalid data cannot reach downstream outputs. No observed invalid clean artifact or silent row loss is alleged.
- Known separate findings: the worker has already changed the stale scenario header (`scenario.R:1`) and made evidence reporting conditional (`setup.R:70-84`). The inspected n11 evidence.log still shows the older text at lines 161-163. No executed verification of the revised evidence mode was available to this reviewer; this is not treated as a new duplicate finding.

## Changes
Only this requested handoff created and updated. No harness/package source edits, downloads, Git mutations, package installs or R execution by this reviewer. No protected paths changed. Minimal first: no additional framework, safeguard, dependency or plan expansion proposed; only one package functional check is suggested for the actual blocker.

## Checks run
1. Loaded technical communication and R technical, analytical, data.table and collapse skills; read local dialect, charter, design, harvest brief, original Plan and handoff contract.
2. Read current scenario.R, setup.R and run.ps1; assessed schema, numeric/missing-value control, keys, paired-row assertions, error gates and exact pin selectors. No boundary execution.
3. Read n11 pins.tsv, first-failure.txt, complete scenario.log/evidence.log, directory listing; searched setup/check logs for installation/control outcomes.
4. Inspected only the in-checkout n11 archived pipdata/pipfun source for context attribution; searched archived pipfun R code for the two option names (no matches). No external package repository was read. Source snapshot provenance: pipdata `c5b27fa4458d7175aca81a203762bae81e9f0b40`; pipfun `7d534516a8c17c33d537681610eccd4c29211762`, recorded in n11/pins.tsv:3,8.
5. All seven recorded install pins (n11/pins.tsv:2-8): stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; pipfun `7d534516a8c17c33d537681610eccd4c29211762`; pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5`; wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`; dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`; pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`; pipdata `c5b27fa4458d7175aca81a203762bae81e9f0b40`.
6. Read-only Git recorded pipsystem branch main and HEAD `e9c71e3190f1ce88a017ae25af7c373a64c655a2`; system clock recorded 2026-11-11T14:10:56-05:00. Only tool-based report writes under E:/pipsystem; no command capable of indirect runtime/cache writes was executed.
7. Reported material package-context attribution to coordinator. No reviewer attempt to rerun or bypass the boundary.

## Gaps
- Phase 2 remains blocked: V3 numeric/paired-row clean data, exact saved data/metadata readbacks and V4 downstream rejection were not reached. Classification alone is insufficient.
- Saved RDS contents were consumed through the worker's existing text evidence/logs, not directly deserialized by this reviewer. No new R process was started.
- Worker minimal reproducer and revised evidence-mode execution were still pending at this review checkpoint; coordinator must consolidate their final artifacts. Current source and saved runtime logs are distinguished above.
- No production, live DLW, deflation/mean, incremental rebuild, historical read after a later save, auxiliary producer or broader statistical inference certification. No actual clean output was available to assess.
- Later concurrent changes are outside this checkpoint. Full combined final verification remains the coordinator's responsibility, not established by this role's review completion.
