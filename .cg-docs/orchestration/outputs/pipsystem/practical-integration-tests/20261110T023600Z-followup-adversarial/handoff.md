---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-adversarial
status: completed
updated: 2026-11-10T02:39:37Z
owner: cg-adversarial
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator consolidates review; implementation remains blocked at step 1 with its correction budget exhausted.
---

# Follow-up adversarial review

## Summary
FULL adversarial review of run.ps1, setup.R and checks.ps1 completed by source inspection and retained-log review. Three P1 findings below; no supported P0 finding. Step 1 remains blocked after 2/2 corrections; step 2 and package diagnosis remain NOT RUN. Review completion is not implementation acceptance.

## Changes
Only this report created/finalized. No fixes, exploits, scripts, package or Git writes. No protected paths changed or proposed for removal/replacement/relocation.

## Checks run
Loaded pl-clear-technical-communication, cg-skill-r-technical and cg-skill-r-analytical. Read charter, SYSTEM_DESIGN, HARVEST_BRIEF, coordination contract, approved follow-up Plan and worker handoff. Reviewed the three changed harness files in full.

Read-only Git: git rev-parse HEAD returned f9454707b292a620e25abef17f2e515794020ba7; git branch --show-current returned main. Scoped git diff produced no output (not evidence that these worker files equal a committed baseline).

Targeted retained evidence (paths relative to pipsystem):
- .tmp/one-survey/20261110T022500Z-followup-red/logs/baseline.log:1,8-9 records an actual absent-pipfun namespace failure, not missing-inventory proxy.
- .tmp/one-survey/20261110T024500Z-followup-correction2/logs/setup.log:1-4 records actual missing-dependency failure followed by stamp/pipfun install exits 0; :26-27 records the nonexported-function acceptance failure.
- Same attempt logs/child-startup.log:1-8 records private E-local libraries in the top-level process, real INSTALL resolver children and staged lazy-load children. The previous mixed C default-library finding must not be carried forward as an observed current failure.
- Same attempt logs/install-missing-declared-cli.log:1-4 records actual declared dependency unavailability; install-stamp.log:13 and install-pipfun.log:15 record DONE. Missing E-local R.css warnings do not demonstrate C fallback.
- Same attempt dependencies.tsv:2-54 records 53 copied dependency versions/origins/destinations and DESCRIPTION hashes; these records are not a loaded namespace audit.

No scripts, R, tests, setup, diagnostics, exploits, installers or package commands executed by this reviewer. No new runtime/temp/cache/log roots needed; only read-only Git was invoked.

## Findings

- **[P1.1]** [cg-adversarial] `experiments/one-survey/checks.ps1`:31 — Boundary checks perform unchecked writes before the launcher can enforce confinement
  **Attack vector**: checks.ps1 accepts an unrestricted RunId (:1-2), constructs paths directly (:6), then creates directories, junctions and files (:32-39,47-48,55-57,62-63) before invoking run.ps1. It never validates resolved ancestors or existing leaf links. The launcher's stricter RunId validator and Assert-Tree therefore run too late to protect the check helper's own writes.
  **Impact**: An erroneous traversal ID writes outside pipsystem; an existing junction ancestor can send these writes to C or other forbidden/shared locations. Existing linked sentinel/log-target files can be overwritten before the intended negative assertion rejects anything. This violates the actual E-only/pre-write contract, even if the launcher subsequently fails closed.
  **Proof**: Static, NOT executed: Phase=boundaries with RunId='../../..' makes the first CreateDirectory target normalize from pipsystem/.tmp/one-survey/../../../boundaries to PIP/boundaries, outside pipsystem, before the launcher rejects that ID. Independently, a valid fresh ID with its existing boundaries directory redirected to C:/existing-target makes :38 create directories there before any launcher call. These require only the supplied parameter or a preexisting redirect; no outside write was observed in retained logs.
  **Fix**: Give checks.ps1 the same narrow RunId validation as run.ps1 and perform checkout, normalized containment and ancestor/recursive reparse/hard-link checks for every helper-owned destination before its first write. Require fresh helper destinations so existing files cannot be overwritten by test setup. Apply this to the helper itself, not only its child launcher; keep negative redirect fixtures E-local and under a verified parent.

