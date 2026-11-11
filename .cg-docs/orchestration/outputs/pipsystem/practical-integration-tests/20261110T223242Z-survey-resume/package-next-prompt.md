# pipdata Fresh-master Bootstrap Handoff

## Setup
- **Project Name:** pipdata
- **Branch:** current PROD; existing, verified at handoff preparation
- **Worktree Requirement:** No; existing checkout E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Model Family Recommendation:** Powerful (Sol/Opus); cross-package bootstrap and storage semantics
- **Effort:** high
- **Target Project:** pipdata; E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Target Environment:** existing PROD checkout at E:/PovcalNet/01.personal/wb384996/PIP/pipdata; observed HEAD 13a38280c1eafe7e03a97837cdb57833fbe9d926
- **Target Agent:** Code mode

Model family and effort are user setup advice only; examples are suggestions, availability varies by platform/date and the user chooses. No branch/worktree, Git, package execution or model change is authorized until the task is submitted in the target session.

## Task
```text
Diagnose and fix the smallest pipdata first-run bootstrap defect that blocks the
original installed-package one-survey example. Verify the existing pipdata root
E:/PovcalNet/01.personal/wb384996/PIP/pipdata and PROD branch; expected starting
HEAD 13a38280c1eafe7e03a97837cdb57833fbe9d926. Report mismatches without switching
or creating environments. Preserve unrelated changes. No Git mutations.

Read pipsystem evidence under
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/:
- .cg-docs/orchestration/outputs/pipsystem/practical-integration-tests/20261110T223242Z-survey-resume/implementation/handoff.md
- experiments/one-survey/reproduce.R
- .tmp/one-survey/resume-20261110-correction1/logs/reproduce.log
- .cg-docs/plans/2026-11-09-installed-package-one-survey-example.md (revision 1)

The executed minimal public call uses one real completed-valid inventory row
and a separate fresh TEST store:
pipdata::pd_process_data(inv = inv, bootstrap = TRUE, verbose = FALSE)
It fails before processing with No version files found in
'pip_master_inventory.qs2'. st_versions confirms zero master versions.
R/pd_process_data.R:108-120 loads the master at line 114 before execution
preparation receives bootstrap. Pinned pipload ff9a81e386a09fb2531c154f63fd2b91521313c6
delegates the absent read at R/load_pip_data.R:327-360. Diagnose ownership before
editing; do not change pipload or other packages here.

Implement only the confirmed pipdata bootstrap handling and focused regression
tests. Distinguish trustworthy empty first-run state from arbitrary read errors.
Do not mask corrupt/inaccessible history, fabricate a populated master in the
example, call internal workers to bypass the public path or weaken assertions.
Establish a failing regression, install/test the actual candidate source in a
fresh isolated runtime, run affected existing tests and independent quality/testing
review, and report remaining failures. Do not modify the original Plan, source
pins, charter/design/roadmap or resume its full scenario in this package task.

The original example has seven exact source pins recorded in setup.R. Only
pipfun was updated to 7d534516a8c17c33d537681610eccd4c29211762. Corrected setup
passes with suitable preinstalled qs2/stringfish/RcppParallel from 4.5-pipapi;
the earlier native loader failure is separate, preserved and not a pipdata bug.
Real public validation classified SYNA valid and missing-weight SYNB invalid
with its exact diagnostic and zero execution failures. Cleaning/numerical and
exact clean-data/metadata readbacks remain unexecuted; do not claim those pass.

All direct/indirect writes must stay on E:, within pipdata for source/tests and
the exact pipsystem report/run folder below for reports/runtime. Redirect TEMP,
TMP,TMPDIR,HOME,R libraries/profiles/caches/logs before every child; no contributed
ambient fallback, downloads, source-library edits, shared/production/live DLW
changes, commits, pushes, merges or new sessions/worktrees. Inspect startup hooks
and resolved paths before writes; use installed tools/dependencies with provenance.

Create immediately and update at checkpoints/exit a pip-handoff-v2 report at:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/practical-integration-tests/20261110T230423Z-bootstrap-fix/handoff.md
Include Summary, Changes, Checks run and nonempty Gaps. Record initial/final SHA
and status, exact modified files, red/green test evidence, source installation
provenance and unresolved blockers. Preserve earlier outputs. UTC in files, ET
in chat. A fixed working tree is not a corrected immutable source pin; commit
and later experiment-pin changes need separate explicit authorization.

Minimal first: smallest complete fix; safeguards only for almost-irreversible
failures; one functional check per change; installed tools, dependencies only
when worth their cost; Plans about two pages. Ask only for protected/scope
decisions, almost-irreversible actions or required command gates.
```
