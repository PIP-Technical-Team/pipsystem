---
schema: pip-handoff-v2
project: pipsystem
task: retained-candidate-validation
run: 20261117T171652Z-readonly-review
status: completed
updated: UNKNOWN
owner: cg-testing static reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: User-approved bounded static read-only review
next: Coordinator integrates review and owns final static rerun before user-session execution.
---

# Retained-candidate probe static review

## Summary
No supported P0, P1, P2 or P3 issues found in the bounded static review.
This completes the review only, not retained-candidate validation or pipeline
acceptance. All live catalog, metadata, payload, hash and projection results
remain NOT RUN. No findings were suppressed or deferred.

Current probe guards, exact reads, raw public hashing and national target
coverage checks are consistent with the requested read-only slice. Successful
future checks would establish technical readability/coverage only, not candidate
authority, selected-version adoption or a supported repair method.

## Changes
Only this assigned report created and finalized. No source edits, Git or package
changes. No protected artifact deleted, replaced or moved. No namespace/data
patch, initialization, installation or selected-version change performed.

## Checks run
Checks below are file inspection, not reviewer-executed R tests. Paths beginning
with `probe.R`, `handoff.md` or `static-check*.log` refer to the parent
`20261117T171652Z-readonly` output folder. `check.R` refers to
`.tmp/retained-candidate-validation/20261117T171652Z-readonly/check.R`.

- Loaded existing R shared, technical, data.table, collapse and testing skills,
  plus technical-communication skill. Read project scope/design/contract files.
- Read current `probe.R:1-216`, preparation `handoff.md:1-49`, and
  `check.R:1-71`. No R, shell, network, shared access or Git performed.
- Read `static-check.log:1-8` and `static-check-2.log:1-8` in the output run
  folder. Both record parser/AST PASS, writer negative-control detection, exact
  pins, hash-before-copy order and no live-reader execution, using R 4.5.2.
  The initially attempted scratch log path was absent; logs were found in the
  output folder. This location difference is not a code defect.
- Stage semantics: `probe.R:61-65` initializes outcomes to NOT RUN;
  `:81-104,109-123` sets the stage before each operation; `:203-206` marks the
  failing stage FAIL and records the actual condition message. Later stages for
  that candidate stay NOT RUN, and the loop proceeds to the next candidate.
  PFW failure leaves national coverage unavailable; independent other-candidate
  reads/hashes can still run, but their projections remain NOT RUN (`:163-164`).
  A valid subnational mapping is explicitly outside this bounded projection
  check and stays NOT RUN (`:156-162`), rather than being accepted nationally.
- Pins: `probe.R:56-60` and `check.R:60-63` agree on all six literal candidates:
  PFW dbd2ccf63260991d; CPI ae38185bd7ff383c; PPP c16e62d94f46e1bc;
  pop c059b971f5fc70cc; GDP 062e2d30b15b4661; PCE 4d57e305a0e3c86e.
  Both metadata and payload calls pass `version = candidate`, `alias = "aux"`
  and `format = "qs2"` (`probe.R:92-103`). There is no latest/default selector
  or default-PPP filtering wrapper in these calls.
- Hashing: `probe.R:107-121` validates one usable historical content hash,
  requires catalog/sidecar hash equality and hashes the untouched public return
  with `stamp::st_hash_obj(payload)`. Projection conversion/copy occurs later
  (`:123-125`). No attribute stripping or guessed normalization is inserted.
- Coverage: `probe.R:127-159` requires included COL/2010/GEIH welfare mapping,
  rejects missing/empty/duplicate welfare types, selects one income row and
  accepts only exact supported domain codes 1/2. National readiness requires
  all five domains to be 1. Auxiliary checks require the expected fields and
  nonmissing unique projection keys (`:166-184`), CPI2021 or PPP2021 as
  applicable and national finite positive values (`:185-195`). PPP can retain
  multiple uniquely keyed release/adaptation variants; its detail explicitly
  says vintage NOT selected (`:197-198`). These are bounded coverage checks,
  not full consumer acceptance or a choice of authoritative PPP vintage.
- Context/origins: `probe.R:8-9` requires the existing main checkout and R4.5.2;
  `:10-12` disables automatic pipfun logging and restores those options;
  `:16-40` checks reader and recursive import namespace paths without unloading
  or switching existing namespaces. `:41-52` checks active
  20260401/TEST/PPP2021 and the exact auxiliary root. Failures stop rather than
  auto-resetting/installing/initializing. `:211-213` clears only the probe output
  before evaluation, preventing reuse of stale PASS after a stopping guard.
