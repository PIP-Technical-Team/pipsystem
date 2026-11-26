---
schema: pip-handoff-v2
project: pipdata
task: practical-integration-tests
run: 20261111T190007Z-context-fix
status: complete
updated: UNKNOWN
owner: independent reproducibility reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipdata
branch: PROD
head: c5b27fa4458d7175aca81a203762bae81e9f0b40
plan: NONE
next: NONE; independent read-only reproducibility review complete within stated limits.
---

## Summary
No issues found in the scoped changes to R/dependency_contract.R and tests/testthat/test-public-working-release-context.R. No supported P0-P3 reproducibility findings. This conclusion is a static source/evidence review, not independent execution or full survey acceptance.

## Changes
Created this assigned report, checkpointed it before completing evidence inspection, and updated it with the conclusion. No implementation, dependency installation, downloads, Git mutations, or other output files. Minimal first: bounded review; no unrelated hardening, dependencies, or safeguards added.

## Checks run
Loaded required communication, R technical and R testing skills. Read review brief, charter, implementation checkpoint, changed files and retained runtime sources/logs. Used read/grep only for evidence and apply_patch only for this E: report. No R, shell, Git command, or tests executed.

### Public contract and deterministic fixture
- Current and retained candidate R/dependency_contract.R:266-274 use NULL defaults, call the public getter once when necessary, and replace only omitted fields. Exact retained n11/sources/pipfun/R/working_release.R:121-126,154-169 stores the descriptor in .pipenv; :315-329 assigns it into parent.frame(). The fix consumes that side effect rather than mistaking its return for the descriptor. Explicit non-NULL arguments remain intact; no catch/fallback added.
- Retained baseline R/dependency_contract.R:266-273 has the old option defaults and context validation. Read both baseline/candidate context definitions and current source; the observed change is the bounded context resolution correction.
- New test :18-19 clears prior setup/aliases instead of fabricating working state; :24-38 substitutes external release/PPP transport only; :39-48 invokes real public setup and verifies absent hidden options and empty master inventory. :50-59 creates a fixed, completed synthetic inventory with an explicit UTC timestamp; no stochastic analysis or seed-dependent acceptance is introduced.
- Test :63-69 uses a passive exit trace with cleanup; :72-86 requires pipdata_dependency_aux_missing, verifies actual release/identity/root and unchanged empty master inventory. State is restored at :11-17. No processing worker is replaced. This is intentionally boundary acceptance, not successful survey processing.

### Retained red/green evidence
All following paths are under pipsystem/.tmp/one-survey/c11/; counts are read from supplied logs, not rerun:
- logs/red-confirmed.log:1-15 identifies dedicated libraries, E: temp and loaded package paths; :29-45 records the exact pipdata_dependency_context_error at public processing; :48-49 reports 1 block, 5 passes, 0 assertion failures, 1 error, 0 skips. Script success explicitly means baseline failure captured, not passing regression.
- logs/green.log:1-15 records the same isolated library arrangement; :26-29 reports 1 block, 10 passes, no failures/errors/skips.
- logs/affected.log:34 records 19 fresh-bootstrap assertions; :47-51 records the public regression and total 110 blocks/549 passes, no failures/errors/skips.
- check.R:22-33 compares installed context/wrapper/bootstrap bodies and formals with the selected recorded source; each completed log reports this comparison TRUE. :36-41 compares the current regression hash with retained candidate before execution; :52 checks all test-file hashes remained unchanged across execution. This supports use of the same frozen regression, subject to the non-execution limits below.

