import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import test from "node:test";

// Read-only checks of this change, not the deferred coordination helper.
const rootUrl = new URL("../../../../../../", import.meta.url);
const root = fileURLToPath(rootUrl);
const baselineSha = "f2345c93f875f3ccc7c5b859b8032d7fe0256102";
const read = (path) => readFileSync(new URL(path, rootUrl), "utf8").replaceAll("\r\n", "\n");
const baseline = (path) => execFileSync("git", ["show", `${baselineSha}:${path}`], {
  cwd: root, encoding: "utf8", windowsHide: true,
}).replaceAll("\r\n", "\n");
const config = JSON.parse(read("kilo.json"));
const original = JSON.parse(baseline("kilo.json"));
const agent = config.agent["pip-orchestrator"];
const originalAgent = original.agent["pip-orchestrator"];
const maintenanceReport = ".cg-docs/orchestration/outputs/pipsystem/orchestrator-self-maintenance/*/handoff.md";
const ruleFiles = ["ORCHESTRATOR.md", "kilo.json", "AGENTS.md", ".cg-docs/orchestration/CONTRACT.md"];
const frameworkDirectories = [
  ".kilo/command", ".kilo/commands", ".kilo/agent", ".kilo/agents",
  ".kilo/instructions", ".kilo/shared", ".kilo/skill", ".kilo/skills",
  ".compound-gpid", ".cg-docs",
];
const frameworkFiles = [".kilo/AGENTS.md", ".kilo/kilo.json"];

test("configuration changes only the orchestrator's approved description, edit, read and skill rules", () => {
  const expected = structuredClone(original);
  const expectedAgent = expected.agent["pip-orchestrator"];
  expectedAgent.description = agent.description;
  for (const path of ruleFiles) expectedAgent.permission.edit[path] = "ask";
  expectedAgent.permission.edit[maintenanceReport] = "allow";
  for (const path of frameworkFiles) expectedAgent.permission.read[path] = "allow";
  for (const path of frameworkDirectories) {
    expectedAgent.permission.read[path] = "allow";
    expectedAgent.permission.read[`${path}/**`] = "allow";
  }
  delete expectedAgent.permission.read["*/.kilo/*"];
  delete expectedAgent.permission.read["*/.compound-gpid/*"];
  expectedAgent.permission.skill = { "*": "deny", "cg-*": "allow", "pl-clear-technical-communication": "allow" };
  assert.deepEqual(config, expected);
  assert.match(agent.description, /explicit user approval/);
});

test("all rule files are approval-gated and already readable", () => {
  for (const path of ruleFiles) {
    assert.equal(agent.permission.edit[path], "ask");
    assert.equal(agent.permission.read[path], "allow");
  }
  assert.equal(agent.permission.edit[maintenanceReport], "allow");
});

test("default denial, unrelated files, other agents and native tool restrictions stay unchanged", () => {
  assert.equal(agent.permission.edit["*"], "deny");
  for (const path of ["roadmap.json", "SYSTEM_DESIGN.md", "README.md", "../pipdata/R/test.R"]) {
    assert.equal(Object.hasOwn(agent.permission.edit, path), false);
  }
  assert.deepEqual(config.agent["cg-roadmap"], original.agent["cg-roadmap"]);
  for (const key of Object.keys(originalAgent.permission).filter((key) => !["edit", "read"].includes(key))) {
    assert.deepEqual(agent.permission[key], originalAgent.permission[key]);
  }
});

