# Grand Company native scenes, directors, and actor contracts

This review expands the earlier 45-quest scene pass to the complete main-SQL Grand Company scope. The new native pack decodes **56 installed scene resources**, joins **45 proven core scenario callsites to 38 resources**, and retains **18 further GC-family assets without inventing a core quest/stage binding**. Eight of those additional assets have explicit calls in separately recovered instance-raid or `Etc304` methods. It also follows the GC-specific directors, cinematic actor classes and their recovered imports through **98 supporting Lua chunks**.

The result is an exact, inspectable client-side contract. It does not recover the lost retail server's battle scripts, persistence, spawn tables, party admission, authoritative rank/seal transactions, or destination transforms. No runtime script, SQL row, map binding, spawn, navigation recording, or placement manifest was changed.

The [native evidence index](../../outputs/grand-company-deep-decomp-20260926/native/README.md) links every scene and supporting chunk. The parent [scene-call ledger](../../outputs/grand-company-deep-decomp-20260926/scene-callers.csv) supplies exact quest method, argument tuple, PC, file offset, and variant IDs. A loaded string constant is separately recorded in the [constant-reference ledger](../../outputs/grand-company-deep-decomp-20260926/native/scene-constant-references.csv); it is never silently upgraded into a proven call.

## Scope and measured coverage

| Evidence surface | Result |
|---|---:|
| Installed scene resources decoded | 56 / 56 |
| Referenced resources present and decoded | 38 / 38 |
| Literal scenario calls joined | 45 |
| Additional family assets without a core GC scenario caller | 18 |
| Of those, assets with recovered auxiliary content owners | 8 |
| Serialized actor slots | 1,088 |
| Class-bound 0x3C ProxyActor slots | 759 |
| Authored timeline blocks | 1,405 |
| Typed timeline clips | 28,559 |
| Typed scene-local SetPosClip records | 5,153 |
| Supporting Lua chunks and resolved imports | 98 |
| Supporting chunks with no child prototypes | 62 |
| Locally registered supporting methods | 658 |
| Supporting instructions disassembled, including roots/nested prototypes | 18,998 |
| GC-specific director chunks | 38 |
| GC-specific actor chunks identified by script name | 8 |
| Merit-director methods executed with inert APIs | 33 |
| Concrete merit UI cases | 7,920 |
| Merit reachable instructions covered | 429 / 429 |
| Merit conditional edges covered | 36 / 36 |

The 658-method support total includes ordinary company service actors, auxiliary content owners, and shared helpers reached from the cinematic class/import graph. It is not 658 core quest scenario methods, and the 56-scene total is not 56 scenes with proven core quest dispatch. The scenario branch coverage belongs to the parent quest pack; supporting scripts other than the explicitly tested merit UI methods are disassembled with basic blocks, constants, nested prototypes, and exact instruction offsets, not claimed to have exhaustive symbolic execution.

## How the native decoding is grounded

The extractor uses the existing strict `decompile_job_gc_scene_timeline.parse_timeline` decoder. Each package is walked through its PWIB resource envelope into its unique SCB payload. It validates the SCB envelope, decodes the String pool, resolves the per-resource CATT/CCPT type registries, reads every CACT slot, and consumes each CBLK's declared clip count and padding.

The [fresh native registry evidence](../../outputs/grand-company-deep-decomp-20260926/native/native-type-registry.json) retains the hashes of the local C export and installed executable, exact C function line ranges, and PE-mapped raw byte windows at `0xA271B0–0xA27260`, `0xA26E90–0xA26EA0`, and `0xA26F00–0xA26F10`. The current default Python has no optional Capstone dependency, so these windows preserve exact bytes and report that fresh instruction disassembly is unavailable. The previously reviewed [native registry analysis](../../outputs/job-gc-decomp-20260907/reviews/gc/actor-clip-registry-native.md) supplies its separate annotated disassembly. The new builder neither installs packages nor pretends raw bytes are newly decompiled C.

