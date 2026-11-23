---
type: scoped-review
findings:
  P2.1: fixed
---

# Clean launcher scoped QA

## Initial result
Testing role reported no supported P0-P3 issues. Reproducibility role found one
P2.1: inherited GH_TOKEN/GITHUB_TOKEN override stored GitHub CLI configuration
credentials even when GH_CONFIG_DIR names the intended existing config.

## P2.1 correction
The user-only branch now snapshots, masks and later restores both override
variables. No persistent credential/configuration change. Local preflight does
not enter this branch or read any credential. GH_PASS is passed to the live R
child only in memory, never argv, logs or process.json.

## Executed correction check
credential-env-test.log records PASS for actual launcher clear assignments and
finally-restoration statements extracted via PowerShell AST. A separate test
process overwrites incoming token variables with dummy strings BEFORE reading
either variable. No real credential, gh invocation, R, network or shared access.
The dummy values are never used for authentication. Negative/failing source
checks are not replaced with fake live results.

Latest corrected default preflight:
`runs/20261117T1956347727Z-preflight-25696/result.log` and process.json, exit0;
fresh R PID33548, checked private data.table, three receipt pins and 107
dependency descriptions. Shared bootstrap/probe explicitly NOT RUN.

## Failure labels
Launcher childStarted separates failure before R startup (dependent NOT RUN)
from an R run with no result table (no acceptance inferred; does not falsely
claim no read occurred). Worker outer handler covers local startup/preflight
errors; shared/probe errors retain their stage-specific handler. Actual printed
errors retained, no auto rollback or masking of candidate FAIL/NOT RUN.

## Gaps
Follow-up testing and reproducibility QA both verified P2.1 fixed with no
supported remaining/new P0-P3, suppressions or deferred findings. Reports retain
initial findings and append final-source verification. Final E: working-directory
confinement was additionally exercised in the coordinator's default preflight
runs/20261117T2001247659Z-preflight-14520 (exit0, R PID32372), with no live behavior.
This is not live authentication,
network/metadata, context setup or candidate acceptance evidence. Those remain
user-only and NOT RUN by the agent. No source/namespace/data patch or weakening
of the existing probe.

## Path-budget regression correction
Later user live run201018 failed context setup with PATH_MAX260; candidate checks
NOT RUN. This is a real bootstrap failure, not waived by earlier preflight.
Generated scratch base is now short `.tmp/rcv/<12-hex-key>`; result folders use
the same short key and process.json retains UTC start/mode/PID. Actual legacy base
shrinks from233 to147 characters. Local regression uses a separate path-check
tree matching pipfun's suffix plus48-character component/survey_data (212bytes),
so it cannot contaminate live vintage discovery. Default preflight460abc537a7c
exit0, PID26288; private data.table/receipts/107descriptions and path check PASS.
Scoped follow-up testing review reports no supported P0-P3; live retry still
NOT RUN. Shared context parameters, all exact pins, probe bytes and token controls
unchanged. No package, registry, Windows long-path policy or personal library fix.
