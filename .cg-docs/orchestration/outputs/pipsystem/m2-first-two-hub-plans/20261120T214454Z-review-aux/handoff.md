---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261120T214454Z-review-aux
status: completed
updated: 2026-11-20T21:55:34Z
owner: cg-plan-critic
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 1
next: Planning coordinator triages these findings before proposing execution for separate approval.
---

# M2 installed auxiliary save Plan review

## Summary

Revision 1 is not ready for execution: one blocker and three significant
gaps. `Plan` below means `.cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md`.

- **[P1.1] [cg-plan-critic] Step 1 (`Plan:63–76,139–152`) — No qualified
  offline release setup.** An explicit release still calls `get_pip_releases()`
  and fetches `releases.csv`; setup also fetches `ppp_vintage.csv` through
  vintage naming, even with `create_dir = FALSE` (`pipfun/R/working_release.R:79–119`,
  `R/release_management.R:415–431`, `R/pip_create_globals.R:165–190,460–464`,
  `R/pip_create_vintage.R:103–110`). Neither setup input is in the staged
  list. `pipaux` snapshots release/alias state on load (`R/zzz.R:29–45`), and
  the POP producer cannot take a caller-supplied alias (`R/aux_pop.R:10–33,194–201`).
  **Risk:** the normal setup attempts live access, or the producers start without
  valid TEST state. **Minimal fix:** name and qualify a supported offline TEST
  setup before first `pipaux` load, or require already-staged, pinned release
  and vintage metadata at a permitted fetch-only binding. Stop if neither is
  available; no live fallback, private-state patch, or replaced alias logic.
- **[P2.1] [cg-plan-critic] Step 1 (`Plan:64–76,128`) — Pin the country
  list that the producers actually consume.** Both call `load_aux_data()`
  without a version (`pipaux/R/aux_pfw.R:151–167`, `R/aux_pop.R:156–161`);
  the reader resolves the active aux folder and alias and defaults to latest
  (`pipload/R/load_aux_data.R:10–15,24–66`, `R/pip_read-write.R:22–26,106–107`).
  Prior evidence verifies a retained country-list input, not that the fresh
  store resolves it (`m2-aux-inputs/20261119T215954Z-pfw-local/handoff.md:44–65`
  under `outputs/pipaux`). **Risk:** a verified standalone file is not read;
  an absent catalog fails, or a different country list passes the row check.
  **Minimal fix:** stage the existing pinned country-list version and its
  catalog in the private TEST aux alias; before PFW, show the unchanged
  default read resolves exactly that version and bytes. No reader patch or
  new country-list save.
- **[P2.2] [cg-plan-critic] Step 1 (`Plan:61–66,109–111,136`) — Make the
  legacy write root an explicit pre-start check.** `main_dir` controls the
  release store, not the legacy output: `pip_create_globals()` defaults its
  root to `PIP_ROOT_DIR` and unconditionally creates the legacy output when
  vintage is supplied (`pipfun/R/pip_create_globals.R:32–38,165–173`,
  `R/working_release.R:110–137`). **Risk:** a private store can coexist with
  writes to C: or a shared root before the runtime manifest is checked.
  **Minimal fix:** make the inherited E: launcher check apply before every
  build/install/run child. Set and resolve both `PIP_ROOT_DIR` and explicit
  `main_dir`, with writable temp/home/cache/lib/log roots under the fresh
  tree; refuse redirected or unresolved destinations before launch.
- **[P2.3] [cg-plan-critic] Step 2 (`Plan:83–91,128–130`) — Prove the
  retained version's bytes, not just its content hash or reader success.**
  The inspected Stamp base defaults `store_file_hash` and `verify_on_load` to
  false; legacy saves can record no file hash and historical load verification
  can warn rather than fail (`stamp/R/aaa.R:205–213`, `R/IO_core.R:448–468`,
  `R/version_store.R:540–556,575–593`). Prior experimental POP proof explicitly
  compared byte and content hashes (`outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-qualified-proof/handoff.md:57–70`).
  **Risk:** a readable result or latest-file hash is accepted without proving
  the exact bytes the survey run will reuse. **Minimal fix:** require a stored
  file checksum (enable it in the private process where needed), explicitly
  compare it to the retained bytes for the receipt ID/version, and use the real
  reader for the object assertion. In the execution handoff preserve the TEST
  root/alias, verified runtime identities, IDs, versions, and matching digests
  together; missing or mismatched proof fails before POP or survey reuse.

Otherwise R1–R3 map to Steps 1–2 and V1–V3; one functional check per artifact
is sufficient. The paired survey Plan agrees on independent Phase 1 and
serial same-store Phase 2 after usable exact PFW/POP receipts, no rebuild or
fallback, and no deflation (`2026-11-20-m2-one-survey-acquisition-preflight.md:41–44,93–108,131–135,157–173`).

## Changes

This handoff only, written first as running and then finalized. No Plan,
package, or Git changes.

## Checks run

Verified hub root, `main` and the exact HEAD above before and after review
with read-only Git. Checked the fresh handoff path and E: directory ancestry
for reparse points. Read all 159 Plan lines, `compound-gpid.md:10–40`, the
paired boundaries, and the cited evidence. Loaded all five R skills before
reading R source. The canonical Qmd was absent in the hub; the cited notebook
checkpoint (`m2-checkpoints/20261119T232046Z-sync-publish/handoff.md:31–56`)
is historical context, not current-run proof.

Read-only package identity checks and scoped comparisons: `pipaux` PROD
`43019562c0fad92038124fd6603257c8e0660997` matches planned
`5f5e8531592ca7668b33bbd23564ef90f1c8c688` in `R`, `tests`, `DESCRIPTION`,
and `NAMESPACE`; inspected `pipload` PROD
`ff9a81e386a09fb2531c154f63fd2b91521313c6`, `pipfun` PROD
`7d534516a8c17c33d537681610eccd4c29211762`, and Stamp `ready_cran`
`db1b29cd248a3a6cb737c71db176ae6bd76d2a1d` source matched scoped HEADs.
Stamp checkout source is the base, not the separately fingerprinted archive
or loaded bytes (`stamp-path-binding-fix/20261119T151908Z-tool-qualification/handoff.md:20–31,81–92`).

## Gaps

Runtime dependency/archive-to-install binding, availability of staged inputs,
an offline TEST initializer, E: runtime write containment and same-store
version binding remain unverified. No R launch, tests, install, live access,
PFW/POP saves or readback, or survey execution occurred; all are NOT RUN.
