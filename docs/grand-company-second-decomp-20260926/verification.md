# Independent bytecode replay and journal transport audit

The second pass reproduces the first pass's **713 non-initializer methods and 1,495 bounded path templates with zero differences**. It uses a separately implemented concrete Lua 5.1 executor, independent root-method binding recovery and independent control-flow reachability checks. The shared component is the binary chunk reader and opcode names, not the first pass's tracer, comparison semantics, solver or control-flow implementation.

The core remains **102 Grand Company classes**, including **43 empty native classes**. The separately audited **Noc001** supply/provisioning service is adjacent content and is not added to that core count. This is recovery and offline verification only: gameplay scripts, SQL, live databases and placements were not changed.

| Coverage | Core | Noc001 | Total |
| --- | ---: | ---: | ---: |
| Non-initializer methods | 695 | 18 | 713 |
| First-pass path templates concretely replayed | 1,356 | 139 | 1,495 |
| Additional type/boundary executions | 9,461 | 1,128 | 10,589 |
| Third-visit loop continuation probes | 104 | 60 | 164 |
| Reachable instruction sites exercised | 30,830 | 476 | 31,306 |
| Conditional branch edges exercised | 876 | 78 | 954 |
| Methods with differences or blockers | 0 | 0 | 0 |

The [summary](../../outputs/grand-company-second-decomp-20260926/verification/summary.json), [method index](../../outputs/grand-company-second-decomp-20260926/verification/method-index.json) and [empty failure list](../../outputs/grand-company-second-decomp-20260926/verification/failures.json) record the results. Each per-code file below includes witnesses, parameters, instruction execution order, concrete ordered calls, call return values, branch operands/results/next PCs, exact method returns and loop register snapshots.

## What is independently checked

The executor derives instructions and operands directly from each pinned binary. It reconstructs the root's class-method assignments and compares the complete registration order and method set with the first pass. It then constructs concrete values satisfying each supplied path's conditions, executes only the bytecode and those values, and compares the resulting trace. Expected conditions do not direct execution. API return slots remain distinct by call-site PC, occurrence and result ordinal.

