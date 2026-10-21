import assert from 'node:assert/strict';
import { test } from 'node:test';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawn } from 'node:child_process';
import { createTestHub, emptyState, validateHandoff, SECTIONS, MAIN_ROOT, runCli } from '../tools/pip-orchestration.mjs';

const repository = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const time = '2026-10-21T12:27:18Z';
const rootFor = (id) => `E:/synthetic/${id}`;
function fixture(t, hooks = {}) {
  const parent = path.join(repository, '.tmp/pip-orchestration');
  fs.mkdirSync(parent, { recursive: true });
  const root = fs.mkdtempSync(path.join(parent, 'test-'));
  t.after(() => fs.rmSync(root, { recursive: true, force: true }));
  const hub = path.join(root, '.cg-docs/orchestration');
  const put = (relative, content) => {
    const target = path.join(hub, relative);
    fs.mkdirSync(path.dirname(target), { recursive: true });
    fs.writeFileSync(target, typeof content === 'string' ? content : JSON.stringify(content));
  };
  put('registry.json', { schemaVersion: 'pip-registry-v1', revision: 1,
    activation: { status: 'active', reason: 'synthetic fixture only; not production activation' },
    projects: ['stamp', 'pipload', 'pipapi'].map((id) => ({ projectId: id, repositoryId: id,
      displayName: id, kind: 'package', repositoryRoot: rootFor(id), worktreeRoots: [],
      provenance: { path: 'synthetic', capturedAt: time }, sourceAccess: 'metadata-only' })) });
  for (const id of ['stamp', 'pipload', 'pipapi']) put(`projects/${id}/state.json`, emptyState(id, time));
  put('CONTRACT.md', '# Synthetic Contract\n\nNo execution approval.\n');
  put('templates/handoff.md', '# Synthetic Template\n\nRequired metadata and Gaps.\n');
  return { root, hub, put, api: createTestHub(root, hooks) };
}
function operation(kind, projectId = 'stamp', revision = 0, session = 'coord-stamp') {
  return { schemaVersion: 'pip-operation-v1', kind, projectId,
    coordinationSessionId: session, reportingOwner: session, expectedRevision: revision,
    approvalRef: 'direct-user:synthetic-fixture' };
}

test('independent project claims survive and every observer sees all three', (t) => {
  const f = fixture(t);
  for (const id of ['stamp', 'pipload', 'pipapi']) f.api.apply(operation('claim', id, 0, `coord-${id}`));
  const view = f.api.refresh('observer');
  assert.equal(view.projects.length, 3);
  assert.ok(view.projects.every((p) => p.state.revision === 1));
  assert.equal(view.liveness, 'UNKNOWN');
  assert.equal(view.executionApproval, 'not-assessed');
});

test('wrong owner and stale revision do not change canonical state', (t) => {
  const f = fixture(t);
  f.api.apply(operation('claim'));
  const before = fs.readFileSync(path.join(f.hub, 'projects/stamp/state.json'));
  assert.throws(() => f.api.apply(operation('release', 'stamp', 1, 'other')), /OWNER/);
  assert.throws(() => f.api.apply(operation('release', 'stamp', 0)), /REVISION/);
  assert.deepEqual(fs.readFileSync(path.join(f.hub, 'projects/stamp/state.json')), before);
});

test('malformed v1 report is an error, while free text remains legacy', () => {
  assert.equal(validateHandoff('# Historical report\n\nGaps: unknown.').classification, 'legacy/unvalidated');
  const result = validateHandoff('# Report\n\n```json\n{"schemaVersion":"wrong"}\n```\n');
  assert.ok(result.errors.some((e) => e.code === 'SCHEMA'));
});

