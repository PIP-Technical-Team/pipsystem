# Work Report: M2 one-survey acquisition preflight

## Plan Reference

`.cg-docs/plans/2026-11-20-m2-one-survey-acquisition-preflight.md`, revision 2, Phase 1.

## Active Deviation Policy

`autonomous`; review auto. Hub only. Preserve the dirty existing current
state pointer; use a separate workflow pointer for this concurrent run.

## Run 1: 2026-11-21T00:23:22Z

Canonical Plan validation passed; V1 pending and V2–V3 not started.

### Outcome: Phase 1 blocked at V1

The [worker's final handoff](../orchestration/outputs/pipsystem/m2-first-two-hub-plans/20261121T002322Z-survey/handoff.md#L41-L143)
records the scoped source assertions. The coordinator independently verified
the `pipdata` base `c70ae403acde648aff1a49d8d3178ca0202c6064`, the public
wrapper's `selected_filenames = NULL`, and no committed production call site
for the internal exact-selection helper.

| Evidence | State | Result |
|---|---|---|
| V1 | Blocked | The public `pipdata` acquisition wrappers cannot select one exact file. One-file `dlw` writes a `pins` entry, not the Stamp raw artifact and acquisition inventory row the GPWG validator reads; the documented inventory calls do not bridge them. |
| V2 | Not run | No DLW authentication, live catalog, payload, byte-validation, or GPWG validation. |
| V3 | Not run | No clean processing, paired saves, readback, or lineage assertion. |

No package, Git, roadmap, or Qmd changes; no implementation diff for auto
review. No required check was waived. Phase 1 was not marked complete and
Phase 2 did not start.

## Gaps

Propose a separate package-owned `pipdata` Plan for a public exact one-file
route that registers the verified payload and binds validation and cleaning
to one raw version/hash. Deployment runtime, approved storage, DLW access,
checksum method, and source welfare period remain unverified. Rerun Phase 1
only after the supported route is proven.