`FUN_00a271b0` and `FUN_00a27210` establish the critical relationship: each serialized four-byte descriptor contains an unsigned 16-bit String index, whose pool offset is read as signed 16-bit; the resolved class pointer is stored in the corresponding runtime registry. Only the low byte of the descriptor word is copied into the runtime entry's secondary field. That byte's semantic meaning is not established here. Actor-kind and clip-kind numbers therefore have meaning only through the resource's own registry.

Only a descriptor-resolved **SetPosClip** is decoded as XYZ. A record of size 0x40 may instead be an IfClip or camera clip; the [size-only rejection ledger](../../outputs/grand-company-deep-decomp-20260926/native/rejected-size-only-placements.csv) retains every such counterexample in this whole-family scan. Only a 0x3C ProxyActor supplies the established class-ID field at +0x30. Other ProxyActor sizes, CharacterActor, LayoutActor, and CommonActor remain distinct serialized types.

Every scene has both a readable Markdown review and complete JSON. The JSON preserves every actor and clip's raw bytes, outer-package offsets, per-resource type descriptor, block identity, timeline ID, target track, flags, block-local start time, and resource reference. MotionClip references are resolved through the scene resource table. Uninterpreted payload bytes remain visible rather than being assigned guessed animation, trigger, opacity, or condition semantics.

`setup` and `header` are recognized initial block labels. `com0g610` has a valid **header** block; its 60 actor slots and 1,383 clips must not be lost because a parser searches only for a `setup` string. Duplicate labels remain separate by actor index and dictionary offset. The initial-setup table is a subset of the full timeline: an actor missing from it can still receive SetPosClip records in later blocks.

## Proven scene families and chronology boundaries

| Native resources | Recovered scenario owners | What the association establishes |
|---|---|---|
| `com0[lgu]105`, `com0[lgu]110` | `Com0[lgu]1`, plus `Com0l5`'s additional `com0l110` wrapper | Initial familiar scenes and aftermath presentation; exact arguments/fades remain per callsite. |
| `com0[lgu]410` | `Com0[lgu]4` | City finale scenes reached by their distinct numeric branches; does not recreate preceding battles. |
| `com0[lgu]510` | `Com0[lgu]6` | Ceruleum/campaign-history presentation. Asset numbering and quest suffix are not interchangeable. |
| `com0[lgu]610` | `Com0[lgu]5` | City ceremony presentation, including Gridania's header block and the Limsa elevator sequence. |
| `elv0l110` | `Com0l5`, `Gcl104`, `Gcl105`, `Gcl106` | Shared elevator asset at five callsites, not one quest's unique event. |
| `elv0[l/u]01a`, `elv0[l/u]02a` | `Com0l6`, `Com0u6`, `Gcu102` | Explicit city elevator wrappers with their own event/warp ownership. |
| `gc01[lgu]210` | Respective `Gc[lgu]102` | Distinct level-40 Echo/aftermath scenes; does not turn the Echo into the completion report. |
| `gc01[lgu]310`, `gc01[lgu]320` | Respective `Gc[lgu]103` | Both directly called assets for each newly included city route. |
| `gc010410`, `gc01l410`, `gc01g410`, `gc01u410` | `Gcl104` | One scenario owns shared and three city-specific scene calls; a city's `410` asset does not imply a locally populated `Gcg104`/`Gcu104` implementation. |
| `gc010610`, `gc010620` | `Gcl105` | Both shared campaign scene calls in the active chunk. |
| `gc010710`, `gc010714`, `gc010750` | `Gcl107` | Three literal calls in the final shared campaign chunk; neighboring asset numbers are not automatically additional calls. |

All exact argument tuples and byte offsets are in the linked scene pages and parent ledger. Method names, English quest titles, and matching asset prefixes are insufficient to assign the remaining assets to a stage.

