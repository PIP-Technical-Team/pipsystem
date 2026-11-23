---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T190007Z-context-fix
status: complete
updated: 2026-11-11T21:20:55Z
owner: independent learnings reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: Coordinator may integrate this completed independent learnings review; no reviewer correction requested.
---

# Independent Learnings Review

## Summary
No issues found for R/dependency_contract.R:266-274 or tests/testthat/test-public-working-release-context.R:1-87 against the relevant local lessons. No supported P0-P3 finding. This is independent source review and inspection of retained execution evidence, not independent execution or full survey acceptance.

## Changes
Only this assigned report created. No implementation, dependency, Git, Brain or protected-artifact changes.

## Checks run
- Read review-brief.md, actual scoped Git diff/status/HEAD, both changed files, Brain topic index and selected dependency-contract topic, targeted local solutions and prior upstream acceptance Plan.
- Read exact retained pipfun working_release.R setup/getter contract.
- Loaded pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-testing and cg-skill-brain-query.
- DIGEST.md and search-index.json absent. cg-index resolves to a C: launcher; not executed under no-scripts/report-only-write constraints. Targeted local Brain/solution reads used instead. No team retrieval or downloads.
- Git confirms PROD / c5b27fa4458d7175aca81a203762bae81e9f0b40, with only the intended tracked source modification and untracked regression. Tracked diff is seven insertions/two deletions; new test read separately because ordinary git diff excludes untracked files.
- Read retained c11 logs: red-confirmed.log:29-49 records the exact context error with five passing preconditions; green.log:26-29 records ten passing assertions; affected.log:34-51 records bootstrap/public-context coverage and 110 blocks / 549 passes / zero failures, errors or skips. These are inspected producer results, not tests run by this reviewer. Trace messages wrapped as PowerShell NativeCommandError remain visible at green.log:16-25; they are not test failures in its summary.
- Read c11/logs/pins.tsv:2-8 and exact retained n11 pipfun source, rather than inferring API behavior from current sibling HEAD or a version number. Confirmed pipfun pin 7d534516a8c17c33d537681610eccd4c29211762 and approved verification pipload pin 4ef0d90a974cb6ff0725da69373bde421dd04ad5.
- Read bounded expanded.log sections; no final test summary was present at inspection. No expanded-suite pass claimed.
- Read system UTC clock for report timestamp. Initial Get-Date -AsUTC was unsupported by PowerShell 5.1; corrected with (Get-Date).ToUniversalTime(), without file writes.

## Related Learnings

Paths below are relative to the pipdata repository unless prefixed ../pipsystem.

### Directly Relevant
1. **[Fresh-master bootstrap failed before preparation](../../../../../../../../pipdata/.cg-docs/solutions/bugs/2026-11-11-fresh-master-bootstrap-boundary.md)** — `.cg-docs/solutions/bugs/2026-11-11-fresh-master-bootstrap-boundary.md:29-38,55-61,160-173`.
   **Relevance:** Public-boundary integration, genuine fresh-master absence, no worker replacement, exact red evidence and dependency identities.
   **Key takeaway:** Exercise real wrapper/storage/reader and independently required behavior; never convert arbitrary errors into absence or call an alternate verification pin original survey acceptance.
   **Application:** Regression :24-38 substitutes only release/PPP transport; :39-48 performs real setup and checks empty catalog; :50-59 supplies the permitted completed-valid inventory; :63-86 passively traces actual context and requires precisely pipdata_dependency_aux_missing after public bootstrap. No filled master or worker stub replaces the failing interaction. Source change adds no catch/fallback and leaves bootstrap unchanged. The solution explicitly does not promise processing without auxiliary inputs (:34-38); the negative fixture is therefore not a violated success requirement.
2. **[One-survey upstream acceptance: real stages, offline transport](../../../../../../../../pipdata/.cg-docs/plans/2026-11-03-one-survey-upstream-acceptance.md)** — `.cg-docs/plans/2026-11-03-one-survey-upstream-acceptance.md:21-22,45-57,65-71` (Brain dependency-contract topic `.cg-docs/BRAIN-01.md:270-281`).
   **Relevance:** Real integration seams, transport-only substitution and precise acceptance limits.
   **Key takeaway:** Do not mock the behavior being proved, derive expected values through that behavior, or overstate a bounded proof.
   **Application:** Test :42-45 asserts literal setup values and absent hidden options; :72-83 observes the real processing context and configured root. The specific missing-auxiliary assertion is not weakened to any error. No scientific output is claimed. This historical Plan's full producer/readback acceptance is a different scope, not an extra requirement for this context regression.
