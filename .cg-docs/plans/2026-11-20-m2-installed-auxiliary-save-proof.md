---
date: 2026-11-20
title: "M2: Prove installed PFW and population saves"
revision: 4
status: completed
completed-date: 2026-11-21
scope: Lightweight
brainstorm: null
language: R
estimated-effort: small
deviation-policy: autonomous
artifact-schema-version: 1
artifact-html: false
execution-report: .cg-docs/work-reports/2026-11-20-m2-installed-auxiliary-save-proof.md
tags: [m2, pipaux, stamp, installed, readback]
---

# Plan: M2 installed auxiliary save proof

## Objective

Verify one installed PFW save and then one population save in a local TEST
store. Read each exact new version back and verify its checksum and Colombia
2010 GEIH income coverage. Plan approval is not execution approval.

## Context

- Run from the existing `pipsystem` `main` checkout at
  `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`. Planning HEAD:
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`. No package session or pickup.
- Build `pipaux` from an archive of `5f5e8531592ca7668b33bbd23564ef90f1c8c688`,
  not the working tree. Local `PROD` `43019562c0fad92038124fd6603257c8e0660997`
  has matching R, tests, DESCRIPTION and NAMESPACE; its extra local config
  and untracked scratch stay untouched ([alignment](../orchestration/outputs/pipsystem/whole-project-sequence/20261120T212419Z-m2-alignment/handoff.md#L43-L71)).
- `pipaux` source at that scope reads PFW and POP via `pipfun::load_from_gh()`;
  installed producers and save are distinct from input fetch
  (`R/aux_pfw.R:178-234`, `R/aux_pop.R:49-110,172-201`, `R/utils.R:462-553`).
  The [joint check](../orchestration/outputs/pipsystem/m2-aux-inputs/20261119T215954Z-local-boundary/handoff.md#L43-L89)
  gives staged source pins, country-list evidence, and experimental limits.
  Its PFW/POP artifacts are not acceptable substitutes for new saves.
- Reuse the [offline Plan's](2026-11-09-installed-package-one-survey-example.md#L29-L54)
  isolated install pattern, not its runtime or pass status. Candidate Stamp
  0.1.1 archive SHA-256 is `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586`
  ([qualification record](../orchestration/outputs/pipsystem/stamp-path-binding-fix/20261119T151908Z-tool-qualification/handoff.md#L81-L92));
  compatible loaded `pipload`/`pipfun` versions and dependencies remain UNKNOWN.
- Startup, alias and byte-check behavior are source observations with full
  package SHAs in the [Plan review](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261120T214454Z-review-aux/handoff.md#L23-L73),
  not proof about the eventual loaded runtime.
- Revision 3 authorizes one new country-list version only in the isolated
  TEST store. The [staging record](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T041012Z-inputs/handoff.md#L57-L138)
  pins both metadata CSVs and the detached country-list bytes. It does not
  establish an eligible catalog for the original version `30d540ca6e32d842`.

Minimal first: one complete slice and functional check per output; add
safeguards only for nearly irreversible harm, defer other ideas, use installed
tools, no new dependency, and keep this Plan about two pages.

## Requirements

| ID | Requirement | Source |
|---|---|---|
| R1 | Pinned installed runtime, staging identities and isolated E: TEST paths | Alignment; charter lines 24–33 |
| R2 | Normal PFW save, checksum and exact readback of one included national mapping | Approved preview; joint check lines 115–120 |
| R3 | After PFW passes, normal population save and exact readback of positive national key | Approved preview; joint check lines 121–126 |

## Implementation Steps

### 1. Qualify the contained runtime and inputs
- **Requirements**: R1
- **Files**: fresh ignored `.tmp/m2-aux-save/<run-id>/`
  for launcher, sources, library, TEST store and manifest; never reuse it.
- **Details**: Before each build/install/run child, verify the checkout,
  archive and resolved E: values for both `PIP_ROOT_DIR` and `main_dir`,
  the legacy output, startup, temp, home, caches, library and logs. Record
  R and dependency SHAs or archive hashes and installed origins. Before
  `pipaux` loads, qualify a supported offline TEST setup. If normal setup
  needs `releases.csv` and `ppp_vintage.csv`, use already-staged pinned bytes
  through the permitted fetch-only binding, or stop; no live fallback or
  private release-state edits. Verify the staged `pfw.dta`, `pop.xlsx` and
  `spop.csv` paths and hashes. Verify the detached country-list bytes and
  decoded object against their source pins. Enable stored file checksums
  in the private runtime before any save and keep them on. Register once
  through the normal installed `pipload::pip_write()` in the actual private
  TEST aux alias. Record the original ID only as source provenance and the
  Stamp-assigned ID as the TEST pin. Do not edit or import a catalog entry
  to reproduce the original ID. Reuse retained
  CPI/PPP if required for setup, without regeneration. Disclose staged input
  substitution at source fetch only; no substituted transformation,
  validators, aliases, writer, receipt or reader.
- **Tests**: Before production of either artifact, compare source/input
  hashes and namespace paths and verify empty target IDs in the private store.
  For the country list, verify that the actual TEST aux catalog marks the
  receipt version current and that both current file and retained snapshot
  match its stored checksum. Check the unchanged default and exact-version
  reads against the pinned object hash. Do not require the reserialized file
  to match the source SHA-256. Stop on a mismatched pin, missing input or
  unsafe hook.

### 2. Save PFW, then population, and read both back
- **Requirements**: R2, R3
- **Files**: runtime evidence from Step 1 and the
  Plan's execution report. Follow the installed `pipaux` producer path;
  use `pipload`/Stamp supported versioned reads, not direct file shortcuts.
- **Details**: Require a new version, not a skipped write. Compare the
  retained bytes for that receipt's artifact/version with its stored file
  checksum and separately use the real exact-version reader. PFW: exactly
  one included, non-alternative COL 2010 GEIH income row with national
  CPI/PPP/POP domains. Population: one finite, positive COL/2010/national
  row. Run population only after the PFW result passes. Keep the store and
  record root, alias, runtime pins, artifact IDs, exact versions and both
  byte and content hashes for the
  [survey Plan](2026-11-20-m2-one-survey-acquisition-preflight.md).
- **Tests**: One functional save/readback per artifact. Report the first
  failing package call with its actual condition, and dependent work NOT RUN.

## Testing Strategy

Use the installed R tool and focused manifest and receipt checks, not batch
release execution. No fixture/transport substitution earns an installed-save
pass unless real package functions wrote and read the actual new version.

## Documentation Checklist

Link actual PASS/FAIL/NOT RUN evidence from the manual local acceptance section
of `experiments/pip-pipeline.qmd`; use the [reviewed notebook checkpoint](../orchestration/outputs/pipsystem/m2-checkpoints/20261119T232046Z-sync-publish/handoff.md#L31-L56)
as evidence if the file is absent. Do not restore a stash, overwrite an
overlapping file, or treat notebook availability as a proof condition. Preserve
existing assertions and output only identifiers and checks, never data payloads.

## Risks & Mitigations

Unpinned runtime → verify loaded sources before checks. Private/shared or C:
write → verify resolved paths and startup side effects first. False proof →
require actual save receipt, versioned checksum and exact readback.

## Out of Scope

Shared-store repair, Git or package changes, B6, live auxiliary re-fetch,
DLW, PPP vintage selection, deflation and mean. Later: production branch
protection, historical recovery and broader package-suite verification.

## Completion Contract

### Outcome
Two installed saves in one isolated TEST store, with exact-version receipts
and proven PFW and population coverage for the selected survey.

### Verification Surface
| ID | Evidence Required | Command/Artifact | Required |
|---|---|---|---|
| V1 | Installed runtime, offline TEST setup, source pins and E: write roots; country-list receipt is current in actual TEST aux catalog, both files match stored checksum, and default and exact reads match pinned object hash | Runtime/input manifest and country-list receipt | yes |
| V2 | New PFW version, checksum, exact readback, included national mapping | PFW receipt and assertion log | yes |
| V3 | After V2, new population version, checksum, exact readback, positive national key | POP receipt and assertion log | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | Existing hub checkout; no pickup, Git mutations or package edits | Before/after root, ref, SHA and scoped status |
| C2 | All writes E:; no production/shared access or data disclosure | Runtime manifest and redacted evidence |
| C3 | Normal installed producer, writer and versioned reader | Recorded public path and any fetch-only substitution |

### Boundaries
- The user authorized the bounded runtime check and one country-list
  registration using verified bytes in its private TEST store. The original
  shared artifact and catalog stay untouched.
- No Git, package checkout or protected-file changes; do not broaden the test.

### Iteration Policy
1. Run the smallest check; fix reversible in-scope harness issues and rerun
   affected verification, once in a fresh run root if a partial save exists.
2. Record deviations under `autonomous`; stop for a protected, Git, near-
   irreversible or out-of-scope decision. Preserve failed attempts.

### Blocked-Stop Conditions
- Unsafe/unverified paths, archives, input pins, offline TEST setup or supported
  calls; no fallback to a shared store, ambient library or live metadata fetch.
- No usable version/checksum or exact readback, wrong mapping, or missing
  durable evidence. Do not mark a source-only check PASS for a runtime boundary.

## Gaps

The [execution report](../work-reports/2026-11-20-m2-installed-auxiliary-save-proof.md#run-3-2026-11-21t153507z)
records the bounded private TEST pass. Historical country-list recovery,
cross-machine reuse, shared storage, and real survey execution are not
proven by this Plan.