The 18 resources without a core scenario call are `gc010105`, `gc010110`, `gc010420`, `gc010430`, `gc010440`, `gc010715`, `gc010720`, `gc010730`, `gc010740`, `gc010810`, `gc010820`, `gc010830`, `gc010840`, `gc010850`, `gc010860`, and `gc03g410`/`gc03l410`/`gc03u410`. They are fully structurally decoded. Their absence from the core scenario call ledger does not prove unused content or authorize a guessed quest hook; the separate content-owner scan recovers the following concrete associations.

| Auxiliary owner | Proven scene call and exact boundary |
|---|---|
| `InstanceRaidLesserIfrit.processStartEvent(a,b)` | If `a ~= nil`, calls `executeCutScene("GC010105", b, true, 0, a)` at PC 8 / `0x128`. This is the actual instance director, not an extra scene call manufactured in `Gcl101`. |
| `InstanceRaidLesserWhiteGeneral.processStartEvent(a)` | Calls `executeCutScene("gc010715", a, true)` at PC 4 / `0x163`. Its separate `processCutSceneEvent(scene,owner,weather)` accepts a **dynamic scene key** at `0x1F6`, with explicit fade-out, weather change, playback, fade-in and one-second wait. It does not reveal which neighboring gc0107xx asset was supplied by the original server. |
| `Etc304.processEventStart(player,eventOwner,a)` | Plays `gc010810` with `(2,0,a)` at PC 8 / `0x968`, then default fade-in and returns the scene result. Raw bytecode corrects the pretty-print's apparent order, which incorrectly puts fade-in before playback. |
| `Etc304.processEventPray` | Five explicit `startNQCutScene` branches use `gc010820/830/840/850/860` for numeric first-extra values `11/10/5/1/3`, respectively. The `850` call forwards the fourth-extra argument. These are auxiliary `Etc304` scene consumers, not proof of a 102-core-quest stage binding. |

The two instance directors inherit `InstanceRaidBaseClass`. Its **`executeCutScene`** wrapper is distinct from `QuestBaseClass.startNQCutScene`: boolean false selects mode 2, otherwise mode 1; a nil owner falls back to the director; it creates one scene, calls `startCutScene(1,63,mode,...)`, then unconditionally deletes that same scene. Creation is at `0x1961`, playback at `0x1979`, and deletion at `0x1981`. The 63 envelope and unconditional post-call deletion must not be replaced with the quest wrapper's 61/finished-result contract. Both wrappers leave native playback internals unresolved.

Several of these assets contain extensive authored sequences: `gc010715` has 857 clips, `gc010740` has 1,227, and the proven `gc010750` has 2,061. Native presence and size do not establish how a player reaches them. Similarly, `gc03[lgu]410` contains a short seven-block scene in each city, but a `304`-style name association is not recovered dispatch evidence.

## The 38 GC director chunks

The [support inventory](../../outputs/grand-company-deep-decomp-20260926/native/support-inventory.json) retains the entire logical path. This matters because `QuestDirectorGcl30101`, `QuestDirectorGcl30201`, `QuestDirectorGcu30101`, `QuestDirectorGcu30201`, and `QuestDirectorGcg30101` each occur under both the plain `director/quest` tree and the `simplequestbattle` tree. Those files are different registration contracts, not duplicate filenames that can be overwritten in a flat export.

| Director group | Count | Recovered superclass and local behavior |
|---|---:|---|
| Plain `QuestDirectorCom0g501` | 1 | `QuestDirectorBaseClass`; no local methods. |
| Plain `Gcg10201/30101`, `Gcl10201/30101/30201`, `Gcu10201/30101/30201` | 8 | `QuestDirectorBaseClass`; no local methods. |
| Plain `Gc[lgu]70101` | 3 | `QuestDirectorBaseClass`; eleven local UI methods each. |
| Simple `Com0g101/401/601`, `Com0l101/401/501/601`, `Com0u101/401/501/601` | 11 | `SimpleQuestBattleBaseClass`; only two own-client-ID overrides. |
| Simple `Gc[lgu]{103,301,302,303,305}01` | 15 | `SimpleQuestBattleBaseClass`; no local methods. |

