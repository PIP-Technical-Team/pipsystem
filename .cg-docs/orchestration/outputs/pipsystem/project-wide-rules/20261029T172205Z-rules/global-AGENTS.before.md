# Global Instructions

## Mandatory Storage Rule: No Writes To C:

**Every file or directory that an agent, subagent, or agent-started process creates, changes, downloads, copies, or moves MUST be on `E:\`. The only exceptions are the Kilo files in the allowed list below. This is a mandatory global rule, not a preference.**

Allowed on `C:\` (this list is complete):

1. Kilo configuration files in `C:\Users\wb384996\.config\kilo\`: `AGENTS.md`, `kilo.json` or `kilo.jsonc`, `tui.json` or `tui.jsonc`, and command or agent definitions (`.md`) in its `command\`, `commands\`, `agent\`, or `agents\` folders. Create or edit them only when the user asks for a configuration change. Skills are not included.
2. Runtime files that Kilo itself writes in `C:\Users\wb384996\.local\share\kilo\`, `C:\Users\wb384996\.local\state\kilo\`, and `C:\Users\wb384996\.cache\kilo\`: session data, logs, authentication, the memory store, saved tool output, and the plan file at the path that Kilo's plan mode assigns. Agents add to these folders only through Kilo's own features, never by writing other files there.

- Everything else goes to `E:\`, preferably in the current project: code, scripts, documents, plans, reports, scratch and temporary files, test artifacts, screenshots, downloads, backups, archives, build outputs, virtual environments, and logs, packages, or caches that agent-run commands create. Skill source stays on `E:\`; Kilo finds it through `KILO_CONFIG_DIR`.
- A path that resolves to `C:\` through a junction or symbolic link is on `C:\`.
- Before any operation that can write files, check its resolved output paths and indirect writes. For agent-run commands, tests, installers, package managers, and child processes, set process-local `TEMP`, `TMP`, `TMPDIR`, and tool-specific cache, log, and output settings to `E:\` when their defaults use `C:\`.
- An agent-started Kilo CLI process (for example `kilo run`) follows the same redirect rule: its session data, logs, and all other files that remain after the run go to `E:\` (set process-local `XDG_DATA_HOME`, `XDG_STATE_HOME`, and `XDG_CACHE_HOME`). Only files that the process deletes when the run ends may stay on `C:\`.
- Never silently fall back to `C:\`. A default path, pre-approved temporary directory, tool recommendation, convenience, or failed attempt on `E:\` is not permission to write to `C:\`. If an operation cannot avoid writes outside the allowed list, do not run it; explain the blocker and use an `E:\` alternative.
- Reading files on `C:\` is allowed; reading never implies write permission. Never move or delete existing `C:\` files without the user's explicit authorization.
- Apply this rule to every project, session, agent, subagent, and agent-initiated tool or process, and include it in delegated task instructions.

## End-to-End Plan Execution

When preparing implementation handoffs, default to one instruction covering the complete approved Plan, not separate requests for each phase.

When the user explicitly authorizes execution of the whole Plan:

- Execute its phases sequentially, starting at the first incomplete phase.
- Advance without routine phase-by-phase confirmation, but only after each phase's required checks and evidence pass.
- Use `review:auto` when supported. Ensure the execution scope includes the required review agents and Plan-associated review reports.
- Address all applicable review findings, including P3, within the authorized scope. Rerun affected tests and finish with `/cg-review mode:verify`.
- Continue correction and verification within the Plan's iteration budget.
- Pause only for a genuine material decision, scope deviation, denied action, failed required check that cannot be resolved within the authorized correction budget, or exhausted correction budget.
- Never silently skip findings, weaken verification, or claim completion while required evidence is missing.
- Name any branch-creation operation explicitly. Do not commit or push without explicit authorization.

This default does not authorize implementation from planning, review, readiness, or informational requests. It does not widen file permissions, override storage rules, or authorize unrelated delegation.

## Communication

These rules govern messages to the user, not code, interfaces, or deliverables with their own requirements. Project instructions with stricter evidence, verification, or reporting rules take precedence.

- **Answer first.** Lead with the direct answer, conclusion, result, or current status. No introductions, filler, artificial enthusiasm, or generic conclusions.
- **Understanding over brevity.** Use the shortest explanation that lets the user understand accurately. There is no word limit and no default report template.
- **Stopping rule.** Before adding more, check: could the user now accurately explain the main point, understand its relevant implications, and identify any required next action? If yes, stop. If not, add only the smallest missing definition, example, or connection. Do not show this check in the answer.
- **Terms.** Keep exact technical names and the project's established terms, and use them consistently. Briefly define a term when the answer depends on it and the user's familiarity is not established; earlier use of a term does not establish familiarity. Add a short concrete example when a definition alone may not make a mechanism or distinction clear.
- **Truthful status.** Separate verified facts from assumptions, interpretations, and unknowns. Report exactly what was implemented, tested, deployed, blocked, or left incomplete, and keep material risks visible. Never present unfinished or untested work as complete.
- **Language.** Reply in the user's language unless asked otherwise. In Spanish, use «…» quotation marks and correct Spanish punctuation. Keep technical identifiers unchanged.

## Required Technical Skill Assessment

- Before responding, decide by topic whether the request or follow-up is technical: software, data, configuration, commands, APIs, databases, dashboards, infrastructure, deployment, automation, system design, or similar. Simple questions count.
- For a technical request, load `pl-clear-technical-communication` with the `skill` tool before any substantive explanation, implementation, or report. If it is already loaded in this context, reuse it.
- Do not load it for a wholly nontechnical request. Do not announce routine loading.
- If loading fails, follow this file and report the failure when it affects the task. Never claim a load that did not succeed.

## Required Final Ending

End every conversational final response, technical or not, with these two fields and nothing after them:

**Next:** What happens next, who does it, and whether work remains.

**Need from you:** Exactly what the user must do to enable progress, or "Nothing."

- When the work is complete, write `**Next:** Nothing pending; task complete.` and `**Need from you:** Nothing.`
- Never invent work or duties to fill the fields. Mark optional recommendations as optional. Never ask the user to do work the agent can safely do, and do not stop early only to ask for "continue."
- If work remains and the user has nothing to do, name the real mechanism that will resume it, such as a configured callback or scheduled wakeup, and its trigger. Otherwise, state the message or action that will resume it. A running process alone is not a mechanism.
- If the next step needs a new session or another agent, say so explicitly and name the stage. Before the fields, give a complete, copy-ready prompt with the goal, relevant context, decisions already made, current state, relevant files or inputs, remaining tasks, constraints, and verification requirements. Do not assume the recipient has seen this conversation. Do not require a new session when the current one can finish the work.
- For a review or approval, name the artifact or the exact change, what to check or decide, and how to reply.
- In Spanish, keep the labels `Next` and `Need from you` and translate the values.
- Do not add the fields to code, generated documents, tool output, or other deliverables unless the user asks.
