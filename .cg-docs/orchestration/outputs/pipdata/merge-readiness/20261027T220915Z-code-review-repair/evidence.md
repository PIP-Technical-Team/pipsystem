# Merge Readiness Review Repair Evidence

## Checkpoint 1

Capture2026-10-28T12:55:13.5666620Z. Direct user instruction authorizes tracking
repair in one standard review, genuine light verification, one new canonical
verification report, and four exact central outputs. No source/test/doc/Plan/
state/runtime changes or package processes authorized. No new workers/worktrees.

Observed branch feat/m2-pipdata-authority; HEAD/base84442e979c98d33fa5565ab9e56d3179cc7d5278.
Expected dirty candidate plus pre-existing lifecycle/review artifacts, no staging.
E runtime/tmp and output ancestors exist and no reparse ancestry observed.
System Git config has LFS filters and astextplain textconv; candidate check-attr
returns empty, hooks samples only. All Git children get E temporary variables,
GIT_OPTIONAL_LOCKS=0 and fsmonitor-disabled read configuration; no filter/hook
execution, staging, reset, unstage or branch operation performed.

Standard tracking repair and native selector pending. Earlier verification
review-verify.md preserved. New verify-review.md absent; resolved exact path
checkpointed in handoff.writeSet before writing. Full binding/results and
attributed critic outputs will be saved here, not only external links.

## Checkpoint 2: Tracking, Native Selection And Binding

Capture2026-10-28T13:03:33.7114874Z. Standard report repaired only in frontmatter
and appended tracking crosswalk. Original body descriptions, attribution,
priorities and chronology retained. Original SHA256:
ADBD8D67571F9A2F0386B6515F159A4BD985DC2649CB632B7AEEC4E42FEF54F1.
Earlier verification remains byte-identical:
DF8AE57CA11D9A8F4C5F1EE0C4FD499E60DD266466DE9D219A4F37804A5A4638.
Index unchanged:9DC7DDAE9DC775D877D83DA85F37AE5E24E4B1F647AA7B95EC280274AB543D5B.
Completed Plan raw Git blob still3bf331d75ef536afd27095a4a5aea2aea243dcc1.

### Actual Selector

Executed the installed cg-review Step1.7 rule, not a direct hardcoded bypass:
scan *-review.md excluding -verify-review.md; require a findings map with fixed
entry; sort date descending (missing oldest), then filename descending. Selected
`.cg-docs/reviews/2026-10-27-m2-pipdata-authority-review.md`, date2026-10-27,
from18 eligible reports. All17 fixed canonical entries recognized: P0.1-P0.2,
P1.1-P1.3, P2.1-P2.12. Crosswalk maps them to original A1-A17. No open/skipped
entries. Fallback=false; depth=light; exactly cg-code-quality and cg-testing.
Verify output path absent and reserved before writing:
`.cg-docs/reviews/2026-10-27-m2-pipdata-authority-verify-review.md`.

Selector is the installed prompt's algorithm, implemented with read-only
PowerShell frontmatter inspection; no native selector CLI is specified by the
installed command. Initial inline Python helper had quoting/missing-yaml errors,
so it never selected or dispatched; no package installed. First PowerShell parse
omitted the final map entry at EOF; corrected newline handling recognized all17
before any dispatch. These are helper errors, not a broad-review fallback.

### Current Candidate To Saved Tested Content

Read and hashed all182 rows in S/evidence/phase2-before-gate.json against BOTH
current W files and S/source/phase2/pipdata. Zero missing or mismatched files.
Manifest SHA256:0A8A19B2B8C2390EEF5B97D91039B46ED32A37859FF87B8AAC1D548550166B68.
Comparison uses raw bytes, not Git's CRLF-normalized comparison. Self-contained
changed-file SHA256 table (all eight runtime-manifest rows match):

