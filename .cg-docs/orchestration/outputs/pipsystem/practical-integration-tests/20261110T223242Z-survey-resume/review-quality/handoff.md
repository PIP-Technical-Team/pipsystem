---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-quality
status: partial
updated: 2026-11-10T22:43:35Z
owner: cg-code-quality
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 77b6424046367f8283d89c87d9c5767ab9d01915
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Worker corrects diagnostic wording; parent obtains scenario review once implementation exists before full-route verification.
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
