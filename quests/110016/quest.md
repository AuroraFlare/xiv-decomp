# 110016 Man304 — Forever Taken (Lv34): instance & route decomp notes

Quest `110016` (`Man304`), Lv34 main scenario. Prereq `110015` (`Man300`, Toll of the
Warden); follow-up `110017` (`Man308`, Lord Errant). Giver: Hedyn, Ashcrown
Consortium, Peasants Ward Gridania. Rewards: 102,000 gil (dat-new) + 26,500 EXP
(wiki), both `autoGrant = 1` (`gamedata_quest_rewards.sql`).

Retail verdict: SOLO dialogue/delivery/interaction quest. NO fight, NO adds/
phases/enrage/leash, NO escort, NO party scaling. The "instance" is a solo
dialogue-only private Waking Sands hall scene (`SimpleContent30081`). Evidence:
recovered `QuestDirectorEventMan30401` bytecode is an empty
`QuestDirectorBaseClass` subclass; the retail journal carries NO "Up to two
party members may accompany you" line (unlike Man300/Man308); patch-1.20 enemy
moves were open-world route hazards (Pteroctraps/Efts at Murmur Rills / Camp
Crimson Bark corridor), not instance mobs.

## Sequence route

| Seq | Objective | Server delivery |
| --- | --------- | --------------- |
| Accept | Speak with Hedyn (Ashcrown) | `pES`/`man30400`: SNPC tuple + personality bucket + `5, 10`; accept iff quest-info accepted |
| 0 | Gather 5 Unaspected Crystals at Silvertear Falls | 5 soil pushes; each confirm + 1 Lightning Crystal removed = flag + counter 0 inc |
| 5 | Return crystals to Hedyn | `pE10`/`man30410` (needs counter 5); counter cleared; journal advances |
| 10 | Return to Waking Sands, enter main hall | Hall doorway 1090186 creates private content; `pE20`/`man30420` across after-warp fade |
| 20 | Speak with Path companion | Private companion talk: `pE30`/`man30430` |
| 25 | Post-scene completion | Reward window `sqrwa(26500,1,1,2)`; central completion; return to public hall |

Journal (`xtx_quest` 110016): 0->214 (gather 5), 5->242 (return to Hedyn),
10..19->215 (Paragon info to Waking Sands), 20->216 (ask companion),
25->217 (Minfilia to negotiate with tribes). Item line shows
`11000096 x counter0` while seq < 10. Flags 0-4 = soils (cleared on start).
Counter 0 = Unaspected Crystal ledger 0..5 (item is Exclusive/max-stack 1, so
the counter — not inventory — is the delivery ledger).

## Actors, positions, triggers

Event actors are invisible `PopulaceStandard` push actors (3-yalm circle).
Spawns: `server_eventnpc_spawn_locations.sql` rows 3066-3071, 3100-3102.

| Class | Zone | X | Y | Z | Rot | Unique / purpose |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| 1090181 | 190 Mor Dhona | 752.120 | 31.400 | -374.220 | -1.232 | man304_silvertear_soil_1, flag 0, marker 11001607 |
| 1090182 | 190 | 722.092 | 30.969 | -380.955 | -1.073 | man304_silvertear_soil_2, flag 1, marker 11001608 |
| 1090183 | 190 | 744.460 | 33.811 | -307.340 | -1.073 | man304_silvertear_soil_3, flag 2, marker 11001609 |
| 1090184 | 190 | 799.600 | 44.200 | -214.430 | -1.073 | man304_silvertear_soil_4, flag 3, marker 11001610 |
| 1090185 | 190 | 864.072 | 43.998 | -297.140 | -0.681 | man304_silvertear_soil_5, flag 4, marker 11001611 |
| 1090186 | 181 Waking Sands | -193.460 | -2.000 | -177.310 | 0.000 | man304_waking_sands_hall_trigger, marker 11001606; scene entry + SEQ_020 recovery |
| 1001047 Hedyn | 160 ward | — | — | — | — | talk; giver/turn-in (display 1000392) |
| 1000843 Minfilia | 181 | — | — | — | — | SEQ_025 QFLAG_REWARD recovery |
| 1001381 Cliaux | 160 | -158.000 | 1.000 | -155.250 | -1.570 | man304_peasantsward_cliaux; SEQ_0 `processEvent001_6(4)` |
| 1001382 Cenmin | 160 | -152.500 | 1.000 | -155.250 | -1.570 | man304_peasantsward_cenmin; SEQ_0 `_001_5`, SEQ_10 `_005_2` |
| 1001384 Memezofu | 160 | -200.171 | 0.000 | -158.151 | 3.126 | man304_peasantsward_memezofu; SEQ_0 `_001_3(4)` |
| 1070000+SNPC skin | private 181 copy | -193.000 | -2.000 | -188.000 | 0.000 | man304_path_companion; spawned by director |
| 1090264 / 1090265 | city markets | — | — | — | — | quest-owned Gridania/Ul'dah market entrance pushes |

Travel markers: 11001601 Gridania/Ashcrown route, 11001603 Hedyn, 11001605
Ul'dah/Waking Sands route. Ward entries: Peasants 160
(-201.795, 0.015, -159.926, 1.550); Merchants 181
(-201.589, 0.000, -160.047, 1.550).