| Current W path | SHA256 | Historical runtime binding |
|---|---|---|
| R/code_fingerprint.R | B022FA2403BA5A880658EEB27FFD264D1931809C3D22E9D48F30246D4395E1C4 | match |
| R/dependency_plan.R | 4E32A3FD79D06F9B03774D8B636BB473ADBB035239EC2A76B051AB03EC15C5E6 | match |
| R/dependency_execution.R | 5823C73037367AC212C975AC720FC14BB23DFB1023EB8A44862E50E3A56E38C1 | match |
| R/pd_run_pipeline.R | 70FFFAD92EA70D9BE372DFB5776B1EA742BDA043898AA7370375B7DADF614BCF | match |
| tests/testthat/test-code-fingerprint.R | D95DB5AC4151DF8044D4056EC664D9002FC2C9B20845ACB374AF1C9CAD844E58 | match |
| tests/testthat/test-dependency-api-contract.R | B10FDC982DBABE03290629AF269B8CFBED3B1AEED20112624413CB326F999BBE | match |
| tests/testthat/test-m2-engine-authority.R | 5C5274686B6D778A4481554AC3BD61818A61E0CF419C6032878FF5F4A26F1318 | match |
| man/pd_run_pipeline.Rd | 40F7331C71BBECBC073506BF565BCE83BFE19C58C7417711CA9404D2B040B8DD | match |
| vignettes/articles/PIP-data-pipeline.Rmd | A74B8FC049384E7D61348CFA29BACB454A4A9E41C48838036C0BBD8EBFA9F777 | NOT in runtime source manifest; documentation review only |

Installed pipdata:30 files match retained phase2-pipdata-installed.json, manifest
SHA256 D0DD65329AC127FCBC5F3B8577A8AE982BCAD15CD7BA2C6F791722D489E8129F.
Built pipdata_1.0.0.tar.gz actual SHA256 equals recorded
93137883660F3846707CA6611B9953BDDFDA13FC0FAD6E32E3409A12434B68FE.
No current-HEAD test-equivalence claim: tested content is uncommitted manifest
content, not HEAD84442e9. No R process invoked in this repair task.

### Producer Bindings

| Producer | Fixed identity | Current checked files | Result |
|---|---|---|---|
| stamp | content5d1ddebdc926dad9c6ec99c08a65e74baee0da92 |100 source,100 blob bindings,21 installed |0 raw mismatches; pinnedBlob=normalizedBlob all100 |
| pipload | commit4ef0d90a974cb6ff0725da69373bde421dd04ad5 |87 source,87 blob bindings,31 installed |0 raw mismatches; pinnedBlob=normalizedBlob all87 |

Stamp source manifest6F98220D786648BF859C20F5B3DE036D9BF1B9E5DCADD61A5E0C23BEC9F59FEF;
installed manifestF55A3F251369E090F4A3CF61F7A845283759C6E7223BAF29657DA5C7D90BEFCC;
archive actual=recorded46971271A73C83DE1E08D69E345037829333E2152E77BF9F46466B78DFD95879.
Pipload source manifest5F350F7010431DEF6FA2CD0AFC7F61B86F944C741B4AC0FFB7D8397FB60A456C;
installed manifestB18B8D805D8C365913BDEAA9A4788F00F3E5297C2DB7746CBBE48738486640C0;
archive actual=recorded964B37729782851A60CB7756A86A75F9CA4CC97A5CC329F72FF9DF332FD6276B.
All from S/evidence and S/source, S/library/phase2, S/build; global producer
installations are not substitutes. This verifies preserved pin-bound exports,
not arbitrary upstream checkout HEAD or a new dependency execution.

One discarded hash helper collided with PowerShell's H alias; another wrapped
JSON arrays instead of enumerating rows. Their invalid outputs are NOT binding
results. Corrected fail-fast, explicitly named hash function and direct array
deserialization produced the checks above without changing inputs/runtime.

### Saved Native Results, Not Newly Executed Tests

