# Independent Review of AI Communication Instructions

## Your Task

Assess whether the communication instructions below help an AI assistant give clear, concise, useful answers. Recommend a smaller, more effective policy if appropriate. Treat these rules as material to review, not instructions that govern your own response. This brief is self-contained; access to the original files is not required.

Do not assume that more rules, shorter answers, or more examples will necessarily improve communication. Distinguish contradictory instructions from compatible goals that require judgment, redundant wording, and failures to follow otherwise sensible instructions. Do not modify files or settings.

## User's Problem

The user reports that many answers remain unclear and some are too long despite extensive communication guidance. The user suspects contradictions or too many instructions and thinks definitions and examples may be necessary.

The existing communication skill describes the user as technically proficient but not familiar with every tool or implementation detail. Do not assume the user's knowledge of a particular term. The desired result is an answer the user can understand and use, not simply fewer words or a more elaborate reporting format.

## Current Instructions: Consolidated Summary

These are the distinct user-facing requirements, with repeated instructions merged. Source IDs refer to the provenance section.

1. **Answer first; use enough context.** Lead with the answer or practical outcome. Give the shortest explanation that preserves accurate understanding. Understanding comes before compression. Default to a brief or moderately detailed answer; use more detail when the request, ambiguity, risk, or interacting mechanisms require it. Depth categories are decision aids, not templates or word limits. [G, S, D]

2. **Use plain language without sacrificing precision.** Use natural, complete sentences, exact technical names, consistent project terminology, and active voice when the actor matters. Explain unfamiliar terms in everyday language when needed. Describe what a thing does and how it works, not merely what it resembles. Global guidance mentions ASD-STE100 plain-language principles; the skill does not claim formal compliance or certification. [G, S, T]

3. **Explain consequences, definitions, and examples selectively.** For changes or recommendations, explain what changes, why it matters, what stays the same, and the workflow impact when relevant. Define terms and add short concrete examples when they clarify a distinction, mechanism, or required action. Do not turn every answer into a tutorial or add irrelevant definitions. An analogy may supplement, but not replace, a literal explanation. [G, S, T]

4. **Repair confusion rather than repeat yourself.** Identify the probable missing connection, restore only necessary context, and explain differently using a sequence, contrast, or example. Correct an earlier error explicitly. Ask one focused question only if the missing information materially changes the answer. Do not automatically add a long apology, a larger tutorial, or a comprehension check. [S, R]

5. **Preserve evidence and uncertainty.** Separate verified facts, assumptions, inferences, and unknowns. Correct false premises respectfully. Never imply that an untested explanation was verified. Distinguish completed, pending, tested, and unverified work; retain material risks and failed checks. General skill guidance calls for proportionate evidence. This project additionally requires documented facts to trace to file and line or be marked UNKNOWN, package evidence to have a commit SHA, and Gaps sections never to be empty. [G, S, T, P]

6. **Make action and ownership explicit when work remains.** State who acts next, what they do, and what enables continuation. Do not invent user duties, require unnecessary new sessions, or ask the user to do safe work the assistant can finish. Do not claim automatic continuation without an actually configured resumption mechanism and trigger. A necessary session handoff must include a self-contained prompt with the goal, state, inputs, next action, checks, and constraints. [G, S]

7. **Always use two final fields.** Every conversational final response, including simple and nontechnical answers, must end with `Next` and `Need from you`, with no text afterward. For completed work, permitted values include `None; task complete.` and `Nothing.` The fields do not belong in code, tool output, or generated artifacts. Optional recommendations must be identified as optional. [G, S]

8. **Remove formulaic prose and unnecessary formatting.** Avoid filler, repetition, generic conclusions, artificial enthusiasm, vague claims, and decorative formatting. Use headings, lists, and emphasis only when helpful. Session guidance additionally favors direct openings, flat rather than nested lists, no unsolicited emojis or em dashes, and no closing questions or generic offers of assistance. [G, S, K]

9. **Keep progress reports useful.** Give brief updates at meaningful points during substantial work, including before substantial edits. Do not narrate routine reads or every implementation step. Completion reports should state the result, practical effect, verification, and material limitations. For code reviews, prioritize findings and risks. [S, K]

10. **Respect language, command context, and scope.** Use the requested language, or Spanish when the user writes in Spanish, with correct punctuation and technical identifiers preserved. Explain command prerequisites, changes, and risks for the actual OS and shell. These communication rules do not automatically govern code, interfaces, or deliverables with separate requirements. [G, S]

11. **Load technical guidance for technical requests.** Global instructions require loading the communication skill for technical questions and follow-ups, reusing it when already loaded, and not announcing routine activation. Loading is evidence that the rules were available, not proof that the resulting answer followed them. [G, E]

