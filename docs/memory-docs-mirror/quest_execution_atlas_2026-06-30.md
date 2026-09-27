# Quest Execution Atlas: Cutscenes, Instances, Fights - 2026-06-30

This pass adds a generated atlas for the practical quest question: what recovered event method should be pushed, what cutscene keys does it play, which ones already have local `delegateEvent` callers, and which dungeon/fight/content paths still need runtime bridge work.

Generated files:

- `tools/build_quest_execution_atlas.py`
- `outputs/quest-execution-atlas-20260630/README.md`
- `outputs/quest-execution-atlas-20260630/quest_event_cutscene_push_map.csv`
- `outputs/quest-execution-atlas-20260630/scene_bearing_events_needing_local_push.csv`
- `outputs/quest-execution-atlas-20260630/after_warp_cutscene_events.csv`
- `outputs/quest-execution-atlas-20260630/quest_execution_summary_by_code.csv`
- `outputs/quest-execution-atlas-20260630/quest_execution_priority_queue.csv`
- `outputs/quest-execution-atlas-20260630/local_delegate_event_callers.csv`
- `outputs/quest-execution-atlas-20260630/scene_key_index.csv`
- `outputs/quest-execution-atlas-20260630/content_launch_calls.csv`

Regenerate with:

```powershell
python tools\build_quest_execution_atlas.py --output outputs\quest-execution-atlas-20260630
```

## Current Snapshot

The atlas was generated from recovered quest scenario Lua, local Lua scripts, `Data/sql/gamedata_quests.sql`, and DAT `cutReplay.csv`.

| Output signal | Count |
| --- | ---: |
| Recovered event/push rows | 760 |
| Scene events needing local push | 382 |
| After-warp or branching scene events | 287 |
| Quest summary rows | 178 |
| Priority queue rows | 117 |
| Local `delegateEvent` callsites | 1667 |
| Scene keys indexed | 533 |
| Content/launch callsites | 346 |

Fade modes in recovered event bodies:

| Fade mode | Count |
| --- | ---: |
| `after_warp` | 277 |
| `default` | 265 |
| `none` | 187 |
| `branch_or_mixed_default_and_after_warp` | 27 |
| `fade_out_only` | 4 |

## Cutscene Push Contract

The common delegated quest-method shape is:

```lua
callClientFunction(player, "delegateEvent", player, quest, "processEvent020", ...)
```

That wrapper is not just syntactic sugar, but the ownership model is easy to say wrong: `quest` is the delegated target, not usually the active event owner. The active owner is normally the NPC/object/director event the client already started. `KickEvent` only asks the client to start that event; ownership is recorded after the client replies with `EventStartPacket`.

A raw `player:RunEventFunction("processEvent020")` is not equivalent for quest scene bodies unless the active owner, event name, and event type are already correct. After `EndEvent`, it will use owner `0`, empty event name, and type `0`.

Known mode families:

| Family | Recovered/local shape | Client cutscene mode |
| --- | --- | ---: |
| Normal quest scene | `startNQCutScene(sceneKey, modeArg, ...)` | 61 |
| HQ quest scene | `startHQCutScene(sceneKey, modeArg, ...)` | 62 |
| SNPC quest scene | `startSnpcNQCutScene` / `startSnpcHQCutScene` | 61 or 62 |
| Modern instance raid | `InstanceRaidBaseClass.cutSceneEvent` | 63 |
| Legacy occupancy dungeon | occupancy director plus raid widget | 61-ish legacy lane |

Important ordering rules:

- Treat `push_recipe` as the owner/method shape, not always a complete no-argument call.
- For local implementation, use the runtime deep atlas columns `active_owner_kind`, `active_event_type_expected`, `wait_recipe`, and `end_event_policy`.
- Natural talk/push flows should run from `onEventStarted`; server-initiated director scenes should wait through `kickEventContinue` or another confirmed event-start path before running the delegated method.
- Check `args`, `arg_count`, and `extra_arg_count_guess` before wiring a missing local push. Recovered argument names are obfuscated, but nonzero extra args are a warning that the caller probably needs event-specific values.
- Rows with `fade_mode = after_warp` or `branch_or_mixed_default_and_after_warp` need the warp/fade finalizer kept alive. Do not end the event early, and do not detach the quest owner before the after-warp fade-in runs.
- `cutReplay.csv` proves replay/discovery rows for many scene keys, but replay rows are not the launch authority for live quest events.
- Existing local examples are in `local_delegate_event_callers.csv`; use those before inventing a new caller shape.

One newly confirmed hazard: some local scripts pass scene keys as delegate method names. Those keys have assets/replay rows, but the recovered callable method is different. The runtime deep atlas found 30 of these in `outputs/quest-runtime-deep-atlas-20260630/scene_key_delegate_aliases.csv`; examples include `com0g105 -> processEventUrianger`, `com0l105 -> processEvent_020`, `com0u105 -> processEvent_020`, and `man30000 -> processEvent000`.

## How To Use The Atlas

Start with `quest_execution_priority_queue.csv` when choosing implementation order. It is sorted by missing local scene pushes, after-warp risk, and scene count.

Use `quest_event_cutscene_push_map.csv` for the exact event method row:

- `code`, `quest_id`, `quest_name`, `class_name`: quest identity.
- `function`, `event_method`, `function_line`: recovered method to inspect.
- `args`, `arg_count`, `extra_arg_count_guess`: argument-shape warning.
- `scene_keys`, `scene_calls`, `cutReplay_rows`: cutscene data.
- `fade_mode`, `has_fade_out`, `has_warp_or_content`: lifecycle risk.
- `local_delegate_count`, `local_delegate_callers`: existing local coverage.
- `push_recipe`, `risk_notes`: first-pass implementation hint.

Use focused tables for implementation:

- `scene_bearing_events_needing_local_push.csv`: recovered scenes with no matching local caller yet.
- `after_warp_cutscene_events.csv`: rows that need the strictest event/warp ordering.
- `scene_key_index.csv`: scene key to quest/function/replay lookup.
- `content_launch_calls.csv`: local content, private-area, dungeon, director, and raw event launch clues. Commented clues are marked with `is_commented = yes`.

## Highest Cutscene Push Targets

Top rows from the current priority queue are mostly dense class/crafting/main-scenario scene flows. These are high value for cutscene push coverage, but not all are combat quests.

| Code | Quest | Missing scene pushes | After-warp rows | Notes |
| --- | --- | ---: | ---: | --- |
| `pgl306` | Two Sides to Every Chip | 10 | 6 | many scenes, no local push |
| `cnj306` | The Call of Nature | 10 | 5 | many scenes, no local push |
| `man406` | Futures Perfect | 8 | 6 | dense main scenario scene flow |
| `gla300` | Unalienable Rights | 8 | 5 | class quest scene batch |
| `cul306` | Something in the Soup | 8 | 5 | crafting quest scene batch |
| `man308` | Lord Errant | 8 | 4 | main scenario scene batch |
| `lnc300` | Culture Shock | 8 | 4 | class quest scene batch |
| `fsh300` | The Beast of the Barrel | 8 | 4 | gathering quest scene batch |
| `pgl300` | Here There Be Pirates | 8 | 2 | class quest scene batch |
| `min300` | Little Saboteurs | 7 | 6 | gathering quest scene batch |
| `man300` | Toll of the Warden | 7 | 6 | main scenario scene batch |

Job quest cutscene gaps are visible too, including `pld0j6`, `blm0j6`, `drg0j6`, `brd0j4`, `whm0j6`, `mnk0j6`, `pld0j5`, `pld0j1`, `blm0j1`, `war0j6`, `drg0j1`, and `brd0j6`. These should stay rewards-disabled/log-only until the combat side is proven.

## Fight And Director Lanes

