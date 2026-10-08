# pipfun: M1 F1 Evidence

## Evidence Scope

- Question: F1 only, log contents, formats, and passed-work skip logic (`HARVEST_BRIEF.md:104-106`, D).
- Source path: `E:\PovcalNet\01.personal\wb384996\PIP\pipfun`. No other logging worktree was used.
- P = full `pipfun` HEAD SHA `0c6a78d9884ed0965a524311537eec2a5095d60b`.
- D = full `pipsystem` worktree HEAD SHA `84c384f78ed44bcb96bb19c6d364519df5b5db6f`.
- Each citation below uses P unless it explicitly uses D. Paths in P citations are relative to the verified source path. Paths in D citations are relative to this notes worktree.
- Git observation: `git rev-parse HEAD` returned P. `git status --porcelain=v1 --untracked-files=all` returned no entries before inspection and again before this write. Source dirty state: clean.
- Git observation: the notes worktree had one existing change, ` M .gitignore`, at the start. It was not changed by this task.
- Final git observation: the source still has no status entries, and the cited source files still match P. The notes worktree reports ` M .gitignore`, `?? notes/pipfun.md`, and `?? notes/stamp.md`. This task wrote only `notes/pipfun.md`; the other files were not changed by this task.
- Evidence check: `git ls-files` confirmed all cited source and test files are tracked. `git diff --exit-code HEAD -- R/aaa.R R/zzz.R R/log.R R/log_helpers.R R/log_checkpoint.R tests/testthat/test-log.R tests/testthat/test-log_checkpoint.R tests/testthat/test-log_capture_spike.R` returned exit code 0 with no output. These worktree files match P; no dirty source content is attributed to P.
- Project evidence check: all six required project files are tracked. `git diff HEAD -- AGENTS.md compound-gpid.md SYSTEM_DESIGN.md HARVEST_BRIEF.md STRATEGY_BRIEF.md .cg-docs/strategy/2026-10-07-pip-backend-roadmap.md` returned no output. Their cited content matches D.
- Inspection only: the tests cited below were read, not executed. No package was loaded, no build was run, and no test results are claimed.

## F1. What the Log Records

The in-memory log is a named object in `.piplogenv`, an environment with an empty parent. `log_init()` creates an empty `data.table` with the additional class `piplog` and stores it there (`R/aaa.R:9`; `R/log.R:168-190`, P).

| Column | Stored content | Evidence at P |
|---|---|---|
| `time` | `Sys.time()` for each new entry; the empty column is `POSIXct`. | `R/log.R:121-122,178-179` |
| `package` | `rlang::env_name(.env)`. This is an environment name, not a validated package identifier or SHA. | `R/log.R:123` |
| `fun` | The deparsed calling expression, trimmed and joined as one string. The fallback is `"unknown"`. This is not only a bare function name. | `R/log.R:113-124` |
| `event` | Caller-supplied event converted to lowercase. The implementation does not restrict it to a fixed event vocabulary. | `R/log.R:41-48,125` |
| `message` | Caller-supplied message converted to character. | `R/log.R:126` |
| `args` | A list column with supplied arguments, or captured caller arguments. | `R/log.R:78-108,127` |
| `logmeta` | A separate list column with caller-supplied metadata, including `NULL`. It is not merged into `args` by the implementation. | `R/log.R:127-128` |
| `output` | A list column with the optional caller-supplied result. | `R/log.R:129` |
| `trace` | A list column with `.trace`, if supplied, otherwise `sys.call(-1)`. | `R/log.R:130` |

The empty log starts with eight columns and has no `logmeta` column. The first entry adds `logmeta` through `rbindlist(..., use.names = TRUE, fill = TRUE)`. The inspected initialization test expects the eight-column empty schema (`R/log.R:128,133-137,178-187`; `tests/testthat/test-log.R:4-10`, P).

Direct `log_add()` argument capture skips call expressions that start with `log_`. It captures formal arguments and `...` when it can resolve the caller function. An explicit `.env` selects non-hidden objects in that environment; an unresolved caller gives an empty list. Supplied `args` bypass this capture (`R/log.R:57-108`, P).

`log_info()`, `log_warn()`, and `log_error()` capture arguments with `capture_log_args()` and call `log_add()` with events `info`, `warning`, and `error`. They forward `logmeta`, `output`, and trace settings (`R/log_helpers.R:35-59,89-149`, P).

The log has no mandatory release, survey, stage, pass/fail status, input hash, or code SHA column in its row constructor. Such fields can be supplied as metadata, but their use by pipeline callers is UNKNOWN in this harvest (`R/log.R:121-131`; `R/log_helpers.R:97-104`, P).

Inspected tests assert argument capture, supplied argument overrides, output, default and custom traces, metadata, lowercase events, character messages, and timestamps. These are test assertions, not executed results (`tests/testthat/test-log.R:40-193`, P). Two further tests assert that explicit error metadata survives `tryCatch` handlers and `lapply` callbacks (`tests/testthat/test-log_capture_spike.R:1-64`, P).

## F1. Formats and Persistence

| Surface | Format or behavior | Evidence at P |
|---|---|---|
| Memory | `piplog` on a `data.table`, with list columns for structured payloads. | `R/log.R:121-137,178-190` |
| Default disk format | `qs2`. If `id` has no extension, `format` supplies it. The whole log is passed to `stamp::st_save()`. | `R/log.R:352-359,377-398` |
| Save metadata | `class = "piplog"`, `log_name`, and `saved_at`, followed by supplied metadata. `code`, `format`, `alias`, and `...` are forwarded to `stamp::st_save()`. | `R/log.R:383-398` |
| Load | Default extension is `qs2`; `stamp::st_load()` receives file, version, and alias. A loaded `data.table` gets the `piplog` class restored and is stored in memory after the overwrite check. | `R/log.R:434-447,469-491` |
| Version listing | `version = "available"` calls `stamp::st_versions()` and adds `vintage = (.I - 1) * -1`. | `R/log.R:449-456` |
| Console | CLI text per row: timestamp, uppercase event, message, function and environment name, plus trace, output, and metadata when present. | `R/log_helpers.R:155-193` |

