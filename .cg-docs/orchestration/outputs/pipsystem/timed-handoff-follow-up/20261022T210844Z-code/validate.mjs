import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readFileSync, realpathSync } from 'node:fs';
import { resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

// Static configuration/policy checks only; no helper or scheduling execution.
const root = realpathSync(fileURLToPath(new URL('../../../../../../', import.meta.url)));
assert.match(root, /^E:[\\/]/i);
const read = (path) => readFileSync(resolve(root, path), 'utf8');
const baselineSha = '0918412685a714745c5df3114598f62a9c27129d';
const baseline = JSON.parse(execFileSync('git', ['show', `${baselineSha}:kilo.json`], {
  cwd: root, encoding: 'utf8', windowsHide: true,
}));
const config = JSON.parse(read('kilo.json'));
const agent = config.agent['pip-orchestrator'];
const tools = ['schedule_wakeup', 'cancel_wakeup', 'cron_create', 'cron_list', 'cron_delete'];
const results = [];
const check = (name, run) => { run(); results.push({ name, result: 'PASS' }); };

check('Five exact native scheduling permissions are allowed', () => {
  for (const tool of tools) assert.equal(agent.permission[tool], 'allow', tool);
});
check('Default deny, source/privacy/edit boundaries and other agents are unchanged', () => {
  const permittedDelta = structuredClone(config);
  for (const tool of tools) delete permittedDelta.agent['pip-orchestrator'].permission[tool];
  permittedDelta.agent['pip-orchestrator'].description = baseline.agent['pip-orchestrator'].description;
  assert.deepEqual(permittedDelta, baseline);
  assert.equal(agent.permission['*'], 'deny');
  assert.equal(agent.permission.bash, 'deny');
  assert.equal(agent.permission.task, 'deny');
});
check('Configured primary agent uses the edited operating prompt', () => {
  assert.equal(agent.mode, 'primary');
  assert.equal(agent.prompt, '{file:./ORCHESTRATOR.md}');
});

const prompt = read('ORCHESTRATOR.md');
const policy = prompt.replace(/\s+/g, ' ');
check('Launch confirmations trigger task-specific follow-up without another approval', () => {
  for (const text of ['prompt runnin', 'prompt running', 'prompt executed', 'without asking for a separate scheduling approval', 'if multiple tasks are plausible']) {
    assert.ok(policy.includes(text), text);
  }
});
check('Time estimates, first wakeup, recurring checks and duplicate prevention are explicit', () => {
  for (const text of ['2-5 minutes', '10-20 minutes', '20-45 minutes', 'basis and uncertainty', '`schedule_wakeup` for that first estimated check', 'no recurring check exists', 'otherwise retain the existing cron', 'must not create duplicate timers', 'not chained one-shot wakeups']) {
    assert.ok(policy.includes(text), text);
  }
});
check('Callbacks carry paths/checkpoints and read only saved evidence', () => {
  for (const text of ['Make the callback prompt self-contained', 'exact task/run and handoff path', 'last observed checkpoint/time', 'use bounded Read', 'must not run work, contact sessions, edit records']) {
    assert.ok(policy.includes(text), text);
  }
});
check('Early files are pending; terminal claims, cancellation and expiry have cleanup rules', () => {
  for (const text of ['normal pending evidence', 'is not completion', 'completed, no-change, blocked or cancelled', 'direct user stop/cancel', 'explicit supersession', 'schedule\'s expiry', 'stop checking and propose a targeted saved correction', '`cron_delete`', '`cancel_wakeup`']) {
    assert.ok(policy.includes(text), text);
  }
});
check('Scheduling success and closed-session limitations cannot be fabricated', () => {
  for (const text of ['only after a successful tool call', 'do not promise delivery after the client/session is closed', 'does not prove the other session is active', 'do not fall back to shell, background processes or worker tools']) {
    assert.ok(policy.includes(text), text);
  }
});
check('All active coordination documents explicitly permit scheduled file follow-up', () => {
  const contract = read('.cg-docs/orchestration/CONTRACT.md');
  const agents = read('AGENTS.md');
  assert.ok(contract.includes('Native scheduled wakeups and recurring bounded file checks are permitted'));
  assert.ok(contract.includes('Scheduled file observation is allowed'));
  assert.ok(agents.includes('native scheduling/wakeup tools'));
  assert.ok(agents.includes('Shell stays denied for pip-orchestrator'));
  for (const [name, text] of [['prompt', prompt], ['contract', contract], ['agents', agents]]) {
    assert.doesNotMatch(text, /No background monitoring, watcher, polling, wakeups/);
    assert.doesNotMatch(text, /No continuous monitoring, wakeups/);
    assert.doesNotMatch(text, /Do not claim continuous monitoring, poll progress, create recurring checks/);
    assert.doesNotMatch(text, /background processes,\s*schedules, shell/);
    assert.ok(text.includes('scheduled'), name);
  }
});
check('Edited configuration and operating prompt have no BOM and retain ASCII content', () => {
  for (const path of ['kilo.json', 'ORCHESTRATOR.md', 'AGENTS.md', '.cg-docs/orchestration/CONTRACT.md']) {
    assert.doesNotMatch(read(path), /^\uFEFF/);
    assert.doesNotMatch(read(path), /[^\x00-\x7F]/);
  }
});

console.log(JSON.stringify({
  kind: 'static-only', baselineSha, executedAt: new Date().toISOString(),
  total: results.length, passed: results.length, checks: results,
  notRun: ['Live pip-orchestrator permission reload', 'Native timer creation/delivery', 'Independent-worker completion observation', 'Deferred formal orchestration helper/tests'],
}, null, 2));
