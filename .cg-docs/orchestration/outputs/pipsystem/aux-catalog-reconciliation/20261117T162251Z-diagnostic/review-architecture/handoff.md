---
schema: pip-handoff-v2
project: pipsystem
task: aux-catalog-reconciliation
run: 20261117T162251Z-diagnostic/review-architecture
status: completed
updated: 2026-11-17T16:41:35Z
owner: architecture-review
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md revision2
next: Coordinator integrates this review with other required reviews and performs final light verification; shared processing remains blocked separately.
---

# Scoped architecture review

## Summary
No supported P0, P1, P2 or P3 architecture issues found in the scoped new
diagnostic scripts and evidence. No fixes, suppressions or deferred findings.
Branch and HEAD are brief-supplied provenance (review-brief.md:3-4), not
independently queried. This is static review, not independently executed tests
or overall Plan acceptance.

### Architecture evidence
All short file references below are under the parent diagnostic run directory,
unless another project-relative path is specified.

- **Public diagnostic, not another runtime/planner:** create.R:3-21 defines one
  fresh synthetic local artifact and calls public stamp initialization/save
  APIs. verify.R:27-69 delegates alias resolution, catalog/version access,
  exact loading, sidecar access, object hashing and latest selection to stamp.
  It asserts expected outcomes; it neither implements currentness selection
  nor dispatches PIP stages. run.ps1:108-131 dispatches only bounded diagnostic
  and dossier stages and blocks nonzero required results. This preserves
  SYSTEM_DESIGN.md:186,192,290-309 package ownership and single rebuild authority.
- **Small separated responsibilities:** run.ps1 owns process/runtime setup;
  provenance.R:1-80 checks existing receipts and namespace paths;
  create.R:1-38 owns synthetic creation; verify.R:1-74 owns independently
  defined expected payloads and assertions; check-dossier.R:1-23 checks saved
  document distinctions. None exceeds 300 lines; no new dependency framework,
  API adapter, package implementation or duplicate package test suite is added.
  The same verifier is reused in-process and in the fresh reader without
  duplicating behavior (create.R:38; verify.R:2-4,23-25).
- **Runtime copy is an execution fixture, not patched package behavior:**
  run.ps1:38-62 copies the existing R home, adapts exactly the copied audit
  library expectation, compares the original profile hash and executable hash,
  and leaves contributed packages in the original library. Environment roots
  are explicit E:-checkout paths (run.ps1:6-14,72-99). provenance.R:11-19,53-69
  rejects different roots and namespace origins. preparation.json:2-9,
  child-startup.log:1-4 and both namespace TSVs:2-13 support the stated fixture
  boundary. No namespace replacement or internal stamp/catalog mutation appears
  in reviewed scripts. Namespace path introspection is provenance inspection,
  not a substitute implementation of a stamp operation.
- **Independent exact readback remains distinct from source inference:**
  verify.R:15-16,35-69 checks both returned versions, independently defined
  exact inputs, sidecar content hashes and timestamp/ID latest semantics.
  save-trace-1.tsv:2-3 records the pointer advancing twice; first/second version
  TSVs:2-3 agree on both IDs with distinct timestamps. first-1.log:13-31 and
  second-1.log:4-29 retain the assertion results and distinct creator/reader PIDs
  (first-1.log:2; second-1.log:2). Red is a missing-receipt verifier failure,
  not reproduction of the shared fault (verify.R:5-9; red-1.log:4-12).
- **No recovery or version-authority escalation:** decision-dossier.md:67-103
  separates selected missing IDs, different physical candidates and
  UNKNOWN authority. Its routes at :104-119 distinguish recovering intended
  snapshots from selecting other versions; neither is an execution recipe.
  :121-154 expressly rejects treating st_rebuild/st_restore/latest semantics
  as a proven safe repair. :195-199 limits local PASS to the synthetic
  RDS/two-save/infinite-retention path. No candidate promotion, fallback,
  retention policy for the shared store or alternate release authority is
  implemented. This matches Plan revision2:81-96,114-158.

## Changes
Only this assigned review handoff created and finalized. No source edits,
package changes, protected-document changes or Git mutations. No commits.

## Checks run
Static inspection completed for the five scoped scripts, preparation.json,
child-startup.log, red-1/first-1/second-1/dossier-1 logs, first/second namespace
and version TSVs, save-trace-1.tsv, decision-dossier.md, Plan revision2 and
the work report. Read project design/charter/harvest constraints and contract.
Loaded required existing R shared, technical, data.table, collapse and testing
skills before R review.

Saved execution evidence inspected, not rerun: first/second logs retain all
local public assertions PASS; dossier-1.log:1-7 records six rows and separated
routes. Informational options-update stderr is not a package failure
(first-1.log:4-12; second-1.log:8-16). Exit-zero status is reported by the
coordinator in the work report:55-63, not independently measured here.

No shell, R, tests, network, shared-storage access, installation or package
repository/source inspection performed. No new package-source SHA is required;
inherited diagnostic stamp provenance is
95890411e8bf9db842593c2b0ab68ec4f2a66b25 (provenance.R:23-38).
Independent tests and editor diagnostics: NOT RUN in this static review.

## Gaps
- Original copied-runtime contents, installation records and path resolution
  were not independently rehashed or executed; this review inspects the checks
  and retained evidence, not a second runtime certification.
- No fresh package-source review or shared observation; dossier source claims
  remain inherited. Historical cause, intended authoritative auxiliary versions,
  backup provenance and supported history-preserving recovery remain UNKNOWN.
- Synthetic RDS/infinite-retention success does not establish QS2 auxiliary
  acceptance, historical failure/retention/concurrency behavior or real-survey
  readiness. No shared repair or version choice is authorized by this review.
- Overall route-aware review integration and light verification remain the
  coordinator's stage (work report:18,26,69-73 at inspection cutoff). This
  architecture result supplies no new blocker and does not close that stage.
- Minimal first observed: no speculative framework or additional safeguard
  recommended. Broader hardening is outside this review, not an implicit task.
