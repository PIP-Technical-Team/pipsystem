---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261112T132507Z-fingerprint-fix
status: completed
updated: 2026-11-12T15:43:04Z
completed: 2026-11-12T15:43:04Z
owner: cg-testing independent B5 reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator retains B6 OPEN/manual and the real metadata-only path acceptance gap; no waiver or parent acceptance.
---

# Independent B5 testing/data-risk review

## Summary
No supported new P0-P3 testing/data-risk issues found in the named B5 delta:
R/dependency_execution.R, tests/testthat/test-fingerprint-fence.R and the retained
tests/testthat/test-public-metadata-loader.R repair against f19/baseline. This is
review completion, NOT integration acceptance. Public and affected suites remain
NOT GREEN; B6 stays OPEN/manual without waiver.

## Changes
Only this assigned E: review artifact created, checkpointed and completed via
apply_patch. No implementation changes and no R/scripts/tests executed. Earlier
reviews remain closed; protected artifacts untouched. Minimal first: bounded
review, installed tools only, no new safeguards or expanded scope; no Plan needed.

## Checks run
Loaded communication, R testing, R technical and data.table skills plus testing
integrity reference. Read brief, scoped source/tests, baseline and retained
drivers/logs; used only read-only Git/hash/clock commands.

- Existing PROD/full HEAD above confirmed. Complete frozen baseline-to-reviewed
  tree diff contains exactly the three scoped paths; nine prior pending files
  unchanged within those snapshots. install.R:11-25 copies baseline then overlays
  only these three, hashing every other candidate entry. check.R:15-34 checks nine
  prior checkout hashes and installed first-fence body against the named snapshot.
- Independent SHA256 of checkout AND candidate-reviewed matches brief authority:
  source 4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02;
  new test b4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57;
  retained test f9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44.
- Actual final-B4-before-edit proof supported by proof.R:8-15,43-68 and
  logs/proof.log:29-51: original installed first fence body matches copied final
  B4 source; exported public preparation rejects; identical contexts, zero changed
  component hashes, stage index only, complete fingerprints identical after only
  index removal from COPIES. Passive trace does not replace worker/result/guard.
- Second live fence proof: diagnose-refresh.R:9-33 and diagnose-refresh.log:35-65
  capture actual CPI-refresh call with original second guard still rejecting;
  contexts identical, complete fingerprints identical after index-only removal.
- Shared helper source:945-951 copies only data.table components before clearing
  secondary indices. Both comparisons:954-960,1100-1125 retain context OR, exact
  classes/schema/content/audit equality and stale condition. Exact catalog/version/
  hash checks:961-995, refresh lease/manifest gates:1105,1114-1125 unchanged.
  Callers still invoke fences; no global index option/hack or snapshot mutation.
- New tests:1-44 use exported TEST setup, actual context/fingerprint/catalog
  providers, a real acquired lease and real absent-manifest state; only remote
  release/vintage transport is stubbed. No provider/worker substitution or fake
  stored master. Tests:55-66 require both index-only calls succeed AND snapshot
  and stage index remain identical. Tests:69-98 send supported dependency_scope,
  component identity/membership/class, component/summary hash and audit-version
  corrupt copies through BOTH fences with exact stale-error-class expectations.
- red-final.log:7-19: 4 blocks/18 passes/2 intended index failures/0 errors/skips
  against explicit baseline-library (check.R:9-12). both-green.log:4-7:4/20 green.
  Same final new-test hash in both manifests. Whole manifests differ only retained
  public observer repair, not fingerprint tests; final red and affected manifests
  independently hash identically (03a62f0633a7116ab5f9c55ad6f76bb9d204d83c620752ff8d523f8afc4f295b).
  affected-reviewed.log:12 reconfirms current fingerprint20; code-reviewed.log:4-7
  records existing producer tests12 blocks/51 passes/0 failures/errors/skips.
- Retained public delta:83-101,108-117 corrects declared raw cpi2017 and gh /
  gh_raw_sha (helper-one-survey-upstream-acceptance.R:139,179-180; real aux_cpi
  schema/reshape agrees). Same ID/NULL-country/kind/pin expectations now run AFTER
  real calls; first returned clean pin and prior metadata pin remain the expected
  versions. Original full request, pin preservation, welfare and caller-immutability
  assertions retained. Observer only records; no muffle workaround, error catch,
  worker replacement, skip or expected-fail. Historical observer failure retained
  in diagnose-selection.log:79-120, not represented as current proof.
- public-reviewed.log:50,77-115 records preserved B3 fourteen passes and both B4
  calls returning: total4 blocks/31 passes/3 assertion failures/0 errors/skips.
  affected-reviewed.log:109-144 records150/705/3 failures/0 errors/skips, NOT GREEN.
  Failures are metadata FALSE vs TRUE, clean vs prior metadata pin, full request.
  check.R:53-55 fails the run on these; no silent success.
- diagnose-selection.R:9-25 is passive actual-plan observation; retained log:52-75
  shows aux_cpi_changed + output_missing, metadata pin/hash NA, reconstruct TRUE
  and clean output_drift. This supports separate B6 investigation, not a diagnosis
  of the planner root cause or permission to modify it.

Runtime evidence above is under
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/f19/.

## Gaps
- B6 remains OPEN/manual at retained test:115-117. Actual metadata-only TRUE
  loader path is still not executed/certified; the second call reconstructs from
  clean. Do not weaken those expectations or accept public/affected as green.
- No complete current-parent, expanded-suite, original-survey or production
  acceptance. Prior reviews/fixes are outside this NEW B5 review and not reopened.
- Retained execution evidence inspected, not independently rerun; RDS artifacts
  not decoded. New unit fixtures use real EMPTY catalog/absent manifest state,
  not a nonempty catalog-drift/manifest-mutation test. Unchanged strict source
  gates and real public installed execution are distinct evidence, not a claim
  that new unit tests prove every lease/catalog/manifest negative branch.
- No exhaustive OS-write audit or fresh dependency reinstall. Harness redirects
  TEMP/TMP/TMPDIR/home/library/cache/output to E: (run.ps1:11-34); logs show private
  E: libraries/temp. Kilo automatic saved tool output is runtime exception, not
  proof of platform-inclusive E:-only writes. Get-Date -AsUTC was unsupported in
  PowerShell5.1; corrected read-only clock via ToUniversalTime(), timezone verified.
- get_errors/execution_subagent unavailable; no fabricated result. Later: broader
  unrelated edge-case additions deferred; they are not required B5 corrections.
