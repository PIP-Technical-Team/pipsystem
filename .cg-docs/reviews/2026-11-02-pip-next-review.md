---
date: 2026-11-02
depth: standard
type: standard
plan: .cg-docs/plans/2026-11-02-pip-next.md
findings:
  P2.1: fixed
  P3.1: fixed
---

# Review: /pip-next

Review mode: standard (ordinary prompt and low-risk tests; no runtime/installer changes). Eight route-appropriate reviewers returned usable file-specific output. Findings: P0 0, P1 0, P2 1, P3 1. No incomplete reviews.

## P2 - Important

**[P2.1] cg-testing** `tests/pipsys/fixtures/pip-next-cases.json:17` -- [manual] Frozen cases lack literal information-command stdout, stderr and exit status.

Why: prose summaries cannot demonstrate the command's required verbatim source-output preservation and explicit information-command failures. Live happy-path runs do not sample a failed information command.

Fix: add a small literal-output/error frozen case. Require exact successful stdout, visible failed-command error/exit status, and a gap/UNKNOWN instead of invented facts. Execute with the actual command and existing isolated actor; do not add a framework.

## P3 - Minor

**[P3.1] cg-testing** `tests/pipsys/fixtures/pip-next-cases.json:111-115` -- [manual] The invalid-input sample combines punctuation and multiple words and does not sample accepted trimming.

Why: a model that rejects only multiple words could pass the existing case while missing invalid single-token punctuation. Valid outer whitespace also needs a sample.

Fix: independently sample single-token punctuation and accepted trimmed package input; retain the existing case and update fixture-ID tests and isolated actor inputs. A plain multiple-package sample can exercise the single-package rule independently too.

## Passed source reviews

- cg-code-quality: no issues; command sequence, validation, original evidence, parallel and handoff rules inspected.
- cg-documentation: no issues; usage, waiting/parallel meanings, provenance and copy-ready prompt contract inspected.
- cg-version-control: no issues; task source is nonignored, installed copy ignored, source/installed hashes equal, installer/wrapper unchanged, no staging/commits.
- cg-reproducibility: no issues; SHA/ref/worktree/date provenance, ET/UTC and self-evidence rules inspected.
- cg-performance: no issues; bounded candidate discovery and reuse of existing tools, no new planner/cache.
- cg-architecture: no issues; development/runtime responsibilities and checkout-relative installation fit existing architecture.
- cg-data-quality: no issues; exact registry matching, UNKNOWNs, original source and independence rules inspected.

Reviewer handoffs are under `.cg-docs/orchestration/outputs/pipsystem/pip-next/20261102T202426Z-orchestrator/review-<specialty>/handoff.md`. The testing handoff provides full evidence and proposed fixes at lines 23-35.

## Resolution authorization

The user approved implementation, tests and review fixes, with autonomous in-scope deviations. Both findings are test-only, reversible and inside approved R1/R6/V4; no material decision or boundary change is needed. Address both, including P3, without another approval. Their manual tags are retained above; this is not a blanket approval for unrelated manual findings.

## Gaps

This is a source-review report, not certification of future LLM behavior. Live and frozen assessments remain separate required evidence. IDE Problems diagnostics are unavailable; executed R/YAML/JSON checks are used and their scope is reported.
