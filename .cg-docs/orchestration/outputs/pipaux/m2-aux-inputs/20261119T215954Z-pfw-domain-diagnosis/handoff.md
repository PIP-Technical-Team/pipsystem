---
schema: pip-handoff-v2
project: pipaux
task: m2-aux-inputs
run: 20261119T215954Z-pfw-domain-diagnosis
status: completed
updated: 2026-11-19T22:16:23Z
owner: PFW domain diagnosis
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipaux
branch: PROD
head: 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be
plan: NONE
next: The diagnostic is complete; any later correction belongs to the pipaux PFW contract owner and needs separate scope.
---

# PFW post-join region-code diagnosis

## Summary

The `pipaux` PFW cleaner replaces `region_code` from the country list, but its
output validator expects a different code set (`pipaux/R/aux_pfw.R:151-167,484-486`).
All 2,434 of 2,542 joined PFW rows rejected by the PFW rule pass the pinned
country-list rule. The failure belongs to the **pipaux PFW join/output-validation
contract**, not to invalid country-list codes (`pipaux/R/aux_country_list.R:86-106,209-212`).

| Rejected code | PFW rows | Distinct countries |
|---|---:|---:|
| EAS | 238 | 25 |
| ECS | 1,260 | 49 |
| LCN | 511 | 27 |
| MEA | 142 | 17 |
| SAS | 42 | 6 |
| SSF | 241 | 46 |

The Colombia 2010 GEIH income selector found **one included non-alternative
mapping**, and its joined `LCN` is rejected ([log](diagnose.log), lines 4-16).

## Changes

`diagnose.R`, `run.ps1`, `diagnose.log`, and this handoff in the new run folder;
isolated runtime in `.tmp/m2pfd`. No changes to packages, prior run, or inputs.

## Checks run

- Existing `paths.ps1` checks passed for the fresh exact destinations and local
  inputs. Hub main `1821c5526337d03b87a9e61ad934b3c7316c16cf`, pipaux PROD above,
  and the empty scoped pipaux diff were checked before and after. `pipsys` also
  confirmed the exact E: destinations and package registration in the child.
- One qualified R 4.5.2 child (same libraries and fingerprinted Stamp as the
  producer proof) exited 0. The staged PFW blob `83bc9738cd45ad7e60bc14f5ca837b0075f052b1`,
  both input SHA256s, and the country-list object hash `9211182e995b116f` for
  pin `30d540ca6e32d842` matched. Both pipaux source files matched their pins.
- The child reused `aux_pfw_clean` with only its country-list read redirected
  to the verified local input and applied the two exact source predicates.
  Every joined `region_code` matched the staged country-list value for its
  country. Only code labels and counts were logged (`diagnose.log:1-17`).
- Previous producer handoff SHA256 stayed unchanged; no store or candidate
  exists. No network, package edits, producer rerun, save, or pipeline run.

## Gaps

- No region-code mapping or allowlist was selected or changed. The producer
  is still blocked; GPWG module selection and release acceptance were not tested.
