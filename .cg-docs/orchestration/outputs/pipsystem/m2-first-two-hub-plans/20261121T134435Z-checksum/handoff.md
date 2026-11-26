---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T134435Z-checksum
status: blocked
updated: 2026-11-21T13:48:08Z
owner: Verify DLW checksum contract
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-21-m2-public-one-file-dlw.md r2
next: Coordinator keeps Step 1 stopped until DLW producer code or an official service contract establishes all three checksum properties.
---

# DLW catalog Checksum prerequisite

## Summary

**BLOCKED.** No authoritative evidence found for the GMD/GPWG DLW
`ServerCatalog.Checksum` algorithm, exact covered bytes, or encoding. Plan r2
requires all three before implementing the write path (lines 65-67, 147,
167-171). Catalog-string equality and access to fresh response bytes are not
evidence that the catalog field verifies those bytes.

## Changes

Only this E: handoff (running, then final); no package, Plan, scope, Git,
or client changes. No B6 worktree contents used.

## Checks run

- Read-only `git rev-parse` verified local `HEAD` and branch refs at start
  and before finalizing: pipsystem `main`
  `1821c5526337d03b87a9e61ad934b3c7316c16cf`, pipdata `PROD`
  `c70ae403acde648aff1a49d8d3178ca0202c6064`, and checked-out DLW `master`
  `12faa058b521ef511073a7b21b1b1dd7993c9649` at
  `E:/PovcalNet/01.personal/wb384996/Rpackages/dlw`. Committed evidence was
  read by SHA. The named Plan r2 is not in the pipdata pin and was read only
  as the explicitly named task input; `git hash-object --no-filters` returned
  the same fingerprint before and after: `1157e049776049469b2ff60c6ab400e6e7d46a11`.
- Read the project charters, `cg-work`, and all five R skills (shared,
  technical, data.table, collapse, testing) before inspecting R source.
  Verified the exact handoff and its run directory were fresh, and rechecked
  the resolved E: report path and all ancestors for reparse points.
- **DLW client** (`12faa058b521ef511073a7b21b1b1dd7993c9649`):
  `R/dlw_server_catalog.R:24-50,113-134` requests `ServerCatalog` and adds
  filename-derived fields without computing `Checksum`; `R/build_request.R:65-94`
  parses the CSV response and separately returns a raw vector for a DTA response.
  `R/dlw_get_data.R:48-63,90-116,139-151` can return a local pin on cache hit;
  on download it stores the response body as `last_raw_data`, writes and parses
  it, then pins the table. It does not compare the raw body to `Checksum`.
  The `latin1` at line 108 is a DTA reader argument, not digest encoding.
  `man/dlw_server_catalog.Rd:16-35` does not define the field. A pin-scoped
  `git grep` for checksum/digest terms in client source, docs and tests found
  only `vignettes/gmd_collection.Rmd:29-38`, which lists the column name.
- **Pipdata consumer** (`c70ae403acde648aff1a49d8d3178ca0202c6064`):
  `R/pipdata_dlw_compare.R:194,1218,1262-1285` fetches the client catalog and
  compares the supplied string to the row; `man/pipdata_get_gmd.Rd:63-69`
  documents nonempty character, not a digest encoding. The validator keeps
  the candidate `Checksum` separately from `content_hash`
  (`R/pipdata_validate_gmd.R:667-691`); `R/save_pip.R:91-128` checks a Stamp
  object hash. The separate SHA-256 in `R/dependency_manifest.R:150-175`
  hashes a manifest payload, not DLW bytes.
- **Project evidence** (`pipsystem` `1821c5526337d03b87a9e61ad934b3c7316c16cf`):
  the [committed acquisition review](../../pipdata-upstream-review/20261103T152032Z-orchestrator/acquisition-review.md#L24-L26)
  distinguishes catalog pinning from transport integrity. The M2 walking
  skeleton Plan (`.cg-docs/plans/2026-10-10-m2-walking-skeleton.md:171,310-312`)
  requires the source checksum as evidence but does not define it.
- **Public World Bank material**: read-only web search and source fetches found
  the [GMD Collection vignette](https://worldbank.github.io/dlw/articles/gmd_collection.html)
  and [catalog reference](https://worldbank.github.io/dlw/reference/dlw_server_catalog.html),
  corroborated by the pinned DLW files above. The public Stata frontend at
  [`b2cbb3b058ac594ca0e9b17fcb68945d3427a2cc`](https://github.com/worldbank/datalibweb/commit/b2cbb3b058ac594ca0e9b17fcb68945d3427a2cc)
  describes an API-integrated client (`README.md:1-9`);
  [`Stata/plus/d/dlw_servercatalog.ado:163-176`](https://github.com/worldbank/datalibweb/blob/b2cbb3b058ac594ca0e9b17fcb68945d3427a2cc/Stata/plus/d/dlw_servercatalog.ado#L163-L176)
  requests the catalog and imports returned CSV, not a producer definition.
  No producer code or official field contract was located in the sources checked.
- Plan V1's checksum prerequisite was investigated and blocked. The rest of
  V1 and all V2/V3 checks were **NOT RUN**. No R execution, DLW service calls,
  credentials, household payloads, or production storage access.

## Gaps

- Digest algorithm: **UNKNOWN**.
- Exact covered bytes: **UNKNOWN**. The client response-body boundary is
  known; which bytes the catalog producer hashes is not.
- Encoding: **UNKNOWN**, including digest representation and any case or
  normalization rules. No inference from digest length, examples, or fixtures.
- Evidence needed to lift the gate: versioned DLW producer code or an
  authoritative service-owner specification tying all three properties to
  `ServerCatalog.Checksum` for the GMD/GPWG download route.
