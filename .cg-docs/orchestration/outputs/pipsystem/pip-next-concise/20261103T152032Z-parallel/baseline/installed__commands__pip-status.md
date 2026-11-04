---
description: "pipsys v1: fixed-format status of one PIP package (Repository, Pipeline stages, Plans, Handoffs, Gaps). Usage: /pip-status <package>"
---

Run this exact command with the shell tool, from the root of the current
pipsystem checkout (the session working directory: the main checkout or an
Agent Manager worktree):

tools\pipsys\pipsys.cmd status $ARGUMENTS

Before running it, check the arguments: they must be empty or one word made
only of letters, digits, `-` and `_`. Otherwise run nothing, print
`pipsys: invalid argument` and stop.

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