function request(projectId = 'stamp', taskId = 'task', runId = 'run-one', requestId = 'request-one') {
  const outputPath = `${MAIN_ROOT}/.cg-docs/orchestration/outputs/${projectId}/${taskId}/${runId}/handoff.md`;
  return { schemaVersion: 'pip-work-order-v1', projectId, taskId, requestId, runId,
    milestoneId: 'NONE', featureIds: [],
    coordinationSessionId: `coord-${projectId}`, reportingOwner: `worker-${projectId}`, status: 'PROPOSED',
    approvalRef: 'NONE', createdAt: time, purpose: 'planning', workflow: '/cg-plan', objective: 'Synthetic planning only',
    repositoryRoot: rootFor(projectId), worktreeRoot: rootFor(projectId), branchName: 'feature/synthetic',
    branchEvidence: 'synthetic fixture', worktreeReason: 'No branch or worktree operation is authorized.',
    planPath: 'NONE', planRevision: 'NONE', phase: 'planning', planApproved: false,
    writeSet: ['.cg-docs/plans/synthetic.md', '.cg-docs/views/synthetic.html', outputPath],
    prohibitedSet: ['All other paths, Git/roadmap writes and session starts'],
    lifecyclePaths: ['.cg-docs/plans/synthetic.md', '.cg-docs/views/synthetic.html'],
    prerequisites: ['Direct user approval and fresh worker baseline'], acceptanceEvidence: ['Report and readback'],
    stopConditions: ['Denied path or scope conflict'], sharedContracts: [], dependencyPins: [], supersedes: null,
    outputPath, supportingOutputs: [], commandContract: { available: true, path: 'synthetic installed contract',
      digest: 'a'.repeat(64), capturedAt: time, requiredWriteSet: ['.cg-docs/views/synthetic.html'] },
    outerReporting: { authorized: true, owner: `worker-${projectId}`, approvalRef: 'direct-user:synthetic-reporting' } };
}
function handoff(q = request(), status = 'completed', checkpoint = 1) {
  return { schemaVersion: 'pip-handoff-v1', projectId: q.projectId, taskId: q.taskId, runId: q.runId,
    requestId: q.requestId, coordinationSessionId: q.coordinationSessionId, reportingOwner: q.reportingOwner,
    checkpoint, createdAt: time, updatedAt: time, repository: { name: q.projectId, root: q.repositoryRoot },
    worktree: { name: 'synthetic', path: q.worktreeRoot, kind: 'main' }, session: { label: 'synthetic' },
    git: { branch: 'feature/synthetic', baseSha: '1'.repeat(40), headSha: '2'.repeat(40), capturedAt: time,
      dirty: 'dirty', changedFiles: ['.cg-docs/plans/synthetic.md'], commitsMade: [], mergeSha: '3'.repeat(40),
      pr: 'NONE', testedPins: [{ kind: 'content', sha: '4'.repeat(40), evidencePath: 'synthetic-evidence',
        capturedAt: time, dirty: 'dirty', qualification: 'worker-reported' }] },
    scope: { workflow: q.workflow, approvalRef: 'direct-user:synthetic', planPath: q.planPath,
      planRevision: q.planRevision, phase: q.phase, writeSet: q.writeSet, completed: 'Synthetic report only' },
    status, dependencyPins: q.dependencyPins, checks: [{ name: 'synthetic check', result: 'pass', exitCode: 0,
      executedAt: time, capturedAt: time, evidencePath: 'synthetic-evidence', sourceBinding: 'dirty working content',
      dependencyBinding: 'NONE', qualification: 'worker-reported' }], artifacts: [], gaps: ['Not a real runtime execution.'] };
}
function body(m, extra = '') {
  return `# Report\n\n\`\`\`json\n${JSON.stringify(m, null, 2)}\n\`\`\`\n\n` +
    SECTIONS.map((s) => `## ${s}\n\nSynthetic evidence; UNKNOWN where inapplicable.${extra}\n`).join('\n');
}
function register(f, q = request(), revision = 1) {
  return f.api.apply({ ...operation('request', q.projectId, revision, q.coordinationSessionId), request: q });
}
function intake(f, q = request(), revision = 2) {
  return f.api.apply({ ...operation('intake', q.projectId, revision, q.coordinationSessionId),
    reportPath: `outputs/${q.projectId}/${q.taskId}/${q.runId}/handoff.md` });
}
function putReport(f, m) { f.put(`outputs/${m.projectId}/${m.taskId}/${m.runId}/handoff.md`, body(m)); }
function setup(t, hooks = {}) {
  const f = fixture(t, hooks); f.api.apply(operation('claim')); register(f); return f;
}
function state(f, project = 'stamp') { return JSON.parse(fs.readFileSync(path.join(f.hub, `projects/${project}/state.json`))); }

for (const status of ['running', 'blocked', 'partial', 'completed', 'cancelled', 'no-change']) {
  test(`v1 ${status} validates, binds and remains worker-reported`, (t) => {
    const f = setup(t); const m = handoff(request(), status); putReport(f, m);
    assert.equal(validateHandoff(body(m)).errors.length, 0);
    intake(f);
    assert.equal(state(f).tasks[0].reportedStatus, status);
    assert.equal(state(f).tasks[0].accepted.qualification, 'worker-reported');
    assert.equal(state(f).tasks[0].requests[0].authorization, null);
    const view = f.api.refresh('observer');
    assert.equal(view.integrationReadiness, 'not-certified');
    assert.equal(view.reports[0].metadata.git.testedPins[0].sha, '4'.repeat(40));
    assert.notEqual(view.reports[0].metadata.git.testedPins[0].sha, view.reports[0].metadata.git.headSha);
  });
}

test('optional native ID does not block; UNKNOWN facts warn and invalid facts error', () => {
  const m = handoff(); m.git.branch = 'UNKNOWN'; m.git.baseSha = 'UNKNOWN'; m.git.headSha = 'UNKNOWN';
  m.worktree.path = 'UNKNOWN'; m.worktree.kind = 'unknown'; m.reportingOwner = 'UNKNOWN';
  const result = validateHandoff(body(m));
  assert.deepEqual(result.errors, []);
  assert.ok(result.warnings.length >= 5);
  for (const mutate of [
    (m) => { delete m.git.branch; }, (m) => { delete m.reportingOwner; },
    (m) => { m.git.headSha = '123abc'; }, (m) => { m.git.baseSha = 'z'.repeat(40); },
    (m) => { m.createdAt = '2026-02-30T00:00:00Z'; }, (m) => { m.updatedAt = '2026-10-20T00:00:00Z'; },
    (m) => { m.checkpoint = 1.5; }, (m) => { m.status = 'done'; },
    (m) => { m.gaps = []; }, (m) => { m.git.changedFiles = ['unapproved.R']; },
    (m) => { m.checks[0].capturedAt = 'yesterday'; },
  ]) { const bad = handoff(); mutate(bad); assert.ok(validateHandoff(body(bad)).errors.length > 0); }
  assert.ok(validateHandoff(body(handoff()).replace('## Gaps', '## Removed')).errors.length);
  assert.ok(validateHandoff(body(handoff()) + '\n```json\n{}\n```\n').errors.length);
  assert.ok(validateHandoff('# Report\n\n```json\nBROKEN\n```\n').errors.length);
  assert.equal(validateHandoff(body(handoff()), { projectId: 'other', taskId: 'task', runId: 'run-one' }).errors[0].code, 'PATH_IDENTITY');
});

