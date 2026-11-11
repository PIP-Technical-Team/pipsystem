# Fix the fresh-master bootstrap boundary

## Setup
- **Project Name:** pipdata
- **Branch:** current — PROD; existing, verified clean at preparation
- **Worktree Requirement:** No — existing checkout; E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Model Family Recommendation:** Powerful — first-run processing and versioned-storage semantics
- **Effort:** high
- **Target Project:** pipdata — E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Target Environment:** existing PROD checkout at E:/PovcalNet/01.personal/wb384996/PIP/pipdata; observed HEAD 13a38280c1eafe7e03a97837cdb57833fbe9d926
- **Target Agent:** Code mode

Model/effort advice only; examples such as Sol/Opus are suggestions, availability varies and the user chooses. Submission starts the package task; this saved artifact alone grants no execution or Git authority.

## Task
```text
/cg-fixbug

Verify root E:/PovcalNet/01.personal/wb384996/PIP/pipdata, branch PROD and starting
HEAD 13a38280c1eafe7e03a97837cdb57833fbe9d926. Preserve changes; report mismatches
without switching or creating environments. Diagnose and fix only the confirmed
pipdata fresh-master bootstrap defect, not other packages or the full survey.

Symptom: in a fresh isolated TEST store with one actual completed-valid inventory
row, pipdata::pd_process_data(inv = inv, bootstrap = TRUE, verbose = FALSE) raises
"No version files found in 'pip_master_inventory.qs2'"; st_versions shows zero
master versions. Current R/pd_process_data.R:114 reads the master before lines
115-120 pass bootstrap to preparation. Expected requirement: explicit first-run
bootstrap must handle trustworthy genuinely absent master history without
fabricating populated state or treating arbitrary read failures as empty history.
Confirm the package contract and ownership before encoding expected tests.

Read these inputs under E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/:
- experiments/one-survey/reproduce.R
- .tmp/one-survey/resume-20261110-correction1/logs/reproduce.log
- .cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T223242Z-survey-resume/handoff.md
Retained setup installed all seven exact snapshots, including corrected pipfun
7d534516a8c17c33d537681610eccd4c29211762. It also completed real valid/invalid
survey validation. Cleaning, numeric assertions and clean/meta readback did not
run. Suitable qs2/stringfish/RcppParallel copies came from the existing E-local
4.5-pipapi library; earlier native dependency failure is separate from this bug.

Follow the structured bug-fix workflow and retain its required reproduction and
fix-confirmation gates. Inspect existing tests, establish a regression failure,
apply the smallest source correction, and run the regression plus affected
existing tests. Verify genuine absence, existing master behavior and preservation
of non-absence errors; do not broadly catch read errors. Test the actual installed
candidate in a fresh isolated runtime. No internal-worker bypass, fake populated
master or weaker scenario expectations. Run independent route-appropriate review,
resolve applicable P0-P3 and finish final verification; disclose unexecuted checks.

For this package task, additionally permit new task-local runtime and creation/
checkpoint updates of the following required pip-handoff-v2 report, beyond the
bug command's usual documentation permissions:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230827Z-bootstrap-fix/handoff.md
Use Summary, Changes, Checks run and nonempty Gaps. Keep its runtime under the same
new run folder; all source/test edits stay in pipdata. Preserve prior evidence.
Record source SHA, modified paths, installation provenance and red/green results.
Do not claim a working-tree fix is an immutable corrected source revision.

All direct/indirect writes stay on E:; configure temp/home/R/profile/cache/log
paths BEFORE children and inspect hooks/resolved destinations. Use dedicated
libraries, suitable existing dependencies and recorded provenance; no ambient
contributed fallback, downloads, shared libraries, production/live DLW/client
changes, original-Plan/pin/charter/roadmap/design edits or Git mutations. A later
commit and fresh survey attempt need their own explicit execution instructions.

Minimal first: smallest complete fix; safeguards only for almost-irreversible
failures; one functional check per change; installed tools, dependencies only
when worth their cost; Plans about two pages. Estimated 45-90 minutes excluding
required command confirmations or dependency blockers. Ask only for those gates,
protected/scope decisions or almost-irreversible actions. Report the next concrete
development owner/action if anything remains unresolved.
```
