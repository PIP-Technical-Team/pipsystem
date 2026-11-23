---
schema: pip-handoff-v2
project: pipsystem
task: whole-project-sequence
run: 20261120T212419Z-m2-alignment
status: completed
updated: 2026-11-20T21:26:30Z
owner: pip-orchestrator
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: NONE
next: On planning go-ahead, prepare the installed auxiliary proof and the bounded survey acquisition route from pipsystem in parallel.
---

# M2 alignment: auxiliary checkpoint and survey preparation

## Summary

Use the published `pipaux` validator checkpoint for the isolated proof; the
local `PROD` history is not a blocker. Expand the second M2 step to include
an actual one-survey DLW download, validation, cleaning, save, and versioned
readback before deflation. This records the proposed sequence, not an approved
execution Plan. No Git or runtime changes are in scope.

## Changes

This handoff only. No branch or worktree, checkout change, stash, package
edit, staging, commit, push, PR, installation, test, download, shared-store
access, or process/session start. No branch protection change.

## Checks run

Verified the hub root, branch, HEAD and report parent path on E:. Ran the
official `pipaux` status and read-only Git comparisons of refs, histories,
committed trees, index, and untracked paths. Checked the attached session's
claims against the saved checkpoint record and current local Git state.
Agent Manager listed Project status inquiry and PIP pipeline development
continuation as idle; this is not an off-platform process inventory.
Reviewed the relevant `pipdata` tracked source at the SHA below, published
coordination reports, and M2 umbrella. No live GitHub refresh or runtime check.

## Step 1 — Verify installed auxiliary saves without touching PROD

Observed at the registered `pipaux` checkout (`tools/pipsys/packages.csv:4`):

| Ref or area | Observation |
|---|---|
| Local `PROD` | `43019562c0fad92038124fd6603257c8e0660997`; two ahead and zero behind cached `origin/PROD` (`dca23869fb50d44eda6ccded539c9e30df1e7a53`). Extra commits: `01ff827340a9759dc3d4ef18d31f4e3ba26ff2be` adds `compound-gpid.local.md`; `4301956` adds the PFW/POP validator fix. |
| `origin/fix/m2-aux-validator-checkpoint` | `5f5e8531592ca7668b33bbd23564ef90f1c8c688`. Its fix is patch-equivalent to `4301956`; `R`, `tests`, `DESCRIPTION`, and `NAMESPACE` match exactly. The sole committed tree difference from local `PROD` is the local configuration file. |
| Review base | Review parent `8675cd6ccc77bfcebc53530d60ec39016a318d1a` has the same tree as cached `origin/PROD`; the ancestry differs. The proposed review diff is only the two validator source files and three test files. |
| Working tree | No staged or modified tracked files. Seven untracked test harness/cache/log files under `.tmp/m2-validator-corrections/`; normal status groups them as one `.tmp/` entry. Preserve them. |

