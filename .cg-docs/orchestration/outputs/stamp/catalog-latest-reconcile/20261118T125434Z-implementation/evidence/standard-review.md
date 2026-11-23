---
date: 2026-11-18
depth: architecture
type: standard
plan: "E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.cg-docs/plans/2026-11-18-stamp-catalog-latest-reconciliation.md"
findings:
  P1.1: fixed
  P2.1: fixed
  P2.2: fixed
---

# Catalog-Latest Reconciliation Review

## Scope And Route

Resolved architecture route: new public API plus concurrency/locking behavior.
Required eight agents ran with read-only assignments; mandatory emphasis covered
testing, performance and architecture. No model/provider/effort override or
Agent Manager session/worktree was created for these internal reviews.

Reviewed the new implementation, focused tests, generated help, sole export and
development NEWS entry. Starting HEAD/ready_cran:
`db1b29cd248a3a6cb737c71db176ae6bd76d2a1d`; recorded submitted package inputs:
`56a1474f0fa251bcf655c78eb10e4ebae76d5611`. Existing dirty configuration was
excluded. The later one-entry expected-export test update is explicitly user
approved; exact export equality and old signature assertions remain intact.

## Findings And Corrections

### P1.1: Lossy nonfinite metadata projection

**Agent:** cg-data-quality. **Disposition:** safe_auto, fixed.
As reviewed, canonical JSON projection with `na = "null"` could collapse Inf,
-Inf and NaN into the same null representation as missing metadata. An extra
current QS2 sidecar could therefore contradict retained metadata yet pass.

The new local numeric check rejects these values before projection, while
permitting ordinary NA absence normalization. Added actual raw-QS2 Inf/-Inf/NaN
faults exercise both dry-run and apply rejection without byte changes. The new
API documents this fail-closed refusal; old readers/writers remain unchanged.
Data-quality, quality and performance follow-ups found the correction sound.

### P2.1: Preservation assertion could omit deleted files

**Agent:** cg-testing. **Disposition:** safe_auto, fixed.
The previous assertion derived unchanged paths from the after-image alone. A
deleted unrelated retained file could disappear from both compared subsets.

Now assert exact before/after non-lock path-set equality, then compare unchanged
hashes using the before-image path set, excluding only the catalog. The separate
full-catalog assertion still permits exactly one pointer-cell difference.

### P2.2: Compatibility read could migrate raw table representation

**Agents:** cg-reproducibility and cg-architecture, merged duplicate.
**Disposition:** safe_auto, fixed.
The compatibility reader converted accepted legacy data.frames to data.tables;
writing that result changed classes/attributes beyond the pointer. Architecture
reproduced the defect against the earlier installed copy. Historical probe:
`E:/strec/r125434/legacy-frame-probe.R` and
`E:/strec/r125434/out/legacy-frame-probe.rds`.

Inspection now returns the original validated raw catalog for the one-cell
update. A regression uses three raw data.frames, a custom table attribute and an
unknown top-level field; raw after-image must equal before plus only the pointer
change. Dry-run and repeat no-op must also remain byte-identical. Architecture
verified the current source, staged regression and passing focused log.

## Agent Results

| Agent | Usable Result |
|---|---|
| cg-code-quality | No supported P0-P3, including supplemental correction-delta review. |
| cg-testing | P2.1 above; no separate assertion weakening authorized. |
| cg-documentation | No supported P0-P3; public-only isolated example, exact API and metadata-only limits documented. New refusal sentence is regenerated before final check. |
| cg-version-control | No supported P0-P3; protected inputs/refs and excluded pre-existing dirt respected; uncommitted state is intentional. |
| cg-reproducibility | P2.2 above; no additional correction-delta findings. |
| cg-performance | No supported P0-P3; numeric guard is linear in the metadata already serialized, not payload/history/ancestors. |
| cg-architecture | P2.2 independently reproduced and verified resolved; no remaining supported P0-P3. |
| cg-data-quality | P1.1 above, source correction verified; no remaining supported P0-P3. |

All eight required outputs were substantive. No empty, contradictory-priority
or missing-P0/P1 response was accepted. The candidate to relax earlier timestamp
ties was rejected as unsupported: Plan line 67 explicitly rejects tied chronology.
No tie acceptance or other contract change was made.

## Verification

`E:/strec/r125434/focus-green-c2`: build 0/check 0;
`stamp.Rcheck/tests/testthat.Rout:21`: **PASS236/FAIL0/WARN0/SKIP0**.
This includes all three corrections and their focused regressions. It is not
full-suite or CRAN-release verification.

Initial unfiltered full check remains historical FAIL1/PASS4435: its sole failure
was the strict old export allowlist, whose one approved new entry was authorized
and added. Parent-owned example checker required an exact pairlist/list
representation correction; no default assertion was relaxed.

The corrected `full-c1` build/check both exit 0; `tests/testthat.Rout:1039`
reports **PASS4457/FAIL0/WARN0/SKIP0** across all 40 test files. Unfiltered
`test_check("stamp")` is retained without overlays or omitted files.
`logs/example-check-c1.log:1,7-8` and its native exit 0 confirm both default-alias
scenarios, unrelated builders, options/cwd/graphics/six registries, exact new
signature, 39 old signatures, 15 old R files and three protected records.

All 155 staged files match current intended source. SHA256 of the per-file source
manifest: `bbe3eebee26027af673556513e46feb91e5337c86ad6f155e829b5a0597f75e3`;
development archive: `771b397235beee349a6046c17f6b4d6cfe66236ae2eac4f49e16307227318cc3`.
This identifies uncommitted tested working-tree source, not a new Git commit.
New help was regenerated from current roxygen. The bounded package check has
exactly two unbuilt-vignette warnings; it is not a clean CRAN/release check.
Final light mode:verify passed in fresh cg-code-quality and cg-testing sessions,
with no remaining P0-P3 and zero suppressed findings. Both independently checked
the corrected surfaces; quality matched all six current SHA256 values, testing
matched all 40 archived test paths and the exact unfiltered entrypoint. See
`2026-11-18-stamp-catalog-latest-reconciliation-verify-review.md`.

## Later

Only if measured real catalog contention warrants it, consider reusing a validated
catalog within one locked inspection. No broad caching, metadata framework,
recursion limit, dependency or benchmark was added for a hypothetical problem.

## Limits

No original submitted-archive bytes were located or independently rehashed.
Recorded provenance and write-boundary preservation are not a live-tool,
producer, full-provenance, CRAN acceptance or shared-store repair certification.
No shared/production call, installation/update of dependencies, Git mutation,
publication, PPP-vintage choice or existing-library change occurred.
