---
date: 2026-11-04
title: "M2 Phase 3: Bounded Deflation Decisions"
status: decided
scope: "Focused"
artifact-schema-version: 1
artifact-html: false
chosen-approach: "Accepted synthetic fixture and one narrow stamp-authoritative deflation route"
tags: [m2, deflation, synthetic, decisions, no-implementation]
---

# M2 Phase 3: Bounded Deflation Decisions

## Context
Resolve the decision parts of D1-D3/D8 for `pipdata/.cg-docs/plans/2026-11-02-m2-deflate-one-survey.md` revision 2. This is a decision record, not an implementation Plan, runtime pass or execution approval. The user requested no implementation, selected reuse of the accepted fixture, selected the explicit-vintage and bounded-weight contracts, approved the focused execution contract, confirmed the minimal design and selected saving that minimal version. Final capture checkpoint: `2026-11-05T02:02:34Z` (November 4, 9:02 p.m. ET). Approval details and research are in [the task handoff](../orchestration/outputs/pipsystem/m2-phase3-gate-resolution/20261104T213732Z-orchestrator/handoff.md).

The upstream source and worker-reported acceptance establish actual validation, CPI/PPP/PFW production, cleaning and exact readback for a synthetic case, not live DLW or stamp-selected deflation. See `pipdata/tests/testthat/test-one-survey-upstream-acceptance.R:153-256` and its original Work Report `:77-109,134-155,203-209`. Sources were audited at these local identities; installed code and live remote refs are not inferred:

| Repository / checkout | Branch | Full SHA |
|---|---|---|
| pipsystem | main | f0eb0d2950f24a67270a6ba946de9df9fae4ccdf |
| pipdata | PROD | 5680d7848dccb5fb2563129bbcd25809093d52bd |
| pipaux | PROD | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipload canonical | PROD | ff9a81e386a09fb2531c154f63fd2b91521313c6 |
| pipload-m2-stamp-adapter linked checkout | feat/m2-stamp-adapter | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| stamp | ready_cran | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| wbpip | DEV | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |

Absolute checkout roots, dirty inventories and original source citations are in this run's [input audit](../orchestration/outputs/pipsystem/m2-phase3-gate-resolution/20261104T213732Z-orchestrator/input-audit.md) and [execution audit](../orchestration/outputs/pipsystem/m2-phase3-gate-resolution/20261104T213732Z-orchestrator/execution-audit.md). They are evidence, not additional approvals.

## Requirements
- One actual synthetic deflation, saved and read back through the existing stamp-authoritative route. Keep LCU/day welfare, row identity/alignment and final-weight provenance; emit dynamic `welfare_YYYY` internally. Public legacy behavior stays unchanged (`SYSTEM_DESIGN.md:160-162,186-205,290-319`; local Plan `:49-89`).
- Use independent declared numerical expectations and exact input/output versions. No latest fallback, second scheduler, selective-invalidation mechanism or extra population producer. M1 R1 remains Open.
- All generated/runtime/temp/cache/log/library writes stay on resolved E: paths. No package code, Plan, tests, branches, shared libraries or protected design/roadmap changes in this decision task.

## Approaches Considered
### Approach 1: Reuse the Accepted Synthetic Fixture
Use the already accepted upstream case, one explicit vintage per year, a separate population-on control, one private calculation boundary and one isolated stamp store. This is the single selected minimal route after the material choices; no artificial alternative is retained. It preserves the upstream connection and has small, independently specified oracles. Its limitation is bounded synthetic evidence, not production methodology or full-package certification.

**Challenge to the design:** arithmetic alone could pass while using wrong pins, losing LCU welfare or misaligning weights. Exact producer/consumer pins, literal expected rows, retained LCU and same-version metadata checks address that functional gap. A general adapter framework or production-policy rewrite would not improve this bounded proof.

## Decision
### D1: Primary Input
Reuse `AAA_2010_SYNA_INC_GPWG`, income microdata. Its accepted clean rows have daily LCU welfare `1,2,3,4`, person weights `10,20,30,40`, and areas `urban,rural,urban,rural`. Do not divide by 365 again or multiply person weights by household size. Source: acceptance helper `:116-131,222-249`; acceptance test `:199-228` in pipdata. Produce the same fixture through the actual accepted upstream functions inside the new store and record its actual new pins; historical pins are evidence, not asserted current bytes.

### D2: Explicit Vintages, Units and Coverage
| PPP year | Release/adaptation | PPP | CPI ratio |
|---|---|---:|---:|
| 2005 | 01/01 | 1.00 | 1.0 |
| 2011 | 02/02 | 1.35 | 1.0 |
| 2017 | 01/02 | 1.50 | 1.2 |
| 2021 | 01/02 | 1.70 | 1.4 |

