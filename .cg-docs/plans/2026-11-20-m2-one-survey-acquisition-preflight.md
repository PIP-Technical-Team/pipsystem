---
date: 2026-11-20
title: "M2: Preflight and prepare one real DLW survey"
revision: 2
status: active
scope: Standard
brainstorm: null
language: R
estimated-effort: medium
deviation-policy: autonomous
artifact-schema-version: 1
artifact-html: false
execution-report: .cg-docs/work-reports/2026-11-20-m2-one-survey-acquisition-preflight.md
phases: 2
tags: [m2, dlw, pipdata, gpwg, clean, readback]
---

# Plan: M2 preflight and prepare one real DLW survey

## Objective

Prove the approved one-survey path from exact GPWG acquisition through
validation, cleaning, save and paired readback. Phase 1 only checks readiness;
Phase 2 runs the real path only after all gates pass. Stop before deflation.

## Context

- Execute from existing `pipsystem` `main` at
  `E:/PovcalNet/01.personal/wb384996/PIP/pipsystem`. Planning HEAD:
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`. No package session or pickup.
- Prior [inventory evidence](../orchestration/outputs/pipsystem/qmd-real-data-setup/20261116T194917Z-col-geih/handoff.md#L67-L87)
  identifies `COL_2010_GEIH_V04_M_V01_A_GMD_GPWG` (`COL_2010_GEIH_INC_GPWG`),
  not a verified current filename, checksum or payload. `20260401_TEST` is a
  sandbox context, not permission to access or change the shared release.
- Clean `pipdata` archive pin: `c70ae403acde648aff1a49d8d3178ca0202c6064`.
  `.acquire_and_validate_m2_one_survey()` is internal and only test callers
  were found at this pin (`R/pipdata_get_gmd.R:1409-1487`, `NAMESPACE:59-65`).
  `pipdata_dlw_process()` takes an inventory ID, not one explicit selection
  (`R/pipdata_dlw_process.R:663-685`). Do not infer a public route from either
  fact. Retain the B6 working-tree delta outside the archive.
- [M2 umbrella](2026-10-10-m2-walking-skeleton.md#L304-L340) and
  [offline Plan](2026-11-09-installed-package-one-survey-example.md#L29-L54)
  define the validation and exact-version evidence; synthetic success is not
  live evidence. Phase 1 can overlap the [auxiliary proof](2026-11-20-m2-installed-auxiliary-save-proof.md).
  Phase 2 reuses the verified TEST store serially after auxiliary writes end.
- The [Plan review](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261120T214454Z-review-survey/handoff.md#L20-L70)
  records source evidence for the raw-version, pre-save units and paired
  readback checks; those are gates, not completed runtime evidence.

Minimal first: smallest complete one-file path, one functional check per
change, safeguards only against nearly irreversible harm; defer enhancements,
use installed tools and no new dependency, keep the Plan about two pages.

## Requirements

| ID | Requirement | Source |
|---|---|---|
| R1 | Verify supported one-file route, exact source pin, safe runtime and DLW access | M2 umbrella lines 304–314; alignment Step 2 |
| R2 | One real `dlw` acquisition and GPWG validation, no fixture substitute | Approved preview; `pipdata/R/pipdata_get_gmd.R:503-565` |
| R3 | Apply pinned PFW and recodes, validate clean data before any save | Design lines 160, 207–215; umbrella lines 316–326 |
| R4 | Verified paired clean survey/metadata versions and private, redacted evidence | Approved preview; `pipdata/R/pd_metadata_refresh.R:120-140` |

## Phase 1: Establish one-file readiness

### 1. Confirm the acquisition contract before downloading data
- **Requirements**: R1
- **Files**: fresh ignored `.tmp/m2-survey/<run-id>/`
  for manifest, download, logs, temp and any private library; lifecycle report.
- **Details**: Verify hub and registered package SHAs. Trace public installed
  `dlw` and `pipdata` calls for explicit one-file selection, local inventory
  handoff, validation, cleaning and both saves. A public `dlw` call alone is
  not proof of a supported `pipdata` handoff. Document exact calls and store
  writes; prove the selection is bounded before contacting the service. Check
  deployed library and startup behavior (release setup may create folders);
  redirect all temporary, raw, library, legacy output, inventory and log writes
  to resolved E: paths. Verify that the raw/clean destinations and any
  payload-bearing diagnostics are approved and access-restricted; E: and
  Git ignore alone do not qualify them. With authorized DLW metadata access,
  require exactly one matching current catalog row, exact filename, master
  and harmonization versions, and a verifiable checksum. Do not fetch the
  payload in this phase or change a local/shared default alias.
- **Tests**: Record route, pins, checksum method, approved DLW access and
  resolved runtime paths in the readiness record. An internal-only route or
  unbounded selection is BLOCKED: record the smallest missing supported seam
  for a separate package-owned Plan, not a private Qmd call or package change.

## Phase 2: Run one real download through clean readback

### 2. Download the pinned file and validate GPWG
- **Requirements**: R2
- **Files**: isolated raw path, acquisition and
  validation inventory plus sanitized check log.
- **Details**: Before download, confirm that Plan A passed and its writer
  exited. Verify the same private store and aliases and the selected route's
  required measure list, exact resolved versions and hashes against receipts.
  Resolve retained inputs as needed; the default clean path may require
  GDP/PCE in addition to CPI/PPP/PFW/POP. No rebuild or fallback for missing
  inputs. Download only the selected harmonized file through `dlw` and
  verify its bytes using the pinned checksum contract. Record one receipt
  linking those bytes to the exact local raw version/hash GPWG validation
  reads and the same raw version/hash that cleaning will read. A copied
  catalog checksum or latest-version lookup alone cannot prove that link.
- **Tests**: Require one actual download, the binding above and one valid,
  available matching inventory row. Wrong/missing/invalid data or an
  unprovable read gives FAIL and no eligible input to cleaning.

### 3. Clean, validate, save and read back the pair
- **Requirements**: R3, R4
- **Files**: verified auxiliary TEST store, clean and metadata artifacts,
  and paired save/readback receipts.
- **Details**: Use the installed `pipdata` clean path and pinned recodes.
  Independently confirm the pinned survey's source welfare period from
  authoritative metadata or documentation; stop if unknown or unsupported
  by the formatter. Derive expected daily welfare from that period, not by
  copying the implementation's divisor. Compare row-aligned welfare and
  unchanged weights on approved keys before either save; no row repair or
  imputation (`R/pd_process_data.R:264-306`, `R/pd_dlw_clean.R:183-209,621-672`).
  Save clean data and matching metadata through normal versioned calls.
- **Tests**: Read both exact saved versions. Compare each loaded object's
  hash with its receipt and verify metadata lineage links to the exact clean
  version/hash through supported evidence. Invalid clean input cannot yield a
  successful save; a partial pair is not reusable. A save or readback failure
  is FAIL; dependent work NOT RUN.

## Testing Strategy

One bounded live positive path, with explicit eligibility/no-save checks and
previous synthetic controls left intact. Never damage or edit the real input
to create a negative case. Record exact source and runtime identities, paths,
expected outcomes and native exits. A source trace is not a live test.

## Documentation Checklist

Keep public calls, stage status and evidence links in the manual part of
`experiments/pip-pipeline.qmd`, with no household rows or credentials.
Preserve existing synthetic assertions and default offline rendering. If the
notebook is absent or overlap is unresolved, use the tracked checkpoint as
context and record the gap; no implicit stash restore or competing edit.

## Risks & Mitigations

Batch download → require explicit one-file route before contacting DLW.
Private-data or shared writes → contained runtime and aggregate-only evidence.
Mismatched metadata → exact paired readback before reporting success.

## Out of Scope

Package API implementation, package checkout/Git changes, general inventory
processing, shared-store repair, B6, changing release metadata, PPP vintage
selection, deflation and mean. Later: deflation binds verified versions.

## Completion Contract

### Outcome
One real, explicitly pinned GPWG file is downloaded and validated; its
clean survey and matching metadata are saved and retrievable by exact version.

### Verification Surface
| ID | Phase | Evidence Required | Command/Artifact | Required |
|---|---|---|---|---|
| V1 | 1 | Supported one-file path, approved read access, source pin and approved access-restricted E: data paths | Readiness record | yes |
| V2 | 2 | Verified store/parent pins before download; pinned bytes linked to raw version/hash read by validation and cleaning | Acquisition/validation/clean-input receipt | yes |
| V3 | 2 | Source welfare period and clean gate verified before save; both hashes verified on readback and metadata linked to the exact clean version/hash | Paired receipts and numerical/lineage checks | yes |

### Constraints
| ID | Constraint | Check |
|---|---|---|
| C1 | Run from hub on existing `main`; no pickup, package/Git mutations | Checkout, branch, SHAs and scoped diff |
| C2 | Writes only to E:; no household data in Git or reports; source read only as approved | Path manifest and sanitized evidence |
| C3 | No mocked payload, missing validation, stale fallback or shared writes | Real data path and receipt/eligibility assertions |

### Boundaries
- Plan approval does not grant DLW access or execution authority. On separate
  authorization, run only the requested development phases from the hub.
- No concurrent writes to the auxiliary store: Phase 1 is independent;
  Phase 2 is serial with that store and waits for its required exact inputs.

### Iteration Policy
1. Record readiness, then advance when all phase gates and authorized access
   are in place; no routine confirmation between passed authorized phases.
2. Under `autonomous`, fix reversible in-scope harness issues and rerun their
   checks. Report unresolved/broader changes rather than weaken acceptance.

### Blocked-Stop Conditions
- Unsupported/unbounded route, denied DLW access, unverifiable pin/checksum,
  unapproved data destination or any runtime write path outside E:.
- Missing verified parents, unknown/incompatible welfare period, invalid
  payload, unverified raw binding, failed save or readback. Keep blocked
  evidence visible; dependent checks NOT RUN.

## Gaps

Public bounded route at these pins, authorized DLW access and storage,
actual filename/checksum and source welfare period, exact auxiliary store
bindings, and real survey results remain unverified by planning.
