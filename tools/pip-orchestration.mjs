import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';

export const MAIN_ROOT = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem';
const SOURCE_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const HUB = '.cg-docs/orchestration';
const SLUG = /^[A-Za-z0-9][A-Za-z0-9-]{0,99}$/;
const UTC = /^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.\d{3})?Z$/;
const SHA = /^[a-f0-9]{40}$/;
const DIGEST = /^[a-f0-9]{64}$/;
const STATUSES = ['running', 'blocked', 'partial', 'completed', 'cancelled', 'no-change'];
const KINDS = ['refresh', 'validate', 'claim', 'release', 'transfer', 'recover-lock', 'request', 'intake', 'update'];
export const SECTIONS = ['Results Summary', 'Substantive Findings', 'Changed Files', 'Evidence Paths',
  'Checks Actually Run', 'Saved-Output Readback', 'Checks Not Run', 'Blockers And Decisions',
  'Recommended Next Action', 'Gaps'];
const LIMITS = { fileBytes: 2 * 1024 * 1024, totalBytes: 32 * 1024 * 1024,
  entries: 4096, reports: 512, projects: 64, tasks: 256, requests: 512, retries: 3 };
const unknown = (s) => s === 'UNKNOWN' || s === 'NONE';
const object = (o) => o !== null && typeof o === 'object' && !Array.isArray(o);
const text = (s) => typeof s === 'string' && s.trim().length > 0 && s.length <= 32768;
const utc = (s) => typeof s === 'string' && UTC.test(s) && Number.isFinite(Date.parse(s)) &&
  new Date(s).toISOString().replace('.000Z', 'Z') === s.replace('.000Z', 'Z');
const hash = (s) => crypto.createHash('sha256').update(s).digest('hex');
const gitBlob = (s) => crypto.createHash('sha1').update(`blob ${Buffer.byteLength(s)}\0`).update(s).digest('hex');
const json = (o) => `${JSON.stringify(o, null, 2)}\n`;
const now = () => new Date().toISOString();
function fail(code) { throw new Error(code); }
function requireValue(condition, code) { if (!condition) fail(code); }
function slug(s) { requireValue(typeof s === 'string' && SLUG.test(s) &&
  !/^(con|prn|aux|nul|com[1-9]|lpt[1-9])$/i.test(s), 'ID'); return s; }
