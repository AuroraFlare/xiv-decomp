# All Grand Company quests: deep client decompilation

This pass uses three helper agents and an independent bytecode recovery pipeline to cover **all 102 Grand Company identities: 69 named quests and 33 internal rows**. It also covers **Noc001 / Provisioning & Supply Missions** separately. Native quest categories, main SQL identities and the availability block independently reconcile to the same 102-row scope. The earlier detailed job/GC pass covered only 45 of those rows.

Start with the [complete quest index](../../outputs/grand-company-deep-decomp-20260926/QUEST_INDEX.md). Each quest has its own dossier containing progression metadata, journal text, reward evidence, current server references, every recovered non-init method, typed branch conditions, ordered calls and return values. Adjacent files preserve raw instructions, byte offsets, control-flow graphs, English dialogue rows and structured JSON.

## Coverage and evidence

| Layer | Recovered scope |
| --- | --- |
| Core quest identities | 102: 69 named and 33 internal |
| Core non-init methods | 695 methods / 31,063 instructions |
| Core branch paths | 1,356 bounded templates, including 104 loop continuations |
| Uncovered core branches / feasible instructions | 0 / 0 |
| Adjacent supply-service owner | Noc001: 18 methods / 139 path templates |
| Native journal references | 382 resolved references with source expressions |
| Explicit scene calls | 45 call records targeting 38 distinct resources |
| Native scene inventory | 56 decoded resources; 38 core-called and 18 without core callers |
| Native cinematic contents | 1,088 actor slots; 1,405 blocks; 28,559 typed clips |
| Scene-local position clips | 5,153, retained strictly as cinematic data |
| Supporting client Lua | 98 chunks; 658 local methods; 18,998 disassembled instructions |
| GC701 merit UI | 33 methods; 7,920 inert test cases; all 36 branch edges covered |

Coverage is measured within these recovered client chunks. It does not mean that opaque native APIs, the original retail server, unlimited menu-loop executions or the running game have been reconstructed. The 104 loop continuations explicitly preserve where repetition resumes. API outputs remain independent typed symbols, except for proven pure local helper and `type(value) == "nil"` relationships.

## Reading the findings

- [Scope, prerequisites, journals and rewards](scope-and-progression.md): complete identity ledger, native-versus-SQL differences, progression graph, raw reward slots, archive transcriptions and source hashes.
- [Native scenes, directors and actors](native-scenes-and-directors.md): scene caller joins, actor/clip descriptors, exact offsets, native support shells and merit UI contracts.
- [Current runtime and remaining gaps](runtime-and-gaps.md): offer gates, quest-family state transitions, battles, cleanup, reward retries and concrete implementation discrepancies.
- [Every quest dossier](../../outputs/grand-company-deep-decomp-20260926/QUEST_INDEX.md): the primary per-quest entry point, including empty/internal classes.

### Later Raven quest: repairing misleading decompiled control flow

`Gcl107.processEventStewart` contains a real boolean loop flag at bytecode PC 26 (`0x3A52`). The earlier Lua decompiler rendered a nested unconditional loop that obscured how dialogue exits. Direct instruction recovery shows:

| Menu result | Recovered behavior |
| --- | --- |
| 1 | Plays the 178/179 dialogue branch, clears the loop flag, finishes the talk and returns the original result |
| 2 | Plays the information branch and returns to the menu |
| 3 or -3 | Clears the flag, finishes the talk and returns the original result |
| Other result | Returns to the menu; the client does not establish the producer's legal value range |

Its `getTextIdStewart` helper takes a text-row number and a scalar boolean flag, not player/event-owner objects. Only literal Lua `true` selects these nine remaps: `164→321`, `165→322`, `169→326`, `170→327`, `171→328`, `172→329`, `175→330`, `178→332`, `179→333`. Numeric `1` is not boolean `true`. Other rows remain unchanged. The full [Gcl107 dossier](../../outputs/grand-company-deep-decomp-20260926/reconstructed/gcl107.md), [helper return ledger](../../outputs/grand-company-deep-decomp-20260926/local-helper-returns.csv) and regression tests retain those distinctions.

### Shared company scripts do not create missing dispatch classes

