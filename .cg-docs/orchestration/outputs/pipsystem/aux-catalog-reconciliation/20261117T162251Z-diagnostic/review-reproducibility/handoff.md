---
schema: pip-handoff-v2
project: pipsystem
task: aux-catalog-reconciliation
run: 20261117T162251Z-diagnostic/review-reproducibility
status: completed
updated: 2026-11-17T16:41:34Z
owner: cg-reproducibility
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: .cg-docs/plans/2026-11-17-auxiliary-version-retention-diagnosis.md revision2
next: Coordinator integrates this review and completes required light verification; shared processing remains blocked outside this diagnostic scope.
---

# Reproducibility review

## Summary
No supported P0/P1/P2/P3 reproducibility issues found in the scoped new diagnostic scripts and retained evidence. No safe_auto or manual fix is required; advisory limitations are retained below, not promoted into speculative findings.

The copied audit, original contributed-library receipt roots, local child environments and fresh-process readbacks are consistent with Plan revision2. The retained evidence supports only the tested local synthetic RDS/two-save/infinite-retention path, not shared repair or historical cause. This is a static review of executed evidence, not independently executed tests.

## Changes
Only this assigned handoff created and finalized on E:. No implementation, package, protected/design/rule/roadmap or original-runtime edits; no Git mutations, shell/R/test/network/shared execution or installations.

## Checks run
- Loaded technical communication and required R shared/technical/data.table/collapse/testing skills. Read project contracts, canonical revision2 Plan and work report.
- Copied audit versus original contributions: `run.ps1:38-56` copies only R home, replaces exactly one expected-library expression in the copied base startup profile, checks the original profile hash before/after preparation and compares source/copied Rscript hashes. `preparation.json:2-9` records distinct original contribution and copied base/audit roots. No original profile/package/namespace write appears in the reviewed harness. Hash preservation is the retained preparation evidence, not a new hash computation by this reviewer.
- Receipt anchoring: `provenance.R:21-39` reads original inventory/pins, requires original inventory/receipt roots, original installed stamp path, exact stamp SHA, archive/installed Meta MD5 and successful install log. `:40-52` compares all dependency descriptions/versions to original inventory. `first-1.log:1-3` and `second-1.log:1-3` record these checks passing for 107 dependency descriptions. Stamp provenance is `95890411e8bf9db842593c2b0ab68ec4f2a66b25`. No external package repository or package source was read for this review; that SHA is the explicitly checked harness pin, not a freshly inspected repository HEAD.
- All child path/cache/environment routing: `run.ps1:6-26,69-116` separates E:-checkout output and scratch roots, applies path assertions, redirects initial PowerShell temp/module cache and then child temp/home/profile/config/history/R/renv/pkg/Git cache settings to the new run; original R_LIBS is intentionally the read-only contribution input. `provenance.R:11-20` requires exact copied R home and original-contributed/copied-base library pair plus local temp/home roots. Settings are restored in `run.ps1:132-135`. This is script-level routing evidence, not a system-wide filesystem-write audit.
- Actual startup/origins: `child-startup.log:1-4` records copied executable and exact original-contributed/copied-base library pair for red, creator, fresh reader and dossier children. `first-1-namespaces.tsv:2-13` and `second-1-namespaces.tsv:2-13` show stamp/data.table/cli/rlang in original contributions and base namespaces in copied R home, for distinct PIDs17712 and17200. `provenance.R:53-69` checks actual namespace paths and rejects unrelated PIP namespaces.
- Red baseline: `verify.R:5-9` rejects absent receipt before any store initialization. `red-1.log:4-12` records that exact expected failure. `run.ps1:120-128` additionally checks nonzero exit, exact missing-result message and no initialized store. This is missing-evidence verifier coverage, not a reproduced package failure.
- Deterministic independent inputs and reads: `create.R:5-35` saves two explicit changed synthetic lists and records returned IDs/store/creator PID; no stochastic data-generation step requires a seed. `verify.R:15-25,33-65` independently defines expected lists and checks distinct IDs, exact current/historical payloads and matching respective sidecar/catalog content hashes. `save-trace-1.tsv:2-3` records first8bc28cc289f49d51 then6fee99c874dfb800 and matching catalog pointers. `first-1.log:19-31` and `second-1.log:17-29` record assertion PASS; `second-1.log:2-7` additionally proves a different reader PID and same receipt/store validation. `verify.R:66-70` tests timestamp/ID ordering rather than assuming latest equals pointer. `second-1-versions.tsv:2-3` has two different timestamps and `second-1.log:28` records no tie. No general tie/concurrency guarantee is inferred.
- Informational stderr: `first-1.log:4-12` and `second-1.log:8-16` contain options-update text decorated NativeCommandError by PowerShell, followed by all assertion PASS. Exit0 is retained coordinator evidence in work report `:58-63`; this reviewer did not independently execute or obtain process exits.
- Bounded claims: `decision-dossier.md:18-37,67-99,104-154,195-199,223-236` keeps old saved inspection/user-reported public failures distinct from current local diagnostic, candidate metadata agreement distinct from public payload acceptance, and recovery distinct from version reselection. `check-dossier.R:4-23` and `dossier-1.log:1-7` check all six ID pairs and UNKNOWN/NOT RUN labels, not live-store correctness. No shared action is authorized by these results.
- Read complete scoped run.ps1, provenance.R, create.R, verify.R, check-dossier.R, preparation.json, child startup/red/first/second/dossier logs, first/second namespace TSVs, save trace, fresh-reader version TSV and decision dossier. Branch/main and pipsystem HEAD `e9c71e3190f1ce88a017ae25af7c373a64c655a2` are supplied provenance from `review-brief.md:3-4` and work report `:9-12`, not independently executed Git checks.

Minimal first: no extra framework, dependencies, checksums, lockfile, hardening or failure-injection suite proposed for this recoverable local diagnostic. Existing functional checks answer the approved question. No protected item or Open/Decided design change is proposed.

## Gaps
- No independent R/shell/tests, hash recalculation, namespace interrogation, filesystem write monitoring or Git verification performed. All runtime assertions are inspected retained evidence, not this review's execution.
- Original contribution library is treated as read-only by the reviewed scripts; OS-enforced write denial and full before/after byte comparison of the whole original runtime/library are not established or claimed. The preparation checks specifically cover the profile and Rscript; no broader immutable-image claim follows.
- Scope is synthetic RDS ordinary saves with retain_versions=Inf. QS2 auxiliary payload acceptance, finite-retention/failure/concurrent-writer paths, historical cause and shared repair remain untested. No timestamp tie occurred.
- Authoritative six-version choice, recoverable missing snapshots/backup provenance and supported history-preserving shared recovery method remain UNKNOWN. This review does not unblock default shared public processing or approve any candidate promotion.
- Coordinator still owns route-aware review integration and final light verification (work report:18,26,69-73). Editor diagnostics are NOT RUN per work report:67. No issue is suppressed by treating those limits as completed acceptance.