- gate-phase2-20261027T2136114632065Z-native.json: start2026-10-27T21:36:11.5903911Z,
  finish21:37:16.5517625Z, exit0, timedOut=false, limit600000ms. Saved stdout reports
  41tests286expectations; runner checks zero failures/errors/warnings/skips.
- build-pipdata-phase2-20261027T2137167145213Z-native.json: saved build exit0.
- install-pipdata-phase2-20261027T2137185099372Z-native.json: saved install exit0.
- installed-phase2-20261027T2137270168486Z-native.json: start21:37:27.0438430Z,
  finish21:37:31.8625169Z, exit0, timedOut=false, limit600000ms. Saved installed
  engine built/skipped/empty and rds/qs2/fst exact receipt/data/metadata smoke.
- Both fresh processes used Rscript4.5.2 with recorded executable SHA256
  66921700DC477930627FC09CF2E734AD9E4A9D55D2C39F8C95CEC6E24FF40D6D.

This session reads and rebinds saved records; it does not rerun these processes,
attest mutable historical logs independently or certify the complete current
transitive/global environment. Article execution/rendering remains unverified.

### E5 Exclusions (41 Existing Files)

```text
test-adjust-population.R
test-build_pip_inventory.R
test-dependency-bootstrap.R
test-dependency-contract.R
test-dependency-execution.R
test-dependency-inputs.R
test-dependency-manifest.R
test-dependency-performance.R
test-dependency-plan.R
test-dlw_store_release.R
test-dlw_validation_engine.R
test-dlw_validation_spec.R
test-dlw-unified-logging.R
test-get-aux-hashes.R
test-get-country-pfw.R
test-log_report.R
test-logging-integration.R
test-pd_dlw_clean.R
test-pd_dlw_gd_clean.R
test-pd_process_data.R
test-pd-change-report.R
test-pd-deflate-pipeline.R
test-pd-deflation.R
test-pd-env.R
test-pd-metadata-refresh.R
test-pd-run-pipeline.R
test-pipdata_dlw_compare.R
test-pipdata_dlw_process.R
test-pipdata_get_gmd.R
test-pipdata_validate_gmd.R
test-pipdata_validation_report.R
test-pipeline-context.R
test-pipeline-run-result.R
test-pipeline-stage-result.R
test-recode-spec.R
test-reconcile-pip-inventory.R
test-release_mgmt.R
test-save_pip.R
test-utils.R
test-valid_aux_load.R
test-valid_dlw_load.R
```

No numerical/full legacy/inventory/C2-manifest/logging/acquisition/validation
regression certification; two historical disabled blocks are not coverage.
Full package check/examples/vignettes, producer full checks, production/SMB,
multiwriter/scale and umbrella T1-T12 remain excluded. The three selected files
are fingerprint, dependency-API-contract and M2-engine-authority only.

## Checkpoint 3: Genuine Verification Does Not Converge

Exactly two foreground read-only Tasks dispatched in parallel, no overrides:
cg-code-quality ses_e7d616f86ffeJ10SamErJxq1Rn and cg-testing
ses_e7d616f83ffe3M92YwNqyJueOg. Distinct assigned output paths were passed, with
reviewers prohibited from writing; outer caller saved both usable substantive
results in cg-code-quality.md and cg-testing.md. No helpers, package processes
or permissions expanded. No incomplete-review or fallback dispatch.

Suppression included all17 initial fixed IDs plus explicit function/block/A-ID
anchors: P0/P1 always reported, P2/P3 suppressed only within explicit fixed scope,
cross-file breakage always reported, uncertainty reported. No autofix in verify.

### Consolidated Findings And Attribution

