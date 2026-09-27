# Dungeon Terminal / Warp Contract Deep Dive

Generated: 2026-06-19T20:38:33

## What changed

This pass splits the dungeon object surface into safer implementation buckets:

- `GimmickTerminal` is only a generic text terminal: text bank `10096/gimmickTerminal`, `eventTalkTerminal(player, textId)`, and `worldMaster:say`.
- Toto-Rak magitek mechanics are already local concrete scripts: `RaidDungeonLight`, `RaidDungeonBarrier`, and `RaidDungeonPoster`.
- `RaidDungeonWarp` now has a small local bridge script; the remaining missing proof is actor/spawn binding plus destination validation. Client contract: text bank `6781/raidDungeonWarp`, scheduler `67493888`, and `askExtendWidget(self, 2, 2, 1, 2)`.

The SQL evidence points to real Toto-Rak bindings for `1200226`/`1200228`, a class-only poster `1200227`, and unresolved `~~~magitek???~~~` actor classes `1200373`-`1200375` as the best warp-device leads. Quest text mentions a deep-dungeon magitek transporter returning players to the entrance/exit, so the likely behavior is a content return/exit warp rather than a free-form teleport.

## Outputs

- [dungeon_terminal_function_contracts.csv](../tools/outputs/lpb/dungeon_terminal_warp_contract_20260619/dungeon_terminal_function_contracts.csv)
- [dungeon_terminal_object_map.csv](../tools/outputs/lpb/dungeon_terminal_warp_contract_20260619/dungeon_terminal_object_map.csv)
- [local_gap_summary.csv](../tools/outputs/lpb/dungeon_terminal_warp_contract_20260619/local_gap_summary.csv)
- [transporter_mentions.csv](../tools/outputs/lpb/dungeon_terminal_warp_contract_20260619/transporter_mentions.csv)
- [bridge_queue.csv](../tools/outputs/lpb/dungeon_terminal_warp_contract_20260619/bridge_queue.csv)

## 2026-06-20 Object Route Audit

- Presence split is now clearer: `GimmickTerminal`, `GimmickWarp`, `GimmickExitRect`, `RaidDungeonWarp`, `RaidDungeonLight`, `RaidDungeonBarrier`, `RaidDungeonPoster`, `RaidDungeonExit`, `InstanceRaidExit`, `PrivateAreaPastExit`, and `RaidDungeonRect` exist locally, but only Toto-Rak photocells/barriers and `PrivateAreaPastExit` have strong binding proof today.
- `TalkCommand` must not generic-route Toto-Rak `RaidDungeonLight`, `RaidDungeonBarrier`, or `RaidDungeonPoster` into `GimmickTerminal`; those are object-owned state machines with photocell count, barrier animation, and poster row behavior.
- `RaidDungeonWarp` is not `GimmickWarp` or `GimmickTerminal`: it has text bank `6781/raidDungeonWarp`, scheduler `67493888`, prompt shape `askExtendWidget(self, 2, 2, 1, 2)`, and a content-return helper.
- `GimmickWarp` stays separate for generic warp/quicksand prompts: text bank `10112/gimmickWarp`, mode rows `1-3`, `4-6`, `7-9`, and quicksand message `52067`.
- Exit rectangles are push/notice/rect-owned, not talk-owned by default: `PrivateAreaPastExit`, `GimmickExitRect`, `RaidDungeonExit`, and `InstanceRaidExit` need separate movement/cleanup validation.
- Recovered but locally absent adjacent raid objects remain `RaidDungeonHeadCount`, `RaidDungeonTreasureBox`, and `InstanceRaidTreasureBox`; keep treasure/headcount work out of generic terminal routing.
## 2026-06-20 Binding Proof Addendum

