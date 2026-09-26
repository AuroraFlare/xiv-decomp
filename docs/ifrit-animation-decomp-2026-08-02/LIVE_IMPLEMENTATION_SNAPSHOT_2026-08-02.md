# Live Ifrit animation implementation snapshot - 2026-08-02

This report supersedes the earlier live snapshot. The audit was read-only against C:\Users\drime\source\repos\AuroraFlare\FF14-Memory. No source, SQL, asset, validator, or other non-Markdown file was changed.

Final source-family recheck: 2026-08-02T17:43:40.6305153-04:00. Branch develop, HEAD dfd7dfa717efb8389b5a2d0c7183190f0ce3ac11 (Ifrit Phase 1), with uncommitted Ifrit changes.

## Final pins

| File | Bytes | Last write (-04:00) | SHA-256 |
|---|---:|---|---|
| Data/scripts/directors/InstanceRaid/IfritEncounter.lua | 68,376 | 2026-08-02T17:35:21.6575829-04:00 | f868e997dd6e2f81b6003ff8988259d1e8d3e43c2bb1d23cece26d1e2a70f320 |
| Data/scripts/monster_tp.lua | 38,493 | 2026-08-02T17:14:11.9601189-04:00 | c242cc166242e08133f07b6125421d0f4de8bbe283e5dc3d721b1f6df71928ec |
| Map Server/Primals/IfritManager.cs | 58,143 | 2026-08-02T17:19:02.3344635-04:00 | 3e102db48214f787f780399c755f7f9a834c795ae051f060472f834e8683f4ac |
| Map Server/WorldManager.cs | 648,302 | 2026-08-02T16:56:39.4834718-04:00 | 04ecf1d97f35e78f4d1ae54bbfc2708b8a76dfdaac869483d8f8598325d593e0 |
| Map Server/Actors/Chara/Npc/BattleNpc.cs | 200,669 | 2026-08-02T17:35:53.5025623-04:00 | a7bc3d40e4640bd66f3db92923611ca6444c2b6269db55bce98fe7607191ad02 |
| Data/scripts/commands/gm/testifrit.lua | 1,936 | 2026-08-02T17:00:40.0987058-04:00 | 2efb705fc52d4fe39f9b472e7015f886252be028bbe9cdbde09e2e2fe81e8c95 |
| Data/sql/server_battle_commands.sql | 576,173 | 2026-08-02T14:34:53.3177199-04:00 | f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96 |
| Data/sql/live migrations/ifrit_encounter_family.sql | 5,189 | 2026-08-02T14:34:53.3187200-04:00 | 453209ab80ffde5beea07712484d1ee9fd3fb681cd9dec24f2660194135b9f45 |
| Data/scripts/content/BowlOfEmbers.lua | 552 | 2026-07-26T00:16:51.1248717-04:00 | 5cbf4305426259fc15ffb0ac4746910f011e08738cfc036e055d80baf3a64075 |
| tools/validate_ifrit_family.ps1 | 56,396 | 2026-08-02T17:39:07.8433045-04:00 | 8050956b274a8515abed84e2fbf03a05aaa429adf2994ae67e7629b100b8f0d4 |

Relevant runtime support remains pinned as follows: BattleCommand.cs 20,678 bytes, SHA 273e24860aa9d2d3ce0795e7a1d88ef39db646bd65268528537b87f74e6cdb30; BattleNpcController.cs 90,613 bytes, SHA 2d21314eb01d6819eaa37da1ec1e1a763dc09b5c0fc1bb67233b9e4de05b3f1c; MobSkillState.cs 11,847 bytes, SHA fc03f519877d0aac45dfb24f84165dab9a762a3f4c3abd71ce50530f8bcb3240; Character.cs 175,551 bytes, SHA e7a436a774911831b1f48f30385068d111340ccfa35b5b555b7ad581a5a6220b; AIContainer.cs 16,440 bytes, SHA d6e5a893e5704abf7fc28fd40d02f1cbc69094da5187377be7e24af4e94cf953; DeathState.cs 3,486 bytes, SHA f621ab0135aa2045f3bd79728e742706e7f75da7ea4299b25189c0adb9bea148; and DespawnState.cs 3,243 bytes, SHA 863d979547fbebdf8ff8d6b6df7d54cce1fd45bc3051d3967c7e42258b3493a4.

