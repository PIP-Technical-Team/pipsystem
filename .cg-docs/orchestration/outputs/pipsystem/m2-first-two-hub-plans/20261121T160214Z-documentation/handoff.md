---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-documentation
status: completed
updated: 2026-11-21T16:04:56Z
owner: cg-documentation
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md r4
next: Coordinator integrates the documentation findings in full-review triage; no proof rerun is requested.
---

# Auxiliary save proof — operator documentation review

## Summary
No P0 or P1 documentation findings. One P2 recipe gap and one P3 acceptance
cross-reference to confirm. The saved handoff identifies the reported V1–V3
results; this review did not independently execute or certify them.

## Findings

**P2 [safe_auto]** `.cg-docs/orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T153507Z-stamp/handoff.md:77–96,114–123` — Missing operator recipe and misleading stage name.

**Issue:** The handoff gives the success artifacts but not the successful
launcher stage, its prerequisites, or the distinction between inspecting
retained evidence and making a fresh authorized run. `run.py:613–633,648–656`
maps the historically successful `proof-live` stage to `proof("test")`; it
selects `store-test`, not a live service. Treating the retained run as a
reusable work area conflicts with r4:69–73 and the launcher's existing-log
and store guards (`run.py:302–306`; `aux-proof.R:25–31`).

**Fix:** Add one paragraph to the existing handoff, not a new runbook. Name the
successful offline stage, TEST release `20260401` and PPP `2021`, and point to
the standard-only `r-clean` mirror, private `ok` library, pinned archive and
dependency manifests, and `stage-aux` (which also installs from verified
archives). Say that the retained root is evidence only and that any separately
authorized repeat needs a fresh E: root. Cite the existing `aux-proof-test`
stdout and result receipt as the acceptance check. `run.py:399–411,434–471,494–521,529–563,613–633,648–656`;
`aux-proof.R:124–135`. This is a documentation correction; no rename or rerun.

**P3 [manual]** `.cg-docs/orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T153507Z-stamp/handoff.md:29–33,112–123` — Canonical acceptance link not evidenced in this handoff.

**Issue:** The worker explicitly did not edit the Qmd or Plan execution report.
The record provides the receipt table but does not show the acceptance link
called for by r4:13,100–102,121–127. Whether another worker already linked it
is outside this review's scope; the notebook is not a runtime gate.

**Fix:** At closeout, the coordinator checks for that reference and, only if
missing, links the existing V1–V3 proof from the Qmd manual acceptance section
or uses the reviewed checkpoint if the notebook is absent. Reference the same
evidence from the Plan execution report; do not restore a stash or regenerate
outputs.

## Changes
Only this review handoff, written first as running. No source, Plan, stamp
handoff, Git or store changes.

## Checks run
Read-only Git confirmed the checkout, branch and full HEAD at start and
before finalizing. The exact report and its run directory were absent at
start; their paths resolve on E: without reparse points. Loaded shared,
technical, data.table, collapse and testing skills before reading R. Compared
the complete `run.py`, `aux-proof.R` and stamp handoff with r4.

- **Exact pins:** The handoff distinguishes checkout and archive identity and
  points to exact R, dependency, input and source evidence (stamp handoff:39–56,
  68–85; `run.py:29–52,354–385,529–631`). It distinguishes the historical
  country-list source ID from the new TEST pin and input SHA-256 from stored
  SipHash-13 and object hash (stamp handoff:101–110; `aux-proof.R:181–219`).
- **Mock boundary and known limits:** The reported substitutions match the
  two process-local fetch bindings, five staged locators and fail-closed
  lookup in `aux-proof.R:96–135`. Real initialization, writers and readers
  remain in use (`aux-proof.R:131–158,195–239`). The claim applies to these
  bindings, not general network isolation. Windows shutdown diagnosis is
  limited to the tested host and path receipts are not an OS-wide write trace
  (stamp handoff:63–68,87–91,125–132).
- **Success evidence:** The handoff identifies `log/aux-proof-test.out:6–31`,
  `log/aux-proof-test.result.json:1–10` and the exact same-store receipt table
  (stamp handoff:95–110). Source shows exact retained/current checks and serial
  V1 → V2 → V3 gates (`aux-proof.R:168–241`). The handoff reports exit 0 and
  no remaining owned child (stamp handoff:20–25); these are reported facts,
  not an independent replay or receipt inspection by this reviewer.

## Gaps
Static review only. No Python or R execution, raw log or receipt inspection,
payload or credential access, or store writes. Qmd/Plan execution-report
linkage not verified outside the three-file review scope. No claim of live,
shared-store, downstream survey or cross-machine acceptance.
