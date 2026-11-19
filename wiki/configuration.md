# Configuration

<!-- cg:auto:config-keys -->

## Which Files Matter

You do not need to edit configuration for ordinary status questions or next-session prompts. These are the main reference files:

| File | Purpose |
|------------------------------------|------------------------------------|
| [Project Charter](../compound-gpid.md) | Project aim, constraints and documented focus. |
| [System Design](../SYSTEM_DESIGN.md) | Approved target decisions and unresolved questions, not proof that a feature is implemented. |
| [AGENTS.md](../AGENTS.md) | Workspace boundaries, evidence rules and required worker outputs. |
| [ORCHESTRATOR.md](../ORCHESTRATOR.md) | The coordinator's working instructions. |
| [kilo.json](../kilo.json) | The project agent definition and configured tool permissions. |
| [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md) | Shared reporting, privacy and workflow rules. |
| [Handoff Template](../.cg-docs/orchestration/templates/handoff.md) | The format new worker reports should follow. |
| [Wiki Manifest](_wiki.yml) | Page list and ownership for this user guide. |

The root `kilo.json` defines `pip-orchestrator` as a selectable primary agent and loads its prompt from `ORCHESTRATOR.md`. There is no separate orchestrator to install in each project.

This wiki is for people. It is not automatically added to the operational agent's permitted reads and does not change its instructions or permissions. Ask for a separately approved Code task if the actual rules or configuration need to change; do not treat a wiki edit as a behavior change.

Sources: [ORCHESTRATOR.md](../ORCHESTRATOR.md), lines 32-74, 81-85 and 365-373; [kilo.json](../kilo.json), lines 4-58 and 121-138; [System Design](../SYSTEM_DESIGN.md), lines 5-18; [Wiki Manifest](_wiki.yml). <!-- cg:auto:end -->

<!-- cg:auto:defaults -->

## Who Does What

| Role | Responsibility |
|------------------------------------|------------------------------------|
| You | Choose and approve the work. Start a package session only when the fallback requires it. |
| `pip-orchestrator` | Perform or delegate approved work, then verify the package diff, checks, and handoff. |
| Internal subagent or package Code session | Work in the verified package checkout, run the agreed checks and save its assigned handoff. |

From `pipsystem`, the orchestrator and its internal subagents can edit registered PIP repositories for authorized tasks. Package files stay in their own repositories. A separate Code session is a fallback when the internal worker cannot do the work within its tool permissions or package context.

## Important Boundaries

- `pip-orchestrator` can use shell tools and run scoped development tests, but does not run the PIP pipeline.
- It can use internal subagents without opening another chat. New Agent Manager sessions need explicit user authorization.
- Commits, pushes and merges need explicit authorization. Work authorization does not override tool permissions or production boundaries.
- It does not search private session databases or silently read other chats.
- It does not change approved design decisions. Unresolved questions remain unresolved until the appropriate direct decision is made.

Keep auto-approve **ON** as the chosen user setting. Explicit tool denials and the need for approval of the work still apply. An independent working session follows its own verified permissions, not permissions invented by a prompt.

## Old Coordination Records

Helper code, the registry, state files and historical records are retained. Their formal mutation, ownership locks and intake workflow are deferred. An old "activation blocked" record is not a reason to stop ordinary handoff reading or advice. Do not run a helper or start a permission experiment to clear that old gate.

Sources: [AGENTS.md](../AGENTS.md), lines 9-17 and 45-64; [ORCHESTRATOR.md](../ORCHESTRATOR.md), lines 20-45, 112-142, 365-431 and 465-487; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 3-27 and 80. <!-- cg:auto:end -->

<!-- cg:auto:environment-vars -->

## Setup And Troubleshooting

The ordinary handoff workflow does not require a new environment variable, service, watcher or helper installation. Open the main checkout, select the agent and ask it to read the saved handoffs.

If the agent list or prompt appears stale, reload the editor's project configuration from the main checkout using the controls available in your client. No particular Kilo release or special command spelling is required.

If a read is denied, ask the agent to identify the exact missing path and what part of the summary it could not verify. Do not turn off safety boundaries or change global settings as a workaround. Other useful, permitted advice can continue with the coverage gap clearly stated.

## Gaps

- A configured permission is not proof of its effective behavior in a running client; a config edit does not prove an already-open chat has reloaded it.
- Cross-project worker write access must be established for the actual task. This user guide does not grant it.
- The project design is a target system, not a certification that all package or production capabilities already work.

Sources: [ORCHESTRATOR.md](../ORCHESTRATOR.md), lines 32-37, 410-431 and 489-507; [System Design](../SYSTEM_DESIGN.md), lines 5-18; [Coordination Contract](../.cg-docs/orchestration/CONTRACT.md), lines 15-23 and 80. <!-- cg:auto:end -->

← [Home](README.md)
