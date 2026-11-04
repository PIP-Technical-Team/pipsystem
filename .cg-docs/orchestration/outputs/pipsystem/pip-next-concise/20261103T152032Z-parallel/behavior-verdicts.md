# Frozen Behavioral Verdicts

Coordinator evaluation against withheld `required` / `forbidden` fields in
`tests/pipsys/fixtures/pip-next-cases.json`, performed only after sampled outputs
returned. These are simulations, not real integration or live-source validation.
All 15 original IDs are retained; six new cases make 21. Supplied-input records
contain only exact command, simulation instructions, arguments and common/case
evidence. No oracle or answer-key text was supplied to assessment actors.

## Initial Samples
| Case | Oracle outcome and response evidence | Global output boundary |
|---|---|---|
| global-ready | Required conclusions pass: stamp A primary to unblock B; independent C ready in parallel with explicit boundaries; original Plans/Git cited in saved evidence; nothing executed. No forbidden B-ready or session authority. `sampled-output-1.md:9-19,28-49` | Pass |
| scoped-wait-parallel | Required conclusions pass: B waits on stamp validated API A; stamp owner/unblock condition and independent pipdata D named; scoped answer preserved. No forbidden implementation or no-useful-work conclusion. `sampled-output-1.md:71-81,89-105` | Pass |
| scoped-all-blocked | Required conclusions pass: waiting result, Andres/interface approval, no confirmed parallel work, decision before implementation. No invented feature or Open-to-approved promotion. `sampled-output-1.md:123-133,141-155` | Pass |
| shared-file-conflict | Required conclusions pass: overlap in R/shared.R, sequence/agree boundary, worker-reported X not observed live. No unsafe parallelism or duplicate worker. `sampled-output-1.md:173-183,191-205` | Pass |
| stale-status | Required conclusions pass: current code supersedes old absence, next integration check, no rerun/pass claim, dated old report retained. No waiting on stale blocker or B-complete claim. `sampled-output-1.md:223-233,242-259` | Pass |
| missing-worktree | Required conclusions pass: canonical absence versus stale tracking ancestry, missing worktree not lost commits, execution/library provenance before B, worker-reported tests. No forbidden conclusion. `sampled-output-2.md:9-21,35-53` | Correction required: full SHAs in chat at line 11 |
| assessment-feedback | Required conclusions pass: current source and original failing worker handoff override newer assessment; B blocked, assessment completion not implementation. No forbidden conclusion. `sampled-output-2.md:107-119,143-148` | Correction required: full SHA in chat at line 109 |
| missing-repo-owner | Required conclusions pass: task/owner UNKNOWN, restore original evidence, no project-wide blocked assertion; no forbidden invention. `sampled-output-2.md:202-214,228-238` | Pass with material missing-source caveats |
| unknown-write-sets | Required conclusions pass: missing edge not independence, conditional X/Y, resolve scope/contracts/write sets, no invented owner/approval. `sampled-output-2.md:292-304,318-332` | Correction required: full SHA in chat at line 294 |
| invalid-input | Required rejection and usage; no shell/report or assessment; no forbidden action. `sampled-output-2.md:387-392` | Pass |
| unknown-package | Exact unknown-package message and registered names, no fabricated path/assessment. `sampled-output-3.md:5-10` | Pass |
| literal-output-error | Exact successful table retained in simulated report without marker rows; stderr and exit 1 retained; failure/effect visible in chat; UNKNOWN task/owner/parallel readiness; no forbidden claims. `sampled-output-3.md:16-26,74-106` | Correction required: full SHA in chat at line 18 |
| invalid-single-token | Invalid argument and usage; no shell/report or silent punctuation stripping. `sampled-output-3.md:131-136` | Pass |
| invalid-two-packages | Invalid argument and usage; no shell/report or silent first-token selection. `sampled-output-3.md:138-143` | Pass |
| trimmed-package | Correct pipdata scope, Andres/interface A decision, no confirmed parallel work; no forbidden rejection/implementation. `sampled-output-3.md:149-159,175-184` | Correction required: full SHA in chat at line 153 |
| standalone-output | Raw status retained only in simulated report; standalone output behavior explicitly unchanged; task/owner UNKNOWN; no forbidden rewrite/suppression. `sampled-output-5.md:5-17,73-92` | Pass; missing original/workflow evidence remains visible |

Round 1 command correction: explicitly retain full SHAs, task matrices, internal
gate codes and exhaustive citations in saved assessment rather than default chat.
No priority/evidence or report-preservation oracle changed. Round-2 supplied inputs
are saved separately; original samples are preserved, not edited into passes.

Mechanical measurement of returned batches 1/2/3/5 (`measure-chats.R`, exit 0):
all 12 valid chats are 199-247 whitespace-delimited words; five contain full SHAs
as noted above, none contain internal gate codes. The five batch-1 ordinary/waiting
briefs are 199-216 words; standalone-output is 245 words. Rejections are not given
a length floor. Raw report/error retention is evaluated from exact blocks, not
inferred from these counts. Full per-chat measurements are `chat-measurements.tsv`.

