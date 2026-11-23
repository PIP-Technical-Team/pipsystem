# Proposed Stamp Plan Completion Contract

**UNAPPROVED PREVIEW. Not a canonical Plan, implementation permission, build/pin
approval or shared mutation instruction.** Approving it permits saving/formally
reviewing a Plan in pipsystem only. Baseline policy/IDs are already approved;
this asks for method/feature scope, not another baseline choice.

## Outcome
A tested, documented, domain-agnostic public stamp capability can reconcile one
stale artifact pointer to its explicit, already chronological-latest retained
version without changing data/history. No new active-selection semantics or
promise that live main/provenance already satisfies the eventual prerequisites.
The feature is additive and explicitly invoked: existing exported signatures,
defaults and normal read/save/startup behavior must remain unchanged.

## Verification Surface
| ID | Evidence Required | Artifact | Required |
|---|---|---|---|
| V1 | Actual current package checkout/HEAD/dirty-file and installed test-tool facts; no interference with mixed work | Preflight/source records | yes |
| V2 | Red/green stale-pointer fixture: advisory dry-run unchanged; locked public apply pointer-only; repeat no-op; wrong target/prestate/main mismatch and unavailable locking rejected before mutation | Focused package tests and output | yes |
| V3 | Full applicable package suite and unchanged-store regression cases pass; existing signatures/defaults/return types/error contracts/selection/serialization preserved | Package test results | yes |
| V4 | Public docs define mutation/stop/no-op boundaries; all supported review P0-P3 resolved and final verification complete | Docs/reviews/handoff | yes |

## Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | No shared calls, data/payload writes outside generated local fixtures, install/pin/library or Git mutations | Allowed-file/command review |
| C2 | No producer, restore/rebuild/prune/GC, history rewrite, timestamp/count change, fake execution proof or namespace patch | Tests and source review |
| C3 | st_latest/query/main contracts unchanged; target must already be unique chronological latest | Focused tests and existing regression suite |
| C4 | Apply takes effective artifact-then-catalog locks and rechecks gates while held; unavailable/failed locks stop, no unlocked fallback | Focused tests/source review |
| C5 | CRAN-submitted source/artifact and release branch frozen; no automatic repair or new requirements in existing code paths | Artifact/source and regression review |

## Boundaries
Proposed two steps: package capability/tests, then docs/scoped review. Production
implementation/unit tests belong in the stamp repository, not a pipsystem runtime
shim. Current known repo/branch is
`E:/PovcalNet/01.personal/wb384996/Rpackages/stamp`, observed ready_cran. It is a
source reference, NOT an authorized implementation checkout: user reports CRAN
submission. Freeze submitted source/tarball/release branch; exact submitted
version/commit/artifact hash still UNKNOWN. Future development must be separately
isolated/authorized, preferably after CRAN review; no branch/worktree creation,
switch, version bump or resubmission is implied. Preserve dirty .gitignore,
compound-gpid.local.md and .compound-gpid. Current checked libraries stay untouched.
Package-owned synthetic fixture construction may establish stale metadata for a
test; the public operation, not external/private caller patches, must perform the
tested reconciliation. No production catalog is manually edited.
Use existing locking for this operation only; do not change legacy package-wide
fallback semantics. Dry-run stays non-mutating/advisory and cannot certify future
prestate. Apply rechecks main/provenance/pointer under effective artifact-then-
catalog locks; unavailable locking must fail before writes.
Other artifact fields must already be coherent, including format and history-row
count; disagreement blocks this narrow operation rather than repairing more fields.
No new repair is called automatically by loading, initializing, saving or reading.
Existing locking/dependency behavior remains unchanged; stricter lock requirements
apply only to the new explicit operation. Regression guarantees are required
evidence, not claimed from a proposal or an unimplemented feature.

Out: shared application, PIP dataset policy in stamp, pipdata interface changes,
source data refresh, generic migration/current-selection framework, installation,
checked-image/pin updates, deployment, publication and PPP adaptation selection.
Fresh main-byte/provenance verification and tool qualification are later gates,
not evidence claimed complete by source-only package work.

## Iteration Policy
At most two targeted correction attempts per implementation step; do not weaken
invariants or expected interface values. Address supported P0-P3 within scope,
rerun affected/full checks, then final verification. Required evidence cannot be
waived by default. No new dependency unless it saves more work than it costs and
is separately authorized if installation is required.

## Blocked-Stop Conditions
Required existing tools unavailable; package API/serialization or protected
design must change beyond this boundary; target not latest; ambiguous/missing
integrity proof; main/provenance mismatch; prestate conflict; failed tests after
budget; or next action needs shared access/mutation, install/pin/Git/branch action.
Missing or failed writer locking is an explicit stop, never an unlocked apply.
Any impact on existing public behavior or the submitted CRAN artifact/branch is
also a stop, not permission to expand implementation or resubmit.
Save exact errors/owner action, no partial activation or unsupported repair command.

## Deviation Policy
ask. Safe reversible work inside an approved Plan proceeds; boundary changes stop.

## Working Principles
Smallest complete slice; safeguards only for almost-irreversible harm (otherwise
Later); one functional check/change; installed tools/worthwhile dependencies only;
Plan about two pages. Approve this contract before canonical Plan save/review;
execute only on a later explicit instruction, in the appropriate package context.
