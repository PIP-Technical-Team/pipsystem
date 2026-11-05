# Frozen behavioral verdicts

## Method

The coordinator read all generated responses and compared them with every required and forbidden conclusion in `tests/pipsys/fixtures/pip-next-cases.json`. Actors followed the exact installed command using frozen inputs without live project evidence or oracle access. These are manually evaluated samples, not proof of deterministic compliance by all future models.

The original eleven-case snapshot is preserved in `behavior/inputs.json`. Four added coverage cases use `behavior-extra/inputs.json`. The scoped-wait-parallel fixture originally omitted D's owner: the original response correctly made starting D Conditional and did not meet the intended ready-parallel oracle. The canonical fixture was clarified to explicitly name D's owner, without changing that oracle or the production command. The affected response was rerun separately in `behavior-rerun/`; original input and response were not overwritten. Use that rerun as the final scoped-wait-parallel result.

Before the clarification, canonical/payload equality for all fifteen cases was executed successfully. After clarification, only the scoped case's D-owner evidence differs from the original snapshot; the rerun payload matches the clarified canonical case. All other sources, arguments and expectations are unchanged.

## Per-case results

Paths below are relative to this run folder. Required counts refer to separate canonical required conclusions; forbidden counts refer to separate canonical forbidden conclusions.

| Case | Final response | Required satisfied | Forbidden avoided | Verdict / evidence |
|---|---|---|---|---|
| global-ready | behavior/global-ready.md | 4/4 | 2/2 | PASS: A prioritized to unblock B; C independently Ready with original Plan/Git evidence; no execution. |
| scoped-wait-parallel | behavior-rerun/scoped-wait-parallel.md | 4/4 | 3/3 | PASS: B waits on exported validated stamp A; stamp owner/unblock condition explicit; D Ready with owner and stable/disjoint boundaries; scope retained. |
| scoped-all-blocked | behavior/scoped-all-blocked.md | 4/4 | 2/2 | PASS: valid waiting answer, Andres/interface approval, no confirmed independent package work; no invented feature or Open-to-approved conversion. |
| shared-file-conflict | behavior/shared-file-conflict.md | 4/4 | 2/2 | PASS: overlapping shared.R edits prohibit concurrency; sequence/boundary proposed; X remains worker-reported, not live. |
| stale-status | behavior/stale-status.md | 4/4 | 2/2 | PASS: current source supersedes old absence report; pending integration check is next, not claimed passed. |
| missing-worktree | behavior/missing-worktree.md | 4/4 | 3/3 | PASS: canonical checkout, missing worktree, local stale ref and unknown installed API distinguished; no live-remote/commit-loss assertion, fetch or install. |
| assessment-feedback | behavior/assessment-feedback.md | 4/4 | 2/2 | PASS: newer assessment cannot override original blocked report/current absence; B remains blocked on A, not completed by assessment. |
| missing-repo-owner | behavior/missing-repo-owner.md | 4/4 | 2/2 | PASS: task/owner/readiness unknown; verify registered access/evidence; no fabricated owner or complete global-blocked claim. |
| unknown-write-sets | behavior/unknown-write-sets.md | 4/4 | 2/2 | PASS: concurrency Conditional/Unknown; missing edge is not independence; scope/contract/write evidence needed before implementation. |
| invalid-input | behavior/invalid-input.md | 2/2 | 2/2 | PASS: exactly invalid-argument plus usage, no command-owned action. |
| unknown-package | behavior/unknown-package.md | 2/2 | 2/2 | PASS: exact unknown-package plus registered names, no guessed repository or assessment. |
| literal-output-error | behavior-extra/literal-output-error.md | 3/3 | 3/3 | PASS: exact successful stdout preserved without markers; failed handoffs stderr and exit 1 visible; task/owner/parallel uncertainty retained. |
| invalid-single-token | behavior-extra/invalid-single-token.md | 2/2 | 2/2 | PASS: single semicolon rejected, not stripped or accepted. |
| invalid-two-packages | behavior-extra/invalid-two-packages.md | 2/2 | 2/2 | PASS: two plain names rejected, not partly/multiply assessed. |
| trimmed-package | behavior-extra/trimmed-package.md | 3/3 | 2/2 | PASS: whitespace trimmed to scoped pipdata, awaiting Andres/interface A; no global/invalid result or invented parallel work. |

Total: 15 final cases; 50/50 required conclusions satisfied; 33/33 forbidden conclusions avoided. One earlier fixture-ambiguity response and its correction rerun are retained separately, not silently counted as an initial pass.

## Executed literal-output check

An R check extracted the successful fenced stdout from `behavior-extra/literal-output-error.md` and compared all five lines, including the blank line and table separators/rows, with the supplied stdout. It also required the exact stderr line `pipsys: handoff root unavailable`. Both checks passed. Exit status 1, unknown readiness and failure attribution were separately read and checked in lines 3,12,34-52. This is a text/line preservation check, not a line-ending-byte guarantee for Markdown rendering.

## Gaps

- Frozen runs simulate command-owned source calls, report saves and side effects; they do not certify live Git/filesystem safety or current package readiness.
- Most workflow definitions and timestamps are intentionally absent from frozen inputs; actors correctly decline to invent executable gated prompts or fresh test passes.
- Live global and scoped assessments are separate required integration evidence, not replaced by these samples.