test('request embeds complete outputs, proposal status, lifecycle and independent caller rule', (t) => {
  const f = setup(t), saved = fs.readFileSync(path.join(f.hub, 'projects/stamp/requests/task/request-one.md'), 'utf8');
  for (const value of ['# Synthetic Contract', '# Synthetic Template', 'outer Code caller',
    request().outputPath, 'Never stash', 'PROPOSED', 'Filled Initial Handoff', '.cg-docs/views/synthetic.html'])
    assert.ok(saved.includes(value), value);
  assert.equal(register(f, request(), 2).status, 'idempotent');
  const q = request(); q.objective = 'amended';
  assert.throws(() => register(f, q, 2), /IMMUTABLE_REQUEST/);
  assert.throws(() => register(f, request('stamp', 'task', 'new-run', 'new-request'), 2), /EXPLICIT_SUPERSESSION/);
});

test('intake rejects scope, run, coordinator, reporting owner and dependency mismatches', (t) => {
  const f = setup(t);
  for (const mutate of [
    (m) => { m.reportingOwner = 'other'; }, (m) => { m.requestId = 'other'; },
    (m) => { m.coordinationSessionId = 'other'; }, (m) => { m.scope.writeSet.push('unapproved.R'); },
    (m) => { m.repository.root = 'E:/other'; }, (m) => { m.scope.phase = 'implementation'; },
  ]) {
    const m = handoff(); mutate(m); putReport(f, m);
    assert.throws(() => intake(f), /INTAKE_|INVALID_HANDOFF/);
    assert.equal(state(f).revision, 2);
  }
});

test('duplicate and reordered checkpoints, amended files and superseded attempts', (t) => {
  const f = setup(t), m = handoff(); putReport(f, m); intake(f);
  assert.equal(intake(f, request(), 3).status, 'idempotent');
  f.put('outputs/stamp/task/run-one/handoff.md', body(m, 'Changed body'));
  assert.throws(() => intake(f, request(), 3), /CHECKPOINT_CONFLICT/);
  assert.equal(f.api.refresh('observer').projects.find((p) => p.projectId === 'stamp').state.tasks[0].acceptedValidity, 'amended-historical-only');
  m.checkpoint = 2; putReport(f, m); intake(f, request(), 3);
  m.checkpoint = 1; putReport(f, m);
  assert.throws(() => intake(f, request(), 4), /OLDER_CHECKPOINT/);
  const q = request('stamp', 'task', 'run-two', 'request-two'); q.supersedes = 'request-one';
  register(f, q, 4);
  assert.equal(state(f).tasks[0].accepted, null);
  assert.equal(state(f).tasks[0].evidenceHistory.length, 2);
  assert.throws(() => intake(f, request(), 5), /INTAKE_REQUEST/);
});

test('missing, malformed and partly written accepted reports retain historical evidence', (t) => {
  const f = setup(t); putReport(f, handoff()); intake(f);
  const before = fs.readFileSync(path.join(f.hub, 'projects/stamp/state.json'));
  f.put('outputs/stamp/task/run-one/handoff.md', '# Report\n\n```json\n{');
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'ACCEPTED_EVIDENCE_CHANGED'));
  fs.unlinkSync(path.join(f.hub, 'outputs/stamp/task/run-one/handoff.md'));
  const view = f.api.refresh('observer');
  assert.ok(view.issues.some((i) => i.code === 'MISSING_HANDOFF'));
  assert.deepEqual(fs.readFileSync(path.join(f.hub, 'projects/stamp/state.json')), before);
});

test('changing checkpoints cannot be accepted and repeated changing scans are inconsistent', (t) => {
  let count = 0;
  const f = setup(t, { afterReportRead: (relative) => {
    fs.appendFileSync(path.join(f.hub, relative), `\n${++count}`);
  } });
  putReport(f, handoff()); assert.throws(() => intake(f), /CHANGING/);
  assert.equal(state(f).revision, 2);
  const view = f.api.refresh('observer');
  assert.equal(view.coverage.completeWithinHub, false);
  assert.ok(view.issues.some((i) => i.code === 'CHANGING'));
});

