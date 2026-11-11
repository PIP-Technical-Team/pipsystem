---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-quality
status: partial
updated: 2026-11-10T22:56:20Z
owner: cg-code-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 77b6424046367f8283d89c87d9c5767ab9d01915
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Parent records focused P2.1 correction verification and assesses new pd_process_data master-inventory failure; no complete scenario pass.
---

# Survey example code-quality review

## Summary
Bounded static review finished with one P3 wording defect. No supported P0-P2 code-quality defects found in the inspected four-file setup/launcher snapshot. This is NOT full-route clearance: scenario.R was absent in the inspected directory. Implementation is concurrent; later source and execution are not reviewed by this report. Findings sent early to parent and implementation worker on the board.

### Findings

**[P3] [safe_auto]** `experiments/one-survey/setup.R:243` -- Persisted diagnosis falsely says pipaux is not installed.

**Issue**: The diagnostic state's downstream field says `NOT RUN: no pipaux install, survey, storage or numeric scenario`, but packages include pipaux at line 10 and diagnose mode verifies the seven-package inventory at lines 204-206, including loading required namespaces at line 35. Consumers of diagnostic.rds receive a false installation-scope statement.

**Fix**: Use `NOT RUN: survey, storage or numeric scenario`; retain the distinction between installed packages and unexecuted survey processing. Reviewer did not apply the change. This agrees with the architecture review's earlier observation, not an additional independent defect.

## Changes
Only this required report created and updated. No code changes, tests, downloads, package edits or Git mutations.

## Checks run
Read project charter/design/harvest constraints, handoff contract, original revision 1 Plan, complete resumption specification and original Work Report. Loaded required R technical, analytical, shared, data.table, collapse and testing skills after reading the dialect router and local data.table-collapse setting.

Static checks:
- setup.R:9-22 matches the seven recorded Work Report pins at lines 49-57 with only pipfun updated to the authorized 7d534516a8c17c33d537681610eccd4c29211762.
- setup.R:80-85 archives explicit SHAs and extracts to fresh sources; lines 118-146 derive dependency postorder from Depends/Imports/LinkingTo; lines 152-158 install in that order. This is code inspection, not independent execution or archive-content verification.
- run.ps1:38-64 sets process-local runtime roots before R children; lines 94-102 retain nonzero-exit handling and finally-based environment restoration. checks.ps1:11-29 compares caller environment/error preference, and lines 105-121 exercise success and intentional child failure. These checks were read, NOT executed by reviewer.
- paths.ps1:1-33 checked statically for checkout-bound output and redirected/hard-linked source/output refusal.
- Read-only git rev-parse HEAD/branch returned main at 77b6424046367f8283d89c87d9c5767ab9d01915, differing from supplied baseline f9454707b292a620e25abef17f2e515794020ba7; parent notified. No reviewer Git mutation.
- Read-only git diff for four target paths returned no unstaged diff; targeted status showed all four staged additions (preexisting/concurrent state, not reviewer staging).
- Read-only git hash-object identified reviewed files in this order:
  - setup.R, 251 lines: a818d5bf831b8aef9599ecf64cd1d78024b59764
  - run.ps1, 103 lines: b17d814f5529d4f417b5202af3405f07d53fba55
  - paths.ps1, 33 lines: 09f1f119f80c5b17a045dbeedc521c577f5e8ede
  - checks.ps1, 122 lines: 1d2cbc7081dab4374b373f027c0e66c16bd503a3
- Initial clock command Get-Date -AsUTC failed because Windows PowerShell 5.1 lacks that parameter. Corrected with (Get-Date).ToUniversalTime(); final recorded snapshot time 2026-11-10T22:43:35Z.

## Gaps
- scenario.R absent at directory inspection: no validation, cleaning, metadata, transport substitutions, row alignment, version readback or malformed-control scenario reviewed. These require review of the actual forthcoming file, not inferred approval.
- Runtime tests, installer execution and evidence-log validation not performed; worker's reported V1 execution is peer context, not independently verified here.
- No package repository or archived package source read directly; therefore no new package repository HEAD claims. Listed source pins are verified only against local Plan/Work Report and setup code.
- Concurrent edits and staged state may change after this snapshot. P3 correction and later source remain unverified.
- Full-route completion remains parent-owned after scenario implementation, required remaining reviews and fresh verification. No additional safeguards or speculative framework recommendations introduced.

