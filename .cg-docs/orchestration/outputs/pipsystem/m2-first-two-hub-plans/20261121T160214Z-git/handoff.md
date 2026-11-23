---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-git
status: completed
updated: 2026-11-21T16:05:44Z
owner: git reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: .cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md revision 4 (worker reference)
next: Coordinator incorporates this review on Task return and records the fixes as prerequisites for reuse, not as observed historical failures.
---

# Auxiliary proof Git review

## Summary
One P2 and one P3, both about reusing the retained scratch harness. No P0/P1
or evidence of an owned tracked/package change or sensitive-data exposure in
the three reviewed files. This does not certify historical runtime behavior.

### Findings

**[P2]** `.tmp/m2-aux-save/20261121T153507Z-diagnosis/run.py:581–610` — the verified archive need not be the complete install input.

**Issue:** The launcher checks the archive hash but extracts into `sources/<package>`
without requiring the package destination to be absent. Extraction overlays archive
entries and leaves extra pre-existing files in place; `R CMD INSTALL` then consumes
that tree. This is a replay/provenance gap, not evidence of a contaminated install
in the worker's reported fresh run.

**Fix (manual, before reuse):** Refuse an existing package extraction destination
or extract to a fresh private E: path and install only from it; do not clean the
retained tree. Functional check when separately authorized: a synthetic pre-existing
target must stop before install, and a fresh target must install normally with the
existing tools. No new dependency or pinning framework is needed.

**[P3]** `.tmp/m2-aux-save/20261121T153507Z-diagnosis/aux-proof.R:79–83` — a new proof attempt can overwrite prior origin evidence.

**Issue:** The two origin TSVs use fixed names directly under the diagnosis root.
The launcher reserves distinct attempt logs and stores (`run.py:302–306,625–631`),
but a later suffix still writes to the original TSV paths.

**Fix (advisory, before reuse):** Use fresh attempt-specific origin TSV paths under
the resolved E: run and refuse collisions. If executed later with authorization,
confirm the second attempt writes its own snapshots and leaves the first unchanged.

## Changes
This report only; no script, worker report, tracked file, package or Git changes by
this reviewer. No commits or staging.

## Checks run
- Loaded all five required R skills before opening `aux-proof.R`. Read the two
  scripts and the worker `20261121T153507Z-stamp/handoff.md`. No runtime check.
- Verified pipsystem `main` at `1821c5526337d03b87a9e61ad934b3c7316c16cf`
  at start and end and the fresh resolved E: report path. Scoped status, ignore,
  index and HEAD-tree checks: both scripts are ignored by `.gitignore:36`; both
  handoffs are untracked, not ignored; none of those four paths is in the index
  or HEAD. Hub status already showed unstaged changes outside the owned scope;
  no staged changes were reported. Leave unrelated changes alone.
- E: package Git metadata only; compared current branch and full HEAD to the
  handoff at lines 39–49 and `run.py:29–37,119–133,571–595`:

  | Package | Checkout branch and HEAD | Actual source pin described by the worker |
  |---|---|---|
  | stamp | `ready_cran` `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d` | Separate staged archive SHA-256 `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586`, not a reconstruction from that checkout (worker handoff:70–75). |
  | pipaux | `PROD` `43019562c0fad92038124fd6603257c8e0660997` | Archive commit `5f5e8531592ca7668b33bbd23564ef90f1c8c688` exists. No commit-tree differences under `R/`, `tests/`, `DESCRIPTION` and `NAMESPACE`; the full tree comparison differs only by `compound-gpid.local.md`, present in PROD. |
  | pipfun | `PROD` `7d534516a8c17c33d537681610eccd4c29211762` | Archive pin is the same commit. |
  | pipload | `PROD` `ff9a81e386a09fb2531c154f63fd2b91521313c6` | Archive pin `4ef0d90a974cb6ff0725da69373bde421dd04ad5` exists and is not checkout HEAD. |

- Tracked-status snapshot was clean for stamp, pipaux and pipfun; pipload had an
  unstaged `.gitignore` change, not an input to the commit archive. The code uses
  a commit archive written under ignored scratch, not a checkout or index change
  (`run.py:587–608`). Do not attribute existing dirt to the worker or treat the hub
  as globally clean. No embedded credentials or copied payload bodies observed
  in the three reviewed files. Keep scratch private; ignore is not access control.

## Gaps
- Static and read-only Git metadata checks only. Archive bytes, installed packages,
  payloads, credentials and raw logs were not opened; the scripts, installs and
  V1–V3 were not run by this reviewer. Worker execution and archive hash claims
  are reported evidence, not independently reproduced.
- A status snapshot cannot reconstruct ownership of unstaged changes, rule out
  transient historical Git or filesystem writes, or establish runtime containment.
- Later: defer repo-wide ignore/lockfile audits and broader hardening; neither is
  needed for this scoped diagnostic review.