test('collection retries changed registry/state revisions and reports persistent inconsistency', (t) => {
  let enabled = false;
  const f = fixture(t, { afterCollect: () => {
    if (enabled) { const s = state(f); s.revision++; f.put('projects/stamp/state.json', s); }
  } });
  enabled = true;
  const view = f.api.refresh('observer');
  assert.equal(view.consistent, false);
  assert.ok(view.issues.some((i) => i.code === 'INCONSISTENT_SNAPSHOT'));
});

test('atomic replacement failure and orphan request recovery preserve canonical state', (t) => {
  let interrupt = false, orphan = false;
  const f = fixture(t, { beforeReplace: (relative) => {
    if (interrupt && relative.endsWith('state.json')) throw new Error('SYNTHETIC_REPLACE_FAILURE');
  }, afterRequestPublish: () => { if (orphan) throw new Error('SYNTHETIC_CRASH'); } });
  f.api.apply(operation('claim')); interrupt = true;
  assert.throws(() => f.api.apply(operation('release', 'stamp', 1)), /SYNTHETIC_REPLACE_FAILURE/);
  assert.equal(state(f).revision, 1); assert.ok(state(f).owner);
  interrupt = false; orphan = true;
  assert.throws(() => register(f), /SYNTHETIC_CRASH/);
  assert.equal(state(f).tasks.length, 0);
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'ORPHAN_REQUEST'));
  orphan = false; register(f); assert.equal(state(f).revision, 2);
});

test('stale locks need exact explicit recovery and transfers exclude the old owner', (t) => {
  const f = fixture(t); f.put('projects/stamp/.lock', '{"token":"abandoned"}');
  assert.throws(() => f.api.apply(operation('claim')), /LOCKED/);
  assert.throws(() => f.api.apply({ ...operation('recover-lock'), lockDigest: '0'.repeat(64) }), /LOCK_IDENTITY/);
  const digest = (awaitHash(fs.readFileSync(path.join(f.hub, 'projects/stamp/.lock'))));
  f.api.apply({ ...operation('recover-lock'), lockDigest: digest }); f.api.apply(operation('claim'));
  f.api.apply({ ...operation('transfer', 'stamp', 1, 'new-owner'), previousCoordinationSessionId: 'coord-stamp', previousReportingOwner: 'coord-stamp' });
  assert.throws(() => f.api.apply(operation('release', 'stamp', 2)), /OWNER/);
  f.api.apply(operation('release', 'stamp', 2, 'new-owner')); assert.equal(state(f).owner, null);
});

test('legacy/unregistered and unknown-project reports remain visible without completing tasks', (t) => {
  const f = fixture(t);
  const legacy = '# Stamp release handoff\n\nWorker reported a tested-content pin, not current HEAD.\n\n## Gaps\n\nUnregistered.';
  f.put('outputs/stamp/stamp-release-followup-2026-10-20/20261021T013737Z-stamp-handoff/handoff.md', legacy);
  f.put('outputs/unknown-project/unknown-task/unknown-run/handoff.md', legacy);
  const view = f.api.refresh('observer');
  assert.equal(view.reports.length, 2);
  assert.equal(view.issues.filter((i) => i.code === 'UNREGISTERED_REPORT').length, 2);
  assert.equal(view.issues.filter((i) => i.code === 'LEGACY_UNVALIDATED').length, 2);
  assert.equal(state(f).tasks.length, 0);
  assert.equal(fs.readFileSync(path.join(f.hub, view.reports[0].path), 'utf8'), legacy);
});

test('three-project dependencies, producer changes, lifecycle conflicts and cycles are explicit', (t) => {
  const f = fixture(t);
  for (const id of ['stamp', 'pipload', 'pipapi']) f.api.apply(operation('claim', id, 0, `coord-${id}`));
  const producer = request(); register(f, producer); putReport(f, handoff(producer)); intake(f);
  const accepted = state(f).tasks[0].accepted;
  const consumer = request('pipload');
  consumer.dependencyPins = [{ projectId: 'stamp', taskId: 'task', requestId: producer.requestId, runId: producer.runId,
    kind: 'tested-content', sha: '4'.repeat(40), digest: accepted.digest, capturedAt: time,
    evidencePath: accepted.path, qualification: 'worker-reported' }];
  register(f, consumer); putReport(f, handoff(consumer)); intake(f, consumer);
  assert.ok(!f.api.refresh('observer').issues.some((i) => i.code === 'UNRESOLVED_OR_STALE_DEPENDENCY'));
  const newer = handoff(producer, 'completed', 2); newer.git.testedPins[0].sha = '5'.repeat(40);
  putReport(f, newer); intake(f, producer, 3);
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'UNRESOLVED_OR_STALE_DEPENDENCY'));
  const review = request('pipload', 'other-task');
  review.writeSet.push('.cg-docs/active-state/current.json');
  review.lifecyclePaths.push('.cg-docs/active-state/current.json');
  register(f, review, 3);
  const another = request('pipload', 'third-task');
  another.writeSet.push('.cg-docs/active-state/current.json'); another.lifecyclePaths.push('.cg-docs/active-state/current.json');
  register(f, another, 4);
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'WRITE_SET_CONFLICT'));
  const s = state(f); s.tasks[0].dependencyPins = [{ ...consumer.dependencyPins[0], projectId: 'pipload' }];
  f.put('projects/stamp/state.json', s);
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'DEPENDENCY_CYCLE'));
  assert.equal(createTestHub(f.root).refresh('restarted').projects.length, 3);
});

