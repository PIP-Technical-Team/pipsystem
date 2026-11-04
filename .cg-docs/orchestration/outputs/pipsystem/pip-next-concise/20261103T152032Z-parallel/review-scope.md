# Implementation Review Scope

Repository: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem, existing main checkout,
HEAD 23476ec536457feb41973e262417e8df3010a648. Language R, data.table/collapse;
this change is command text and testthat fixtures, not numerical/package code.
Approved Plan: `.cg-docs/plans/2026-11-03-pip-next-concise-decision-brief.md`, revision 2.

## Owned Changes
- `tools/pipsys/kilo/commands/pip-next.md`: prerequisite-first recommendation and
  roughly 150-250-word brief versus full saved evidence. Preserve all assessment
  validation, scope, freshness, provenance, containment and read-only limits.
- `ORCHESTRATOR.md`, `AGENTS.md`, `.cg-docs/orchestration/CONTRACT.md`, pip-orchestrator
  prompt in `kilo.json`: only the command-specific output exception.
- `tests/pipsys/test-pip-next.R`, `tests/pipsys/fixtures/pip-next-cases.json`:
  coupled deterministic contracts and existing plus six new frozen cases.
- Generated pip-next installed copy only via installer; all other definitions unchanged.
- Task-owned reports, scripts, supplied inputs, sampled responses and verdicts in
  this run; linked execution report, narrow Plan lifecycle and active-state records.

## Baselines And Ownership
The command, its tests and fixture existed untracked before work. Review their
changes against `baseline/tools__pipsys__kilo__commands__pip-next.md`,
`baseline/tests__pipsys__test-pip-next.R` and
`baseline/tests__pipsys__fixtures__pip-next-cases.json`, not against an empty Git diff.
Coordination baseline files use the same `/` -> `__` naming. `status-checkpoint.txt`
lists task and unrelated dirty paths. Do not review or edit unrelated changes.
The already-dirty `tools/pipsys/pipsys.R` and `tests/pipsys/test-pipsys.R` are
excluded from edits and must remain byte-identical to their baseline copies.
Standalone pip-status, pip-overview and pip-handoffs definitions remain unchanged.
All nine installed-definition baselines are `baseline/installed__<kind>__<name>.md`.

## Verification Limits
Installed checkpoint: `install.stdout.txt` exit 0; `integrity.stdout.txt` exit 0,
nine source/installed byte-parity pairs and all eight non-target baselines preserved.
Full post-install tests: `test-pip-next.R.result.json` = 11 tests / 200 expectations;
`test-pipsys.R.result.json` = 38 tests / 407 expectations, zero failures/errors/
warnings/skips. Full stdout/stderr stored under matching test-file names.
`behavior-verdicts.md` records coordinator all-21 oracle verdicts. Final accepted
17 valid/failure briefs are 199-241 words, no full SHA/gate leakage. Final core,
final-contract-2/3, final-headings and final-standalone records supersede affected
initial samples. Exact final source was sampled for saved-report headings and
read using the existing parser without editing site/reader files.

`source-checks*.stdout.txt` are executed source contracts, not model behavior.
`supplied-input*.md` and `sampled-output*.md` are frozen simulations, not real
pipeline, DLW, integration, live-source or deployment checks. Actors receive only
revised command, simulation instructions, arguments and evidence; `required` and
`forbidden` oracle fields are withheld. Coordinator evaluates afterward. Round 2
tightens SHA/detail exclusion from default chat; retain original results.
Post-install full test-file results and byte parity are separate evidence.
File copying does not prove active client instructions: activation pending reload
unless actually observed. No IDE get_errors tool is available; no such check claimed.

## Route And Constraints
review:auto resolves standard: ordinary command/test changes, not just small
wording; no permissions, installer paths/logic, schema, analytical algorithm or
runtime API changed. Eight standard reviewers required; no model overrides.
Preserve P0/P1 strength and report any genuine cross-file regression at any severity.
Tag findings [safe_auto], [manual] or [advisory]; report P0/P1/P2/P3 with file:line,
evidence, consequence and smallest fix, or explicitly state no issues found.
User authorizes all applicable scoped fixes including P3; two correction rounds
per review stage. Do not expand scope or weaken tests to achieve green.

Never recommend deleting, replacing, renaming, or moving `.cg-docs/brainstorms/`,
`.cg-docs/solutions/`, `.cg-docs/archive/`, `compound-gpid.md`,
`compound-gpid.local.md`, `roadmap.json`, `SCHEMA_VERSION`, or `.github/`.
Do not read generated `.cg-docs/views/**` bodies/diffs. No package files/tests,
pipeline/live/production access, Git mutation, roadmap writes, client/global config,
new visible sessions/worktrees, new dependencies/frameworks or scheduling.
All writes and indirect process files must resolve to E:. Do not run processes
unless TEMP/TMP/TMPDIR and any caches/logs are redirected to existing E: locations.
Use installed tools first. Minimal first: smallest end-to-end correction, safeguards
only for almost-irreversible harm, otherwise Later; one functional check per change;
Plans about two pages. Review evidence is read-only except each assigned handoff.

## Prior Learning
Prior review `.cg-docs/reviews/2026-11-02-pip-next-review.md:17-29` requires literal
output/error coverage and independent punctuation/multi-name/trimmed-input samples.
Revision 2 is the sole execution Plan. Prior completed command Plan is not approval.
