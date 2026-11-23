---
schema: pip-handoff-v2
project: pipsystem
task: m2-first-two-hub-plans
run: 20261121T153507Z-dlw
status: blocked
updated: 2026-11-21T15:38:56Z
owner: Find producer-backed DLW verification
repo: E:/PovcalNet/01.personal/wb384996/PIP/pipsystem
branch: main
head: 1821c5526337d03b87a9e61ad934b3c7316c16cf
plan: E:/PovcalNet/01.personal/wb384996/PIP/pipdata/.cg-docs/plans/2026-11-21-m2-public-one-file-dlw.md r2
next: Coordinator keeps Step 1 stopped until the DLW service owner supplies the catalog digest contract or a replacement checksum source is evidenced and approved.
---

# Producer-backed verification for one GMD/GPWG file

## Summary

**Keep r2 Step 1 blocked.** The bounded public search found no authoritative
definition of `ServerCatalog.Checksum`, no evidence that the exact DLW
GMD/GPWG download route supplies `Content-Digest`, and no trusted
pre-download digest for the original GPWG `.dta` bytes. This is a limit of
the evidence, not a claim that the service lacks these features. Plan r2
`:54-56,65-77,147-149,167-171` and the [reviewed closure](../20261121T133329Z-verify-pipdata-r2/handoff.md#L29-L35)
require the authoritative byte contract before implementing the write path.

## Changes

Only this fresh, resolved E: handoff, from running to final. No Plan, code,
or Git changes; no package session or pickup.

## Checks run

- Read-only Git before and after confirmed the registered roots
  (`tools/pipsys/packages.csv:2,5`): pipsystem `main`
  `1821c5526337d03b87a9e61ad934b3c7316c16cf` and pipdata `PROD`
  `c70ae403acde648aff1a49d8d3178ca0202c6064`. The explicitly named, untracked
  Plan r2 matched the [approval record](../20261121T133329Z-approved/handoff.md#L50-L58)
  and prior handoff at Git blob fingerprint `1157e049776049469b2ff60c6ab400e6e7d46a11`
  before and after. The handoff was absent initially; resolved to the exact
  E: path with no reparse ancestors and no E: substitution.
- Read both `compound-gpid.md` charters, hub design and coordination rules,
  the Plan/review, and the [prior checksum handoff](../20261121T134435Z-checksum/handoff.md#L46-L92).
  Loaded shared, technical, data.table, collapse, and testing skills before
  inspecting R source. The prior client findings were inputs, not a new grep.
- Bounded public searches covered producer code and API specifications
  (`ServerCatalog`, `FileInformationInternal/GetFileInfo`, OpenAPI/Swagger),
  GMD/GPWG metadata and SHA-256 manifests, and digest headers on that route.
  Checked public documentation and GitHub only; no DLW service requests,
  authentication, credentials, survey access, shared-path access, or outreach.
  The checksum prerequisite remains blocked; V1 execution and all V2/V3
  checks **NOT RUN**. No R execution or package tests.

## Producer Evidence

| Source | What it establishes and why it does not pass r2 |
|---|---|
| [World Bank GLD User Manual, section 2.2, Datalibweb](https://documents1.worldbank.org/curated/en/099052124182083406/pdf/P1737101ad486605f193d91c0dda3fa9842.pdf) | Identifies the internal DLW website, service endpoints, and DLW team. It describes GLD access, not GMD checksum generation or response headers. |
| [PIP Manual, sections 7.1.1 and 7.2](https://pip-technical-team.github.io/PIPmanual/welfare_data.html) and [section 11.2.1](https://pip-technical-team.github.io/PIPmanual/load_md_aux.html#inventory-file) | Identifies Data for Goals (D4G) as coordinator of GMD updates, and documents PIP filename/vintage and downstream inventory metadata, not an expected digest for DLW response bytes. The indexed [`worldbank/gmd`](https://github.com/worldbank/gmd) candidate returned 404 on direct repository, branches/releases metadata, and raw README reads; its contents remain unverified. |
| World Bank [WISE-APP reproducibility README, Data Sources / `data/SHA256SUMS`](https://reproducibility.worldbank.org/catalog/703/download/2129/README.pdf) and [verification report, Verification Process and Data Handling](https://reproducibility.worldbank.org/catalog/703/download/2130) | A real documented SHA-256 manifest, but for the prepared WISE-APP extract (GMD-derived Parquet files) and separately for aggregate results, not the selected source GPWG `.dta`. No matching producer digest or signed immutable source manifest located. No package, manifests, or data downloaded. |
| [World Bank DLW PR 21](https://github.com/worldbank/dlw/pull/21), merged as `12faa058b521ef511073a7b21b1b1dd7993c9649`; [`R/dlw_get_data.R:90-116,139-151`](https://github.com/worldbank/dlw/blob/12faa058b521ef511073a7b21b1b1dd7993c9649/R/dlw_get_data.R#L90-L116), [`R/build_request.R:65-94,118-125`](https://github.com/worldbank/dlw/blob/12faa058b521ef511073a7b21b1b1dd7993c9649/R/build_request.R#L65-L94) | Maintainer documents the exact file route; pinned data path saves `last_raw_data` from the body and does not expose the digest header through that path. This establishes neither emission nor non-emission by the server. No published response schema or owner statement was found that guarantees a digest on the successful GMD/GPWG response. |

## Contract Decision

- **Existing r2:** A versioned producer implementation or service-owner
  specification tying the algorithm, exact bytes, and encoding of
  `ServerCatalog.Checksum` to the exact versioned GPWG response clears the
  evidence prerequisite. It does not itself pass the remaining V1-V3 checks.
- **Different checksum source:** [RFC 9530 sections 2, 4, 6.1 and 6.5](https://www.rfc-editor.org/rfc/rfc9530.html#section-2)
  specify algorithm keys and encoded digest bytes over HTTP message content;
  `Want-Content-Digest` is optional to honor. A digest accompanying a response
  can verify that message content, but does not by itself bind it to the
  selected catalog version or serve as a trusted pre-download expectation.
  Before substituting it, require documented emission on that route, a trust
  and version binding, and proof that the client can verify the correct byte
  boundary (including any content coding) before decode/parse and registration.
  A producer-published known digest or trusted immutable pre-download manifest
  can instead verify the exact file if it binds the full GMD/GPWG identity,
  filename, master/alternative versions and immutable revision to the digest;
  if signed, verify against a trusted publisher key. Either substitution
  needs explicit approval of the new checksum-source contract, not a silent
  change to the [approved catalog-based stop](../20261121T133329Z-approved/handoff.md#L62-L69).
- **Not equivalent:** In pipdata at `c70ae403`, `R/pipdata_dlw_compare.R:1252-1287`
  compares catalog strings; `R/pipdata_validate_gmd.R:667-688` keeps `Checksum`
  separate from the Stamp object hash. Treat the catalog value as an opaque
  selection token for now, not an owner-guaranteed revision identifier. A
  local SHA-256 fingerprints the bytes received and can support later local
  comparison. Neither it nor token equality establishes that those bytes
  match an externally supplied expected digest for the selected file.

## Technical Next Step

Authority: the World Bank DLW service team responsible for producing
`ServerCatalog` and serving `FileInformationInternal/GetFileInfo` (public
GLD manual section 2.2 above). Involve the GMD/D4G publication owner if the
digest originates at collection publication. Current responsible individual
is **UNKNOWN**. Draft questions only; none sent:

1. For one exact GMD/GPWG `.dta` vintage, what produces `ServerCatalog.Checksum`?
   Supply the versioned producer code or specification: algorithm, exact
   covered bytes (stored file, HTTP content with any coding, or other), and
   encoding/normalization. How is that row bound to the bytes returned for
   the same filename, master/alternative versions and revision? Can a
   pinned vintage's bytes be replaced under the same identity?
2. If `Checksum` cannot verify the file, what supported producer evidence can?
   Is RFC 9530 `Content-Digest` guaranteed on that successful route, and under
   what coding, header/trailer, and version-binding rules? Otherwise, is there
   an authoritative pre-download digest or immutable signed manifest for the
   exact file, with a documented publisher trust anchor and byte/encoding
   specification? Supply the versioned contract and one non-survey test vector.

Offline only, if separately authorized: use installed tools to prepare one
synthetic known-digest fixture for the pre-write boundary; a matching value
can reach the fixture writer, and missing or mismatched evidence must not
reach it or confer eligibility. This is a functional check, not producer
evidence or permission to implement the r2 write path. No new dependency,
new verification framework, or live probing.

## Gaps

- **UNKNOWN:** The GPWG catalog algorithm, covered bytes and encoding;
  guaranteed response digest and its byte/identity binding; existence and
  provenance of a trusted pre-download digest for the exact original file.
- Fresh-byte-to-object binding and exact raw save/readback, validation and
  cleaning remain unverified (r2 `:70-84,91-110,147-149`).
