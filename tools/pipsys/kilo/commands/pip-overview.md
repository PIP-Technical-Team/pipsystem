---
description: "pipsys v1: one table with every PIP package (branch, HEAD, uncommitted, version, open Plans, last handoff) and the roadmap summary."
---

Run this exact command with the shell tool. HUB is the `pipsystem` row of
`tools/pipsys/packages.csv` (`path` on Windows, written with `\`; `mac_path`
on macOS, `~` expanded). Use HUB also from a worktree: a worktree's own copy
reads only that worktree's handoffs.

- Windows: `<HUB>\tools\pipsys\pipsys.cmd overview`
- macOS: `Rscript --no-init-file <HUB>/tools/pipsys/pipsys.R overview`

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
