# Open World Dungeon Doors Handoff

Date: 2026-06-04

Use this as the compact handoff for continuing open-world dungeon door work. The full notes live in `docs/open_world_dungeon_doors.md`.

Before opening a probe zone to other players, run `!clearpinmapobj` or `!testtamtaratriggers cleanup` in that zone. These end the current event and remove pinned/test BG objects, Tam-Tara trigger probes, generic map-object probes, push/event-door probes, and raw actor-class probes from the current area. A map-server restart also clears runtime-only probe actors.

## Core Mechanism

Working doors need all three pieces:

1. `server_eventnpc_spawn_locations` row.
2. Matching `server_eventnpc_mapobj` row.
3. Correct client BG binding: `(layoutId, instanceId)`.

The SQL `uniqueId` is just the server-side script label. The actual client door identity is `layoutId` plus `instanceId`.

For dungeon doors tested here, use:

```text
actorClassId=5900015
script folder=DoorServer
animation=open
```

Do not use the old failed Nanawa forced-open rows as a pattern. Normal doors work by binding the real client BG object and then optionally playing `open`.

Tam-Tara should be treated as a normal wooden door. The `RaidDungeonBarrier` actor-class probe spawned photocell props and is rejected for the Tam-Tara door.

Live-confirmed Tam-Tara interior doors: `fst0Dungeon02`, inside zone `158`, layout `312`, map-object table IDs `3598..3609` and `3649`. `data\29\B0\00\09.DAT` places those ids beside `sgrp_bg_d2_door_a1`, `sgrp_bg_d2_door_b1`, `sgrp_bg_d2_door_c1`, `sgrp_bg_d2_door_a2`, and literal `open`/`clos` tokens. These are the door IDs to promote into permanent rows.

Fresh DAT lead for the screenshot entrance door: `data\29\B0\00\07.DAT` root `fst_f0_fld05` contains normal door groups `sgrp_bg_door_air1` and `sgrp_bg_door_air2`, with `door_air1_open`, `door_air2_open`, `LayCollisionOnOffClip`, `LayTransformClip`, and nearby `isgrp_016668..016674`, `isgrp_016765`, `isgrp_016766`, `isgrp_016797`. The earlier `2697..2699` lead came from `data\29\DF\00\01.DAT` root `sea_s0_dun02` and should not be used for the Tam-Tara entrance door.

Important Tam-Tara DAT correction: `data\29\D9\00\09.DAT` is rooted as `sea_s0_dun02`, so the `3324`/`3679..3690` branch was testing Sea dungeon assets, not the pictured Gridania/Tam-Tara door. The current forest/Tam-Tara root layout candidate is `data\29\B0\00\0C.DAT`, rooted as `fst_f0_dun05`; it places door-bearing groups defined in `data\29\AB\00\04.DAT`.

Fresh forest door lead: `Bk_isgrp_002815` carries `f0d0_bc_dor1*_h` resources with SCI keys `1bJVzT`/`3SgOYM` for `_forestdun_door_hanyou_c_open/close`; `Bk_isgrp_002819` carries `f0d0_bc_dor3*_h` resources with SCI keys `1BzYi6`/`4l3mD2` for `_forestdun_door_ikusaru_open/close`. Keep this as historical/fallback context; the live-confirmed interior door path is the layout `312` table IDs above.

## GM Probe Commands

Single/range probe:

```text
!testmapobj open <layoutId> <firstInstanceId> <lastInstanceId> <actorClassId>
```

Matrix probe:

```text
!testmapobjmatrix <layoutId> <instanceIdsOrRanges> <actorClassIds> <animations> [delaySeconds]
```

State/substate probe:

```text
!testmapobjstate <layoutId> <instanceIdsOrRanges> <actorClassIds> <mainStates> <subModes> <motionPacks> [animation] [delaySeconds]
```

Use `none` for the animation argument when the state/substate change itself is the test.

Raw actor-class visual probe:

```text
!testactorclass <startActorClassId> [endActorClassId] [spacing] [columns]
!cleartestactorclass <startActorClassId> [endActorClassId] [minSuffix] [maxSuffix]
```

Push-box event trigger probe:

```text
!testpushbox <layoutId> <instanceIdsOrRanges> [actorClassId] [conditionName] [reactName] [silent] [outwards]
```

Useful examples:

```text
!testmapobj open 414 2652 2652 5900015
!testmapobj open 414 2654 2654 5900015
!testmapobj open 414 2658 2658 5900015
!testmapobj open 8002 16668 16674 5900001 1
!testmapobj open 8002 16765 16797 5900001 1
!testtamtaradoors tableopen 0.25
!testtamtaradoors tableboth 0.25
!testtamtaratriggers eventtable open
!clearpinmapobj
!testtamtaradoors forestrootopen 0.25
!testtamtaradoors foreststatic 0.25
!testtamtaradoors forestrootchildrenopen 0.1
!testtamtaratriggers eventforest open
!cleartestactorclass 1200200 1200208 0 50
```