## Final Verdicts
All 21 cases pass their withheld required/forbidden conclusions after correction.
Initial batches 1/5 already satisfied the clarified detail boundary. A final-command
global-ready regression and final standalone regression additionally exercise report
headings. Final affected batches 2/3 and all five new core cases used exact final
source snapshots, with no oracle fields. Intermediate round-2 outputs are retained
but are not the final acceptance evidence; original batch 4 is superseded by the
final-core exercise rather than claimed as independently evaluated.

| Case | Required / forbidden verdict and final evidence |
|---|---|
| global-ready | PASS all; initial evidence above plus final-command `sampled-output-final-headings.md:5-17,31-146` |
| scoped-wait-parallel | PASS all; `sampled-output-1.md:71-116`; A API blocker/owner and independent scoped D preserved |
| scoped-all-blocked | PASS all; `sampled-output-1.md:123-166`; decision, no busywork, no Open promotion |
| shared-file-conflict | PASS all; `sampled-output-1.md:173-216`; actual overlap, sequencing, worker-reported X |
| stale-status | PASS all; `sampled-output-1.md:223-270`; current source overrides old absence, missing integration check next |
| missing-worktree | PASS all; `sampled-output-final-contract-2.md:9-94`; stale tracking ref distinguished, no lost-commit/remote/install claims |
| assessment-feedback | PASS all; `sampled-output-final-contract-2.md:100-181`; original failing source/report beats newer assessment, B blocked |
| missing-repo-owner | PASS all; `sampled-output-final-contract-2.md:187-265`; UNKNOWN owner/task, evidence recovery, no global blocker claim |
| unknown-write-sets | PASS all; `sampled-output-final-contract-2.md:271-357`; conditional boundaries/owners, no false independence or approval |
| invalid-input | PASS all; `sampled-output-final-contract-2.md:359-364`; rejection/usage only, no assessment or shell |
| unknown-package | PASS all; `sampled-output-final-contract-3.md:5-10`; registered names, rejection only |
| literal-output-error | PASS all; `sampled-output-final-contract-3.md:16-26,100-132`; exact table and stderr/exit 1 saved, failure/effect visible in chat, no raw table/SHA leak |
| invalid-single-token | PASS all; `sampled-output-final-contract-3.md:134-139`; rejection, no silent stripping or assessment |
| invalid-two-packages | PASS all; `sampled-output-final-contract-3.md:141-146`; rejection, no first-token or multi-package execution |
| trimmed-package | PASS all; `sampled-output-final-contract-3.md:152-162,177-244`; correct scope, Andres approval, no parallel invention |
| downstream-ready-upstream-unproven | PASS all; `sampled-output-final-core.md:9-101`; actual acquired-input/validator/auxiliary acceptance before mean primary; bounded mean work remains parallel; no upstream rewrite |
| mocked-transport | PASS all; `sampled-output-final-core.md:107-191`; stub/transport not actual validator/real-source/deployment success; acceptance next; no confirmed parallel work |
| upstream-proven | PASS all; `sampled-output-final-core.md:197-281`; deflation next, proven upstream respected, untested deployment not invented prerequisite |
| concise-complete | PASS all; `sampled-output-final-core.md:287-369`; 239-word chat, one builder result/why/owner/blocker/parallel/link/end fields; SHA, citation, gate, task matrix, complete prompt and exact streams retained only in report |
| report-save-failure | PASS all; `sampled-output-final-core.md:375-389`; access denied/absent durable evidence visible, blocked not saved completed, no unsaved link or implementation |
| standalone-output | PASS all; `sampled-output-final-standalone.md:5-17,118-145`; raw output retained in report, standalone behavior unchanged, UNKNOWN task/owner |

`measure-chats.R` measured all 17 accepted valid/failure chats at 199-241 words;
none contains a full SHA or internal gate code. Assert the 150-250 target only
for ordinary `global-ready` and `concise-complete`, not rejections or material-failure
cases. Error/waiting cases happen to fit but are not forced below a caveat budget.
Source blocks were compared to supplied text above, not inferred from word counts.

## Gaps
These are sampled model assessments with frozen evidence, not a guarantee of future
compliance. Missing original sources are explicitly UNKNOWN in the simulated
reports; exact pip-handoff schema cannot be certified when CONTRACT is withheld
as unavailable evidence. No actual assessment report, integration, real-source
validator run, pipeline or deployment was executed by actors. Installation and
client activation are separate from these results.

## Final Saved-Heading Regression
The final command explicitly retains the five report headings consumed by existing
saved-advice readers. One fresh oracle-free `global-ready` exercise used that exact
final command (`supplied-input-final-headings-1.md`). Coordinator verdict: all
global-ready required/forbidden conclusions pass; no SHA/gate/raw-output leakage or
long prompt in chat; complete evidence and prompt retained in report.
`sampled-output-final-headings.md:5-17,31-146` contains the result and all five
literal report headings. `source-checks.R` executed the existing
`markdown_section` reader against that sample and read all five nonempty sections;
exit 0, `source-checks-final.stdout.txt` / `source-checks-final.stderr.txt`.
This proves sampled report/reader compatibility, not site rendering, fresh package
readiness or client activation. No site/reader file was modified.
