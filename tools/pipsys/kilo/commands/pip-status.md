---
description: "pipsys v1: fixed-format status of one PIP package (Repository, Pipeline stages, Plans, Handoffs, Gaps). Usage: /pip-status <package>"
---

Run this exact command with the shell tool. HUB is the `pipsystem` row of
`tools/pipsys/packages.csv` (`path` on Windows, written with `\`; `mac_path`
on macOS, `~` expanded). Use HUB also from a worktree: a worktree's own copy
reads only that worktree's handoffs.

- Windows: `<HUB>\tools\pipsys\pipsys.cmd status $ARGUMENTS`
- macOS: `Rscript --no-init-file <HUB>/tools/pipsys/pipsys.R status $ARGUMENTS`

Before running it, check the arguments: they must be empty or one word made
only of letters, digits, `-` and `_`. Otherwise run nothing, print
`pipsys: invalid argument` and stop.

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