If a visible door or barrier does not respond to `5900015`, retry with `5900016` before ruling it out.

`PlayBGAnimation` currently sends 8 ASCII bytes. Long DAT names such as `time_door_c1_hide` are clues, not usable full animation strings unless the packet is expanded later. For long-SCI groups, test the DAT `#file` short key and its 8-byte prefix as a separate branch.

## Copperbell Mines Current State

Zone:

```text
outside zone=172
inside zone=178
zone name=wil0Dungeon04
layoutId=414
actorClassId=5900015
```

Confirmed Copperbell door instances:

```text
2653
2655
2656
2657
2659
2660
```

Rows added:

```text
2925 -> 414 / 2653
2926 -> 414 / 2655
2927 -> 414 / 2656
2928 -> 414 / 2659
2929 -> 414 / 2660
2930 -> 414 / 2657
```

Scripts added under:

```text
Data/scripts/unique/wil0Dungeon04/DoorServer/
```

Files:

```text
copperbell_mines_door_entrance_2653.lua
copperbell_mines_door_2655.lua
copperbell_mines_door_2656.lua
copperbell_mines_door_2657.lua
copperbell_mines_door_2659.lua
copperbell_mines_door_2660.lua
```

All confirmed Copperbell scripts return:

```lua
return false, false, 0, 0, 414, <instanceId>, true;
```

and play:

```lua
npc:PlayMapObjAnimation(player, "open");
```

Current Copperbell spawn positions are provisional. Most rows reuse the inside gate position:

```text
X=-620.374 Y=110.429 Z=-113.903
```

This is enough for binding/opening, but target labels and actor positions should be cleaned up later with `!mypos` at each confirmed doorway.

## Copperbell Still Missing

Likely remaining swing-door candidates in the `2652..2661` group:

```text
2652
2654
2658
```

Do not add these until a doorway visibly moves or collision clears in game.

Rejected for now:

```text
2661
```

Failed probes:

```text
414 / 281 with 5900015 and 5900001: no movement
414 / 2643..2645 with 5900015 and 5900001: no movement with open
414 / 2643..2645 with 5900015, 5900001, and 5900016: no movement with hide at X=-44.475 Y=107.607 Z=143.020
```