test('unavailable target command and outer reporting remain blocking prerequisites', (t) => {
  const f = fixture(t); f.api.apply(operation('claim'));
  const q = request(); q.commandContract.available = false; q.commandContract.digest = 'UNKNOWN';
  q.outerReporting.authorized = false; q.outerReporting.approvalRef = 'UNKNOWN';
  register(f, q);
  const issues = f.api.refresh('observer').issues;
  assert.ok(issues.some((i) => i.code === 'COMMAND_CONTRACT_PREREQUISITE'));
  assert.ok(issues.some((i) => i.code === 'OUTER_REPORTING_BLOCKED'));
  const implementation = request('stamp', 'implementation');
  implementation.purpose = 'implementation'; implementation.workflow = '/cg-work';
  assert.throws(() => register(f, implementation, 2), /LOCAL_APPROVED_PLAN/);
});

test('path traversal, private paths, aliases, injected commands and size limits are refused', (t) => {
  const f = fixture(t);
  for (const reportPath of ['../outside', 'outputs/stamp/../run/handoff.md', 'E:/outside/handoff.md',
    'outputs\\stamp\\task\\run\\handoff.md', 'outputs/stamp/task/run/secrets.md'])
    assert.throws(() => f.api.validateReport(reportPath), /PATH|PRIVATE/);
  for (const id of ['../stamp', 'stamp;whoami', 'stamp&whoami', 'stamp\nwhoami', 'CON', '-e'])
    assert.throws(() => f.api.apply({ ...operation('claim'), projectId: id }), /ID/);
  assert.throws(() => createTestHub(repository), /TEST_ROOT/);
  for (const args of [[], ['--root', f.root], ['coord-stamp', ';whoami'], ['coord-stamp&whoami'], ['-e']])
    assert.throws(() => runCli(args), /USAGE|ID|MAIN_CHECKOUT/);
  const registry = JSON.parse(fs.readFileSync(path.join(f.hub, 'registry.json')));
  registry.projects[1].repositoryRoot = 'e:\\SYNTHETIC\\STAMP'; f.put('registry.json', registry);
  assert.throws(() => f.api.refresh('observer'), /DUPLICATE_ROOT/);
  registry.projects[1].repositoryRoot = rootFor('pipload'); f.put('registry.json', registry);
  f.put('outputs/stamp/task/run/handoff.md', 'x'.repeat(2 * 1024 * 1024 + 1));
  const view = f.api.refresh('observer');
  assert.ok(view.issues.some((i) => i.code === 'LIMIT_OR_FILE'));
  assert.equal(view.coverage.completeWithinHub, false);
});

test('junctions and hardlinks never expose report targets outside approved output paths', (t) => {
  const f = fixture(t);
  const linked = path.join(f.hub, 'outputs');
  const outsideShape = path.join(f.root, 'not-hub'); fs.mkdirSync(outsideShape);
  fs.symlinkSync(outsideShape, linked, process.platform === 'win32' ? 'junction' : 'dir');
  assert.throws(() => f.api.refresh('observer'), /LINK/);
  fs.unlinkSync(linked);
  f.put('outputs/stamp/task/run/handoff.md', body(handoff()));
  fs.linkSync(path.join(f.hub, 'outputs/stamp/task/run/handoff.md'), path.join(f.root, 'second-link'));
  assert.throws(() => f.api.validateReport('outputs/stamp/task/run/handoff.md'), /LIMIT_OR_FILE/);
});

import crypto from 'node:crypto';
function awaitHash(value) { return crypto.createHash('sha256').update(value).digest('hex'); }
function child(f, op) {
  const moduleUrl = new URL('../tools/pip-orchestration.mjs', import.meta.url).href;
  const script = `import {createTestHub} from ${JSON.stringify(moduleUrl)};try { console.log(JSON.stringify(createTestHub(process.argv[1]).apply(JSON.parse(process.argv[2])))); } catch(e) { console.error(e.message); process.exitCode=1; }`;
  return new Promise((resolve) => {
    const p = spawn(process.execPath, ['--input-type=module', '-e', script, f.root, JSON.stringify(op)], { cwd: repository, windowsHide: true });
    let stdout = '', stderr = '';
    p.stdout.on('data', (s) => { stdout += s; }); p.stderr.on('data', (s) => { stderr += s; });
    p.on('error', (e) => resolve({ code: -1, stdout, stderr: e.message }));
    p.on('close', (code) => resolve({ code, stdout, stderr }));
  });
}

