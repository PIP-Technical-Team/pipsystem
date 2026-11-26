---
schema: pip-handoff-v2
project: pipsystem
task: script-first-approach
run: 20261113T223219Z-qmd-acceptance/version-control
status: completed
updated: 2026-11-13T22:54:42Z
owner: cg-version-control
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Coordinating acceptance owner aggregates continuation reviews and performs V5 light verification.
---

# Narrow Qmd continuation version-control review

## Summary
No supported P0-P3 version-control issues found in the narrow pin-only
continuation defined by review-brief.md:3-54. This is not approval of the
entire dirty checkout or a repeat of completed broad Qmd/package reviews.

## Findings and evidence

- No issues found: `experiments/one-survey/setup.R:16-22` contains seven
  full source SHAs; current pipdata pin is
  `53a76e379c81a3ac70b39925954981ae6a691459`.
  `.tmp/one-survey/qmd-acceptance-20261113/pins.tsv:2-8` agrees with all
  seven entries. The continuation's prior pipdata pin and unchanged-six
  attribution are documented in the review brief:11-12 and appended
  `.cg-docs/work-reports/2026-11-09-installed-package-one-survey-example.md:170-185`.
- No issues found: `setup.R:119-129,199-232` exports exact Git archives and
  verifies inventory/receipt pin equality; it does not install dirty package
  trees. Retained `logs/repository-status.txt:1-24` discloses dirty package
  metadata/vignette paths and the different pipload HEAD versus archive pin.
  No external package repository was directly read by this reviewer.
- No issues found: `.gitignore:35-38` excludes the private runtime, libraries,
  archives and rendered HTML. Git check-ignore confirmed line 36 covers both
  this run's pins.tsv and pip-pipeline.html; no generated binary is introduced
  into the index by this continuation. No credential or private-data exposure
  was identified in the pin-only source delta or inspected provenance records.
- No issues found: `experiments/pip-pipeline.qmd:16-22,51-69` distinguishes
  synthetic first-save acceptance from B6/live/production and prints runtime
  source provenance. Current canonical and retained render-copy SHA256 both
  match `62024e63b62c0d2999df6fc5cdb5837ec32f1956ea221930976016ba96b39c88`.

### Scope and mixed ownership

Read-only Git inspection verified existing `main` at
`e9c71e3190f1ce88a017ae25af7c373a64c655a2`, as expressly specified by the
brief:9-10. No generic feature-branch finding is raised against this approved
existing-checkout context. `git diff --cached --stat` was empty; no new commit
was present for this continuation to assess.

The total tracked dirty diff is 12 files, 626 insertions and 189 deletions,
plus numerous untracked records and Qmd/support sources. In particular, the
HEAD-to-working-tree setup.R diff also contains older mode, pipload-pin and
evidence-reporting changes. Those are not attributed to this continuation.
The continuation baseline is documented by the brief and work-report, not
represented by HEAD. Qmd/check-qmd.R/qmd-fixtures.R are currently untracked;
their preexisting publication state is not a new pin-continuation defect.

## Changes
Created and finalized only this report. No source edits, staging, commits,
pushes, branch changes or other Git mutations performed. Mixed-owned changes
were left untouched. No new dependency, lockfile or safeguard proposed.

## Checks run
Reviewer-executed read-only checks:

- Read brief, handoff contract, project charter/design/harvest constraints,
  current run handoff and appended original work-report resumption.
- Loaded communication, Git workflow, shared/technical/data.table/collapse/
  testing R skills and read renv conventions. This narrow change uses the
  existing explicit pin/inventory scheme; no renv migration was needed.
- Git status, HEAD, current branch, tracked/staged diff statistics, last ten
  commit subjects, focused setup.R diff and tracked-file inspection.
- `git diff --check -- experiments/one-survey/setup.R`: no whitespace errors;
  Git emitted the existing LF-to-CRLF conversion warning.
- `git check-ignore -v`: private pins and rendered HTML covered by /.tmp/.
- Read-only SHA256 checks of canonical and retained render-copy Qmd: equal
  to the recorded hash above.

Existing execution evidence inspected, NOT rerun by this reviewer:

- `runtime/logs/check.log:1,96` reports rejected stale/incomplete controls
  and seven exact source installs PASS; namespace paths are private.
- `runtime/logs/qmd-check.log:1-4` records three PASS groups and the
  intentional synthetic failure control.
- `runtime/qmd-20261113-acceptance/results.tsv:2-8` records seven PASS rows,
  including exact clean/metadata pins and invalid-survey no-output.

Here `runtime` means `.tmp/one-survey/qmd-acceptance-20261113`.
One timestamp command used unsupported PowerShell 5.1 `Get-Date -AsUTC`;
it failed without changing files and was replaced with
`(Get-Date).ToUniversalTime().ToString('o')` successfully.

## Gaps
- No tests, installs, renders, downloads, pipeline runs or production calls
  were performed. Runtime PASS claims are inspected retained evidence, not
  independently repeated execution or an exhaustive OS-level write audit.
- No pre-continuation working-tree snapshot was supplied for independent
  one-line-only reconstruction; attribution relies on the explicit brief
  and appended work-report, while current pin/evidence agreement was checked.
- Commit/publication of mixed-owned work is outside scope and not authorized.
  No full-history secrets scan, large-file inventory or remote freshness
  check was undertaken; these would repeat/widen the narrow review.
- V5 still requires coordinating-owner aggregation and final light verify.
  B6 later-refresh remains historically failed/open, not waived or certified
  by this first-save acceptance (`review-brief.md:31-35`).