DAT clue:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\data\61\5A\00\0C.DAT
```

contains:

```text
sgrp_bg_d4_door_a1
sgrp_bg_d4_door_a2
sgrp_bg_d4_door_a3
sgrp_bg_d4_door_b1
sgrp_bg_d4_door_c1
isgrp_002645
isgrp_002652..002661
Bk_isgrp_002643-001..010
```

The `c1` family exposes `show`/`hide`, not `open`/`clos`. If a solid `c1`-style blocker remains, the next theoretical probe is:

```text
!testmapobj hide 414 2643001 2643010 5900015
!testmapobj hide 414 2643001 2643010 5900001
!testmapobj hide 414 2643001 2643010 5900016
```

## Confirmed Outside Copperbell Scope

Nanawa Mines:

```text
outside zone=170
inside zone=176
zone name=wil0Dungeon02
layoutId=412
instanceId=2720
actorClassId=5900015
spawn row=2915
mapobj row=2915 -> 412 / 2720
script=Data/scripts/unique/wil0Dungeon02/DoorServer/nanawa_mines_door_entrance_2720.lua
```

Mun-Tuy Cellars:

```text
outside zone=152
inside zone=157
zone name=fst0Dungeon01
layoutId=311
actorClassId=5900016
staged instances=3160..3173
directly confirmed=3160, 3161, 3164, 3165, 3166, 3167, 3168, 3169, 3172, 3173
inferred contiguous gaps=3162, 3163, 3170, 3171
spawn rows=2919, 2922, 2933..2944
mapobj rows=2919 -> 311 / 3160, 2922 -> 311 / 3161, 2933 -> 311 / 3167, 2934 -> 311 / 3164, 2935 -> 311 / 3165, 2936 -> 311 / 3166, 2937 -> 311 / 3168, 2938 -> 311 / 3169, 2939 -> 311 / 3172, 2940 -> 311 / 3173, 2941 -> 311 / 3162, 2942 -> 311 / 3163, 2943 -> 311 / 3170, 2944 -> 311 / 3171
status=current fourteen-door range staged with 5900016; four gap IDs are inferred from the contiguous family; old 3156 and 3225 candidates were replaced
note=spawn positions are provisional and should be replaced with !mypos captures at each doorway
```

U'Ghamaro Mines:

```text
inside zone=137
layoutId=116
existing scripts=sea0Dungeon06/DoorServer/seadun6_*
mapobj rows added for spawn rows 891..898
instance IDs=1333, 1095, 1315, 1585, 488, 494, 487, 501
status=user reported doors visually open after login/restart
```

Instanced dungeons with script-backed mapobj rows added:

```text
Dzemael Darkhold: layout 211, rows 901..908, IDs 1406, 1408, 1409, 1486, 1493, 1494, 1495, 1496
Aurum Vale: layout 214, rows 910..914, IDs 1479, 1480, 1481, 1482, 1483
Toto-Rak: layout 313, rows 915..925, IDs 3579, 3444, 3466, 3487, 3580, 3583, 3585, 3587, 3589, 3591, 3593
```

## Next Dungeon Queue

Next target: promote the live-confirmed Tam-Tara layout `312` Door table ids below into permanent rows/scripts. Shposhae is next only if continuing normal door discovery after Tam-Tara, and only if a visible closed door/blocker is found. Mistbeard is no longer considered a normal open-world door target: tester clarified the visible gate stayed sealed in the original game context and separated an open-world area from a closed/other instance. Cassiopeia was DAT-mined and currently has no obvious DAT door evidence.

Tam-Tara Deepcroft:

```text
outside zone=150
inside zone=158
outside zone name=fst0Field01
inside zone name=fst0Dungeon02
layout=312
rejected outside layout=8002
door row=2931 reserved for the first promoted Tam-Tara door; use 2945+ for additional interior doors
confirmed map-object table:
layout 312 Door objects are 3598, 3599, 3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, and 3649
coords from the table:
3598=(82.486,-35.890,-136.393), 3599=(144.102,-35.890,-131.444), 3600=(92.862,-35.890,-15.898), 3601=(167.740,-34.890,-48.898), 3602=(207.883,-35.890,-35.144), 3603=(303.937,-35.890,-188.645), 3604=(341.147,-38.889,-142.963), 3605=(400.000,-43.890,-31.690), 3606=(176.023,-55.890,-163.488), 3607=(160.041,-55.890,-48.111), 3608=(176.012,-55.890,-29.063), 3609=(271.955,-63.890,-125.587), 3649=(272.075,-6.890,-264.150)
data\29\B0\00\09.DAT confirms those ids are beside sgrp_bg_d2_door_a1, sgrp_bg_d2_door_b1, sgrp_bg_d2_door_c1, sgrp_bg_d2_door_a2, and literal open/clos tokens
live test result:
tester confirmed these table IDs are indeed the Tam-Tara interior doors
fresh DAT lead:
data\29\B0\00\07.DAT root fst_f0_fld05
sgrp_bg_door_air1 / sgrp_bg_door_air2
door_air1_open / door_air2_open
nearby isgrp_016668..016674, isgrp_016765, isgrp_016766, isgrp_016797
inside Deepcroft correction:
data\29\D9\00\09.DAT is sea_s0_dun02, not Tam-Tara/forest. Its sgrp_bg_d2_door_b1/c0/c1, Bk_isgrp_003324, Bk_isgrp_002834, and isgrp_003679..003690 clues explain the failed old probes but should not guide the pictured Tam-Tara door anymore.
current forest/Tam-Tara root layout lead:
data\29\B0\00\0C.DAT
Root Folder fst_f0_dun05
door-bearing groups placed in this root and defined in data\29\AB\00\04.DAT:
2815, 2817, 2819, 2821, 2824, 2826, 2834, 2836, 2838, 2846, 2848, 2850, 2853, 2855, 2857, 2861, 2931, 2934, 2955
resource detail:
Bk_isgrp_002815 has f0d0_bc_dor1b_h/f0d0_bc_dor1a_h and SCI open/close keys 1bJVzT/3SgOYM
Bk_isgrp_002819 has f0d0_bc_dor3b_h/f0d0_bc_dor3a_h and SCI open/close keys 1BzYi6/4l3mD2
the earlier narrow 2815/2816/2817/2818/2819/2820/2833/2865 pass failed in live testing
old rejected data\29\D9\00\09.DAT extraction from C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV:
outside sgrp_bg_door_air1 has local token stt0, not just open; outside sgrp_bg_door_air2 contains isgrp_016668, Bk_isgrp_009346-002, Bk_isgrp_009346-003, isgrp_016669, isgrp_016670, isgrp_016671, isgrp_016672, isgrp_016674, and isgrp_016765/lght_shuraku_003
old sea_s0_dun02 sgrp_bg_d2_door_b1 has grp_l/grp_r and open/clos, but no direct isgrp after it; the immediate preceding copied refs are Bk_isgrp_002815-006, 002814-004, 002835-005, 002818-003, 003313-001, 002693-001, 002837-002, 002816-007, 002856-002, 003327-002, 003332-002, 003324-002
fresh proximity clue:
tester found the pictured inside Tam-Tara door opens by walking close to it, not by using the nearby teleporter. Tester roughly counted 8-10 doors in the zone.
The old sea_s0_dun02 DAT looked like this too: `sgrp_bg_d2_door_b1/c0/c1` expanded into panel groups/collision boxes, and `tgbx_bg_door_b1/c1` plus `time_door_b1/c0/c1_open` lived under `Bk_isgrp_002834-014`. This is kept only as failed history because the root is wrong for Tam-Tara.
confirmed table probe path:
!testtamtaradoors tableopen 0.25
then:
!testtamtaradoors tableboth 0.25
persistent visual check:
!pinmapobj 312 3598-3609,3649 5900015 open false
if no visible open/collision clearing, retry the same pin command with 5900016 and then 5900001.
cleanup persistent pins between attempts:
!clearpinmapobj
event-linked table branch:
!testtamtaratriggers eventtable open
historical fallback forest root test:
!testtamtaradoors forestrootopen 0.25
watch the pictured door for visible movement or collision clearing. The forest fallback tests layout 312 root-placed forest IDs 2815,2817,2819,2821,2824,2826,2834,2836,2838,2846,2848,2850,2853,2855,2857,2861,2931,2934,2955 with 5900015/5900016/5900001 and open-style animations open, 1bJVzT, and 1BzYi6.
if root direct IDs do nothing, try static-looking f0d0_ba_dor2 groups:
!testtamtaradoors foreststatic 0.25
then try copied children placed by the fst_f0_dun05 root:
!testtamtaradoors forestrootchildrenopen 0.1
historical event-linked branch:
!testtamtaratriggers eventforest open
then targeted SCI-key single probes if needed:
!testtamtaratriggers single 2815 5900015 1bJVzT
!testtamtaratriggers single 2819 5900015 1BzYi6
cleanup if any prompt/stuck state persists:
!testtamtaratriggers cleanup
old proximity test retained for comparison only:
!testtamtaratriggers push
important event result:
the first `event` version inherited stock `ObjectEventDoor.lua` and showed the wrong `Move from this area?` prompt. That is useful only as proof that the event condition fired. The command now uses `test_tamtara_triggerdoor.lua` under both `Data/scripts/unique/fst0Dungeon02/ObjectEventDoor/` and `Data/scripts/unique/fst0Field01/ObjectEventDoor/`, which ends the event and optionally plays linked BG animations instead of calling `eventDoorMoveAsk`. If the move-area prompt still appears, run `!testtamtaratriggers cleanup` first to remove stale `test_tamtara_eventdoor_*` actors from earlier probe runs.
old sea_s0_dun02 always-open tests:
3324 controller-style probes failed in game at the pictured door:
312 / 3324 with 5900001/open and 5900016/open; 312 / 3324001 and 3324002 with 5900015/open
row 2931 check:
!checkdoor2931 found the spawned DoorServer actor and replayed bind/open for layout 312 instance 3324, but the visible door stayed closed/solid. This proves the staged row spawns and the current tuple is wrong for the visible door.
rejected sea copied-child DAT mine:
Bk_isgrp_003324-001 through Bk_isgrp_003324-010 are present in data\29\D9\00\09.DAT, but that DAT is sea_s0_dun02 and tester reported the copied branch did not move the Tam-Tara door.
Bk_isgrp_002834-001 through Bk_isgrp_002834-014 are present. 2834014 alone did not fire the proximity open; test the full child range if pursuing trigger boxes.
timeline caveat:
time_door_b1_open, time_door_c0_open, and time_door_c1_open are long timeline asset names with LayTransformClip and LayCollisionOnOffClip. Current PlayBGAnimation only sends 8 bytes, so these are ownership clues unless the packet format is expanded.
rejected always-open panel/timeline probe:
!testtamtaradoors copied 0.25
equivalent explicit matrix:
!testmapobjmatrix 312 3324001-3324010 5900001,5900015,5900016 open,clos,4cxUUD,4prNRr,0rdTWA,0zlLek 0.25
then try panel/collision show-hide without MapObjOneWayDoor:
!testtamtaradoors direct 0.25
equivalent explicit matrix:
!testmapobjmatrix 312 3679-3690 5900006,5900007 hide,show,open,clos 0.25
live result:
tester reported both `!testtamtaradoors copied 0.25` and `!testtamtaradoors direct 0.25` did not work.
do not force-bind MapObjOneWayDoor:
5900026 crashed the client in both broad matrix and single `!spawnbgobj 312 3679 5900026 hide true` probes. GM map-object probe commands now refuse actor classes 5900026..5900028.
then try proximity children:
!testtamtaratriggers push
equivalent explicit trigger-box probe:
!testpushbox 312 2834001-2834014 1090098 in dtwi false false
if a trigger fires, try event-driven BG animation replay:
!testtamtaratriggers copied open
then:
!testtamtaratriggers direct hide
live result:
`push`, `copied open`, and `direct hide` bound successfully but still did not show an event firing from the `2834001..2834014` trigger-box path.
old branch:
use the known-firing ObjectEventDoor interaction as the event owner while linking to the old sea_s0_dun02 BG candidates:
!testtamtaratriggers eventcopied open
then:
!testtamtaratriggers eventdirect hide
safer current single-target linked probe after broad tests:
!testtamtaratriggers single 2815 5900015 open
if either still shows `Move from this area?`, run:
!testtamtaratriggers cleanup
then restart the map server and retry `eventforest`.
door count sanity:
Tam-Tara is Copperbell-like at the asset level. Direct DAT/repo comparison with Copperbell, Nanawa, Mun-Tuy, Toto-Rak, U'Ghamaro, and Aurum Vale shows the same door ingredients: `sgrp_bg_*door*`, `time_*door*`, copied `Bk_isgrp_*` groups, `LayTransformClip`, and `LayCollisionOnOffClip`; Dzemael uses the same server-row/map-object binding pattern in this repo. Copperbell also has copied-looking DAT children, but the confirmed live rows use direct table instance IDs. The final Tam-Tara result matches that same pattern: the correct tuple came from the direct layout 312 door table, not a special packet path.
The rejected sea_s0_dun02 DAT showed about five named door control groups, which is why it looked convincing, but it does not match the Gridania/Tam-Tara door in the screenshot. The current forest DAT lead instead centers on `Bk_isgrp_002815`, `Bk_isgrp_002819`, and nearby forest gate groups.
additional sea_s0_dun02 copied refs seen near door timing resources:
Bk_isgrp_003600, Bk_isgrp_003601, Bk_isgrp_003696, Bk_isgrp_003694, Bk_isgrp_003692
layout correction:
8002 is likely a field/weather layout row, not the usable door layout. Aetheryte sheet row 1280083 uses layout key 2113, and _layout.csv maps 2113 to layout 312.
status=confirmed DoorServer/mapobj table IDs:
312 / 3598..3609 and 3649 are live-confirmed as the Tam-Tara interior doors. Earlier partial tests against 3598, 3599, and 3649 were superseded by the full table probe.
status=DoorServer/mapobj probes failed in game:
312 / 3692..3696 with 5900015/open
312 / 3692..3696 with 5900001/open
312 / 16668..16674 with 5900006/open
312 / 16668..16674 with 5900006/stt0
312 / 16668..16674 with 5900006/end0
8002 / 27029..27031 with open
8002 / 27029..27031 with hide
312 / 2600..2649 with open
312 / 2650..2699 with open
8002 / 16668..16674 with 5900001/open
8002 / 16765..16797 with 5900001/open
312 / 3679..3690 with 5900015/open
8002 / 16668..16674 with 5900015/open
8002 / 16668..16674 with 5900016/open
8002 / 16765..16797 with 5900015/open
8002 / 16765..16797 with 5900016/open
8002 / 16668..16674 with 5900001/stt0
8002 / 16668..16674 with 5900001/end0
8002 / 9346001..9346003 with 5900001/stt0
8002 / 9346001..9346003 with 5900001/end0
312 / 3679..3690 with 5900001/open
312 / 3679..3690 with 5900016/open
312 copied-ref list with 5900015/open:
2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002
312 copied-ref list with 5900001/open:
2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002
photocell/object actor probe rejected:
!testactorclass 1200200 1200208 3 3
alternate actor-path note:
The server has `/Chara/Npc/Object/ObjectEventDoor` actor classes `1090097..1090162`. These are not BG map objects: they use invisible/trigger-like appearance `10999`, base script `ObjectEventDoor.lua`, and no `SetActorBGProperties`. Limsa has both `ObjectEventDoor` push triggers and separate `5900001` door map-objects, so Tam-Tara may need a trigger row plus a still-unfound BG panel binding. Do not add ObjectEventDoor rows as "doors opened" unless they create the missing Open target or trigger behavior in game; they will not directly animate the wooden panels by themselves.
ObjectEventDoor `1090097..1090101` was tested in game near the Tam-Tara door and showed nothing targetable/usable.
ObjectEventDoor `1090114..1090123` spawned only `1090114`, `1090118`, `1090119`, `1090120`, `1090121`, and `1090123`; `1090115..1090117` and `1090122` were nil actor classes. No useful Tam-Tara door result was reported from this batch.
retail-behavior clue:
players likely walked up and used a menu action labeled Door. Added `!testeventdoor` because raw `!testactorclass` can leave ObjectEventDoor interaction status disabled.
after rebuilding/restarting map server:
!testeventdoor 1090098,1090099,1090114,1090118-1090121,1090131,1090145,1090159,1090162 2 1.5 4 pushDefault
then target spawned actors and/or walk into the door area. Watch for eventDoorMoveAsk/Event START. This proves the menu-action owner, but still does not prove the BG panel binding.
alternate map-object actor note:
Actor classes `5900006` and `5900007` are `/Chara/Npc/MapObj/MapObjOnlyShowHide`, and `5900026..5900028` are `/Chara/Npc/MapObj/MapObjOneWayDoor`. `5900006` was tried against the layout-corrected outside door IDs with `open`, `stt0`, and `end0`, and did nothing in game. Keep `MapObjOneWayDoor` blocked unless a native-safe bind tuple is recovered; prior `5900026` probes crashed the client. The next stronger branch is to check for missing invisible `ObjectEventDoor` triggers.
new helper:
!testmapobjlist <anim> <layoutId> <instanceIdCsv> [actorClassId] [delaySeconds]
next outside normal-door animation/copied-ref probes:
!testmapobj stt0 312 16668 16674 5900001 1
!testmapobj end0 312 16668 16674 5900001 1
!testmapobj stt0 312 9346001 9346003 5900001 1
!testmapobj end0 312 9346001 9346003 5900001 1
blocked one-way map-object branch:
Do not run the old `5900026` fallback probes on the stock client. They are preserved here only as rejected history because `MapObjOneWayDoor` still lacks a safe local binding path.
next actor-path sanity probes, only to check for invisible Open/trigger targets near the door:
!testactorclass 1090131 1090145 0.75 5
!testactorclass 1090159 1090162 0.75 4
rejected non-Tam-Tara DAT lead:
data\29\DF\00\01.DAT root sea_s0_dun02 led to 2697..2699
do not promote any of the failed/rejected commands below:
!testmapobj open 8002 27029 27031 5900015 1
!testmapobj hide 8002 27029 27031 5900015 1
!testmapobj open 312 2600 2649 5900015 1
!testmapobj open 312 2650 2699 5900015 1
!testmapobj open 312 2697 2699 5900001 1
!testmapobj open 8002 16668 16674 5900001 1
!testmapobj open 8002 16765 16797 5900001 1
!testmapobj open 312 3679 3685 5900015 1
!testmapobj open 312 3686 3690 5900015 1
!testmapobj open 8002 16668 16674 5900015 1
!testmapobj open 8002 16668 16674 5900016 1
!testmapobj open 8002 16765 16797 5900015 1
!testmapobj open 8002 16765 16797 5900016 1
!testmapobj stt0 8002 16668 16674 5900001 1
!testmapobj end0 8002 16668 16674 5900001 1
!testmapobj stt0 8002 9346001 9346003 5900001 1
!testmapobj end0 8002 9346001 9346003 5900001 1
!testmapobj open 312 3679 3690 5900001 1
!testmapobj open 312 3679 3690 5900016 1
!testmapobj open 312 3600 3601 5900015 1
!testmapobj open 312 3600 3601 5900001 1
!testmapobj open 312 3692 3696 5900015 1
!testmapobj open 312 3692 3696 5900001 1
!testmapobj open 312 16668 16674 5900006 1
!testmapobj stt0 312 16668 16674 5900006 1
!testmapobj end0 312 16668 16674 5900006 1
!testactorclass 1090097 1090101 3 5
!testactorclass 1090114 1090123 0.75 5
!testmapobjlist open 312 2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002 5900015 1
!testmapobjlist open 312 2815006,2814004,2835005,2818003,3313001,2693001,2837002,2816007,2856002,3327002,3332002,3324002 5900001 1
```

Shposhae:

```text
inside zone=235
likely layout=112
DAT file=data\29\DF\00\01.DAT
DAT root=sea_s0_dun02
DAT has real door assets, but tester saw no visible doors in-zone
s0d1_p_door3_h + _coasttsuuro_open/_close:
Bk_isgrp_002695, 002696, 002702, 002703, 002704, 002707
s0d1_p_door2_h + _coastsouko_open/_close:
Bk_isgrp_002829, 002870, 002872, 002873, 002876, 002877
probe only if a real closed door/blocker is found
targeted probe if needed:
!testmapobjmatrix 112 2695,2696,2702,2703,2704,2707,2829,2870,2872,2873,2876,2877 5900015,5900016,5900001 open,close,_coastts,_coastso 0.25
```

Mistbeard Cove:

```text
inside zone=131
likely layout=111
door count=3 total
DAT clue=data\29\DF\00\00.DAT root references sea_s0_dun01; door-related groups are 000901/000934/000935 using _coastrouya, 000944/000953 using _coasttokushu, 000945/001052 using _coasttsuuro, 000968 using _coastminato_saku, and 001120/001121 using _coastseisan
outside gate position not confirmed
status=zone/layout sanity confirmed at the large double gate with !mypos showing zone 131; direct DAT groups, copied hide probes, DAT script-token probes, and direct door-like matrix probes found no door movement. Tester clarified this gate never opened in the original game context and kept an open-world area sealed from a closed/other instance; treat as intentional sealed instance boundary, not a missing normal map-object door. Keep 0 confirmed door bindings
failed probes=111 / 944, 945, 999 with 5900015/5900016 hide; 111 / 944001..944010, 945001..945010, 999001..999010 with 5900015 hide at the large double gate; _coastmi 111 / 968 / 5900001; direct-group token probes with 5900015 against 944, 953, 1120, 945, 1052, 1121, 901, 934, 935, and 968; direct matrix probes:
!testmapobjmatrix 111 968 5900001,5900015,5900016,5900006,5900007,5900026 open,hide,show 2
!testmapobjmatrix 111 901,934,935,944,945,953,1052,1120,1121 5900001,5900015,5900016 open,hide,show 1
high/copied group probes also failed:
!testmapobjmatrix 111 1122-1151 5900001,5900015,5900016 open,hide,show 0.25
!testmapobjmatrix 111 2479-2498 5900001,5900015,5900016 open,hide,show 0.25
!testmapobjmatrix 111 3599-3605,3629,3631,3633,3635,3639,3765 5900001,5900015,5900016 open,hide,show 0.25
state/substate probes also failed:
!testmapobjstate 111 968 5900001,5900015,5900016 0 0-5 0-10 none 0.25
!testmapobjstate 111 968 5900006,5900007,5900026 0 0-5 0-10 none 0.25
!testmapobjstate 111 968 5900015 1-3 0-3 0-10 none 0.25
DAT #file short-key animation probes also failed:
!testmapobjmatrix 111 968,3639 5900001,5900015,5900016,5900006,5900007,5900026 2a5WDH,2a5WDH_c,0lffsg,0lffsg_c,3ORKAW,3ORKAW_c,1xvEtP,1xvEtP_c,49yMfw,49yMfw_c,1zzT6W,1zzT6W_c 0.5
!testmapobjmatrix 111 901,934,935 5900001,5900015,5900016 3Y2Uxy,3Y2Uxy_c,0FR5SO,0FR5SO_c 0.5
!testmapobjmatrix 111 944,945,953,1052,1120,1121 5900001,5900015,5900016 0Ox7D4,0Ox7D4_c,1ATbGh,1ATbGh_c,4prNRr,4prNRr_c,0zlLek,0zlLek_c,4b8IZ2,4b8IZ2_c,3eGcX1,3eGcX1_c 0.5
current theory=Mistbeard's large gate is an intentional sealed instance boundary for this door pass, not a normal open-world door. `data\29\DF\00\00.DAT` contains `Bk_itgbx_000004`, a baked trigger box near the `003639` minato lever/floor block, but this is no longer a live-test priority unless a separate visibly openable Mistbeard door is found.
initial event test failed with no prompt/Event START:
!testpushbox 111 4 1090098
next event tests:
!testpushbox 111 1-20 1090098 pushDefault - false false
!testpushbox 111 1-20 1090098 in dtwi false false
Walk through/around the large gate after spawning the range and watch the map-server console for `Event START`, or for any client prompt.
paused=Skip Mistbeard for now. Keep 0 confirmed bindings; do not spend more normal door-binding time here unless a separate visibly openable door is found.
```

Cassiopeia Hollow:

```text
inside zone=132
likely layout=113
DAT file=data\29\DF\00\02.DAT
DAT root=sea_s0_dun03
literal strings absent: door, dor, gate, itgbx, lock, key, lever
only open/close-like scripts found inside Bk_isgrp_001502:
_coastshell_open=0F7YkZ, _coastshell_close=3A1yQd,
_coastball_in=4j6Xdo, _coastball_loop=4rRz3j, _coastball_out=20McKR,
_coastshell_shine_in_loop=3nKEGd, _coastshell_shine_out=0rNUDg
current read=no obvious DAT door evidence; broad Bk_isgrp_001479..001599 is cave/prop context, not a door-specific lead
do not run a broad door sweep unless standing at a specific visible blocker
if the blocker is shell-like, first low-confidence mapobj probe is:
!testmapobjmatrix 113 1502 5900015,5900016,5900001 open,close,0F7YkZ,3A1yQd,4j6Xdo,4rRz3j,20McKR,3nKEGd,0rNUDg 0.25
otherwise capture !mypos/screenshot and mine the local model context before probing
```

## Aetherial Gates

The aetherial gate and the physical door are separate.

`Data/scripts/base/chara/npc/object/aetheryte/AetheryteChild.lua` has zone-change mappings for:

```text
1280052: Nanawa 170 <-> 176
1280054: Copperbell 172 <-> 178
1280082: Mun-Tuy 152 <-> 157
1280083: Tam-Tara 150 <-> 158
```

Copperbell and Tam-Tara gate rows were enabled, and inside exit rows were added:

```text
771: copperbellmines_aetherytegate, zone 172
2923: copperbellmines_aetherytegate_exit, zone 178
797: tamtaradeeprcroft_aetherytegate, zone 150
2924: tamtaradeeprcroft_aetherytegate_exit, zone 158
```

## Battlewardens

Battlewarden spawns are driven by C# `BehestManager` site definitions. The SQL battlewarden rows currently match the registered sites.

Known dungeon-adjacent sites:

```text
Cassiopeia Hollow: actor 1500021, zone 132, spawn row 2897
Nanawa Mines: actor 1500031, zone 176, spawn row 2901
Mun-Tuy Cellars: actor 1500042, zone 157, spawn row 2907
Tam-Tara Deepcroft: actor 1500043, zone 158, spawn row 2932
Halatali: actor 1500028, zone 171, spawn row 2900
Nophica's Wells: actor 1500029, zone 172, spawn row 2440
Horizon's Edge: actor 1500025, zone 172, spawn row 2400
Bentbranch: actor 1500034, zone 150, spawn row 2902
Tranquil: actor 1500038, zone 154, spawn row 980
```

Tam-Tara now has a dedicated `BehestManager` site using actor `1500043` and a narrow locality/quest-derived Sabletooth Spriggan pool. Copperbell still has no dedicated battlewarden site in `BehestManager`.

## Current Tam-Tara Rows

Rows now staged for Tam-Tara:

```text
2931: tam_tara_deepcroft_door_3598, zone 158, actor 5900015, layout 312, instance 3598
2932: tam_tara_battlewarden, zone 158, actor 1500043
2945..2956: tam_tara_deepcroft_door_3599..3609 and 3649, zone 158, actor 5900015, layout 312
```

The aetherial gate rows already present are:

```text
797: tamtaradeeprcroft_aetherytegate, zone 150
2924: tamtaradeeprcroft_aetherytegate_exit, zone 158
```

Permanent Tam-Tara interior door rows are now promoted in the source dump using the live-confirmed layout `312` table IDs `3598..3609` and `3649`. The `1200200..1200208` probe spawned photocell props and should not be added for this door.

After applying SQL to live MySQL and restarting the map server, verify:

```text
outside gate 1280083 appears in zone 150 and zones into 158
inside gate 1280083 appears in zone 158 and zones back to 150
Tam-Tara battlewarden 1500043 appears near the dungeon-side gate
promoted Tam-Tara interior doors open on spawn after row 2931 and 2945+ are filled with the confirmed layout 312 table IDs
```

## How To Add The Next Confirmed Door

Tam-Tara's interior doors are promoted in the source dump:

```text
Data/sql/server_eventnpc_spawn_locations.sql
Data/sql/server_eventnpc_mapobj.sql
```

Apply that patch to the active database and restart the map server. The previously staged `312 / 3324 / open` tuple was removed because it was proven to spawn and bind but not move or clear the visible door. Use only the live-confirmed table IDs `3598..3609` and `3649`.

When promoting Tam-Tara interior doors, keep row `2931` for the first door and use `2945+` for additional doors because `2932+` are already occupied. Fill in only the confirmed actor class, table instance ID, script filename, and `init` tuple. If promoting an outside normal door from the current DAT lead instead, use:

```text
Data/scripts/unique/fst0Field01/DoorStandard/tam_tara_deepcroft_door_<instanceId>.lua
```

with `init` returning the same `8002, <instanceId>, true` tuple and `onSpawn` playing `open`.

For an inside Deepcroft `DoorServer` map-object instance, add:

```sql
(2931, 5900015, 'tam_tara_deepcroft_door_<instanceId>', 158, '', 0, <x>, <y>, <z>, <rot>, 0)
```

to `server_eventnpc_spawn_locations`, add:

```sql
(2931, 312, <instanceId>)
```

to `server_eventnpc_mapobj`, then add:

```text
Data/scripts/unique/fst0Dungeon02/DoorServer/tam_tara_deepcroft_door_<instanceId>.lua
```

with `init` returning the same `312, <instanceId>, true` tuple and `onSpawn` playing `open`.

If the successful probe uses `5900015` or `5900016`, place the script in `Data/scripts/unique/fst0Dungeon02/DoorServer/`. If it uses `5900001`, place it in `Data/scripts/unique/fst0Dungeon02/DoorStandard/`. Always keep the actor class equal to the successful probe actor class.

Do not use the `1200200..1200208` actor-class/photocell path for row `2931`.

After editing SQL, apply the SQL to the live MySQL database and restart the map server. `!reloadzone` does not reload event NPC rows from DB.

## Current Worktree Note

Door work currently touches:

```text
Data/sql/server_eventnpc_spawn_locations.sql
Data/sql/server_eventnpc_mapobj.sql
Map Server/Actors/Actor.cs
Map Server/Actors/Area/Area.cs
Data/scripts/commands/gm/testtamtaradoors.lua
Data/scripts/commands/gm/testtamtaratriggers.lua
Data/scripts/unique/fst0Dungeon02/ObjectEventDoor/test_tamtara_triggerdoor.lua
Data/scripts/unique/fst0Field01/ObjectEventDoor/test_tamtara_triggerdoor.lua
Data/scripts/commands/gm/testactorclass.lua
Data/scripts/commands/gm/cleartestactorclass.lua
Data/scripts/commands/gm/testmapobjlist.lua
Data/scripts/commands/gm/testmapobjmatrix.lua
Data/scripts/commands/gm/testmapobjstate.lua
Data/scripts/commands/gm/testpushbox.lua
docs/open_world_dungeon_doors.md
docs/open_world_dungeon_doors_handoff.md
Data/scripts/unique/wil0Dungeon04/DoorServer/copperbell_mines_door_*.lua
```

The worktree also shows `Data/scripts/commands/gm/weather.lua` as modified. That is separate from this door handoff.
