---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-testing
status: completed
updated: 2026-11-21T16:05:50Z
owner: cg-testing
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 4
next: Coordinator integrates this result with the remaining review routes before accepting the auxiliary evidence.
---

# Auxiliary installed-save testing review

## Summary

No P0–P2 findings on the testing route. Two P3 advisories apply only if the harness is reused. The retained proof supports Plan r4 V1 → V2 → V3 in one private TEST store and exit 0 with no owned process left. The advisories do not invalidate that evidence.

### Findings

1. **P3 — advisory** `.tmp/m2-aux-save/20261121T153507Z-diagnosis/run.py:629–633` / `log/aux-proof-test.result.json:2–7`: The launcher returns success on process exit 0 without checking whether the R proof reached the three PASS markers. The current handoff correctly cites both artifacts, and the markers are present (`log/aux-proof-test.out:15,22,31`). **Minimal fix if automated later:** require those existing exact markers once each and in order, in addition to the exit, timeout and cleanup checks. Until then, interpret the JSON as process evidence only.
2. **P3 — advisory** `.tmp/m2-aux-save/20261121T153507Z-diagnosis/aux-proof.R:79–83` / `run.py:625–631`: Distinct proof labels and stores still write loaded-origin manifests to the same run-root names. A later attempt that reaches either manifest can overwrite that part of an earlier attempt's provenance. **Minimal fix if reused:** scope the two TSVs to the already-separated attempt/store directory. The handoff places the successful attempt last and identifies the prior failures as origin-check stops (`20261121T153507Z-stamp/handoff.md:79–96`); no impact on this pass was established.

## Changes

This handoff only. No implementation, Plan, store or Git changes.

## Checks run

- Loaded five R skills before inspecting R source. The exact handoff and its run directory were absent at creation; the E: ancestry was checked again before finalization.
- Compared Plan r4:67–113,147–159 with `run.py`, `aux-proof.R`, the proof stdout, process receipt and Stamp handoff. Paths hereafter in this section are relative to `.tmp/m2-aux-save/20261121T153507Z-diagnosis/`.
- Diagnostic controls: `run.py:486–491` holds the mirror Rterm invocation fixed and adds one scalar at a time. `log/scalar-processor-architecture.result.json:2–9` shows exit 0 without a timeout; `log/scalar-{os,pathext,number-of-processors}.result.json:2–5` show timeouts. The separate normal-install and installed-load receipts also show exit 0 and no remaining children (`log/recovery-stamp-{normal,loaded}.result.json:2–9`). This supports sufficiency in the tested control, not an explanation of the native mechanism.
- V1: real TEST setup precedes pipaux load, with the only substitutions at the two pipfun fetch bindings (`aux-proof.R:96–166`). Checksums are enabled before registration; the new catalog/current/snapshot binding uses independently computed file SipHash values against the stored version checksum, and default/exact readbacks use the independent detached source object hash (`aux-proof.R:168–220`; `log/aux-proof-test.out:9–15`).
- V2/V3: the required PFW inclusion and national domains and POP uniqueness, finiteness and positivity are fixed predicates from the Plan, not outputs reused as expected values. Both consume actual exact-version reads with receipt/byte checks. The PFW assertions precede the POP call (`aux-proof.R:222–241`; `log/aux-proof-test.out:16–31`). `log/aux-proof-test.result.json:2–9` records exit 0, no timeout and zero owned processes remaining. `aux-proof.R:244–248` records the error class/message and quits nonzero on caught failure.

## Gaps

- Static review of source and retained redacted evidence only: no payload access, hash recomputation, test execution or Git operation. The branch and HEAD are as assigned and corroborated by the Stamp handoff:39–49, not independently queried here.
- The child process receipt is not an OS-wide write trace. This review does not establish live-source or downstream survey acceptance.
