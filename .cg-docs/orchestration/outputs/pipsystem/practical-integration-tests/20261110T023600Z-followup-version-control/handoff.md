---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-version-control
status: completed
updated: 2026-11-10T02:37:54Z
owner: cg-version-control
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Parent consolidates full review; implementation remains blocked with step-1 correction budget exhausted.
---

# Follow-up version-control review

## Summary
FULL version-control role complete. No actionable version-control P0-P3 issues identified in the scoped changes. This is role completion, not harness acceptance or Plan completion. Step 1 remains blocked after 2/2 corrections; step 2 and diagnosis remain NOT RUN (implementation handoff:19-21,67-77,111-112).

Reviewed experiments/one-survey/{run.ps1,setup.R,checks.ps1}, .gitignore, follow-up Plan and implementation handoff. Read retained final pins, dependency provenance, setup and child-startup logs. No harness, R, package installation, diagnostic, tests, staging or commits executed.

## Findings
Explicit no issues: no new actionable P0-P3 version-control findings.

- Exact source selection: setup.R:9-22 contains seven full immutable SHA pins matching retained final pins.tsv:2-8 and independently observed current package HEADs. setup.R:74-78 reads Git objects with git archive; dirty/untracked checkout content is not an input. Fresh destinations are required by run.ps1:38-40 and setup.R:68-70. This fixes the prior overlay mechanism statically; no independent extracted-tree byte comparison claimed.
- Source-repository writes: setup.R:73-78 writes archives/extracted trees below the fresh runtime, not the package repositories. Installation source is the extracted tree (:55-65), contributed dependencies are copied from E-local ambient paths into the dedicated library (:97-124), and only the private copied Rprofile is modified (run.ps1:90-116). No package-repository edit/write target found in scoped code. This is not an OS-level write audit.
- Runtime exclusion: .gitignore:37 narrowly ignores /.tmp/one-survey/. git check-ignore matched the final inventory, archive and log. git ls-files found no tracked paths below that runtime. Scoped scripts and Plan remain visible as untracked candidates, not hidden by this rule. Large private R/library binaries therefore do not need LFS or broader ignore rules for this bounded harness.
- Secrets: no API keys, credentials, connection strings or PII observed in scoped source/Plan/handoff or the retained text evidence read. Paths and SHA/digest fields are provenance, not secrets. No repository-wide or binary-content secret certification claimed.
- State preservation: root is existing main at f9454707b292a620e25abef17f2e515794020ba7. Only tracked dirty paths observed were .gitignore and .cg-docs/active-state/current.json; staged diff was empty. Existing untracked reports, Plans and scripts remain untracked and preserved. Existing-main operation is explicitly required by Plan:21, not a branch-hygiene defect. Recent ten commit subjects follow conventional commit style; no new commit was created or assessed for focus.
- Dependency recording: final dependencies.tsv:2-54 records 53 copied package versions, E origins/destinations and DESCRIPTION digests. This is an attempt-specific inventory, not a complete rebuildable lockfile or proof of successfully loaded namespaces; the worker accurately preserves that distinction (handoff:93,118-122). No new renv dependency or lockfile policy is warranted for this review.

### Known blockers, not new version-control findings
setup.R:33-34 still calls a non-exported stamp control; final logs/setup.log:26-27 independently confirms this failure after the two reported install exits of zero (:3-4). checks.ps1:56-57 leaves a hard-link target beneath the main attempt, and run.ps1:24-34 rejects that tree on later launches. Both are already disclosed in implementation handoff:60-65,109. They prevent acceptance; successful Git pins and ignore checks do not fix them. No functional correction or rerun authorized to this reviewer.

## Package provenance / read-only checkout observations
All entries were inspected using read-only Git metadata (branch, HEAD, cat-file commit type, status); no package source file was read directly by this reviewer. The package SHAs below also identify retained archived-source evidence read inside pipsystem.

| Package | Branch | Observed HEAD = configured pin | Dirty status |
|---|---|---|---|
| stamp | ready_cran | 95890411e8bf9db842593c2b0ab68ec4f2a66b25 | .gitignore, compound-gpid.local.md modified; .compound-gpid/ untracked |
| pipfun | PROD | 0c6a78d9884ed0965a524311537eec2a5095d60b | clean |
| pipload | PROD | ff9a81e386a09fb2531c154f63fd2b91521313c6 | .gitignore modified; existing Plan/review/.compound-gpid/.github/skills/sessionInfoLog untracked |
| wbpip | DEV | fd2c687ed527ebe33d0a7addf9859f72f71ff39f | clean |
| dlw | master | 12faa058b521ef511073a7b21b1b1dd7993c9649 | clean |
| pipaux | PROD | 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be | clean |
| pipdata | PROD | 13a38280c1eafe7e03a97837cdb57833fbe9d926 | clean |

Dirty package paths were observed, not changed or cleaned. No claim of historic dirt ownership beyond worker-reported preexisting status.

## Changes
Only this requested report created/finalized. No staging, commits, package changes, protected-record changes, source fixes or other file writes. All report writes are inside pipsystem on E: using apply_patch; no agent-started write command requiring temp/cache redirection was run.

## Checks run
Read coordination contract, project design/charter/harvest instructions; loaded R technical and clear technical communication skills.

Read-only Git checks: root rev-parse --show-toplevel, branch --show-current, rev-parse HEAD, status --short --untracked-files=normal, diff -- .gitignore, diff --cached --stat/name-only, diff --name-only, log --oneline -10. Results as reported above; .gitignore diff is the single added runtime-ignore line. Git emitted LF-to-CRLF warnings for the existing tracked dirty files; no line-ending normalization performed.

Each of seven package repositories: branch --show-current, rev-parse HEAD, cat-file -t configured SHA (all commit), status --short --untracked-files=normal. All HEADs match pins; dirt listed above.

Runtime: git check-ignore -v on final inventory.rds, sources/stamp.tar and logs/setup.log all matched .gitignore:37. git ls-files -- .tmp/one-survey/ returned empty. git ls-files --others --exclude-standard confirmed all three scoped scripts and follow-up Plan remain visible.

Retained evidence, not rerun: .tmp/one-survey/20261110T024500Z-followup-correction2/{pins.tsv:1-8,dependencies.tsv:1-54,logs/setup.log:1-27,logs/child-startup.log:1-8}. Child records show private E libraries including contained installer staging; setup log records failure, not acceptance. System clock read at 2026-11-09T21:37:54-05:00 (ET), used for final report UTC update.

## Gaps
- No runtime execution, installed namespace audit, archive-to-extracted-tree byte comparison, archive embedded-commit inspection, binary secret scan or OS-wide write tracing performed. Source selection semantics and retained text evidence do not certify those surfaces.
- Mandatory acceptance remains incomplete: usable package, current-namespace/stale-receipt controls and success/forced-child-failure restoration pair are not verified. Diagnostic and original survey stages remain unexecuted. Full review integration/final light verification belong to the parent, not this role.
- No remote fetch/main ancestry freshness or entire repository large-file/secret audit; task required preserved existing main and bounded scoped review, with no Git mutations. No commit/push authorization implied.
- Parent must retain blocked status and obtain an explicitly revised correction budget before additional functional repairs; this review does not grant that approval or change protected project records.