## Current implementation truth

- Hard Crimson Cyclone explicitly invokes WSS18 takeoff, WSS19 landing, WSS7 fire rush, immediate post-dash WSS18 disappearance, and final WSS19 landing. WSS8 has no runtime call.
- Hard Cyclone batching is now one body crossing once before Hellfire, one body crossing once during Nails, and three bodies crossing simultaneously once after Hellfire. The earlier three sequential waves are stale.
- Hard Eruption and Hard Plume have reachable, initialized, updated, and cleaned-up custom state machines using immobile IfritHotAir casters.
- Hard Plume server geometry is concretely anchored. Center/outer use the captured arena center; final uses Ifrit's current position and covers 50 yalms except an eight-yalm safe pocket.
- Hard Eruption damage is frozen to each target's cast-start position. Static source still cannot prove that the visible eruption is rendered at that frozen coordinate because action-result packets have no world coordinate and the presentation owners are Ifrit or a center helper.
- Normal and Extreme retain generic Eruption/Plume and ordinary private 23984 Cyclone. They do not call the new helper or custom dash queues.
- Nails explicitly play m524 WSS1 at spawn. Player and GM kills enter generic BattleNpc DEAD and permanent one-shot removal. There is still no explicit Nail-specific death selector; Hellfire survivors direct-despawn; late clients do not receive WSS1 replay.

## Entry and difficulty routes

IfritManager.cs:123-164 maps InstanceRaidLesserIfrit, InstanceRaidNormalIfrit, and InstanceRaidHyperIfrit to content IDs 4, 3, and 14. Their wrappers call runIfritEncounter with normal, hard, and extreme. IfritEncounter.lua:85-147 has matching profiles.

| Route | Live invocation |
|---|---|
| Normal | Incinerate, Sear, generic Eruption, ordinary 23984 Cyclone, generic Plume, Vulcan Burst (1391-1396). |
| Hard above 75% | Melee-only; no special queue (1398-1404). |
| Hard 75%-60% | One three-pulse Eruption train; one-body x1 custom Cyclone; Incinerate; helper center/outer Plumes; Vulcan Burst (1406-1422). |
| Hard at/below 60% pre-Hellfire | One three-pulse Eruption train; one-body x1 custom Cyclone; helper center/outer Plume; Vulcan Burst; Incinerate (1425-1446). |
| Hard post-Hellfire | Two concurrent three-pulse Eruption trains; one simultaneous three-body x1 triangle Cyclone; helper final full-floor Plume; Vulcan Burst; Incinerate (1425-1446). |
| Hard Nails active | Alternates one-body x1 Cyclone and one three-pulse Eruption train while the completion margin is open (1300-1377). |
| Extreme Eruption | Generic 23983: five sequential casts alternating with three groups of three; timed Nail Eruptions are generic too (1320-1325, 1449-1458). |
| Extreme Cyclone | Generic 23984 once before Nails and four times afterward, followed by Incinerate (1460-1466). |
| Extreme Plume | Generic center, outer, then two or six ordinary Plumes (1468-1489). |

All enqueueEruptionVolley call sites are in Hard rotation or the Hard Nail branch. All enqueuePlume call sites are in queueHardRotation. Normal and Extreme never enter those custom jobs.

## Hard helper lifecycle

spawnMechanicHelper at IfritEncounter.lua:341-368 creates actor/appearance 2207310. gamedata_actor_class.sql:6324 identifies it as /Chara/Npc/Monster/Ifrit/IfritHotAir. It uses the active profile's Ifrit BNPC, one HP, profile level/damage, immobile configuration, disabled autoattack/turning, invulnerability, no aggression, zero targetability, and zero combat-nameplate properties. It is instantiated for ready players and stored in state.mechanicHelpers.

