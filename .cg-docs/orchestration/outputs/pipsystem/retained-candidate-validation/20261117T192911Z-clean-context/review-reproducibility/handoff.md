---
schema: pip-handoff-v2
project: pipsystem
task: retained-candidate-validation
run: 20261117T192911Z-clean-context/review-reproducibility
status: completed
updated: 2026-11-17T19:58:15Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: NONE
next: Coordinator integrates verified P2.1 closure; live authentication/context/candidates remain user-only and NOT RUN.
---

# Clean-process launcher reproducibility review

## Summary
Static narrow review complete with one supported P2 finding. No P0/P1 or
additional P2/P3 finding identified in the inspected slice. No execution or
live validation was performed. This is not shared-reader acceptance.

## Findings

**[P2] P2.1** `launch.ps1:75-87` -- Ambient GitHub tokens can override the
specified existing configuration credential source.

**Issue**: The live branch fixes `GH_CONFIG_DIR` and calls `gh auth token
--hostname github.com`, but neither the settings at lines 35-64 nor that branch
clears inherited `GH_TOKEN` or `GITHUB_TOKEN`. GitHub CLI recognizes those
environment tokens ahead of stored credentials. Therefore a caller with either
variable set can silently use that ambient identity/token rather than the
credential in the stated existing C: configuration. The default preflight does
not exercise this path, so its two passes do not establish credential-source
confinement. This is a source-selection defect, not evidence of token exposure.

**Fix**: Within the user-only branch, save both variables in `$previous`, unset
them before the credential lookup, and leave them unset for the child. Existing
`finally` restoration can restore them. Retain only the explicitly obtained
token in the intended in-memory child variables. No login, configuration edit,
installation, new framework or broader environment refactor is needed. One
static control-flow check should confirm snapshot/unset precedes lookup and
restoration covers both variables; the reviewer must not execute live mode.

## Changes
Only this assigned report created/finalized. No source edits, commands,
credential reads, package/shared access, tests, network or Git operations.

## Checks run
Loaded existing shared, technical, data.table, collapse and testing R skills.
Read launcher, worker, parent handoff, reused probe and path helper statically.
All file references below are relative to the launcher bundle unless stated.

- Startup environment is assigned before launching Rscript, not after R startup
  (`launch.ps1:35-70,93`). Private contributed packages plus the installed
  R 4.5.2 base library are asserted exactly (`worker.R:15-23`). The launcher
  uses the installed C: runtime rather than the old copied/audited R home.
  No old startup audit append, package copy or install call appears in this
  inspected launcher/worker. This is static evidence, not OS write monitoring.
- Original user R session is not targeted: a separate Rscript is invoked, with
  no namespace unload/replacement or original-process manipulation
  (`launch.ps1:93`; `worker.R:57-60`).
- The first retained preflight log
  `runs/20261117T1935519127Z-preflight-35104/result.log:1-7` reports R PID
  29260, R 4.5.2, private data.table, the exact two libraries and 107 checked
  dependency descriptions. Its `process.json:2-5` records preflight exit 0
  and E: log/scratch roots.
- The second retained preflight log
  `runs/20261117T1942147663Z-preflight-29968/result.log:1-7` reports distinct
  R PID 25608 and the same scoped passes. Its `process.json:2-5` likewise
  records preflight exit 0 and separate E: log/scratch roots. These are retained
  results, not reviewer executions or proof of live initialization.
- Relevant receipt checks cover original inventory root, three expected SHAs,
  archive MD5, installed Meta/package.rds MD5 and installation log DONE entries;
  dependency table equality, unique package names, private paths, DESCRIPTION
  hashes and versions follow (`worker.R:26-56`). The preflight logs support
  107 descriptions passing those assertions, not a whole-library content audit.
- Supplied/inherited source pins, also embedded at `worker.R:28-32`, are stamp
  `95890411e8bf9db842593c2b0ab68ec4f2a66b25`, pipfun
  `7d534516a8c17c33d537681610eccd4c29211762`, and pipload
  `4ef0d90a974cb6ff0725da69373bde421dd04ad5`. No package repository or archive
  was read in this review; these are inherited provenance, not current HEADs.
- The preflight returns before PIP namespace loading or shared lookup
  (`worker.R:67-90`). Credential lookup is separately confined to the explicit
  live switch (`launch.ps1:74-90`), subject to P2.1 above. No direct token logging
  or persistent credential/configuration mutation appears in that branch.
- Live setup uses public 20260401/TEST/PPP2021 context, force FALSE and E:
  legacy root_dir/out_dir (`worker.R:93-101`). Probe reuse is guarded by expected
  MD5 before setup and again before source (`worker.R:14,25,117-119`). The
  reused `../20261117T171652Z-readonly/probe.R:18-50` checks recursive import
  origins and permits C: fallback only for base/recommended packages; its
  exact-pin reads and untouched-payload hash are at lines 94-133.
