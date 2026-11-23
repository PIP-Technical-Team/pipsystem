---
date: 2026-11-17
type: plan-review
plan: .cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md
reviewed-revision: 2
findings:
  P2.1: fixed
---

# Auxiliary version-retention diagnosis: formal Plan review

## Initial review
Canonical revision 1 reviewed by cg-plan-critic: 0 P0, 0 P1, 1 P2, 0 additional P3.
The complete saved Plan, not its earlier preview, was the reviewed artifact.
No execution, network, Git mutation or source/shared write by reviewer.

### P2.1 — Runtime startup violates fresh-run-only output boundary
Revision 1 Step 1 reused the existing private runtime while requiring every new
temporary/home/cache/log output under the fresh diagnostic run. Its embedded
audit at `.tmp/one-survey/qmd-acceptance-20261113/r/library/base/R/Rprofile:219-229`
uses ONE_SURVEY_ROOT for both logs and expected library roots. Keeping the old
root appends to its old child-startup.log; switching root while reusing R home
fails the expected private base-library assertion before diagnostic execution.
Support code: experiments/one-survey/run.ps1:107-124.

## Correction in canonical revision 2
Copy the installed private R home into the fresh diagnostic temporary run.
Adapt only its copied startup-audit block: new-run audit output, exactly the
original read-only contributed library plus the copied base/recommended library.
Keep source/archive/installed receipt checks anchored to original provenance.
Record actual origins, R home and startup logs for both fresh children. Original
runtime, contributed packages and namespaces remain untouched. No installation.
This resolves confinement within the approved output boundaries, not an exception
allowing old-run writes. Public synthetic assertions remain unchanged; clarified
that sidecar content_hash is compared to the respective independent input hash.
Correction is saved and follow-up critic verification passed.

## Follow-up formal review — canonical revision 2
cg-plan-critic reread the entire revised Plan and this review. P2.1 VERIFIED FIXED
at Plan level. No significant issues found; no supported new P0/P1/P2/P3 and no
suppressions, accepted risks or deferred findings. It verified the copied-audit
boundary, original-read-only contributed library, copied base origin, both-child
audit evidence, anchored receipts and precise independent content_hash checks.
All execution and version-authority gates remain intact. No new package source
was read beyond the previously recorded stamp pin. This is static Plan review,
not successful runtime-copy, startup or synthetic diagnostic evidence.

## Source basis and other checks
Checked stamp archive root:
`E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/qmd-acceptance-20261113/sources/stamp`,
SHA `95890411e8bf9db842593c2b0ab68ec4f2a66b25`.
- Exact sidecar read: R/format_registry.R:445-487,507-529.
- Exact payload read/returned IDs: R/IO_core.R:654-668,548-569.
- Upsert captures incoming new_vid: R/version_store.R:842-869.
- Rebuild executes builders; restore saves: R/rebuild.R:420-460;
  R/IO_core.R:1053-1080. Neither proves safe non-destructive reconciliation.
- Selective helper-pattern reuse, not direct setup.R verify invocation, is required:
  setup.R:203-241 calls usable(), which loads unrelated configured PIP packages
  (:38-55). Plan explicitly excludes those loads/setup/install modes.

## Gaps
- Canonical revision 2 passes automatic artifact validation, with HTML disabled
  because publication is not opted in. Existing multiline model-advisory parser
  warning is unrelated; no configuration was changed.
- No diagnostic/runtime copy/startup adjustment executed. No claim that V1-V4
  implementation evidence is passed. These are future execution requirements.
- Cause, intended authoritative versions and a safe recovery API remain UNKNOWN.
- No accepted risks, deferred findings or roadmap side-idea changes.