The final integration is reachable:

- mechanicHelpers and mechanicSerial initialize at 1757-1758.
- executeQueue blocks overlap with Cyclone/Eruption/Plume and dispatches tagged jobs at 952-979.
- updateEruptionVolley and updatePlumeCast run every engaged loop at 1857-1858.
- rotation, glow, Sear, Nail warp, and Hellfire guard active jobs.
- cleanupMechanicHelpers despawns helpers and clears both job fields at 370-379.
- failed starts, completed jobs, Hellfire staging, and encounter finish all clean helpers.

BattleNpc.SetEncounterCombatPresentationVisible now toggles both nameplate fields and enmity indicators and, when broadcast is true, sends a blank actor-name packet while hidden and the authored name when restored (BattleNpc.cs:1796-1841). It still does not hide the model. Helpers call the method with broadcast false before first instantiation, so the new blank-name packet is not sent for them; their zero nameplate properties are still in initial actor state. Real-client inspection remains necessary for any grey base-name leak.

## Hard Eruption

startEruptionVolley at 844-872 selects living targets with the current top-hate target excluded when possible, shuffles for distinct targets, and repeats only if there are fewer players than trains. Every train has three pulses. Train one uses the real boss. Post-Hellfire train two uses an IfritHotAir helper at arena center.

updateEruptionVolley at 874-916 keeps a target until invalid, retargets if needed, starts each 23983 pulse only when its caster can change state, and waits through the final cast cleanup before despawning helpers. Although nextPulseAt advances by one encounter second, the 3000-ms cast and CanChangeState gate control actual cadence. Completion delays the next special by at least three encounter seconds.

BattleNpcController.cs:1453-1505 flags private 23983 for ground snapshot. MobSkillState.cs:100-105 captures the target transform at cast start and lines 207-215 resolve the eight-yalm damage circle at that immutable point. Server damage therefore does not follow a moving player.

Presentation remains only partially established. Hard maps 23983 to donor 23364/WSS2. Character.cs sends caster ID, animation ID, command ID, and target result rows, but no X/Y/Z. The first WSS2 owner is Ifrit at his current transform; the second is IfritHotAir at center. Neither is moved to the frozen damage point. A client might implement target-relative VFX, but source cannot prove a stationary ground eruption at the server snapshot. This is a presentation boundary, not an unreachable mechanic: the custom damage trains are live.

## Hard Plume

startPlume at 918-939 always uses one IfritHotAir:

- center: captured center, 23987, radius 16, caster origin;
- outer: captured center, 23988, outer radius 22 and inner radius 8, caster origin;
- final: Ifrit's current position, 23988 with ifrit.plume.full_floor.

monster_tp.lua:121-129 consumes the final flag on the execution copy and sets range 50, minimum range 8, caster origin. That covers the approximately 22-yalm arena while retaining an eight-yalm pocket around Ifrit. updatePlumeCast retains the helper until cast/result completion, then removes it and delays the next special.

Hard helper donors are 23376/WSS3 for center and 23404/WSS1 for outer/final. Here helper origin and damage origin agree. The unresolved part is visual asset proof: no test in this audit proves IfritHotAir WSS3/WSS1 draws the retail plume, and BowlOfEmbers.lua has no BG fallback.

## Cyclone animations, jump, and flames

| Selector | Runtime behavior |
|---|---|
| WSS7 command 23007, 0x13007000 / 318795776 | Hard custom bodies. ACTIVE movement goes first and WSS7 last so movement does not replace the fire-rush scheduler (646-699). |
| WSS18 0x13012000 / 318840832 | Initial boss takeoff and immediate disappearance after each completed dash (531-550, 701-717). |
| WSS19 0x13013000 / 318844928 | Bodies land at captured perimeter starts; final boss lands on current top hate (422-480, 743-780). |
| WSS8 command 23008, 0x13008000 / 318799872 | No runtime reference. Only SQL donor row 764 remains. |
| WSS15 0x1300F000 / 318828544 | One persistent Hard glow at/below 50% HPP, serialized behind Nails, queues, Cyclone, Eruption, and Plume (1528-1552). |

