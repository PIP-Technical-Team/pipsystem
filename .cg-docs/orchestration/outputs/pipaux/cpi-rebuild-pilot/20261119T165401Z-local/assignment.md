# Setup

- **Project Name:** pipaux
- **Suggested Session Name:** Isolated CPI Rebuild Pilot
- **Branch:** current `PROD`; existing, no branch changes
- **Worktree Requirement:** No; existing checkout `E:/PovcalNet/01.personal/wb384996/PIP/pipaux`
- **Model Family Recommendation:** Standard, for a bounded data rebuild and verification
- **Effort:** medium
- **Target Project:** pipaux, `E:/PovcalNet/01.personal/wb384996/PIP/pipaux`
- **Target Environment:** existing `PROD` checkout at `E:/PovcalNet/01.personal/wb384996/PIP/pipaux`; execution in a fresh isolated R process
- **Target Agent:** Code mode

# Task

```text
Run the approved CPI-only rebuild pilot: produce and verify one new local
snapshot from approved CPI inputs, without touching the shared store.
Plan: NONE for this isolated pilot; no package or design changes are assigned.

Verify this existing Git checkout before writing the run report:
E:/PovcalNet/01.personal/wb384996/PIP/pipaux
Branch PROD; starting full HEAD 01ff827340a9759dc3d4ef18d31f4e3ba26ff2be.
Stop on mismatch; do not switch or create a branch/worktree. Read the package
instructions and applicable R shared, technical, data.table, collapse and
testing skills. Keep the current sessions and installed libraries unchanged.

The historic CPI snapshot (dbd2ccf63260991d) has no usable stored byte checksum.
The prior read-only diagnostic is evidence, not an instruction to reuse those
possibly valid but uncertified bytes as raw input:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/qmd-reconciliation-eligibility/20261119T162506Z-pin-diagnosis/handoff.md

1. Identify already approved, exact CPI raw inputs and country-list inputs.
   Record their provenance and immutable identities. Only read authorized,
   already staged local inputs, not the production store, unpinned current
   data, credentials or private sources. If an input is missing, stop with
   the exact input and source reference needed; do not guess or download it.
2. Trace the existing CPI clean/validate/save path at the verified SHA
   (R/aux_cpi.R:135-137,163-183,239-260; R/utils.R:472-566). Require an
   explicitly confined route before any package load or producer call:
   R/zzz.R:16-39 defaults to Y: and caches context at load. Do not run the
   default updater, bootstrap a release or use a shared alias. Use the
   existing CPI transformations and validators in a fresh R process with
   the exact local inputs and output root. If isolation cannot be proved
   without changing package behavior, report the blocker instead of bypassing
   it. Use the existing locally qualified Stamp build as a read-only input:
   E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/20261119T151908Z-tool-qualification/qualified-stamp.R
3. Write one candidate to a fresh short directory under pipsystem/.tmp on E:.
   Use explicit local Stamp storage and record a persisted byte checksum at
   save time. Verify the returned version by exact readback, verify the
   recorded checksum against the retained bytes, and use the existing CPI
   validation to check schema, key uniqueness and expected numeric behavior.
   Use aggregates in logs/reports. Treat the result as a new pilot snapshot,
   even if content matches; never reuse the historical pin as a claim of
   identity or promote it to the release.

Keep every write, including child temp/home/cache/config/log and data outputs,
inside pipsystem on E:. No Git changes, package edits, downloads, installs,
shared/production calls or writes, credential access, publishing, other
measures, or surveys. Only stop for a genuine scope or safety blocker; no
routine reapproval. Minimal first: smallest working end-to-end pilot, one
functional check per change, existing tools, deps only when worthwhile, Plans
about two pages. Extra safeguards only for almost irreversible harm; defer
reversible extras. Estimated time: 20-40 minutes if inputs are ready.

Write the running, checkpoint and final pip-handoff-v2 to this unique path:
E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/orchestration/outputs/pipaux/cpi-rebuild-pilot/20261119T165401Z-local/handoff.md
Use project pipaux, task cpi-rebuild-pilot, run 20261119T165401Z-local, UTC
timestamps and a nonempty Gaps section. Recheck HEAD at the end. Record sources,
runtime, script/log paths, output ID, checksum and checks or exact blocker.
Do not save raw production data or credentials in reports. Return the exact
handoff path and outcome so the parent can verify it directly.
```
