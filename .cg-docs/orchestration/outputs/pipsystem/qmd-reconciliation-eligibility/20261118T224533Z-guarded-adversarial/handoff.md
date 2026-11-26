---
schema: pip-handoff-v2
project: pipsystem
task: qmd-reconciliation-eligibility
run: 20261118T224533Z-guarded-adversarial
status: completed
updated: 2026-11-18T23:02:34Z
owner: guarded-adversarial
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE
next: Coordinator integrates this static review; shared execution remains user-only and NOT RUN.
---

# Guarded auxiliary launcher adversarial review

## Summary
No supported actionable findings in the scoped launcher, current manual
eligibility cell, preceding launcher prose or checker-description reconciliation.
No findings suppressed or fixes proposed. This is a static boundary review,
not certification of shared-store immutability or live eligibility.

Paths below are relative to this repository. `bundle/` abbreviates
`.cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/20261118T224533Z-guarded-launcher/`;
`qualification/` abbreviates the sibling `20261118T195108Z-qualification/`.

## Changes
Only this exact report was created and finalized, on E:.
No source, package, rules, configuration, design or roadmap edits; no installs,
Git mutations, shared execution, script execution or R execution.

## Checks run
- Read-only Git at start confirmed repository
  `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`, existing branch `main`,
  HEAD `e9c71e3190f1ce88a017ae25af7c373a64c655a2`. Final branch/HEAD recheck
  matched. No checkout switches or Git writes.
- Loaded existing R shared, technical, data.table, collapse and testing skills,
  plus technical-communication skill. Read mandatory project documents and
  `CONTRACT.md:51-93` for the report format.
- Read all three bundle scripts and bundle handoff; qualification loader and
  both local-check scripts; `experiments/one-survey/paths.ps1`; current
  `check-qmd.R`; relevant Qmd prose and complete eligibility cell.
- Static mode/write trace: `bundle/run.ps1:1-16` defaults to local; only the
  explicit switch selects shared. Its scratch, log and TSV paths are in the
  checkout. Tree/ancestor checks precede scratch creation (`:18-24,78-85`;
  `paths.ps1:1-33`). Child temporary/home/config/cache/profile/library settings
  are process-local and restored in `finally` (`run.ps1:34-94`). R is started
  with `--vanilla`; `worker.R:7-14` checks version, actual libraries and temp
  containment before setting its working directory. No supported C: write
  path was established in the reviewed call chain; reading C:-installed R/base
  libraries is not itself a write.
- Static fingerprint ordering: `worker.R:80-89` calls the qualification loader
  before any shared lookup/registration. `qualification/qualified-stamp.R:11-26`
  rejects an already loaded namespace, hashes the fixed archive/four installed
  files before loading, then verifies origin. The Qmd checks the returned
  namespace identity and origin before alias/root lookup (`pip-pipeline.qmd:195-216`).
- Static registration boundary: `worker.R:32-58` requires existing root,
  `.stamp`, temp/log support directories and catalog; refusal precedes
  `st_init()`. The only registration is `aux`; readback verifies its two roots,
  exact alias membership and preservation of previous aliases. The shared
  entry additionally requires an empty alias list (`:83`). Catalog sampling
  is installed before initialization (`:41-47`), and repeated on shared-run
  exit as well as after dry runs (`:91-101`).
- Static current-Qmd-only trace: `worker.R:61-76,93-96` extracts exactly the
  named manual cell from the current file, checks its manual/dry-run markers
  and parses/evaluates only that cell, not the document or initializer.
  Current Qmd calls only `st_reconcile_latest(..., dry_run = TRUE)` in the
  six-measure loop (`pip-pipeline.qmd:224-239`). No apply path was found.
- Static failure/result trace: Qmd prerequisite failure leaves rows NOT RUN;
  attempted reconciliation errors become FAIL (`pip-pipeline.qmd:218-239`).
  Worker writes technical rows, verifies sampled catalog identity and requires
  six PASS rows (`worker.R:97-105`); errors exit 1 (`:123-127`), and the launcher
  rejects a nonzero R exit (`run.ps1:87-100`). Advisory/no-apply labels do not
  claim survey readiness (`worker.R:103`; Qmd `:165-181,243-244`).
