# Of Men They Sing / Man402 Decomp Notes

> Superseded by `of_men_they_sing_man402_decomp_2026-08-14.md`. The quest is now implemented; this file remains as the pre-footage uncertainty record.

Quest:

- `110018`, `Man402`, `Of Men They Sing`, level `42` main scenario.
- Prerequisite: `110017`, `Lord Errant`.
- Current local script: `Data/scripts/quests/man/man402.lua`.
- Recovered client script: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man402.lua`.
- Recovered object script: `tools/outputs/lpb/decomp_more_20260617/lua/chara/npc/object/questobjectman402.lua`.

## Short Version

The local quest is still intentionally hidden behind `InitQuestScaffold("Man402")`. The local script now exposes probe metadata/constants and helper accessors, but the recovered Man402 director route is empty. Do not wire the offer, field scout objective, bloodhound fight, completion, rewards, or cleanup yet.

The useful bug fix in this pass is the SNPC helper correction: the raw `SNPC5` tuple used by live delegates and the cutscene-book packet is `nickname, skin, personality, coordinate, initialTown`. For direct `startSnpc*CutScene` calls, slot 2 must already be the actor class id, usually `1070000 + skin`.

Safe local additions in the latest pass:

- Added `Man402` probe metadata, actor constants, and payload helper accessors to `Data/scripts/quests/man/man402.lua`.
- Added all four Man402 replay scenes to `scenario_decomp_helpers.lua`.
- Added explicit helpers for `pES`'s direct actor-class payload and `pE10`'s raw SNPC payload plus repeated flag.
- Added a passive local `QuestObjectMan402` object script matching the recovered ground-on/no-talk-marker behavior.

## Helpers Added Or Corrected

| Helper | Use |
| --- | --- |
| `appendArgs(values, ...)` | Appends scalar args or flattened list tables into a payload table. |
| `buildArgList(...)` | Builds a flattened arg list for delegate probes. |
| `delegateEventWithArgList(player, owner, eventName, args)` | Delegates an event from a prepared payload table. |
| `delegateEventWithArgListAndAdvance(player, quest, eventName, nextSequence, args)` | Prepared-payload delegate plus sequence advance. |
| `getSnpcDelegateArgList(player)` | Explicit alias for raw live `SNPC5`: nickname, skin, personality, coordinate, initial town. |
| `getSnpcReplayArgList(player)` | Corrected to match the cutscene-book raw SNPC tuple. The replay client converts placeholder `-202` to actor class for SNPC scenes. |
| `getSnpcCutsceneArgList(player)` | Direct SNPC scene tuple: nickname, actor class from skin, personality, coordinate, initial town. |
| `getSnpcCutsceneArgListWithSexualitySkin(player)` | Direct SNPC scene tuple plus the recovered sexuality-skin value used by scenes such as `man40200`. |
| `getMan402StartCutsceneArgList(player)` | Direct `pES` probe payload: SNPC cutscene tuple plus sexuality-skin. |
| `getMan402P10DelegateArgList(player, flag)` | Raw `pE10` delegate payload: SNPC5 plus the recovered repeated flag value. |

## SNPC Payload Rule

There are two similar-looking payloads:

| Use | Payload |
| --- | --- |
| Live delegate wrapper such as `pE10`, `pE20`, `pE30` | `nickname, skin, personality, coordinate, initialTown`; the recovered method converts slot 2 with `getSnpcActorClassID`. |
| Direct `startSnpcNQCutScene` / replay after placeholder processing | `nickname, actorClassId, personality, coordinate, initialTown`; the caller already converted slot 2. |

`Man402.pES` is a special hazard: it does not convert slot 2 before `startSnpcNQCutScene("man40200", ...)`, so any direct probe of `pES` should pass actor-class slot 2. `pE10`, `pE20`, and `pE30` do convert slot 2 themselves.

## Cutscene Matrix

| Method | Scene | Fade | Payload and behavior |
| --- | --- | --- | --- |
| `pES` | `man40200` | Default | Starts row `249`, shows quest information, then plays SNPC NQ if accepted. It computes sexuality-skin from payload slot 3. Decline says row `250`. |
| `pE10` | `man40210` | Default | Converts raw SNPC skin to actor class, then passes the extra sixth arg twice. Replay row supplies literal `1, 1`. |
| `pE20` | `man40220` | Default | Converts raw SNPC skin to actor class. |
| `pE30` | `man40230` | After-warp | Converts raw SNPC skin to actor class. |

Replay rows:

| Replay id | Scene | Slots |
| --- | --- | --- |
| `11001801` | `man40200` | `-201, -202, -203, -204, -205, -217`; replay converts `-202`, and `-217` is sexuality-skin. |
| `11001802` | `man40210` | `-201, -202, -203, -204, -205, 1, 1`; replay converts `-202`. |
| `11001803` | `man40220` | `-201, -202, -203, -204, -205`; replay converts `-202`. |
| `11001804` | `man40230` | `-201, -202, -203, -204, -205`; replay converts `-202`; after-warp fade. |

Scene asset sizes:

| Scene | Size |
| --- | ---: |
| `man40200` | `31318` |
| `man40210` | `287646` |
| `man40220` | `21101` |
| `man40230` | `67883` |

## Talk Rows

| Method | Rows / notes |
| --- | --- |
| `processEvent000_1` | `108`, `109`: unknown distress-call sender and Tataru registry lead. |
| `processEvent000_2` | `110`, `111`: Path linkpearl circulation. |
| `pE03` | `112`, `113`: Nenekani recognizes the Path companion; row `112` takes companion name. |
| `processEvent000_4` | `114`, `115`: linkpearl panic concern. |
| `processEvent000_5` | `116`, `117`: urgent summons, habituation to cries for help. |
| `processEvent000_6` | `118`, `119`: linkpearl technical/missent-message flavor. |
| `processEvent000_7` | `250`: narrowed-down sender lead / decline-style line. |
| `processEvent020_1` | `120`, `121`: player assisted Ala Mhigan Resistance. |
| `processEvent020_2` | `122`, `123`: Ala Mhigo wall rumor / Resistance intel. |
| `pE23` | `124`, `125`: companion may know the Resistance; uses companion name and sexuality-skin. |
| `processEvent020_4` | `126`, `127`: praise tempered by Minfilia's reaction. |
| `processEvent020_5` | `128`, `129`: scout was chased by Empire; reckless rescue caution. |
| `processEvent020_6` | `130`, `131`: Path/Resistance connection and missing prior visitors. |

## NPC And Object Leads

`QuestObjectMan402` only:

- `_setGroundOn(true)` in `initForEvent`.
- `isMapMarkerVisibleForTalkable()` returns `false`.

That points to a field/object role, but not enough to spawn or route it. Treat it as a probe target, not objective authority. The local passive script lives at `Data/scripts/base/chara/npc/object/QuestObjectMan402.lua`.

Important local actor/display leads:

| Id | Evidence |
| --- | --- |
| `1000843` | Minfilia actor class currently used by hidden scaffold. |
| `1100449` | Minfilia display id in `xtx_quest.csv`. |
| `1000331` / display `1100182` | Talk-capable lead from display-name/marker scans. |
| `1001770` / display `1100183` | Talk-capable lead from display-name/marker scans. |
| `1001446` / display `1100189` | Talk-capable lead from display-name/marker scans. |

## Markers

| Marker | Coordinates / target |
| --- | --- |
| `11001801` | `-199.56, -162.35`, target `1500054`, layout `104/421`; current hidden scaffold marker. |
| `11001802` | `1700.49, -868.11`, target `4000257`, layout `103/302`. |
| `11001803` | `-235, 51`, target `4000257`, layout `104/421`. |
| `11001804` | Same coordinates and target as `11001801`. |
| `11001805` | `1917.46, -1627.58`, target `4000257`, layout `103/302`. |
| `11001806`-`11001820` | Generic `-431, 187`, target `1600179`, layout `101/121`. |

## Journal And Reward Risk

`xtx_quest.csv` uses `$E8(1)` ranges:

| Counter state | Journal row |
| --- | --- |
| `0` to before `5` | `journalxtxWil` row `223` |
| `5` to before `15` | row `224` |
| `15` or higher | row `225` |

Summary rows reference `223`, `259`, and `225`, so the summary differs from the active formula's middle row. Do not replace scaffold journal output until route counters are known.

Reward data conflicts:

- `xtx_quest.csv` says reward none.
- `Data/sql/gamedata_quest_rewards.sql` says `126000` gil and `39000` EXP.
- `quest_reward.csv` / `quest_new_reward.csv` also carry encoded reward payloads.

Keep rewards disabled until the retail completion event and reward widget are captured.

## Probe Commands

Use raw `@snpc5` for methods that convert slot 2:

```text
!questdelegate quest:110018 pE10 @snpc5 1
!questdelegate quest:110018 pE20 @snpc5
!questdelegate quest:110018 pE30 @snpc5
```

Use an actor-class slot for `pES` until runtime proves the missing conversion is decomp damage:

```text
!questdelegate quest:110018 pES @snpcnickname @snpcactorclass @snpcpersonality @snpccoordinate @initialtown
```

Talk probes:

```text
!questdelegate quest:110018 pE03 @snpcnickname
!questdelegate quest:110018 pE23 @snpcnickname @snpcpersonality
```

## Follow-Up

- Capture the actual route owner for the emergency linkpearl/search stage.
- Find battle or director ownership for the scout/bloodhound protection sequence.
- Probe `QuestObjectMan402` in live maps before giving it a quest marker or talk route.
- Verify whether `pES` truly expects actor-class slot 2 or whether a decomp line was lost.
- Keep Man402 hidden until sequence, objective, battle, completion, and reward routes are proven.
