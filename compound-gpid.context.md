# Project Context

Additional context for Copilot and the Compound GPID plugin. Edit freely —
this file is committed to git and shared with the team.

## Data Sources
<!-- Where does data come from? File paths, databases, APIs, vintage conventions -->

## Domain Rules
<!-- Project-specific rules that Copilot should always follow -->

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