test('multiprocess independent claims preserve all projects; same-project race has one winner', async (t) => {
  const f = fixture(t);
  const results = await Promise.all(['stamp', 'pipload', 'pipapi'].map((id) => child(f, operation('claim', id, 0, `coord-${id}`))));
  assert.deepEqual(results.map((r) => r.code), [0, 0, 0], JSON.stringify(results));
  assert.ok(f.api.refresh('observer').projects.every((p) => p.state.revision === 1));
  const race = fixture(t);
  const collided = await Promise.all([child(race, operation('claim')), child(race, operation('claim', 'stamp', 0, 'other'))]);
  assert.equal(collided.filter((r) => r.code === 0).length, 1, JSON.stringify(collided));
  assert.equal(state(race).revision, 1);
  assert.match(collided.find((r) => r.code !== 0).stderr, /LOCKED|REVISION|OWNER/);
  t.diagnostic(JSON.stringify({ independentClaims: results.map((r) => ({ exitCode: r.code, result: JSON.parse(r.stdout) })),
    sameProjectClaims: collided.map((r) => ({ exitCode: r.code, result: r.stdout.trim(), error: r.stderr.trim() })) }));
});

test('multiprocess same-revision updates have exactly one winner and no lost update', async (t) => {
  const f = setup(t);
  const update = { ...operation('update', 'stamp', 2), taskId: 'task', blockers: ['pending'],
    note: 'synthetic update', qualification: 'worker-reported' };
  const results = await Promise.all([child(f, update), child(f, { ...update, note: 'other synthetic update' })]);
  assert.equal(results.filter((r) => r.code === 0).length, 1, JSON.stringify(results));
  assert.equal(state(f).revision, 3);
  assert.equal(state(f).reconciliationHistory.length, 3);
  t.diagnostic(JSON.stringify({ sameRevisionUpdates: results.map((r) => ({ exitCode: r.code,
    result: r.stdout.trim(), error: r.stderr.trim() })), finalRevision: state(f).revision }));
});

test('blocked activation and unsupported operation fields prevent all project mutation', (t) => {
  const f = fixture(t);
  assert.throws(() => f.api.apply({ ...operation('claim'), command: 'whoami' }), /OPERATION_FIELD/);
  const r = JSON.parse(fs.readFileSync(path.join(f.hub, 'registry.json')));
  r.activation.status = 'blocked'; f.put('registry.json', r);
  assert.throws(() => f.api.apply(operation('claim')), /ACTIVATION_BLOCKED/);
  assert.equal(state(f).revision, 0);
  assert.equal(f.api.refresh('observer').activation.status, 'blocked');
});

test('unexpected central output shapes, invalid state and reserved/missing parents fail safely', (t) => {
  const f = fixture(t);
  f.put('outputs/wrong-depth.md', 'not a report');
  assert.throws(() => f.api.refresh('observer'), /OUTPUT_SHAPE/);
  fs.unlinkSync(path.join(f.hub, 'outputs/wrong-depth.md'));
  f.put('projects/stamp/state.json', '{"schemaVersion":"wrong"}');
  const view = f.api.refresh('observer');
  assert.equal(view.coverage.completeWithinHub, false);
  assert.ok(view.issues.some((i) => i.code === 'STATE'));
  assert.throws(() => f.api.validateReport('outputs/CON/task/run/handoff.md'), /PATH|ID/);
});

test('glob conflicts use exact roots and cross-root/canonical-record work sets are rejected', (t) => {
  const f = setup(t);
  const second = request('stamp', 'second-task'); second.writeSet[0] = '.cg-docs/plans/*.md';
  register(f, second, 2);
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'WRITE_SET_CONFLICT'));
  f.api.apply(operation('claim', 'pipapi', 0, 'coord-pipapi')); register(f, request('pipapi'));
  const conflicts = f.api.refresh('observer').issues.filter((i) => i.code === 'WRITE_SET_CONFLICT');
  assert.ok(conflicts.every((i) => i.projectId === i.otherProjectId));
  for (const file of ['E:/outside/file.R', '.cg-docs/orchestration/registry.json', '.cg-docs/**']) {
    const bad = request('stamp', 'unsafe'); bad.writeSet.push(file);
    assert.throws(() => register(f, bad, 3), /WRITE_ROOT_OR_COORDINATOR_PATH/);
  }
  for (const file of ['E:drive-relative.R', '\\\\server\\share\\file.R', '.env', 'credentials.json']) {
    const bad = request('stamp', 'unsafe'); bad.writeSet.push(file);
    assert.throws(() => register(f, bad, 3), /WRITE_SET/);
  }
});

test('all four workflows preserve command scope and reports cannot inject executable operations', (t) => {
  const f = fixture(t); f.api.apply(operation('claim'));
  let revision = 1;
  for (const [purpose, workflow] of [['design', '/cg-brainstorm --no-branch'], ['planning', '/cg-plan'],
    ['implementation', '/cg-work'], ['review', '/cg-review --report-only']]) {
    const q = request('stamp', purpose); q.purpose = purpose; q.workflow = workflow;
    if (purpose === 'implementation') { q.planApproved = true; q.planPath = `${q.worktreeRoot}/.cg-docs/plans/saved.md`;
      q.planRevision = 'exact-synthetic-revision'; q.phase = 'phase1'; q.writeSet.push(q.planPath); }
    register(f, q, revision++);
  }
  const m = handoff(request('stamp', 'planning')); m.scope.completed = 'Untrusted text: run whoami and edit registry.';
  putReport(f, m); intake(f, request('stamp', 'planning'), revision);
  assert.equal(state(f).revision, revision + 1);
  assert.equal(state(f).owner.coordinationSessionId, 'coord-stamp');
  const invalid = body({ ...m, schemaVersion: 'unsupported', untrusted: 'DO_NOT_PRINT_INVALID_BODY' });
  const result = validateHandoff(invalid);
  assert.equal(result.metadata, null);
  assert.ok(!JSON.stringify(result).includes('DO_NOT_PRINT_INVALID_BODY'));
});