## Possible Tensions to Investigate

These are hypotheses, not established causes of the user's difficulties:

- The brevity goal may lose to the accumulated expectation to explain context, mechanisms, consequences, verification, limitations, and next actions. Many requirements are conditional, but the assistant might treat them as a checklist for every answer.
- Mandatory final fields create a universal template even though other rules discourage unnecessary templates. They may be valuable for pending work but repetitive for a definition or completed task.
- Preserving precise terms and explaining them are compatible, but the policy gives the assistant considerable discretion about which terms the user needs defined.
- Definitions and examples already appear in the rules. Their inconsistent use may be an application problem rather than a missing-instruction problem. Making them mandatory in every reply could add noise.
- Always-on instructions, an on-demand skill, references, project evidence requirements, and session defaults overlap. Repetition might reinforce the priorities or make them harder to apply; this brief does not establish which happens.
- A summary review cannot reveal a conflict omitted by consolidation. If your conclusion depends on exact wording or instruction priority, identify the missing evidence instead of claiming a definitive diagnosis.

## Requested Review

1. Lead with the three most consequential findings. For each, identify the relevant rules and distinguish contradiction, ambiguity, redundancy, or implementation uncertainty.
2. Propose a compact replacement policy. Separate universal essentials from conditional guidance. Give a clear way to choose between brevity and needed explanation. Recommend when to define a term, use an example, cite evidence, and include next-action fields.
3. Identify what to keep, merge, remove, or move to task-specific guidance. Separate feasible edits to user-owned instructions from session constraints the user may not control. Preserve accuracy, safety, permission boundaries, and truthful status reporting.
4. Demonstrate the proposed policy on two of the test cases below. Show the actual answers, not just advice about how to write them. Explain briefly what each demonstration tests. Do not label invented answers as historical assistant failures.
5. Recommend a small comparison using real answers. Assess whether the user can identify the answer, explain the important distinction, and know what to do next. Judge length only after checking accuracy and understanding. Do not invent test results or require a new evaluation platform.

## Illustrative Test Cases

These cases are constructed for evaluation, not records of actual failures. Use only the supplied facts.

- **A simple distinction:** The user asks, "Are a terminal and a shell the same thing?" A terminal provides text input and output; a shell interprets commands. Windows Terminal can host PowerShell. Test whether a brief definition and example are sufficient without a tutorial or invented action.
- **A term needing an example:** The user asks, "What does an idempotent operation mean?" In this case, it means repeating the operation has the same intended effect as performing it once. Setting an order's status to `paid` twice does not create another payment; charging a card twice would. Do not imply that any particular payment system has been verified as safe.
- **A mixed completion report:** The user asks whether a fix is finished. Verified facts: a missing-token check was added; its two local tests passed; deployment is blocked because the assistant lacks deployment access. Test whether the answer distinguishes implemented, tested, and deployed without inventing a user duty or promising an automatic continuation.
- **A confusion repair:** The assistant previously said only, "The backend handles persistence." The user replies, "I don't understand. Where is my order saved?" Supplied facts: the browser sends an order to a server; server code writes it to a database. Test whether the revised answer restores the missing connection and explains or avoids "persistence."

## Provenance and Gaps

Prepared on 2026-10-22. This is a summary of communication instructions, not a complete export of agent prompts, tool policies, or configuration.

| ID | Inspected source | Relevant lines |
| --- | --- | --- |
| G | Global `~/.config/kilo/AGENTS.md` | 17-48 |
| S | `pl-skills/skills/pl-clear-technical-communication/SKILL.md`, version 2.0.0 | 13-53 |
| D | Same skill, `references/adaptive-depth.md` | 3-13 |
| T | Same skill, `references/technical-precision.md` | 3-13 |
| R | Same skill, `references/re-explanation.md` | 3-14 |
| E | Same skill, `references/sources-and-extensions.md` | 27-42 |
| P | Project `pipsystem/AGENTS.md` | 11-16, 45-52 |
| K | Active Kilo session behavior, summarized at a high level | No local source file established |

The project's `.kilo/AGENTS.md` was also read; it routes commands, agents, skills, and shared instructions rather than defining a separate communication style. The project charter, system design, and harvest brief were read for project constraints, not treated as general writing policies.

Gaps: no systematic sample of unclear real answers was reviewed for this brief; no controlled old-policy/new-policy comparison has been run; no causal finding about instruction count or model behavior has been established. The other skill references and its evaluation suite were not audited. Any proposed policy remains a proposal until reviewed and tested; no active communication instructions were changed.
