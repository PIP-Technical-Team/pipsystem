---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261109T223200Z-data-quality
status: completed
updated: 2026-11-09T22:34:25Z
owner: data-quality reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md revision 1
next: Parent triages the P2 setup-evidence finding; implementation remains blocked at pipaux installation.
---

# One-survey example: data-quality review

## Summary
Completed read-only FULL data-quality review of setup.R, run.ps1, approved revision 1 Plan and implementation handoff. One P2 safe_auto finding; no supported P0/P1/P3 findings. This completes this review role only, not the implementation or V1-V5 verification.

Known pipaux installation failure is corroborated by `.tmp/one-survey/logs/install-pipaux.log:7-11` and `logs/setup.log:1-7`. No scenario, actual survey values or malformed classification ran. Their absence is the disclosed blocked state, not a newly discovered bug; installation error is not invalid-input rejection.

## Findings

**[P2]** `experiments/one-survey/setup.R:113` -- Unvalidated inventory can accompany a V1 success claim. **Tag:** safe_auto.

**Issue**: `readRDS()` establishes only that the file is readable; `inventory` is never inspected before being embedded in setup-check.rds (`:130-132`). Neither the required schema, character-valued package/SHA records, correspondence to current requested pins, nor completed installations are checked. The inventory is saved before installation (`:99-109`), so its existence does not mean setup completed. Namespace checks verify location under the runtime root and record versions (`:118-125`), but do not bind those loaded installations to the recorded source SHAs. For example, a readable NULL inventory with otherwise loadable isolated namespaces reaches the success message at `:133`; a stale prior-run inventory/library combination has no pin-consistency check.

**Impact**: The standalone check can certify V1 with incomplete or stale provenance, making later results appear tied to exact revisions when that link is unproven. This is a setup-evidence false-pass risk, not an observed false pass or incorrect statistical result. The current failed pipaux install does not satisfy the namespace checks.

**Fix**: Before the V1 success message, require the existing inventory's expected package/SHA/dependency records and their agreement with the requested setup, and associate successful installed-package records with that setup. Keep the current partial inventory as failure evidence, clearly distinct from successful setup evidence. This is the existing Plan's V1 functional check, not a new locking/checksum framework or dependency requirement. Reproving exact installed source identity requires installation evidence, not just packageVersion().

## Other reviewed surfaces
- Inventory construction uses character package/repository/full-SHA columns and named dependency provenance records; no supported coercion or NA-propagation defect was found in those constructors (`setup.R:35-48,83-94`). Serialized inventory contents were not decoded during this read-only review.
- Dirty working-tree records are explicitly excluded by `git archive <SHA>` (`setup.R:60-66`), not silently incorporated into the snapshot. A dirty checkout alone is not a data-quality defect.
- Third-party provenance records version, source, destination and DESCRIPTION MD5 (`setup.R:91-94`); this records dependency origin, not a full content identity certificate.
- The launcher checks child exit status (`run.ps1:48-50`); no supported finding that this observed failed install was reported as successful.
- Row alignment, units, weights, missingness, classification and exact-version readback are requirements in the approved Plan (`:47,60,85-89`), not executed assertions. No numerical result or completed invalid classification is claimed by the worker (`handoff.md:68-75`).

## Changes
Only this review report was created/updated. No source/package edits, dependency additions, Git mutations or protected-path recommendations. Minimal first: one existing V1 evidence correction proposed; no speculative safeguards or broader framework.

## Checks run
- Loaded technical-communication and R analytical, technical, data.table and collapse skills; dialect confirmed at `compound-gpid.local.md:2-4`.
- Read project charter, design, harvest brief and pip-handoff-v2 contract; statically inspected both requested scripts, Plan and implementation handoff in full.
- Read existing setup and pipaux installation logs; no R/setup/scenario/tests/installations executed.
- Read the archived pipaux DESCRIPTION (`.tmp/one-survey/sources/pipaux/DESCRIPTION:1-3,43-64`), whose declared source pin is `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` (`setup.R:47`; worker handoff `:65`). Archive contents were not independently compared to the Git object; no live package repository was read.
- Read-only `git rev-parse HEAD`, `git branch --show-current`, `git status --short`: pipsystem SHA `f9454707b292a620e25abef17f2e515794020ba7`, branch main. Existing dirty active-state and untracked task/runtime artifacts preserved.
- Communicated finding and blocked-state distinction to the coordinator on the shared board.

### Referenced source pins (inherited, not new package inspections)
The requested scripts and worker handoff record stamp `95890411e8bf9db842593c2b0ab68ec4f2a66b25`, pipfun `0c6a78d9884ed0965a524311537eec2a5095d60b`, pipload `ff9a81e386a09fb2531c154f63fd2b91521313c6`, wbpip `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`, dlw `12faa058b521ef511073a7b21b1b1dd7993c9649`, pipaux `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be`, pipdata `13a38280c1eafe7e03a97837cdb57833fbe9d926` (`setup.R:35-48`; worker handoff `:57-66`). These are requested/archive provenance, not independently certified installed runtime SHAs.

## Gaps
- V1 remains partial; standalone success-path false-pass example is established by source inspection, not execution. Inventory RDS contents and loaded runtime namespace identities were not independently inspected.
- V2-V4 remain NOT RUN due to the known pipaux install blocker. Welfare/weight values, invalid classification, data/metadata receipts and exact-version readback cannot be certified.
- Child-process full isolation, third-party startup hooks and OS-level write behavior were not audited. The worker already discloses these limits (`handoff.md:84-86`).
- No fix or verification run is authorized/performed by this review. Parent owns finding triage, installation-owner direction and final cross-role verification.