- `1200226` is strong proof for Toto-Rak photocells: `/Chara/Npc/Object/RaidDungeonLight`, class row present, and spawn rows exist.
- `1200228` is strong proof for barrier terminals: `/Chara/Npc/Object/RaidDungeonBarrier`, class row present, spawn rows exist, and map-object rows bind barrier animation targets.
- `1200227` is only partial proof for poster/device notes: `/Chara/Npc/Object/RaidDungeonPoster` and quest marker evidence exist, but no direct spawn row was found in the current snapshot.
- `1200373..1200375` remain magitek visual/model leads only: `~~~magitek???~~~` class rows and appearance `20988` are present, but spawn rows are missing.
- `GimmickTerminal` is read-only text (`10096/gimmickTerminal`, rows `1/2`); `GimmickWarp` is generic configured-route warp (`10112/gimmickWarp`, modes `1/2/3`, quicksand message `52067`); `RaidDungeonWarp` is the dedicated transporter (`6781/raidDungeonWarp`, scheduler `67493888`, `askExtendWidget(self, 2, 2, 1, 2)`).
- `TalkCommand` target-param/owner capture remains required before routing production interactions. Otherwise `currentEventOwner` can stay on the command actor instead of the NPC/object.

## 2026-06-20 Terminal Capture Addendum

- Toto-Rak photocells, barriers, and posters are implementation baselines now: local Lua plus C# party/content state exist for those mechanics. Treat them as regression tests for any TalkCommand or terminal-routing work.
- `1200373..1200375` remain visual/model leads only: class, appearance, and GM bg-model evidence exist, but no spawn or map-object rows bind them to a transporter.
- `RaidDungeonWarp` local/recovered behavior is present, but actor binding and live destination validation are still missing. `UseRaidDungeonWarp` fallback can mask missing return-point capture by still moving the player to the Toto-Rak entrance.
- Strong SQL binding remains limited to Toto-Rak `1200226` photocells and `1200228` barriers. `1200227` poster has class/script proof only in the current snapshot.
- Keep `GimmickTerminal`, `GimmickWarp`, and `RaidDungeonWarp` separate until `TalkCommand` / `PlaceDrivenCommand` captures prove owner lanes.
- Next capture is not implementation: log `24101` target params and `24301/30004` touch params around real transporter interactions, then fix `PlaceDrivenCommand` cleanup/debug issues before adding any narrow transporter branch. This is the lowest-blast-radius way to unblock magitek terminal routing.
- Regression baseline for terminal work must include Toto-Rak photocell, barrier, poster, `RaidDungeonWarp`, and content return/re-entry cleanup.

## 2026-06-21 Transport/Command Capture Update

- `RaidDungeonWarp` remains the dedicated magitek transporter candidate: recovered text `6781/raidDungeonWarp`, scheduler `67493888`, prompt `askExtendWidget(self, 2, 2, 1, 2)`, and local `CanUseRaidDungeonWarp` / `UseRaidDungeonWarp` bridge.
- `GimmickTerminal` is read-only rows from `10096/gimmickTerminal`; it is not a stateful dungeon terminal. `GimmickWarp` is a generic configured-route prompt and remains separate from `RaidDungeonWarp`.
- Do not bind actor classes `1200373..1200375` yet. They remain visual/model leads with no proven spawn binding or touch route.
- Do not wire `24301/30004` yet. Recovered place/touch flow uses static actor `24301`, command `30004`, and instance-raid touch state `1/2`, but local `PlaceDrivenCommand.lua` is still gathering/push-oriented, has a debug print, and has a lowercase `player:endEvent()` hazard.
- `30003/30004` are overloaded: recovered client scripts use them as place/touch variation payloads, while local C# also uses `30003/30004` as content-group constants. Treat those numbers as context fields, not globally unique command meanings.
- Capture-first fields for real transporter probes: owner class/path, command id, variation/subvariation, event type, params, script args, unique id, push data, map-object layout/instance, private-area/content id, and saved return point.

## High-Signal Functions

