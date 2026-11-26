---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T160214Z-safeguards
status: completed
updated: 2026-11-21T16:05:59Z
owner: safeguards static reviewer
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: Coordinator records the historical private TEST result and retains the manual boundary for any future rerun.
---

# M2 auxiliary diagnosis safeguards review

## Summary
Static review complete: **two P1, three P2, no P0**. Retained evidence supports
the historical private TEST run, not a guarantee of E:-only writes or offline
access for a future rerun. The only immediate safeguards are manual conditions
for a future execution; no `safe_auto` change or rerun is recommended.

Source references below are relative to
`.tmp/m2-aux-save/20261121T153507Z-diagnosis/`. The prior report is
[the Stamp handoff](../20261121T153507Z-stamp/handoff.md#L35-L110), under the
[r4 Plan](../../../../../plans/2026-11-20-m2-installed-auxiliary-save-proof.md#L129-L175).

### Safeguards before any future rerun

- **[P1.1]** [cg-adversarial] `run.py`:60–77,297–315,435–461; `aux-proof.R`:79–83,119–120,131–149 — Path checks do not cover every actual write.
  **Attack vector**: A retry reuses a directory with stale output entries, or another process can change the tree after preflight.
  **Impact**: A write can replace retained evidence or reach an unintended file. A clean drive prefix and reparse-point check do not protect an existing hard-linked file or keep a checked directory unchanged until use.
  **Proof**: Python checks two planned descendants before launch, but the runtime mirror copies to individual destinations with overwrite semantics. The R origins table writes directly to a fixed filename; package setup is called before the returned folders and alias are checked. The opening check rejects `.stamp`, not a generally nonempty store.
  **Fix** (`manual`): For a separately authorized attempt, keep this tree untouched. Use a fresh, single-owner run directory on fixed E: with verified non-reparse ancestry and absent output leaves; stop rather than run against reused, redirected or concurrently writable destinations. Keep that precondition ahead of setup, not just ahead of the first artifact save.

- **[P1.2]** [cg-adversarial] `run.py`:80–116,224–249,294–307; `aux-proof.R`:103–135,140–149,153–157 — The job and fetch bindings do not enforce the side-effect boundary.
  **Attack vector**: Installed startup, namespace or setup code performs I/O outside the configured paths or the two bound fetch functions.
  **Impact**: If the launching account can reach shared or production storage, credentials or the network, a child can still use that access. The historical receipts cannot certify otherwise.
  **Proof**: The job sets kill-on-close, not filesystem or network restrictions. The environment sets defaults, the R allowlist covers only the two named `pipfun` bindings, and namespace/alias assertions follow the corresponding load/setup calls.
  **Fix** (`manual`): Retain this as private historical evidence. If another execution is separately authorized, use an existing restricted context that permits the intended private E: writes and excludes shared/production writes, credentials and live fetch; if unavailable, do not rerun. No new sandbox or dependency is proposed.

### Later — private-run reliability and proof quality

- **[P2.1]** [cg-adversarial] `run.py`:119–129,198–214,247–280,314–315,589–593 — Exceptional cleanup does not produce a reliable receipt.
  **Attack vector**: Process assignment or timeout diagnostics fail; for example, the fixed-size process diagnostic query may fail on an unusually large job.
  **Impact**: Cleanup may occur without a result, so a missing JSON file cannot distinguish no launch, confirmed cleanup or unknown cleanup. The unassigned-child branch requests termination without waiting, and an exception there skips subsequent handle closes. The separate Git calls have direct-process timeouts, not Job Object receipts.
  **Proof**: A diagnostic exception still runs `stop_job`, then bypasses the zero-active wait and return; the caller writes the result only on return. A normal historical timeout did record exit 124 and zero owned remaining (`log/exit-direct-rlang.result.json:3–17`).
  **Fix** (`advisory`): If reused, make diagnostics best-effort, independently guarantee job-handle closure and bound the wait for an unassigned child. Preserve the original failure and record confirmed/unknown cleanup in the existing result format; keep Git outside any claim about managed R descendants.

- **[P2.2]** [cg-adversarial] `aux-proof.R`:162–180,181–204 — An unknown skip state is accepted.
  **Attack vector**: The save result has a valid version/path but its skip indication is absent, `NA` or the wrong type.
  **Impact**: The state and hash checks can still pass without the receipt proving that the call reported a new, non-skipped write, as required by r4 lines 101–105. No false pass was demonstrated in the retained run.
  **Proof**: `!isTRUE(saved$skipped)` accepts all three cases. The remaining checks bind a version to bytes and content, but do not recheck that status.
  **Fix** (`advisory`): Check the pinned receipt contract and require its exact affirmative new-write state, rejecting unknown or malformed state. Retain the independent catalog, current/retained byte and exact-read checks.

- **[P2.3]** [cg-adversarial] `run.py`:511–521,571–610,613–631; `aux-proof.R`:50–75 — Proof can rehash an incomplete identity manifest without failing.
  **Attack vector**: A retained Stamp hash list is empty or incomplete, or the reviewed source list contains only a header when a proof is resumed.
  **Impact**: The corresponding qualification is skipped wholly or in part even if the already installed libraries let the functional proof continue. Archive hashes and namespace location do not re-attest mutable installed PIP bytes.
  **Proof**: The two proof loops check only present rows, without comparing them to the required identities. The installation code defines three package names and emits a fixed Stamp file set.
  **Fix** (`advisory`): If resumed proof is retained as a supported route, require the expected unique identities before hashing. For fresh private runs, keep install and proof together and do not add a new provenance system.

## Changes
This handoff only. No source, store, package, Git or Plan changes.

## Checks run
- Read-only Git verified the hub root, `main` and full HEAD before and after
  review. The scripts are ignored local evidence, not contents of that commit.
  Checked the fresh report ancestry and the existing proof launcher, library
  and store-ancestor metadata; E: is fixed NTFS and none of the inspected
  components was a reparse point at inspection time.
- Loaded all five required R skills before reading R. Traced dispatch through
  mirror/recovery/staging/install and the successful proof (`run.py`:434–471,
  494–659): clean E: R and private library, preflight and Job Object,
  fetch-only binding, TEST setup, then country list → PFW → population with
  current and retained checksums and exact reads (`aux-proof.R`:124–241).
- Corroborated historical usage with selected metadata only:
  `log/aux-proof-test.pre.json:3–7,59,76–79` identifies E: Rscript, the R
  script and `store-test`; `log/aux-proof-test.out:14–15,21–22,30–31` records
  three hash binding passes and V1–V3; `log/aux-proof-test.result.json:3–9`
  records exit 0, no timeout, zero owned remaining. No execution, tests,
  credential reads or data payload reads in this review.

## Gaps
- No OS-wide trace, access-control audit, rerun, adverse-path execution or
  independent store rehash. The prior handoff reports that the successful
  proof used E: R and that separate historical controls used stock C: R;
  no C: paths were opened for this review. Neither historical result proves
  universal containment or absence of writes outside the declared paths.
- Package sources and native runtime internals were not opened. Package SHAs
  are historical provenance from the Stamp handoff (lines 39–49), not fresh
  verification. The exact non-skipped field contract and exceptional cleanup
  behavior remain unverified at runtime. No live/shared or downstream evidence.