function safeRelative(s) {
  requireValue(typeof s === 'string' && s.length <= 1024 && !/[\\:\x00-\x1f*?]/.test(s), 'PATH');
  const parts = s.split('/');
  requireValue(parts.every((p) => /^[A-Za-z0-9_.-]+$/.test(p) && p !== '.' && p !== '..' &&
    !/[. ]$/.test(p) && !/^(con|prn|aux|nul|com[1-9]|lpt[1-9])(?:\.|$)/i.test(p)), 'PATH');
  requireValue(!/(^|\/)(?:\.git|\.kilo|\.compound-gpid|data|data-raw|production|sessions?)(\/|$)|credential|secret|transcript|\.env(?:\.|$)|\.(?:pem|key)$/i.test(s), 'PRIVATE_PATH');
  return s;
}
function absoluteKey(s) {
  requireValue(text(s) && !/[\x00-\x1f]/.test(s), 'ROOT');
  const normalized = s.replaceAll('\\', '/');
  requireValue(/^(?:[A-Za-z]:\/|\/)/.test(normalized) && !normalized.startsWith('//') &&
    !normalized.replace(/^[A-Za-z]:/, '').includes(':') &&
    !normalized.split('/').some((p) => p === '..' || p === '.' || /[. ]$/.test(p)) &&
    !/[*?<>|";]/.test(normalized), 'ROOT');
  return normalized.replace(/\/$/, '').toLowerCase();
}
function writeKey(s, root) {
  requireValue(text(s) && !/[\x00-\x1f:<>|";]/.test(s.replace(/^[A-Za-z]:/, '')), 'WRITE_SET');
  const value = s.replaceAll('\\', '/');
  requireValue(!value.startsWith('//') && (!/^[A-Za-z]:/.test(value) || /^[A-Za-z]:\//.test(value)) &&
    !value.split('/').some((p) => p === '..' || p === '.' || /[. ]$/.test(p)) &&
    !/(^|\/)(?:\.git|\.kilo|\.compound-gpid|production|data-raw|sessions?)(\/|$)|credential|secret|transcript|(^|\/)\.env(?:\.|$)|\.(?:pem|key)$/i.test(value), 'WRITE_SET');
  return (/^(?:[A-Za-z]:\/|\/)/.test(value) ? value : `${root}/${value}`).toLowerCase();
}
function sameSet(a, b, root) {
  return json(a.map((p) => writeKey(p, root)).sort()) === json(b.map((p) => writeKey(p, root)).sort());
}
function covered(file, patterns, root) {
  const key = writeKey(file, root);
  return patterns.some((p) => {
    const pattern = writeKey(p, root);
    const regex = pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replaceAll('**', '\u0000')
      .replaceAll('*', '[^/]*').replaceAll('?', '[^/]').replaceAll('\u0000', '.*');
    return new RegExp(`^${regex}$`).test(key);
  });
}
function issue(code, fields = {}) { return { code, ...fields }; }
function errorCode(error) { return /^[A-Z_]+$/.test(error.message) ? error.message : error.code ?? 'FILESYSTEM_OR_INPUT_ERROR'; }
function metadataBlock(body, embeddedExamples = false) {
  requireValue(typeof body === 'string' && Buffer.byteLength(body) <= LIMITS.fileBytes, 'LIMIT_FILE');
  const blocks = [...body.matchAll(/^```json\r?\n([\s\S]*?)^```[ \t]*\r?$/gm)];
  if (blocks.length === 0) {
    requireValue(!/pip-handoff-v|pip-work-order-v|^```json/m.test(body), 'METADATA');
    return null;
  }
  requireValue((embeddedExamples || blocks.length === 1) && /^# [^\r\n]+\r?\n\s*$/.test(body.slice(0, blocks[0].index)), 'METADATA');
  try { return JSON.parse(blocks[0][1]); } catch { fail('JSON'); }
}
function pinsValid(pins) {
  requireValue(Array.isArray(pins), 'DEPENDENCIES');
  for (const p of pins) {
    requireValue(object(p), 'DEPENDENCIES');
    slug(p.projectId); slug(p.taskId); slug(p.requestId); slug(p.runId);
    requireValue(['head', 'tested-content'].includes(p.kind) &&
      (p.sha === 'UNKNOWN' || SHA.test(p.sha)) && (p.digest === 'UNKNOWN' || DIGEST.test(p.digest)) &&
      utc(p.capturedAt) && text(p.evidencePath) &&
      ['executed', 'document-reported', 'worker-reported'].includes(p.qualification), 'DEPENDENCIES');
  }
}
export function validateHandoff(body, identity = null) {
  const errors = [], warnings = [];
  let m;
  try {
    m = metadataBlock(body);
    if (m === null) return { classification: 'legacy/unvalidated', metadata: null,
      errors: [], warnings: [issue('LEGACY')] };
    requireValue(object(m) && m.schemaVersion === 'pip-handoff-v1', 'SCHEMA');
    for (const k of ['projectId', 'taskId', 'runId', 'requestId', 'coordinationSessionId']) slug(m[k]);
    requireValue(text(m.reportingOwner), 'OWNER');
    requireValue(Number.isSafeInteger(m.checkpoint) && m.checkpoint > 0, 'CHECKPOINT');
    requireValue(utc(m.createdAt) && utc(m.updatedAt) && Date.parse(m.updatedAt) >= Date.parse(m.createdAt), 'TIME');
    requireValue(object(m.repository) && text(m.repository.name) && text(m.repository.root), 'REPOSITORY');
    if (m.repository.root !== 'UNKNOWN') absoluteKey(m.repository.root);
    requireValue(object(m.worktree) && text(m.worktree.name) && text(m.worktree.path) &&
      ['main', 'linked', 'unknown'].includes(m.worktree.kind), 'WORKTREE');
    if (m.worktree.path !== 'UNKNOWN') absoluteKey(m.worktree.path);
    requireValue(object(m.session) && text(m.session.label) &&
      (m.session.nativeId === undefined || text(m.session.nativeId)), 'SESSION');
    const g = m.git;
    requireValue(object(g) && text(g.branch) && utc(g.capturedAt) &&
      ['clean', 'dirty', 'UNKNOWN'].includes(g.dirty) && Array.isArray(g.changedFiles) &&
      g.changedFiles.every(text) && Array.isArray(g.commitsMade) && Array.isArray(g.testedPins) && text(g.pr), 'GIT');
    for (const k of ['baseSha', 'headSha', 'mergeSha']) requireValue(text(g[k]) &&
      (SHA.test(g[k]) || g[k] === 'UNKNOWN' || (k === 'mergeSha' && g[k] === 'NONE')), 'SHA');
    requireValue(g.commitsMade.every((p) => SHA.test(p)), 'SHA');
    for (const p of g.testedPins) requireValue(object(p) && ['commit', 'content'].includes(p.kind) &&
      (p.sha === 'UNKNOWN' || SHA.test(p.sha)) && text(p.evidencePath) && utc(p.capturedAt) &&
      ['clean', 'dirty', 'UNKNOWN'].includes(p.dirty) &&
      ['executed', 'document-reported', 'worker-reported'].includes(p.qualification), 'TESTED_PIN');
    const s = m.scope;
    requireValue(object(s) && ['workflow', 'approvalRef', 'planPath', 'planRevision', 'phase', 'completed'].every((k) => text(s[k])) &&
      Array.isArray(s.writeSet) && s.writeSet.length > 0 && s.writeSet.every(text), 'SCOPE');
    if (m.repository.root !== 'UNKNOWN') {
      const scopeRoot = m.worktree.path === 'UNKNOWN' ? m.repository.root : m.worktree.path;
      s.writeSet.forEach((p) => writeKey(p, scopeRoot));
      requireValue(g.changedFiles.every((p) => covered(p, s.writeSet, scopeRoot)), 'CHANGED_FILES_SCOPE');
    }
    requireValue(STATUSES.includes(m.status), 'STATUS');
    pinsValid(m.dependencyPins);
    requireValue(Array.isArray(m.checks) && Array.isArray(m.artifacts) && m.artifacts.every(text) &&
      Array.isArray(m.gaps) && m.gaps.length > 0 && m.gaps.every(text), 'RESULTS');
    for (const c of m.checks) requireValue(object(c) && text(c.name) && text(c.result) &&
      (c.exitCode === null || Number.isInteger(c.exitCode)) && utc(c.executedAt) && utc(c.capturedAt) &&
      text(c.evidencePath) && text(c.sourceBinding) && text(c.dependencyBinding) &&
      ['executed', 'document-reported', 'worker-reported'].includes(c.qualification), 'CHECK');
    for (const section of SECTIONS) {
      const match = body.match(new RegExp(`^## ${section}\\r?\\n([\\s\\S]*?)(?=^## |$(?![\\s\\S]))`, 'm'));
      requireValue(match && match[1].trim().length > 0, 'SECTION');
    }
    if (identity) for (const k of ['projectId', 'taskId', 'runId']) requireValue(m[k] === identity[k], 'PATH_IDENTITY');
    for (const [field, value] of Object.entries({ owner: m.reportingOwner, branch: g.branch,
      baseSha: g.baseSha, headSha: g.headSha, dirty: g.dirty, root: m.repository.root, worktree: m.worktree.path })) {
      if (value === 'UNKNOWN') warnings.push(issue('UNKNOWN', { field }));
    }
    if (m.worktree.kind === 'unknown') warnings.push(issue('UNKNOWN', { field: 'worktreeKind' }));
    if (g.dirty === 'dirty') warnings.push(issue('DIRTY_SOURCE'));
  } catch (e) { errors.push(issue(errorCode(e))); }
  return { classification: 'pip-handoff-v1', metadata: errors.length ? null : m, errors, warnings };
}
export function emptyState(projectId, capturedAt) {
  return { schemaVersion: 'pip-project-state-v1', projectId, revision: 0, owner: null,
    updatedAt: capturedAt, tasks: [], legacyEvidence: [], reconciliationHistory: [], gaps: ['No designated project owner or accepted v1 evidence.'] };
}
function validateRegistry(r) {
  requireValue(object(r) && r.schemaVersion === 'pip-registry-v1' && Number.isSafeInteger(r.revision) &&
    r.revision > 0 && object(r.activation) && ['blocked', 'active', 'suspended'].includes(r.activation.status) &&
    Array.isArray(r.projects) && r.projects.length <= LIMITS.projects, 'REGISTRY');
  const ids = new Set(), roots = new Set(), repositories = new Set();
  for (const p of r.projects) {
    slug(p.projectId); slug(p.repositoryId);
    requireValue(!ids.has(p.projectId.toLowerCase()) && text(p.displayName) &&
      ['package', 'repository', 'evidence-workspace'].includes(p.kind) &&
      Array.isArray(p.worktreeRoots) && object(p.provenance) && text(p.provenance.path) &&
      utc(p.provenance.capturedAt) && text(p.sourceAccess), 'REGISTRY_PROJECT');
    ids.add(p.projectId.toLowerCase());
    requireValue(!repositories.has(p.repositoryId.toLowerCase()), 'DUPLICATE_REPOSITORY');
    repositories.add(p.repositoryId.toLowerCase());
    requireValue(p.repositoryRoot === 'UNKNOWN' ? p.worktreeRoots.length === 0 : true, 'REGISTRY_ROOT');
    for (const root of [...(p.repositoryRoot === 'UNKNOWN' ? [] : [p.repositoryRoot]), ...p.worktreeRoots]) {
      const key = absoluteKey(root);
      requireValue(!roots.has(key), 'DUPLICATE_ROOT'); roots.add(key);
    }
  }
  return r;
}
function validateState(s, projectId) {
  requireValue(object(s) && s.schemaVersion === 'pip-project-state-v1' && s.projectId === projectId &&
    Number.isSafeInteger(s.revision) && s.revision >= 0 && utc(s.updatedAt) &&
    Array.isArray(s.tasks) && s.tasks.length <= LIMITS.tasks && Array.isArray(s.legacyEvidence) &&
    Array.isArray(s.reconciliationHistory) && Array.isArray(s.gaps) && s.gaps.length > 0 && s.gaps.every(text), 'STATE');
  if (s.owner !== null) requireValue(object(s.owner) && text(s.owner.reportingOwner) &&
    SLUG.test(s.owner.coordinationSessionId) && text(s.owner.approvalRef) && utc(s.owner.designatedAt), 'OWNER');
  const tasks = new Set();
  for (const t of s.tasks) {
    slug(t.taskId);
    requireValue(!tasks.has(t.taskId.toLowerCase()) && Array.isArray(t.requests) &&
      t.requests.length <= LIMITS.requests && Array.isArray(t.evidenceHistory) &&
      Array.isArray(t.blockers) && Array.isArray(t.dependencyPins) &&
      ['proposed', ...STATUSES].includes(t.reportedStatus), 'TASK');
    tasks.add(t.taskId.toLowerCase()); pinsValid(t.dependencyPins);
    const requests = new Set(), runs = new Set();
    for (const q of t.requests) {
      slug(q.requestId); slug(q.runId); slug(q.coordinationSessionId);
      requireValue(!requests.has(q.requestId.toLowerCase()) && !runs.has(q.runId.toLowerCase()) &&
        q.path === `projects/${projectId}/requests/${t.taskId}/${q.requestId}.md` &&
        DIGEST.test(q.digest) && text(q.reportingOwner) &&
        (q.authorization === null || (object(q.authorization) && text(q.authorization.approvalRef) && utc(q.authorization.capturedAt))), 'REQUEST_LINK');
      requests.add(q.requestId.toLowerCase()); runs.add(q.runId.toLowerCase());
    }
    requireValue(t.requests.some((q) => q.requestId === t.activeRequestId) &&
      (t.accepted === null || (object(t.accepted) && DIGEST.test(t.accepted.digest) &&
        Number.isSafeInteger(t.accepted.checkpoint) && t.accepted.checkpoint > 0 && utc(t.accepted.acceptedAt) &&
        t.accepted.checkpoint === t.accepted.metadata?.checkpoint &&
        t.accepted.path === `outputs/${projectId}/${t.taskId}/${t.accepted.metadata?.runId}/handoff.md` &&
        t.accepted.metadata?.requestId === t.activeRequestId &&
        t.requests.some((q) => q.requestId === t.accepted.metadata?.requestId && q.runId === t.accepted.metadata?.runId &&
          q.reportingOwner === t.accepted.metadata?.reportingOwner && q.coordinationSessionId === t.accepted.metadata?.coordinationSessionId) &&
        validateHandoff(renderHandoff(t.accepted.metadata), { projectId, taskId: t.taskId,
          runId: t.accepted.metadata.runId }).errors.length === 0)), 'ACCEPTED');
    for (const e of t.evidenceHistory) requireValue(object(e) && DIGEST.test(e.digest) &&
      utc(e.acceptedAt) && text(e.historicalReason) && e.checkpoint === e.metadata?.checkpoint &&
      e.path === `outputs/${projectId}/${t.taskId}/${e.metadata?.runId}/handoff.md` &&
      validateHandoff(renderHandoff(e.metadata), { projectId, taskId: t.taskId, runId: e.metadata?.runId }).errors.length === 0, 'HISTORY');
  }
  requireValue(Buffer.byteLength(json(s)) <= LIMITS.fileBytes, 'LIMIT_STATE');
  return s;
}
function renderHandoff(metadata) {
  return `# Worker Handoff\n\n\`\`\`json\n${JSON.stringify(metadata, null, 2)}\n\`\`\`\n\n` +
    SECTIONS.map((heading) => `## ${heading}\n\nUNKNOWN\n`).join('\n');
}
function overlaps(a, b) {
  const ap = a.split(/[*?]/)[0], bp = b.split(/[*?]/)[0];
  if (a === b) return true;
  if (!/[*?]/.test(a + b)) return false;
  return ap.startsWith(bp) || bp.startsWith(ap);
}

function makeHub(root, hooks = {}) {
  const hub = path.join(root, HUB);
  // All filesystem entry points go through this walk, including missing parents.
  function target(relative, missing = false) {
    safeRelative(relative);
    const destination = path.join(hub, relative);
    const parsed = path.parse(destination);
    let current = parsed.root;
    for (const part of destination.slice(parsed.root.length).split(path.sep)) {
      current = path.join(current, part);
      try {
        const stat = fs.lstatSync(current);
        requireValue(!stat.isSymbolicLink(), 'LINK');
        requireValue(path.resolve(fs.realpathSync(current)).toLowerCase() === path.resolve(current).toLowerCase(), 'REALPATH');
      } catch (e) { if (!(missing && e.code === 'ENOENT')) throw e; }
    }
    return destination;
  }
  function read(relative, track = null) {
    const file = target(relative);
    const before = fs.lstatSync(file);
    requireValue(before.isFile() && before.nlink === 1 && before.size <= LIMITS.fileBytes, 'LIMIT_OR_FILE');
    const fd = fs.openSync(file, fs.constants.O_RDONLY | (fs.constants.O_NOFOLLOW ?? 0));
    let bytes;
    try {
      const opened = fs.fstatSync(fd);
      requireValue(opened.ino === before.ino && opened.dev === before.dev && opened.size === before.size, 'CHANGING');
      bytes = Buffer.alloc(before.size + 1);
      const count = fs.readSync(fd, bytes, 0, bytes.length, 0);
      bytes = bytes.subarray(0, count);
      const after = fs.fstatSync(fd);
      requireValue(count === before.size && before.mtimeMs === after.mtimeMs && before.ctimeMs === after.ctimeMs, 'CHANGING');
    } finally { fs.closeSync(fd); }
    const after = fs.lstatSync(target(relative));
    requireValue(after.ino === before.ino && after.dev === before.dev && after.mtimeMs === before.mtimeMs &&
      after.ctimeMs === before.ctimeMs && after.size === before.size, 'CHANGING');
    const digest = hash(bytes);
    if (track) {
      track.bytes += bytes.length; requireValue(track.bytes <= LIMITS.totalBytes, 'LIMIT_TOTAL');
      track.files.set(relative, digest);
    }
    return { body: bytes.toString('utf8'), digest };
  }
  function readJson(relative, track = null) {
    try { return JSON.parse(read(relative, track).body); }
    catch (e) { if (e instanceof SyntaxError) fail('JSON'); throw e; }
  }
  function parents(relative) {
    target(relative, true);
    fs.mkdirSync(path.dirname(path.join(hub, relative)), { recursive: true });
    target(relative, true);
  }
  function publish(relative, body, immutable = false) {
    requireValue(Buffer.byteLength(body) <= LIMITS.fileBytes, 'LIMIT_FILE');
    parents(relative);
    const file = target(relative, true);
    const temp = `${relative}.${crypto.randomUUID()}.tmp`;
    const temporary = target(temp, true);
    const fd = fs.openSync(temporary, 'wx');
    try { fs.writeFileSync(fd, body); fs.fsyncSync(fd); } finally { fs.closeSync(fd); }
    try {
      hooks.beforeReplace?.(relative);
      target(relative, true);
      if (immutable) fs.linkSync(temporary, file);
      else fs.renameSync(temporary, file);
    } finally { if (fs.existsSync(temporary)) fs.unlinkSync(temporary); }
  }
  function registry(track = null) { return validateRegistry(readJson('registry.json', track)); }
  function projectFor(r, id) {
    slug(id); const p = r.projects.find((p) => p.projectId === id);
    requireValue(p, 'PROJECT'); return p;
  }
  function stateFor(id, track = null) { return validateState(readJson(`projects/${slug(id)}/state.json`, track), id); }
  function report(relative, track = null) {
    const parts = safeRelative(relative).split('/');
    requireValue(parts.length === 5 && parts[0] === 'outputs' && parts[4] === 'handoff.md', 'REPORT_PATH');
    const [, projectId, taskId, runId] = parts; [projectId, taskId, runId].forEach(slug);
    const saved = read(relative, track);
    hooks.afterReportRead?.(relative);
    requireValue(read(relative).digest === saved.digest, 'CHANGING');
    return { path: relative, digest: saved.digest, ...validateHandoff(saved.body, { projectId, taskId, runId }) };
  }
  function walk(relative, depth, track, found = []) {
    let directory;
    try { directory = fs.opendirSync(target(relative)); }
    catch (e) { if (e.code === 'ENOENT') return found; throw e; }
    const entries = [];
    try {
      for (let entry; (entry = directory.readSync()) !== null;) {
        requireValue(++track.entries <= LIMITS.entries, 'LIMIT_ENTRIES'); entries.push(entry);
      }
    } finally { directory.closeSync(); }
    entries.sort((a, b) => a.name < b.name ? -1 : a.name > b.name ? 1 : 0);
    const aliases = new Set();
    for (const entry of entries) {
      const child = `${relative}/${entry.name}`;
      safeRelative(child); target(child);
      requireValue(!aliases.has(entry.name.toLowerCase()), 'CASE_ALIAS'); aliases.add(entry.name.toLowerCase());
      if (entry.isDirectory()) {
        requireValue(depth > 0, 'OUTPUT_SHAPE'); slug(entry.name);
        walk(child, depth - 1, track, found);
      } else {
        requireValue(entry.isFile() && depth === 0, 'OUTPUT_SHAPE');
        if (entry.name === 'handoff.md' || relative.startsWith('projects/')) found.push(child);
      }
    }
    return found;
  }
  function validateRequest(q, p, op) {
    requireValue(object(q) && q.schemaVersion === 'pip-work-order-v1' && q.projectId === p.projectId &&
      q.coordinationSessionId === op.coordinationSessionId && text(q.reportingOwner), 'REQUEST');
    slug(q.taskId); slug(q.requestId); slug(q.runId);
    requireValue(text(q.milestoneId) && Array.isArray(q.featureIds) && q.featureIds.every((id) => SLUG.test(id)), 'REQUEST_FEATURES');
    requireValue(q.status === 'PROPOSED' && q.approvalRef === 'NONE' && utc(q.createdAt) &&
      ['design', 'planning', 'implementation', 'review'].includes(q.purpose), 'PROPOSAL');
    const workflow = { design: '/cg-brainstorm --no-branch', planning: '/cg-plan',
      implementation: '/cg-work', review: '/cg-review --report-only' }[q.purpose];
    requireValue(q.workflow === workflow && q.repositoryRoot === p.repositoryRoot &&
      (q.worktreeRoot === p.repositoryRoot || p.worktreeRoots.includes(q.worktreeRoot)) &&
      q.repositoryRoot !== 'UNKNOWN', 'REQUEST_ROOT');
    for (const key of ['objective', 'planPath', 'planRevision', 'phase', 'branchName', 'branchEvidence', 'worktreeReason']) requireValue(text(q[key]), 'REQUEST_FIELD');
    for (const key of ['writeSet', 'prohibitedSet', 'lifecyclePaths', 'prerequisites', 'acceptanceEvidence', 'stopConditions', 'sharedContracts'])
      requireValue(Array.isArray(q[key]) && q[key].every(text) && (key === 'sharedContracts' || q[key].length > 0), 'REQUEST_ARRAY');
    q.writeSet.forEach((p) => writeKey(p, q.worktreeRoot)); pinsValid(q.dependencyPins);
    const output = `${MAIN_ROOT}/${HUB}/outputs/${q.projectId}/${q.taskId}/${q.runId}/handoff.md`;
    requireValue(q.outputPath === output && q.writeSet.includes(output) && q.lifecyclePaths.every((f) => covered(f, q.writeSet, q.worktreeRoot)), 'REPORT_WRITE_SET');
    requireValue(Array.isArray(q.supportingOutputs) && q.supportingOutputs.every((f) =>
      f.startsWith(output.slice(0, -10)) && q.writeSet.includes(f) && /^[A-Za-z0-9_.-]+$/.test(f.slice(output.length - 10))), 'SUPPORTING_OUTPUT');
    const outputSet = [output, ...q.supportingOutputs].map((f) => writeKey(f, q.worktreeRoot));
    for (const file of q.writeSet) {
      const key = writeKey(file, q.worktreeRoot), base = absoluteKey(q.worktreeRoot);
      requireValue(outputSet.includes(key) || (key.startsWith(`${base}/`) &&
        !overlaps(key, `${base}/${HUB}/**`)), 'WRITE_ROOT_OR_COORDINATOR_PATH');
    }
    const contract = q.commandContract;
    requireValue(object(contract) && typeof contract.available === 'boolean' && text(contract.path) &&
      text(contract.digest) && utc(contract.capturedAt) && Array.isArray(contract.requiredWriteSet) &&
      contract.requiredWriteSet.every((f) => covered(f, q.writeSet, q.worktreeRoot)), 'COMMAND_CONTRACT');
    requireValue(object(q.outerReporting) && typeof q.outerReporting.authorized === 'boolean' &&
      text(q.outerReporting.owner) && text(q.outerReporting.approvalRef), 'OUTER_REPORTING');
    requireValue(q.supersedes === null || text(q.supersedes), 'SUPERSESSION');
    if (q.purpose === 'implementation') requireValue(q.planApproved === true &&
      q.planPath.replaceAll('\\', '/').startsWith(`${q.worktreeRoot}/.cg-docs/plans/`) &&
      !unknown(q.planRevision) && !unknown(q.phase), 'LOCAL_APPROVED_PLAN');
    return q;
  }
  function workOrder(q) {
    const contract = read('CONTRACT.md').body;
    const template = read('templates/handoff.md').body;
    const metadata = { schemaVersion: 'pip-handoff-v1', projectId: q.projectId, taskId: q.taskId,
      runId: q.runId, requestId: q.requestId, coordinationSessionId: q.coordinationSessionId,
      reportingOwner: q.reportingOwner, checkpoint: 1, createdAt: q.createdAt, updatedAt: q.createdAt,
      repository: { name: q.projectId, root: q.repositoryRoot },
      worktree: { name: q.runId, path: q.worktreeRoot, kind: 'unknown' },
      session: { label: q.reportingOwner, nativeId: 'UNKNOWN' },
      git: { branch: 'UNKNOWN', baseSha: 'UNKNOWN', headSha: 'UNKNOWN', capturedAt: q.createdAt,
        dirty: 'UNKNOWN', changedFiles: [], commitsMade: [], mergeSha: 'NONE', pr: 'NONE', testedPins: [] },
      scope: { workflow: q.workflow, approvalRef: 'UNKNOWN', planPath: q.planPath,
        planRevision: q.planRevision, phase: q.phase, writeSet: q.writeSet, completed: 'not started' },
      status: 'blocked', dependencyPins: q.dependencyPins, checks: [], artifacts: [], gaps: ['Preflight evidence not captured yet.'] };
    const frozen = { ...q, embeddedContractDigest: hash(contract), embeddedTemplateDigest: hash(template) };
    return `# Work Order ${q.requestId}\n\n\`\`\`json\n${JSON.stringify(frozen, null, 2)}\n\`\`\`\n\n` +
      `## Prompt\n\n${q.workflow}\n\nExecution status: PROPOSED. The current user must approve and start this task separately.\n` +
      `Task/request/run: ${q.taskId} / ${q.requestId} / ${q.runId}.\nReporting owner: ${q.reportingOwner}.\n` +
      `Milestone: ${q.milestoneId}. Feature IDs: ${JSON.stringify(q.featureIds)}. No roadmap mutation is authorized.\n` +
      `Repository: ${q.repositoryRoot}. Worktree: ${q.worktreeRoot}.\n` +
      `Branch recommendation: ${q.branchName}; evidence: ${q.branchEvidence}. ${q.worktreeReason}\n` +
      `Recommendations do not authorize branch/worktree creation or switching. Never stash.\n` +
      `Objective: ${q.objective}\nPlan/revision/phase: ${q.planPath} / ${q.planRevision} / ${q.phase}.\n\n` +
      ['writeSet', 'prohibitedSet', 'lifecyclePaths', 'prerequisites', 'acceptanceEvidence', 'stopConditions', 'dependencyPins', 'sharedContracts', 'commandContract', 'outerReporting']
        .map((k) => `${k}: ${JSON.stringify(q[k])}`).join('\n\n') +
      `\n\n## Required File Outputs\n\nCentral report: ${q.outputPath}\nSupporting outputs: ${JSON.stringify(q.supportingOutputs)}.\n` +
      `Create at start; checkpoint substantive results before every pause, blocker or completion; read back the saved files.\n` +
      `Workers own only assigned outputs, never registry/state/other reports. No helpers or session starts without explicit approval and distinct output paths.\n` +
      `No credentials, production data, private storage or raw conversations. Save sanitized evidence with canonical path/SHA/capture time when the coordinator cannot read it.\n` +
      `Plugin File Permissions remain authoritative. A restricted command does not write this central handoff: the independently authorized outer Code caller saves its attributed result separately. If that authorization/access is missing, STOP blocked.\n` +
      `Do not execute this as package implementation from pipsystem or use an umbrella plan. No roadmap/Git writes follow from this proposal.\n` +
      `\n## Embedded Output Contract\n\n${contract}\n\n## Embedded Handoff Template\n\n${template}\n` +
      `\n## Filled Initial Handoff\n\n${renderHandoff(metadata)}`;
  }
  function collect() {
    const track = { bytes: 0, entries: 0, files: new Map() };
    const r = registry(track), projects = [], reports = [], issues = [], requests = [], requestScans = new Map();
    if (r.migration) {
      for (const [name, title, prefix] of [['STATE.md', '# Coordination State', 'Observation date:'],
        ['REQUESTS.md', '# Coordination Requests', 'Created:']]) {
        requireValue(SHA.test(r.migration[name]), 'MIGRATION_BASELINE');
        const body = read(name, track).body.replaceAll('\r\n', '\n');
        const offset = body.indexOf(`\n${prefix}`);
        const old = `${title}\n\n${offset < 0 ? '' : body.slice(offset + 1)}`;
        if (offset < 0 || gitBlob(old) !== r.migration[name]) issues.push(issue('HISTORY_BASELINE_CHANGED', { path: name }));
      }
    }
    for (const p of [...r.projects].sort((a, b) => a.projectId < b.projectId ? -1 : a.projectId > b.projectId ? 1 : 0)) {
      try {
        const s = stateFor(p.projectId, track);
        projects.push({ projectId: p.projectId, repositoryRoot: p.repositoryRoot, state: s });
        for (const t of s.tasks) for (const q of t.requests) {
          try {
            const saved = read(q.path, track);
            requireValue(saved.digest === q.digest, 'REQUEST_AMENDED');
            const m = metadataBlock(saved.body, true);
            validateRequest(m, p, { coordinationSessionId: q.coordinationSessionId });
            requireValue(m.requestId === q.requestId && m.runId === q.runId && m.taskId === t.taskId &&
              m.reportingOwner === q.reportingOwner, 'REQUEST_IDENTITY');
            requests.push({ projectId: p.projectId, taskId: t.taskId, link: q, metadata: m,
              active: t.activeRequestId === q.requestId && !['completed', 'cancelled', 'no-change'].includes(t.reportedStatus) });
          } catch (e) { issues.push(issue(errorCode(e), { projectId: p.projectId, taskId: t.taskId, path: q.path })); }
        }
        const paths = walk(`projects/${p.projectId}/requests`, 1, track);
        requestScans.set(`projects/${p.projectId}/requests`, paths);
        for (const candidate of paths) if (!s.tasks.some((t) => t.requests.some((q) => q.path === candidate)))
          issues.push(issue('ORPHAN_REQUEST', { projectId: p.projectId, path: candidate }));
      } catch (e) { issues.push(issue(errorCode(e), { projectId: p.projectId })); }
    }
    const paths = walk('outputs', 3, track);
    requireValue(paths.length <= LIMITS.reports, 'LIMIT_REPORTS');
    for (const candidate of paths) {
      try { reports.push(report(candidate, track)); }
      catch (e) { issues.push(issue(errorCode(e), { path: candidate })); }
    }
    for (const rep of reports) {
      const [, projectId, taskId, runId] = rep.path.split('/');
      const task = projects.find((p) => p.projectId === projectId)?.state.tasks.find((t) => t.taskId === taskId);
      const request = task?.requests.find((q) => q.runId === runId);
      if (!request) issues.push(issue('UNREGISTERED_REPORT', { path: rep.path, projectId, taskId, runId }));
      if (rep.classification === 'legacy/unvalidated') issues.push(issue('LEGACY_UNVALIDATED', { path: rep.path }));
      issues.push(...rep.errors.map((e) => ({ ...e, path: rep.path })), ...rep.warnings.map((e) => ({ ...e, path: rep.path })));
      rep.ageSinceReportSeconds = utc(rep.metadata?.updatedAt) ? Math.max(0, Math.floor((Date.now() - Date.parse(rep.metadata.updatedAt)) / 1000)) : null;
    }
    for (const p of projects) for (const t of p.state.tasks) {
      const q = t.requests.find((q) => q.requestId === t.activeRequestId);
      const candidate = `outputs/${p.projectId}/${t.taskId}/${q.runId}/handoff.md`;
      if (!reports.some((r) => r.path === candidate)) issues.push(issue('MISSING_HANDOFF', { projectId: p.projectId, taskId: t.taskId, path: candidate }));
      if (t.accepted) {
        const current = reports.find((r) => r.path === t.accepted.path);
        t.acceptedValidity = !current ? 'missing-historical-only' : current.errors.length ? 'invalid-historical-only' :
          current.digest !== t.accepted.digest ? 'amended-historical-only' : 'unchanged';
        if (t.acceptedValidity !== 'unchanged') issues.push(issue('ACCEPTED_EVIDENCE_CHANGED', { projectId: p.projectId, taskId: t.taskId, validity: t.acceptedValidity }));
      }
      for (const pin of t.dependencyPins) {
        const producer = projects.find((p) => p.projectId === pin.projectId)?.state.tasks.find((t) => t.taskId === pin.taskId);
        const accepted = producer?.accepted;
        const producerReport = reports.find((r) => r.path === accepted?.path);
        const pinSha = pin.kind === 'head' ? accepted?.metadata.git.headSha :
          accepted?.metadata.git.testedPins.find((p) => p.kind === 'content')?.sha;
        if (!accepted || producer.reportedStatus !== 'completed' || unknown(pin.sha) || unknown(pin.digest) ||
          accepted.metadata.requestId !== pin.requestId || accepted.metadata.runId !== pin.runId ||
          pinSha !== pin.sha || accepted.digest !== pin.digest ||
          !producerReport || producerReport.errors.length > 0 || producerReport.digest !== accepted.digest ||
          issues.some((i) => i.projectId === pin.projectId && i.taskId === pin.taskId && i.code === 'REQUEST_AMENDED') ||
          (producer.acceptedValidity && producer.acceptedValidity !== 'unchanged'))
          issues.push(issue('UNRESOLVED_OR_STALE_DEPENDENCY', { projectId: p.projectId, taskId: t.taskId, producerProjectId: pin.projectId, producerTaskId: pin.taskId }));
      }
    }
    const assignments = requests.filter((q) => q.active);
    for (const q of assignments) {
      if (!q.metadata.commandContract.available || !DIGEST.test(q.metadata.commandContract.digest))
        issues.push(issue('COMMAND_CONTRACT_PREREQUISITE', { projectId: q.projectId, taskId: q.taskId }));
      if (!q.metadata.outerReporting.authorized || unknown(q.metadata.outerReporting.approvalRef))
        issues.push(issue('OUTER_REPORTING_BLOCKED', { projectId: q.projectId, taskId: q.taskId }));
      for (const other of assignments) if (`${q.projectId}/${q.taskId}` < `${other.projectId}/${other.taskId}`) {
        if (q.metadata.writeSet.some((a) => other.metadata.writeSet.some((b) => overlaps(writeKey(a, q.metadata.worktreeRoot), writeKey(b, other.metadata.worktreeRoot)))))
          issues.push(issue('WRITE_SET_CONFLICT', { projectId: q.projectId, taskId: q.taskId, otherProjectId: other.projectId, otherTaskId: other.taskId }));
        if (q.metadata.sharedContracts.some((a) => other.metadata.sharedContracts.includes(a)))
          issues.push(issue('SHARED_CONTRACT', { projectId: q.projectId, taskId: q.taskId, otherProjectId: other.projectId, otherTaskId: other.taskId }));
      }
    }
    const graph = new Map(projects.flatMap((p) => p.state.tasks.map((t) => [`${p.projectId}/${t.taskId}`, t.dependencyPins.map((d) => `${d.projectId}/${d.taskId}`)])));
    function visit(key, stack, done) {
      if (stack.has(key)) { issues.push(issue('DEPENDENCY_CYCLE', { task: key })); return; }
      if (done.has(key)) return;
      stack.add(key); for (const next of graph.get(key) ?? []) visit(next, stack, done);
      stack.delete(key); done.add(key);
    }
    const done = new Set(); for (const key of graph.keys()) visit(key, new Set(), done);
    hooks.afterCollect?.();
    const stable = [...track.files].every(([relative, digest]) => { try { return read(relative).digest === digest; } catch { return false; } });
    // Re-scan names as well as bytes so newly published reports cannot disappear from coverage.
    const second = { bytes: 0, entries: 0, files: new Map() };
    const sameNames = json(walk('outputs', 3, second)) === json(paths) &&
      [...requestScans].every(([relative, paths]) => json(walk(relative, 1, second)) === json(paths));
    return { schemaVersion: 'pip-overview-v1', capturedAt: now(), consistent: stable && sameNames,
      registryRevision: r.revision, registryDigest: track.files.get('registry.json'), activation: r.activation,
      projects, reports, requests, issues, evidenceDigests: Object.fromEntries(track.files),
      coverage: { registeredProjects: r.projects.length, statesRead: projects.length, reportsDiscovered: paths.length,
        reportLimit: LIMITS.reports, entryLimit: LIMITS.entries, byteLimit: LIMITS.totalBytes,
        completeWithinHub: stable && sameNames && projects.length === r.projects.length && !issues.some((i) => ['CHANGING', 'LIMIT_FILE', 'LIMIT_OR_FILE', 'JSON', 'STATE', 'HISTORY_BASELINE_CHANGED'].includes(i.code)) },
      liveness: 'UNKNOWN', executionApproval: 'not-assessed', integrationReadiness: 'not-certified',
      limits: ['Only registered coordination files and central handoffs; external work is not inferable.',
        'Age means time since a report, not session activity.', 'Valid schema and reported completion are not verification or approval.'] };
  }
  function refresh(session, save = true) {
    slug(session); let view;
    for (let attempt = 0; attempt < LIMITS.retries; attempt++) {
      view = collect(); if (view.consistent) break;
    }
    if (!view.consistent) view.issues.push(issue('INCONSISTENT_SNAPSHOT'));
    view.coordinationSessionId = session;
    if (save) publish(`views/${session}/overview.json`, json(view));
    return view;
  }
  function apply(op) {
    requireValue(object(op) && op.schemaVersion === 'pip-operation-v1' && KINDS.includes(op.kind), 'OPERATION');
    const common = ['schemaVersion', 'kind', 'projectId', 'coordinationSessionId', 'reportingOwner', 'expectedRevision', 'approvalRef'];
    const extra = { refresh: [], validate: ['reportPath'], claim: [], release: [],
      transfer: ['previousCoordinationSessionId', 'previousReportingOwner'], 'recover-lock': ['lockDigest'],
      request: ['request'], intake: ['reportPath'], update: ['taskId', 'blockers', 'note', 'qualification', 'executionApproval', 'evidenceRefs'] }[op.kind];
    requireValue(Object.keys(op).every((k) => [...common, ...extra].includes(k)), 'OPERATION_FIELD');
    slug(op.coordinationSessionId); requireValue(text(op.reportingOwner) && !unknown(op.reportingOwner), 'OWNER');
    if (op.kind === 'refresh') return refresh(op.coordinationSessionId);
    if (op.kind === 'validate') return report(op.reportPath);
    slug(op.projectId);
    requireValue(Number.isSafeInteger(op.expectedRevision) && op.expectedRevision >= 0, 'REVISION');
    const r = registry(), p = projectFor(r, op.projectId);
    requireValue(r.activation.status === 'active', 'ACTIVATION_BLOCKED');
    const statePath = `projects/${p.projectId}/state.json`, lockPath = `projects/${p.projectId}/.lock`;
    if (op.kind === 'recover-lock') {
      requireValue(text(op.approvalRef) && !unknown(op.approvalRef) && DIGEST.test(op.lockDigest), 'RECOVERY_APPROVAL');
      requireValue(stateFor(p.projectId).revision === op.expectedRevision, 'REVISION');
      requireValue(read(lockPath).digest === op.lockDigest, 'LOCK_IDENTITY');
      fs.unlinkSync(target(lockPath)); return { status: 'recovered', projectId: p.projectId };
    }
    parents(lockPath);
    let fd;
    try { fd = fs.openSync(target(lockPath, true), 'wx'); }
    catch (e) { if (e.code === 'EEXIST') fail('LOCKED_EXPLICIT_RECOVERY_REQUIRED'); throw e; }
    const token = crypto.randomUUID();
    fs.writeFileSync(fd, json({ token, coordinationSessionId: op.coordinationSessionId, createdAt: now() }));
    try {
      const s = stateFor(p.projectId), prior = read(statePath).digest;
      requireValue(s.revision === op.expectedRevision, 'REVISION');
      const owner = s.owner?.coordinationSessionId === op.coordinationSessionId && s.owner?.reportingOwner === op.reportingOwner;
      if (op.kind === 'claim' || op.kind === 'transfer') {
        requireValue(text(op.approvalRef) && !unknown(op.approvalRef), 'DESIGNATION_APPROVAL');
        if (op.kind === 'claim') requireValue(s.owner === null, 'OWNER_ALREADY_CLAIMED');
        else requireValue(s.owner && op.previousCoordinationSessionId === s.owner.coordinationSessionId &&
          op.previousReportingOwner === s.owner.reportingOwner, 'TRANSFER_IDENTITY');
        s.owner = { coordinationSessionId: op.coordinationSessionId, reportingOwner: op.reportingOwner,
          approvalRef: op.approvalRef, designatedAt: now() };
      } else {
        requireValue(owner, 'OWNER');
        if (op.kind === 'release') s.owner = null;
        else if (op.kind === 'request') {
          requireValue(refresh(op.coordinationSessionId, false).consistent, 'INCONSISTENT_SNAPSHOT');
          const q = validateRequest(op.request, p, op);
          let t = s.tasks.find((t) => t.taskId === q.taskId);
          const body = workOrder(q), digest = hash(body);
          if (t?.requests.some((r) => r.requestId === q.requestId)) {
            const previous = t.requests.find((r) => r.requestId === q.requestId);
            requireValue(previous.digest === digest && read(previous.path).digest === digest, 'IMMUTABLE_REQUEST');
            return { status: 'idempotent', revision: s.revision };
          }
          requireValue(!t ? q.supersedes === null : q.supersedes === t.activeRequestId, 'EXPLICIT_SUPERSESSION');
          requireValue(!t?.requests.some((r) => r.runId.toLowerCase() === q.runId.toLowerCase()), 'NEW_RUN_REQUIRED');
          const requestPath = `projects/${p.projectId}/requests/${q.taskId}/${q.requestId}.md`;
          try { requireValue(read(requestPath).digest === digest, 'ORPHAN_DIGEST_CONFLICT'); }
          catch (e) { if (e.code !== 'ENOENT') throw e; publish(requestPath, body, true); }
          hooks.afterRequestPublish?.();
          if (!t) {
            t = { taskId: q.taskId, requests: [], activeRequestId: q.requestId, accepted: null,
              evidenceHistory: [], blockers: [], dependencyPins: [], reportedStatus: 'proposed' };
            s.tasks.push(t);
          }
          if (t.accepted) t.evidenceHistory.push({ ...t.accepted, historicalReason: 'explicit-request-supersession' });
          t.accepted = null; t.reportedStatus = 'proposed'; t.activeRequestId = q.requestId;
          t.dependencyPins = q.dependencyPins;
          t.requests.push({ requestId: q.requestId, runId: q.runId, path: requestPath, digest,
            coordinationSessionId: q.coordinationSessionId, reportingOwner: q.reportingOwner,
            supersedes: q.supersedes, authorization: null });
        } else if (op.kind === 'intake') {
          const rep = report(op.reportPath), m = rep.metadata;
          requireValue(rep.classification === 'pip-handoff-v1' && rep.errors.length === 0, 'INVALID_HANDOFF');
          requireValue(m.projectId === p.projectId && m.coordinationSessionId === op.coordinationSessionId, 'INTAKE_IDENTITY');
          const t = s.tasks.find((t) => t.taskId === m.taskId);
          const q = t?.requests.find((q) => q.requestId === m.requestId && q.runId === m.runId);
          requireValue(q && t.activeRequestId === q.requestId && q.reportingOwner === m.reportingOwner, 'INTAKE_REQUEST');
          const saved = read(q.path); requireValue(saved.digest === q.digest, 'REQUEST_AMENDED');
          const request = validateRequest(metadataBlock(saved.body, true), p, { coordinationSessionId: q.coordinationSessionId });
          requireValue(m.repository.root === request.repositoryRoot && m.worktree.path === request.worktreeRoot &&
            m.scope.workflow === request.workflow && m.scope.planPath === request.planPath &&
            m.scope.planRevision === request.planRevision && m.scope.phase === request.phase &&
            sameSet(m.scope.writeSet, request.writeSet, request.worktreeRoot) &&
            json(m.dependencyPins) === json(request.dependencyPins), 'INTAKE_SCOPE');
          if (t.accepted) {
            requireValue(m.checkpoint >= t.accepted.checkpoint, 'OLDER_CHECKPOINT');
            if (m.checkpoint === t.accepted.checkpoint) {
              requireValue(rep.digest === t.accepted.digest, 'CHECKPOINT_CONFLICT');
              return { status: 'idempotent', revision: s.revision };
            }
            requireValue(m.createdAt === t.accepted.metadata.createdAt && Date.parse(m.updatedAt) >= Date.parse(t.accepted.metadata.updatedAt), 'CHECKPOINT_TIME');
            t.evidenceHistory.push({ ...t.accepted, historicalReason: 'newer-checkpoint' });
          }
          requireValue(read(op.reportPath).digest === rep.digest, 'CHANGING');
          t.accepted = { path: rep.path, digest: rep.digest, checkpoint: m.checkpoint,
            acceptedAt: now(), qualification: 'worker-reported', metadata: m, warnings: rep.warnings };
          t.reportedStatus = m.status;
        } else if (op.kind === 'update') {
          slug(op.taskId); const t = s.tasks.find((t) => t.taskId === op.taskId);
          requireValue(t && Array.isArray(op.blockers) && op.blockers.every(text) && text(op.note) &&
            ['observed', 'document-reported', 'worker-reported', 'proposed'].includes(op.qualification), 'UPDATE');
          t.blockers = op.blockers;
          if (op.evidenceRefs) requireValue(Array.isArray(op.evidenceRefs) && op.evidenceRefs.every((e) =>
            object(e) && text(e.path) && DIGEST.test(e.digest) && utc(e.capturedAt) &&
            ['observed', 'document-reported', 'worker-reported', 'proposed'].includes(e.qualification)), 'EVIDENCE_REFS');
          if (op.executionApproval) {
            requireValue(object(op.executionApproval) && text(op.approvalRef) && !unknown(op.approvalRef) &&
              op.executionApproval.requestId === t.activeRequestId && text(op.executionApproval.approvalRef) &&
              !unknown(op.executionApproval.approvalRef), 'EXECUTION_APPROVAL');
            t.requests.find((q) => q.requestId === t.activeRequestId).authorization =
              { approvalRef: op.executionApproval.approvalRef, capturedAt: now() };
          }
        }
      }
      s.revision++; s.updatedAt = now();
      s.reconciliationHistory.push({ kind: op.kind, coordinationSessionId: op.coordinationSessionId,
        reportingOwner: op.reportingOwner, capturedAt: s.updatedAt, approvalRef: op.approvalRef ?? 'NONE',
        note: op.note ?? 'NONE', qualification: op.qualification ?? 'proposed', evidenceRefs: op.evidenceRefs ?? [] });
      validateState(s, p.projectId);
      requireValue(read(statePath).digest === prior && hash(json(r)) === hash(json(registry())), 'CONCURRENT_CHANGE');
      publish(statePath, json(s));
      return { status: 'recorded', revision: s.revision, executionApproval: 'not-granted-by-helper' };
    } finally {
      fs.closeSync(fd);
      if (readJson(lockPath).token === token) fs.unlinkSync(target(lockPath));
    }
  }
  return { apply, refresh, validateReport: (relative) => report(relative),
    readOperation: (session) => {
      const saved = read(`control/${slug(session)}/operation.json`);
      requireValue(Buffer.byteLength(saved.body) <= 65536, 'CONTROL_LIMIT');
      try { return JSON.parse(saved.body); } catch { fail('CONTROL_JSON'); }
    } };
}

export function createTestHub(root, hooks = {}) {
  const base = path.join(SOURCE_ROOT, '.tmp/pip-orchestration');
  const relative = path.relative(base, path.resolve(root));
  requireValue(relative && !relative.startsWith('..') && !path.isAbsolute(relative), 'TEST_ROOT');
  return makeHub(path.resolve(root), hooks);
}
export function runCli(args) {
  requireValue(args.length === 1, 'USAGE_SESSION_ID_ONLY');
  const session = slug(args[0]);
  requireValue(absoluteKey(SOURCE_ROOT) === absoluteKey(MAIN_ROOT) &&
    absoluteKey(process.cwd()) === absoluteKey(MAIN_ROOT), 'MAIN_CHECKOUT_REQUIRED');
  // The CLI has no root override, interpreter flags, command payload or executable field.
  const api = makeHub(MAIN_ROOT);
  const operationPath = `${HUB}/control/${session}/operation.json`;
  const op = api.readOperation(session);
  requireValue(op.coordinationSessionId === session, 'CONTROL_IDENTITY');
  const result = api.apply(op);
  if (op.kind === 'refresh') return { operationPath, viewPath: `${HUB}/views/${session}/overview.json`,
    consistent: result.consistent, coverage: result.coverage, activation: result.activation,
    projectRevisions: Object.fromEntries(result.projects.map((p) => [p.projectId, p.state.revision])),
    issues: result.issues, liveness: result.liveness, integrationReadiness: result.integrationReadiness };
  if (op.kind === 'validate') return { operationPath, path: result.path, digest: result.digest,
    classification: result.classification, errors: result.errors, warnings: result.warnings };
  return { operationPath, result };
}
if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try { console.log(json(runCli(process.argv.slice(2)))); }
  catch (e) { console.error(json({ error: /^[A-Z_]+$/.test(e.message) ? e.message : 'FILESYSTEM_OR_INPUT_ERROR' })); process.exitCode = 1; }
}
