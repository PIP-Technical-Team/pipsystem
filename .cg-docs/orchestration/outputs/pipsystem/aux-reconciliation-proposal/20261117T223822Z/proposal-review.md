---
type: proposal-critique
findings:
  P2.1: fixed
---

# Reconciliation proposal critique

This is a reviewed proposal/unapproved contract preview, not formal canonical
Plan review, implementation permission or shared-store approval.

## Initial finding
cg-plan-critic identified one supported P2.1: relying on existing locking did not
actually guarantee the promised stable main/provenance and expected-prestate
conditions. Checked stamp IO_core.R:1512-1530 can run unlocked when optional
filelock is unavailable. Saves hold the artifact lock before main writes
(:377-380,419-509) and only later the catalog lock (version_store.R:926-930), so
catalog locking alone cannot stabilize main. Source SHA
95890411e8bf9db842593c2b0ab68ec4f2a66b25.

## Correction
Proposal/preview now require effective artifact-then-catalog writer locks on
apply and rechecking gates while held. Missing/failed locking aborts before
mutation; no package-wide fallback change. Dry-run remains advisory/read-only,
not future-prestate assurance, and must not create lock files merely to claim
readiness. Focused V2 includes unavailable-lock rejection before mutation.
Other artifact format/count metadata must already be coherent; no wider repair.

filelock DESCRIPTION exists in the checked library, version1.0.3; no fresh
namespace/acquisition or shared-lock operation was run. Existing-package presence
does not justify silently accepting unlocked apply.

## Gaps
Follow-up critic VERIFIED P2.1 FIXED at proposal/contract level; unresolved IDs
NONE; no supported new P0-P3, accepted risks, deferrals or suppressions. The
reviewer confirmed effective artifact-then-catalog locks, in-lock rechecks,
unavailable-lock rejection, read-only advisory dry-run, other-fields-coherent
boundary and fixed-store recency. No package-wide locking redesign was added.
This remains document critique, not canonical Plan review or execution approval.

No package tests or proposed repair operation were
executed. Current main/candidate full byte/provenance coherence is not proved.
No runtime/pin/installed-library or shared change. All authority stages remain
separate; the baseline approval is not being requested again.
