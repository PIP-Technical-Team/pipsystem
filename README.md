# pipsystem

Design, evidence and project coordination for the PIP data pipeline. The project aim is to rerun only the work affected by a data or code change. This repository is not the production pipeline runner.

## Start Here

[**Open the user wiki**](wiki/README.md) for a plain-language guide to working with `pipsystem` and its `pip-orchestrator` agent.

- [Daily workflow and example messages](wiki/usage.md)
- [Configuration, permissions and project boundaries](wiki/configuration.md)
- [Optional task commands and documentation maintenance](wiki/cli-reference.md)

In short: other Code sessions do the work and save reports; `pip-orchestrator` reads those reports and prepares the next instructions; you stay in control.

Sources: [Project Charter](compound-gpid.md), lines 10-33; [Orchestrator Rules](ORCHESTRATOR.md), lines 7-45 and 81-110.