Exact Hard order: WSS18; hidden warp; WSS19; private 23984 cast/damage; one 0.5-second ACTIVE endpoint movement plus WSS7; STOPPED; immediate WSS18; 3.25-second absence; final WSS19 on top hate; combat restore. Post-Hellfire, all three bodies perform that single crossing simultaneously. Character.cs:3399-3411 suppresses the duplicate ordinary donor animation on the 23984 result.

The BattleNpc name-packet change removes the grey base-name leak during broadcast hidden phases, but model disappearance still depends on WSS18. WSS7 is explicitly selected and correctly ordered, yet static validation cannot prove its flame emitter renders. Normal/Extreme use generic private 23984 with WSS1 donor presentation.

hardGlowActive is published to WorldManager/IfritManager and IfritManager.cs:923-980 replays WSS15 to reconnecting players who have the boss instantiated. WSS16 is absent.

## Client donor map

BattleCommand.cs:448-467 maps private server geometry to archive presentation:

| Private | Mechanic | Normal/Hard | Extreme |
|---:|---|---|---|
| 23980 | Sear | 23361/WSS1 | 23577/WSS1 |
| 23981 | Vulcan Burst | 23362/WSS1 | 23578/WSS1 |
| 23982 | Incinerate | 23363/WSS1 | 23579/WSS1 |
| 23983 | Eruption | 23364/WSS2 | 23582/WSS1 |
| 23984 | Cyclone | 23365/WSS1 | 23580/WSS1 |
| 23985 | Plume | 23367/WSS1 | 23583/WSS2 |
| 23986 | Hellfire | 23368/WSS1 | 23581/WSS1 |
| 23987 | Center Plume | 23376/WSS3 | 23593/WSS2 |
| 23988 | Outer/final Plume | 23404/WSS1 | 23595/WSS4 |

Private rows remain at server_battle_commands.sql:1341-1349 and migration lines 9-17. Eruption is radius 8; center Plume radius 16; outer Plume 22 minus 8; Cyclone a 44-yalm line with 3500-ms cast.

## Nail activation

Bindings remain Normal 2207306/3060, Hard 2207307/3061, Extreme inner 2207313/32702, and Extreme outer 2207315/32703. All use direct IfritAnchor model 10524. Normal/Hard use fixed captured positions; Extreme uses 13/31-yalm rings.

At IfritEncounter.lua:1051-1178 each successful Nail keeps ground Y, receives presentation height 5.5, becomes combat-inert, receives SetDespawnTime(4) and ConfigureScriptedOneShotLifecycle(director), enters the director hidden/untargetable, and is instantiated. After 0.1 seconds it receives command 0 with m524 WSS1 0x13001000 / 318771200. After 1.5 seconds combat presentation and targetability turn on.

Living Nails are re-instantiated each Nail tick, but WSS1 is not replayed to clients that become ready after its original packet.

## Nail death and one-shot lifecycle

A player kill now follows the generic BattleNpc terminal path:

1. Lethal Character.AddHP calls BattleNpc.Die (Character.cs:1072-1088).
2. Die is idempotent, enters DeathState/MAIN_STATE_DEAD, clears combat state, and uses the Nail's four-second despawn value (BattleNpc.cs:4286 onward; AIContainer.cs:469-475).
3. The battle result adds a death reaction. DEAD and HP=0 packets are deferred until max(configured 1200 ms, lethal command animation duration), preserving impact VFX (Character.cs:3431-3459, 3485-3513, 3551-3587, 3909-3916).
4. At four seconds DeathState calls Despawn. The one-shot director marks removal permanent. After the configured 750-ms removal grace, CompleteDeathFadeOut removes the member without ending the director and removes it from the area (BattleNpc.cs:4206-4213, 4546-4613; DeathState.cs:69-76; DespawnState.cs:34-79).
5. Nominal server death-to-removal is about 4.75 seconds plus ticks.

