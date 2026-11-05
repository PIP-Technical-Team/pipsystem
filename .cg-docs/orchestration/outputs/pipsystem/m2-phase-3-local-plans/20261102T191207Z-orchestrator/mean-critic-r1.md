---
schema: pip-handoff-v2
project: pipsystem
task: m2-phase-3-local-plans
run: 20261102T191207Z-orchestrator
status: completed
updated: 2026-11-02T19:21:51Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipster
branch: PROD
head: 828064e406e07e711c34d2ba725746e367d35f9b
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipster/.cg-docs/plans/2026-11-02-m2-pure-weighted-mean.md revision 1
next: Review complete; execution remains blocked on separately approved D3/D4/D8 and implementation scope.
---

# Pure weighted mean Plan revision 1 review

## Summary
No significant issues found. Plan is well-structured for the bounded pure-mean change. Counts: P1 0 / P2 0 / P3 0. This is a clean Plan review, not authorization or readiness to implement: the Plan explicitly blocks execution on D3/D4/D8 (Plan:29-34,82-85,95-96).

Read the full saved revision 1, all 96 lines, and checked the cited design/umbrella sections against current pipster source. No general framework or unrelated feature is proposed; the calculation, one focused test file and three package documentation/packaging paths form a proportionate five-file delta (Plan:45-58,78-80,93-94).

## Changes
Only this review report created and finalized. No Plan, code, config, branch, commit or other file changes made.

## Checks run
- Read-only Git: pipster HEAD 828064e406e07e711c34d2ba725746e367d35f9b, branch PROD, status `?? .cg-docs/`.
- Governing pipsystem HEAD: 0aabedbc875cd66a6d02cfb1f4cf79054bf0bc39.
- Read governing charter, HARVEST_BRIEF, handoff contract, command and context-loading instructions; no setup/config created.
- Read cited design sections: SYSTEM_DESIGN.md:166 permits list/data.table results with separate saving; :291,303-305 assigns pure supplied-input calculations and native-pipe use to pipster; :319-321 constrains repository changes and R dialect. Umbrella Plan:154-159,174,188,231-236,342-352 supports the separated calculation/storage boundary and explicit pending approvals. The local Plan does not claim the independent-save half of V10 is complete (local Plan:20,58,65-67).
- Current source assumptions verified at pipster SHA above: DESCRIPTION:20-24 imports collapse/data.table and wbpip; NAMESPACE:3-13 has no mean export; R/pipgd_params.R:33-36,93-96 accepts/stores an externally supplied mean. Targeted content search across R/*.R found no fmean call or dedicated mean estimator. No new runtime dependency is needed for the proposed qualified collapse call; actual fmean formals/behavior remain unverified, as the Plan explicitly states (:96).
- Input/result/missingness: Plan:32-34 labels the contract and tolerance as proposals, not scientific approvals; :50-51 requires explicit na.rm = FALSE, approved checks, an independent small-fixture weighted-sum oracle, result type/shape, nonmutation and edge cases. The accepted-input finite-result/failure condition is explicit. No population adjustment or hidden NA-removal policy is silently adopted.
- Native pipe: proposed welfare-first signature (Plan:33) accepts `welfare |> pipmd_mean(weight)` directly. Documentation is explicitly required at :57,88. Current manuals already contain native-pipe examples (man/as_pip.Rd:43-47), as do existing tests (tests/testthat/test-pipgd_lorenz.R:21-25); this Plan introduces no new package-wide pipe/version migration requirement.
- Five-file scope and packaging: .Rbuildignore:1-9 currently lacks the proposed .cg-docs exclusion. Plan:55 adds only that exclusion alongside the new manual/export, and :80 separates package files from lifecycle records requiring D8. No current packaging fix or other write is authorized by review.
- Generated-doc compatibility: DESCRIPTION:13-14 records markdown roxygen/7.2.3; NAMESPACE:1 and man/as_pip.Rd:1-2 identify generated files. Plan:57 restricts newer-tool generation to a disposable E copy and retains only the intended manual/export; :85 blocks unexpected write-set changes. Prior installed-version metadata is explicitly historical/unloaded (:27), not asserted as a tested compatible generator.
- Safe suite inspection: read all five existing test files and tests/testthat.R. Directory listing shows no helper/setup/teardown scripts. Tests use bundled fixtures, vectors and grouped computations; test-pipgd_lorenz.R:1-3 executes at source time; test-identify_pip_type.R:1-3 conditionally skips/sets local options and :81-84,113-134 samples randomly; test-pipgd_dist.R:1-3 is only a placeholder. R/zzz.R:7-16 initializes options. R/pipgd_params.R:55-83 uses private wbpip helpers, so loaded compatibility cannot be inferred from source alone. Plan:61-63 explicitly requires fresh-process E-only path/dependency binding and an exact approved safe suite/substitute before implementation. No runtime-safe command is claimed as already established.
- Read the cited historical readiness report :79-96,128-153 as supporting provenance only; did not reopen other package repositories or treat historical metadata/tests as new runtime evidence.
- Final read-only Git `git diff --exit-code -- R tests DESCRIPTION NAMESPACE .Rbuildignore` passed; final status remains `?? .cg-docs/`. Only pipster and governing pipsystem repositories were read; their full SHAs are recorded above.

## Gaps
- No R execution, package loading, tests or generation permitted or performed.
- D3/D4/D8 are explicitly pending, not review defects merely for being pending.
- Exact runtime/dependency identities, fmean formals and numerical behavior, generator output compatibility, and the safe suite gate remain UNKNOWN until separately authorized preflight/execution. Artifact validation was reported passed by the user; it was not rerun here.
- No production equivalence, integration, save/recovery, release completion or independent storage result was verified or claimed.

## Findings
No significant issues found. Plan is well-structured and ready for implementation planning handoff, subject to its explicit execution blockers. P1: 0; P2: 0; P3: 0. No revision recommended from this review. No implementation approval is inferred.