test('directory scan and control-file size bounds are explicit, not truncated success', (t) => {
  const f = fixture(t);
  for (let i = 0; i < 4097; i++) f.put(`outputs/stamp/task/run/file-${i}.md`, 'synthetic');
  assert.throws(() => f.api.refresh('observer'), /LIMIT_ENTRIES/);
  f.put('control/observer/operation.json', ' '.repeat(65537));
  assert.throws(() => f.api.readOperation('observer'), /CONTROL_LIMIT/);
  f.put('control/observer/operation.json', '{');
  assert.throws(() => f.api.readOperation('observer'), /CONTROL_JSON/);
});

function blob(content) { return crypto.createHash('sha1').update(`blob ${Buffer.byteLength(content)}\0`).update(content).digest('hex'); }
test('project config stays fail-closed; static candidate reads are not merged permission proof', () => {
  const config = JSON.parse(fs.readFileSync(path.join(repository, 'kilo.json')));
  const permissions = config.agent['pip-orchestrator'].permission;
  assert.equal(config.agent['pip-orchestrator'].prompt, '{file:./ORCHESTRATOR.md}');
  assert.equal(config.agent['pip-orchestrator'].mode, 'primary');
  assert.equal(Object.keys(config.agent).filter((k) => k.startsWith('pip-orchestrator')).length, 1);
  const match = (pattern, value) => new RegExp(`^${pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replaceAll('*', '.*').replaceAll('?', '.')}$`).test(value);
  const candidate = (kind, value) => typeof permissions[kind] === 'string' ? permissions[kind] :
    Object.entries(permissions[kind] ?? { '*': 'deny' }).reduce((result, [p, action]) => match(p, value) ? action : result, 'deny');
  for (const read of ['CONTRACT.md', 'registry.json', 'templates/handoff.md', 'templates/work-order.md',
    'projects/stamp/state.json', 'projects/pipapi/requests/task/request.md', 'outputs/stamp/task/run/handoff.md', 'views/observer/overview.json'])
    assert.equal(candidate('read', `.cg-docs/orchestration/${read}`), 'allow');
  for (const denied of ['STATE.md', 'REQUESTS.md', 'registry.json', 'projects/stamp/state.json', 'outputs/stamp/task/run/handoff.md', 'templates/handoff.md'])
    assert.equal(candidate('edit', `.cg-docs/orchestration/${denied}`), 'deny');
  assert.equal(candidate('edit', '.cg-docs/orchestration/control/observer/operation.json'), 'allow');
  for (const denied of ['roadmap.json', '../pipload/R/test.R', '.kilo/agents/cg-roadmap.md', 'AGENTS.md', 'tools/pip-orchestration.mjs'])
    assert.equal(candidate('edit', denied), 'deny');
  for (const denied of ['outputs/stamp/task/run/secrets.md', 'outputs/stamp/task/run/raw-transcript.md', 'outputs/stamp/task/run/production/file'])
    assert.equal(candidate('read', `.cg-docs/orchestration/${denied}`), 'deny');
  for (const tool of ['bash', 'glob', 'grep', 'list', 'semantic_search', 'task']) assert.equal(permissions[tool], 'deny');
  for (const command of ['node tools/pip-orchestration.mjs observer', 'node -e "whoami"',
    'node tools/alternate.mjs', 'node tools/pip-orchestration.mjs observer; whoami',
    'node tools/pip-orchestration.mjs observer && whoami', '$env:NODE_OPTIONS="--require=other"; node tools/pip-orchestration.mjs observer'])
    assert.equal(candidate('bash', command), 'deny');
  assert.deepEqual(config.agent['cg-roadmap'].permission.edit, { '*': 'deny', 'roadmap.json': 'ask' });
  assert.equal(config.agent['cg-roadmap'].permission.bash, 'deny');
  assert.equal(config.agent['cg-roadmap'].permission.task, 'deny');
  assert.deepEqual(config.agent['cg-roadmap'].permission.external_directory,
    { '*': 'deny', 'C:\\Users\\wb384996\\.local\\share\\kilo\\tool-output\\*': 'deny' });
  assert.equal(config.agent['cg-roadmap'].permission.read['.cg-docs/orchestration/outputs/**'], undefined);
  assert.ok(!('model' in config.agent['pip-orchestrator']) && !('default_agent' in config));
});

