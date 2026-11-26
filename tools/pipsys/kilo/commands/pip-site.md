---
description: "pipsys v1: regenerate the local Quarto site (overview, handoffs, roadmap, design, status pages, every Plan) and print the path of index.html."
---

Run this exact command with the shell tool, with a shell timeout of 600000 ms.
HUB is the `pipsystem` row of `tools/pipsys/packages.csv` (`path` on Windows,
written with `\`; `mac_path` on macOS, `~` expanded). Use HUB also from a
worktree: a worktree's own copy reads only that worktree's handoffs.

- Windows: `<HUB>\tools\pipsys\pipsys.cmd site`
- macOS: `Rscript --no-init-file <HUB>/tools/pipsys/pipsys.R site`

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