## Final-scope checkpoint — 2026-11-10T22:50:04Z

### Summary
Authorized follow-up reviewed the ACTUAL scenario.R, current setup.R and current run.ps1. **No new supported P0-P3 code-quality issues found.** The initial P3 is **resolved**, verified at current setup.R:248: `NOT RUN in diagnostic mode: survey, storage or numeric scenario`. Worker had corrected this before the parent's leave-line message; no second fix requested or credited. Initial review scope and observations above remain as historical snapshot evidence, superseded by this checkpoint where noted.

This is a completed bounded static inspection of the actual scenario, NOT an end-to-end pass. The retained execution stopped at `pipdata::dlw_gmd_list` before validation. V2-V4 have not passed.

### Changes
Appended this checkpoint and refreshed report metadata only. No implementation edits, tests, R execution, package reads/edits, Git operations or downloads in this follow-up. All reviewer writes were to this E-checkout report.

### Checks run
Read these actual current files in full during this follow-up (line references apply to this read snapshot, not future edits):
- scenario.R:1-191: starts with offline-example/transport-only disclosure; ends with main().
- setup.R:1-256: seven original source pins except authorized pipfun update; includes new session-info.txt/installed-packages.tsv writers at :207-211 and corrected diagnostic at :248.
- run.ps1:1-108: scenario/reproduce modes at :1 and explicit script selection :94-99, followed by nonzero child handling :101-102 and restoration in finally :103-108.
- Runtime first-failure.txt:1-2 and logs/scenario.log:1-10 under .tmp/one-survey/resume-20261110-full.
- Existing reviewer handoff and incremental coordination board, including worker's corrected-wording and first-failure notices. No independent package source verification is claimed from peer findings.

Static scenario inspection:
- :15-42 defines and discloses synthetic survey/catalog values, distinct SYNB missing-weight checksum/identity, substituted transport and auxiliary fixtures.
- :44-85 confines namespace replacements to named acquisition endpoints; each installed replacement gets on.exit restoration. Download substitute uses real pipload::pip_write rather than an acceptance worker.
- :87-125 executes exported release setup, auxiliary writes, catalog acquisition and validation entry points in a linear example, not a new planner/orchestrator.
- :128-138 requires completed successful validation execution with one valid and one invalid classification plus the specific missing-weight diagnostic. No-work or execution error is not counted as malformed rejection.
- :143-161 calls pd_process_data, obtains separate saved clean/metadata version IDs and passes them explicitly to real pip_read calls.
- :162-172 compares paired welfare/weight rows against literal daily values 1,2,3,4 and unchanged person weights 10,20,30,40, plus metadata fixture values. These assertions remain unexecuted past the observed acquisition stop.
- :173-179 checks no malformed-identity downstream catalog paths and writes V2/V3/V4 PASS only after every preceding assertion succeeds.
- :181-187 retains the first boundary/message/condition evidence and rethrows rather than bypassing it. Runtime first-failure.txt:1 names pipdata::dlw_gmd_list and :2 says `The intended acquisition inventory could not be verified durably.` scenario.log:1,8-10 confirms the durable-write verification error and halted execution.

### Gaps
- Current exact inspected scope is the full 191/256/108-line file contents returned above, read before this 22:50:04Z checkpoint; no later edits reviewed. This follow-up runs no Git operations, so it does not refresh the earlier HEAD or source blob hashes. Earlier hashes describe ONLY the initial four-file snapshot, not these updated files.
- Initial scenario-absent and P3-unverified limitations are superseded: actual scenario now inspected and P3 resolved. Initial no-execution and no-direct-package-read limits still apply.
- No V2-V4 success: validation, malformed classification, cleaning, metadata, numeric oracle and exact-version reads did not execute after the captured acquisition failure. Assertions present in source are not acceptance evidence.
- The error identifies the acquisition persistence boundary, not an independently established package-versus-fixture root cause. Minimal reproducer is worker-owned and was not inspected or executed in this bounded follow-up; no fix to pipdata or another package is recommended on unsupported attribution.
- Parent still owns consolidation, reproducer/owner assessment and required final verification. Overall implementation remains incomplete/blocked even though no new code-quality defect was found. No speculative safeguards or function-splitting framework requested for this one-use linear example.

