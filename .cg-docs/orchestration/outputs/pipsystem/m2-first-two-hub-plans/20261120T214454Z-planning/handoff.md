---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261120T214454Z-planning
status: completed
updated: 2026-11-20T22:00:00Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: '.cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md (r2); .cg-docs/plans/2026-11-20-m2-one-survey-acquisition-preflight.md (r2)'
next: After separate execution approval, coordinate the installed auxiliary proof and survey Phase 1 from the hub; keep survey Phase 2 gated.
---

# M2 installed auxiliary and one-survey Plans

## Summary

Both Compound GPID Plans are saved at revision 2, validated and independently
reviewed. All nine review findings were closed in the written Plans. Both
remain hub-run: no package session/pickup, worktree or branch switch. This
task completes Plan preparation, not the runtime proof or M2.

## Changes

- [Installed auxiliary save proof](../../../../../plans/2026-11-20-m2-installed-auxiliary-save-proof.md): isolated runtime, one PFW save and exact readback, then one population save and exact readback.
- [One-survey acquisition preflight](../../../../../plans/2026-11-20-m2-one-survey-acquisition-preflight.md): Phase 1 checks the supported one-file route and readiness; Phase 2 runs one real DLW download, validation, cleaning and exact paired readback, stopping before deflation.
- This report and four independent review/closure handoffs. No package,
  Qmd, release, active-state, roadmap, design, configuration or Git changes.

## Checks run

- Read-only Git verified the hub root, `main` and HEAD above before and
  after work; E: report and Plan paths were checked for redirects and
  collisions. Verified the `pipaux` review object and scoped source match
  (review `5f5e8531592ca7668b33bbd23564ef90f1c8c688`, local `PROD`
  `43019562c0fad92038124fd6603257c8e0660997`) and exact `pipdata` pin
  `c70ae403acde648aff1a49d8d3178ca0202c6064`. The exact DLW helper only has
  test callers at that pin. The reviewer reports record further source SHAs.
- Applied Compound GPID planning, queried the local Brain (selected the
  offline one-survey Plan for isolation and exact readback), and obtained
  the completion-contract approval for saving and review only.
- The first canonical validator run caught step metadata syntax. Corrected
  it; `cg-render-artifact --automatic` exited 0 for each Plan before review
  and again on both revision 2 files. `artifact-html: false` produced no
  HTML. Only a warning about multi-line `model-advisory` in existing project
  config remained. This checks Plan structure, not runtime execution.
- [Auxiliary review](../20261120T214454Z-review-aux/handoff.md) found one
  P1 and three P2s. [Auxiliary closure](../20261120T215701Z-verify-aux/handoff.md)
  verified offline TEST setup, pinned default country-list resolution,
  pre-child E: write roots, and the retained byte checksum requirement.
- [Survey review](../20261120T214454Z-review-survey/handoff.md) found four
  P2s and one P3. [Survey closure](../20261120T215701Z-verify-survey/handoff.md)
  verified raw byte/version binding, the before-download parent gate,
  independent source welfare period, protected destinations, and pair lineage.

## Gaps

- No R launch, installs, DLW, shared access, package/test or pipeline runs.
  Offline TEST setup, actual dependency compatibility, staged pins, and
  installed auxiliary save/readback are NOT RUN.
- At the reviewed `pipdata` pin, the one-file acquire/validate helper is
  internal and the general wrapper is unbounded. A supported installed route,
  authorized DLW access and storage, and exact live catalog pins remain
  unverified; Phase 1 must stop if they cannot be established. The download,
  cleaning, clean and metadata readback and deflation are NOT RUN. No
  execution, scope extension, or Git approval is implied by this record.
