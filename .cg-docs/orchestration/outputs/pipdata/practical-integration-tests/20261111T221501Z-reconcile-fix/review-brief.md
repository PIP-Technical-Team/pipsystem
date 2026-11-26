# B2 Independent Review Brief

## Scope And Route
Review ONLY the new B2 changes in existing pipdata PROD at
E:/PovcalNet/01.personal/wb384996/PIP/pipdata, expected unchanged HEAD
c5b27fa4458d7175aca81a203762bae81e9f0b40. R/reconcile_pip_inventory.R has a
three-line initialization for columnless local prior input inside the clean
branch. tests/testthat/test-reconcile-pip-inventory.R adds three tests at 77-127.
Compare these files with r13/baseline copies, not the pre-existing context changes.
Do not restart or re-review the preserved context fix, context test or old reviews.

Resolved route: data-risk (join/inventory correctness), eight standard roles,
mandatory emphasis data-quality/reproducibility/testing. This fixes initialization
of canonical existing keys, not a new persisted schema or package API. No full-
review routing or new visible Agent Manager sessions. Internal independent
review tasks only. Final mode:verify will be light code-quality/testing only.

## Evidence And Constraints
- Read this run's handoff.md. B2 source cause confirmed before editing using
  unchanged installed baseline: native join old[add,on="pip_id"] with old=0x0
  while add contains a verified receipt and pip_id. r13/logs/proof.log and
  evidence/confirmed-empty-prior-join.rds preserve actual failing-frame facts.
- Unit test constructs an empty in-memory input for a pure reconciliation
  function. It does not seed a stored master or bypass public preparation.
- r13/logs/red.log: twenty blocks,61 passing assertions,1 exact native test error
  at old join line41,zero failures/skips; new typed-empty/nonempty-error controls
  and all old assertions pass. Successful red-wrapper exit records failure only.
- r13/logs/green.log:20 blocks,66 passing assertions,zero failures/errors/skips.
  r13/logs/affected.log:130 blocks,616 passing assertions,zero failures/errors/skips.
  Same test SHA256 before/after every execution, frozen payload recorded.
- Runtime absolute root E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/
  one-survey/r13. Installed candidate = exact recorded c11 context snapshot
  (c5b27fa + preserved context source/test) plus ONLY the two B2 source/test files.
  r13/logs/candidate-source-sha256.tsv records every source file. Not a dirty-tree
  install, no ambient fallback. Installed reconciliation body compared to source.
- Preserved context source SHA256
  62922a9b60c893f79e033b9d808411bdedacdcb754663a9be3deb7860e2372ea;
  context test SHA256
  478fce6684831c75bf4e49273d7e7b078db45ae9c002c264c5ed6e7c9f625f71.
- Fix changes only truly columnless prior input; typed schemas and malformed
  nonempty history stay on existing join/error paths. No catch/fallback, new
  observation, fake stored master, rewritten catalog or weakened assertion.
- Existing full/light context reviews and110/550 evidence remain authoritative
  only within their old scope, untouched. B1 actual-parent/expanded gate remains
  pending AFTER this new review and verification; no survey acceptance claimed.
- Child temp/home/config/cache/library/profile/log/store paths redirected to E:
  before R; private native QS2 enabled. Installed help CSS-copy warning retained.
  get_errors/execution_subagent unavailable; no fabricated diagnostic/Pester.
- No downloads, other-package edits, Git mutations, original Plan/pin changes,
  full original survey rerun, shared/production writes, worktrees or sessions.

## Relevant Local Lessons
Targeted Brain topic Force_Surveys/Pip_Id and snippets consulted, no team pull.
- .cg-docs/solutions/testing-patterns/2026-08-21-built-package-and-checkpoint-
  verification.md: source loading alone is insufficient; compare/test installed
  package and explicit dependencies, then real public persistence.
- .cg-docs/solutions/data-quality/2026-08-26-durable-stage-reconciliation.md:
  distinguish lenient absent caller input from schema-light durable corruption;
  do not infer rollback from exceptions or mutate caller tables by reference.
- .cg-docs/solutions/bugs/2026-04-29-conditional-column-init-inconsistent-schema.md:
  preserve typed column contracts; do not silently drop durable schema. Applies
  here through narrow columnless-only initialization, not wholesale schema reset.

## Instructions
Read-only independent review; no implementation or test/script execution. Load
pl-clear-technical-communication, cg-skill-r-technical, cg-skill-r-datatable;
testing role also cg-skill-r-testing. Inspect actual new diff/files, source caller
and retained evidence. Read-only Git and Get-Date are allowed. All direct and
indirect writes MUST be E: and ONLY your assigned report under this run. Use
apply_patch to create/checkpoint that report at start, then complete it.

Use pip-handoff-v2: schema,project pipdata,task practical-integration-tests,run
20261111T221501Z-reconcile-fix,status completed,updated UTC from clock or UNKNOWN,
owner role,repo full root,branch PROD,head full SHA,plan NONE,next; Summary,
Changes,Checks run,nonempty Gaps. Findings P0-P3 with concrete file/line,impact,
remedy and [safe_auto]/[manual]/[advisory], or explicit no issues found in named
changed files. Source/evidence review is not independently executed test proof.

Never recommend deleting,replacing,renaming or moving protected artifacts:
.cg-docs/brainstorms/,.cg-docs/solutions/,.cg-docs/archive/,compound-gpid.md,
compound-gpid.local.md,roadmap.json,SCHEMA_VERSION,.github/. No generated HTML
body reads. Minimal first: smallest complete fix; safeguards only almost-
irreversible; one functional check per change; installed deps only when worth
their cost; Plans about two pages. Human times ET; machine evidence UTC.
Return report path, supported findings or no issues, and actual checks/limits.
