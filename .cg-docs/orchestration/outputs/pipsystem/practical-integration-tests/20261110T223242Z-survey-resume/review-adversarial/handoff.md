---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T223242Z-survey-resume/review-adversarial
status: partial
updated: 2026-11-10T22:50:04Z
owner: cg-adversarial
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 506d8aa80230a32f6f6beee478c98a65488aa74e
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent preserves blocked V2-V4 state and reviews worker public-call reproducer and owner direction before final verification.
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

## Final-scope checkpoint — 2026-11-10T22:50:04Z

### Summary
The earlier absent-scenario limitation describes the initial snapshot and is preserved above, not the final-scope source coverage. Authorized follow-up inspected the actual 191-line scenario.R, blob eb6c41e4bbdf2c89c1e07909f465c55285d9f724. No issues found in this additional adversarial source review; zero supported P0/P1/P2 findings. This is NOT original Plan clearance or a V2-V4 pass. Actual execution failed at pipdata::dlw_gmd_list before validation.

### Changes
Appended only this checkpoint and updated report metadata. No tests, code/package edits, downloads, Git mutations or runtime writes by reviewer. Read-only live HEAD now 506d8aa80230a32f6f6beee478c98a65488aa74e on main; source identity is separately recorded by scenario blob because worker changes are concurrent.

### Checks run
- Read scenario.R:1-191, logs/scenario.log:1-10, first-failure.txt:1-2, runtime directory entries, current launcher dispatch :90-108 and current setup pin lines. Loaded data.table and collapse review skills in addition to previously loaded R skills. No package repositories directly read or queried.
- scenario.R:3-12 uses the existing runtime, sources setup.R and re-verifies the seven-install inventory before the scenario, then directs dependency manifests to the isolated root. setup.R:16-22 still matches the seven-pin table above. Updated launcher dispatch selects scenario.R/reproduce.R explicitly, not an internal acceptance script.
- Substitutions are disclosed at :35-40. Actual namespace replacements at :56-85 target release/PPP-file acquisition, remote file information, server catalog and fixture download. The download writes fixture data through exported pipload::pip_write; fixture auxiliaries also use exported writes (:116-120). No internal worker/acceptance harness or replacement of validation, cleaning, metadata or persistence routines appears in the inspected scenario. This is source inspection of the replacement boundary, not proof of compatibility with unexecuted package calls.
- Namespace restoration at :43-85 captures each original binding and re-locks it after substitution; each successful substitution immediately registers an on.exit restoration in main. tryCatch rethrows failures (:181-187), causing main's registered restorations to run. No code path intentionally retains the replacements after main returns. Runtime restoration equality was not logged/asserted independently, so it is not represented as tested.
- Fixture source rows pair annual welfare 365/730/1095/1460 with weights 10/20/30/40 (:16-22). Expected daily welfare and weights are compared as a paired two-column table, not independent sorted vectors (:162-172); total weight is also asserted. This is a strict bounded oracle, not a successful numeric check in this run.
- The malformed SYNB identity and checksum differ from SYNA (:23-34); its download removes weight (:75-83). Assertions require successful validation outcome, one valid SYNA, one invalid SYNB and no execution failures (:128-133), followed by the specific missing-weight error description (:134-138). A no-work/error result cannot reach the PASS writer. Clean and metadata catalogs are captured before processing (:139-142) and queried after, asserting no SYNB pip path (:173-178). These checks are unexecuted due to the earlier acquisition failure.
- Data and separate metadata reads use version_id_data and version_id_metadata extracted from the selected processing result (:148-161), not the latest sidecar. Both pins must be nonempty strings. Metadata identity/CPI/PPP and paired clean values are asserted (:168-172). Actual version values/readback contents remain unavailable; source intent is not execution evidence.
- Actual logs/scenario.log:1-10 records the durable acquisition-inventory verification error and Execution halted. first-failure.txt:1-2 records FIRST FAILURE: pipdata::dlw_gmd_list / The intended acquisition inventory could not be verified durably. The boundary variable is set immediately before that exported call (:121-122), and failure capture precedes rethrow (:181-187). No validation rejection, clean output, metadata readback or scenario PASS is claimed.

### Gaps
- V2-V4 remain failed/not reached after the acquisition boundary. Whether the first error is a package defect, an incompatible synthetic transport fixture, or another boundary mismatch is UNKNOWN to this reviewer. Worker public-call reproducer execution and final owner assignment were not inspected in this checkpoint; no package-bug finding manufactured from the error text alone.
- inputs.rds and first-failure.rds exist in the inspected directory but binary bodies were not decoded; input contents were reviewed from scenario source, not independently loaded RDS evidence. No exact actual clean/metadata versions or completed malformed-control artifacts exist in the inspected evidence.
- Namespace restoration has static on.exit coverage but no reviewer execution or retained equality assertion; absence of internal bypass is a bounded source conclusion for blob eb6c41e4bbdf2c89c1e07909f465c55285d9f724, not certification of future edits or all package internals.
- Parent owns blocked-state reporting, reproducer/owner-direction inspection and final verification. Do not clear original revision-1 Plan or convert unexecuted assertions into passing checks because the source appears correct.