### Exact candidate and dependency origins
- run.ps1:44-50 copies the retained n11 R/library, adds ten named testing tools from the earlier bootstrap-fix/v/library, copies provenance tables, and archives full baseline SHA c5b27fa4458d7175aca81a203762bae81e9f0b40 with an explicit package-payload path list. It does not install the dirty repository tree.
- install.R:7-23 creates candidate from that extracted baseline, overlays only R/dependency_contract.R and tests/testthat/test-public-working-release-context.R, and checks SHA256 equality of all remaining candidate files against baseline. :24-32 writes the payload manifest and installs the candidate into c11/library.
- logs/candidate-source-sha256.tsv:143 records dependency_contract.R as 42931d07a2a01daa1a9923caae69810b05b3f230c9ac68980a51b636ce39ae88; :244 records the regression as 268672ffb2423777fe29e4d95892068aa7ccae7fc9b40d43798d425e4435dfe8. These are recorded hashes, not reviewer recomputations.
- logs/pins.tsv:2-8 records full SHAs for stamp, pipfun, pipload, wbpip, dlw, pipaux and baseline pipdata. logs/dependencies.tsv:1-108 records copied dependency versions, E: origins, original n11 destinations and DESCRIPTION MD5s; logs/installed-packages.tsv:2-8 is inherited n11 provenance, not a claim that c11 loads n11 paths. Completed red/green logs identify actual c11 namespace paths.
- Testing-tool copy origins are explicit in run.ps1:6,46-47. Earlier bootstrap-fix/v/logs/unchanged-dependencies.tsv records matching original/copied executable-code hashes and versions (including brio, callr and diffobj in the inspected first 40 lines). This is retained local dependency provenance, not a fresh lockfile-only rebuild. DESCRIPTION:24,35-40 already declares pipfun, testthat and withr; the change adds no dependency.

### E-only runtime configuration
- run.ps1:13-35 sets child-process temp/home/user/profile, APPDATA/LOCALAPPDATA, XDG, R libraries/startup/Makevars/history, caches, data/log roots and private R_HOME before launching R. :58 directs the transcript into c11/logs. paths.ps1:1-33 rejects redirected ancestors/recursive entries for checked runtime copy paths.
- Private c11/r/library/base/R/Rprofile:219-230 audits actual libraries, permitting only the private library tree (including INSTALL staging) and private base library, logs startup to E:, and disables pipfun automatic logging. logs/child-startup.log:1-11 shows these private paths for test/install children and staged load checks.
- logs/install-candidate.log:16-19 retains a missing help CSS-copy warning with E: source/destination; :22-25 shows staged/final load checks and DONE. It is not silently recast as a warning-free install.

## Findings
No issues found for the named changed files within this independent reproducibility scope. No unrelated lockfile/CI/environment redesign recommended for this bounded fix.

## Gaps
- No independent R/test execution, shell execution, fresh install, hash recomputation, binary RDS inspection, archive extraction, or Git diff/status/HEAD validation was performed. Branch/HEAD metadata is the brief's declared baseline, not a new checkout attestation. Retained baseline/candidate source definitions and the new test were read directly; whole-tree equality relies on the retained construction checks/logs.
- logs/expanded.log ends after stamp option messages at :38, without DONE or summary. Expanded-suite completion/pass is not established; 549 affected assertions is the largest completed suite inspected. No claim that a still-running process will complete or that the expanded suite passed.
- The inspected logs directory did not list the per-label *-test-sha256.tsv outputs that current check.R:53-56 would write. Exact hash-preservation checks are supported by the script and completed transcripts, but standalone per-run TSV retention was not independently established. No inference of changed tests is made from that absence.
- Library startup audits and configured redirection do not constitute an exhaustive OS filesystem-write audit or independent resolution of every filesystem link. No all-process E-only guarantee is claimed. The review itself started no child processes and wrote only this assigned E: report.
- The inherited copied dependencies and test-tool provenance support the retained local run; this review does not establish recreation from public package archives/lockfile alone or portability of the absolute-path local harness to another machine.
- The regression stops deliberately at missing auxiliary data; full survey numeric/readback acceptance and original survey Plan resumption remain outside this task. No new research/simulation run requiring a research results manifest was performed by this review.