Lua scalar behavior matters here: false is not numeric zero; true is not numeric one; zero and the empty string are truthy; nil and a missing return are distinct from a zero-length return list. `type()` is computed from the actual value, so a path cannot independently choose a type string inconsistent with its underlying input. The comparison and instruction behavior follows the official [Lua 5.1 VM](https://www.lua.org/source/5.1/lvm.c.html) and [opcode definitions](https://www.lua.org/source/5.1/lopcodes.h.html).

Additional probes vary each constrained input through the admissible type and boundary representatives one at a time. Comparisons in this scope are unary symbolic-to-literal relations; unsupported relations between two independent symbols fail closed. The independent raw control-flow graph confirms that every structurally reachable instruction and both outcomes of every reachable conditional branch have execution evidence. Structural dead tails remain explicitly listed. There are no first-pass constant-infeasible branch exclusions in this scope; the verifier rejects any future such claim until it has an independent proof.

The thirteen method opcodes actually encountered are MOVE, LOADK, LOADNIL, LOADBOOL, GETGLOBAL, SELF, CALL, JMP, EQ, LT, LE, TEST and RETURN. Unexpected opcodes and variable-arity calls/returns fail closed in this core executor. The separate narrow journal callsite checker handles its explicit VARARG blocks; it does not expand the core executor's claim to all native UI code.

## Useful concrete cases

- **Com0l1 acceptance:** `processEventGUINCUMStart` calls `showQuestInfomation` at PC 51 / offset `0x358`, compares the result with numeric 1 at PC 52, runs the corresponding dialogue arm, and returns that original result at PC 73 / `0x3B0`. Boolean true does not substitute for acceptance code 1.
- **Gcl107 Stewart menu:** direct menu values 1, 3 and -3 clear the loop condition and return that selection; option 2 repeats. The loop condition is the native TEST at PC 26 / `0x3A52`. A second iteration can already have chosen an exit while the bounded trace stops immediately before the third visit to that TEST; a terminal labelled `loop` therefore means a suspended prefix, not proof of an endless loop. The third-visit probe records the subsequent exit or continuation.
- **Gcl107 text substitutions:** all 105 first-pass helper-composition cases independently execute `getTextIdStewart`. Exactly nine inputs remap when the flag is literal boolean true: 164→321, 165→322, 169→326, 170→327, 171→328, 172→329, 175→330, 178→332 and 179→333. False, nil and other typed representatives do not acquire that literal-true branch. See [helper evidence](../../outputs/grand-company-second-decomp-20260926/verification/helper-composition.json).
- **Noc001 supply results:** `pItem` replaces a nil native widget result with numeric 1 but preserves an actual false result. Its four witnessed paths cover both argument-selected call sites and both nil/non-nil results. Collapsing false and nil would silently change its return contract.

The 20 semantic/mutation regressions include wrong branch destinations, dropped explicit nil arguments, erased nil returns, SELF register overlap, independent result slots, type/value correlation and the bounded loop continuation. These test the verifier's ability to reject an incorrect trace, not merely its ability to reproduce current output.

## Journal packet and native UI argument contract

The independent [journal transport artifact](../../outputs/grand-company-second-decomp-20260926/verification/journal-transport.json) retains exact raw instruction words, byte offsets and decoded operands, plus line-numbered server excerpts and source hashes. A narrow straight-line operand interpreter checks the argument order at each native callsite; the whole UI method is not executed.

| Stage | Source evidence | Preserved argument contract |
| --- | --- | --- |
| Quest request | `RequestQuestJournalCommand.lua:69–81,122–145` | `requestedData`, `qtdata`, quest ID, current sequence, then every journal-info value |
| Quest getters | `Quest.cs:136–139,259–266` | Current sequence is returned directly; callback values retain their order |
| Generic serialization | `Player.cs:10388–10396`, `GenericDataPacket.cs:30–48`, `LuaUtils.cs:177–237,257–276,303–345` | Parameter-list construction and wire serialization preserve that order; these methods contain no qtdata-specific rewrite |
| Native desktop classification | `desktopwidget_connector.luac`, `processRecievedRequestedDataForWidget`, PC 2–7 | `qtdata` selects fixed type 1 |
| Native desktop forwarding | Same method, PC 88–92 / `0x1239b–0x123ab` | `processUpdateJournalDetailWidget(1, questID, ...)` |
| Widget forwarding | Same binary, `processUpdateJournalDetailWidget`, PC 7–9 / `0x18a49–0x18a51` | `JournalDetailWidget:setDetailData(...)`, excluding the two fixed parameters |
| Current text | `journaldetailwidget.luac`, `setDetailData`, PC 470–482 / `0x2756–0x2786` | `setText(NowCondition, 5004, work.journalID, A1, A2, A3, A4, A5, A6, A7)` |
| Held items | Same method, PC 487–499 / `0x279a–0x27ca` | Text 4001 with the same stored quest ID and seven arguments |
| History | Same method, PC 500–512 / `0x27ce–0x27fe` | Text 5005 with the same stored quest ID and seven arguments |

The command chooses an existing Quest before its separate local/regional guildleve fallbacks. There is no GC-specific alternative dispatch in this request path. The widget's preceding nil defaults replace missing A1–A6 with zero and missing A7 with a space; they do not remap a present sequence value or convert journal text-row numbers into state indices. The fixed quest ID is available through widget state; it is not prepended to the `setDetailData` varargs.

The macro pass's [UI-to-quest bridge artifact](../../outputs/grand-company-second-decomp-20260926/journals/ui-bridges.json) closes the next boundary directly from the sheet expressions. English ui5004 selects quest column 14 using UI argument 1 as the quest row, then forwards UI arguments 2–7 and string argument 8. The widget's A1 therefore becomes quest-expression `$E8(1)`, A2 becomes `$E8(2)`, and so on. The ui4001 and ui5005 bridges preserve the same argument order for held items and history. Their four-locale expressions and the separate completed-text bridge are retained with exact CSV locations.

For **Com0l1**, the current server actually sends these argument pairs:

| Authored server sequence / native A1 | Returned journal info / native A2 |
| ---: | ---: |
| 0 | 229 |
| 10 | 230 |
| 20 | 231 |
| 30 | 231 |
| 40 | 232 |
| 50 | 233 |

The separate [journal macro pass](journals.md) preserves the native ui5004 forwarding expression and the [Com0l1 syntax tree](../../outputs/grand-company-second-decomp-20260926/journals/quests/com0l1.json): current selectors are 0, 1, 2 and 3, with a nested argument-3 condition at selector 2; held-item text separately inspects argument 2. This is a concrete source-contract mismatch with the server's 10/20/30/40/50 progression and row IDs used as extra arguments. Under the repository's established equality interpretation of E4, nonzero server stages do not select those current branches. We have not recovered the native text evaluator's machine code or observed the resulting live UI; visible rendering failure and the correct replacement state/counter mapping remain unverified. The evidence does not justify blindly dividing every sequence by ten: later quests have intentionally sparse selectors, and current/history/held-item predicates differ.

## Independent reward operand cross-check

A small [raw reward cross-check](../../outputs/grand-company-second-decomp-20260926/verification/reward-formula-crosscheck.json) independently confirms the arithmetic order recovered by the [reward pass](rewards.md). `calcSkillPoint` divides its percentage argument by 100 at PC 0 / `0x17b6`, gets the level maximum, multiplies that maximum by the divided percentage at PC 6 / `0x17ce`, then calls `_math.ceil`. The four double-precision probes with supplied maxima 22000, 27000, 71000 and 89000 at 7% yield 1541, 1891, 4971 and 6231. Rearranging to integer multiplication/division loses the floating-point rounding before ceil.

The detail widget's -13 branch calls `calcSkillPoint` at PC 168 / `0x16c2` and displays the result using text 5054. The completion reward widget's -13 branch instead passes its supplied parameter R2 to text 5052 at PC 240 / `0xd8c`; that method has no `calcSkillPoint` binding. This independently corroborates the preview-versus-supplied-completion distinction. The full reward interpreter, level lookup, row counts and archive comparisons belong to the separate reward pass.

## Reproduction and limits

Run from the repository root:

```powershell
python -B tools/test_gc_second_verification.py
python -B tools/build_gc_second_verification.py
python -B tools/build_gc_second_verification.py --check
```

The build pins every native source chunk, first-pass input dossier, helper-composition input, verifier/test source and additional transport source with SHA-256. Its artifact manifest protects all emitted JSON files. `--check` is a nonwriting hash/status verification; rebuilding performs the executions again.

The path templates originate in the first pass. This pass independently verifies each supplied template and raw instruction/branch coverage; it does not independently enumerate every arbitrary-length path. Two instruction visits bound differential prefixes, and three visits test their explicit continuation. Native APIs are recorded mock boundaries with explicit result witnesses, not implementations of game behavior. Unconstrained inputs default to nil for the base witness. Type/boundary probes do not prove legal runtime ranges or enumerate every combination of unrelated inputs. Empty classes are verified registration results, not evidence that their retail content was intentionally absent. InitText data is outside this execution scope and remains in the first-pass decompilation.

No actual server delivery, client rendering, client API internals, server-granted rewards, live DB state or retail availability is established by these checks. The [runtime and gaps report](../grand-company-deep-decomp-20260926/runtime-and-gaps.md) retains implementation/availability findings independently of native bytecode completeness.

## Every class and its replay evidence

The dossier links lead to readable first-pass reconstructions; replay links contain the new independent concrete evidence. Zero-method rows are retained explicitly so placeholder native classes do not disappear from the scope.

| Code | Quest ID | Methods | Replay | Reconstructed dossier |
| --- | ---: | ---: | --- | --- |
| noc001 (adjacent) | 110817 | 18 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/noc001.json) | [noc001](../../outputs/grand-company-deep-decomp-20260926/reconstructed/noc001.md) |
| com0l1 | 111401 | 9 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l1.json) | [com0l1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l1.md) |
| com0l2 | 111402 | 2 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l2.json) | [com0l2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l2.md) |
| com0l3 | 111403 | 1 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l3.json) | [com0l3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l3.md) |
| com0l4 | 111404 | 10 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l4.json) | [com0l4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l4.md) |
| com0l5 | 111405 | 16 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l5.json) | [com0l5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l5.md) |
| com0l6 | 111406 | 19 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l6.json) | [com0l6](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l6.md) |
| com0l7 | 111407 | 2 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l7.json) | [com0l7](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l7.md) |
| com0l8 | 111408 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l8.json) | [com0l8](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l8.md) |
| com0l9 | 111409 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0l9.json) | [com0l9](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0l9.md) |
| com5l0 | 111410 | 14 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5l0.json) | [com5l0](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l0.md) |
| com5l1 | 111411 | 10 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5l1.json) | [com5l1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l1.md) |
| com5l2 | 111412 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5l2.json) | [com5l2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l2.md) |
| com5l3 | 111413 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5l3.json) | [com5l3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l3.md) |
| com5l4 | 111414 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5l4.json) | [com5l4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l4.md) |
| com5l5 | 111415 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5l5.json) | [com5l5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5l5.md) |
| gcl101 | 111416 | 26 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl101.json) | [gcl101](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl101.md) |
| gcl301 | 111417 | 3 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl301.json) | [gcl301](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl301.md) |
| gcl302 | 111418 | 7 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl302.json) | [gcl302](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl302.md) |
| gcl303 | 111419 | 4 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl303.json) | [gcl303](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl303.md) |
| gcl304 | 111420 | 8 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl304.json) | [gcl304](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl304.md) |
| gcl501 | 111421 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl501.json) | [gcl501](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl501.md) |
| gcl502 | 111422 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl502.json) | [gcl502](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl502.md) |
| gcl601 | 111423 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl601.json) | [gcl601](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl601.md) |
| gcl602 | 111424 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl602.json) | [gcl602](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl602.md) |
| gcl603 | 111425 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl603.json) | [gcl603](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl603.md) |
| gcl305 | 111426 | 7 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl305.json) | [gcl305](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl305.md) |
| gcl102 | 111427 | 21 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl102.json) | [gcl102](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl102.md) |
| gcl701 | 111428 | 12 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl701.json) | [gcl701](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl701.md) |
| gcl103 | 111429 | 8 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl103.json) | [gcl103](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl103.md) |
| gcl104 | 111430 | 38 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl104.json) | [gcl104](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl104.md) |
| gcl105 | 111431 | 75 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl105.json) | [gcl105](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl105.md) |
| gcl106 | 111432 | 32 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl106.json) | [gcl106](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl106.md) |
| gcl107 | 111433 | 33 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl107.json) | [gcl107](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl107.md) |
| gcl702 | 111434 | 6 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcl702.json) | [gcl702](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl702.md) |
| com0g1 | 111601 | 9 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g1.json) | [com0g1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g1.md) |
| com0g2 | 111602 | 2 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g2.json) | [com0g2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g2.md) |
| com0g3 | 111603 | 1 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g3.json) | [com0g3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g3.md) |
| com0g4 | 111604 | 7 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g4.json) | [com0g4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g4.md) |
| com0g5 | 111605 | 14 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g5.json) | [com0g5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g5.md) |
| com0g6 | 111606 | 19 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g6.json) | [com0g6](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g6.md) |
| com0g7 | 111607 | 2 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g7.json) | [com0g7](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g7.md) |
| com0g8 | 111608 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g8.json) | [com0g8](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g8.md) |
| com0g9 | 111609 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0g9.json) | [com0g9](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0g9.md) |
| com5g0 | 111610 | 14 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5g0.json) | [com5g0](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g0.md) |
| com5g1 | 111611 | 13 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5g1.json) | [com5g1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g1.md) |
| com5g2 | 111612 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5g2.json) | [com5g2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g2.md) |
| com5g3 | 111613 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5g3.json) | [com5g3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g3.md) |
| com5g4 | 111614 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5g4.json) | [com5g4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g4.md) |
| com5g5 | 111615 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5g5.json) | [com5g5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5g5.md) |
| gcg101 | 111616 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg101.json) | [gcg101](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg101.md) |
| gcg301 | 111617 | 3 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg301.json) | [gcg301](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg301.md) |
| gcg302 | 111618 | 5 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg302.json) | [gcg302](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg302.md) |
| gcg303 | 111619 | 6 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg303.json) | [gcg303](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg303.md) |
| gcg304 | 111620 | 7 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg304.json) | [gcg304](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg304.md) |
| gcg501 | 111621 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg501.json) | [gcg501](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg501.md) |
| gcg502 | 111622 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg502.json) | [gcg502](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg502.md) |
| gcg601 | 111623 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg601.json) | [gcg601](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg601.md) |
| gcg602 | 111624 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg602.json) | [gcg602](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg602.md) |
| gcg603 | 111625 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg603.json) | [gcg603](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg603.md) |
| gcg305 | 111626 | 5 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg305.json) | [gcg305](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg305.md) |
| gcg102 | 111627 | 27 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg102.json) | [gcg102](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg102.md) |
| gcg701 | 111628 | 12 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg701.json) | [gcg701](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg701.md) |
| gcg103 | 111629 | 7 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg103.json) | [gcg103](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg103.md) |
| gcg104 | 111630 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg104.json) | [gcg104](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg104.md) |
| gcg105 | 111631 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg105.json) | [gcg105](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg105.md) |
| gcg106 | 111632 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg106.json) | [gcg106](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg106.md) |
| gcg107 | 111633 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg107.json) | [gcg107](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg107.md) |
| gcg702 | 111634 | 6 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcg702.json) | [gcg702](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcg702.md) |
| com0u1 | 111801 | 9 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u1.json) | [com0u1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u1.md) |
| com0u2 | 111802 | 2 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u2.json) | [com0u2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u2.md) |
| com0u3 | 111803 | 1 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u3.json) | [com0u3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u3.md) |
| com0u4 | 111804 | 11 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u4.json) | [com0u4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u4.md) |
| com0u5 | 111805 | 23 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u5.json) | [com0u5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u5.md) |
| com0u6 | 111806 | 22 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u6.json) | [com0u6](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u6.md) |
| com0u7 | 111807 | 2 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u7.json) | [com0u7](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u7.md) |
| com0u8 | 111808 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u8.json) | [com0u8](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u8.md) |
| com0u9 | 111809 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com0u9.json) | [com0u9](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com0u9.md) |
| com5u0 | 111810 | 13 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5u0.json) | [com5u0](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u0.md) |
| com5u1 | 111811 | 8 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5u1.json) | [com5u1](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u1.md) |
| com5u2 | 111812 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5u2.json) | [com5u2](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u2.md) |
| com5u3 | 111813 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5u3.json) | [com5u3](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u3.md) |
| com5u4 | 111814 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5u4.json) | [com5u4](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u4.md) |
| com5u5 | 111815 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/com5u5.json) | [com5u5](../../outputs/grand-company-deep-decomp-20260926/reconstructed/com5u5.md) |
| gcu101 | 111816 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu101.json) | [gcu101](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu101.md) |
| gcu301 | 111817 | 3 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu301.json) | [gcu301](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu301.md) |
| gcu302 | 111818 | 9 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu302.json) | [gcu302](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu302.md) |
| gcu303 | 111819 | 6 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu303.json) | [gcu303](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu303.md) |
| gcu304 | 111820 | 8 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu304.json) | [gcu304](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu304.md) |
| gcu501 | 111821 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu501.json) | [gcu501](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu501.md) |
| gcu502 | 111822 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu502.json) | [gcu502](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu502.md) |
| gcu601 | 111823 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu601.json) | [gcu601](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu601.md) |
| gcu602 | 111824 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu602.json) | [gcu602](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu602.md) |
| gcu603 | 111825 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu603.json) | [gcu603](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu603.md) |
| gcu305 | 111826 | 3 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu305.json) | [gcu305](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu305.md) |
| gcu102 | 111827 | 24 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu102.json) | [gcu102](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu102.md) |
| gcu701 | 111828 | 12 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu701.json) | [gcu701](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu701.md) |
| gcu103 | 111829 | 11 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu103.json) | [gcu103](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu103.md) |
| gcu104 | 111830 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu104.json) | [gcu104](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu104.md) |
| gcu105 | 111831 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu105.json) | [gcu105](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu105.md) |
| gcu106 | 111832 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu106.json) | [gcu106](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu106.md) |
| gcu107 | 111833 | 0 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu107.json) | [gcu107](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu107.md) |
| gcu702 | 111834 | 6 | [verified](../../outputs/grand-company-second-decomp-20260926/verification/quests/gcu702.json) | [gcu702](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcu702.md) |