- Static test inspection: `bundle/local-check.R:13-36` covers each missing
  prerequisite with alias/tree/byte preservation; `:39-51` checks complete
  local-store registration and dry-run noop; `:53-68` refuses any shared
  normalization in the local-alias test. Qualification tests exercise
  fingerprint mismatch before load and non-latest rejection in a synthetic
  store (`qualification/local-check.R:12-32,42-68`). These are relevant
  functional checks, not live shared evidence.
- Retained evidence read, not rerun: `bundle/local-6f5cabbae170.log:1,29,53-68`
  records qualification, focused checker and guard-test successes, with shared
  registration/eligibility/apply/survey NOT RUN. Exit 0 is supplied evidence
  and also recorded by `bundle/handoff.md:47-51`, not independently measured
  by this reviewer. The first log's real stale-description failure remains
  visible at `bundle/local-779bdcf1bf57.log:59-60`; it was not relabeled PASS.
  Current checker `check-qmd.R:207-219` expects the exact observed description
  then restores it only in memory before the remaining whole-config equality
  assertion. No configuration-file edit is performed by that code.
- NOT RUN by reviewer: PowerShell parsing/execution, R/tests, shared mode,
  UNC lookups, apply, catalog repair, survey processing, Qmd rendering or
  installation. No package source read, so no new package SHA claim.

## Gaps
- Existing-support-directory removal between precheck and `st_init()` remains
  the already disclosed concurrency limitation, not a new finding or demand
  for private state/locking changes (`bundle/handoff.md:65-67`).
- Before/after catalog hashes sample one file, not the whole shared tree,
  transient writes or writer attribution. Error/interrupt conditions and
  shared-store behavior were not reproduced. The code's labels and handoff
  already retain this limitation (`worker.R:22-27`; handoff `:65-67`).
- Static environment/path inspection is not OS-level monitoring of all R,
  native-library or child-process writes. Package internals/dependency hooks
  were not re-audited; no installed library or UNC path was inspected.
- The text checks on the extracted chunk are not a sandbox against arbitrary
  future source edits. No malicious-source security model was assumed; this
  conclusion concerns the current reviewed chunk and launcher.
- Shared registration and all six strict shared outcomes remain NOT RUN.
  Local RDS/noop preservation cannot certify QS2/shared eligibility, repair
  readiness, PPP vintage selection, historical causality or survey acceptance.
- This attempt inspected current files directly, not a supplied historical
  baseline diff. Mixed-owner changes were left untouched. Coordinator-owned
  review integration and any later user-only dry run are outside this report.

## Narrow static follow-up — source binding and evidence outputs

Follow-up requested at 2026-11-18T23:12:34Z. The initial review above retains
its 2026-11-18T23:02:34Z cutoff and historical line references. The references
below apply to the subsequently revised files read for this follow-up.
Repository/branch/HEAD remain as supplied in the follow-up request; no new
Git or shell commands were run. Existing loaded technical/R skills reused.

### Summary

No supported actionable findings in this bounded delta. No source-binding,
new E:-output, namespace-origin, error-safety or status-truthfulness issue was
established. No fixes, suppressed findings or additional safeguards proposed.
Only this report was appended; no implementation or other file was changed.

### Checks run

- Static inspection only of the revised bundle's three scripts and the named
  retained local logs, final process JSON and final namespace TSV.
- Exact-cell binding: `bundle/worker.R:89-110` extracts the cell into memory,
  joins lines with LF and no trailing LF, writes those bytes to a temporary
  image explicitly inside `scratch`, compares its SHA256 with
  `2380fc24b1c76e059b03321428e9617cd47ad8f2b8084ddf81d2f516f82e77ad`,
  and refuses mismatch. Cleanup is registered before writing (`:98-100`).
  Parse follows the hash check (`:118`); shared registration and evaluation
  follow the returned parsed object (`:126-138`). Thus the evaluated source
  is the same in-memory source whose image was checked, not a second Qmd read.
  The reviewed cell is ASCII, so its current bytes are also UTF-8-compatible;
  no locale-dependent non-ASCII acceptance scenario was established.
