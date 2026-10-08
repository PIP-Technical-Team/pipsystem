# Project Context

Additional context for Copilot and the Compound GPID plugin. Edit freely —
this file is committed to git and shared with the team.

## Data Sources
<!-- Where does data come from? File paths, databases, APIs, vintage conventions -->

## Domain Rules
<!-- Project-specific rules that Copilot should always follow -->

### Decision and Runtime Evidence Boundaries

- Treat decision approval, exact documentation-edit approval, roadmap evidence completion and runtime verification as separate claims. A completed design or harvest feature does not prove that its target capability works.
- Preserve unapproved M1 R1 and implementation gaps when integrating approved outcomes. Generated selection data does not select the row-level invalidation mechanism.
- Verify the exact nine-feature M2 start gate from fresh roadmap statuses and linked decision/harvest evidence. Gate passage supports later planning; it does not authorize implementation or certify stamp capability gaps.
- Keep partial M1 design integration active and unlinked to a bounded completed plan when a generic plan-completion update would otherwise mark the full feature done.
- Archive the full replaced Current Focus and prior review date before an approved conditional Focus change. Use the actual local execution date, including same-day updates with no date-value change.

Sources: `SYSTEM_DESIGN.md:194-205,323-383`; `.cg-docs/plans/2026-10-07-m0-m1-design-integration.md:129-154,296-312`; `.cg-docs/work-reports/2026-10-07-m0-m1-design-integration.md:185-299`. Reusable verification pattern: `.cg-docs/solutions/testing-patterns/2026-10-07-evidence-gated-design-integration.md`.

## Work in Progress
<!-- Modules, features, or migrations currently underway -->

## Workspace Notes
<!-- Related folders, dependencies on other projects in the VS Code workspace -->
- **pipfun**: PIP shared utilities, configuration, and options. Read only source.
- **pipload**: PIP storage IO, survey inventory, paths and vintages. Read only source.
- **pipaux**: PIP auxiliary data (CPI, PPP, population, GDP, PCE). Read only source.
- **pipdata**: PIP GMD/DLW cleaning, validation, and deflation. Read only source.
- **wbpip**: PIP statistical core for poverty and inequality computation. Read only source.
- **pipapi**: PIP serving layer, consumer of pipeline output. Read only source.
- **pipster**: PIP user facing computation package. Read only source.
- **pipfaker**: PIP synthetic data generation for testing. Read only source.
- **metapip**: PIP package installer, branch management, SHA pinned lockfile. Read only source.
- **stamp**: Lightweight versioned artifact store for R with sidecar metadata, pruning policies, and Hive-style partitions.


## Wiki Configuration
<!-- folder: wiki -->
<!-- audience: developers | researchers | end-users -->
<!-- tone: technical | conversational | formal -->
