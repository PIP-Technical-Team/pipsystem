---
schema: pip-handoff-v2
project: pipdata
task: retained-receipt-red
run: 20261118T231446Z-retained-receipt-red
status: completed
updated: 2026-11-19T13:19:02Z
owner: Kilo Code
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: 53a76e379c81a3ac70b39925954981ae6a691459
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-17-b6-stable-clean-receipt-identity.md revision 2
next: Separate user authorization is required for implementation, green tests and remaining plan steps.
---

## Summary
One additional focused pre-fix test completed; no implementation or further plan steps. R attempt count 1/1. All six named retained input columns compared identical individually; unchanged current helper returned different aggregate hashes and the single hash-equality expectation failed. This establishes the pre-fix half of V1 for this pair, not a completed regression or a B6 fix.

## Changes
Created this handoff and `.tmp/b6-retained-receipt-red/check.R` plus contained temporary directories. No existing source/test, Plan body, pin, Git, store, pipeline, old investigation or Qmd changes. The original blocked work report and active-state record remain unchanged.

## Checks run
Pipdata PROD HEAD 53a76e379c81a3ac70b39925954981ae6a691459 and root verified; pipsystem HEAD e9c71e3190f1ce88a017ae25af7c373a64c655a2. `cg-render-artifact --validate-only .cg-docs/plans/2026-11-17-b6-stable-clean-receipt-identity.md` exited 0 with E: temp/cache redirects. Static C006/C007 and offline replay evidence showed suitable complete receipt input candidates.

Executed once: `& 'C:\Program Files\R\R-4.5.2\bin\Rscript.exe' --vanilla 'E:\PovcalNet\01.personal\wb384996\PIP\pipdata\.tmp\b6-retained-receipt-red\check.R'`, with child TEMP, TMP, TMPDIR, HOME, USERPROFILE, R_USER, APPDATA, LOCALAPPDATA, XDG and R user directories redirected to the new E: run root; R_LIBS and R_LIBS_USER set to `E:/PovcalNet/01.personal/wb384996/R/win-library/4.5`, site library disabled, startup profiles disabled. `data.table` and `digest` loaded from that E: library; R standard library path was `C:/Program Files/R/R-4.5.2/library`. R warned that data.table was built under R 4.5.3. The launched executable is R 4.5.2 by its installed path; package DESCRIPTION files read after execution report data.table 1.18.4, digest 0.6.39 and testthat 3.3.2. Runtime version values were not emitted by the child and these metadata are not a byte-verified runtime manifest.

Observed output: `pip_id=TRUE, alias=TRUE, artifact=TRUE, path=TRUE, version_id=TRUE, content_hash=TRUE`; checkpoint hash `de34cc2820f170ec`, refresh hash `2fd00ff6fc9fdce4`; one `expect_identical` failure, zero successes within that testthat block, process exit 1. The six precondition checks were `identical` comparisons followed by `stopifnot`, not six testthat expectations. Results independently compare equal six input vectors before current helper calls; they do not establish identical table attributes or serialized hash inputs. The two output strings also match the earlier readable replay values, a textual comparison after the run, not an independent runtime replay of the frozen algorithm. Console result is retained in the session tool output; no separate raw stdout/stderr file was produced.

SHA256: current `R/dependency_inputs.R` 731F396BCC76FE956CDF0A8D6F4A8F5B661AB89546E64F3DCD3117634CDFF107; `R/dependency_contract.R` 62922A9B60C893F79E033B9D808411BDEDACDCB754663A9BE3DEB7860E2372EA; runner 253ED39DA52C64878FE84C3A555669090EE77C44F982FAAC3E5C95026C7FF852; consumed `original-replay.rds` C7FF7D6C4E1E20B6E75D87B51151CAD2C991B8D5330A3A1A1C49ADF97BC3384F. Historical inputs C006.rds 86AEF1CC0D997FD4658904DF505B6A3387E36DE31953CB06069B1EE1AD159A99; C007.rds 7E1BB4089831A6FE85899DA71FB48E4EA1C0293F122A1A1BC66BA7009B424E9B; raw-tuples.rds C624DF851925E85AC411CD030EA6D4B2668E836A898B77D7A7B73DD67A9CE1DB. These latter files informed prior replay, not directly consumed by this child.

Focused data-risk review: all eight routed reviewers completed read-only; testing, code-quality, documentation, reproducibility and architecture highlighted narrow interpretation and provenance limitations. The observed existing representation-sensitive identity defect is in the authorized future fix scope, but correction is explicitly forbidden in this invocation. Report findings were resolved here by stating exact observed output, input/source hashes, package metadata provenance and the distinction between current-source test and historical replay. The script's fixed checkout path is specific to this authorized local evidence run; portability is not claimed and no script edit or retry was made. No mechanism, end-to-end assertion or fix is claimed. Reviewers did not run R or independently observe this execution.

## Gaps
V1 is only half demonstrated: valid pre-fix failure for this retained pair; post-fix green and self-contained durable regression remain NOT RUN. V2/V3, implementation review and mode:verify remain NOT RUN. Full B6 cause and precise aggregate mechanism remain unknown; the prior attribute-order intervention was INVALID and aggregate-after NOT RUN. P1.4 and 19 historical NOT RUN assertions remain open. A separate user authorization is required before implementing or running remaining plan steps.
