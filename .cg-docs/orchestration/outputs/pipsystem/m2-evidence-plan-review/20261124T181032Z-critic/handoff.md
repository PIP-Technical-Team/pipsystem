---
schema: pip-handoff-v2
project: pipsystem
task: m2-evidence-plan-review
run: 20261124T181032Z-critic
status: completed
updated: 2026-11-24T18:13:07Z
owner: cg-plan-critic
repo: /Users/acastanedaa/Library/CloudStorage/OneDrive-WBG/Documents/projects_WBG/PIP/PIP-packages/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-24-m2-deflation-evidence.md blob f1c374d1f91439dab2e897ca15d064ee49740db7
next: Plan owner clarifies V1 and V3 before using the Plan to recommend reuse.
---

# Deflation evidence Plan review

## Summary
Two P2 findings. Both can be addressed in the existing verification table. The two-step Plan otherwise respects the read-only scope and keeps M2 open. No new tool, test run or approval gate is needed.

- **[P2.1] [cg-plan-critic] Step 1 / V1 — Name the CPI and PPP evidence.** **Issue:** Lines 33 and 60 ask for parent pins and consumed inputs but do not say what establishes the selected auxiliary versions. **Evidence:** The [Windows handoff](../../../pipdata/m2-deflation-work/20261105T191650Z-code/handoff.md#L33-L36) lists clean, metadata and PFW as the direct consumed parents. The [fixture decision](../../../../../brainstorms/2026-11-04-m2-phase3-deflation-gates.md#L46-L54) distinguishes source pins from selected release/adaptation keys, and the [roadmap agreement](../../../../../brainstorms/2026-11-24-pip-system-roadmap-agreement.md#L49-L53) calls for exact CPI/PPP versions. **Impact:** A reviewer could match all three direct parents and quote expected fixture vintages without accounting for which CPI/PPP versions were used. **Fix/check:** In the existing V1 input entry, trace the actual CPI/PPP producer versions and selected vintage keys through the final primary case's metadata or cited inventory. Mark any unsupported identity `UNKNOWN`; a metadata pin alone or the fixture decision alone does not supply that trace. Do not open the store.

- **[P2.2] [cg-plan-critic] Step 2 / V3 — Bind the proposed mean to the matched output.** **Issue:** Line 62 specifies the right number but not where the later check gets its rows. **Evidence:** The [fixture decision](../../../../../brainstorms/2026-11-04-m2-phase3-deflation-gates.md#L43-L57) has 2005 CPI and PPP both equal to 1; clean LCU values give the same mean. Its first population control also scales all weights equally, which leaves the mean unchanged. The [Windows handoff](../../../pipdata/m2-deflation-work/20261105T191650Z-code/handoff.md#L34-L36) distinguishes the saved primary output from the separate control versions. **Impact:** A disconnected calculation could return 3 without consuming the deflated artifact. **Fix/check:** Word the single proposed downstream check as: from the matched primary output version/receipt, supply `welfare_2005` and its aligned primary weights to `pipster`; expect 3. Do not run that check during reconciliation.

## Changes
Only this handoff.

## Checks run
Verified the managed checkout, branch, HEAD, and working Plan blob with read-only Git; the same HEAD and blob were present at final review. Read the complete Plan and the exact charter text at `compound-gpid.md:10–40`. Compared the Plan with the cited decision, agreement, Windows worker handoff and coordinator follow-up (`m2-deflation-work-followup/20261105T212648Z-orchestrator/handoff.md:100–107`). No package repository, runtime store or payload was opened. No package loads, tests, pipeline runs, Git mutations or Plan edits.

## Gaps
Current package and artifact availability was not inspected; it is outside this review.
