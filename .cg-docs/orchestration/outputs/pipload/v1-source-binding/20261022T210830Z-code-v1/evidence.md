# V1 Source-Binding Gate: Evidence

Initial capture window 2026-10-22T21:40:17Z through creation clock 21:41:04Z. This file is scoped supporting evidence, not permission or a package test result. All actual writes are limited to the assigned E: run.

## Initial Identity and Authority

Direct user request received 2026-10-22T21:39:40Z approves this bounded gate and conditional local build/install/load after read-only preflight, overriding its pasted PROPOSED label only within that exact scope. No adapter tests, supporting dependency installation, source/Plan changes, helpers or lifecycle writes.

Consumer root `E:/PovcalNet/01.personal/wb384996/PIP/pipload`, branch PROD, HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`; Plan raw Git blob `ffc48cfc78434cb893684c41b7429280aebb1b2c`. Current dirty paths: modified .gitignore; untracked Plan, .compound-gpid/, .github/skills/, sessionInfoLog. Private/runtime contents not read. Human/native/request/coordinator IDs UNKNOWN.

Fixed producer commit resolves as `5d1ddebdc926dad9c6ec99c08a65e74baee0da92` under `E:/PovcalNet/01.personal/wb384996/Rpackages/stamp`; dirty working source is not used or exported. Preflight resolved reporting parent on E:, confirmed task/run/files absent and independent report/producer ACL access; checked existing E: ancestors through report parent and producer root for reparse redirects, none observed. Static path/access observation is not process safety, containment or hostile-session protection.

## Runtime Discovery, Not Execution

Get-Command finds `C:/Program Files/R/R-4.5.2/bin/R.exe` and matching Rscript.exe, both Windows file version 3.0.0.0. This is not accepted as the actual R version. Tar candidates: `C:/Windows/system32/tar.exe` (10.0.20348.4647) and `C:/opscode/chef/bin/tar.exe` (0.0.0.0). No executable was launched; runtime/version/library/hook/tool selection remains a preflight prerequisite.

## Pending Chain and Limits

**BLOCKED before any R process.** Required dependency initialization/storage-effect audit is unresolved. Installed `data.table` (explicit pinned NAMESPACE import) and `rlang` (called by pinned package-level initialization) expose only generated lazy-load stubs plus binary databases, not readable implementation of their initialization hooks. No claim that either hook is unsafe or writes outside E: is made; its effects have not been established under the required pre-R audit. Reading metadata or hashing an opaque database does not establish hook behavior. Using R to inspect those hooks before satisfying the current before-any-R condition would bypass it and was not done.

No source.tar export/extraction, fresh R archive, installation, namespace load, sessionInfo or before/after installed-file digests were produced. No resource/source/library subtrees were created; only handoff.md, evidence.md and gate.log exist. Historical clean execution-time tested commit UNKNOWN; no old test recertification or runtime/functionality inference. Detailed static findings follow; final report readback/preservation will be recorded separately.

## Pinned Producer Inputs and Hook Evidence

All producer reads were Git object reads at exactly `5d1ddebdc926dad9c6ec99c08a65e74baee0da92`, not the dirty working tree. `git ls-tree -r --name-only <pin>` inspected export filenames; `git show <pin>:<path>` read DESCRIPTION, NAMESPACE, .Rbuildignore, R/aaa.R, R/zzz.R and pinned compound-gpid.md/compound-gpid.local.md instructions. The producer charter requires loud failures and immutable reproducibility; none was bypassed. No private profiles or storage read. Producer `.kilo` instructions were not present among the pinned export paths; no untracked instruction was followed as execution authority.

Pinned DESCRIPTION declares stamp **0.0.11**, R >=4.1 and Imports cli>=3.4.1, fs>=1.5.2, rlang>=1.0.6, secretbase, jsonlite, data.table>=1.14.6, utils, nanoparquet and qs2. NAMESPACE explicitly imports data.table and utils::head. R/aaa.R:20-40 creates environments via rlang::env at package scope; defaults later call Sys.timezone. R/zzz.R:81-102 initializes defaults, mirrors options, seeds an in-memory extension map and changes an in-memory CLI theme; :104-108 restores that theme on unload. These observed producer snippets show no explicit store initialization/disk write in those hooks, but this partial audit is not a complete producer/dependency safety certification.

Fixed Git blob identities from `git ls-tree -r <pin> -- DESCRIPTION NAMESPACE .Rbuildignore R/aaa.R R/zzz.R configure configure.win cleanup cleanup.win src .Rprofile .Renviron .gitattributes`:

| Pinned path | Mode | Git blob SHA-1 |
|---|---|---|
| .Rbuildignore | 100644 | `6e9fa5b86123f77e3abbfe6387019de169c811b0` |
| DESCRIPTION | 100644 | `aa8d965194fb73ff19fc2cc0751cf51d4410bcd9` |
| NAMESPACE | 100644 | `b177b23a3391c9f640ea1e1f706cc18c3b23dd79` |
| R/aaa.R | 100644 | `57092369a8df68b86927a2074837713d76e45acd` |
| R/zzz.R | 100644 | `69574037417a327c2db5c4d650629824a76c5c1f` |

No configure/configure.win, cleanup/cleanup.win, src, .Rprofile, .Renviron or .gitattributes entry was returned by that exact bounded pinned-tree query. .Rbuildignore excludes tooling/docs/private working-state patterns; build was not executed to apply them. Bounded `git grep` at the pin located .onLoad/.onUnload only in R/zzz.R, registered format requireNamespace calls inside R/format_registry.R and optional filelock use in IO_core.R. No runtime path was invoked. Complete package top-level/native/transitive effects were not declared audited once the dependency prerequisite remained unresolved.

## Verified Existing Library Metadata, Not Loaded Versions

Observed existing package directory: `C:/Program Files/R/R-4.5.2/library`. The conventional user-library directory `C:/Users/wb384996/AppData/Local/R/win-library/4.5` exists but is empty. Process R_LIBS/R_LIBS_USER/R_LIBS_SITE/R_HOME were unset; R_PROFILE_USER/R_ENVIRON_USER were unset. Only names of PIP/STAMP/ST_/PIPFUN-prefixed inherited settings were inspected; none was returned. No private profile contents or storage targets were read. No `$Deps` binding/search path was accepted for execution because its hook audit did not pass.

| Package metadata read under existing library | Declared version | Built field |
|---|---|---|
| cli/DESCRIPTION:1-44 | 3.6.5 | R 4.5.2, x64 Windows |
| fs/DESCRIPTION:1-44 | 1.6.6 | R 4.5.2, x64 Windows |
| rlang/DESCRIPTION:1-47 | 1.1.7 | R 4.5.3, x64 Windows |
| secretbase/DESCRIPTION:1-38 | 1.2.1 | R 4.5.3, x64 Windows |
| jsonlite/DESCRIPTION:1-35 | 2.0.0 | R 4.5.3, x64 Windows |
| data.table/DESCRIPTION:1-216 | 1.18.2.1 | R 4.5.3, x64 Windows |
| nanoparquet/DESCRIPTION:1-49 | 0.5.0 | R 4.5.3, x64 Windows |
| qs2/DESCRIPTION:1-49 | 0.1.7 | R 4.5.3, x64 Windows |
| utils/DESCRIPTION:1-12 | 4.5.2 | R 4.5.2, x64 Windows |

The four declared numeric import floors are met by these metadata values, but transitive closure and actual load compatibility are NOT verified. qs2 additionally declares Rcpp/stringfish/RcppParallel requirements; their initialization/code was not audited after the stop condition. Several installed packages were built with R 4.5.3 while the located runtime header says 4.5.2. That is recorded as an unprobed compatibility difference, not proof of load failure or a reason to install anything. Existing `library/stamp` was observed only as a directory entry and was never used as the candidate.

Concrete hook-audit gap:

- `C:/Program Files/R/R-4.5.2/library/data.table/R/` contains exactly data.table, data.table.rdb, data.table.rdx. Plaintext loader :19-27 performs `lazyLoad(dbbase, ns, ...)`, not a hook implementation. NAMESPACE:1 loads the native data_table library, :4 imports methods, :146/:150 imports utils/stats. Full startup/storage effects remain unaudited.
- `C:/Program Files/R/R-4.5.2/library/rlang/R/` contains exactly rlang, rlang.rdb, rlang.rdx. Plaintext loader :19-27 likewise delegates to binary lazy-load data; actual initialization code was not extracted or executed. DESCRIPTION:36 requires compilation.

This is not a filesystem denial or proof of an unsafe hook. It is a failed-to-establish prerequisite under the user's explicit before-any-R audit rule. No alternate interpreter, helper, runtime loading, source download or dependency installation was used to bypass it.

## Runtime and Opaque-Input Byte Identities

Static `C:/Program Files/R/R-4.5.2/include/Rversion.h:9-18` declares R 4.5.2, 2025-10-31, revision 88974. Absolute R.exe and Rscript.exe share that installation directory; their identical dispatcher bytes below are not a substitute for actual executed R version/session identity. The effective runtime version, OS sessionInfo and actual loaded dependencies remain NOT RUN/UNKNOWN. R exe Windows ProductVersion 3.0.0.0 is not used as R version.

Read-only Get-FileHash SHA-256 capture at the batch clock `2026-10-22T21:45:33Z`:

| Absolute path | SHA-256 |
|---|---|
| C:/Program Files/R/R-4.5.2/bin/R.exe | `66921700dc477930627fc09cf2e734ad9e4a9d55d2c39f8c95cec6e24ff40d6d` |
| C:/Program Files/R/R-4.5.2/bin/Rscript.exe | `66921700dc477930627fc09cf2e734ad9e4a9d55d2c39f8c95cec6e24ff40d6d` |
| C:/Program Files/R/R-4.5.2/include/Rversion.h | `a643148af0908b32a9ace5c284ca8ee667295b45507c0552ed49fd5bf13012bb` |
| C:/Windows/system32/tar.exe | `dcc75eb2e0fce4779784ca0a00c6cda1182c7b3c95eb6dab0e0603651cdb6b52` |
| C:/Program Files/R/R-4.5.2/library/data.table/R/data.table.rdb | `6c3192b30d99c1e8ab700daa7325502780c03dd0609969b973dc734f73d1c6ac` |
| C:/Program Files/R/R-4.5.2/library/data.table/R/data.table.rdx | `155bf9780a0ce2b72aaeffadec0d305248e85a90b3ce6931d155220e6da54603` |
| C:/Program Files/R/R-4.5.2/library/rlang/R/rlang.rdb | `a4e2d625e56ad5beb9791c9d4c0eeabf8d61ff50d7b11f06699235f3622f9a84` |
| C:/Program Files/R/R-4.5.2/library/rlang/R/rlang.rdx | `772c9a3fb72bb019946365653a7b7e0a5ebdc0ed53313194f9eff81e5f3eea04` |

System tar exists at the exact hashed path, but no tar process or extraction occurred and no tool runtime/selection/compatibility pass is claimed. Supporting packages/tools were not installed. Hashing existing C: files is a read only; no C: write or private profile/state access was performed by the gate commands.

## Consumer Binding and Unexecuted Chain

`git diff --no-ext-diff --no-textconv --exit-code HEAD -- R tests man NAMESPACE DESCRIPTION` (GIT_OPTIONAL_LOCKS=0) returned 0/no output. These relevant tracked consumer surfaces match HEAD `ff9a81e386a09fb2531c154f63fd2b91521313c6`; working Plan is separately bound by `ffc48cfc78434cb893684c41b7429280aebb1b2c`. Non-code dirty paths remain listed, not substituted for HEAD or privately read. No consumer package was loaded; no full-repository/private-dirty manifest is claimed.

| Gate link | Actual result |
|---|---|
| Fixed source commit/selected inputs | Read-only resolved/audited partially; exact candidate preserved |
| Pre-R dependency hook/storage audit | UNRESOLVED: stop before execution |
| Export source.tar and SHA-256 | NOT RUN; file not created; digest UNKNOWN |
| Extracted fixed source | NOT RUN; source/ not created |
| Fresh stamp_0.0.11.tar.gz/build identity/native exit | NOT RUN; archive/exit NONE, no historical archive substituted |
| New library installation/installed-file before digests | NOT RUN; library/ not created, no installed candidate |
| Fresh namespace path/version/dependency/sessionInfo probe | NOT RUN; no namespace loaded or accepted |
| Installed-file after digests | NOT RUN; no before/after candidate files |

No child R process started, so TEMP/TMP/TMPDIR/home/cache/library/profile/storage overrides for build/probe were not applied, tested or asserted effective. The assigned E: resource plan is not an established isolation arrangement. C: executable/dependency read permission was not treated as C: write permission. No automatic cleanup, stamp artifact creation, PIP storage call, adapter fixture, historical certification or lifecycle change.

## Blocker Resolution and Remaining Gaps

Existing direct build/install/load approval is recorded; the blocker is required hook-audit evidence, not a missing repeat approval. The smallest next prerequisite is a bounded method to inspect matching installed dependency initialization code/effects before executing the candidate. Matching auditable sources, or separately approved narrowly scoped audit-only introspection that changes the before-any-R condition, could establish that evidence; neither was available/authorized/executed here. Do not silently trust opaque bytes, install/download a substitute or start the rejected runtime step.

Human/native/request/coordinator IDs UNKNOWN. Full dependency/native-hook closure, effective R runtime, matching library provenance, E-only child writes/profile neutralization and the complete fresh source/archive/install/namespace chain remain unestablished. Historical clean execution-time tested commit UNKNOWN; no old tests transferred. This BLOCKED identity attempt passes neither identity subgate, all of Plan V1, an adapter test, phase, integration nor implementation approval.

## Actual Readback and Final Preservation

Substantive checkpoint-2 handoff.md (119 lines), evidence.md (106 lines before this section) and gate.log (23 lines) were read fully in the batch captured `2026-10-22T21:49:33Z`; no omitted slices/truncation. Directory read returned exactly those three files, not source.tar or any runtime resource subtree. Final consumer status/worktree/HEAD match preflight; amended Plan raw blob remains `ffc48cfc78434cb893684c41b7429280aebb1b2c`. Fixed producer `git rev-parse <pin>^{tree}` returns `12ea22c4b2eaa0b2e1d93ea79d1cd20ca60cb4cb`. Optional locks disabled for all Git checks; native exits 0. No mutable producer checkout/code read or write was required. Individual execution UTCs UNKNOWN.

Checkpoint-3 clock `2026-10-22T21:49:56Z` records completed reads and reporting only; final closing files are re-read before the response without pretending their later closing bytes were already verified. No R process/export/build/install/load or new adapter test occurred. Historical clean tested commit stays UNKNOWN; this source/partial static preflight result cannot pass the blocked identity chain or other Plan gates.
