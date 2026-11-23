---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T223219Z-qmd-acceptance/data-quality
status: completed
updated: 2026-11-13T22:53:36Z
owner: cg-data-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinator consolidates continuation reviews and performs pending V5 verification.
---

# Narrow Qmd acceptance data-quality review

## Summary
No supported P0-P3 data-quality issues found in the narrow continuation.
The changed pipdata source pin and retained Qmd assertions agree with actual
rendered first-save evidence. This conclusion is limited to the synthetic
offline fixture; it does not certify B6 later-refresh/history.

Scope followed review-brief.md:3-62, current run handoff.md:18-73 and
.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:160-228.
No broad package/Qmd/style review repeated; no protected decisions changed.

## Findings

Explicitly no issues found. No safe_auto, manual or advisory remediation
finding is supported by this continuation's inspected evidence.

## Changes
Only this report created and finalized at the exact dispatched E: path.
No source edits, other file writes, package changes, commands, pipeline runs,
installs, downloads or Git mutations. No package repository was read; the
seven archived package SHAs below are inspected runtime provenance, not
independent package-source reviews.

## Checks run
All review checks were static source/artifact inspections. Required shared,
technical, data.table, collapse, testing and analytical R skills loaded.
No tests or rendering independently executed by this reviewer.

Evidence root R = .tmp/one-survey/qmd-acceptance-20261113/.
Rendered evidence H = R/qmd-20261113-acceptance/pip-pipeline.html.
These are actual runtime outputs, not .cg-docs/views artifacts.

- Source pin: experiments/one-survey/setup.R:9-22 agrees with R/pins.tsv:2-8.
  Exact archived source SHAs retained:
  stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25;
  pipfun 7d534516a8c17c33d537681610eccd4c29211762;
  pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5;
  wbpip fd2c687ed527ebe33d0a7addf9859f72f71ff39f;
  dlw 12faa058b521ef511073a7b21b1b1dd7993c9649;
  pipaux 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be;
  pipdata 53a76e379c81a3ac70b39925954981ae6a691459.
  setup.R:205-241 checks inventory equality, dependency records, receipts,
  archive/installed metadata hashes and loaded namespace paths.
  R/logs/check.log:1-3,28-29,94-96 records successful private-path verification.
- Numeric pairing: experiments/pip-pipeline.qmd:72-94 fixes annual welfare
  365,730,1095,1460 and person weights 10,20,30,40. Its :239-261 reads exact
  returned saved versions, compares the entire paired numeric table using
  identical(), checks survey ID/CPI/PPP and sums weights to 100.
  H:2682-2696 actually displays both matching daily welfare/weight tables
  (1,10), (2,20), (3,30), (4,40). No independent sorting or NA removal masks
  mispairing/missing values. R/qmd-20261113-acceptance/results.tsv:7 records
  PASS after all these assertions, including total weight.
- Exact pins: Qmd:208-224 extracts clean and metadata versions from the real
  master result; :239-244 passes these explicitly to pip_read(). H:2628-2641
  displays clean ab5f8ecf4163c542 and metadata 68b3b5b50c5dc90b; H:2815-2831
  shows matching catalog versions and only the valid SYNA paths.
- Metadata: H:2710-2712 and :2751-2753 display CPI 1.4 (2021 national) and
  PPP 1.6 (2021/01/01 national); :2772-2776 displays the correct survey ID
  AAA_2010_SYNA_V01_M_V01_A_GMD_GPWG and year 2010. Qmd:255-260 retains
  exact survey/CPI/PPP assertions rather than accepting mere existence.
- Invalid/no-output: qmd-fixtures.R:79-89 actually removes weight from SYNB
  and writes through pipload; :48-90 replaces external transport only.
  Qmd:173-189 requires successful completed validation, one valid/one invalid
  record, zero failed jobs and the actual missing-weight error. H:2538-2574
  displays those classifications and the diagnostic. Qmd:275-288 runs catalog
  exclusion only after processing/readback succeed, checking both pip and
  pip_meta aliases case-insensitively. H:2815-2831 contains only SYNA clean
  and metadata artifacts; results.tsv:5-8 records the completed checks.
- Failure semantics: Qmd:24-42 initializes NOT RUN and records FAIL with the
  actual message. check-qmd.R:14-31 exercises that implementation, not a
  duplicate. R/logs/qmd-check.log:1-4 records intentional synthetic FAIL and
  all three focused groups passing. It is not a failed survey/package run.
- Boundary: Qmd:16-18,294-309 and H:2923-2927 explicitly separate first-save
  acceptance from B6 and later stages. Work-report:227-228 preserves B6 as
  historically failed/open. run.ps1:67-96 requires a fresh render/store and
  verifies source-copy equality; paths.ps1:1-33 checks redirected trees.

## Gaps
- No independent execution, binary QS2/RDS deserialization, source hash
  recomputation or exhaustive OS-level write audit was performed. The
  reported SHA256 is retained provenance from the coordinator, not a hash
  recomputed by this read-only review.
- Package internals, broader data distributions, live DLW, auxiliary producers,
  deflation, means, incremental reruns and production remain outside scope.
- First-save evidence cannot certify B6 later-refresh/history; that historical
  failure remains open, not repaired or waived.
- V5 consolidation and light final verification belong to the coordinator and
  remain pending per the inspected work-report:220,227. This review alone
  does not complete the original Plan.
