---
date: 2026-11-02
depth: data-risk
type: standard
plan: .cg-docs/plans/2026-11-02-site-focus-and-navigation.md
findings:
  P2.1: fixed
  P2.2: fixed
  P2.3: fixed
  P2.4: fixed
  P2.5: fixed
  P2.6: fixed
---

# Review Report: Site focus and navigation

Resolved route: **data-risk**, because metadata joins and summary tables are changed; mandatory emphasis on data quality, reproducibility and testing. All eight required agents completed usable static reviews. No full/security escalation: no publishing, installer, schema authority, package processing or destructive runtime changes.

Eleven implementation/test/context files reviewed. Twelve reported findings deduplicated into six P2 findings (P0: 0, P1: 0, P2: 6, P3: 0 distinct). Minor P3 source-link/date findings overlap higher-severity reports and are included, not skipped. All corrections are safe_auto within the approved full-Plan execution; no interactive batch decision is needed because the user already authorized all applicable review fixes.

## P2 — Important

- **[P2.1] [safe_auto]** code-quality/testing/documentation/reproducibility/data-quality/architecture — `tools/pipsys/pipsys.R:1158-1170`: optional detail fallback links to a nonexistent assessment.md when content actually came from handoff.md. Current selected input also has this shape. Resolve one actual source path and use it for reading, link rewriting, and full-evidence navigation; add handoff-only and detail fixtures.
- **[P2.2] [safe_auto]** code-quality/documentation — `tools/pipsys/pipsys.R:1184-1195`: recorded charter focus lacks its last-reviewed date. Display that metadata (UNKNOWN if missing), separately from assessment/build time; test it.
- **[P2.3] [safe_auto]** code-quality/testing — `tools/pipsys/pipsys.R:1161-1176`: named Recommendation branch silently omits absent blocker/parallel sections and owner caveat. Emit labeled UNKNOWN placeholders and the owner-source caveat; test absent and populated variants.
- **[P2.4] [safe_auto]** testing — `tests/pipsys/test-pipsys.R:859-889`: advice test contains only one eligible completed report. Add competing dated completed reports and equal-time run-ID ties so newest/tie selection is actually exercised.
- **[P2.5] [safe_auto]** data-quality/testing — `tools/pipsys/pipsys.R:1153,1172`: site reread omits supported simple_frontmatter fallback; lenient completed reports lose full next text, and absent strict next becomes '-'. Reuse existing lenient parsing, preserve full text, normalize absent/blank/nontext next to UNKNOWN, keep CLI projection unchanged; test both shapes.
- **[P2.6] [safe_auto]** reproducibility — `tools/pipsys/pipsys.R:1127`: file source URI construction encodes spaces only, so roots containing literal # or % break navigation. Encode path components with base R while preserving drive/path separators; test an exact URI containing space/#/%.

## Passed / evidence sources

- Performance: no findings; bounded discovery, shared focus generation and small metadata/filter work are proportionate.
- Version control: no findings; generated outputs ignored, no sensitive inputs or unrelated change mixing observed in scoped source diff.
- Architecture, documentation and data quality confirmed the bounded site-only design, canonical roles/status separation and policy-compatible task descriptions; their focus-navigation findings are included above.
- Every specialist handoff is under `.cg-docs/orchestration/outputs/pipsystem/site-focus-and-navigation/20261102T211725Z-<role>/handoff.md`, where role is `code-quality`, `testing`, `documentation`, `version-control`, `reproducibility`, `performance`, `architecture`, or `data-quality`.

## Gaps

- Specialist reviews are static; the coordinator owns executed test/browser/render evidence in `.cg-docs/work-reports/2026-11-02-site-focus-and-navigation.md`.
- No package/pipeline correctness or live readiness is certified. Existing unrelated dirty files remain outside this review.
- Actual Quarto theme-button interaction and exhaustive visual inspection are not certified by the class-based contrast checks; no concrete defect was found and no new framework is required.
