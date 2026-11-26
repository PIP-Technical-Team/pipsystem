---
description: "pipsys v1: latest handoff run per task, optionally for one project. Usage: /pip-handoffs [project]"
---

Run this exact command with the shell tool. HUB is the `pipsystem` row of
`tools/pipsys/packages.csv` (`path` on Windows, written with `\`; `mac_path`
on macOS, `~` expanded). Use HUB also from a worktree: a worktree's own copy
reads only that worktree's handoffs.

- Windows: `<HUB>\tools\pipsys\pipsys.cmd handoffs $ARGUMENTS`
- macOS: `Rscript --no-init-file <HUB>/tools/pipsys/pipsys.R handoffs $ARGUMENTS`

Before running it, check the arguments: they must be empty or one word made
only of letters, digits, `-` and `_`. Otherwise run nothing, print
`pipsys: invalid argument` and stop.

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
