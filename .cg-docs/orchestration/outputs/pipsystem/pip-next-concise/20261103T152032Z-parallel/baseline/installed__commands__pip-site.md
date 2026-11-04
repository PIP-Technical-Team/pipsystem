---
description: "pipsys v1: regenerate the local Quarto site (overview, handoffs, roadmap, design, status pages, every Plan) and print the path of index.html."
---

Run this exact command with the shell tool, with a shell timeout of 600000 ms,
from the root of the current pipsystem checkout (the session working
directory: the main checkout or an Agent Manager worktree):

tools\pipsys\pipsys.cmd site

Print its standard output verbatim. Do not summarize, reorder or add rows.
If it exits with an error, print the error output and stop.
