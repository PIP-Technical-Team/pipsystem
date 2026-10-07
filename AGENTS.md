# AGENTS.md

## Read first

1. `compound-gpid.md`: objective, deliverables, constraints, current focus.
2. `SYSTEM_DESIGN.md`: how the system is supposed to work. Every statement is marked Decided or Open.
3. `HARVEST_BRIEF.md`: what to extract from the packages, and in what schema.

## Rules

* **`pipsystem` is the only writable folder.** Every other workspace folder is a read only source. Never edit, create, delete, format, stage, or commit anything there.
* **Never change a Decided item in `SYSTEM_DESIGN.md`** without explicit approval. If code contradicts it, report the contradiction.
* **When you find evidence for an Open item,** record it with file and line and propose the change. Do not apply it yourself.
* **No fabrication.** Every fact traces to a file and line, or is marked `UNKNOWN`.
* **Gaps sections are never empty.**
* **Record the commit SHA** of every package repository you read.
* **R:** `data.table` and `collapse`.
