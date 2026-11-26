# Plan the installed auxiliary save check

**Superseded before pickup.** Do not start work from this assignment. The
verification will be planned directly from the existing `pipsystem` checkout,
not routed to a `pipaux` session. The original assignment is retained below
for the record only.

## Setup

- **Project Name:** `pipaux`
- **Suggested Session Name:** M2 Auxiliary Save Plan
- **Branch:** current — `PROD`; existing
- **Worktree Requirement:** No — existing checkout at `E:/PovcalNet/01.personal/wb384996/PIP/pipaux`
- **Model Family Recommendation:** Standard — focused integration planning
- **Effort:** medium
- **Target Project:** `pipaux` — `E:/PovcalNet/01.personal/wb384996/PIP/pipaux`
- **Target Environment:** existing `PROD` checkout at that path
- **Target Agent:** Code mode

## Task

```text
/cg-plan deviate:auto

Plan only. Prepare a short, reviewed Plan to verify the installed pipaux
producer save path for 20260401_TEST, using COL_2010_GEIH_INC_GPWG as the
downstream target. Read package instructions. Verify the registered repo
and actual checkout E:/PovcalNet/01.personal/wb384996/PIP/pipaux, existing
PROD, full starting HEAD 43019562c0fad92038124fd6603257c8e0660997. Stop on
mismatch. Do not switch branches, create environments or disturb other work.
Current Plan: NONE for this verification. Create revision 1 at
.cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md. Use the
completed .cg-docs/plans/2026-10-30-m2-aux-stamp-cpi-ppp-pfw.md as guidance,
not as a Plan to reopen. Use Compound GPID planning and Plan review; if the
slash workflows are not installed here, read their definitions in the hub's
.kilo/commands/ and follow them as guidance without changing configuration.
Load the shared, technical, data.table, collapse and testing R skills before
reading relevant R implementation or tests.

The fixes passed source-level checks; the experimental inputs do not prove
the installed save path. Read these evidence files relative to sibling
pipsystem at E:/PovcalNet/01.personal/wb384996/PIP/pipsystem:
- .cg-docs/orchestration/outputs/pipsystem/pip-next-global/20261120T191722Z-m2-installed-proof/handoff.md
- .cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pfw-predicate-proof/handoff.md
- .cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-qualified-proof/handoff.md

Plan to verify the already-staged pinned raw inputs and country list, and to
use the exact pipaux review commit 5f5e8531592ca7668b33bbd23564ef90f1c8c688.
Specify how to qualify compatible installed pipaux, pipload, pipfun and Stamp
identities in a fresh private E: library/store, with no ambient fallback.
Identify where pinned local inputs can enter without replacing, mocking or
bypassing the normal save/read path. If any prerequisite is unresolved,
mark it as a blocker instead of inventing a dependency pin or bypass.

For the later run, require one PFW save with a usable version ID and verified
checksum, then a read by that exact version showing one included,
non-alternative Colombia 2010 GEIH income mapping and national CPI, PPP and
population settings. Only if PFW passes, use the same path for population
and verify one finite positive national Colombia 2010 key. Stop on the
first failure and record the exact error; dependent checks are NOT RUN.
Do not rebuild CPI/PPP, select a PPP vintage, run the survey or reopen B6.

Scope now: Plan and review only. No R, tests, package installs or source
edits, downloads, shared access, Git mutations, release or pipeline work.
Execution needs separate approval after review. Proceed with authorized
planning without routine questions; ask only for near-irreversible,
protected/Decided, scope, Git, non-generated deletion or out-of-scope work.
Minimal first: smallest complete check, one functional check per output,
safeguards only for near-irreversible failures; defer the rest to Later.
Use installed tools, no new dependencies, and keep the Plan about two pages.
Verify that all direct and indirect writes resolve to E:, including scratch,
temporary files and caches. Preserve prior evidence and record each repo HEAD.

Create and finalize a pip-handoff-v2 with Summary, Changes, Checks run and
nonempty Gaps at this exact unused path:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipaux/m2-installed-save-proof/20261120T205240Z-plan/handoff.md
Start it as running after verifying the checkout. Use UTC in records and
ET in chat. Do not overwrite another run. Estimated planning: 15–25 minutes.
```