- Static harness: `check.R:10-22` parses and walks the probe without evaluating
  it; `:31-42` checks explicit writer calls and a nonexecuted save negative
  control; `:43-68` checks pinned read arguments, six literals and lexical hash
  order. Its only `eval()` targets the verified literal candidate-vector call
  in baseenv (`:56-63`), not the live probe. Claims about branch/context and
  projection behavior above come from direct source inspection, not behavioral
  tests or the AST log.

### Pinned source evidence

Only the approved local source archive tree
`.tmp/one-survey/qmd-acceptance-20261113/sources/` was used. SHA associations
below are inherited from the user's supplied provenance and preparation report;
no Git or installed-library provenance certification was performed here.

- pipload `4ef0d90a974cb6ff0725da69373bde421dd04ad5`:
  `R/pip_read-write.R:63-106,119-134` supports exact historical metadata and
  payload delegation without initialization. `R/zzz.R:1-11` sets missing options.
- stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`:
  `R/version_store.R:523-608` requires a retained artifact, reads it and restores
  attributes before returning it; `R/hashing.R:193-278` defines the public object
  hash path. Thus this review deliberately does not reinterpret a future raw
  public hash mismatch as permission to strip attributes. `R/zzz.R:81-101`
  initializes in-memory defaults/format mappings/theme, not an artifact store.
- pipfun `7d534516a8c17c33d537681610eccd4c29211762`:
  `R/working_release.R:315-329` reads existing release context and assigns into
  caller memory, aborting if absent. `R/zzz.R:22-33` confirms automatic log
  initialization depends on the option disabled before namespace loads.
- pipdata `53a76e379c81a3ac70b39925954981ae6a691459`:
  `R/dependency_inputs.R:183-236,257-317,331-373` establishes PFW inclusion,
  welfare uniqueness, domain mapping and required projection fields;
  `R/pd_aux_attr.R:135-178,195-216` establishes survey/year/country filtering
  and CPI/PPP/version/reporting-level naming. No pipdata function is executed
  by this probe or review.

## Gaps
- All live catalog, metadata, payload, hash and projection results NOT RUN.
- The first static log predates the R4.5.2/exact-domain/blank-welfare guards,
  as stated in the assignment. A second retained PASS log was also inspected,
  but its exact source revision is not independently bound by these log lines.
  Final current-source static rerun remains coordinator-owned; none was run here.
- Actual initialized-session namespace origins, descriptor, aliases, reader
  registrations and any indirect runtime effects were not exercised or audited.
  Static explicit-call screening is not an operating-system write monitor or
  proof of every transitive runtime effect. No broad framework is proposed.
- Checkout HEAD not independently verified: Git is prohibited in this review.
- Report update time is UNKNOWN because this task prohibits shell execution;
  no system clock was read. Branch main is supplied context and guarded by the
  probe, not independently observed Git state here.
- Candidate authority, historical cause, backup availability, supported
  reconciliation, default public pipeline readiness and complete survey
  acceptance remain UNKNOWN/not assessed. No repair or adoption is recommended.

## Final-source guard verification addendum

Verified by static inspection and retained test evidence: no supported new
P0-P3 issue in the requested guard/no-autoinitialization/no-ambient-fallback
delta. Earlier review references and inspection cutoffs above remain historical;
this addendum supersedes only their pending final guard-check evidence.

- Current `probe.R:10-13` requires stamp/pipfun/pipload/qs2 already loaded and
  the private library first, before options changes or any package use.
  `:24-25` guards namespace membership before `asNamespace()`; there is no
  `loadNamespace()` call. Recursive import checks retain the existing origin
  policy (`:26-44`), without replacing or resetting loaded namespaces.
- `probe.R:45-50` requires the named lazy helpers to exist in the first private
  library and checks already-loaded helper origins. This accommodates normal
  lazy helper loading in the existing initialized session without installing,
  changing library paths or cold-starting the PIP readers. After the public hash,
  `:127-133` checks secretbase origin before marking that hash PASS. The actual
  user's initialized-session compatibility remains NOT RUN, not inferred.
- Current `check.R:69-83` rejects explicit loadNamespace use, evaluates only the
  extracted function definition into a base-parent environment, then calls it
  with no reader namespaces loaded. It requires the specific initialized-reader
  guard error and rechecks reader namespaces remain absent. This is a local
  behavioral guard test, not merely an AST check and not a live candidate test.
- `static-check-3.log:1-9` records PASS for that cold-session failure test,
  the writer AST negative control, exact pins and hash-before-copy checks under
  R4.5.2. Reviewer inspected this evidence but executed no R or shell command.
- Only this report was appended. No new package sources, source edits, shared
  access, network or Git. All live candidate catalog/metadata/payload/hash/
  projection checks remain NOT RUN; no authority or pipeline acceptance follows.