For this fixture, CPI is the dimensionless survey-price/base-price ratio; PPP is base-year LCU per international dollar. Compute daily PPP welfare as daily LCU / CPI / PPP, with no extra currency/spatial multiplier. These are explicit selections, not a new automatic-latest rule. Metadata contains nine source vintages (`pipdata/tests/testthat/test-one-survey-upstream-acceptance.R:245-253`); the formula is `wbpip/R/deflate_welfare_mean.R:6-10,32-35`. Reject missing required coverage, duplicate selections and nonfinite/nonpositive CPI/PPP before successful save. Keep original source pins and explicit consumed vintage keys separate. Use dynamic year handling, not four hardcoded branches.

### D3: Weights and Separate Population Control
Primary weights stay `10,20,30,40`, without adjustment or normalization. The separate same-row control has an actually resolved area-population PFW/domain setup, national CPI/PPP, and exact `2010_urban=400`, `2010_rural=600`; expected aligned weights are `100,200,300,400`. Change only pinned urban population to 800; expect `200,200,600,400`, unchanged rural weights and unchanged LCU/PPP welfare. Existing scaling evidence: `pipdata/R/pd_deflation.R:1012-1078`.

For this post-clean microdata proof, require finite nonnegative welfare (zero allowed), finite positive weights and populations, and complete unique exact-2010 area population matches when adjustment is on. Reject missing/invalid/mixed-year input before successful save; do not drop rows, impute, normalize or use nearest-year/tie fallback. This approves neither general raw-cleaning semantics nor the separate pure-mean contract.

### D8: Bounded Future Execution Contract
- One fixed package-owned strict microdata deflation adapter, not a general namespace/S3 whitelist. Fingerprint the actual calculation and known result-affecting helpers, domain registry, arithmetic and selected rules in the **request** proof. The legacy list is not that proof and omits relevant dependencies (`pipdata/R/code_fingerprint.R:1-37,169-327,334-382`; `R/pd_deflation.R:880-928`; `R/aaa.R:125-153`). Final implementation-specific dependency coverage remains to be established.
- Use the existing linked pipload adapter locally, with the audited stamp source. Canonical pipload lacks the engine-required `metadata_only` interface (`pipdata/R/code_fingerprint.R:145-164`; `R/dependency_execution.R:170-183`; linked pipload `R/pip_read-write.R:63-106`). No merge or shared-library installation is authorized.
- All recipe parents/output live in one initialized E: stamp store with exact public reads and same-version sidecars (`pipdata/R/dependency_plan.R:342-414`; `R/code_fingerprint.R:385-418`). Adapt a disposable E-only runner; preserve the upstream runner. The old runner's branch/library/store bindings are not ready unchanged.
- Approved full-suite **substitute**, not a full-suite claim: all test blocks in `test-pd-deflation.R`, `test-adjust-population.R`, `test-dependency-inputs.R`, `test-code-fingerprint.R`, `test-dependency-api-contract.R`, `test-m2-engine-authority.R`, plus the new required checks below. Retain restart and E-only junction cases; repair child-source binding, with no silent exclusions or weakened assertions. The audit's exclusion alternatives are not selected.

### Functional Checks Required Later
Actual saved/read-back outputs must match the four analytic factors applied to `1,2,3,4`: 1, 20/27, 5/9 and 50/119, respectively. Retain the independent `c(8,24)/2/4 = c(1,3)` control. Prove dynamic added-year behavior, independent CPI/PPP domains, consumed/unused CPI cases, invalid-input no-save, the two population variants, LCU/row retention, exact receipt/payload/same-version metadata, relevant dependency/rule fingerprint changes and unrelated-edit stability. None ran here.

### Approval Boundary and Remaining Preflight
D1-D3 choices and the D8 contract are selected; **actual execution readiness is not established**. The local revision-2 Plan remains unchanged and blocked. Future authorized work must align/review the local Plan, name owner/base/branch and exact file/runtime/lifecycle scope, inspect fresh hooks and dependencies, bind actual loaded source identities, prepare the exact contained runner and satisfy all required checks/reviews. No unresolved fact is converted into an execution pass. This record grants no implementation, package/Plan edits, tests, Git mutation, install or deployment.

## Working Principles
Minimal first: smallest end-to-end result; safeguards only against almost-irreversible loss of data/work/history, wrong externally released numbers, exposed secrets/private data or production/shared-branch harm; recoverable extras Later. One functional check per change. Use installed tools; dependencies only when worthwhile; any later Plan about two pages. Authorized reversible work proceeds without asking; protected/Decided or scope changes, near-irreversible actions, commits/pushes/merges and nongenerated deletion need approval. These principles do not widen this task's no-implementation scope.

## Next Steps
Save/validate this decision record and finalize the handoff. Any local Plan update/review or implementation is a later separately scoped task, not started here. No new roadmap feature or charter change: this resolves existing M2 deflation decisions only.

## Later
General selection, production adjustment/matching policy, other estimates, full-package/SMB/production certification and M1 R1. No additional framework is selected.

## Gaps
Current loaded bytes, retained artifact availability, complete final adapter dependency coverage and an executable contained runner are UNKNOWN until future preflight. No package tests, real-source download, deflation execution, mean, release, incremental or M2 completion is certified. Historical reported checks remain historical. Scientific choices here apply only to the bounded synthetic proof; no general production policy is adopted.
