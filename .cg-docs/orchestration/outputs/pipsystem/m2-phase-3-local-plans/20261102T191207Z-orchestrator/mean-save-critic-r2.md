---
schema: pip-handoff-v2
project: pipsystem
task: m2-phase-3-local-plans
run: 20261102T191207Z-orchestrator
status: completed
updated: 2026-11-02T19:26:18Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: 7f4a98471d9c2350c3537fcae8448856896cd9f9
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-02-m2-independent-mean-save.md revision 2
next: Re-review complete; existing scientific, producer and execution gates remain unresolved.
---

# Independent mean save revision 2 re-review

## Summary
**No significant issues found. P1: 0 / P2: 0 / P3: 0.** The revision 2 population-adjusted national-mean obligation is explicit and consistent with deflation revision 2 and umbrella Step 8. No new or regressed concrete Plan issue identified. This disposition does not approve science, execution, branches or tests.

Read the FULL saved target revision 2 (101 lines) and FULL deflation revision 2 (100 lines). The prior zero-finding target review remains historical evidence, not a substitute for this re-read. Findings target only the independent-mean-save Plan.

## Changes
Only this new requested report created and finalized; mean-save-critic-r1.md retained unchanged. No implementation, Plan/code/config/Git mutation, test, source execution, package load, installation, generator, network, DLW, Y-drive or production/shared-system operation.

## Checks run
### Revision 2 and cross-Plan checks

References below are to the saved working-tree Plans, not immutable committed Plan content:
- **Mean**: `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-02-m2-independent-mean-save.md`, revision 2.
- **Deflation**: `E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-02-m2-deflate-one-survey.md`, revision 2.
- **Umbrella**: `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-10-10-m2-walking-skeleton.md`.

| Check | Evidence and disposition |
|---|---|
| Mandatory control is not conditional on primary fixture | Mean:34 explicitly requires deflation's population-on control even when the primary fixture is unadjusted; Mean:55 says independently of the primary choice. Deflation:36 requires D3 approval for the separate control; :55 requires it regardless of primary adjustment. The former risk of treating population coverage as merely optional is absent. |
| Actual population-to-result path, not injected weights alone | Deflation:55 requires changing only a pinned area population, actual deflation/storage, unchanged LCU/PPP welfare, exact changed aligned weights and population/rule provenance on readback. Mean:55 reuses that D3-approved control, changes the pinned population and requires a changed national mean and saved provenance. Mean:61 and V2 at :76 require actual deflation, actual pure mean and real stamp/pipload storage; the control cannot be satisfied by replacing the numerical producer or merely editing a weight vector in a mock. |
| Candidate oracle is feasible and internally consistent | Mean:55 labels 2.5 -> 2.0 as a candidate, not adopted science. Arithmetic checked directly without R: `(1*1+3*3)/(1+3)=2.5`; `(1*3+3*3)/(3+3)=2.0`. At pipdata object `f06acb9c557aa1866bab965ffdfe86af22a636fe`, R/pd_deflation.R:1036-1058,1070-1078 sums weights by area and scales each area's weights by its selected population/area total. A two-area fixture can therefore realize the proposed final weights through the population input while keeping welfare fixed. Exact fixture, admissibility, units and matching remain D3-gated. |
| Mutation is distinct from unchanged recovery | Mean:55 explicitly separates population mutation from assembly recovery. Mean:62 still requires a stamp-current decision and zero additional mean calls/versions only on the unchanged-input recovery case. A changed parent must go through stamp's existing request decisions, not inherit the no-recompute assertion. No new scheduler, selective cache or Force behavior is introduced (:54,90,97). |
| Acceptance and completion agree | Mean:55 and mandatory V2 at :76 require the national-mean control, not only population provenance. Deflation:55 and V2 at :75 provide the upstream weight/provenance readback. Umbrella:348,350-352 already requires adjusted-weight dependencies, a population-adjusted national mean and independently saved/recovered results. Each local unit stays independently testable: deflation need not compute a mean (:63); the mean unit waits for its tested producer (:29,87). |
| No scope or framework regression | Candidate file sets remain bounded (Mean:51-60); one-store fixture restrictions remain (:65); scientific/producer/safe-suite gates remain before implementation (:31-36,67,75,87-90). Reusing one small approved population control is a functional requirement check, not an additional framework, generalized producer, population-fetch feature or production safeguard. No extra infrastructure is recommended. |

### Source identity and commands

Fresh read-only commands in pipdata: `git rev-parse HEAD`, `git rev-parse origin/PROD`, and exact `git show f06acb9c557aa1866bab965ffdfe86af22a636fe:R/pd_deflation.R` with line-numbered output for :449-470 and :1036-1078. HEAD remains `7f4a98471d9c2350c3537fcae8448856896cd9f9`; local origin/PROD remains `f06acb9c557aa1866bab965ffdfe86af22a636fe`. Source confirms population adjustment is activated by the input pop_data_level sentinel, not by national/subnational result naming (:449-457), matching the need for an explicit population-on control.

Prior invocation's verified exact-object evidence is retained, not claimed freshly rerun: stamp `4a1fa5d92313aa223296fae0e29cf3446a314aea`; pipload adapter `4ef0d90a974cb6ff0725da69373bde421dd04ad5` (checkout HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`); pipster baseline `828064e406e07e711c34d2ba725746e367d35f9b`; pipsystem checkout `0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39`. Exact source scopes, commands and limitations are recorded in mean-save-critic-r1.md:26-59. The governing charter/design and pure-mean Plan context from that invocation were reused as requested. No additional package repositories were read in this re-review.

Get-Date recorded the report timestamp; local clock was 2026-11-02 14:26:18 EST, represented above in UTC. Only apply_patch wrote files, solely at this report's approved E path; no write-capable child process, temp/cache output, R process or test was started. No artifact validation was rerun.

## Gaps
- D1-D4/D8, tested deflation/mean pins, exact stored/semantic contract, approved adapter surface, owner/base and safe full-suite/substitute remain unresolved (Mean:31-36,67,75,90,101). These remain execution blockers, not Plan defects or implicit approvals.
- The 2.5 -> 2.0 candidate is arithmetically coherent and compatible with inspected scaling code, but no numerical, producer/storage, mutation or recovery test was run. D3 must still approve the actual fixture and science before implementation.
- Existing one-store containment still applies when reproducing the incoming population control (Mean:65); this review approves no outside-root pin transfer, shared store or new storage mechanism.

## Findings and disposition
**P1: 0. P2: 0. P3: 0. No significant issues found.** Revision 2 is consistent and ready for its existing approval/producer preflight. Implementation remains blocked until those explicit gates are resolved. No Plan change, extra framework or additional safeguard is requested by this review.