// A synthetic glob check of configured paths, not Kilo's live permission engine.
const configuredRead = (path) => Object.entries(agent.permission.read).reduce((action, [pattern, next]) => {
  const regex = pattern.split("*").map((part) => part.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")).join(".*");
  return new RegExp(`^${regex}$`).test(path) ? next : action;
}, "deny");

test("installed commands, linked contracts, resources and future framework files remain readable", () => {
  const examples = [
    ".kilo/commands/cg-plan.md", ".kilo/commands/cg-work.md",
    ".kilo/shared/context-loading.contract.md", ".kilo/shared/goal-execution.contract.md",
    ".kilo/agents/cg-roadmap.md", ".kilo/instructions/r.instructions.md",
    ".kilo/skills/cg-skill-brain-query/SKILL.md",
    ".kilo/skills/cg-skill-render-doc/references/future-resource.md",
    ".compound-gpid/active-manifest.json", ".compound-gpid/generations/future/shared/future.md",
    ".cg-docs/active-state/current.json", ".cg-docs/solutions/nested/future.md",
    ...frameworkFiles, ...frameworkDirectories,
  ];
  for (const path of examples) assert.equal(configuredRead(path), "allow", path);
  for (const path of examples.slice(0, 4)) assert.ok(read(path).length > 0, path);
  assert.deepEqual(agent.permission.skill, { "*": "deny", "cg-*": "allow", "pl-clear-technical-communication": "allow" });
});

test("private Kilo state, credentials and unrelated files remain denied", () => {
  for (const path of [
    ".kilo/agent-manager.json", ".kilo/sessions/private.json", ".kilo/plans/private.md",
    ".kilo/skills/example/.env", ".compound-gpid/private.key",
    ".cg-docs/orchestration/outputs/raw-transcript.md", "unrelated/private.txt",
  ]) assert.equal(configuredRead(path), "deny", path);
});

test("self-maintenance requires direct per-change approval without another Code session", () => {
  const prompt = read("ORCHESTRATOR.md");
  assert.match(prompt, /specific change\. Do the approved edit yourself in this session/);
  assert.match(prompt, /Every future change needs its own direct user authorization/);
  assert.match(prompt, /Tool-level ask\npermissions and auto-approve ON do not replace it/);
  assert.match(prompt, /If a write is denied, stop that action/);
  assert.match(prompt, /Missing current Git facts are UNKNOWN/);
  assert.match(prompt, /only `agent\["pip-orchestrator"\]`, including its permissions/);
  assert.doesNotMatch(prompt, /Do not edit this prompt, configuration, roadmap/);
});

test("AGENTS changes are confined to framework reading and coordinator self-maintenance", () => {
  const agents = read("AGENTS.md");
  assert.match(agents, /Approval is per change, not standing permission/);
  const restored = agents
    .replace(/pip-orchestrator has standing read access to the installed Compound GPID\n[\s\S]*?\n\n/, "")
    .replace(/The exception to read-and-advise is explicit user-approved self-maintenance of\n[\s\S]*?\n\n/, "");
  assert.equal(restored, baseline("AGENTS.md"));
});

test("contract changes are confined to the approved coordination workflow", () => {
  const contract = read(".cg-docs/orchestration/CONTRACT.md");
  const originalContract = baseline(".cg-docs/orchestration/CONTRACT.md");
  let restored = contract.replace(/## Compound GPID Reference Access\n[\s\S]*?(?=## Retained Formal Records)/, "");
  restored = restored.replace(/^Version:.*$/m, originalContract.match(/^Version:.*$/m)[0]);
  restored = restored.replace("Every action recommended for another session gets", "Every recommended action gets");
  assert.equal(restored, originalContract);
  assert.match(contract, /A future\nuser-approved capability change may update the coordinator's own permission/);
  assert.match(contract, /Approval never overrides\nhigher-priority instructions, a live denial or workspace\/storage boundaries/);
  assert.match(read("ORCHESTRATOR.md"), /Before drafting a Compound GPID prompt or claiming a framework requirement/);
  assert.match(read("ORCHESTRATOR.md"), /State which\nrequirements come from the framework and which are local coordination rules/);
});

test("saved handoff has required metadata, reporting scope and all ten substantive headings", () => {
  const handoff = readFileSync(new URL("handoff.md", import.meta.url), "utf8");
  const metadata = JSON.parse(handoff.match(/```json\r?\n([\s\S]*?)\r?\n```/)[1]);
  assert.equal(metadata.schemaVersion, "pip-handoff-v1");
  assert.ok(metadata.gaps.length > 0);
  assert.ok(metadata.scope.writeSet.every((path) => path.startsWith("E:/")));
  for (const heading of ["Results Summary", "Substantive Findings", "Changed Files", "Evidence Paths", "Checks Actually Run", "Saved-Output Readback", "Checks Not Run", "Blockers And Decisions", "Recommended Next Action", "Gaps"]) {
    assert.match(handoff, new RegExp(`^## ${heading}$`, "m"));
  }
});

test("capture exact checked working-copy content hashes", () => {
  const sha256 = Object.fromEntries(ruleFiles.map((path) => [path, createHash("sha256").update(read(path)).digest("hex")]));
  console.log(JSON.stringify({ capturedAt: new Date().toISOString(), baselineSha, qualification: "static working-copy checks; not live-agent enforcement", sha256 }));
});