IfritManager.cs:701-716 now calls AddHP(-HP) for GM shatter, so it enters Die/DEAD/one-shot removal rather than assigning HP=0. Because no battle CommandResultContainer exists, GM shatter still lacks a player's lethal impact result, death-reaction row, and visual-deferral registration.

cleanupNails directly removes living Nails during Hellfire; naturally dead Nails remain for one-shot fade. Administrative cleanup directly removes all.

Remaining Nail gaps:

- no explicit Nail-specific activ/id0/msb4_1/ded/dedpose/deact selector; death relies on generic MAIN_STATE_DEAD and model-native collapse;
- surviving Nails direct-despawn after Hellfire with no consume/shatter animation;
- administrative teardown bypasses death presentation;
- late clients receive no WSS1 replay;
- WSS1's archive row is nominally 3000 ms while targetability begins after 1500 ms;
- the four-second corpse policy lacks client visual proof;
- GM shatter proves lifecycle, not the full player-hit packet sequence.

## Bowl and GM ground probe

BowlOfEmbers.lua:3-22 only sets music 23 and weather 8074. It has no BG animation or floor-texture control.

The GM-only ground/bank command supports 2, 3, 4, 10, 12, 13, 14, 21, and 22. IfritManager.ProbeGroundBank at 719-756 spawns 2207310 for banks 2/3 or 2207314 for the rest at the GM's position, then sends command 0 with the chosen WSS bank. No encounter path calls it. The new Hard helper casts are real combat integration; the GM probe remains only a visual-discovery tool.

## Validator

Validator 8050956b274a8515abed84e2fbf03a05aaa429adf2994ae67e7629b100b8f0d4 passes:

    MoonSharp Lua parse: 15 files OK
    Captured arena perimeter: 68 nodes, radius 18.992..21.864 yalms OK
    Ifrit encounter family validation: OK

Its summary now correctly says one-body x1 before Hellfire/during Nails and one simultaneous three-body x1 post-Hellfire. It asserts the helper/train/plume tokens, three Eruption pulses, final 50/8 plume geometry, Nail WSS1 and one-shot calls, GM AddHP, WSS7/18/19, WSS15 replay, name blank/restore packets, SQL/migration, and Lua parse.

Coverage gaps remain:

1. Helper assertions are token/regex based and do not fully prove initialization, update calls, every cleanup path, or Hard-only exclusivity.
2. ConfigureScriptedOneShotLifecycle, DeathState, DespawnState, and permanent removal internals are not validated.
3. Eruption presentation ownership at the frozen coordinate is not asserted.
4. No static test proves IfritHotAir banks, WSS7 flames, WSS18/WSS19 body states, WSS15 persistence, or Nail collapse on a client.
5. WSS8 validation forbids one exact old declaration; independent search found no runtime 23008/0x13008000/318799872 call.
6. Late-client WSS1, Hellfire-survivor animation, targetability timing, and GM-vs-player death packets are not covered.
7. Normal/Extreme pass while retaining generic Eruption/Plume/Cyclone presentation.
8. Helper pre-instantiation broadcast=false means the new blank actor-name packet is not exercised for helpers.

## Disposition

At these pins, Hard jump/dash choreography is explicitly WSS18/WSS19/WSS7; post-Hellfire is one simultaneous triangle crossing, not three sequential waves. Nail WSS1 and generic one-shot death removal are implemented. Hard Plume has correct helper-origin geometry. WSS8 remains absent.

The remaining work is empirical client capture: verify WSS7 flames, WSS18/WSS19 transitions, IfritHotAir plume banks, Nail spawn/death, helper name suppression, and whether Eruption renders at its cast-start damage snapshot. If Eruption does not, it still needs a coordinate-bound presentation owner or packet mechanism. Normal/Extreme helper parity and Hellfire-survivor Nail animation remain separate design decisions.
