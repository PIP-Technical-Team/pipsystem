---
schema: pip-handoff-v2
project: pipsystem
task: aux-catalog-reconciliation
run: 20261117T162251Z-diagnostic/review-testing
status: completed
updated: 2026-11-17T16:42:50Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md revision2
next: Coordinator integrates this testing review and completes required light verification; shared recovery remains outside scope.
---

# Diagnostic testing review

## Summary
No supported P0/P1/P2/P3 issues found in the scoped new diagnostic scripts and
retained execution evidence. No fixes, suppressions or deferred findings.

The independent expected inputs, returned-ID selection checks, current/exact
payload checks and historical/current sidecar content-hash checks implement
Plan revision2:68-79. Distinct-process evidence supports the repeated readback.
The red baseline is honestly limited to absent save evidence, not reproduction
of a package defect or the shared-store failure. This is a static review of
executed evidence, not independently executed testing or overall Plan acceptance.

## Changes
Only this assigned handoff was created and finalized on E:. No scripts, source,
packages, protected artifacts, rules, Plan or roadmap were edited. No shell,
R, tests, network/shared access, installation or Git operation was performed.
No new safeguards/frameworks or package work are recommended: the bounded
functional diagnostic is sufficient for the approved question (Minimal first).

## Checks run
All paths below, unless otherwise stated, are relative to the diagnostic run
folder containing this review's parent directory.

- **Independent expected data — static PASS:** create.R:5-6 defines two changed
  literal inputs; verify.R:15-16 independently repeats those values rather than
  deriving expected payloads from saved output or catalog metadata. Expected
  hashes use public st_hash_obj on those inputs (verify.R:55-65), as explicitly
  prescribed by Plan:71-73; this tests storage/hash consistency, not an independent
  certification of the hash algorithm. No mocks, namespace patches or internal
  catalog/data mutations occur in the reviewed diagnostic.
- **Returned IDs and selection — static PASS, retained execution PASS:**
  create.R:9-17 checks the first returned ID and first catalog row; verify.R:20-22,
  33-38 requires two nonempty distinct IDs, exactly those retained IDs, and one
  catalog row selecting the second. save-trace-1.tsv:1-3 records first
  8bc28cc289f49d51 and second 6fee99c874dfb800 with matching catalog selections.
  first-1.log:13-21 and second-1.log:6-19 retain the corresponding assertions.
- **Payload/sidecar/hash assertions — static PASS, retained execution PASS:**
  verify.R:39-65 loads current and both exact versions, compares each whole
  object with the respective independent input, requires different hashes and
  checks both historical sidecars plus current sidecar/catalog hashes.
  first-1.log:22-28 and second-1.log:20-26 retain all assertion passes. A first-only
  pointer, same payload returned for both IDs, or wrong historical sidecar hash
  would fail these assertions rather than merely satisfy an existence check.
- **Latest semantics — static PASS, retained execution PASS:** verify.R:66-70
  checks public st_latest against descending created_at/version_id ordering,
  separately from pointer selection. first-1-versions.tsv:2-3 and
  second-1-versions.tsv:2-3 show the same two rows and distinct timestamps;
  first-1.log:29-30 and second-1.log:27-28 record ordering PASS and no tie.
- **Fresh process on same store — static PASS, retained execution PASS:**
  run.ps1:108-117 launches a child per mode; create.R:32-35 saves store/IDs/PID,
  and verify.R:17-25 verifies the expected local store exists and the second
  reader has a different PID. No store is created before the missing-receipt
  check (verify.R:5-9 versus :28). child-startup.log:2-3 and first/second logs:2
  show creator PID17712 and reader PID17200 with the same copied runtime and
  original contributed library. Namespace TSVs:2-13 agree with those PIDs and
  expected roots. The fresh reader does not depend on creator-memory inputs.
- **Honest baseline and process result — static PASS:** red-1.log:4-12 retains
  the missing-receipt error and halted execution. run.ps1:120-127 explicitly
  requires that reason, nonzero status and no created store. Work report
  .cg-docs/work-reports/2026-11-17-auxiliary-version-retention-diagnosis.md:44-50
  labels it a missing-evidence baseline, not a reproduced package regression.
  run.ps1:117-130 rejects nonzero required green-stage exits; work report:58-63
  records both green exits zero and explains retained informational stderr
  decoration. The visible messages are stamp options updates, not package errors.
- **Provenance boundary — static evidence inspected:** provenance.R:11-39
  checks local paths, exact libraries, pinned stamp receipt/SHA/archive/Meta MD5
  and installation DONE message; :40-78 checks dependency descriptions and
  actual loaded origins before the test. preparation.json:2-9 and
  child-startup.log:1-4 distinguish original contributed library from copied
  base runtime. No package repository or archive source file was read in this
  review. Inherited tested stamp SHA is
  95890411e8bf9db842593c2b0ab68ec4f2a66b25; receipt correctness is supported by
  reviewed assertions/logs, not independently recalculated here.
- **Dossier checker and interpretation — static PASS, retained execution PASS:**
  check-dossier.R:4-23 explicitly requires six selected/candidate ID pairs,
  selected-file absence, user-reported error text, public acceptance NOT RUN,
  UNKNOWN fields and separate recovery/reselection routes. dossier-1.log:1-7
  records all passes; decision-dossier.md:76-99,182-199 preserves the distinction
  between candidate metadata agreement, exact public acceptance, local synthetic
  success and unresolved shared state. Its literals check consistency of the
  saved dossier; they are not an independent live-store probe.

Required skills loaded: R shared, technical, data.table, collapse and testing;
test-integrity reference read. Project charter/design/harvest brief, review brief,
coordination contract and canonical revision2 Plan read. No prior broad Qmd/style
or B6 review was reopened. Runtime checks and editor diagnostics NOT RUN by this
reviewer, rather than claimed clean.

## Gaps
- This review did not independently execute assertions, deserialize the binary
  save receipt, recompute file hashes, inspect the live store, or rerun package
  unit tests. Conclusions concern the reviewed scripts and retained logs/TSVs.
- Namespace TSVs record origins at the provenance checkpoint before diagnostic
  operations; they are not a full temporal trace of every subsequently loaded
  namespace. No unsupported all-time namespace guarantee is made here.
- Only synthetic ordinary RDS saves with retain_versions=Inf were exercised in
  retained evidence. Production/QS2 auxiliary acceptance, pruning, concurrency,
  failure injection, historical cause and real-survey/pipeline readiness remain
  untested; no extra edge-case suite is required by this bounded diagnostic.
- Six-artifact IDs are consistency-checked against the saved dossier here, not
  independently refreshed against shared storage. Authoritative choices, backup
  provenance and supported shared recovery remain UNKNOWN/outside this review.
- Branch and HEAD are inherited from review-brief.md:3-5 and work report:10,
  not independently queried. No current package checkout provenance is claimed.
- Overall V4/light verification remains the coordinator's responsibility; this
  testing report does not certify other review roles or overall completion.