3. **[Contained R preflight and certified same-store parents](../../../../../../../../pipdata/.cg-docs/solutions/environment-issues/2026-11-06-contained-r-preflight-and-certified-parents.md)** — `.cg-docs/solutions/environment-issues/2026-11-06-contained-r-preflight-and-certified-parents.md:14-29,38-55,98-108`.
   **Relevance:** Exact runtime source and dependencies; avoid executing supposedly read-only inspection that loads hooks and writes elsewhere.
   **Key takeaway:** Inspect text safely, preserve loaded source identities and failed evidence, and do not treat Git HEAD or a successful banner alone as runtime provenance.
   **Application:** The two-file change introduces no runner or dependency replacement. Retained logs identify isolated library paths and source-body comparison, and pins.tsv records the approved verification combination. This review itself uses text reads/read-only Git, with no R/script execution. Neither source review nor those logs establish an exhaustive OS-write audit.

### Potentially Related
1. **[Unified package environment: accessor-helper pattern](../../../../../../../../pipdata/.cg-docs/solutions/environment-issues/2026-04-30-unified-package-environment-accessor-pattern.md)** — `.cg-docs/solutions/environment-issues/2026-04-30-unified-package-environment-accessor-pattern.md:125-136` and **[Testing package environment state](../../../../../../../../pipdata/.cg-docs/solutions/testing-patterns/2026-04-27-testing-package-environment-state.md)** — `.cg-docs/solutions/testing-patterns/2026-04-27-testing-package-environment-state.md:28-41,83-103`.
   **Relevance:** Encapsulated state and scoped cleanup. These April lessons concern pipdata's own .pipdataenv and unit-test state injection, not pipfun/stamp public integration.
   **Application:** Do not mechanically flag test :7-19 as violating pipdata accessor rules: it snapshots/clears/restores external package state for isolation, never injects the working descriptor to fake setup. Source :271 uses the exported pipfun accessor, not direct .pipenv access. The test registers deferred cleanup before clearing state and untraces after observation (:12-19,67-69). No new production package environment or direct pipdata-state access is introduced.

### Patterns to Follow
- Use exact pinned API semantics: retained `../pipsystem/.tmp/one-survey/n11/sources/pipfun/R/working_release.R:121-126,154-169` constructs/persists the descriptor; :315-329 assigns it into parent.frame(). Source R/dependency_contract.R:270-274 correctly calls the getter directly and fills only NULL arguments from caller-local wrk_release. Both explicit arguments bypass the getter; partial explicit arguments remain unchanged. No conventional-return assumption is made.
- Keep public setup-to-processing regression genuine, with transport-only mocks and passive observation, and label the reached boundary precisely.
- Preserve exact dependency contexts. The November 11 bootstrap solution :145-173 distinguishes original survey pipload ff9a81e386a09fb2531c154f63fd2b91521313c6 from approved verification 4ef0d90a974cb6ff0725da69373bde421dd04ad5; c11 records the latter. No original-pin green/full-survey claim is justified.

### Anti-Patterns to Avoid
- Hidden working-release options or seeded internal descriptors substituting for real public setup: absent here.
- Catch-all read/context recovery, fabricated masters, replaced workers, or any-error acceptance: absent here.
- Reinterpreting old unit-test injection advice as permission to bypass this integration requirement, or demanding the historical whole-survey acceptance scope for this narrow fix.

## Findings
No issues found for the named changed files. No actionable P0-P3 finding, impact/remedy pair or safe_auto/manual correction is supported. The observations above are evidence for the no-issues verdict, not speculative findings.

## Gaps
- No R, scripts, tests, Pester, Problems/get_errors or execution_subagent diagnostics executed by this reviewer. Missing tools are not represented as successful checks. Read-only source review does not independently reproduce the recorded tests.
- Expanded suite had no completion summary at inspection; its result remains unknown here. Do not promote the 549-pass affected result to expanded/full-suite acceptance.
- No independent rehash of copied dependencies, binary/library contents or candidate archive performed; source/pin comparisons here rely on retained text evidence. No team pull/download, large artifact, generated HTML body or complete Brain-index read.
- Scoped to relevant lessons and two changed files; not full survey processing/numerical readback, production deployment, original survey-pin compatibility, package-wide review or exhaustive environment-write audit. The exact missing-auxiliary boundary is intentionally the tested endpoint.
- The Brain index is dated November 6 and does not index the November 11 bootstrap solution; direct targeted retrieval supplied that newer lesson. No unresolved conflict remained after separating older unit-state advice from current public integration requirements.
- Minimal first applied: no unrelated safeguard, framework, dependency, scope expansion, new Plan, implementation change, commit, push or test execution recommended by this review.
