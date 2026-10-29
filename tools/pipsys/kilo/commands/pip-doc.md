---
description: "pip-doc: write a cited, fact-checked and simplified pipsystem document in fixed steps. Usage: /pip-doc <target.md> <source> [source ...] -- <purpose>"
---

Arguments: $ARGUMENTS

Run these steps in this order. Do not skip, merge or reorder them. Start each
subagent with the `task` tool and give it only the inputs named here. ROOT is
the absolute path of the current pipsystem checkout (the session working
directory: the main checkout or an Agent Manager worktree); pass it to every
subagent. Write only inside ROOT, never on C:.

0. Parse the arguments. TARGET is the first argument, a `.md` path (use
   `docs/<name>.md` when the user gives only a name). SOURCES are the next
   arguments up to `--`; PURPOSE is the text after `--`.
   - TARGET and every SOURCE must be relative paths made only of letters,
     digits, `.`, `_`, `-` and `/`, with no `..` part. Otherwise run nothing,
     print `pip-doc: invalid path <path>` and stop.
   - Every SOURCE must exist.
   - SLUG is the TARGET file name without `.md`. RUN is
     `.cg-docs/orchestration/outputs/pipsystem/doc-<SLUG>/<UTC time as
     yyyyMMddTHHmmssZ>-pip-doc`.
   - Run `tools\pipsys\pipsys.cmd check-path "<TARGET>"` and
     `tools\pipsys\pipsys.cmd check-path "<RUN>"`. If either exits with an
     error, print it and stop.
   - Create RUN and `RUN/handoff.md` in the pip-handoff-v2 format of
     `.cg-docs/orchestration/CONTRACT.md`, status `running`.
1. Writer. Subagent `pip-doc-writer` with ROOT, TARGET, SOURCES and PURPOSE.
2. Checker, facts. Subagent `pip-doc-checker` with ROOT, MODE `facts` and
   DOCUMENT TARGET; save its whole reply as `RUN/facts-1.md`. If a verdict
   is not `supported`, run `pip-doc-writer` with ROOT, TARGET, SOURCES,
   PURPOSE and FIX LIST `RUN/facts-1.md`, then the checker again; save it as
   `RUN/facts-2.md`. If `facts-2.md` has an `unsupported`, `wrong` or `uncited`
   row, set the handoff to `blocked`, name the rows and stop; list `broad` rows only.
3. Save an exact copy of TARGET as `RUN/checked.md`.
4. Simplifier. Subagent `pip-doc-simplifier` with ROOT and TARGET.
5. Checker, meaning. Subagent `pip-doc-checker` with ROOT, MODE `meaning`,
   BEFORE `RUN/checked.md` and AFTER TARGET. Save its reply as
   `RUN/meaning.md`. If a verdict is not `same`, leave TARGET and
   `RUN/checked.md` as they are, set the handoff to `blocked`, name the rows
   and both paths, and stop.
6. Script check. Run `tools\pipsys\pipsys.cmd check-doc "<TARGET>"` with the
   shell tool and save its output as `RUN/check-doc.md`. If it exits with an
   error, set the handoff to `blocked` and stop.
7. Set the handoff to `completed` with the TARGET path and the three summary
   lines. Print the TARGET path, the summaries and the RUN path.
