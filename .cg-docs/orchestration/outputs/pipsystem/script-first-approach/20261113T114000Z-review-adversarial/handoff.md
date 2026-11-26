---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T114000Z-review-adversarial
status: completed
updated: UNKNOWN
owner: adversarial-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: UNKNOWN
plan: .cg-docs/plans/2026-11-12-script-first-pipeline-qmd.md rev1
next: Implementation owner incorporates this review into Plan rev1 final verification; no adversarial fixes identified.
---

# Adversarial review

## Summary
No significant introduced issues found in the scoped full-route static
adversarial review. No P0, P1 or P2 findings. This is not pipeline acceptance
or independent execution certification.

The saved current-run summary explicitly contains four PASS, one processing
FAIL (`A single working release and identity are required.`), and two NOT RUN
rows (`.tmp/one-survey/n11/qmd-20261113T114000Z/results.tsv:2-8`). It does
not earn original survey acceptance or B6. The Qmd makes that distinction
explicit at `experiments/pip-pipeline.qmd:23-26,321-337`.

## Findings
No actionable issues established. No fixes or additional safeguards proposed.

## Changes
Only this requested report was created and finalized, inside the E: checkout.
No source, package, pin, Git, installation or live-service changes. Earlier
dirty setup/scenario/reproduce content was treated as context, not attributed
to this implementation. No generated view bodies or diffs were read.

## Checks run
- Loaded communication and R shared/technical/data.table/collapse/testing skills
  before reviewing R.
- Read Plan rev1, project constraints, design and coordination contract.
- Read new `experiments/pip-pipeline.qmd`, `one-survey/qmd-fixtures.R`,
  `one-survey/check-qmd.R`, the launcher qmd modes/render block, and setup.R's
  source-safe mode default. Read existing setup, paths helper and scenario only
  as context. Findings were limited to introduced changes.
- Failure reporting: Qmd initializes every result NOT RUN (36-54), catches each
  package/assertion failure with conditionMessage, gates dependent chunks on
  pipeline_ok (119-121,148,175,216-218,250-252,291-293,313-315), and prints and
  saves the same result table (324-337). No historical acceptance file is read
  into the document's result state. Existing check-qmd.R:14-25 exercises the
  actual recorder; that check was inspected, not executed here.
- Paths/isolation: run.ps1:67-96 requires installed Quarto, checks a fresh
  render destination with the existing path helper, redirects its Deno/log/R
  paths, copies the source, checks copy SHA256 equality, and uses the private
  runtime. Existing environment redirection is at run.ps1:40-66 and restoration
  at 137-142. paths.ps1:1-33 checks checkout containment and redirects/hardlinks.
  Qmd:109-115 directs its store and manifest to the render run; setup.R:203-241
  provides the existing receipt/namespace verification used at Qmd:65.
- Assertions: visible Qmd:194-210 requires completed valid/invalid classification
  and the missing-weight diagnostic; 238-269 captures and requests returned exact
  clean/meta versions; 271-286 compares paired rows and metadata/weight totals;
  299-315 gates no-output assertions on successful processing. These agree with
  current scenario.R:207-292. Exact comparison to the immutable committed ORACLE
  remains a limitation noted below, not an independently verified claim.
- Instruction surfaces: inspected AGENTS.md:124-139, ORCHESTRATOR.md:113-126,
  CONTRACT.md:15-30 and the readable portion of kilo.json:7. The three Markdown
  excerpts agree. check-qmd.R:41-68 contains the intended JSON/excerpt/non-prompt
  comparison. This review did not execute a JSON parser.
- Read existing results.tsv:1-8 and quarto.log:1-65, not generated HTML. The
  console log records the chunk sequence and an HTML output, not survey success.
  Source SHA256 `3BF38A85604B66551F5DFC20718A781C47C66330253833E7B2325172C99F83D2`
  is user-supplied and reported at work-report:51-56; not recomputed here.
- No commands, tests, R, Quarto, package/Git operations or live services executed.

## Private Source Provenance
Read only existing private extracted source context under
`.tmp/one-survey/n11/sources/`; no external package repository was read.
Recorded pins from setup.R:16-22 (not recomputed archive/HEAD identity):

| Package | Recorded source SHA |
|---|---|
| stamp | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 |
| pipfun | 7d534516a8c17c33d537681610eccd4c29211762 |
| pipload | 4ef0d90a974cb6ff0725da69373bde421dd04ad5 |
| wbpip | fd2c687ed527ebe33d0a7addf9859f72f71ff39f |
| dlw | 12faa058b521ef511073a7b21b1b1dd7993c9649 |
| pipaux | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be |
| pipdata | c5b27fa4458d7175aca81a203762bae81e9f0b40 |

## Gaps
- Runtime behavior, child indirect writes and source hash identity were not
  independently executed/recomputed. Static route inspection is not a filesystem
  write trace. Existing evidence is supporting evidence only.
- Current HEAD, dirty-file diff attribution and current clock are UNKNOWN:
  commands/Git were forbidden. Branch main is the requested context, not a
  freshly verified Git fact. No ownership claim is made over earlier dirty code.
- The immutable ORACLE at e9c71e3190f1ce88a017ae25af7c373a64c655a2 was not
  retrieved via Git. Compared visible assertions with the current scenario and
  Plan's specified expectations, without claiming the immutable comparison ran.
- The file-reading tool truncates kilo.json's long prompt line. Full prompt
  equality/JSON parsing relies on the existing implementation evidence, not an
  independent parser check in this review.
- Original numerical/exact-readback/no-output execution and B6 remain unfinished;
  final Plan verification and instruction reload remain outside this review.
