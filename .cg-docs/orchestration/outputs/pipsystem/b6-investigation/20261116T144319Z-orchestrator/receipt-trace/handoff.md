---
schema: pip-handoff-v2
project: pipsystem
task: b6-investigation-receipt-trace
run: 20261116T144319Z-orchestrator-receipt-trace
status: completed
updated: 2026-11-16T14:47:51Z
owner: pip-orchestrator recording read-only explore research
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: e9c71e3190f1ce88a017ae25af7c373a64c655a2
plan: NONE; static research only
next: A package-owned diagnosis must compare actual receipt tuples and master pointers before choosing a fix.
---

# B6 receipt/catalog static research

## Summary

The internal explore researcher found a concrete clean-receipt identity risk:
write-time and later catalog paths enter aggregate hashes without normalization.
The same path risk alone cannot explain missing metadata pins: metadata
currentness checks catalog version/hash against master pointers, not paths.
Neither candidate has executed proof in this investigation.

## Changes

- This file is the parent's durable synthesis of the completed research, not a
  copied transcript. No package changes, tests, runtime or Git mutation.
- The explore worker could not create its requested starting/final handoff
  because its read-only tool policy denies file creation; the parent records
  that limitation rather than claiming the worker saved a report. The parent
  also supplied independently observed Git state after the worker's Git denial.

## Checks run

Observed by parent: pipdata root E:/PovcalNet/01.personal/wb384996/PIP/pipdata,
existing PROD, HEAD 53a76e379c81a3ac70b39925954981ae6a691459, index empty,
only dirty vignettes/articles/PIP-data-pipeline.Rmd. Pipsystem main HEAD is
e9c71e3190f1ce88a017ae25af7c373a64c655a2. Explore also read the matching .git
HEAD and branch ref files directly. No other package repository was read.

Sources are under that exact pipdata HEAD:

| Boundary | Source | Static observation |
|---|---|---|
| Save | R/save_pip.R:91-128 | Verify attempted object hash and exact stamp history; retain pip_write result path unchanged |
| Revalidate | R/save_pip.R:131-151 | Resolve receipt path and alias against exact version/hash history |
| Clean aggregate | R/dependency_inputs.R:623-662 | Both aggregate output identities include path; tuple rows sort by pip_id |
| Clean reconciliation | R/reconcile_pip_inventory.R:28-55 | Copy clean version/hash and clear downstream metadata/deflation pointers |
| Metadata reconciliation | R/reconcile_pip_inventory.R:56-63 | Restore metadata version/hash; clear deflation pointers |
| Checkpoint | R/dependency_manifest.R:490-567,627-634 | Write reconciled inventories, store exact receipts/aggregate identities, publish manifest and advance execution |
| Published manifest | R/dependency_manifest.R:150-194 | Verify a temporary checksum-bearing envelope then rename/read its generation |
| Caller state | R/pipeline_stage_cores.R:211-222,430-439 | Adopt committed checkpoint candidate/execution |
| Next catalog snapshot | R/dependency_execution.R:276-281,539-547 | Fresh catalog query; case-insensitive basename match, newest created_at then path; retain selected path unchanged |
| Clean currentness | R/dependency_execution.R:587-610,654-675 | Rebuild clean tuples and require master clean version/hash match |
| Metadata currentness | R/dependency_execution.R:565-585,740-766 | Missing/mismatched master version/hash yields an all-NA metadata receipt despite catalog presence |
| Facts | R/dependency_execution.R:815-829 | Missing pin/hash yields output_missing; unequal aggregate identity yields output_drift |

Parent independently reread save_pip.R:88-152, dependency_inputs.R:623-663,
reconcile_pip_inventory.R:1-79 and dependency_execution.R:539-621 after the
research finished. Checkpoint details above are researcher-reported static
source observations, not parent re-execution or a claim of faulty persistence.

### Candidate distinctions

1. A path spelling/representation difference can change clean tuple hashes
   with unchanged per-artifact pins/content. Existing pd_normalize_path at
   dependency_contract.R:249-255 is not called on the traced tuple path chain.
   Actual historical write/catalog paths were not proved different.
2. Clean reconciliation intentionally clears metadata pointers. A missing later
   metadata checkpoint, stale master reload or repeated clean stage could leave
   catalog output present but metadata currentness absent. The actual B6
   persistence sequence remains unproved.
3. Multiple basename matches could make catalog ordering select a different
   row. No actual ambiguous B6 catalog was established.

Researcher inspected, not ran: test-save_pip.R:11-27 (mock relative path),
test-m2-one-survey-acquire-format.R:171-197 (unchanged save),
test-reconcile-pip-inventory.R:358-377 (tuple ordering),
test-dependency-execution.R:86-127 (missing master pointers), and
test-pd-run-pipeline.R:1224-1268 (test-only path normalization). Test-only
normalization does not establish production normalization or a required fix.

## Gaps

- No R/Quarto, package test, installation, pipeline, source modification,
  generated diagnosis probe or Git mutation was performed.
- Actual tuple values/attributes, persisted master pointers and catalog ordering
  must be captured in a fresh bounded package reproduction. Identical tuples
  would disconfirm the path hypothesis.
- The historical f20 identical-object/different-recorded-metadata-hash evidence
  can have a distinct cause; it is not explained by clean path identity alone.
- A root cause, minimal correction and B6 PASS remain UNKNOWN. No change to
  loaders, checks, normalization policy, stamp authority or history is approved.
