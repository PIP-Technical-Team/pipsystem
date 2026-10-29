---
date: 2026-10-28
type: attributed-verification-output
agent: cg-code-quality
session-id: ses_e7d616f86ffeJ10SamErJxq1Rn
saved-by: existing pipdata Code session
reviewer-role: read-only
---

# Code Quality Verification Result

The outer caller saved this substantive result from the assigned read-only
reviewer. Reviewer wrote no files and ran no package processes, tests, builds,
installations, helpers, subagents or Git mutations. No model override.

## Verdict

Two findings: one P1 and one P2, no P0 identified by this critic. Historical
exact-pin results do not establish compatibility across DESCRIPTION's admitted
dependency range. Both findings are cross-file compatibility issues, not
suppressed observations on prior fixed refactoring.

## Findings

### Local P1.1: Required Metadata API Not Enforced Before Publication

Canonical merged ID P1.4; also reported by testing as local P2.13.
R/dependency_execution.R:177-178 always invokes
pipload::pip_read(metadata_only=TRUE) after stamp::st_rebuild at line148.
DESCRIPTION:25 accepts pipload>=0.2.0.9005. Concrete counterexample:
../pipload/DESCRIPTION:2 is1.0.0, but ../pipload/R/pip_read-write.R:48-54 lacks
metadata_only and ...; tested S/source/pipload/R/pip_read-write.R:63-69 also
reports1.0.0 but supports metadata_only. An admitted adapter can therefore fail
with unused argument only after durable output publication. The outer integrity
handler prevents a normal success table, but the dependency contract cannot
distinguish working and incompatible installations.

Required next action: authorize an M2 capability check before lease/rebuild or
a distinguishable dependency release/requirement, plus negative regression
proving rejection before callback/publication. Merely raising minimum to1.0.0
is insufficient. Metadata/source/test changes are outside this task.

### Local P2.1: Suggested Codetools Is Mandatory On The Opt-In Route

Canonical merged ID P2.14, distinct from prior P2.1/A6 overlay issue.
R/code_fingerprint.R:274 unconditionally calls codetools::findGlobals for every
calculation/helper. DESCRIPTION:35-38 lists codetools only as Suggests. A required-
dependencies-only installation can load pipdata but fail preparing a nonempty
M2 request. Saved exact-pin runtime included codetools0.2-20, not this absence.

Required next action: declare the runtime dependency, or explicitly gate the
optional route with actionable error/documented requirement; never bypass proof.
Verify the selected behavior in an isolated dependency environment after approval.

## Verified Source Facts

Four R files, three tests, owned Rd/article and DESCRIPTION/NAMESPACE/Rbuildignore
inspected. Applied selected17 fixed IDs/crosswalk and native light suppression.
.Rbuildignore:10 excludes .cg-docs. Legacy argument positions/defaults intact,
recipes appended; modern branch precedes legacy inventory and rejects legacy
controls. Exact-success validation, cancellation, latched guards and bounded
history traversal are present. Local config absent; R package/infrastructure
skills applied. Static inspection is not fresh execution.

## Evidence And Limits

Current-byte comparisons supplied by outer caller in sibling evidence.md, not
independently recomputed by this critic. Historical41tests286expectations and
installed smoke bound to exact stamp/pipload pins were read, not rerun. No full
suite claim.41 excluded tests, broader dependency/R combinations, production,
SMB, concurrency and article rendering remain unverified. Result-bound provenance
and source-versus-installed identity lessons applied; no obsolete global-stop rule.

## Disposition

Both findings unresolved. Reviewer output usable; no retry/replacement helper.
Outer caller must report and obtain separate source-correction authorization.
