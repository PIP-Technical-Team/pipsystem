# Work report: Historical Quarto record

Plan: `.cg-docs/plans/2026-11-25-historical-quarto-record.md`.

## Run: 2026-11-25

Active deviation policy: stored `autonomous`; runtime `deviate:auto` maps to `autonomous`.

No roadmap feature links this backfill Plan. No roadmap write.

2026-11-25: Steps 1-4 and both phases complete. Canonical Plan validation and checkout preflight passed; see the [finalized handoff](../orchestration/outputs/pipsystem/historical-qmd/20261125T214856Z-backfill/handoff.md).

## Deviations

- `autonomous`: offline verification will use a scratch-only Quarto website project. With Quarto 1.9.37, standalone and default-project rendering left the existing M2 links as raw `.qmd` hrefs; website mode converted them to `.html` without a link rewrite or repository configuration change.

## Accepted exceptions

- Full-suite phase gate only: user selected **Accept baseline exception (Recommended)** on 2026-11-25. The known unrelated failures may carry forward only if no new suite failures appear and all Plan-specific checks pass. V1-V4 are not waived.

## Evidence

| ID | Required evidence | Status |
|---|---|---|
| V1 | 23 coverage keys and no empty pages | PASS: 23 distinct records and unique index entries, reachable in HTML |
| V2 | Page fields and claim-specific checks | PASS: 23 pinned-record checks and required fields; no runtime recheck claimed |
| V3 | Offline renders and local navigation | PASS: 29 fresh HTML files, 23 round trips, 496 fragment references, 110 evidence hrefs |
| V4 | Sanitized results and scope check | PASS: finalized handoff, credential and data-file scan, changed-path check |

## Constraints

| ID | Check | Status |
|---|---|---|
| C1 | Checkout and historical Plan blobs | PASS, details in handoff |
| C2 | No invented phases or closures | PASS: M0 numbering, M1 open items, and early M2 identifiers checked against pinned Plans and roadmap |
| C3 | No real-data runs, package edits or publication | PASS: no execution of experiment cells; no package changes, Git writes or publication |

## Remaining uncertainty

No current package runtime, integration, survey or production test is inferred. Standalone Quarto renders do not provide the verified website navigation. The existing R suite failures remain out of scope.

## Baseline checks

- No existing test asserts against the historical Quarto pages. The documentation evidence checks use pinned records and offline rendering.
- Before documentation edits, offline `testthat::test_dir("tests/pipsys")` reported 524 passed assertions, 12 failed assertions and 14 errors. The affected tests concern `pip-next` contracts and `pipsys` fixtures; examples include missing `mac_path`, Windows-only `Sys.junction`, and a Windows `E:` path guard on macOS. Test inputs under `tests/`, `tools/`, and the coordination instructions checked against the pinned HEAD were unchanged. The broad suite did not pass.
- Phase 1 and Phase 2 reruns had the same cases and counts. No new failure. No VS Code Problems diagnostic tool is exposed in this session; no diagnostic auto-fix was dispatched.

## Final status

`completed`: V1-V4 passed. The docs-only change exceeds 50 lines, so `review:auto` resolved to `standard`. All eight reviewers returned. The reproducibility finding is addressed by the exact scratch configuration in the handoff. The rerun also scanned copied evidence text and checked returns from the indexes. The unchanged Step 05 page is forward-only and is not part of the 23 required round trips. Other review fixes distinguish checkout links from pinned evidence, Git author from original recorder, and historical fixture success from the L-authority/V6 acceptance gate. No merge or publication.
