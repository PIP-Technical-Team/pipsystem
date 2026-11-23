# pipsystem

Design, evidence and project coordination for the PIP data pipeline. The project aim is to rerun only the work affected by a data or code change. This repository is not the production pipeline runner.

## Start Here

[**Open the user wiki**](wiki/README.md) for a plain-language guide to working with `pipsystem` and its `pip-orchestrator` agent.

- [Daily workflow and example messages](wiki/usage.md)
- [Configuration, permissions and project boundaries](wiki/configuration.md)
- [Optional task commands and documentation maintenance](wiki/cli-reference.md)

For M2, work from `pipsystem` with `pip-orchestrator` and Compound GPID. The
hub can coordinate authorized package work without separate package sessions;
package code and tests stay in their owning repositories.

Sources: [Project Charter](compound-gpid.md), lines 10-33; [Orchestrator Rules](ORCHESTRATOR.md), lines 7-45 and 81-110.

## Rebuild the M2 workstation

This guide reconstructs the development setup on an approved Windows computer
with World Bank intranet access. The Git checkpoint restores source, portable
project settings and selected evidence; it is not a machine image. GitHub is
public. Never put tokens, internal share paths, raw survey files, private TEST
stores, credentials, unreviewed logs or Kilo session state in a GitHub branch.

### 1. Restore the checkout and the directory layout

Use the `docs/m2-machine-migration` branch of
`https://github.com/PIP-Technical-Team/pipsystem.git`. The checkpoint is based
on `1821c5526337d03b87a9e61ad934b3c7316c16cf`; use the checkpoint commit from
the handoff, not that earlier base. This does not change remote `main`. If the
branch advances, verify the expected checkpoint SHA before continuing.
On the new machine, make a fresh clone selecting the migration branch, then
rename that **local** branch to `main` before running `pip-orchestrator`,
which expects `main`. Keep its upstream pointing to the migration branch;
do not push the local `main` to remote `main` or replace an existing checkout.

For an exact path match, create a local fixed `E:` tree at the paths in
[`tools/pipsys/packages.csv`](tools/pipsys/packages.csv). Clone `pipsystem`
and the PIP packages as siblings inside its `PIP` directory. Stamp is under
the neighboring `Rpackages` directory. Do not use a junction to `C:`, a
network mount, or a sync folder for the work trees or TEST storage. The
registry, current coordinator instructions, `pipsys.cmd`, and the old
one-survey launcher have drive/path assumptions. If the new machine cannot
match the layout, stop before running the launcher; use a bounded path-port
change and verify the resolved registry, config permissions, runner paths,
and write roots together. Do not globally replace paths in historical records.

The following are the source pins for the next M2 work, not an instruction
to install whichever upstream branch happens to be current. Fetch the
listed refs or obtain an approved archive, compare the full SHA, and install
from the committed source rather than a dirty checkout.

| Package | Source to restore | Exact source identity / use |
|---|---|---|
| `pipaux` | `PIP-Technical-Team/pipaux`, `fix/m2-aux-validator-checkpoint` | `5f5e8531592ca7668b33bbd23564ef90f1c8c688`; use this ref, not local `PROD` |
| `pipdata` | `PIP-Technical-Team/pipdata`, `fix/m2-cpi-admission-checkpoint` | `c70ae403acde648aff1a49d8d3178ca0202c6064`; one-file baseline, not a one-file fix |
| `pipload` | `PIP-Technical-Team/pipload`, `feat/m2-stamp-adapter` | `4ef0d90a974cb6ff0725da69373bde421dd04ad5`; installed proof pin, not the old checkout's `PROD` HEAD |
| `pipfun` | `PIP-Technical-Team/pipfun`, `PROD` | `7d534516a8c17c33d537681610eccd4c29211762` |
| Stamp | `randrescastaneda/stamp`, `ready_cran` for source inspection; obtain the qualified archive separately | Checkout `db1b29cd248a3a6cb737c71db176ae6bd76d2a1d` is **not** the archive identity. Proof used `stamp_0.1.1.tar.gz`, SHA-256 `96e2da264618fc0dc1feae10c6a0bdb098b00a82c58aea9e9b4e43bb90f8f586`. |
| `dlw` | `worldbank/dlw`, approved GitHub organization access | `12faa058b521ef511073a7b21b1b1dd7993c9649`; inspected for the one-file contract, not live-tested |