Other disk formats are UNKNOWN as working log formats from this evidence. `format` is forwarded without a local whitelist, but the inspected save/load tests use `qs2`. This harvest does not infer serialization support from another package (`R/log.R:355,395,438`; `tests/testthat/test-log.R:305-445`, P).

Checkpoint saves accept exactly the stages `dlw` and `pipeline`. The identifier is `<name>_checkpoint_<stage>`. The wrapper adds `stage` and `checkpoint_time` metadata and rejects attempts to override those fields (`R/log_checkpoint.R:43-69,88-118`, P).

The checkpoint wrapper supplies a code object containing the checkpoint time formatted in UTC and the deparsed user code. The changing code value is intended to persist another checkpoint even when log content did not change. This concerns saving the log, not deciding whether survey work reruns (`R/log_checkpoint.R:90-118`, P). The inspected repeated-checkpoint test expects `skipped` not to be true, two versions, and distinct version IDs; it was not executed (`tests/testthat/test-log_checkpoint.R:170-186`, P).

Inspected persistence tests assert `.qs2` file creation, extension addition, load/class restoration, available versions, and overwrite behavior (`tests/testthat/test-log.R:305-445`, P). Inspected checkpoint tests assert stage-specific `.qs2` files, stage/time metadata, custom metadata, and code hash presence (`tests/testthat/test-log_checkpoint.R:1-63,127-168`, P).

## F1. Passed-Work Skip Logic

**Answer: UNKNOWN for the current pipeline. No passed-work skip decision was found in the inspected `pipfun` logging implementation or its logging tests.**

The verified helpers provide these observations, not a rerun plan:

- `log_filter()` copies the log and filters by event, exact stored `fun` value, and inclusive time bounds. It does not compare inputs or select tasks (`R/log.R:251-280`, P).
- `log_has_errors()` filters `event = "error"` and returns either whether any rows exist or the filtered log. It does not define which work passed (`R/log_helpers.R:228-235`, P).
- `log_summary()` counts entries by chosen columns. It does not compute the latest task status or decide whether to rerun (`R/log_helpers.R:247-262`, P).
- `log_error()` appends an error record. It does not catch a pipeline error, retry a task, or choose subsequent work (`R/log_helpers.R:133-149`, P).
- `log_load()` restores records, and `log_save_checkpoint()` saves records. Neither implementation selects surveys or estimates to run (`R/log.R:434-491`; `R/log_checkpoint.R:20-120`, P).

Search observation: searches of the verified source `R/*.R` and `tests/**/*.R` for `passed`, `rerun`, `re.?run`, `skip`, `log_filter(`, and `log_has_errors(` found no passed-work selection implementation. This negative search result has no single source line; it is not evidence that such behavior is absent from other packages or from an external pipeline.

UNKNOWN: the caller that reads a log to skip passed work; the success marker; the task identity; the latest-status rule; and whether an input or code change invalidates a prior success. No other package source was read to answer these points.

## F1. Decided Contradictions

**No log-decides contradiction is proved by this verified source alone.** The target design says `stamp` decides what reruns and the log only records events (`SYSTEM_DESIGN.md:188-192,217-219`, D). The inspected log filters, error query, summary, and checkpoint save do not select pipeline work (`R/log.R:251-280`; `R/log_helpers.R:228-262`; `R/log_checkpoint.R:88-118`, P).

If the current pipeline uses these records to exclude passed work, that caller would conflict with the Decided rule that the log never decides (`SYSTEM_DESIGN.md:217`, D). The caller and its code evidence remain UNKNOWN; this conditional is not a verified contradiction.

The target requires a failure to be recorded while the run continues, and an end-of-run success/failure report (`SYSTEM_DESIGN.md:211-215`, D). The inspected package supplies error recording and counts, but enforcement by the pipeline is UNKNOWN. Recording helpers alone do not prove those whole-run requirements (`R/log_helpers.R:133-149,247-262`, P).

No Decided or Open design item was changed. Roadmap approval is not approval to change Open logging ownership (`.cg-docs/strategy/2026-10-07-pip-backend-roadmap.md:174,183`, D).

## Gaps

- UNKNOWN: the actual passed-work skip caller and rule. The verified logging helpers expose records and filters, not that decision (`R/log.R:251-280`; `R/log_helpers.R:228-262`, P).
- UNKNOWN: runtime correctness. All cited tests were inspected only, not executed. In particular, persistence tests create folders and call `stamp::st_init()` and save functions; this read-only task did not run them (`tests/testthat/test-log.R:306-320`; `tests/testthat/test-log_checkpoint.R:1-25`, P).
- UNKNOWN: log formats other than `qs2` that preserve all list columns and class. The inspected persistence tests use `qs2` (`tests/testthat/test-log.R:305-445`, P).
- UNKNOWN: caller-specific success markers, release identity, invalidation after changed inputs/code, and automatic end-of-run reporting. These are not required fields or decisions in the inspected row constructor and summary helper (`R/log.R:121-131`; `R/log_helpers.R:247-262`, P).
- UNKNOWN: whether log-driven skipping contradicts the Decided target in current pipeline callers. Only `pipfun` source was used here (`SYSTEM_DESIGN.md:217`, D; `R/log.R:251-280`; `R/log_helpers.R:228-262`, P).
