# Quest Runtime Deep Atlas - 2026-06-30

This is the second quest implementation atlas. The first atlas starts from recovered event/cutscene bodies; this one starts from local runtime surfaces and joins them back to recovered data where possible.

Generated files:

- `tools/build_quest_runtime_deep_atlas.py`
- `outputs/quest-runtime-deep-atlas-20260630/README.md`
- `outputs/quest-runtime-deep-atlas-20260630/local_quest_constants.csv`
- `outputs/quest-runtime-deep-atlas-20260630/local_quest_enpc_bindings.csv`
- `outputs/quest-runtime-deep-atlas-20260630/local_delegate_push_calls.csv`
- `outputs/quest-runtime-deep-atlas-20260630/scene_key_delegate_aliases.csv`
- `outputs/quest-runtime-deep-atlas-20260630/unmatched_active_delegate_calls.csv`
- `outputs/quest-runtime-deep-atlas-20260630/local_event_lifecycle_actions.csv`
- `outputs/quest-runtime-deep-atlas-20260630/local_content_area_launches.csv`
- `outputs/quest-runtime-deep-atlas-20260630/local_content_spawns.csv`
- `outputs/quest-runtime-deep-atlas-20260630/simplequestbattle_targets.csv`
- `outputs/quest-runtime-deep-atlas-20260630/instance_raid_content_ids.csv`
- `outputs/quest-runtime-deep-atlas-20260630/instance_raid_launch_profiles.csv`
- `outputs/quest-runtime-deep-atlas-20260630/dat_instance_guide_text.csv`

Regenerate with:

```powershell
python tools\build_quest_runtime_deep_atlas.py --output outputs\quest-runtime-deep-atlas-20260630
```

## Runtime Snapshot

| Output signal | Count |
| --- | ---: |
| Local quest constants | 2202 |
| Local `SetENpc` bindings | 1339 |
| Local `delegateEvent` calls | 1690 |
| Scene-key delegate aliases | 5 |
| Unmatched active delegate calls | 1364 |
| Event/director/content lifecycle actions | 1688 |
| Local content area launches | 10 |
| Local content spawns | 13 |
| SimpleQuestBattle target rows | 61 |
| Instance/raid content id rows | 16 |
| Instance/raid launch profile rows | 16 |
| DAT instance guide text rows | 221 |

## Event Ownership Correction

The active event owner is not usually the quest. It is normally the NPC, object, or director whose event the client started. `quest` is the delegated target passed into `delegateEvent`.

Safe shapes:

- Natural talk/push: client starts NPC/object event, `onEventStarted` dispatches into the quest, then the quest calls `callClientFunction(player, "delegateEvent", player, quest, method, ...)`.
- Server/director scene: use `kickEventContinue` or another event-start wait path, then delegate only after the matching `EventStartPacket` has made the director the active owner.
- Director-native calls: `director.SendDirectorEventFunction` is valid for director methods, not a generic quest `processEvent` launcher.

Unsafe shapes:

- `KickEvent` followed immediately by `RunEventFunction` without waiting for event start.
- Raw `player:RunEventFunction("processEvent...")` after `EndEvent`.
- Forcing notice type `5` for natural talk/push flows.
- Ending an event before an after-warp recovered method returns.

The runtime atlas adds these columns to local delegate rows:

- `active_owner_kind`
- `active_event_name_expected`
- `active_event_type_expected`
- `active_event_type_source`
- `wait_recipe`
- `end_event_policy`
- `owner_visibility_precondition`

## Scene-Key Alias Fix Queue

`scene_key_delegate_aliases.csv` is the sharpest new output. These rows pass a cutscene key as the delegate method name. The key may exist in `cutReplay.csv` and client assets, but the recovered callable method is different.

Examples:

| Quest | Bad delegate string | Recovered method | Notes |
| --- | --- | --- | --- |
| `com0g1` | `com0g105` | `processEventUrianger` | branching default/after-warp |
| `com0g1` | `com0g110` | `processEventUriangerMore` | after-warp |
| `com0l1` | `com0l105` | `processEvent_020` | branching default/after-warp |
| `com0l1` | `com0l110` | `processEvent_030` | after-warp |
| `com0u1` | `com0u105` | `processEvent_020` | branching default/after-warp |
| `com0u1` | `com0u110` | `processEvent_030` | after-warp |
| `man300` | `man30000` | `processEvent000` | after-warp |