This matches the [prior checkpoint handoff](../../m2-checkpoints/20261119T232046Z-sync-publish/handoff.md#L31-L70),
which records live remote verification at publication time. This check used
the local remote-tracking refs, not live GitHub. Recommend using an archive
of exactly `5f5e853` to build/install in a private E: library when approved;
do not build from the official working directory, push local `PROD`, or try
to merge the duplicate patch into it. Later, review the existing branch
against fresh upstream `PROD` before any separately approved PR; reconcile
local history and enable branch protection separately. No merge is required
for the local proof.

For the approved run, pin compatible installed `pipaux`, `pipload`, `pipfun`,
and Stamp identities. In a private TEST store, use normal installed calls to
save PFW and read back its exact version with a verified checksum and one
included national Colombia 2010 GEIH income mapping. Only then repeat for the
population file and verify the positive national 2010 key. Preserve retained
CPI/PPP inputs; do not repair shared historical pins. Existing source tests
and experimental keys are not installed save proof ([producer handoff](../../../pipaux/m2-aux-inputs/20261119T222645Z-validator-corrections/handoff.md#L60-L93),
[joint log](../../m2-aux-inputs/20261119T215954Z-local-boundary/joint-verified.log#L23-L26)).

## Step 2 — Prepare the actual survey before deflation

Code inspected in `pipdata` at `c70ae403acde648aff1a49d8d3178ca0202c6064`;
the cited source files matched HEAD. Unrelated working-copy changes (including
the B6 delta in `R/dependency_inputs.R`) were left untouched and are not inputs
to the proposed run.

1. **Set up and select one source file.** Pin installed dependencies and
   isolated TEST paths, including the raw download, inventory, logs and store.
   Confirm approved DLW access and pin the exact filename, master and
   harmonization versions, and catalog checksum for GPWG: prior inventory
   identifies `COL_2010_GEIH_V04_M_V01_A_GMD_GPWG`, expected PIP ID
   `COL_2010_GEIH_INC_GPWG`. Do not assume the current catalog still matches
   or substitute ALL/latest (inventory handoff `:67-86`;
   `pipdata/R/pipdata_dlw_compare.R:1156-1184,1230-1262`).
2. **Download the harmonized GPWG payload through `dlw`.** Use the real
   acquisition path that calls `dlw::dlw_get_gmd()` with the exact version and
   filename. Keep downloaded data in the approved isolated area, not Git.
   Check that the obtained file matches the pinned identity and expected
   checksum, record acquisition status, run GPWG validation, and do not pass an
   unavailable, ambiguous, mismatched or invalid file to cleaning. The
   one-survey helper is internal in the inspected source; verify a supported
   public route for the Qmd, rather than pointing the general wrapper at the
   whole inventory or using a private call as the public interface
   (`pipdata/R/pipdata_get_gmd.R:503-565,1409-1487`; `pipdata/NAMESPACE:59-65`;
   M2 umbrella `:304-314`).
3. **Clean and validate.** Use the saved PFW survey settings and pinned
   recoding/validation rules. Format welfare to local currency per day,
   preserve row identity and weights, and check the clean schema, units and
   keys before saving. No silent imputation or successful output for invalid
   data (`pipdata/R/pd_process_data.R:264-295`,
   `pipdata/R/pd_dlw_clean.R:183-209,621-672`; M2 umbrella `:316-326`).
4. **Save and read back.** Save clean survey data and its corresponding
   metadata through the normal versioned writer. Record both version IDs and
   hashes; load the matching pair by those exact versions and check identity,
   welfare, weights and provenance. Prior inventory pins are reference
   evidence only, not a substitute for this download/clean/save proof
   (`pipdata/R/pd_process_data.R:287-306`,
   `pipdata/R/pd_metadata_refresh.R:120-140`, `pipdata/R/save_pip.R:104-127`).
5. **Only then deflate.** Bind the exact clean/metadata and auxiliary versions
   in the calculation store. Confirm CPI, PPP and population coverage and
   the weight rule. Select one eligible 2021 PPP vintage explicitly; equal
   factors do not make the two vintages interchangeable. Preserve welfare in
   local currency per day and verify the `welfare_2021` result and final
   weights (`pipdata/R/pd_deflation.R:138-210`; joint log `:4-7,23-26`).

The [synthetic acceptance](../../script-first-approach/20261113T223219Z-qmd-acceptance/handoff.md#L39-L58)
recorded seven passes including clean and metadata readback. That is not a
live download, a real survey pass, or a reason to skip any of steps 1–4.
Keep each acceptance boundary and its current-run status visible in
`experiments/pip-pipeline.qmd`; a failure leaves dependent work NOT RUN.

## Parallel work

- Recommend parallel planning from `pipsystem`: the installed `pipaux`
  proof on the exact clean archive and a read-only `pipdata` acquisition
  preflight (one-file entry point, DLW access and pin requirements, TEST
  paths, expected save/readback). A separately authorized download could
  overlap the auxiliary proof only if explicit selection is fixed and its
  raw/inventory writes are isolated from the auxiliary writer, including any
  runtime aliases or caches. No real download or parallel write is ready on
  this source evidence alone. The clean-save/metadata/deflation path must
  wait for its verified parents in the intended store; PFW precedes the POP
  check in the bounded auxiliary proof.
- The B6 writer trace can be read-only and independent using the retained
  diagnostic and matching installed source. Keep it off the M2 path; no
  repeat writer, checkout edit or shared-store action. The observed writer
  returned no version and zero catalog rows; the root cause and relevance
  to the M2 installed runtime are not established (checkpoint handoff
  `:20-29`; B6 handoff `:23-30` in the checkpoint link).
- Read-only review of the existing `pipaux` review diff does not require
  local history cleanup and need not delay either preflight. No assignments
  or additional sessions were started.

## References

- [M2 umbrella](../../../../../plans/2026-10-10-m2-walking-skeleton.md#L290-L340)
- [Prior whole-project draft](../20261120T205936Z-alignment/handoff.md)
- [Survey inventory handoff](../../qmd-real-data-setup/20261116T194917Z-col-geih/handoff.md#L67-L86)
- [Installed proof assessment](../../pip-next-global/20261120T191722Z-m2-installed-proof/handoff.md#L59-L76)

## Gaps

- Live GitHub tips, a supported public bounded route in the installed
  runtime, active DLW access, exact current filename/checksum, and authorized
  private runtime/store remain unverified. No real survey data was read.
- Installed PFW and POP saves, the real download, cleaning, save/readback,
  same-store binding, PPP vintage selection and real deflation are NOT RUN.
  The M2 work remains pending further planning and separate run approval.
