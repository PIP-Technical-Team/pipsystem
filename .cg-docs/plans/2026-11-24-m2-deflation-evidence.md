---
date: 2026-11-24
title: "M2: identify the tested deflation source before the weighted mean"
status: active
scope: Lightweight
brainstorm: .cg-docs/brainstorms/2026-11-24-pip-system-roadmap-agreement.md
language: R
estimated-effort: small
deviation-policy: autonomous
artifact-schema-version: 1
tags: [m2, deflation, evidence]
---

# Plan: Identify the tested deflation source

## Objective

Give the next package owner a supported decision: reuse the tested deflation inputs and code, or recover one named prerequisite first. This is a read-only evidence check, not a deflation implementation or a portability test.

## Context

The [Windows package handoff](../orchestration/outputs/pipdata/m2-deflation-work/20261105T191650Z-code/handoff.md#L24-L57) reports 125 test blocks and 831 expectations for one synthetic case. The tested `pipdata` included uncommitted changes; the other loaded PIP sources included a linked `pipload` checkout. The [coordinator](../orchestration/outputs/pipsystem/m2-deflation-work-followup/20261105T212648Z-orchestrator/handoff.md#L16-L22) inspected that evidence but did not rerun it. The [roadmap agreement](../brainstorms/2026-11-24-pip-system-roadmap-agreement.md) requires fresh results on both platforms at executable milestone close, not for this inspection.

## Requirements

| ID | Requirement | Source |
|------------------------|------------------------|------------------------|
| R1 | Identify the executed source set, fixture, consumed input versions and saved output. | Windows handoff, lines 31–36, 45–57 |
| R2 | Compare each required source and input with the candidate available for reuse. | Roadmap agreement, First end-to-end step |
| R3 | Select one next owner and a functional check; do not perform it here. | Approved completion contract, 2026-11-24 |

## Implementation Steps

### 1. Reconstruct the reported Windows case (R1)

- **Requirements**: R1
- **Tests**: Compare the final Windows run manifest and handoff against V1. Follow the final run's references, not its failed attempts. Identify `pipdata`, linked `pipload`, `pipfun`, `pipaux`, `wbpip`, and `stamp`. Record the executed source manifest or comparable hash references, the exact fixture and parent pins, and the deflated output version/receipt. Distinguish original and consumed parents. Use the [fixture decision](../brainstorms/2026-11-04-m2-phase3-deflation-gates.md#L42-L68) for expected values, not as execution evidence. Check dated follow-ups for later source preservation or integration. Cite each item and label it observed, report-only or unknown.

### 2. Compare candidates and choose one next action (R2, R3)

- **Requirements**: R2, R3
- **Tests**: Compare candidate file and artifact identities per V2, then apply V3 to the completed table. Use registered identities from `tools/pipsys/packages.csv` and verified local mappings; never translate a Windows path by guesswork. For each available package read, record actual root, branch or detached state, full HEAD, and relevant tracked or untracked differences. Compare the executed files, tests, and result-affecting helpers against that checkout using the same hash convention or direct byte comparison. A branch name, clean status, base HEAD or newer commit alone does not prove equality. Note whether matching bytes are local only or available at a retrievable revision. For fixture, parent pins and output, check availability against existing sanitized inventories or receipts; a historical pointer alone is not present availability. No payload or package loading.

## Testing Strategy

Verify the comparisons and the resulting recommendation against V1–V3 below. Do not rerun package tests.

## Documentation Checklist

Record one source per claim, full Git SHAs for each checkout read, and a nonempty Gaps section.

## Risks & Mitigations

If the tested files include local changes, compare their actual identities, not just Git HEAD. If the checkout mapping or current inventory is missing, record `UNKNOWN` rather than using a substitute.

## Out of Scope

Package execution, changes, publication, and milestone closure.

## Completion Contract

### Outcome

One sanitized `handoff.md` in `pip-handoff-v2` format in a fresh `outputs/pipsystem/m2-deflation-evidence/<run-id>/` folder under `.cg-docs/orchestration/`. Record each item, tested identity/reference, current identity/reference, comparison basis, result and gap.

### Verification Surface

| ID | Evidence Required | Command/Artifact | Required |
|------------------|------------------|------------------|------------------|
| V1 | R1: complete historical case | Historical manifest and receipt: six package rows plus fixture, consumed inputs and saved deflated output. From the final primary case's metadata or sanitized inventory, trace actual CPI/PPP producer versions and selected release/adaptation keys. A metadata pin or expected fixture value alone is insufficient; mark unsupported identities `UNKNOWN`. | yes |
| V2 | R2: every row classified | Comparison table: `MATCH` requires comparable evidence of equality and availability; `DIFFERENT` needs a demonstrated difference; incomplete, inaccessible or incomparable evidence is `UNKNOWN`. A missing Windows source on macOS is not a mismatch. | yes |
| V3 | R3: next owner and check | Only if all required items match, propose that `pipdata` supply `pipster` with `welfare_2005` and its row-aligned primary weights from the matched primary deflated output version and receipt. Expect `(1×10 + 2×20 + 3×30 + 4×40)/100 = 3`; do not substitute clean welfare or population-control weights. Otherwise name the first different or unknown prerequisite, its owner and the evidence that would resolve it. Do not run the check here. | yes |

**Constraints and boundaries:** Read reports and authorized checkouts only. The execution handoff is the only intended output. No Git mutations, package edits or loads, installs, live data, pipeline runs, QMD, changes to existing Plans or roadmap status. Keep raw logs and private stores out of the hub. `stamp` remains the sole rebuild authority.

**Iteration and stop:** Check newer evidence first. Complete independent rows if one source is blocked; do not substitute a different checkout, access a private store, or start recovery. An evidence report can be complete even when the next calculation is blocked. Report what was not inspected. Keep M2 open.

**Minimal first:** One table and one next action. Give each change a functional check; use installed tools. Defer safeguards unless they prevent almost irreversible harm. Keep Plans to about two pages or split them. Proceed within scope; seek approval for protected design/scope changes, publication, non-generated deletions, or almost irreversible actions.

## Gaps

Current source equivalence, durable pins, and present fixture/output availability are unknown until this Plan is executed. No package repository was read to prepare this Plan; historical package SHAs are in the cited handoff. No present-day Windows or macOS runtime result is claimed.