Other registered checkouts are not prerequisites for the first DLW access
check. The old workstation recorded: `pipster` `828064e406e07e711c34d2ba725746e367d35f9b`,
`pipapi` `280af151d05902a550d5dea18cd4bf1a3d013239`,
`wbpip` `fd2c687ed527ebe33d0a7addf9859f72f71ff39f`,
`pipfaker` `f7e48defc9ce868df7667c846d5087ff947ab44e`, and
`metapip` `c4be592ac9008749dcb13627510ac24ccbeea2ed` (GitHub organization
`PIP-Technical-Team`). These are local checkout SHAs; remote availability
was not checked. A missing pin is a migration gap, not permission to use a
different source silently.

### 2. Rebuild tools and project configuration

1. Install the approved Windows x64 tools: Git, PowerShell 5.1 or later,
   R **4.5.2**, Python **3.12**, and your usual Kilo host. GitHub CLI is useful
   for GitHub access checks; Quarto is needed only for notebook rendering.
   The exact IDE/Quarto build was not pinned. Use the Rtools release for R
   4.5 if an approved dependency needs compilation.
2. Install [Compound GPID v1.3.0](https://github.com/GPID-WB/compound-gpid/tree/v1.3.0)
   using the [Windows installation guide at that tag](https://github.com/GPID-WB/compound-gpid/blob/v1.3.0/docs/installation.md).
   The tag resolves to `f4c4295365f7b49ad3830c73ac0afce9b3f3915d`.
   Clone the tagged release under a local `E:` folder and run its installer
   as the workstation owner. Retain the `v1.3.0` release pin in the
   framework's `.cg-version` instead of the installer's `latest` default.
   Restart the terminal so it sees the new command wrappers. Do not copy
   the old `.compound-gpid/` directory or its ownership manifests.
3. From the new `pipsystem` checkout, use Compound GPID's link check with
   platform `kilo`, then link that platform. Preserve any reported
   user-owned collision; do not force an overwrite. The original machine
   reported a collision on its edited `.kilo/kilo.json`, a reason to project
   cleanly on the new machine rather than copying installed files. If you
   also bring other adapters, follow the pinned framework's guidance on
   its `cg-kilo` launcher and compatibility checks.
4. Install the repository's custom PIP command and agent definitions using
   the `install-kilo` action of [`tools/pipsys/pipsys.cmd`](tools/pipsys/pipsys.cmd)
   after `Rscript` is on `PATH`. The tracked sources are
   [`tools/pipsys/kilo/`](tools/pipsys/kilo/). Restart the editor, select
   `pip-orchestrator`, and verify Compound GPID and PIP commands are visible.
   The root [`kilo.json`](kilo.json), [`AGENTS.md`](AGENTS.md),
   [`ORCHESTRATOR.md`](ORCHESTRATOR.md) and
   [`compound-gpid.local.md`](compound-gpid.local.md) are the portable project
   settings. The old private adapter overlay added `.kilo/AGENTS.md` and
   `.kilo/skills`, ignored `.compound-gpid/kilo-compat-skills/**` in the
   watcher and set `snapshot: false`. Compare with the generated adapter;
   add only missing, approved user preferences through the supported Kilo
   config layer. Do not overwrite a managed adapter. Restore any personal
   `KILO_CONFIG_DIR` from its approved source, not from session or auth state.

### 3. Rebuild the private R environment and inputs

1. Use a fresh, access-restricted, gitignored run directory under `E:`. Map
   its library, R temp/home, DLW cache, logs, legacy output and TEST store
   explicitly before launching child processes. Do not let `PIP_ROOT_DIR`,
   `main_dir`, `DLW_local_dir` or R startup fall back to a shared path or to
   `C:`. `20260401_TEST` is a release label, not a sandbox by itself. The
   old `.pip-local-root` contains a machine-local storage locator; do not
   copy it from Git or recreate it with a shared default.
2. Match the package versions in the [auxiliary dependency manifest](tools/pipsys/migration/aux-r-dependencies.csv)
   with an approved package cache or curated snapshot. This is a version
   inventory, not a lockfile, build-byte guarantee, or live DLW dependency
   manifest. Check `DESCRIPTION` of the pinned `dlw` and `pipdata` versions
   separately. Archive the source pins above and verify approved archive
   checksums. Install from approved artifacts into the private library,
   preserving the matching R minor version and architecture. Check startup
   and exit before tests; record resolved namespace paths, versions and
   source hashes. Run 3 first qualified Stamp, then installed `pipfun`,
   `pipload`, and `pipaux`. A sanitized x64 child must retain the correct
   `PROCESSOR_ARCHITECTURE`; restoring `AMD64` fixed the observed `rlang`
   exit stall on the original host. Do not change system settings or bypass
   normal Stamp install/load checks.
3. Obtain the pinned Stamp archive, staged inputs, and retained TEST
   artifacts only through approved internal transfer or the original
   approved sources. Keep the country list, PFW, and population store with
   its Stamp catalog and sidecars as a coherent unit; verify the file and
   object hashes and the normal exact-version read on the new machine.
   The old store is evidence, not an approved reusable launcher. If inputs
   cannot be transferred, restore the original auxiliary Plan
   `.cg-docs/plans/2026-11-20-m2-installed-auxiliary-save-proof.md` (r4)
   and its review privately, then rebuild in a fresh qualified TEST store.
   A rebuilt artifact can get a different TEST
   version. Keep source provenance and new receipts distinct. Complete CPI
   and PPP binding in the intended store before the survey run; the
   auxiliary pass did not prove all deflation inputs are bound there.

### 4. Move only what Git does not carry

Use organization-approved restricted storage or transfer for any allowed
local evidence needed on the new machine. Leave the original workstation
untouched until that transfer is verified. Do **not** send credentials in a
bundle. Reauthenticate separately on the new computer instead.

| Local-only item | How to recover it |
|---|---|
| Two stashed notebook/setup edits | The original `pipsystem` stash is `c3cec220faa154e1a82008e2d44a2d6038adf289`, based on `feat/auxiliary-recovery-pilot`. Preserve or transfer it privately with its base if exact edits are needed, and inspect before applying on a separate review checkout. The [published notebook checkpoint](https://github.com/PIP-Technical-Team/pipsystem/blob/764f3ef1911f308803c5109fd2916d374960d6aa/experiments/pip-pipeline.qmd) is a reviewed fallback, not the full stash. |
| `pipdata` one-file Plan r2 | Transfer `.cg-docs/plans/2026-11-21-m2-public-one-file-dlw.md` from the owning checkout. Its raw Git blob is `1157e049776049469b2ff60c6ab400e6e7d46a11`. It is not in the pushed `pipdata` code checkpoint. Restore it without importing unrelated B6 source, fixtures, or dirty active-state files. |
| Hub M2 Plans and records | Transfer the auxiliary Plan r4 and the survey preflight Plan `.cg-docs/plans/2026-11-20-m2-one-survey-acquisition-preflight.md` (r2), plus their referenced evidence if needed, via the restricted channel. The public handoff below carries status and gates, not the underlying private receipts and paths. |
| Original proof artifacts and input manifests | In the old hub, the proven private run is `.tmp/m2-aux-save/20261121T153507Z-diagnosis/`; staged TEST metadata is in `.tmp/m2-aux-save/20261121T041012Z-inputs/`. Use the relative `input.tsv`, `sources-verified.tsv`, `dependencies.tsv`, and TEST-store receipts to verify any approved transfer; do not copy the entire `.tmp` tree or replay the old runner. |
| Machine configuration and raw evidence | The old working copy retains unpushed historical logs, scripts, snapshots and local settings. Keep them private; recreate only settings needed for this project. No Kilo recovery/Agent Manager state, profiles with secrets, or local credentials belong in Git. |

### 5. Requalify access without downloading survey data

GitHub organization/SSO access lets you install `worldbank/dlw`. It is not
the DLW API token or the intranet connection. Get the DLW API token via the
approved DLW workflow and inject it privately into the R session that uses
`dlw_set_token()`. Follow the pinned package documentation; never paste a token
into Kilo, a tracked `.Renviron`, shell history or logs. Use a restricted
local cache. Once the relevant read-only access is authorized, verify it
with one GMD catalog query using `dlw_server_catalog()`; report only
success/failure and the sanitized class
of error, not the catalog or auth response. Do not download household data
to diagnose access.

Authentication does not unblock the one-file save path. Obtain versioned
producer evidence that specifies the catalog checksum's algorithm, exact
bytes and encoding, or an approved replacement digest tied to the exact
source version. A locally computed SHA-256 alone cannot supply the expected
digest. Follow the [migration handoff](.cg-docs/orchestration/outputs/pipsystem/machine-migration/20261123T213020Z-checkpoint/handoff.md),
then paste the [Kilo continuation prompt](.cg-docs/orchestration/outputs/pipsystem/machine-migration/20261123T213020Z-checkpoint/resume-kilo.md).

### Gaps

No reconstruction, install, DLW catalog request or live survey run on the
new machine has been verified. Moving the setup does not certify live
network access, supported end-to-end one-file acquisition, or survey results.