Content area: `/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`,
script `man30401`, private area `SimpleContent30081`, director
`Quest/QuestDirectorEventMan30401`, anchored to public zone 181,
all-disciplines entry (quest is "All classes"). Entry
(-193.460, -2.000, -181.000, 0.000); public return
(-126.200, 1.200, -160.000, 1.600).

## Cutscenes

| Wrapper | Scene | Fade | Payload |
| --- | --- | --- | --- |
| pES | man30400 | normal | SNPC tuple + personality bucket + `5, 10`; returns quest-info choice |
| pE10 | man30410 | normal | SNPC tuple; pre-line row 306 inside wrapper |
| pE20 | man30420 | after warp | assembly; event stays alive through DoZoneChangeContent |
| pE30 | man30430 | after warp | personality line pair, then scene |

`pES` personality->bucket: 1/2/9->1, 3/4->2, 5/6->3, 7->4, 8->5, else 0.
`pE30` personality->rows: 1:(369,378) 2:(370,379) 3:(371,380) 4:(372,381)
5:(373,382) 6:(374,383) 7:(376,385) 8:(375,384) 9:(377,386).
Non-scene: `processEvent000_20` bury confirm (ask 490), `000_22(4)` missing
crystal, `001_2` Hedyn reminder, `001_3(4)` Memezofu, `001_5` Cenmin,
`001_6(4)` Cliaux, `005_1` Hedyn->Minfilia, `005_2` Cenmin research.
Replay maps 1..4 -> man30400/10/20/30. All 4 `client/cut/man304*` packages
valid and cross-checked against replay metadata.

## Mobs / AI / escort: none by retail design

No mob spawns, AI, phases, adds, enrage, leash, reset, or escort exist for
this quest — do NOT invent them. The only retail combat pressure is the
open-world run to Mor Dhona (over-level aggro on the Black Shroud / Crimson
Bark approaches; Coerthas detour was the player workaround). Open-world mob
tuning there belongs to zone spawn work, never to this quest.
The Path companion in the private scene is a stationary talk actor, not an
escort (no route JSON, no follow/teleport/aggro rules apply).

## Mount, party, fail edges (implemented)

- Mounts: engine ban covers every private area (`IsMountRestrictedArea`:
  `IsPrivate()`), auto-dismount on `DoZoneChangeContent`; no chocobo actor.
- Party: solo-only as retail (no party-accompany journal line). Entry never
  gathers party members (contrast Man300's 3-entrant collector). No scaling.
- Timeout: 30-min director backstop; expiry with the player inside auto-exits
  to the public return point, quest stays SEQ_020, hall doorway re-enters.
- Abandon inside: `Quest.OnAbandon` calls `onFinish` but never exits content;
  the director detects the missing quest and auto-exits + ends itself.
- Disconnect: session re-resolve via `getDirectorPlayerById` +
  `IsSamePlayerSession`; companion re-found by unique id, never duplicated.
- Death: impossible inside (no damage sources); open-world death during SEQ_0
  keeps saved flags/counter — standard return, no quest penalty.
- SEQ_020 area guard: companion completion only fires inside the private copy,
  so the assembly scene cannot be skipped from outside.
- SEQ_025 Minfilia QFLAG_REWARD: crash/relog recovery if the final handoff
  interrupts after the sequence persists.
- Soil edges: per-point flags block double conversion; missing-crystal push
  shows `000_22(4)` without consuming; counter resets at Hedyn turn-in.

## Coordinate-guide corroboration (zone 190, page 3500, scale 1)

`map_coordinates.py locate --zone 190 --world <X> <Z>`; map (20.0..21.5,
9.6..11.3). Soils 1-3 sit inside recorded ground (36/28/26 nodes in
selection); nearest recorded Y (31.17 / 30.80 / 32.62) corroborates captured
heights (31.40 / 30.969 / 33.811). Soils 4-5 have no recorded nodes within
30 (nearest ~42/~41 yalms off); their captured Y (44.2 / 43.998) stands as
in-game capture only — never borrow heights per the guide. Marker anchors
match captures except small in-game X/Z corrections on soils 2 and 5.

## Verify

```powershell
python tools/validate_forever_taken_man304.py
python tools/validate_quest_availability.py
```

GM: `!questcomplete man304 soil|turnin|assembly|companion|reward` (give 5x
Lightning Crystal 1000013 for a full soil pass).

## Sources

- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man304.lua`
- `tools/outputs/lpb/decomp_more_20260617/lua/director/quest/questdirectoreventman30401.lua`
- `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_scene_asset_crosscheck.csv`
- `docs/Dat Mining/{man304,xtx_quest,xtx_journalxtxWil,quest_marker,cutReplay,quest_reward}.csv`
- `Data/sql/{gamedata_items,gamedata_quest_rewards,server_eventnpc_spawn_locations,gamedata_actor_class}.sql`
- Fandom Path of the Twelve MSQ journal (Lv34, Hedyn, 102k gil, ~26.5k EXP,
  6 journal entries, no party line); SE forum threads 29715/11759/41668
  (Mor Dhona route aggro; 1.20 placement fix).
- Prior dossiers: `docs/forever_taken_man304_decomp_2026-07-07.md`,
  `docs/forever_taken_man304_decomp_2026-08-14.md`; stub `quests/110016/DECOMP.md`.
