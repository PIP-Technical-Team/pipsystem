# HARVEST_BRIEF.md

Milestone M1: read the code to answer the Open questions in `SYSTEM_DESIGN.md` that only the code can answer. Nothing else.

Read `compound-gpid.md` and `SYSTEM_DESIGN.md` first.

## 1. Rules

1. **Answer the questions below. Do not document anything else.** No README style summaries, no inventories of functions.
2. **Every answer carries evidence:** file and line, at a recorded commit SHA.
3. **`UNKNOWN` is a valid answer. A plausible guess is not.**
4. **Read the code and tests, not the README.** Several features are marked experimental. Only source and tests show what works.
5. **Every notes file ends with a Gaps section that is never empty.**
6. **Do not change `SYSTEM_DESIGN.md`.** Propose changes in `notes/FINDINGS.md` only.
7. **One agent per package.** Each agent writes only its own files, so agents can run in parallel.

## 2. Output

```
notes/
  stamp.md
  pipaux.md
  pipdata.md
  pipload.md
  pipfun.md
  pipster_wbpip.md
  pipapi.md
  FINDINGS.md        # written last, by one agent
tables/
  stamp_fit.csv
HARVEST.md           # date and commit SHA of every package read
```

Each `notes/<package>.md` answers its questions by ID (S1, A1, and so on), then lists Gaps.

## 3. Questions

### `stamp`

**S1. Can a partition be a parent?** Does a partition written by `st_save_part()` or `st_auto_partition()` get its own catalog entry, version, and content hash? Can another artifact declare one partition as a parent, so a change to that partition marks only its dependents as stale? Or does lineage work only on whole artifacts? *This is the most important question in the harvest.*

**S2. What goes into `code_hash`?** What can the `code` argument of `st_save()` receive: a function, an expression, a string? Can an explicit version label be passed instead of a hashed function body? What happens to staleness when `code_hash` is `NA`?

**S3. Early cutoff.** When a rebuild produces identical content, is a new version created? Do children become stale anyway, or does the cascade stop?

**S4. Scale and concurrency.** What is the physical structure of `.stamp/`? Does `st_catalog_query()` cost grow with the number of artifacts? What happens when many processes call `st_save()` at the same time: locking, last write wins, possible corruption? Target: tens of thousands of artifacts, parallel workers.

**S5. Builder API.** What actually works in `st_register_builder()`, `st_plan_rebuild()`, and `st_rebuild()`? What is stubbed? What is tested?

**S6. Custom metadata.** Can custom fields (module, module version, data type, DLW versions) be stored in the sidecar file next to an artifact, and read back without loading the data?

**S7. Release scoping.** Is there any way to record that a named set of artifact versions belongs together, such as a release or snapshot?

Also fill `tables/stamp_fit.csv`:

```
requirement, stamp_function, status, evidence_file, evidence_line, notes
```

`status` is `supported`, `partial`, `absent`, or `unknown`. Rows, at minimum:

* retrieve a specific past version
* declare parents
* query children
* detect staleness
* transitive staleness across several levels
* partition as an addressable artifact
* partition as a parent
* explicit code version label
* early cutoff on identical content
* custom metadata fields
* bulk catalog query
* concurrent writes
* plan a rebuild over many targets
* execute a rebuild plan
* scope a set of versions to a named release

Rows marked `absent` are expected. A table where everything is `supported` was read from the README.

### `pipaux`

**A1. Granularity.** When a survey needs CPI, PPP, or population, is the whole series loaded and then subset, or are only the needed rows requested? What would the natural partition key be for each main series?

**A2. Dependency chain.** Where are dependencies between series defined (for example, GDP built from WDI and Maddison)? In code, or as data that another program could read?

**A3. Hashes today.** How are content hashes computed and stored? Does `pipaux` already use `stamp`?

**A4. PFW.** What are the key columns? Which columns decide inclusion or exclusion of a survey, and which hold settings? Does PFW record the module to use, or the choice between HIST and BIN?

### `pipdata`

**D1. Module rule.** Where is the rule that selects the module for each survey? Where is the HIST versus BIN choice made? Where is the choice between two surveys with the same welfare type made?

**D2. Deflation.** Exactly which auxiliary values enter a deflated welfare value? Is deflation a single factor per survey, reporting level, and PPP year, or something more complex?

**D3. Checks.** Where do validation rules live, in code or in data? What happens when one fails? What is the manifest file that marks surveys needing revision, and what does it contain?

**D4. `stamp` use.** Does `pipdata` already use `stamp`? Where and how?

### `pipload`

**L1. Role next to `stamp`.** What does `pipload` do that `stamp` does not? Where do the two overlap?

### `pipfun`

**F1. Logging.** What does the log record, in what format? How does the current "do not rerun what passed" behavior work?

### `pipster` and `wbpip`

**P1. `pipster` today.** Which calculations exist? Do any read or save files?

**P2. `wbpip` reference.** List the calculation entry points that `pipster` must reproduce for stages 5 to 7, split between microdata and grouped data.

### `pipapi`

**I1. Input contract.** Which files does the API read from a release folder? With which columns, keys, and formats? Where does it convert welfare to PPP?

## 4. `FINDINGS.md`

Written last. One row per Open question in section 12 of `SYSTEM_DESIGN.md`:

| # | Open question | Answer status | Evidence | Proposed change to SYSTEM_DESIGN.md |
|---|---|---|---|---|

Answer status is `answered`, `partial`, or `unknown`.

Then a short list: anything found in the code that contradicts a **Decided** item in `SYSTEM_DESIGN.md`.

## 5. Not covered here

Lineup and missing country code lives in the `targets` project of the current pipeline, which is not in the workspace yet. Its questions belong to M4.