- Catalog hashes before/after setup and reads detect a byte difference only
  (`worker.R:89-106,123-127`). Error text appropriately calls for investigation
  and attempts no rollback. Equality does not attribute concurrent activity or
  prove that all shared files were untouched. No producer, repair or authority
  selection call appears in the launcher/worker/probe slice reviewed.

## Gaps
- Live behavior is NOT RUN by reviewer; retained evidence is not a new execution.
- Current checkout HEAD is UNKNOWN because shell access is prohibited.
- Parent handoff still says implementation/preflight/review pending at line 31
  and is status running; coordinator integration remains outstanding. Its
  supplied HEAD is not independently verified by this review.
- Credential-source behavior in P2.1 is a static finding based on inherited
  variables and GitHub CLI precedence; actual user environment, stored
  credential availability and live setup success remain UNKNOWN. No credential
  contents or configuration were accessed.
- Original-session survival and all C:/shared write behavior were not monitored.
  Existing public setup may create support directories under the user's
  separate authorization; this review does not execute or expand that approval.
- Candidate authority, backups, cause and recovery remain UNKNOWN; catalog
  equality is not concurrent attribution, and no automatic rollback is approved.
- Later: full-library integrity or generalized environment attestation is outside
  this smallest slice; no additional framework or safeguards were proposed.

## Follow-up verification — P2.1 VERIFIED FIXED

Narrow static follow-up requested at 2026-11-17T19:58:15Z. Initial finding and
inspection cutoff above are preserved as historical evidence. Current result:
P2.1 VERIFIED FIXED; unresolved findings NONE; supported new P0-P3 findings NONE.

### Checks and evidence

- Current `launch.ps1:76-80` snapshots GH_TOKEN and GITHUB_TOKEN alongside the
  existing live credential environment variables, strictly inside
  `if ($RunSharedContext)`. Lines 81-82 unset both before the fixed-config
  credential lookup at lines 83-86. Neither override is reintroduced before
  the R child invocation at line 98. The finally block at lines 115-119 restores
  every saved variable, including both overrides, on success or failure.
- Default preflight does not enter that branch. The ordinary settings table
  at lines 36-65 contains no credential token variable; its snapshot loop
  therefore does not read these credential variables. The finally loop restores
  only keys actually saved in `$previous`, not an unconditional credential list.
  This verifies the requested no credential-environment read in default mode
  for the inspected launcher path; it is not OS-level observation.
- `review-summary.md:14-26` accurately describes the source correction and the
  limited dummy-process check. `credential-env-test.log:1-3` records masking and
  restoration PASS and explicitly NOT RUN gh authentication, real credentials,
  R, network, shared setup and candidate reads. The supplied description says
  actual AST-extracted assignments/finally statements were executed after
  substituting dummy values; the log itself supports the reported outcomes,
  not independent reviewer execution or a live credential-store test.
- Latest retained default preflight
  `runs/20261117T1956347727Z-preflight-25696/result.log:1-7` reports fresh R
  4.5.2 PID 33548, the same private/base library order, private data.table,
  pinned receipts and 107 dependency descriptions PASS, with shared
  bootstrap/candidate checks explicitly NOT RUN. Its `process.json:2-5`
  records mode preflight, exit 0 and E: scratch/log paths.
- Failure-label correction at `launch.ps1:9,97,107-114` distinguishes an
  unattempted R launch from a child attempt without a result table. Missing
  output after the child attempt only disclaims acceptance; it does not claim
  no reads occurred. Current `worker.R:142-148` catches local startup/preflight
  exceptions; its existing shared/probe stage handler remains at lines 136-140.
  The normal live setup/read body, exact probe hash, source pins and no-rollback
  catalog checks remain intact in the inspected source.

### Changes in this follow-up

Only this assigned handoff updated. No source edits, commands, execution,
tests, R, network, shared paths, credential environment or credential files
were accessed by the reviewer. Existing loaded technical/R skills reused.

### Gaps retained after verification

- Live authentication, context setup and candidate reads remain NOT RUN.
  P2.1 closure verifies source ordering/restoration, not credential availability.
- Retained logs are inspected execution evidence supplied by the coordinator,
  not newly executed reviewer checks. No independent AST test harness execution
  or OS write/session-survival monitoring was performed.
- Catalog byte equality cannot establish concurrent attribution or authorize
  repair/rollback. Authority, backups, cause and recovery remain UNKNOWN.
- Coordinator integration of this follow-up into the parent summary remains
  outstanding at this review cutoff; its pending-review wording is historical
  coordination state, not an additional implementation finding.
