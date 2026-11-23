---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume
status: blocked
updated: 2026-11-11T19:18:27Z
owner: Code mode survey resumption
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: User authorizes/submits package-next-prompt.md in pipdata Code mode; package owner reconciles public release context, then separate immutable pin approval/resumption can return to original Phase 2.
---

# Two-Pin Original Survey Resumption

## Summary
Original reviewed revision 1 Plan, Phase 2 attempted in fresh .tmp/one-survey/n11. All seven exact archive installs, QS2 usability and isolated namespace checks pass. Real acquisition/validation completes: SYNA valid, fresh missing-weight SYNB invalid, zero execution failures, actual `weight variable should be in the data` diagnostic. Public cleaning then fails `A single working release and identity are required.` No daily welfare/weight results, exact clean/meta saved-version readbacks or full downstream rejection certification exist. Phase 2 and Plan remain incomplete; no accepted exception.

Separate fresh-store minimal public reproducer confirms public release setup returns 20260401/TEST/2021, but both options expected by pipdata are NULL. Real pd_process_data raises pipdata_dependency_context_error; zero master versions/downstream catalog rows do not convert failure to acceptance. P1 package integration blocker retained. Full ten-role review and final light mode:verify completed: P2/P3 harness fixes verified, no new supported findings, P1 open/manual/unaccepted. Review completion is not Plan completion.

## Changes
- `experiments/one-survey/setup.R`: only two ecosystem pins changed; evidence mode now checks actual failure/acceptance artifacts instead of unconditional earlier failure narration.
- `scenario.R`: header points to setup's exact installed source pin.
- `reproduce.R`: now reduces the new context boundary in a separate fresh store; old runtime/reproducer evidence is preserved.
- Original Work Report appended, compact active state updated; fresh full/verify/role reports and this handoff created. Proposed separate owner setup/Task in `package-next-prompt.md`, not executed.
- Step 2 fresh targeted harness correction count 1/2 for narrow evidence/header correction bundle. Step 1 needed no fresh correction. No retry beyond first new package failure. Earlier budgets and evidence retained. Step 3 review correction count 0/2.
- No package edits, downloads, dirty-tree install, contributed ambient fallback, shared/production changes, Git mutations, environment switches or new sessions/worktrees. Internal subagents are not user-visible sessions/worktrees.

## Source Combination
| Package | Exact Git archive SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | c5b27fa4458d7175aca81a203762bae81e9f0b40 |

Fresh pins.tsv and installed-packages.tsv record full SHAs/versions/private paths. Dirty stamp/pipload working-tree metadata recorded separately in repository-status.txt, excluded from archives; other five repositories clean at inspection. Prior pipdata 539-assertion green suite and prior ff9a81e context are not new-combination survey proof.