test('active instructions use per-project ownership and a single canonical output contract', () => {
  const instructions = fs.readFileSync(path.join(repository, 'ORCHESTRATOR.md'), 'utf8');
  const contract = fs.readFileSync(path.join(repository, '.cg-docs/orchestration/CONTRACT.md'), 'utf8');
  const template = fs.readFileSync(path.join(repository, '.cg-docs/orchestration/templates/handoff.md'), 'utf8');
  const workOrder = fs.readFileSync(path.join(repository, '.cg-docs/orchestration/templates/work-order.md'), 'utf8');
  assert.ok(!/Only one user-designated coordinator session may write|Direct writes are limited to STATE|single durable coordination registers/.test(instructions));
  for (const value of ['global overview', 'repository-focused coordination', 'handoff intake', 'BLOCKED',
    'expected revision', 'observer', 'transfer', 'scope', 'main pipsystem']) assert.ok(instructions.includes(value), value);
  for (const section of SECTIONS) assert.ok(template.includes(`## ${section}`), section);
  for (const value of ['pip-handoff-v1', 'tested-content', 'legacy/unvalidated', 'recover-lock', 'Rollback', 'outer Code caller'])
    assert.ok((contract + workOrder).includes(value), value);
  for (const file of ['ORCHESTRATOR.md', 'AGENTS.md', 'kilo.json', 'tools/pip-orchestration.mjs', 'tests/pip-orchestration.test.mjs']) {
    const content = fs.readFileSync(path.join(repository, file), 'utf8'); assert.ok(!content.startsWith('\uFEFF'));
    assert.ok(!/[^\x00-\x7F]/.test(content), file);
  }
});

test('real contract and JSON handoff examples embed intact without confusing request intake', (t) => {
  const f = fixture(t);
  for (const file of ['CONTRACT.md', 'templates/handoff.md'])
    f.put(file, fs.readFileSync(path.join(repository, '.cg-docs/orchestration', file), 'utf8'));
  f.api.apply(operation('claim')); register(f);
  const saved = fs.readFileSync(path.join(f.hub, 'projects/stamp/requests/task/request-one.md'), 'utf8');
  assert.ok((saved.match(/^```json$/gm) ?? []).length >= 3);
  assert.ok(!f.api.refresh('observer').issues.some((i) => ['METADATA', 'REQUEST_AMENDED'].includes(i.code)));
  putReport(f, handoff()); intake(f);
});

test('migration comparison preserves exact historical suffixes and refuses changed history', (t) => {
  const f = fixture(t);
  const originalState = '# Coordination State\n\nObservation date: synthetic\n';
  const originalRequests = '# Coordination Requests\n\nCreated: synthetic';
  const r = JSON.parse(fs.readFileSync(path.join(f.hub, 'registry.json')));
  r.migration = { 'STATE.md': blob(originalState), 'REQUESTS.md': blob(originalRequests) };
  f.put('registry.json', r);
  f.put('STATE.md', originalState.replace('\n\n', '\n\n## Migration Index\n\nSynthetic index.\n\n'));
  f.put('REQUESTS.md', originalRequests.replace('\n\n', '\n\n## Migration Index\n\nSynthetic index.\n\n'));
  assert.ok(!f.api.refresh('observer').issues.some((i) => i.code === 'HISTORY_BASELINE_CHANGED'));
  f.put('REQUESTS.md', originalRequests.replace('synthetic', 'changed'));
  assert.ok(f.api.refresh('observer').issues.some((i) => i.code === 'HISTORY_BASELINE_CHANGED'));
});

test('helper derivatives are ignored without ignoring the canonical coordination root', () => {
  const ignore = fs.readFileSync(path.join(repository, '.gitignore'), 'utf8').replaceAll('\r\n', '\n');
  const rules = ignore.split('\n').map((line) => line.trim()).filter((line) => line && !line.startsWith('#'));
  for (const rule of ['/.tmp/pip-orchestration/', '/.cg-docs/orchestration/control/',
    '/.cg-docs/orchestration/views/', '/.cg-docs/orchestration/projects/*/.lock',
    '/.cg-docs/orchestration/projects/**/*.tmp']) assert.ok(rules.includes(rule), rule);
  for (const rule of ['.cg-docs', '.cg-docs/', '/.cg-docs/', '.cg-docs/orchestration/',
    '/.cg-docs/orchestration/']) assert.ok(!rules.includes(rule), rule);
});

test('registered linked worktrees bind relative and absolute changed-file scope to the worktree', (t) => {
  const f = fixture(t);
  const r = JSON.parse(fs.readFileSync(path.join(f.hub, 'registry.json')));
  r.projects[1].repositoryId = 'STAMP'; f.put('registry.json', r);
  assert.throws(() => f.api.refresh('observer'), /DUPLICATE_REPOSITORY/);
  r.projects[1].repositoryId = 'pipload';
  r.projects[0].worktreeRoots.push(rootFor('stamp-worktree')); f.put('registry.json', r);
  f.api.apply(operation('claim'));
  const q = request(); q.worktreeRoot = rootFor('stamp-worktree'); register(f, q);
  const m = handoff(q); m.worktree.kind = 'linked';
  m.git.changedFiles = [`${q.worktreeRoot}/.cg-docs/plans/synthetic.md`];
  putReport(f, m); intake(f, q);
  assert.equal(state(f).tasks[0].accepted.metadata.worktree.path, q.worktreeRoot);
});