The two overrides are exact: `QuestDirectorCom0l601.getOwnClientQuestIdAsSimple` returns **111406**, at method PC 0/`0x125` then RETURN `0x129`; `QuestDirectorCom0u501` returns **111805** at the corresponding offsets. The other empty subclasses do not inherit either constant.

`SimpleQuestBattleBaseClass` contains three methods: an abandon prompt delegated to `worldMaster:ask(self, worldMaster, 25230, 2, arg3)`, `getOwnClientQuestId` delegating to `getOwnClientQuestIdAsSimple`, and an empty default implementation of that latter method. There is no recovered spawn list or victory predicate in this base class.

`QuestDirectorBaseClass.init` builds `_assignForChild` arrays of sizes 16 and 32 and forwards all varargs to `initAsQuestDirector`. Its `getOwnClientQuestId()` comparison has a zero-distance jump; it does not conceal a recovered quest mutation. `getUseContentsCommand` returns the local player's `getQuestContentsCommandPermitFlag()`. Default `getOwnClientQuestId` and `initAsQuestDirector` are empty, and `processFinalize` contains comparisons whose branch bodies are empty. These raw facts should replace an interpretation based on a broken pretty-print's empty `if` statements.

This client director graph proves class registration, inheritance, event delegation, and specific UI consumers. It does not prove how the original server populated actors, timed recovery, awarded merit, armed a disruptor, or decided victory. Replacing a registration shell with a guessed battle and calling it a decompilation would cross that boundary.

## The complete GC701 merit display contract

The three directors share the same eleven-method structure. Their exact bytecode is retained under `support/director__quest__questdirectorgc[lgu]70101.txt`. The new read-only interpreter handles only the opcodes needed for these methods and refuses unsupported calls/opcodes. Widget calls are recorded, never executed. All 33 methods are exercised over signed terminal states, score values around the threshold, nonpositive/positive clocks, and time/direct/other tags.

| Method | Limsa byte range | Recovered behavior |
|---|---|---|
| `initAsQuestDirector` | `0x29B–0x33B` | Initialize empty `_temp`; synchronize `directNumber: integer8`, `point: integer16`, `limitTime: integer32`; declare `direct` tag for directNumber/point and `time` tag for limitTime. |
| `processUIInit` | `0x408–0x418` | Open company-specific public effect: Limsa 14, Gridania 15, Ul'dah 16. |
| `processUIUpdate` | `0x47C–0x510` | `directNumber == 20` opens success effect 17/18/19 and returns; `== -1` opens shared failure effect 20 and returns. Otherwise tag `time` starts contents information. Other tags update with argument 1 only if `limitTime > 0`. |
| `processUIFinalize` | `0x60A–0x63E` | Always cancel contents information first; only `directNumber == 0` additionally opens effect 13. |
| `getKindContentsInformation` | `0x6F9–0x701` | Return 1. |
| `getGuildleveId` | `0x736–0x73E` | Return 0. |
| `getTitleOnGuildleveInfo` | `0x773–0x787` | Return `worldMaster` plus title row 51113 for Limsa, 51112 for Gridania, or 51114 for Ul'dah. |
| `getMaxIndexNumberOnGuildleveInfo` | `0x7CD–0x7D5` | Return 1. |
| `getTimeDataOnGuildleveInfo` | `0x80A–0x822` | Return `limitTime, limitTime - 60`, without clamping. |
| `getInstructionOnGuildleveInfo` | `0x870–0x884` | Return `worldMaster, 51115`. |
| `getArticleFullDataOnGuildleveInfo` | `0x8CA–0x92E` | Return the ten-field tuple below; status becomes 2 inclusively at 1,000 points. |

```text
status = 2 if point >= 1000 else 1
meritItem = 11000426 for Limsa, 11000425 for Gridania, 11000427 for Ul'dah
return status, 6, 1, point, 1000, 0, worldMaster, 33621, meritItem, 1
```