### SimpleQuestBattle

`SimpleQuestBattle` remains the big fight bridge gap. Recovered base and children exist under:

- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/simplequestbattle`
- `tools/outputs/lpb/simple_quest_battle_director_contract_20260619/simplequestbattle_director_inventory.csv`
- `tools/outputs/lpb/simple_quest_battle_director_contract_20260619/local_gap_matrix.csv`

Local adapter coverage is effectively zero. Do not broad-enable all recovered child directors first. Prove one GM-only lifecycle:

1. create private content
2. bind director ownership
3. start director/content group
4. spawn the selected BNPC
5. route `HandleBNpcKill`
6. finish content
7. return/cleanup
8. handle give-up/cancel

Best smoke anchor is still `Man0u0` (`110009`, Flowers for All). It is bespoke local content, not SQB, but it already proves the runtime pieces: `CreateContentArea`, `SimpleContent30079`, `QuestDirectorMan0u001`, enemy spawn, kill callback, `ContentFinished`, and return warp.

First real SQB targets after the smoke test:

- `Com0g1`
- `Com0l1`
- `Com0u1`

Preserve explicit client quest-id overrides before generating child shims:

- `com0l6 -> 111406`
- `com0u5 -> 111805`
- `etc3g2 -> 110736`

### Bespoke Man Fights

The local `Man*` fights are handwritten simple content, not recovered SQB.

Known local simple content families:

- `Man0l0` -> `SimpleContent30002` / `QuestDirectorMan0l001`
- `Man0g0` -> `SimpleContent30010` / `QuestDirectorMan0g001`
- `Man0u0` -> `SimpleContent30079` / `QuestDirectorMan0u001`
- `Man200` -> `SimpleContent30080` / `QuestDirectorEventMan20001`
- `Man2g0` -> `SimpleContentMan2g01` / `QuestDirectorMan2g001`

`Man2g0` (`110008`, Beckon of the Elementals) is explicitly WIP. It spawns the Spirit of the Wood as a generic actor, prints a WIP combat message, and advances after a timer. Treat it as a bespoke fight implementation target: convert the target to combat-capable spawn data, add kill/fail/completion handling, and remove timed auto-progress.

### BNPC Objective Data

BNPC kill routing depends on actor class id and director ownership:

- `BattleNpc` calls `HandleBNpcKill(GetActorClassId())`.
- `Player` forwards kill handling to quest scripts and owned directors.
- Director ownership must be correct before expecting kill callbacks to land.

The BNPC data ledger still has uneven coverage: 41 quest BNPC rows, 8 with ambient spawn joins, and 33 with no matching mob type. Fill mob type data only for the selected target first.

Low-risk BNPC objective validation targets with ambient spawns:

- `Etc1g4`
- `Etc1u1`
- `Etc1u5`
- `Etc1u6`
- `Etc2l0`
- `Etc2u2`
- `Wld0g1`
- `Wld0g4`

## Dungeon And Instance Lanes

### Toto-Rak

Toto-Rak is the only locally real-ish dungeon launcher. The quest/NPC side routes Bloisirant and related GC quest scripts into `TotorakTryStartFromNpc`.

Important local pieces:

- `Data/scripts/totorak_entry.lua`
- `Data/scripts/quests/dft/DftFst.lua`
- `Data/scripts/commands/gm/totorak.lua`
- `Map Server/WorldManager.cs`
- `Data/scripts/occupancy_dungeon_widget.lua`

Current toggles mean the NPC path defaults to a debug/simple-content copy, not the full retail party-checked C# launcher:

- `TOTORAK_NPC_ENTRY_WIDGET_ENABLED = false`
- `TOTORAK_NPC_SAFE_SOLO_AFTER_WIDGET_ENABLED = true`

The stronger C# path exists for content id `1`: it creates `PrivateAreaContent`, enables instance raid bind, copies public spawns, starts `Occupancy/RaidFst0Dungeon03`, registers re-entry, then zones the player into content.

### Modern InstanceRaid

Recovered `InstanceRaidGuideBaseClass.askEnterInstanceRaid(raidId)` is only a yes/no prompt. It does not create content or launch the instance by itself.

Recovered `InstanceRaidBaseClass.startEvent` is the modern duty HUD/start path. The local wrapper partially mirrors this with `_setInstanceRaid`, `startEvent`, `reloginEvent`, `clearEvent`, `failedEvent`, and `cutSceneEvent`.

Known content ids from recovered/raw docs:

| Content id | Content |
| ---: | --- |
| 1 | Toto-Rak |
| 2 | Dzemael |
| 3 / 4 / 14 | Ifrit tiers |
| 5 | Thornmarch |
| 6 | Aurum Vale |
| 7 | Cutter's Cry |
| 8 / 9 / 10 | Hamlet Defense |
| 11 / 12 | Garuda tiers |
| 13 | Castrum Novum |
| 15 / 16 | Rivenroad |

Main blocker: guide acceptance still needs a server/native bridge that resolves content config, creates the content area, binds the modern `InstanceRaid` director, zones entrants, and sends `startEvent`.

Secondary blockers:

- `ContentCommand.lua` is absent locally, while recovered command rows `24301` and `24302` depend on director work/content command state.
- `RaidDungeonWarp`, `RaidDungeonExit`, and `InstanceRaidExit` object placement/binding is not proven for production SQL.
- Clear/fail/finalization is partial. Boss clear, loot, reward, and result-window authority still need a retail-complete path.

## Raw DAT Joins To Keep Using

The raw DAT pool under `docs/Dat Mining` is still the best source for quest-wide joins.

Recommended joins:

- Quest dimension: `Data/sql/gamedata_quests.sql`, joined to `quest.csv` / `xtx_quest.csv` by quest id.
- Scene calls: `quest_event_cutscene_push_map.csv` or older `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutscene_calls.csv`.
- Scene replay: `cutReplay.csv`, where `replay_id // 100 = questId` and `replay_id % 100 = scene slot`.
- Scene assets: `tools/outputs/lpb/content_systems_20260612/cutscene_key_crosscheck.csv`.
- Markers: `quest_marker.csv`, where current code uses `floor(markerId / 100)` as quest id.
- Rewards: prefer `Data/sql/gamedata_quest_rewards.sql`; keep raw `quest_new_reward.csv` and `quest_reward.csv` for provenance.
- Actors/events: parse local `quest:SetENpc(actorClassId, ...)`, then join actor class id to `Data/sql/gamedata_actor_class.sql`.
- Dungeon ids/names: `docs/Dat Mining/xtx_raidDungeon.csv`.

## Recommended Next Slices

1. Build a GM-only quest cutscene probe that takes quest code and event method, checks the atlas row, and pushes via `delegateEvent` only when the active owner/context is valid.
2. Implement one dense cutscene-only quest batch from `scene_bearing_events_needing_local_push.csv`, preferably not a reward/fight-heavy quest.
3. Add after-warp smoke tests for one low-risk row before broad enabling after-warp scenes.
4. Prove the SQB lifecycle with `Man0u0` as the runtime anchor, then port one of `Com0g1`, `Com0l1`, or `Com0u1`.
5. Convert `Man2g0` from timed fake progress into a real bespoke fight.
6. Build the modern InstanceRaid guide acceptance bridge only after Toto-Rak/director ownership cleanup is stable.

## Limitations

- Static matching of local `delegateEvent` callers is heuristic. Check the local file before assuming a row is truly covered or uncovered.
- Recovered argument names are obfuscated. `extra_arg_count_guess` is a warning, not a full semantic decode.
- The atlas cannot prove live event ownership. That has to be validated in runtime smoke tests.
- `content_launch_calls.csv` is a keyword scan. It includes commented clues, marked by `is_commented`, and should be treated as an index into source files rather than proof of active behavior.
