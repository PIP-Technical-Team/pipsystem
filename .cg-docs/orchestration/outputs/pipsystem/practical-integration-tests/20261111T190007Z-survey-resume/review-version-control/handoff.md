---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261111T190007Z-survey-resume/review-version-control
status: completed
updated: 2026-11-11T19:07:02Z
owner: version-control reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md
next: Coordinator integrates this static result with fresh worker runtime evidence and required final verification.
---

# Phase 2 version-control review

## Summary
No issues found: no supported P0-P3 finding in the requested static Git scope, ignore configuration or exact-archive provenance approach. No safe_auto or manual correction is proposed. This completes only this review role, not Phase 2 acceptance. Runtime execution remains with the concurrent implementation worker.

## Changes
Only this reviewer-owned report created. No source changes or Git mutations authorized or performed.

## Checks run
- Read project rules and coordination contract; loaded technical communication and R technical/analytical skills.
- Read-only Git baseline: existing main, HEAD e9c71e3190f1ce88a017ae25af7c373a64c655a2. Existing unrelated dirty reports and active-state file retained.
- Inspected the original revision-1 Plan, full earlier Work Report, current four requested scripts and .gitignore. The setup.R delta replaces only pipload and pipdata SHAs with the two authorized values; the other five pins match HEAD.
- Index was empty. All six experiment scripts are tracked; no .tmp files are tracked. git check-ignore -v confirms runtime archive/library/log/store paths are ignored by .gitignore:36; requested Plan, Work Report and setup.R are not ignored.
- git diff --check passed with line-ending notices only. Recent ten commits follow type(scope): description conventions. Work on existing main is explicitly requested, not a branch-policy finding.
- Exact-source provenance: setup.R:9-22 embeds full SHAs; :109-119 exports each selected commit with git archive and extracts into a fresh sources directory. Dirty working-tree files are not the installation input. :120-128 records ambient HEAD/status separately without relabeling them as the archive revision. :93-103,181-191 records installation exit, archive digest and installed receipt; :193-230 checks inventory, receipts and actual namespace paths. This is sufficient bounded local provenance, not a signed or tamper-resistant supply-chain attestation.
- Dependency provenance: setup.R:25-30,148-180 records existing installed dependency origins, versions and DESCRIPTION digests. These are copied third-party installations, not falsely represented as exact ecosystem Git revisions. No renv environment is introduced: adding renv.lock or a new dependency-management framework is not required for this bounded seven-SHA example.
- Isolation source inspection: run.ps1:12-18 checks output trees and prevents attempt overlays; :38-60 redirects environment/cache/library roots before R startup; :103-108 restores caller settings. paths.ps1:7-30 rejects redirected ancestors/descendants and hard-linked files. checks.ps1:30-121 defines baseline, path rejection and restoration functional controls. These are static observations, not newly executed test results.
- Read the earlier Work Report in full. Its historical blocked runs remain labeled as history; :131-134 records only the two new authorized pins and explicitly leaves new-combination evidence pending. No partial runtime was promoted to final acceptance.
- git ls-tree -r -l HEAD shows six small text experiment scripts, largest 14,454 bytes; no tracked experiment binary or >1 MB experiment file. Current experiment delta remains exactly two additions/two deletions in setup.R. HEAD unchanged at final check; no index changes observed.
- Direct inspection of the four requested scripts found no hardcoded credentials or connection strings. The supplemental pattern search returned 'No files found', so it is not counted as a successful secret scan.

## Gaps
- Runtime scripts were not executed, package repositories were not read, and no packages were downloaded or changed. No package HEAD is asserted beyond the literal pinned SHAs in setup.R. No numerical acceptance claim is made.
- Final snapshot: main e9c71e3190f1ce88a017ae25af7c373a64c655a2, setup.R delta containing only the authorized pipload/pipdata substitutions, inspected through 2026-11-11T19:07:02Z. Concurrent later changes and final runtime receipts require coordinator review.
- Global repository secret/history/large-file audit, remote freshness, full dependency-content identity, OS-level write auditing and archive reproducibility across Git/toolchain versions were not certified. No new safeguard or framework is recommended for those deferred concerns.
- Existing unrelated dirty reports, monitor outputs and active-state changes remain untouched. No protected records were deleted, moved, renamed or recommended for removal. Required full-review integration and final verification remain outside this role's completion.