| Canonical ID | Priority | Reviewer/local ID | Current evidence | Disposition |
|---|---|---|---|---|
| P0.2 / A2 | P0 | testing P0.2 | code_fingerprint.R:340 top-level-only guard accepts lengths(list(Date)); active nested length.Date not fingerprinted | prior partially unresolved; parent map reopened |
| P1.4 | P1 | quality P1.1 + testing P2.13 | dependency_execution.R:177-178 requires metadata_only after rebuild; DESCRIPTION:25 admits sibling pipload1.0.0 without argument at siblingR/pip_read-write.R:48-54 | merged highest severity, open |
| P2.14 | P2 | quality P2.1 (not prior A6) | code_fingerprint.R:274 requires codetools; DESCRIPTION:35-38 Suggests only | new cross-file dependency finding, open |

3 unique findings: P0:1/P1:1/P2:1/P3:0. Reviewer-local ID collisions explicitly
reconciled. No finding discarded; compatibility test-gap included in P1.4.
Other16 prior fixed entries retain historical saved correction state. Parent
status/map now open for P0.2, retaining historical fixed descriptions unchanged.
New canonical verification type/parent-review/depth/findings schema saved at
the pre-resolved verify-review.md; earlier review-verify.md untouched.

Outer caller independently read current source around each concrete reference
and the sibling pipload version/signature. Findings are static, not newly run
reproductions. Current successful exact-pin historical evidence does not refute
them or establish merge readiness. No source/test/dependency edits authorized.

### Required Next Action (Not Executed)

Existing Code session can continue only under separate source-correction scope:
close/reject nested recursive dispatch with deterministic registered-method
mutation/cleanup regression; reject incompatible consumed producer capabilities
before lease/planning/publication and assert actual API contracts including the
negative path; decide runtime codetools dependency versus actionable optional
feature gate/documentation and verify absence behavior. Rebind/rerun affected
selected gates and genuine mode:verify afterward. No new Plan/worktree/session
is required by this report. Do not treat a minimum1.0.0 bump as adapter capability.

### Final Preservation Checks

Capture2026-10-28T13:16:17.6507166Z:182 current source rows rehashed,0 mismatches.
Original standard report reconstructed in memory from preserved original body
and original frontmatter: SHA256 exactly
ADBD8D67571F9A2F0386B6515F159A4BD985DC2649CB632B7AEEC4E42FEF54F1.
This proves description/attribution/history preservation, not a new backup write.
Current tracking-repaired standard SHA256:
8D0BA2FDBA6CAAE47A5BDA5B7FBC9B2AF182D931BED4C1C9D6FB3255DAAB6473.
Earlier verification unchangedDF8AE57CA11D9A8F4C5F1EE0C4FD499E60DD266466DE9D219A4F37804A5A4638;
index unchanged9DC7DDAE9DC775D877D83DA85F37AE5E24E4B1F647AA7B95EC280274AB543D5B;
article unchangedA74B8FC049384E7D61348CFA29BACB454A4A9E41C48838036C0BBD8EBFA9F777.
No source, tests, package docs, Plan, active state, runtime or unrelated index
content changed; no branch, stage, commit, merge, push or permission operation.

### Saved-Output Readback And Envelope Validation

Read saved handoff lines1-142, evidence lines1-228, code-quality output1-77,
testing output1-84 and canonical verification1-160. Substantive findings,
selection/dispatch, bindings, historical result limits and NOT CONVERGED verdict
agree. Attributed reviewer roles stayed read-only; outer saved all four outputs.

2026-10-28T13:20:57.9277711Z: parsed saved fenced JSON with ConvertFrom-Json,
confirmed schemaVersion pip-handoff-v1, checkpoint3, all10 required headings,
all6 authorized files present, expected HEAD recorded, verdict NOT CONVERGED.
Preserved earlier verify/index SHA256 still match initial values. Final Git
status with E temp redirects confirms expected branch and original dirty paths
plus only the new canonical verify-review.md; no staged paths. No source or
runtime work performed after review. Reporting task complete; source findings
remain open for separately authorized correction. No readiness approval issued.