- Qualification order remains loader/fingerprint first, source check second,
  shared registration third (`worker.R:121-131`). Binding covers all six
  target/previous literals and the entire cell, not just the dry-run spelling.
- Mutation controls: `bundle/local-check.R:71-94` changes target, previous,
  apply flag and a writer statement only in memory, passes each changed image
  to the source reader without evaluating its return value, requires the
  specific hash-refusal error and verifies the existing synthetic store
  snapshot remains identical. These are functional negative controls, not
  claims of shared execution or malicious-source sandboxing.
- Process receipt: `bundle/run.ps1:17-18,76-80,92-114` adds one run-specific
  checkout-local JSON path, initializes the exit field to null, records UTC
  timestamps and explicit allowlisted run/path/PID/exit fields, writes while
  the redirected environment remains active, and restores the environment in
  an inner `finally` even if receipt generation fails. No environment dump or
  credential reads were added. Existing output tree validation covers the
  bundle; no new C: destination appears in the delta.
- Origins: `bundle/worker.R:16-42` enumerates loaded namespace versions/origins,
  checks their library parents against actual declared libraries and rejects
  the four named PIP namespaces before writing a checkout-local origins TSV.
  Normal completion calls this recorder; caught errors retain FAIL/exit 1
  even when the best-effort recorder itself fails (`:165-172`). It does not
  turn an origin-recording failure into a successful process.
- Retained final-source evidence read, not executed:
  `bundle/local-7549bfc0cff6.log:67-77` records the expected image hash, all
  four distinct mutation refusals and shared/apply/survey NOT RUN;
  `:78-83` records R 4.5.2, R PID 15672, libraries and origins output.
  `bundle/local-7549bfc0cff6-process.json:2-13` independently provides a
  machine-readable local-mode receipt with R exit 0, launcher PID 18756,
  UTC start/end and E:-checkout output/scratch paths.
  `bundle/local-7549bfc0cff6-origins.tsv:2-29` contains the reported namespace
  versions and origins within the declared libraries, including Stamp's
  qualified E: install and C:-installed base/recommended libraries as reads.
- Retained RED remains a real refusal, not a PASS:
  `bundle/local-1ba9a7b0a0ec.log:67-74` records the source-image mismatch and
  error-path origin output. The explanation that its expected image was
  deliberately zeroed is supplied history, not independently reconstructed
  from that old source. `bundle/local-1e3f13a34bd0.log:68-82` records the
  earlier GREEN mutation controls and origins. Final log/process evidence
  above is the evidence for the current source, not the earlier GREEN alone.

### Gaps and residuals

- No scripts, R, test runners, shared lookup, UNC paths or credentials were
  executed/accessed. No package sources were read or package SHAs newly claimed.
  The digest was not independently recomputed by this static reviewer.
- Parent full-environment restoration PASS is supplied by the requester;
  the inspected final R log/process/namespace files do not independently
  contain the parent's environment comparison. Nested restoration is supported
  by source inspection, not a reviewer-run failure-injection experiment.
- Error-path origin recording is deliberately best effort. Failures before
  the outer `tryCatch` (for example initial runtime/library assertions at
  `worker.R:7-13`) do not invoke that recorder; this is not evidence of a
  complete audit for every possible startup or forced-termination failure.
- Temporary image cleanup uses `on.exit`; this is normal-return/error cleanup,
  not a guarantee after process termination or an OS deletion failure. Any
  surviving image is the public reviewed cell inside E: scratch, not private
  input or credentials. No almost-irreversible harm was established.
- The earlier residual about text checks is superseded specifically for
  accidental changes to this exact cell: fixed-image hashing now refuses them.
  It is still not an OS sandbox or a security boundary against editing the
  launcher, expected hash or qualification helper themselves.
- Previously disclosed support-directory races and sampled-catalog limits
  remain unchanged. Namespace-origin snapshots are not OS write monitoring.
  Shared eligibility, apply and survey acceptance remain NOT RUN; coordinator
  integration and later user-only execution remain separate from this review.
