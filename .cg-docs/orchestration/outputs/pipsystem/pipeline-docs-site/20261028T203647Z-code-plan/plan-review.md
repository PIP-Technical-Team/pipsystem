---
date: 2026-10-28
type: plan-review
plan: .cg-docs/plans/2026-10-28-pipeline-docs-site.md
reviewed-revision: r3
reviewer: cg-plan-critic
reporting-owner: pipeline-docs-code-planner
findings:
  P1.1: fixed
  P2.1: fixed
  P2.2: fixed
  P2.3: fixed
  P2.4: fixed
  P2.5: fixed
  P2.6: fixed
---

# Pipeline Documentation Site: Attributed Critic Review

Outer caller saves restricted critic result; critic performed bounded reads only, no commands, tests, network, writes or delegation. Source Plan r1 was 358 lines. Subagent reference `ses_e7ba714a6ffefoq6mAeW2RjvRl` is private reporting metadata only and never site content. Native session identity otherwise UNKNOWN.

## Initial Review: r1

Six findings: one P1, five P2; no P3. All references below are to r1 and are historical after correction.

### P1.1: Windows Launcher Conflicts With Shell-Free Spawn

- Evidence: Plan r1:84 requires shell:false while :216-218 selects Quarto bin/quarto.cmd.
- Issue/impact: Node cannot execute a Windows .cmd directly with shell-free process spawning; Phase 1 rendering fails.
- Critic correction: verify executable entry point or narrowly allow a fixed trusted cmd.exe launch with correct argument quoting; test paths containing spaces against pinned Quarto.

### P2.1: Phase 1 Staging Requires Later-Phase Files

- Evidence: r1:86,134-140 stages maintenance.md, CSS and JS before their Step 4/5/7 creation at :146,154,170-177.
- Issue/impact: fixed allowlist render fails or implementer must move undefined work across gates.
- Critic correction: create safe maintenance scaffold and minimal CSS/JS in Phase 1; later steps enhance them; gate on complete input inventory.

### P2.2: Assessment Date Input Undefined

- Evidence: r1:66 requires explicit assessment date; :84,139,173,224 define no CLI/date input; :90 receipt omits it.
- Issue/impact: future-date validation is nonreproducible and fixtures have no reference date.
- Critic correction: required --assessment-date YYYY-MM-DD, defined CI source, validation, all recipes and receipt/evidence field; fixed before/on/after fixture dates.

### P2.3: Public Maintenance Commands Conflict With Path Ban

- Evidence: r1:56,86 makes maintenance public; :177,243 requires exact tested setup/output instructions; :195 embeds full workstation/internal report root; :74,315 forbids those in publication.
- Issue/impact: literal copying leaks paths or fails disclosure checks; portable replacement acceptance unspecified.
- Critic correction: public parameterized E: paths versus private exact execution evidence, execute public recipe with approved fixture substitution, scan actual workstation/internal path fragments.

### P2.4: Native Verify Can Select An Unrelated Review

- Evidence: r1:183 binds triage but not verify selection. Installed cg-review.md:86-89 selects latest fixed-finding review globally; :220-223,252 normal fallback writes canonical -review path, whereas r1:278-280 expects separate verify artifact.
- Issue/impact: unrelated parent/suppression context or overwritten original report; wrong verification claim.
- Critic correction: outer selection gate, explicit clean/mismatched-parent route, preserve canonical original and save full fallback separately with honest mode/parent.

### P2.5: Duplicate Review And Premature Completion

- Evidence: r1:179-186,341 requires full review/fix/verify inside Step 8, while cg-work.md:174-188,225-237 later reaches completion and review:auto dispatch.
- Issue/impact: second review after completion, ambiguous correction budget and final evidence.
- Critic correction: one authoritative review sequence integrated through outer caller; completion only after required final evidence; no implicit unsupported duplicate suppression.

## Re-Review: r2, Correction Round 1

Attributed cg-plan-critic conclusion: "All six original findings are closed at the planning level in revision r2. No significant new issues found." Critic re-read all 362 lines and saved review/resolution history, without commands/tests/processes/network/writes/delegation.

