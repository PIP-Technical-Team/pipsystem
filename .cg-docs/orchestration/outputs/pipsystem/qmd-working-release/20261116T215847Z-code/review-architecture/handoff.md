---
schema: pip-handoff-v2
project: pipsystem
task: qmd-working-release
run: 20261116T215847Z-code/review-architecture
status: completed
updated: 2026-11-16T22:33:13Z
owner: architecture-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-16-qmd-working-release-initialization.md revision 2
next: Coordinating Code session integrates scoped reviews and obtains current source-preservation and final verification evidence.
---

# Scoped architecture review

## Summary
**No supported P0-P3 architecture issues found** in the public initialization
cell, its task-local harness, or package ownership boundaries. This is a scoped
static review, not approval of the complete Qmd, shared-store execution or the
whole implementation's completion.

The new cell remains an executable acceptance narrative: it calls existing
public initialization/readback APIs and asserts their observable contract. It
does not implement release orchestration, storage engines, survey processing or
rebuild selection. This preserves the pipdata/stamp division in
`SYSTEM_DESIGN.md:186-192,284-309`.

## Changes
Only this assigned report created and finalized. No source/package/config edits,
Git mutations, execution, installs, network calls or protected-artifact changes.

## Checks run
- Read `review-brief.md:1-54`, Plan revision 2, project design and coordination
  contract. Loaded communication and R shared, technical, data.table, collapse
  and testing skills before reviewing R.
- Compared the changed context/setup surfaces with the task-local untracked
  source snapshots, not absent HEAD versions. The baseline context has the same
  release/identity/survey and no PPP field
  (`.tmp/qmd-working-release/20261116T215847Z-code/baseline/pip-pipeline.qmd:20-47`).
  Current context adds explicit PPP 2021; the manual setup remains separate from
  the synthetic narrative (`experiments/pip-pipeline.qmd:20-30,50-62,158-164`).
- Public setup stays with pipfun; folder/alias verification reads pipfun and
  stamp APIs rather than reimplementing storage or changing package bindings
  (`experiments/pip-pipeline.qmd:69-96,119-139`). The literal expected folder and
  alias maps at lines 97-118 are acceptance expectations, not a second runtime
  configuration authority. Returned and active state equality is checked at
  line 128. Expected roots are derived from the selected context, including
  explicit legacy roots at lines 70-79.
- The live harness extracts the actual manual cell and changes only the context
  roots; it checks first/existing mode and asserts the cell result and stamp
  directories (`.tmp/qmd-working-release/20261116T215847Z-code/live.R:46-77`).
  Verification-helper reuse is separate from public-cell execution at lines
  21-39. The launcher supplies process-local isolation and restores environment
  values (`run.ps1:18-52,69-80` under that task root). No new runtime package or
  orchestrator is introduced.
- The focused checker uses explicit directory test doubles only for offline
  context/control-flow checks, and reports that limitation
  (`experiments/one-survey/check-qmd.R:32-36,52-75`). Its manual-cell checks are
  source/control-flow tests, not substituted live acceptance (lines 78-112).
  The separate source-preservation harness compares task snapshots
  (`.tmp/qmd-working-release/20261116T215847Z-code/check-source.R:14-45`).
- Read existing execution evidence, without rerunning it. `logs/first-4.log:1-4`
  and `logs/existing-4.log:1-4` identify distinct R PIDs and receipt checks;
  both show empty pre-setup aliases at lines 35-37 and the same store-4 roots
  at lines 38-42. Both report initialization/readback PASS at lines 127-134,
  and shared/survey NOT RUN at line 135. Both retain credential fallback
  diagnostics at lines 44-52; these are not omitted or described as absent.
- Read inherited pinned-source inspection at
  `.cg-docs/orchestration/outputs/pipsystem/qmd-working-release/20261116T211207Z-inspection/handoff.md:47-83`.
  No package repository was directly read in this review. Relevant inherited
  provenance is pipfun `7d534516a8c17c33d537681610eccd4c29211762` and stamp
  `95890411e8bf9db842593c2b0ab68ec4f2a66b25`; these also appear in the live
  logs at lines 14-15. Historical source citations are not represented as an
  independent package-source audit here.

## Gaps
- No R, PowerShell harness, network, renders, tests or editor diagnostics were
  executed by this reviewer. Logged PASS is reviewed execution evidence, not a
  new run. Direct filesystem containment and credentials behavior are not
  independently certified by this static architecture review.
- At the inspected source/log snapshot, `logs/source-4.log:29-36` is an actual
  FAIL at the whole-config equality assertion, not a passing preservation check.
  The coordinating session reported work on a narrowly scoped reconciliation;
  this review neither authorizes that change nor claims its rerun passed.
  Current source-preservation completion and final verification remain with the
  coordinating Code session. This known check failure is not a new architecture
  finding or grounds to broaden this review into instruction/config redesign.
- Current checkout HEAD was not independently queried (frontmatter UNKNOWN).
  The earlier inspection records head
  `e9c71e3190f1ce88a017ae25af7c373a64c655a2` at its lines 11 and 45-46;
  that is inherited history, not current Git verification.
- Shared initialization, real auxiliary/survey execution, B6, broad Qmd/style
  review and package implementations are outside this review. No additional
  safeguards or restructuring are proposed for this bounded acceptance slice.