- **[P1.2]** [cg-adversarial] `experiments/one-survey/setup.R`:34 — The green usability gate calls a nonexported stamp function
  **Attack vector**: Any clean setup/check reaches usable(), whose stamp::st_extmap_defaults() call assumes an export absent from the pinned installed package. The same usable() gates receipt-mutation tests and diagnose.
  **Impact**: Successful restricted installs cannot satisfy V2/V3; namespace-path capture, stale/incomplete inventory controls, successful child-restoration evidence and the sequential diagnosis cannot complete. This is a harness failure, not the original pipaux failure.
  **Proof**: Observed retained effect: final logs/setup.log:3-4 records stamp/pipfun exits 0; :26 explicitly says 'st_extmap_defaults' is not an exported object from 'namespace:stamp', then execution halts. setup.R:160,168-184 places the required acceptance checks after this call. No reproduction run by reviewer.
  **Fix**: Replace the stamp assertion with a small, read-only behavioral call through an actually exported API of this exact pinned stamp, checking its documented result. Do not use :::, namespace patches or package changes to preserve the mistaken control. Rerun affected acceptance only after renewed correction authorization.

- **[P1.3]** [cg-adversarial] `experiments/one-survey/checks.ps1`:56 — Negative hard-link fixture contaminates the runtime that later checks must launch
  **Attack vector**: The boundary phase places log-target inside the same runtime/boundaries tree (:31,56) and makes it a hard-link peer of a sibling attempt's logs/setup.log (:57). The launcher's recursive hard-link scan includes the main runtime and therefore rejects log-target on every subsequent inspect/check/forced-failure/diagnose launch.
  **Impact**: Running the advertised boundary checks makes the accepted runtime unusable for subsequent verification. The success/forced-failure restoration pair is prevented from reaching a child. Expected-failure checks can also be satisfied by this earlier guard failure instead of the intended R failure.
  **Proof**: Code path: checks.ps1:56-58 creates both link peers; run.ps1:25-34 recursively rejects either peer, called at :38 before R execution. Observed effect is reported, not independently executed: worker handoff:44-45,63-65 records eight boundary passes followed by the caller snapshot block failing before any child because of this fixture. Current hard-link topology was not independently enumerated by this reviewer.
  **Fix**: Put all negative fixture artifacts, including the benign hard-link peer, in a separate fresh E-local test root outside the positive runtime's recursive tree. Preserve existing evidence rather than cleaning or relocating this attempt. For future test runs, distinguish launcher rejection from reaching the intentional forced-failure R child.

## Provenance And Review Limits
No package repository or archived package source was read by this reviewer. Consequently there is no newly inspected package SHA to report. The seven pins in setup.R:16-22 and worker handoff:83-91 were reviewed as harness declarations, not independently certified source/runtime identities. Current pipsystem SHA is recorded above.

Fresh setup rejects preexisting attempts (run.ps1:39-40) and setup.R:68-79 rejects populated source/library directories before extraction; no current archive-overlay trigger was found for sequential launcher setup. Child default-library isolation has affirmative retained evidence, but no OS sandbox claim follows.

Receipt inspection: setup.R:145-158 compares exact root, seven-pin table, required receipt names, exit, SHA, path, archive digest, installed Meta/package.rds digest and DONE log; this is substantially stronger than inventory existence/Version alone. However it does not hash installed executable R/DLL payloads or revalidate dependency rows against copied content; recorded pins and metadata are not a complete byte-for-byte installed-tree attestation. No current false PASS is claimed: usable() fails first, and stale/incomplete mutation checks at :169-177 remain unexecuted. This limitation is not promoted to an additional observed P0/P1 corruption finding.

Minimal first: no speculative framework, dependencies, exhaustive sandbox or checksum infrastructure proposed. Findings target the demonstrated confinement and acceptance boundaries only. No changes applied because the review is read-only and step-1 correction budget is exhausted.

## Gaps
- Traversal/redirect overwrite scenarios are static triggers, not executed exploits; no C/outside-pipsystem write or data loss is alleged as observed.
- The fixture contamination effect is attributed to the worker's executed evidence; this reviewer did not rerun or inspect OS link counts.
- No complete installed payload/namespace attestation, OS write audit or exhaustive compiled hook audit was performed. Receipt mutation checks and loaded namespace table were not reached in the retained attempt.
- Step 1 V1-V3 remains partial/failed; 2/2 corrections exhausted. No reduced package diagnosis, original survey scenario or original Plan acceptance occurred. Further functional fixes require a revised authorized budget; this report grants none.
- Other full-review roles and consolidated/final verification are coordinator-owned and not certified by this individual review.
