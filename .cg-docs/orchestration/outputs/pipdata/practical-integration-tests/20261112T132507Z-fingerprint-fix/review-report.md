---
date: 2026-11-12
depth: data-risk
type: standard
plan: null
findings:
  P1.B5: fixed
  P1.B6: open
---

# B5 Scoped Review

## Status
Eight independent new data-risk reports completed/read, no new supported B5
defect or required correction. Both fences accept only copied components'
secondary-index representation differences; genuine-change controls pass.
**Acceptance remains NOT GREEN:** real metadata-only selection fails three
unchanged assertions (B6 OPEN/manual). Final light verification complete
(verify-review.md); no waiver.

## Findings And Scope
- **P1.B5 fixed, scoped:** fresh actual final-installed B4 proof before edits
  showed identical contexts, zero component hash changes, and full identity after
  ONLY copied-index removal. Same actual live proof at the later refresh fence.
- Shared pd_fingerprint_values copies only data.table components before
  setindexv(NULL). All other fields/classes/schema/order/hash/summary/audit remain
  in identical(); both context short-circuits, catalog/version/content checks,
  lease and manifest checks remain. No global index toggle or snapshot mutation.
- Real-provider four-block controls cover both fences, snapshot/index immutability,
  configured context, component name/membership/class, component/summary hashes
  and audit. Existing code tests separately verify real function/constant hashing.
- One retained B4 test needed previously unreachable fixture corrections to
  cpi2017 and gh$gh_raw_sha. Observer records only; IDENTICAL selector assertions
  moved outside worker handling. Every full request/pin/immutability/welfare/no-
  error expectation remains. Old source/evidence and nine prior hashes preserved.
- **P1.B6 OPEN [manual], outside B5:** actual second action reports
  aux_cpi_changed/output_missing, metadata pin/hash NA, reconstruct TRUE; clean
  output_drift also appears. It reads clean FALSE, not prior metadata TRUE. This
  needs separate planner/output-receipt investigation, not a forced worker choice.

## Independent Reports
All pip-handoff-v2 with nonempty Gaps; prior context/B2/B3/B4 reviews untouched.

| Role | Report | Result |
|---|---|---|
| Code quality | review-code-quality/handoff.md | No new issue; B6 retained |
| Testing | review-testing/handoff.md | Both-fence controls and strict assertions supported |
| Data quality | review-data-quality/handoff.md | Cache-only copies, strict content retained |
| Reproducibility | review-reproducibility/handoff.md | Fresh proof/frozen scopes verified |
| Documentation | review-documentation/handoff.md | No misleading cache/acceptance claim |
| Version control | review-version-control/handoff.md | Rehashed253 entries and prior/current hashes |
| Performance | review-performance/handoff.md | Copy scales with code components, not surveys |
| Architecture | review-architecture/handoff.md | Shared policy, both boundaries retained |

## Checks Run
- Authority f19/candidate-reviewed, reviewed-candidate-source-sha256.tsv.
  Source4aa953b0f3647b90d2dba2ec9d4d6db6b587e8410b85fd63e3faf29afccf3d02;
  newtestb4946acc54fddd138ac356ec84c4ddf469e24dac5a137f4c48effee47e21fc57;
  retainedtestf9af4798255b356c07185e819899a999ac2568c165f7c556fdfcfe855a607f44.
- Frozen red4 blocks/18passes/2 intended index failures/0errors/skips; both-fence
  unit4/20 green, existing producer12/51 green. Current affected contains same20
  fence assertions. Complete red/public/affected/code test manifests identical.
- Public4/31passes/3assertion failures/0errors/skips; affected150/705passes/
  3assertion failures/0errors/skips, NOT green. Only second kind/version/full-
  request assertions fail. Both public calls return; old B3 cases all14 pass.
- reviewed-provenance-audit.log/RDS verify actual counts, source/frozen bytes,
  nine unchanged prior files and explicit retained-test repair. Whole-checkout
  raw differences are exclusively CRLF/LF; scoped current files match snapshot.

## Gaps
- B6 OPEN/manual, actual metadata-only TRUE/old-pin route unexecuted/uncertified.
  No forced path, planner fix, expected-fail marker or acceptance waiver.
- Reviews are source/log/hash inspection, no R/test reruns or binary decoding.
  Version control rehashed full253 entries; coordinator execution is separate.
- New units use actual empty/absent catalog/manifest and real lease, not new
  dynamic proof of every nonempty catalog/manifest/lease-loss branch. Existing
  checks remain unchanged and are exercised in real public processing.
- Final light verification complete/read; fresh real preparation follows. Only complete
  provenance-checked actual parents permit unchanged expanded tests. No original-
  survey/immutable-revision/pin acceptance. Problems/execution_subagent unavailable;
  no fabricated result, full package or exhaustive OS audit.