| surface | role | qualified_function | text_loads | ask_extend_args | scheduler_ids | client_calls | game_messages | player_calls | npc_calls | note |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Generic terminal | client | GimmickTerminal.eventTalkTerminal |  |  |  |  |  |  |  | Read-only GimmickTerminal text contract. |
| Generic terminal | local | onEventStarted |  |  |  | eventTalkTerminal(textRow) |  | EndEvent |  | Local read-only terminal script; actor binding remains unresolved. |
| Dungeon warp device | client | RaidDungeonWarp.activateWarpDevice |  |  | 67493888 |  |  |  |  | Recovered magitek transporter contract. |
| Dungeon warp device | client | RaidDungeonWarp.askYesNo |  | A0_3, 2, 2, 1, 2 |  |  |  |  |  | Recovered magitek transporter contract. |
| Dungeon warp device | local | onEventStarted |  |  |  | activateWarpDevice(); askYesNo(enabled) |  | EndEvent |  | Local transporter script; actor binding/destination remains unresolved. |
| Toto-Rak photocell | client | RaidDungeonLight.askYesNo |  | A0_3, 1, 2, 1, 1 |  |  |  |  |  | Recovered photocell prompt and text sheet contract. |
| Toto-Rak photocell | local | onEventStarted |  |  |  | askYesNo() | MSG_PHOTOCELL_OBTAINED=52023; MSG_PHOTOCELL_COUNT=52024 | CollectTotorakPhotocell; SendGameMessage; EndEvent | GetUniqueId; Despawn | Local photocell collection implementation. |
| Toto-Rak barrier terminal | client | RaidDungeonBarrier.askYesNo |  | A0_3, 2, 2, 1, 1 |  |  |  |  |  | Recovered barrier terminal prompt/read contract. |
| Toto-Rak barrier terminal | local | onEventStarted |  |  |  | askYesNo() | MSG_PHOTOCELLS_INSERTED=52025; MSG_PHOTOCELL_COUNT=52024 | IsTotorakBarrierOpen; EndEvent; GetTotorakPhotocellCount; SpendTotorakPhotocells; SetTotorakBarrierOpen; SendGameMessage | GetUniqueId; PlayMapObjAnimation | Local photocell-spend and barrier animation implementation. |
| Toto-Rak poster/device notes | client | RaidDungeonPoster.eventTalkRead |  |  |  |  |  |  |  | Recovered poster/device read contract. |
| Toto-Rak poster/device notes | local | onEventStarted |  |  |  | eventTalkRead(getPosterIndex(npc) |  | EndEvent |  | Local poster index bridge into eventTalkRead. |

## Object Map Focus

| record_type | actor_class_id | actor_path | spawn_id | unique_id | zone_id | position | layout_id | instance_id | note |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| actor_class | 1200226 | /Chara/Npc/Object/RaidDungeonLight |  |  |  |  |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3017 | fstdun3_photocell_first_1 | 159 | 1013.376,-39.033,655.838 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3018 | fstdun3_photocell_first_2 | 159 | 1028.583,-39.000,715.237 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3019 | fstdun3_photocell_first_3 | 159 | 1015.525,-42.716,868.086 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3020 | fstdun3_photocell_first_4 | 159 | 1141.456,-44.933,755.754 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3021 | fstdun3_photocell_shaula_1 | 159 | 1204.460,-50.443,619.273 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3022 | fstdun3_photocell_shaula_2 | 159 | 1241.639,-48.765,648.973 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3023 | fstdun3_photocell_shaula_3 | 159 | 1222.746,-51.057,622.052 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3024 | fstdun3_photocell_shaula_4 | 159 | 1278.979,-58.029,620.939 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3025 | fstdun3_photocell_sargas_1 | 159 | 1265.250,-54.001,691.356 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3026 | fstdun3_photocell_sargas_2 | 159 | 1317.279,-53.382,708.558 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3027 | fstdun3_photocell_sargas_3 | 159 | 1383.185,-55.106,713.024 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3028 | fstdun3_photocell_sargas_4 | 159 | 1327.079,-55.032,745.965 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3029 | fstdun3_photocell_antares_1 | 159 | 1172.341,-41.997,827.584 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3030 | fstdun3_photocell_antares_2 | 159 | 1274.352,-54.526,792.363 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3031 | fstdun3_photocell_antares_3 | 159 | 1225.664,-52.712,748.282 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| spawn_location | 1200226 |  | 3032 | fstdun3_photocell_antares_4 | 159 | 1204.630,-45.315,900.182 |  |  | RaidDungeonLight photocell; real fstdun3_photocell spawns. |
| actor_class | 1200227 | /Chara/Npc/Object/RaidDungeonPoster |  |  |  |  |  |  | RaidDungeonPoster/device notes; class exists but no direct spawn row found in this pass. |
| actor_class | 1200228 | /Chara/Npc/Object/RaidDungeonBarrier |  |  |  |  |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| map_object | 1200228 |  | 919 | fstdun3_barrier_tornsrest | 159 | 1119.88,-44.125,880.115 | 313 | 3580 | Map-object backing for Toto-Rak barrier animation. |
| map_object | 1200228 |  | 920 | fstdun3_barrier_foolsrest_east | 159 | 1150.34,-47.975,687.889 | 313 | 3583 | Map-object backing for Toto-Rak barrier animation. |
| map_object | 1200228 |  | 921 | fstdun3_barrier_foolsrest_west | 159 | 1120.43,-48.125,688.064 | 313 | 3585 | Map-object backing for Toto-Rak barrier animation. |
| map_object | 1200228 |  | 922 | fstdun3_barrier_seraucheforne | 159 | 1223.84,-52,816.426 | 313 | 3587 | Map-object backing for Toto-Rak barrier animation. |
| map_object | 1200228 |  | 923 | fstdun3_barrier_bergand_north | 159 | 1262.39,-55.991,743.272 | 313 | 3589 | Map-object backing for Toto-Rak barrier animation. |
| map_object | 1200228 |  | 924 | fstdun3_barrier_bergand_east | 159 | 1279.77,-56.076,751.932 | 313 | 3591 | Map-object backing for Toto-Rak barrier animation. |
| map_object | 1200228 |  | 925 | fstdun3_barrier_joukil | 159 | 1232.05,-52.125,672.751 | 313 | 3593 | Map-object backing for Toto-Rak barrier animation. |
| spawn_location | 1200228 |  | 919 | fstdun3_barrier_tornsrest | 159 | 1119.88,-44.125,880.115 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| spawn_location | 1200228 |  | 920 | fstdun3_barrier_foolsrest_east | 159 | 1150.34,-47.975,687.889 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| spawn_location | 1200228 |  | 921 | fstdun3_barrier_foolsrest_west | 159 | 1120.43,-48.125,688.064 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| spawn_location | 1200228 |  | 922 | fstdun3_barrier_seraucheforne | 159 | 1223.84,-52,816.426 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| spawn_location | 1200228 |  | 923 | fstdun3_barrier_bergand_north | 159 | 1262.39,-55.991,743.272 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| spawn_location | 1200228 |  | 924 | fstdun3_barrier_bergand_east | 159 | 1279.77,-56.076,751.932 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| spawn_location | 1200228 |  | 925 | fstdun3_barrier_joukil | 159 | 1232.05,-52.125,672.751 |  |  | RaidDungeonBarrier terminal; real fstdun3_barrier spawns and map objects. |
| actor_class | 1200373 | ~~~magitek???~~~ |  |  |  |  |  |  | Unresolved ~~~magitek???~~~ actor-class lead for RaidDungeonWarp/GimmickWarp; GM bg model group 988. |
| actor_class | 1200374 | ~~~magitek???~~~ |  |  |  |  |  |  | Unresolved ~~~magitek???~~~ actor-class lead for RaidDungeonWarp/GimmickWarp; GM bg model group 988. |
| actor_class | 1200375 | ~~~magitek???~~~ |  |  |  |  |  |  | Unresolved ~~~magitek???~~~ actor-class lead for RaidDungeonWarp/GimmickWarp; GM bg model group 988. |

## Local Gap

| surface | local_path | exists | status | call_client_functions | game_messages | player_or_zone_helpers | note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Generic terminal | Data\scripts\base\chara\npc\gimmick\GimmickTerminal.lua | True | implemented; binding unresolved | eventTalkTerminal |  |  | Local read-only terminal script exists; actor class/spawn binding is still unresolved. |
| Dungeon warp device | Data\scripts\base\chara\npc\object\RaidDungeonWarp.lua | True | implemented; binding unresolved | activateWarpDevice; askYesNo |  |  | Local transporter script exists and calls CanUseRaidDungeonWarp/UseRaidDungeonWarp; actor class/spawn binding and destination v... |
| Toto-Rak photocell | Data\scripts\base\chara\npc\object\RaidDungeonLight.lua | True | implemented | askYesNo | 52023; 52024 | CollectTotorakPhotocell | Collects party photocell state and despawns collected object. |
| Toto-Rak barrier terminal | Data\scripts\base\chara\npc\object\RaidDungeonBarrier.lua | True | implemented | eventTalkRead; askYesNo | 52024; 52025 | GetTotorakPhotocellCount; SpendTotorakPhotocells; SetTotorakBarrierOpen; IsTotorakBarrierOpen | Requires four photocells, spends party state, and hides map object. |
| Toto-Rak poster/device notes | Data\scripts\base\chara\npc\object\RaidDungeonPoster.lua | True | implemented | eventTalkRead |  |  | Extracts poster index from unique ID and calls eventTalkRead. |
| Toto-Rak player state | Map Server\Actors\Chara\Player\Player.cs | True | helper exists |  |  | CollectTotorakPhotocell; GetTotorakPhotocellCount; SpendTotorakPhotocells; SetTotorakBarrierOpen; IsTotorakBarrierOpen | Party-scoped photocell count/spend/barrier-open helpers exist. |
| Zone/content transitions | Map Server\WorldManager.cs | True | helper exists |  |  | DoZoneChangeContent; DoZoneChange | DoZoneChange, DoZoneChangeContent, and Toto-Rak return helpers exist. |

## Transporter Evidence

| source | source_line | row_id | surface_hint | english_summary |
| --- | --- | --- | --- | --- |
| docs\Dat Mining\com5g0.csv | 23 | 23 | RaidDungeonWarp/magitek transporter | Quest text says a deep-dungeon magitek transporter can return players to the entrance/exit. |
| docs\Dat Mining\com5g0.csv | 42 | 43 | RaidDungeonWarp/magitek transporter | Magitek transporter mention. |
| docs\Dat Mining\com5g1.csv | 30 | 33 | RaidDungeonWarp/magitek transporter | Magitek transporter mention. |
| docs\Dat Mining\com5l0.csv | 38 | 38 | RaidDungeonWarp/magitek transporter | Quest text says a deep-dungeon magitek transporter can return players to the entrance/exit. |
| docs\Dat Mining\com5l0.csv | 39 | 39 | RaidDungeonWarp/magitek transporter | Magitek transporter mention. |
| docs\Dat Mining\com5l1.csv | 31 | 34 | RaidDungeonWarp/magitek transporter | Quest text says a deep-dungeon magitek transporter can return players to the entrance/exit. |
| docs\Dat Mining\com5u0.csv | 29 | 30 | RaidDungeonWarp/magitek transporter | Quest text says a deep-dungeon magitek transporter can return players to the entrance/exit. |
| docs\Dat Mining\com5u1.csv | 28 | 32 | RaidDungeonWarp/magitek transporter | Quest text says a deep-dungeon magitek transporter can return players to the entrance/exit. |
| docs\Dat Mining\gimmickWarp.csv | 3 | 1 | RaidDungeonWarp/magitek transporter | Prompt asks whether to activate the magitek transporter. |
| docs\Dat Mining\raidDungeonWarp.csv | 3 | 1 | RaidDungeonWarp/magitek transporter | Disabled transporter text. |
| docs\Dat Mining\raidDungeonWarp.csv | 4 | 2 | RaidDungeonWarp/magitek transporter | Prompt asks whether to activate the magitek transporter. |

## Bridge Queue

| priority | surface | target | evidence | implementation_note |
| --- | --- | --- | --- | --- |
| 1 | Keep Toto-Rak mechanics separate | RaidDungeonLight/RaidDungeonBarrier/RaidDungeonPoster | Actor classes 1200226/1200227/1200228 and fstdun3 spawns already map to concrete local scripts. | Do not replace these with generic GimmickTerminal. They own photocell count, barrier state, map-object hide animation, and post... |
| 2 | Validate RaidDungeonWarp local bridge | Data/scripts/base/chara/npc/object/RaidDungeonWarp.lua | Recovered client contract is text bank 6781, scheduler 67493888, and askExtendWidget(self, 2, 2, 1, 2). | Local script now calls activateWarpDevice, askYesNo(enabled), and UseRaidDungeonWarp on choice 1; next proof is actor/spawn bin... |
| 3 | Resolve warp actor bindings | Actor classes 1200373/1200374/1200375 | SQL marks these as ~~~magitek???~~~; GM bg model group 988 also maps to these three actor classes. | Find real spawn/instance placement or add explicit Darkhold transporter spawns before wiring a destination. |
| 4 | Bind generic terminal only for read-only devices | Data/scripts/base/chara/npc/gimmick/GimmickTerminal.lua or compatible object script | Recovered GimmickTerminal only loads 10096/gimmickTerminal and worldMaster:say(dynamic text id). | Local read-only script now exists; use it only for non-Toto-Rak terminals or quest devices that need rows 1/2, and keep statefu... |
| 5 | Toto-Rak polish | World messages 52016/52023-52031/52069 and poster rows 8-10 | Current local scripts send 52023/52024/52025 but DAT has additional terminal activation/progress messages. | After warp coverage, consider whether barrier activation should emit extra 52026-52031/52069 feedback for retail parity. |

## Implementation Notes

1. Keep `RaidDungeonWarp.lua` as a small local script, not as a replacement for Toto-Rak photocell/barrier scripts.
2. Keep the prompt contract exact: `activateWarpDevice`, then `askYesNo(enabled)`, then perform the server-side warp only on choice `1`.
3. Use existing `WorldManager` zone/content helpers for movement, but require explicit destination mapping for each warp actor or unique ID.
4. Treat `1200373`-`1200375` as unresolved visual/model leads until real placement data is recovered or live-tested.
5. Baseline Toto-Rak photocell/barrier/poster and `PrivateAreaPastExit` before enabling TalkCommand terminal routing; regression-test them after each generic terminal or transporter change.

## 2026-06-21 Terminal / Transport Split Update

- `RaidDungeonWarp` is the recovered magitek transporter lane: text bank `6781`, scheduler `67493888`, and yes/no prompt `askExtendWidget(self, 2, 2, 1, 2)`. Local `RaidDungeonWarp.lua` is the correct bridge shape, but binding/destination remain unresolved.
- `GimmickTerminal` is read-only text: recovered behavior loads `10096/gimmickTerminal` and says a row. Do not use it for photocell, barrier, transporter, or mutable dungeon state.
- `GimmickWarp` is a separate generic movement/quicksand lane with its own route data. Do not merge it into `RaidDungeonWarp` without actor-owned route capture.
- Toto-Rak photocells and barriers are strong local proof because actor classes, spawn rows, map-object rows, and C#/Lua state helpers exist. Keep those object-specific scripts separate from generic terminal routing.
- Magitek visual leads `1200373..1200375` remain visual/model leads only. SQL class/appearance evidence plus GM model group `988` is not enough to enable a production transporter.
- Map-object packet anchors for future probes: `SetActorBGProperties 0x00D8` and `PlayBGAnimation 0x00D9`. Current BG animation names are short local strings, so scheduler/name-length capture matters before porting recovered map-object scripts.
- `UseRaidDungeonWarp` fallback movement is not transporter binding proof. It can fall back to a public Toto-Rak entrance path when return-point proof is missing, so every magitek transporter needs explicit actor/unique-id destination mapping.
