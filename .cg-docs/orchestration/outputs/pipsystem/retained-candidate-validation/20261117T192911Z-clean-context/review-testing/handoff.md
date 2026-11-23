---
schema: pip-handoff-v2
project: pipsystem
task: retained-candidate-validation
run: 20261117T192911Z-clean-context/review-testing
status: completed
updated: 2026-11-17T20:17:16Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: NONE
next: Coordinator integrates final-source verification; shared mode remains user-only and NOT RUN.
---

# Clean-context launcher testing review

## Summary
No supported P0, P1, P2 or P3 issues found in the scoped static testing review.
No findings suppressed or deferred. The safe default exits before shared
bootstrap; retained evidence supports fresh-process/private-data.table startup
only, not shared candidate acceptance or release authority.

## Changes
Only this assigned report created and finalized. No launcher, worker, probe,
package, original runtime, library, namespace, data or configuration edits.
No shell, R, tests, network, shared-path, credential, install, Git, Manager,
worktree or pipeline operations performed by this reviewer.

## Checks run
All paths below are relative to the reviewed clean-context bundle unless
explicitly qualified. Checks were file inspection, not execution.

- Loaded R shared, technical, data.table, collapse and testing skills, plus
  analytical skill for the unchanged probe's survey projections and technical
  communication skill. Read required project context and handoff contract.
- Inspected complete launch.ps1, worker.R, handoff.md, both retained preflight
  result.log/process.json pairs, and ../20261117T171652Z-readonly/probe.R.
- Safe default: launch.ps1:22 selects preflight without the explicit switch;
  credential acquisition is inside the switch branch at :74-90. Worker :69-74
  returns before stamp/pipfun loading (:79-80), shared lookup (:87-90), public
  setup (:95-99), and probe sourcing (:119). Preflight additionally asserts
  the six listed PIP/QS2 namespaces remain absent (:70-71).
- Startup order: launch.ps1:43-47 sets private R_LIBS, disables user/site
  libraries/profiles and limits default packages before launching actual
  Rscript --vanilla (:93). Worker :21-22 asserts the complete library order;
  :57-60 loads/asserts private data.table. This avoids reusing the original
  session's already-loaded ambient namespace; it does not unload or patch it.
- Exact checks: worker :14,25 and :117 retain the probe MD5 check; :28-44
  retain three exact package SHA/receipt/archive/install-metadata checks;
  :46-55 retain exact dependency manifest/path/version/DESCRIPTION checks.
  These are the stated receipt checks, not a whole-installed-code hash audit.
- Unchanged probe retains six exact candidate pins (:67-71), exact catalog
  membership (:94-100), explicit historical metadata/payload reads (:103-114),
  catalog/sidecar equality and untouched public payload hashing (:118-133),
  and bounded coverage checks (:135-213). It does not select a PPP vintage
  (:209-210) or establish release authority (:227).
- Failure flow: worker :76-78,136-139 labels bootstrap errors FAIL with actual
  condition text and dependent candidate checks NOT RUN before probe start.
  Unchanged probe :72-77,92-93,215-218 initializes unattempted cells NOT RUN
  and marks the failing stage FAIL. Worker :129-134 rejects partial results
  as exit 2, with no readiness/repair authorization claim. Launcher :102-107
  also labels shared setup/probe failure when no candidate-results file exists,
  including launcher failures that occur before the worker starts.
- User-only directory assurance: worker :95-99 calls public setup only after
  the preflight exit; handoff.md:19-22 explicitly acknowledges approved shared
  support-directory creation. No assertion that setup is entirely read-only
  is inferred. No producers, saves or selection-changing operation appear in
  these scripts; the existing probe's public-read behavior is retained.
- Catalog byte semantics: worker :89-92 captures existing auxiliary catalog
  MD5, :102-107 compares after setup, :123-128 compares after completed reads.
  Mismatch raises FAIL and explicitly declines rollback. The PASS message is
  narrowly about catalog bytes at those sampling points, not all shared files,
  absence of transient writes, concurrency attribution, or authoritative pins.
- Retained runs/20261117T1935519127Z-preflight-35104/result.log:1-7 reports
  actual R4.5.2 PID29260, private data.table origin, 107 dependency descriptions,
  and shared bootstrap/candidates NOT RUN. Its process.json:2-5 records
  preflight exit 0 and E: evidence/scratch paths.
- Retained runs/20261117T1942147663Z-preflight-29968/result.log:1-7 reports
  actual R4.5.2 PID25608 with the same scoped PASS/NOT RUN statements; its
  process.json:2-5 records preflight exit 0. Distinct R PIDs support separate
  child processes, not merely changed launcher labels.
- No package source files or repositories were read. Source pins below were
  inspected as literal expected values in worker.R:28-31 and inherited claims
  in handoff.md:32-35, not independently certified package code provenance:
  stamp 95890411e8bf9db842593c2b0ab68ec4f2a66b25;
  pipfun 7d534516a8c17c33d537681610eccd4c29211762;
  pipload 4ef0d90a974cb6ff0725da69373bde421dd04ad5.

## Gaps
- Runtime verification is excluded; shared-context execution is forbidden.
- Current checkout HEAD is UNKNOWN because shell and Git operations are excluded.
- Last-added PowerShell failure-label rerun remains coordinator-owned. Both
  retained preflights passed but are not claimed as execution of that final
  source revision or of its failure branch. The current bundle handoff remains
  an in-progress coordinator artifact, not final integrated verification.
- Shared bootstrap and all six live candidate reads remain NOT RUN. Catalog
  preservation, public reader compatibility, shared directory side effects,
  credentials, and error-path behavior are statically assessed, not executed.
