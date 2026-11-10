---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-adversarial
status: partial
updated: 2026-11-10T22:44:11Z
owner: cg-adversarial
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 77b6424046367f8283d89c87d9c5767ab9d01915
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent reviews worker final scenario and actual V2-V4 evidence before completion or final verification.
---

# Adversarial full-route review

## Summary
No issues found in the inspected setup/isolation snapshot. Zero supported exploitable P0/P1/P2 findings; no P3 suggestions manufactured. This is a partial adversarial review, not full-route clearance: scenario.R was absent in both inspected directory snapshots and V2-V4 could not be reviewed.

The supplied starting SHA was f9454707b292a620e25abef17f2e515794020ba7. Read-only Git commands during review found main at 77b6424046367f8283d89c87d9c5767ab9d01915; the same SHA was observed at exit. Status showed staged historical reports/experiment additions, an active-state modification and untracked resumption reports. Concurrent changes are not reviewer changes.

## Findings
No issues found within inspected files/evidence. No outside-checkout write, ambient fallback, data corruption or incorrect numerical result is asserted as observed. Missing scenario coverage is recorded below as an explicit verification limitation, not attributed as a defect in an unfinished concurrent implementation.

## Changes
Only this required handoff created and updated. No source, package, Git or runtime mutations; no downloads or test execution. Early scope/evidence limitations sent to parent and implementation worker ses_e3862e2e4ffe8FYxJwHO80Bh25.

## Checks run
Static review and existing-log inspection only:

- Read original revision-1 Plan, resume-prompt task specification, project charter/design/harvest rules and coordination contract. Loaded technical communication, R technical and analytical skills.
- Read all of experiments/one-survey/setup.R (251 lines), run.ps1 (103), paths.ps1 (33), checks.ps1 (122). Directory snapshots contained those four files, not scenario.R.
- setup.R:9-22 pins all seven ecosystem packages at full SHAs; comparison to original Work Report:49-57 confirms only pipfun changed. setup.R:80-85 uses exact Git archives, not dirty-tree copies. setup.R:118-146 traverses DESCRIPTION Depends/Imports/LinkingTo and copies non-ecosystem dependencies separately before ecosystem installs at :152-158. dependency origin/version/description hash recorded at :139-142, checked at :173-182.
- run.ps1:12-33 checks runtime ancestors/descendants and R copy sources before destination creation. paths.ps1:1-33 rejects reparse points and hardlinks. setup/baseline require fresh run roots (:14-15); existing check roots are inspected before writes. run.ps1:38-64 redirects temp/home/R/config/cache/log roots before R or installer children; dedicated private R startup audit at :74-90 rejects ambient library search paths. setup.R:31 and :41-45 inspect actual R temp/home/library and loaded namespace locations. These source checks are not OS-level comprehensive write tracing.
- Fresh evidence root inspected: .tmp/one-survey/resume-20261110-full/. logs/setup.log:1-9 records deliberate missing-dependency failure followed by seven successful installer exits; install-*.log each has matching DONE. logs/install-missing-declared-cli.log:1 names the missing declared dependencies including cli. logs/setup.log:31-120 records namespace-path checks in dedicated/private R libraries. No reviewer process ran this setup.
- logs/child-startup.log:1-25 records actual installer, staged lazy-load, check and intentional failure children with dedicated/private-R library paths. Temp input files for staged children also appear under this runtime. It does not log every inherited environment variable or every write.
- dependencies.tsv:1-108 is readable provenance for 107 copied dependencies, with origins outside the checkout read-only and destinations within the dedicated runtime. logs/repository-status.txt:1-23 records archived/checkout package SHAs and separately discloses dirty stamp/pipload checkout state (not included in exact archives).
- logs/outer-green.log:113-123 retains the actual intentional R child failure and outer caller-environment/error-preference restoration assertion marker. The positive check output and dedicated namespace paths are also retained (:23-112).
- Fresh .tmp/one-survey/checkpoint-20261110T224226Z-fixtures/checks.log:22-49 retains traversal, helper redirect, recursive redirect, populated-root, hardlinked-log and ancestor rejection controls, ending in the ten-control success marker. These are worker/parent logs, not independently rerun tests.
- Read all 324 lines of fresh logs/source-hooks.txt. This is the setup's recorded named-hook inventory, not independent inspection of all third-party hook bodies or proof that every possible hook was discovered.
- Read-only terminal checks: git status --short; git rev-parse HEAD; git branch --show-current; Get-Date -Format o. No package repository was directly read or queried by this reviewer.

### Package SHAs represented in inspected archive/hook evidence
These are recorded local archive pins from setup.R:16-22 and logs/repository-status.txt, not independently refreshed repository attestations:

| Package | SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | 13a38280c1eafe7e03a97837cdb57833fbe9d926 |

## Gaps
- scenario.R was absent at inspection. Real documented exported path, transport-only substitutions/release catalog, absence of internal bypass, bounded row alignment (365/730/1095/1460 to 1/2/3/4 with weights 10/20/30/40), actual data/metadata saved-version IDs and completed missing-weight invalid control with no downstream artifacts are UNINSPECTED/UNKNOWN. No V2-V4 pass claimed.
- Concurrent worker may add or change files after this snapshot. Parent owns final-scope inspection and required final verification; this report does not clear unseen edits.
- No tests, scenario, child process, package installation or downloads executed by reviewer. No runtime binary inventory.rds decoding, archive digest recalculation or repository-SHA refresh performed. Existing logs provide evidence of recorded setup checks, not independent repeatability certification.
- No exhaustive filesystem-write tracing; inherited tool-specific environment variables and every possible third-party hook were not independently enumerated. No evidence-based exploitable escape was found in the inspected code. Caches/paths outside the declared settings remain unverified rather than claimed safe.
- Historical version selection after a later save, live DLW, deflation, mean and incremental certification remain out of scope. Protected artifact bodies were not viewed and no removal/replacement was recommended.
