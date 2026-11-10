---
schema: pip-handoff-v2
project: pipsystem
task: practical-integration-tests
run: 20261110T023600Z-followup-performance
status: completed
updated: 2026-11-10T02:37:47Z
owner: cg-performance
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: f9454707b292a620e25abef17f2e515794020ba7
plan: .cg-docs/plans/2026-11-09-one-survey-harness-repair-and-diagnosis.md
next: Coordinator incorporates static review; implementation remains blocked with step-1 correction budget exhausted.
---

# Follow-up harness performance review

## Summary
No actionable P0-P3 performance issues identified in the current bounded harness. The private E-local R copy is a meaningful but justified isolation cost, not a performance defect. This is a full static performance-role review, not executed verification or implementation acceptance.

Step 1 remains BLOCKED after 2/2 corrections; step 2 and reduced diagnosis remain NOT RUN (worker handoff:19-21,111-112,117-120). Successful stamp/pipfun install exits do not establish usable runtime acceptance (worker handoff:43-47,60-63). No further execution or functional correction was performed for this review.

## Changes
Only this report created and finalized. No source changes, tests, harness execution, package writes, Git mutations, dependency additions, cleanup or protected-record changes. No package repository sources were read by this reviewer; seven SHA pins were read only as pipsystem script/report data. Independently read pipsystem HEAD is f9454707b292a620e25abef17f2e515794020ba7 on main.

## Findings

Explicit no issues: no supported P0, P1, P2 or P3 performance finding. The following costs were evaluated and do not warrant corrections in this bounded task:

- **Private runtime copy — run.ps1:45-58,90-116.** Each fresh baseline/setup copies selected R runtime directories and base/recommended packages, then changes only its private base startup profile. Check/inspect/forced-failure/diagnose modes do not recopy R. Worker handoff:99,114-115 reports 2,281 files / 137,003,995 bytes for the red copy before setup. That measurement is inherited evidence, not independently measured here. Four named baseline/setup attempts (worker handoff:29,38-43) imply roughly 548 MB of base-copy payload if comparable, excluding dependency libraries, archives, filesystem overhead and later modifications. This is retained disk/I/O cost, not 137 MB of live R memory per invocation. It buys actual child default-library separation; replacing it with shared mixed R or links would undermine the reviewed isolation mechanism. No caching, shared mutable runtime, runtime trimming or retention policy is recommended for this exhausted-budget repair.
- **Dependency traversal/copies — setup.R:97-131.** The visited set prevents repeat dependency copying and cycles; base packages and R are excluded. The worker reports 53 copied dependencies (handoff:93). One PowerShell process scans each contributed copy input recursively for redirects before the copy (setup.R:114-120). Process startup and filesystem scans may be noticeable, but remain bounded setup work, not per-survey or per-row processing. No timing supports a material bottleneck claim. Vectorizing the recursive dependency graph or adding a copy/cache framework would be premature.
- **Prewrite tree inspection — run.ps1:12-38,47-55.** Recursively visits existing runtime/source files and checks directory ancestors. It is metadata traversal rather than repeated content hashing or reading all runtime bytes. A fresh attempt does not scan older sibling attempts, so retained attempts do not automatically cause whole-history rescans. Existing attempts are scanned for later launches; that is a finite safety cost under the explicit E-only path requirement. Do not remove the guard for speed. The benign hard-link boundary-test target can cause later launches to stop, but worker handoff:45,63-65 already records this as a functional test-layout blocker, not a measured performance regression.
- **Archives, hook capture and receipts — setup.R:71-87,133-158.** Seven pinned repositories are archived once per fresh setup, only stamp/pipfun are installed as required packages, and hook material is captured before installation. Receipt verification hashes those two archives and installed metadata, not full libraries. Negative inventory tests reject malformed records before usable() is reached (setup.R:144-177). Small lists/tables, seen-vector membership and data.frame operations are not large-N analytics and need no data.table/collapse rewrite.
- **Boundary assertions and output — checks.ps1:8-81; run.ps1:118-120.** Fixed direct assertion cases, environment snapshots and streamed Tee-Object logs do not introduce resampling, retry loops, unbounded in-memory log accumulation or repeated model estimation. Startup audit log lines are append-only per child within one attempt (run.ps1:103-114). No evidence supports a log-volume or peak-memory finding for this scope.

## Benchmarking disposition

No benchmark was run or required to report the static result. If setup latency becomes an observed blocker during a separately authorized resumption, optional measurement should distinguish private-copy time, per-dependency scan/process startup, dependency copying, and R installation from package diagnosis. Use existing timing tools around those stages; do not add dependencies, skip isolation checks, broaden the correction budget, or launch extra attempts merely to optimize an unmeasured cost. Total copied dependency bytes and peak working set are currently UNKNOWN.

## Checks run
Static sources read in full:
- experiments/one-survey/run.ps1:1-128.
- experiments/one-survey/setup.R:1-207.
- experiments/one-survey/checks.ps1:1-82.
- Approved follow-up Plan:1-101, especially bounded step-1 checks:36-41, sequential diagnostic gate:43-48, iteration budget:90-98.
- Worker handoff 20261110T021917Z-followup-implementation/handoff.md:1-123, including copy measurement and incomplete gates.
- compound-gpid.md, compound-gpid.local.md, SYSTEM_DESIGN.md, HARVEST_BRIEF.md and orchestration/CONTRACT.md for constraints/context.

Loaded pl-clear-technical-communication and cg-skill-r-technical before review. Dialect configuration is data.table-collapse (compound-gpid.local.md:2-4); this script is environment/install orchestration rather than grouped statistical computing. No statistical aggregation was found requiring a dialect-specific performance rewrite.

Executed only read-only repository identity commands (git rev-parse HEAD; git branch --show-current) and system-clock queries. No R, PowerShell harness, Pester, package installation, diagnostic, survey scenario, benchmark or verification test was run. File writes were restricted to this report through apply_patch.

## Gaps
- Static review cannot certify elapsed time, available disk space, dependency-copy size, peak memory, actual child namespace paths or OS-wide write confinement. The ~137 MB measurement and install outcomes are attributed to worker evidence, not independently rerun.
- Step-1 usability, stale-inventory and success/forced-failure restoration gates remain incomplete; budget is 2/2 used. Diagnosis remains unexecuted. This role's completed report does not alter those statuses or authorize resumption.
- No package source inspection or current package HEAD refresh was performed. Script pins and inherited worker provenance are not new package runtime proof.
- No production-scale survey, bootstrap, estimation or panel workload is present in the reviewed scripts; no conclusion about production pipeline performance is made.