- This review is not an OS-write audit or independent hash recomputation;
  launcher path-helper implementation lies outside the expressly scoped files.
- Historical cause, authoritative versions, backups and recovery method remain
  UNKNOWN; technical candidate success would not authorize catalog promotion,
  selection changes, repair, data saves, or pipeline execution.
- Later: no new framework, dependency or defensive test suite proposed for this
  bounded slice. Coordinator's final default preflight is the outstanding
  functional check; no shared-mode run is delegated to an agent.

## Final-source verification addendum

Narrow follow-up requested 2026-11-17T19:58:15Z: explicit no supported new or
remaining P0-P3 issues in the reviewed corrections. P2.1 is verified fixed in
source and supported by retained dummy-only mask/restore evidence. This
supersedes the earlier final-preflight-rerun gap, not the live-acceptance limits.

- launch.ps1:9,97,108-112 now distinguishes launcher failure before child
  invocation (dependent checks NOT RUN) from missing results after invocation
  (no acceptance inferred). Because the flag is set immediately before native
  invocation, it is an attempt marker, not independent proof of successful R
  startup. The post-attempt message remains conservative either way; it does
  not assert that no candidate reads occurred.
- worker.R:142-148 catches otherwise uncaught local startup/preflight errors,
  retains actual condition text and returns exit 1. Shared/probe errors still
  use main's stage-specific handler (:136-139); the preflight return remains
  ahead of all shared operations (:69-74). No stage FAIL is converted to PASS.
- P2.1: launch.ps1:77-86 snapshots GH_TOKEN/GITHUB_TOKEN and clears both before
  gh lookup, only inside the explicit user-only branch; :115-119 restores the
  snapshot in finally. Neither override can select an ambient credential for
  that lookup. The preflight does not enter this branch. No persistent config
  or credential change is introduced by these statements.
- credential-env-test.log:1-3 reports actual launcher clear/finally statements
  masking/restoring dummy values, with gh/auth/R/network/shared NOT RUN.
  review-summary.md:20-26 describes AST extraction and dummy assignment before
  reading the variables. This is local statement-check evidence, not live
  authentication, and was read rather than rerun by this reviewer.
- runs/20261117T1956347727Z-preflight-25696/result.log:1-7 records R4.5.2
  PID33548, private data.table origin, pinned receipts/107 dependency
  descriptions PASS, shared bootstrap/candidates NOT RUN; process.json:2-5
  records preflight exit 0 and E: paths. The latest corrected default-preflight
  evidence now resolves the prior rerun gap. Error branches themselves are
  statically reviewed, not executed by this reviewer.
- Only this report updated. No source edits, shell, R, tests, network, shared
  access or credential access performed. No additional package sources read;
  the previously recorded expected source SHAs remain unchanged. Live context,
  catalog preservation and six-candidate acceptance remain NOT RUN, with no
  actual-code immutability, version authority, repair or readiness claim.

## Short-path bugfix review addendum

Narrow review requested 2026-11-17T20:17:16Z: no supported P0-P3 issues found
in this path-layout correction and its local regression check. No new safeguard
framework or guard weakening proposed; the one directory check demonstrates the
changed local layout, not live context acceptance.

- launch.ps1:24-28 uses a 12-hex GUID key for short checkout/.tmp/rcv scratch
  and existing-bundle/runs output. Confinement checks remain (:29-30,74-75).
  Receipt :105-109 preserves mode, exit, log/scratch, full UTC start and launcher
  PID rather than relying on the shortened directory name for those facts.
- worker.R:18,24 confines scratch to checkout/.tmp/rcv and sets the child's
  working directory there. The path regression :69-82 creates the exact legacy
  suffix plus 48-character component/survey_data under scratch/path-check.
  Actual setup root/out_dir remains scratch/legacy (:110-115), a separate
  sibling. The synthetic component cannot enter that actual vintage tree.
- Inspected pinned pipfun source
  .tmp/one-survey/qmd-acceptance-20261113/sources/pipfun/R/pip_create_globals.R:
  170-199, at supplied SHA7d534516a8c17c33d537681610eccd4c29211762.
  :171-173 matches the test suffix; :184-199 appends vintage/survey_data and
  :196-197 lists directories inside the actual OUT_DIR_PC. This supports the
  isolated check and the importance of not planting synthetic vintages there.
- runs/460abc537a7c/result.log:1-9 reports R4.5.2 PID26288, short E: working
  directory, private data.table/107 descriptions PASS, successful 212-byte
  regression directory (<260), and shared bootstrap/candidates NOT RUN.
  process.json:2-7 records preflight exit0, matching short paths, UTC start
  and launcher PID28536 (distinct from the R PID, as expected).
- Current preflight return (:86-91) still precedes PIP namespaces/shared lookup.
  Release/TEST/PPP2021, three SHA pins, probe MD5 and live-only credential mask/
  finally restoration remain unchanged. Local directory creation uses base R
  rather than PIP setup. No namespace/data patches or original-session changes.
- handoff.md:88-109 preserves the user's failed PATH_MAX attempt as bootstrap
  FAIL/dependent NOT RUN, with catalog comparison not reached and partial
  directory assurance unknown. That historical log was not independently read
  in this narrow follow-up. Live retry is NOT RUN; shorter-path success alone
  does not prove the constructor, authentication or candidate reads now pass.
- Only this report appended/metadata updated. No shell/R/tests/network/shared/
  credential access or source edits. No other package sources read. Earlier
  static-review and whole-store/authority limitations remain in effect.