The signed failure state is **-1**, not the unsigned byte value 255. Successful/failed terminal updates short-circuit the tag/clock path. A `time` tag starts the display even if the supplied clock is zero or negative; the positivity check belongs only to the other-tag update path. The warning expression does not recover a fixed trial length: it is exactly the supplied limit minus sixty.

The [concrete contract file](../../outputs/grand-company-deep-decomp-20260926/native/merit-director-contracts.json) retains 2,880 distinct observed output/state/branch combinations and the concrete input for each. The 7,920 cases are finite UI tests, not all possible server states or retail playthroughs. They cover every structurally reachable instruction and conditional edge in these eleven-method classes, including the exact inclusive score threshold. No value here specifies merit per kill, enemy species, spawn positions, reinforcement behavior, party scaling, or promotion payment.

## Actor classes and company services

Eight name-specific GC monster chunks are present: `BasiliskLesserQuestCom0l1`, `RaptorForestQuestCom0u1`, `ScalelizardFireQuestCom0g1`, `EmpireChiefQuestGcu102`, `EmpireChiefQuestGcu303`, `FlyLesserQuestGcg302`, `QiqirnBarehandsGcl303`, and `SlugLesserQuestGcl301`. Each only requires its family base and registers a class; none has local methods. Their full base/import chains are preserved in the new support pack. This is evidence of named actor classes, not quest-specific combat AI recovered from those chunks.

Cinematic proxy IDs are joined to **main `gamedata_actor_class.sql`** for script paths, display IDs, and property flags. Many cinematic records legitimately join a blank script path, including player binding 0 and stand-ins. The raw ID and empty path remain in [cinematic-class-bindings.json](../../outputs/grand-company-deep-decomp-20260926/native/cinematic-class-bindings.json); they are not mislabeled as a missing source chunk. Conversely, a nonblank script path is inventoried and followed through its recovered root imports.

That graph includes the company officer, shop, supply, warp and ordinary NPC helpers. Their locally registered methods are fully disassembled. One useful additional boundary is `PopulaceCompanyOfficer.eventRankUpChoice`: it reads the player's company and seal count, asks once, then accepts only if the answer is numeric 1 **and its third extra argument is boolean true**. The latter comparison is method PC 64 at `0x1351`; it returns true at `0x135D`. Numeric 1 supplied in that boolean slot is not the same Lua value. The seal count shown in the question does not itself prove an authoritative deduction or eligibility calculation in this method.

`eventDoRankUp` and `eventRankUpDone` sequence salutes, timed waits, join/status widgets, supplied status/point values, and talk completion. They are presentation methods. Their presence must not be used to infer a database rank write. Likewise, the player inline wrappers `_getBelongGrandCompany_inl` and `_getGrandCompanyRank_inl` return their native `_cpp` binding names; the query implementation remains below that boundary.

`PopulaceCompanyWarp.eventAfterWarpOtherZone(player)` does `_fadeOut(1)`, `_waitForFading()`, and `_fadeInAfterWarp()`. It contains no destination XYZ. The company's aetherpass identifiers and menu presentation are separate from a recovered coordinate transform or a server-owned movement transaction.

## Scene playback, skip and event ownership

The full shared helper chunks are exported, not only a scene-name list. `DirectorBaseClass.delegateEvent` passes the requested method, player, director, and original varargs to the quest's `_callFunction` through a tail call at **`0xA6A`**. NPC delegation has its own parallel helper. Neither helper fabricates a quest stage or destination.

`QuestBaseClass.startNQCutScene` creates one scene object and starts it with the `(1, 61, mode, ...)` envelope. The same object is deleted only when its finished return is boolean true; the independent result is returned. A damaged decompiler's duplicated scene-creation expression is not the raw register behavior.

The 289-instruction `CutScene.startCutScene` wrapper has a much deeper lifecycle than calling `_play` alone:

1. It calls the player's loading-clear wrapper before `_loadCutScene` (`0x1D11–0x1D29`) and suppresses static widget 14.
2. It maps modes 1–8 into a pair of flags and normalizes playback mode to 1/2. Typed varargs are inspected; this does not establish how a quest's unseen state producer computed them.
3. Normal initial playback uses `_play(...)`, producing two independent returns at **`0x20BD`**; the alternate path uses `_replay(...)` at **`0x20D5`**. Mode 1 shows the skip UI on the same scene object.
4. It hides the skip UI and conditionally cancels desktop widget ownership according to the returned finished flag and normalized mode; mode 64 has a separate map-loaded wait on completion.
5. It returns both native playback results at **`0x218D`**. `_play`, `_replay`, and the native renderer's branch execution remain opaque to this Lua-only execution pass.

`CutSceneSkipWidget.processAskResult` calls `_skip()` on its stored scene and hides that scene's skip widget. It is not an independent quest completion callback. `DirectorBaseClass._onEventCancel` closes owned content widgets, and resets the player's fade only for a `noticeEvent` (`0xAB1–0xAD1`). These ownership checks explain why arbitrary close/fade calls around a delegated quest scene can change behavior.

Default fade-in waits for the map and performs an ordinary fade. After-warp fade uses `_fadeInAfterWarp`; the corresponding player inline facade at `0x1941–0x194D` merely identifies `_fadeInAfterWarp_cpp`. No zone ID, map page, saved return point, or world coordinate is recovered from that facade. The correct transition owner must supply those separately.

## Placement and evidence limits

All 5,153 SetPos records are **cinematic, scene-local authored fields**. A scene actor may be a stand-in, another instance of the same label, a player proxy, an effect holder, a camera target, or a local staging prop. The last SetPos in file order is not necessarily the last played pose because blocks, conditions, tracks, and branches matter. Block durations cannot be summed into a guaranteed viewed duration.

This pass does not interpret cinematic coordinates as map coordinates, select floor pages, borrow another zone's map frame, derive terrain heights, or modify any public/private placement layer. Recovering an actual world placement would require its own zone/page registration, applicable transform, route phase, persistent actor ownership and approved coordinate workflow.

The most consequential remaining gaps are the missing original server dispatcher, native scene condition/argument producers, gameplay actor/AI/spawn state, authoritative rewards and ranks, and watched/skipped/reconnect client behavior. There was no live client test in this decompilation pass. Structural decoding, exact byte ranges, and branch coverage are strong evidence about the recovered client corpus; they are not live acceptance or retail parity.

## Reproduction and verification

```powershell
python -B tools/build_gc_deep_native.py
python -B tools/build_gc_deep_native.py --check
python -B -m unittest discover -s tools -p test_gc_deep_native.py -v
python -B -m unittest discover -s tools -p test_job_gc_decomp.py -v
```

Run the parent whole-GC generator first so `scene-callers.csv` exists. The native builder also accepts `--client-root`, `--output`, and `--scene-callers`. It writes only the new native output tree and refuses malformed scene structures, unsupported merit-interpreter opcodes, incomplete reachable/branch coverage, source hash mismatches, or actor/clip byte-range mismatches. `--check` is read-only: it checks existing actor/clip bytes, declared block totals, support hashes and every recorded generation-input hash. It does not regenerate or claim a deterministic comparison of every Markdown sentence/CSV field.

Validation compares **all 1,088 actor and all 28,559 clip raw ranges** against their original installed packages, verifies **56 scene hashes** and **98 supporting bytecode hashes**, and checks every declared block count against the decoded clip list. Read-only checking additionally validates **165 generation-source hashes**. Eight new semantic merit tests cover company effects, signed failure and short-circuiting, positive-clock handling, the inclusive score threshold, cancellation order, unclamped warning times and synchronization schemas. The existing fourteen scenario/scene parser tests also pass, including duplicate actor labels, header blocks, and false-coordinate counterexamples.