| Finding | Status | r2 closure evidence |
|---|---|---|
| P1.1 | Closed at Plan level | :86,142 trusted narrow cmd.exe launcher, restrictions and actual space-path smoke test |
| P2.1 | Closed at Plan level | :56,130,142 complete Phase 1 input scaffolds |
| P2.2 | Closed at Plan level | :84,92,175 input/CI/receipt date; :141,227,230 explicit recipe arguments |
| P2.3 | Closed at Plan level | :179,246 portable public recipe versus exact private paths and disclosure scans |
| P2.4 | Closed at Plan level | :185-186 exact-parent selection gate and full unsuppressed honest fallback; :281-284 separate report identities |
| P2.5 | Closed at Plan level | :184-189 explicit outer single review:auto stage ordering, V12 completion gate, host limitation stop |

Critic lifecycle assessment: this is an explicit outer-caller procedure, not a claim that ordinary cg-work already reviews before completion. Full fallback preserves canonical review and records actual mode/parent; it is not called successful native light verify.

## Checks Actually Run

Critic: NONE, read-only inspection only. Outer source validator passed r1 after correcting requirement-list punctuation, passed material r2 changes, and passed exact final r2 after the last inline recipe correction. Final capture 2026-10-28T21:16:12Z, SHA-256 `139494b75970071a16177741a3697e6b4d838ab9b9ba17264daecec666abf616`. Initial validator reported nine requirement mapping errors; no HTML generated. Details in plan-resolution.md.

## Gaps

- No runtime feasibility, browser, Quarto install or remote Actions checks run by critic.
- Review findings address Plan structure, not implemented website correctness.
- Runtime verification remains mandatory future work; Plan review closure is not implementation/test success or permission to deploy.

## Fresh User-Requested Review: 2026-10-29, r2

Independent fresh cg-plan-critic pass returned 0 P1, 1 P2, 0 P3. The critic read the complete 362-line r2 Plan and permitted charter/design/contracts/evidence/style reference, with no commands, tests, processes, network, writes or delegation. The outer caller saves this attributed result. No package repository was read.

### P2.6: Advisory Lookup Required Outside Permitted Network Stage

This report uses stable ID P2.6 to avoid colliding with historical P2.1; the fresh critic's pass-local ID was P2.1.

- Evidence: r2 Plan:110 requires advisory recording during implementation review; :114 permits network solely during authorized setup; :294 forbids reviewer network; :184-186 place review after implementation. Planning evidence:35-46 has pins/manifests, not an advisory assessment.
- Issue/impact: implementer must violate the network boundary, omit the required check or seek late authorization; the vulnerability stop condition does not establish an authorized lookup route.
- Critic correction: outer implementer performs lookup during authorized tooling setup, saves dated source-qualified evidence in existing private evidence.md, reviewers assess offline, and material pin changes repeat that setup check. No helper/dependency/infrastructure needed.
- Outer correction: r3 applies the proposed narrow route in Pins And Installation, Step 1 details/acceptance and V1. Revalidation passed and restricted critic re-review explicitly closed this finding.
- Other critic conclusion: no additional significant executable-readiness defects established. Existing Windows/Pandoc/metadata/CI/fallback boundaries are specified; runtime success remains future acceptance.

## Fresh Re-Review Closure: 2026-10-29, r3

Attributed cg-plan-critic result: "P2.6 is closed at Plan level in revision r3. No significant new or unresolved issues found. The Plan is well-structured and ready for separately authorized implementation."

- Critic re-read the complete 364-line r3 Plan and saved correction history. r3:112 assigns lookup timing/owner/evidence and pin-change repetition; :125-128 Step 1 details/acceptance; :312 required V1; :116,296 preserve setup-only network/offline reviewers; :22-24 separate correction versus implementation approval.
- Remaining findings: 0 P1, 0 P2, 0 P3. One correction/re-review round used for this follow-up.
- Critic performed bounded reads only; no writes/shell/tests/processes/network/delegation. Outer caller validated exact r3 source successfully before re-review; no Plan edit followed it.
- Final binding at 2026-10-29T13:11:15Z: revision r3, SHA-256 `68edebceb322f35889ea483c553df0d5d1c6216daaa08b379f2eb1fd77f64ee8`.
- Readiness is a Plan-level conclusion, not vulnerability clearance, runtime/CI/deployment certification or implementation approval. No additional helper dispatched.
