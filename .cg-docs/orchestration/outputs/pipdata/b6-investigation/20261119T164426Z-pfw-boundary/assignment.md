# Observe one synthetic PFW write

## Setup

- **Project Name:** pipdata
- **Suggested Session Name:** Capture PFW Write and Catalog
- **Branch:** current — PROD; existing
- **Worktree Requirement:** No — existing checkout; E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Model Family Recommendation:** Standard — one write with two responses to inspect
- **Effort:** medium
- **Target Project:** pipdata — E:/PovcalNet/01.personal/wb384996/PIP/pipdata
- **Target Environment:** existing PROD checkout at that path; reuse the Code session
- **Target Agent:** Code mode

## Task

```text
/cg-work .cg-docs/plans/2026-11-17-b6-stable-clean-receipt-identity.md review:auto deviate:auto

Verify E:/PovcalNet/01.personal/wb384996/PIP/pipdata, existing PROD and HEAD
53a76e379c81a3ac70b39925954981ae6a691459. Stop on mismatch without switching
or creating a checkout. Preserve pending work and validate revision 2.

Diagnose only the first synthetic pfw receipt in the blocked V3 setup.
Read the prior diagnosis and its linked current/head logs:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/b6-investigation/20261119T151700Z-v3-fixture-diagnosis/handoff.md
Both runs failed receipt verification on the same input. V1/V2 previously
passed; V3 stays blocked. No repeat HEAD comparison or suite rerun.

If saved evidence is insufficient, use one contained R child and one synthetic
pfw write in fresh isolated E: scratch, with the same input, clock and
dependency bytes. Observe the real pipload::pip_write() return or condition
and the stamp::st_versions() response or condition without changing behavior.
If verification never calls the catalog, record that; if needed, do one
read-only lookup for the same write in that child and label it as a probe.
Record the first failure boundary supported by evidence, loaded identities,
and next owner, or UNKNOWN. No second child, code fix or V3 PASS claim.

Load existing R shared, technical, data.table, collapse and testing skills.
Use installed tools and resolve all direct and indirect writes to E:.
Minimal first: smallest complete check; safeguards only for almost-irreversible
harm, otherwise Later; one functional check per change; worthwhile dependencies
only; Plans about two pages. Ask only for irreversible, protected/Decided,
scope, Git, non-generated deletion or out-of-scope actions; otherwise proceed.
No source/test/fixture/Plan edits, installation, Git mutation, pin changes,
distribution or real stores. Do not reopen B6, P1.4, the 19 NOT RUN assertions
or first-save Qmd acceptance. Stamp owns reruns.

Follow the actual review route for new evidence only. Expected data-risk roles:
cg-code-quality, cg-testing, cg-documentation, cg-version-control,
cg-reproducibility, cg-performance, cg-architecture and cg-data-quality;
full adds cg-learnings-researcher and cg-adversarial. Run scoped checks and
reviews, fix applicable report findings and save reports without asking again.
Reviewers may not launch additional R.

After preflight and before R, create and finalize pip-handoff-v2 with Summary,
Changes, Checks run and nonempty Gaps at:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipdata/b6-investigation/20261119T164426Z-pfw-boundary/handoff.md
Record full HEADs, attempt count, evidence and limits. Use UTC. Do not overwrite
a run. Estimate: 15–25 minutes.
```