## Checks run
- Read original Plan, Work Report and all three requested handoffs.
- git status and rev-parse: existing main, root matches, HEAD above; initial dirty paths belong to prior monitoring/package reports.
- cg-render-artifact --validate-only: PASS.
- Phase headers: two; completed-phases [1]; requested phase 2 valid.
- Fresh baseline `checks.ps1 -Phase baseline -RunId n11-red`: intentional missing-package baseline and caller restoration.
- Boundaries `checks.ps1 -Phase boundaries -RunId n11`: ten controls pass; n11-fixtures/checks.log. Setup seven installs pass after deliberate missing-cli child failure; n11/logs/setup.log:1-9. Actual QS2 roundtrip and five stale/incomplete receipt controls pass; installed namespaces private, check.log:1-96.
- Green wrapper check and intentional child failure verify caller environment/error preference restoration; worker report links transcripts. Not Pester and not a package-wide suite count.
- Real scenario exit 1 at new context boundary; scenario.log:103-160 proves validation, :179-206 validation receipts (report c744743b7be70ef8, inventory f25f5e675fd52dc3), :255-258 first clean failure. These are not clean/meta pins.
- Evidence-only rerun exit 0, evidence.log:26-37 diagnostic and :161-163 accurate NOT PASSED/NOT CERTIFIED. Successful-survey exporter branch unexercised, not fabricated.
- Public reproducer exit 0 means exact failure reproduced, NOT survey pass: reproduce.log:1-33; release/options/error/empty catalogs in reproducer-context.rds.
- Parent inspected actual source, logs/pins/versions and worker checkpoint, not only claimed results. PowerShell syntax parsing run/paths/checks: zero errors. git diff --check passes with LF/CRLF notices. Canonical revalidation PASS; Plan unchanged (active, completed-phases[1], current-phase2, failing-steps[2]).
- Full review `.cg-docs/reviews/2026-11-11-survey-resume-review.md`: all ten roles usable, deduplicated P1.1 open, P2.1/P3.1 fixed, no P0/skips/exceptions. Final `.cg-docs/reviews/2026-11-11-survey-resume-verify-review.md`: code-quality/testing only, both fixed scopes verified, zero new supported findings/cross-file breakage; P1 remains open. All exact role/verify handoffs under this run. Reviews inspect source/evidence, do not independently rerun scenario.
- Mechanical self-review: no introduced debug/import/TODO/credential issue identified in final narrow diff. Evidence print/cat and absolute experiment roots/SHAs are intentional, not debug/production configuration. Statistical/logical correctness is not certified; original functional evidence gate still blocked.

## Evidence Gates
| ID | Status |
|---|---|
| V1 | PASS fresh isolated installs, dependency provenance and actual QS2 usage; not exhaustive OS audit |
| V2 | PARTIAL real public acquisition/validation complete, cleaning attempted and blocked |
| V3 | NOT REACHED no actual daily welfare/weights or clean/meta readbacks |
| V4 | PARTIAL completed invalid classification and diagnostic; downstream rejection NOT CERTIFIED |
| V5 | Full ten-role review/fixes/final verify complete; P1 open and original acceptance not green |

## Preserved Git Scope
Main remains at e9c71e3190f1ce88a017ae25af7c373a64c655a2 at latest checks; no staging/commit/push/merge/checkout by this task. Excluded preexisting dirty pipdata bootstrap and pipsystem gate-monitor handoffs, exception/doc/commit-monitor directories preserved. Concurrent 20261111T190322Z-survey-monitor directory is not owned or changed by this task. Runtime is ignored, source/report/state edits uncommitted. No passing commit recommendation while P1 open; a later verified stage may use `test(integration): complete installed-package survey example`.

## Owner Direction
Pipdata c5b27fa `R/dependency_contract.R:266-273` defaults to options pipfun.working_release/pipfun.identity; `R/pd_process_data.R:117-123` reaches it after bootstrap handling. Pipfun7d534516 `R/working_release.R:121-126,154-169` persists/returns the context using .pipenv and its public getter, not these options. Public setup ran normally. Pipdata owner should reconcile context retrieval against the supported public contract and add setup-to-processing regression coverage; do not inject options into the harness, fabricate master state, bypass public workers or change additional source pins. This is source-backed direction, not an implemented package solution. Complete proposed separate setup/Task is saved in package-next-prompt.md.

## Gaps
- Fresh combination remains non-green at new release-context boundary. V2-V4 unresolved; no acceptance/completion inferred from earlier work.
- Paired expected welfare365,730,1095,1460 ->1,2,3,4 and weights10,20,30,40 are assertions, not actual observed clean outputs. No clean/meta exact saved version exists to report.
- Required whole-example functional gate cannot pass while public path fails. Missing evidence not accepted, no Phase2/Plan/roadmap completion write.
- get_errors and execution_subagent unavailable; do not fabricate Problems/Pester checks.
- External release/PPP-vintage/catalog/download transport substituted explicitly; survey/normalized auxiliary/country inputs synthetic fixtures. Real public validation/clean wrapper and pipload/stamp storage are not substituted. No auxiliary-producer certification.
- No exhaustive OS write audit, live transport, production, deflation, mean, incremental certification or historical pin selection after a later save.