This is likely why some story/company scenes look wired but do not actually run. Fix these by swapping the delegate method to the recovered method and preserving any required extra args. Do not directly call the scene key unless you are intentionally using a lower-level cutscene probe.

Current alias state:

- The earlier Grand Company alias swaps are now exact delegates or smoke-only rows.
- `scene_key_delegate_aliases.csv` is down to five local rows, all in `man300`.
- The remaining `man300` alias rows are payload-gated and should use `!questevent` plus `!questdelegate` smoke before patching.

Probe before patching:

- `man300`: `processEvent000` and `processEvent010` are safe-looking, but later `pE20/pE30/pE50/pE60` aliases require SNPC cutscene args. `pE40` is already wired with SNPC5 and should be smoke-logged rather than repatched.
- `sqrwa` and `contentsJoinAskInBasaClass` are real inherited/base methods, not alias bugs.
- Director rows in `QuestDirectorMan0g001`, `Man0l001`, `Man0u001`, and `Man2g001` need active director event type `5` through an event-start wait path.

## Local Quest Surface

`local_quest_enpc_bindings.csv` gives the quest actor surface:

- quest code/id/name
- local file/line/function
- nearby sequence expression
- actor constant/expression
- resolved actor class id/path
- display name id
- quest flag expression
- raw `SetENpc` args

This is the table to use when deciding whether a quest step should be talk, push, reward, map-only, or spawn-only. It also shows BNPC objective actor ids in local quest scripts, for example `com0g1` sequence `SEQ_030` binds `BNPC_FAMILIAR = 2202206`.

`local_delegate_push_calls.csv` is the local event-push inventory. Treat rows with `match_kind = event_method` as the cleanest examples, rows with `match_kind = scene_key_alias` as correction targets, and rows with no match as either non-cutscene helper methods or recovered-data gaps needing manual inspection.

## Fights And SQB

The local fight lane is split:

- Bespoke `Man*` content works through `CreateContentArea`, content scripts, local quest directors, spawned enemies, `HandleBNpcKill`, `ContentFinished`, and return warp.
- Recovered `SimpleQuestBattle` has 60 child directors plus a tiny base class, but no local adapter layer yet.

Local content launches found:

- `Man0g0` -> `SimpleContent30010` / `QuestDirectorMan0g001`
- `Man0l0` -> `SimpleContent30002` / `QuestDirectorMan0l001`
- `Man0l1` -> `SimpleContent30002` / `QuestDirectorMan0l101`
- `Man0u0` -> `SimpleContent30079` / `QuestDirectorMan0u001`
- `Man200` -> `SimpleContent30080` / `QuestDirectorEventMan20001`
- `Man2g0` -> `SimpleContentMan2g01` / `QuestDirectorMan2g001`
- Toto-Rak debug content -> `Totorak` / `Instance/Totorak`

Implementation order:

1. Prove `Man0u0` lifecycle: create content, add director, start director/content group, kill, finish, return.
2. Build a GM-only SQB adapter against that lifecycle.
3. First real SQB targets: `com0g1`, `com0l1`, `com0u1`.
4. Fill mob type data only for the selected target.
5. Convert `Man2g0` from timed WIP into a real bespoke fight.
6. Keep job/class/primal rewards disabled/log-only until the fight lifecycle is stable.

`simplequestbattle_targets.csv` already marks `com0g1`, `com0l1`, and `com0u1` as first real targets and preserves explicit quest-id overrides such as `com0l6 -> 111406`, `com0u5 -> 111805`.

## Dungeons And Instances

`instance_raid_content_ids.csv` now contains one row per content id with:

- `content_id`
- `lane`
- `zone_ids`
- `entry_or_guide_actor_sql`
- `guide_script`
- `local_director`
- `recovered_director`
- `csharp_bridge`
- `warp_exit_scripts`
- `object_sql`
- `cutscene_keys`
- `live_literal_keys`
- `launch_blocker`

Key rows:

| ID | Content | Lane | Current blocker |
| ---: | --- | --- | --- |
| 1 | Toto-Rak | local C# plus legacy occupancy | NPC path defaults to safe solo debug; clear/reward/fail/exit partial |
| 2 | Dzemael | legacy occupancy data exists | no C# lifecycle or proven admission |
| 6 | Aurum Vale | modern InstanceRaid | guide prompt only; no create/bind/zone/start bridge |
| 7 | Cutter's Cry | modern InstanceRaid | same as Aurum Vale |
| 8-10 | Hamlet | local C# manager/director | disabled by default; retail HUD/launch experimental |
| 15-16 | Rivenroad | modern InstanceRaid | guide path commented/inert; no launch bridge |
| 13 | Castrum/Beacon | dynamic InstanceRaid | preface args and map-object placements missing |

Shared blocker for non-Toto modern instances: `askEnterInstanceRaid` returns a yes/no result only. It does not resolve content config, create a content area, bind the director, zone entrants, or send `startEvent`.

`instance_raid_launch_profiles.csv` is the implementation-facing checklist for that bridge. It uses three lanes:

- `occupancy_legacy`: Toto-Rak and Dzemael. Toto-Rak has the only C# lifecycle; Dzemael has the Lua occupancy profile but no `StartDzemaelInstance` equivalent.
- `modern_instance_raid`: Ifrit, Thornmarch, AV, Cutter, Garuda, Beacon/Castrum, and Rivenroad. These have wrappers/cutscene evidence but still need admission, private-area, start/relogin, clear/fail/reward, and object-placement profiles.
- `hamlet_defense`: Aleport, Hyrstmill, and Golden Bazaar. Hamlet has its own manager/director/backend and should not be forced through the generic dungeon adapter.

Recovered modern launch signature:

```lua
startEvent(sceneName, owner, modeFlag, contentId, startTime, finishTime, eventType, ...)
```

Local `InstanceRaidBaseClass.lua` already wraps `_setInstanceRaid`, `startEvent`, `reloginEvent`, `clearEvent`, `failedEvent`, and `cutSceneEvent`. The missing piece is the generated C#/data bridge that creates content, binds/reentry state, attaches directors, places objects, and sends the correct profile args.

Concrete profile status:

| ID | Lane | Profile status |
| ---: | --- | --- |
| 1 | `occupancy_legacy` | Toto-Rak profile has display id `2123`, duty zone `159`, source zone `154`, start scene `rad0f300`, mode `true`, event type `1`; normal entry still does not wire modern start/relogin cleanly. |
| 2 | `occupancy_legacy` | Dzemael profile has display id `4102`, duty zone `231`, start scene `rad0r100`; missing C# lifecycle/admission/entry/object/clear data. |
| 6-7 | `modern_instance_raid` | AV/Cutter have guide text and replay candidates; no create/bind/zone/start bridge. |
| 8-10 | `hamlet_defense` | backend mostly present but disabled/experimental; missing production enable and final score/reward parity. |
| 15-16 | `modern_instance_raid` | Rivenroad guide callbacks are commented/inert; exact start args/weather/hard split still missing. |
| 13 | `modern_instance_raid` | Beacon/Castrum has wrapper and preface evidence; dynamic cutscene args and map-object placements still missing. |

## DAT Joins

The DAT helper confirmed the safest rule: SQL quest dimension first, raw DAT second. Marker ids, replay ids, and reward ids have similar numeric shapes but different namespaces.

High-value future generated tables:

- `quest_dimension.csv`: SQL quest row plus local/recovered script presence.
- `quest_marker_join.csv`: marker slot and map data plus local journal marker coverage.
- `quest_cutscene_join.csv`: replay row, scene key, recovered method, fade mode, and local delegate coverage.
- `quest_reward_join.csv`: normalized rewards plus raw provenance.
- `quest_actor_surface_join.csv`: local `SetENpc` actor state, actor class path, event condition names, and spawn availability.
- `quest_runtime_gap_queue.csv`: combined missing local script, alias, marker, reward, BNPC, after-warp, and instance/fight risks.

## Next Implementation Slices

1. Fix scene-key delegate aliases in a tiny batch: `com0g1`, `com0l1`, `com0u1`, then one `man300` row.
2. Add a GM-only runtime probe that refuses to run unless the active owner/type matches the row policy.
3. Prove `Man0u0` fight lifecycle and use it to design SQB adapter scaffolding.
4. Add a focused SQB target for `com0g1` with only the required mob type data.
5. Build a Toto-Rak cleanup slice before generic InstanceRaid launch, because Toto is the only lane with a real C# bridge.
6. After Toto/Dzemael shape is stable, implement the generic modern InstanceRaid acceptance bridge for AV/Cutter/Rivenroad.