## Focused correction 1 checkpoint — 2026-11-10T22:56:20Z

### Summary
**No new supported P0-P3 code-quality issues found.** Source and retained setup evidence support the requested correction of consolidated **P2.1**, the initial required-storage-usability omission. The original seven-namespace-only assessment was insufficient and is not retroactively treated as a full suitability pass. This appendix verifies the new bounded correction, not a pipdata package defect or complete scenario acceptance. Parent owns consolidated finding status.

**P3.1 remains fixed**, now setup.R:264; no additional correction or finding count.

### Changes
Only this report metadata and appendix updated, preserving earlier snapshots. No tests, code edits, R execution, polling, package operations, Git operations or downloads. All reviewer writes remain in the E-checkout report. The parent-owned consolidated Review Report was read, not edited.

### Checks run
Read CURRENT setup.R in full, **272 lines**, ending with diagnostic-mode block at :251-272. Exact correction inspected:
- :25-30 selects ONLY qs2, stringfish and RcppParallel from existing E:/PovcalNet/01.personal/wb384996/R/win-library/4.5-pipapi; all other contributed dependencies retain the 4.5 source. The selector is explicit, not ambient fallback.
- :138-159 reuses this selector during dependency traversal, checks redirected copy inputs, copies to the fresh private library and records origin/version/destination/DESCRIPTION checksum.
- :195-198 checks provenance origin against the SAME selector, plus destination version and checksum; no stale hardcoded 4.5-only verification remains.
- :42-45 performs real qs2::qs_save/qs_read of list(value = 1:4), requiring exact equality before the usability routine returns. :51-55 then checks loaded namespace roots; :211-217 checks dedicated dependency paths. This is one functional check of a required operation, not an extra speculative safeguard.
- :16-22 retains the same seven authorized ecosystem pins; :96-103 still archives exact commits into fresh sources. No ecosystem pin changes introduced by this correction.

Read correction1 evidence under .tmp/one-survey/resume-20261110-correction1:
- dependencies.tsv **lines 1-20 only** of the 108-line table: :10-12 record RcppParallel 6.2.0, stringfish 0.19.2 and qs2 0.2.2 from the explicit 4.5-pipapi source with private destinations and checksums.
- logs/setup.log **all 126 lines**: :1-2 intended missing-dependency red; :3-9 seven installation exit-zero entries; :31 verification/stale-control acceptance; :32-33 private library roots; :54-65 and :92-93 native-dependency namespace paths; :126 setup acceptance. In conjunction with the inspected unconditional gate, this supports successful QS2 roundtrip in that retained setup execution. There is no separate printed QS2 roundtrip marker; reviewer did not execute it.
- first-failure.txt **all 2 lines** now names `pipdata::pd_process_data` and `No version files found in 'pip_master_inventory.qs2'.`
- logs/scenario.log **all 258 lines**: :107-108 validation outcome success; :123-126 SYNA valid and SYNB invalid; :140-147 one valid, one invalid, zero execution failures. :255-258 then reports the missing master-inventory version and halted execution. These are retained execution observations, not reviewer reruns.
- Read current parent consolidated Review Report (49-line snapshot) to align P2.1/P3.1 identifiers. No duplicate finding introduced.

### Gaps
- This is a focused setup correction review, not a reread of scenario/run/paths/checks in this checkpoint. Earlier inspections cover only their earlier snapshots. No source hashes or Git HEAD refreshed because Git operations are excluded.
- Only provenance rows needed for the correction were read; remaining dependency rows, native binaries, original loader diagnostics and actual inventory.rds bodies were not independently rechecked. User/worker attribution of the original native-loader incompatibility is context; this reviewer directly confirms the explicit source correction and retained acceptance evidence, not an independent native-loader diagnosis.
- New scenario evidence progresses beyond the original acquisition stop to completed validation, but ends at pd_process_data. It does NOT establish complete V2-V4, numeric cleaning, metadata/exact-version readback or no-downstream-after-processing success. Root cause of the new master-inventory failure remains UNKNOWN in this focused review; no package patch or bypass recommended.
- Parent must reconcile consolidated status, preserved failures, correction budget and remaining checks. No Plan completion or full-route clearance inferred from corrected storage usability.