**43 core classes have no non-init methods:** all 33 internal rows and ten named classes (`gcg101`, `gcu101`, plus both cities' 104–107). Shared story dialogue can live in the Limsa-family class, but the city-specific shells do not thereby acquire those methods. The dossiers preserve each original class and registration rather than inventing inheritance.

Dialogue recovery also distinguishes text owners from speakers. `sayFreeDisplayName` has a different argument layout from NPC `say`; `worldMaster.ask` can explicitly select the `worldMaster` text sheet. The expanded [dialogue caller ledger](../../outputs/grand-company-deep-decomp-20260926/dialogue-callers.csv) records the resolved sheet and row, with unresolved dynamic helper/input cases identified separately. This avoids treating global confirmation rows as missing quest-local text.

### Duty-owned and aftermath scenes

Eight of the 18 scenes absent from the core quest-call ledger have explicit callers elsewhere: `InstanceRaidLesserIfrit` calls `GC010105`, `InstanceRaidLesserWhiteGeneral` calls `gc010715`, and `Etc304` calls `gc010810` through `gc010860`. These owners and their imports are included in the supporting disassembly without adding them to the 102-row GC quest count. The remaining ten resources retain unresolved caller ownership.

The recovered `InstanceRaidBaseClass.executeCutScene` path uses `startCutScene(1, 63, mode, ...)` and unconditional scene deletion. The quest helper uses envelope 61 and a result-dependent deletion path. These different contracts matter when reasoning about duty transitions; the report preserves their raw offsets and does not substitute one for the other. The native review also identifies a fade-order error in the older readable `Etc304` decompilation.

### Current availability is narrower than the inventory

The patch-1.18 bucket contains **18 quests**, with **15 uncommented offers**. The three Darkhold variants are present but disabled. Across the entire core inventory, the source audit finds **42 bespoke routes, 27 named generic routes behind a hard audit gate, 28 internal no-offer scaffolds and five missing internal wrappers**. Bespoke code does not imply that its offer is enabled or that the client has accepted it.

The current source has five Imperial actors across three waves for all three `Com0*4` routes. Older Hellhound descriptions are historical and must not be used as the current implementation contract. Similarly, `Com0u6` retains a stale hard-blocker comment while the actual wrapper invokes a bespoke campaign route; ordinary offers remain disabled through availability.

### Progression and reward uncertainties remain explicit

The SQL 107 quests are level 45 but depend on level-50 promotion 702; that inversion is retained as an unresolved provenance question. The six promotion offers additionally have a current C# path that bypasses the SQL prerequisite bit while retaining company/rank/medal and other gates. These are separate observations, not a recovered retail rule.

Native reward slots containing `-13 / 534 / 8090201` include formula-like selectors. Their values 5–8 are not literal EXP. Archive reward claims, exact seal slots, current Lua/C# payouts and the absence of main SQL reward rows are recorded independently. The inspected promotion completion path has no EXP grant or main-SQL fallback despite archived EXP entries. Final-rank seals are clamped to remaining capacity, unlike ordinary all-or-retry quest seals.

The runtime report also records an undefined `sequence` passed to one field-interaction item-repair branch and weaker post-yield revalidation in promotion handling. These are source findings with scoped failure conditions; this decompilation pass did not modify their behavior or assert a live reproduction.

## Reproduction and validation

Run from the repository root with the recovered Lua corpus and installed 1.x client available:

```powershell
python -B tools/audit_gc_deep_scope.py build
python -B tools/build_gc_deep_decomp.py
python -B tools/build_gc_deep_native.py
python -B tools/audit_gc_deep_runtime.py

python -B tools/audit_gc_deep_scope.py check
python -B tools/build_gc_deep_decomp.py --check
python -B tools/build_gc_deep_native.py --check
python -B tools/audit_gc_deep_runtime.py --check
python -B -m unittest discover -s tools -p test_gc_deep_decomp.py -v
python -B -m unittest discover -s tools -p test_gc_deep_native.py -v
python -B -m unittest discover -s tools -p test_job_gc_decomp.py -v
python -B -m unittest discover -s tools -p test_gc_mission_decomp.py -v
python -B tools/validate_grand_company_quests.py
python -B tools/validate_gc_campaign_events.py
```

The new semantic suite covers scope completeness, all core method coverage, true/false/nil identity, scalar helper mappings, real menu exits/repetition, independent API results, the auxiliary rank boundaries and dialogue text-owner signatures. Historical job/GC and opening-mission suites remain unchanged. The native audit checks resource hashes, raw actor/clip ranges and all merit-UI branch edges. Each audit retains its input hashes.

The broad pre-existing `validate_quest_availability.py` check reports unrelated annotations for `110799 / Spl0i1 / The Heat Is On` and `110860 / Spl102 / Bombard Backlash`; the GC-specific checks pass. No runtime, live database, main SQL, quest availability or placement changes are part of this pass.

## What remains unrecovered

Original server argument producers, some native API internals, reward-formula evaluation, precise retail battle rules and tuning, persistent world placement bindings, and live watched/skipped/reconnect behavior remain separate evidence gaps. Cinematic actors and scene-local positions are not server enemies or authorized world destinations. Resources without proven core callers remain distinguished from the eight recovered auxiliary owners; a matching resource name alone never establishes dispatch.

This is a complete inventory and deep recovery of the available GC client evidence, with current server behavior audited alongside it. The companion reports identify where implementation or client validation would still require new work.
