# Level 13 City Main Quests Decomp - 2026-07-06

Scope: the three level 13 starter-city main scenario quests that feed the
common level 18 join quest.

| City | Quest | Id | Code | Prereq | Primary local surface |
| --- | --- | ---: | --- | --- | --- |
| Limsa Lominsa | Never the Twain Shall Meet | `110004` | `Man2l0` | `110003` / Legends Adrift | ship private areas plus two-NPC duty |
| Gridania | Beckon of the Elementals | `110008` | `Man2g0` | `110007` / Whispers in the Wood | Spirit of the Wood duty plus festival/Echo chain |
| Ul'dah | Calamity Cometh | `110012` | `Man2u0` | `110011` / Golden Sacrifices | Rururaji cross-script launch plus minemite duty |

`Data/sql/gamedata_quests.sql` lists `110013` / Fade to White / `Man200` at
level 18. Its dependency table has rows for `110004`, `110008`, and `110012`,
so these three are the city-route join points.

## Source Map

| Source | Notes |
| --- | --- |
| `Data/scripts/quests/man/man2l0.lua` | Live Limsa quest adapter, markers, ship routing, duty prompt, reward |
| `Data/scripts/quests/man/man2g0.lua` | Live Gridania quest adapter, Spirit duty bridge, Stillglade/Festival/Echo routing |
| `Data/scripts/quests/man/man2u0.lua` | Live Ul'dah quest adapter, Phrontistery routing, minemite duty bridge |
| `Data/scripts/directors/Quest/QuestDirectorMan2l001.lua` | Live two-combatant Twain duty director |
| `Data/scripts/directors/Quest/QuestDirectorMan2g001.lua` | Live Spirit of the Wood duty director |
| `Data/scripts/directors/Quest/QuestDirectorMan2u001.lua` | Live minemite wave duty director |
| `Data/scripts/base/chara/npc/populace/PopulaceChocoboLender.lua` | Rururaji cross-script route for `Man2u0.processEvent005` |
| `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/*.lua` | Recovered client scenario methods |
| `tools/outputs/lpb/quest_cutscene_decomp_20260618/*` | Cutscene/replay/asset crosschecks |
| `Data/sql/server_eventnpc_spawn_locations.sql` | Static actor, trigger, and private area placement rows |

High-level shape: all three are bespoke quest adapters with custom directors.
They should not be treated as simple one-shot `SimpleQuestBattle` conversions.

## Calamity Cometh

Identity: `Calamity Cometh`, `Man2u0`, quest id `110012`, prereq
`Golden Sacrifices` / `110011`, level `13`.

The recovered client scenario loads text sheet `1367` / `man2u0`. The current
live script now matches that identity in the header and has the active minemite
duty bridge in the quest script plus `QuestDirectorMan2u001`.

### Current Route

| Step | Live server behavior | Recovered client method |
| --- | --- | --- |
| Accept | Momodi offers quest | `processEventMomodiStart`, text `141,142,143` |
| `SEQ_000` | Rururaji at Chocobo Stables is exposed by quest state, but handled by `PopulaceChocoboLender.lua` because actor `1000840` is a chocobo lender | `processEvent005`, scenes `man2u000`, `man2u010`, `MAN2U020` |
| `SEQ_010` | Minemite duty in zone `170`, private area `PrivateAreaMasterPast`, type `5` | Ascilia reminders use `processEvent005_3` / `processEvent005_5` |
| Duty complete | Director sets kill count to `5`, sets complete-pending flag; Ascilia talk/notice finishes | `processEvent030`, scene `man2u030` |
| `SEQ_015` | Phrontistery trigger, Nogeloix reminder | `processEvent040`, `processEvent030_2` |
| `SEQ_020` | Sickrooms private area, ambient patient/caretaker barks | `processEvent040_2` through `040_5`, then `processEvent050` |
| `SEQ_025` | F'lhaminn reminder and sickroom/Phrontistery exits | `processEvent050_2`, `processEvent060` |
| `SEQ_030` | Momodi linkpearl pack, Gogofu ambient talk | `NPCLS_MSGS = {72,73,154}`, `processEvent065_2` |
| `SEQ_035` | Black Brush push | `processEvent070`, scene `man2u070` |
| `SEQ_040` | Arrzaneth/Ossuary push to private crypt area | `processEvent080`, scene `man2u080` |
| `SEQ_045` | Crypt trigger finale chain | `processEvent085`, scenes `man2u085`, `MAN2U090`, `man2u100`, `man2u110` |
| `SEQ_055` | Momodi reward | `processEventSystemMessage`, `sqrwa`, complete, gil/EXP |

### Minemite Duty Notes

The active fight uses `MAN2U0_BATTLE_ZONE = 170`,
`MAN2U0_BATTLE_PRIVATE_AREA = "PrivateAreaMasterPast"`, and
`MAN2U0_BATTLE_PRIVATE_TYPE = 5`. Static spawn rows at that same surface include
Greinfarr, Ascilia, F'lhaminn, and Niellefresne:

| Unique | Actor class | Area |
| --- | ---: | --- |
| `man2u0_seq010_greinfarr` | `2290014` | `170` / `PrivateAreaMasterPast` / `5` |
| `man2u0_seq010_ascilia` | `1000042` | `170` / `PrivateAreaMasterPast` / `5` |
| `man2u0_seq010_flhammin` | `1000038` | `170` / `PrivateAreaMasterPast` / `5` |
| `man2u0_seq010_niellefresne` | `1001867` | `170` / `PrivateAreaMasterPast` / `5` |

There are older-looking `MAN2u0_*` rows in zone `170` private type `1`.
Do not use those for the current minemite duty unless the route is deliberately
being changed; the current helper and director are built around private type `5`.

`QuestDirectorMan2u001` drives five minemites in three waves:

| Wave | Unique IDs |
| ---: | --- |
| 1 | `man2u0_seq010_minemite_01`, `man2u0_seq010_minemite_02` |
| 2 | `man2u0_seq010_minemite_03`, `man2u0_seq010_minemite_04` |
| 3 | `man2u0_seq010_minemite_05` |

Completion is intentionally two-stage. The director marks
`MAN2U0_FLAG_DUTY_COMPLETE_PENDING`, then the quest script finishes through
Ascilia with `processEvent030`, clears duty flags, warps to Ul'dah zone `175`,
sends message `50012`, and advances to `SEQ_015`.

### Calamity Gaps and Safe Next Work

`processEvent005` is not called from `man2u0.lua` directly. Rururaji's actor
class is `/Chara/Npc/Populace/PopulaceChocoboLender`, and
`PopulaceChocoboLender.lua` delegates `processEvent005` through
`GetStaticActor("Man2u0")`, then calls `startMan2u0MinemiteDuty`. Preserve that
cross-script owner when changing the launch route.

`processEvent065_2` is now safe to bind to Gogofu during `SEQ_030`; the local
script has `GOGOFU = 1000046`, the public spawn exists in Ul'dah zone `209`, and
the method is dialogue-only.

`processEvent070_2` should stay unbound for now. The recovered method is
dialogue-only, but the likely Qoqoba actor class `1000855` only appears as
`MAN1u0_qoqoba` in the current static spawn table. There is no local `Man2u0`
Qoqoba spawn/owner yet.

The current reward path still grants `30000` gil and `50000` EXP at Momodi. The
grand-company issuance item lines remain commented out, matching the sibling
scripts.

## Never the Twain Shall Meet

Identity: `Never the Twain Shall Meet`, `Man2l0`, quest id `110004`, prereq
`Legends Adrift` / `110003`, level `13`.

The live adapter is a ship/private-area route with a bespoke two-NPC duty in
zone `192`, `PrivateAreaMasterPast`, type `0`.

| Step | Live server behavior | Recovered client method |
| --- | --- | --- |
| Accept | Baderon accepts quest | `processEvent000` |
| `SEQ_000` | Hob/docks lead to ship private area | `processEvent010`, scenes `man2l010`, `man2l011`; Baderon reminder `processEvent000_2` |
| `SEQ_010` | Ship upper deck, enter hold | `processEvent012`, scene `man2l012` |
| `SEQ_015` | Exit hold, reach duty prompt | `contentsJoinAskInBasaClass`, then `processEvent013` |
| `SEQ_020` | Twain duty vs Emerick/Merodaulyn | `processEvent020`, scenes `man2l020`, `MAN2L030`, `man2l040` |
| `SEQ_035` | Return to Baderon | `processEvent050` |
| `SEQ_037` | Sea field push | `processEvent060` |
| `SEQ_040` | Baderon linkpearl pack | `NPCLS_MSGS = {40,41}` |
| `SEQ_042` | Musketeers' Guild push | `processEvent070` |
| `SEQ_045` | Isaudorel | `processEvent075` |
| `SEQ_050` | God's Grip push | `processEvent080` |
| `SEQ_055` | Y'shtola subecho / final sea field push | `processEvent080_2`, then `processEvent081` |
| `SEQ_070` | Baderon reward | `processEvent081_2`, `sqrwa`, complete, gil/EXP |

Duty notes:

- `startMan2l0TwainDuty` normalizes the duty side counter and creates
  `Quest/QuestDirectorMan2l001` in zone `192` private type `0`.
- The director spawns combat versions of Emerick and Merodaulyn and restores
  story actors after duty cleanup.
- Completion is also two-stage: the director sets
  `MAN2L0_FLAG_DUTY_COMPLETE_PENDING`, and the quest trigger later calls
  `processEvent020(side)`, advances to `SEQ_035`, and warps back to zone `230`.
- `processEvent020` passes the side argument into `man2l020`; the replay table
  has two `man2l020` rows (`11000405` and `11000406`) for that side-dependent
  cutscene.

Replay caution: `man2l000`, `man2l001`, and `man2l002` are referenced by the
`Man2l0` preview dispatcher, but their replay rows are attached to `110003`
/ Legends Adrift. Do not treat those as new `110004` mainline steps.

## Beckon of the Elementals

Identity: `Beckon of the Elementals`, `Man2g0`, quest id `110008`, prereq
`Whispers in the Wood` / `110007`, level `13`.

There is already a deeper note in
`docs/beckon_elementals_instance_cutscene_decomp_2026-07-01.md`; this section
is the quick route map for the trio.

| Step | Live server behavior | Recovered client method |
| --- | --- | --- |
| Accept | Miounne accepts quest | `processEventMiounneStart` |
| `SEQ_000` | Nonolato at Archer's Guild | `processEvent007`, scene `man1g900` |
| `SEQ_003` | O-App-Pesi prompt starts duty when answer is `1` | `processEvent007_2`, scene `man2g000` |
| `SEQ_004` | Spirit of the Wood fight | Director kill path calls `processEvent010`, scene `man2g010` |
| `SEQ_005` | A'naidjaa/Oak Atrium handoff | `processEvent020`, scene `man2g020`, then linkpearl pack 1 |
| `SEQ_010` | Miounne linkpearl | pack `65,66,67` advances to `SEQ_015` |
| `SEQ_015` | Soileine at Stillglade Fane | `processEvent030`, scene `man2g030` |
| `SEQ_020` | Stillglade private area ambient barks and guild push | `processEvent030_2` through `030_9`, then `processEvent040` |
| `SEQ_025` | Fye/O-App flag gate | `processEvent045`, `processEvent045_2`, `processEvent050` |
| `SEQ_030` | Miounne linkpearl | pack `112,113,114,115` advances to `SEQ_035` |
| `SEQ_035` | Mih Khetto's Amphitheatre push | `processEvent060`, scene `man2g060` |
| `SEQ_040` | Festival private area | many `processEvent060_*` barks, Fye calls `processEvent070` |
| `SEQ_045` | Echo forest beat | Yda/Papalymo barks, push calls `processEvent080` |
| `SEQ_060` | Miounne reward | `processEvent080_01`, `sqrwa`, complete, gil/EXP |

Duty notes:

- The active Spirit duty surface is zone `153`, `PrivateAreaMasterPast`, type
  `1`.
- `doSEQ004CombatInstance` sets a boundary line, creates
  `Quest/QuestDirectorMan2g001`, zones the player to the fight, and registers
  the director as the login director.
- The director spawns `SPIRIT_OF_THE_WOOD = 2105201` with BNPC/mob type `1364`
  and unique `man2g0_spirit_of_the_wood`, plus Gridanian allies and the burning
  tree effect.
- On Spirit kill, the director calls `processEvent010`, starts `SEQ_005`,
  finishes content if possible, warps back to Gridania zone `206`, and ends the
  director.

## Cutscene and Replay Spine

Asset crosscheck rows show all scenes below exist in Lua refs, cutReplay, and
client cut assets. Uppercase sample keys like `MAN2U020`, `MAN2G090`, and
`MAN2L090` normalize to lowercase scene keys in the asset inventory.

| Code | Method | Scenes / replay ids |
| --- | --- | --- |
| `man2u0` | `processEvent005` | `man2u000` / `11001201`, `man2u010` / `11001202`, `MAN2U020` / `11001203` |
| `man2u0` | `processEvent030` | `man2u030` / `11001204` |
| `man2u0` | `processEvent040` | `man2u040` / `11001205` |
| `man2u0` | `processEvent050` | `man2u050` / `11001206` |
| `man2u0` | `processEvent060` | `man2u060` / `11001207` |
| `man2u0` | `processEvent070` | `man2u070` / `11001208` |
| `man2u0` | `processEvent080` | `man2u080` / `11001209` |
| `man2u0` | `processEvent085` | `man2u085` / `11001210`, `MAN2U090` / `11001211`, `man2u100` / `11001212`, `man2u110` / `11001213` |
| `man2g0` | `processEvent007` | `man1g900` / `11000801` |
| `man2g0` | `processEvent007_2` | `man2g000` / `11000802` |
| `man2g0` | `processEvent010` | `man2g010` / `11000803` |
| `man2g0` | `processEvent020` | `man2g020` / `11000804` |
| `man2g0` | `processEvent030` | `man2g030` / `11000805` |
| `man2g0` | `processEvent040` | `man2g040` / `11000806` |
| `man2g0` | `processEvent050` | `man2g050` / `11000807` |
| `man2g0` | `processEvent060` | `man2g060` / `11000808` |
| `man2g0` | `processEvent070` | `man2g070` / `11000809` |
| `man2g0` | `processEvent080` | `man2g080` / `11000810`, `MAN2G090` / `11000811`, `man2g095` / `11000812`, `man2g100` / `11000813` |
| `man2l0` | `processEvent010` | `man2l010` / `11000401`, `man2l011` / `11000402` |
| `man2l0` | `processEvent012` | `man2l012` / `11000403` |
| `man2l0` | `processEvent013` | `man2l013` / `11000404` |
| `man2l0` | `processEvent020` | `man2l020` / `11000405` and `11000406`, `MAN2L030` / `11000407`, `man2l040` / `11000408` |
| `man2l0` | `processEvent060` | `man2l060` / `11000409` |
| `man2l0` | `processEvent070` | `man2l070` / `11000410` |
| `man2l0` | `processEvent075` | `man2l075` / `11000411` |
| `man2l0` | `processEvent080` | `man2l080` / `11000412` |
| `man2l0` | `processEvent081` | `man2l081` / `11000413`, `MAN2L090` / `11000414`, `man2l100` / `11000415`, `man2l110` / `11000416` |

## Binding Appendix

This section is meant as the quick "what can I wire next?" pass. It separates
mainline methods, ambient/reminder methods, and parked methods that need more
proof before being bound.

### `Man2u0` Binding State

| Method | Current state | Notes |
| --- | --- | --- |
| `processEventMomodiStart` | Wired | Accept from Momodi |
| `processEvent000_2` | Wired | Momodi reminder during `SEQ_000` |
| `processEvent005` | Wired cross-script | Called by `PopulaceChocoboLender.lua` for Rururaji, then starts the minemite duty |
| `processEvent005_3` | Wired | Ascilia pre-duty instruction |
| `processEvent005_5` | Wired | Ascilia active-duty reminder |
| `processEvent030` | Wired | Minemite duty completion scene |
| `processEvent030_2` | Wired | Nogeloix Phrontistery reminder |
| `processEvent040` | Wired | Phrontistery private-area entry scene |
| `processEvent040_2` | Wired | Worrisome Assistant ambient |
| `processEvent040_4` | Wired | Well-washed Leech ambient |
| `processEvent040_5` | Wired | Chapeaued Chap ambient |
| `processEvent050` | Wired | Sickroom scene into `SEQ_025` |
| `processEvent050_2` | Wired | F'lhaminn reminder |
| `processEvent060` | Wired | Exit from sickroom/Phrontistery into linkpearl step |
| `processEvent065_2` | Wired | Gogofu ambient in `SEQ_030` |
| `processEvent070` | Wired | Black Brush push |
| `processEvent080` | Wired | Arrzaneth/Ossuary push into crypt private area |
| `processEvent085` | Wired | Crypt/finale cutscene chain |
| `processEventSystemMessage` | Wired | Final travel-to-Ul'dah-market-ward message at completion |
| `processEvent005_2` | Parked | Dialogue-only, likely an immediate post-`processEvent005` panic bark; no current actor owner found |
| `processEvent005_4` | Parked | Gold-powder reminder variant; could bind to Ascilia/Greinfarr only after live prompt flow proves missing |
| `processEvent005_6` / `005_7` | Parked | Greinfarr-style lure-to-me reminders; no current local talk owner |
| `processEvent040_3` | Parked | "Ow! Quit it" sickroom bark; no current matching actor constant |
| `processEvent070_2` | Parked | Likely Qoqoba/exile aftermath bark; current static spawn only has `MAN1u0_qoqoba` |

`processEvent005` is the weird one worth remembering. The quest marks Rururaji
as an ENPC, but Rururaji's actor class is the chocobo lender script. That script
delegates to `GetStaticActor("Man2u0")`, then calls `startMan2u0MinemiteDuty`.
Moving the call into `man2u0.lua:onTalk` would duplicate or bypass the actual
actor owner.

### `Man2g0` Binding State

| Method group | Current state | Notes |
| --- | --- | --- |
| `processEventMiounneStart` | Wired | Accept from Miounne |
| `processEvent007`, `007_2` | Wired | Nonolato lead-in and O-App duty prompt |
| `processEvent010` | Wired by director | Spirit kill-success cutscene |
| `processEvent010_2` | Wired | Miounne reminder after Spirit fight |
| `processEvent020`, `020_2` | Wired | A'naidjaa handoff and Miounne reminder |
| `processEvent030`, `030_2` through `030_9` | Wired | Stillglade entry and ambient barks |
| `processEvent040`, `040_2`, `040_3`, `040_4` | Wired | Stillglade push plus Seq025 ambient/blocked variants |
| `processEvent045`, `045_2` | Wired | Fye first/repeat talk gate |
| `processEvent050`, `050_2` | Wired | O-App transition and Miounne reminder |
| `processEvent060`, `060_2` through `060_26` | Wired | Amphitheatre scene plus festival ambient barks |
| `processEvent070`, `070_2`, `070_3` | Wired | Fye transition plus Yda/Papalymo ambient |
| `processEvent080` | Wired | Four-scene Echo/finale chain |
| `processEvent080_01` | Wired | Final system message wrapper before reward |
| `processEvent005_2` | Parked | Miounne "Dunstan remains unfound" reminder; no current server binding |
| `processEvent007_2_2` | Parked | Alternate O-App prompt shape without cutscene launch; do not swap until the current result flow fails |
| `processEvent007_3` | Parked | Short pre-duty reminder; no active binding |
| `processEvent020_3` | Parked | Single-line reminder, no active binding |
| `processEvent040_5` / `040_6` | Parked | Recovered dialogue-only variants, no current actor owner |
| `processEvent1000_1`, `1000_2`, `Trial001`, `Trial002` | Parked | Trial/helper methods outside the current live route |

The current live script still contains an old commented experimental
`doSEQ004CombatInstance` block near the end. Treat the active implementation at
the real `doSEQ004CombatInstance` function as authoritative.

### `Man2l0` Binding State

| Method | Current state | Notes |
| --- | --- | --- |
| `processEvent000`, `000_2` | Wired | Accept and Baderon reminder |
| `processEvent010` | Wired | Hob ship handoff, scenes `man2l010` and `man2l011` |
| `processEvent010_2` | Wired | Hob return-to-ship prompt |
| `processEvent010_3` | Wired | Hob public reminder |
| `processEvent011_2` | Wired | Return-to-public prompt from ship |
| `processEvent011_3`, `011_4` | Wired | Barracuda knight barks |
| `processEvent012` | Wired | Enter hold |
| `processEvent013` | Wired | Duty start scene after join prompt |
| `processEvent020` | Wired | Duty completion, takes side argument |
| `processEvent050`, `050_2` | Wired | Baderon route/reminder |
| `processEvent060`, `060_2` | Wired | Sea field push and Baderon post-linkpearl reminder |
| `processEvent070` | Wired | Musketeers' Guild push |
| `processEvent075` | Wired | Isaudorel |
| `processEvent080`, `080_2` | Wired | God's Grip push and Y'shtola ambient |
| `processEvent081`, `081_2` | Wired | Final scene chain and completion message wrapper |
| `processEventquestmanOffer` | Parked | Empty/recovered offer helper, not used by local server route |
| `processEvent030` | Parked | Fade/default helper only |
| `processEvent075_2`, `075_3` | Parked | Extra dialogue barks without current server owner |
| `processEventTalkMenuManCutPreview` | Parked | Replay/preview dispatcher; not a quest progression method |

The Twain duty side is important. `processEvent020(side)` feeds the side into
`man2l020`; replay has two `man2l020` rows, so probe both Emerick and Merodaulyn
completion outcomes before declaring the duty fully proven.

## Static Spawn Nuggets

The static spawn table has enough placement data to explain most route jumps:

| Quest | Surface | Useful rows |
| --- | --- | --- |
| `Man2u0` | Ul'dah public | Momodi `1000841`, Rururaji `1000840`, Gogofu `1000046`, Black Brush trigger `1090169`, Arrzaneth trigger `1090253` |
| `Man2u0` | Minemite duty | Zone `170`, `PrivateAreaMasterPast`, type `5`: Greinfarr, Ascilia, F'lhaminn, Niellefresne |
| `Man2u0` | Phrontistery/sickroom | Zone `181` private types `8`, `9`, and `10`: sickroom trigger, exits, Well-washed Leech, Worrisome Assistant, Chapeaued Chap, F'lhaminn |
| `Man2u0` | Crypt finale | Zone `209`, `PrivateAreaMasterPast`, type `7`: closed gate and crypt trigger |
| `Man2g0` | O-App prompt | Zone `206`, `PrivateAreaMasterPast`, type `9` |
| `Man2g0` | Spirit duty | Zone `153`, `PrivateAreaMasterPast`, type `1`, static ally placements and private-area exit |
| `Man2g0` | Stillglade/Festival | Zone `206`, private types `10`, `11`, and `12`, with the large ambient cast |
| `Man2g0` | Echo push | Zone `153`, `PrivateAreaMasterPast`, type `2`, Yda/Papalymo and push actor |
| `Man2l0` | Ship intro | Zone `230`, `PrivateAreaMasterPast`, type `8`, Hob and private-area exit |
| `Man2l0` | Ship/duty deck | Zone `192`, `PrivateAreaMasterPast`, type `0`, Hob, Barracuda knights, duty prompt, and door map object |
| `Man2l0` | Hold | Zone `192`, `PrivateAreaMasterPast`, type `1`, lower ship event door |
| `Man2l0` | La Noscea Echo | Zone `128`, public and private type `3`, sea field pushes and Y'shtola |

These rows are useful for marker and owner recovery, but they are not all
equally authoritative for current behavior. For `Man2u0`, prefer the lower-case
type `5` minemite rows over the older `MAN2u0_*` type `1` rows when debugging
the active duty.

## Transition Matrix

These are the high-value route edges. They are the places where a missing
`EndEvent`, missing zone change, bad owner script, or stale sequence will break
the quest even if the cutscene itself exists.

### `Man2u0`

| From | Owner/action | Client method | Server result |
| --- | --- | --- | --- |
| Accept | Momodi talk | `processEventMomodiStart` | Accept quest, start `SEQ_000` |
| `SEQ_000` | Rururaji via `PopulaceChocoboLender.lua` | `processEvent005` | Start minemite duty, set `SEQ_010`, zone `170` private type `5` |
| `SEQ_010` duty pending | Ascilia talk or notice | `processEvent030` | Clear duty flags, zone `175`, start `SEQ_015` |
| `SEQ_015` | Phrontistery trigger | `processEvent040` | Zone `181` private type `8`, start `SEQ_020` |
| `SEQ_020` | Sickroom trigger | `processEvent050` | Warp sickroom type `9`, start `SEQ_025` |
| `SEQ_025` | Phrontistery exit trigger | `processEvent060` | Zone public `209`, start NPC linkpearl, start `SEQ_030` |
| `SEQ_030` | Linkpearl pack end | none | Start `SEQ_035` |
| `SEQ_035` | Black Brush trigger | `processEvent070` | Start `SEQ_040` |
| `SEQ_040` | Arrzaneth trigger | `processEvent080` | Warp crypt private type `7`, start `SEQ_045` |
| `SEQ_045` | Crypt trigger | `processEvent085` | Zone `175`, start `SEQ_055` |
| `SEQ_055` | Momodi talk | `processEventSystemMessage`, `sqrwa` | Complete, gil, EXP |

Interesting recovery paths:

- `SEQ_010` can restart from Rururaji through the chocobo lender if the duty did
  not complete.
- `SEQ_010` with `MAN2U0_FLAG_DUTY_COMPLETE_PENDING` finishes from Ascilia by
  talk or notice, which protects the handoff if the completion event cannot be
  kicked directly by the director.
- `SEQ_020` and `SEQ_025` both let the Phrontistery trigger re-enter the private
  area.

### `Man2g0`

| From | Owner/action | Client method | Server result |
| --- | --- | --- | --- |
| Accept | Miounne talk | `processEventMiounneStart` | Accept quest, start `SEQ_000` |
| `SEQ_000` | Nonolato talk | `processEvent007` | Warp O-App prompt area type `9`, start `SEQ_003` |
| `SEQ_003` | O-App talk, answer yes | `processEvent007_2` | Start Spirit duty, set `SEQ_004`, zone `153` private type `1` |
| `SEQ_004` | Director Spirit kill | `processEvent010` | Zone `206`, start `SEQ_005` |
| `SEQ_005` | A'naidjaa talk | `processEvent020` | Start NPC linkpearl, start `SEQ_010` |
| `SEQ_010` | Linkpearl pack end | none | Start `SEQ_015` |
| `SEQ_015` | Soileine talk | `processEvent030` | Warp Stillglade type `10`, start `SEQ_020` |
| `SEQ_020` | CNJ guild push | `processEvent040` | Warp Stillglade type `11`, start `SEQ_025` |
| `SEQ_025` | Fye first talk | `processEvent045` | Set `FLAG_SEQ025_FYE` |
| `SEQ_025` | O-App after Fye flag | `processEvent050` | Start NPC linkpearl, warp public, start `SEQ_030` |
| `SEQ_030` | Linkpearl pack end | none | Start `SEQ_035` |
| `SEQ_035` | Amphitheatre push | `processEvent060` | Warp festival type `12`, start `SEQ_040` |
| `SEQ_040` | Fye talk | `processEvent070` | Zone `153` private type `2`, start `SEQ_045` |
| `SEQ_045` | Echo push | `processEvent080` | Zone `155`, start `SEQ_060` |
| `SEQ_060` | Miounne talk | `processEvent080_01`, `sqrwa` | Complete, gil, EXP |

Interesting recovery paths:

- `SEQ_003` and `SEQ_004` both allow returning to the O-App prompt surface from
  Nonolato.
- `SEQ_004` can relaunch the duty from either O-App or `OAPPPESI_SEQ004`.
- Several late sequences route the amphitheatre push back into the festival
  private area. That is intentional re-entry behavior, not dead code.

### `Man2l0`

| From | Owner/action | Client method | Server result |
| --- | --- | --- | --- |
| Accept | Baderon talk | `processEvent000` | Accept quest, start `SEQ_000` |
| `SEQ_000` | Docks trigger | none | Warp ship intro type `8` |
| `SEQ_000` | Hob in private ship intro | `processEvent010` | Zone ship deck type `0`, start `SEQ_010` |
| `SEQ_010` | Ship door 1 | `processEvent012` | Warp hold type `1`, start `SEQ_015` |
| `SEQ_015` | Ship door 2 | none | Warp duty prompt on ship deck type `0` |
| `SEQ_015` | Duty prompt, answer yes | `contentsJoinAskInBasaClass`, `processEvent013` | Start Twain duty, set `SEQ_020`, zone battle coords |
| `SEQ_020` duty pending | Duty trigger | `processEvent020(side)` | Clear duty flags, zone `230`, start `SEQ_035` |
| `SEQ_035` | Baderon talk | `processEvent050` | Start `SEQ_037` |
| `SEQ_037` | Sea field push 1 | `processEvent060` | Start NPC linkpearl, start `SEQ_040` |
| `SEQ_040` | Linkpearl pack end | none | Start `SEQ_042` |
| `SEQ_042` | MSK guild push | `processEvent070` | Start `SEQ_045` |
| `SEQ_045` | Isaudorel talk | `processEvent075` | Start `SEQ_050` |
| `SEQ_050` | Sea field push 2 | `processEvent080` | Zone `128` private type `3`, start `SEQ_055` |
| `SEQ_055` | Sea field push 3 | `processEvent081` | Zone `133`, start `SEQ_070` |
| `SEQ_070` | Baderon talk | `processEvent081_2`, `sqrwa` | Complete, gil, EXP |

Interesting recovery paths:

- Hob can move the player between public docks, ship intro, and ship deck using
  ask-return methods.
- The duty director intentionally does not kick `processEvent020` itself. The
  local comment says doing so can double-kick the after-warp event owner; the
  quest trigger owns that handoff.
- `SEQ_055` lets the second sea field trigger replay `processEvent080` and
  re-enter the private type `3` area.

## Marker Matrix

Marker notes are useful because several quest steps intentionally point at a
public re-entry actor rather than the private actor where the next scene occurs.

### `Man2u0`

| Sequence | Marker behavior |
| --- | --- |
| `SEQ_000` | `MRKR_RURURAJI`; also reused for `SEQ_010` when public |
| `SEQ_015` / `SEQ_020` / `SEQ_025` | `MRKR_PHRONTISTERTY`, including public re-entry |
| `SEQ_035` | `MRKR_BLACKBRUSH` |
| `SEQ_040` | `MRKR_ARRZANETH` |
| `SEQ_045` | private crypt marker when private, otherwise `MRKR_ARRZANETH` |
| `SEQ_055` | temporary `MRKR_MOMODI = 11001001` until `sqrwa`/Quicksand reward routing is cleaned up |

Defined but currently not inserted by the local marker function:
`MRKR_BATTLE` and `MRKR_FLHAMMIN`. They may be DAT-correct, but the live route
uses Rururaji/Ascilia and direct private-area duty flow instead.

### `Man2g0`

| Sequence | Marker behavior |
| --- | --- |
| `SEQ_000` | `MRKR_NONOLATO` |
| `SEQ_003` | private `MRKR_SEQ003OAPPPESI`, otherwise `MRKR_NONOLATO` |
| `SEQ_004` | fallback `MRKR_NONOLATO` if outside duty |
| `SEQ_005` | `MRKR_ANAIDJAA` |
| `SEQ_015` | `MRKR_SOILEINE` |
| `SEQ_020` | private push `MRKR_PSHCNJGUILD`, otherwise `MRKR_SOILEINE` |
| `SEQ_025` | `MRKR_FYE` until Fye flag, then `MRKR_CNJOAPPPESI`; outside private area falls back to `MRKR_SOILEINE` |
| `SEQ_035` | `MRKR_AMPHITHEATRE` |
| `SEQ_040` | private `MRKR_FYE2`, otherwise `MRKR_AMPHITHEATRE` |
| `SEQ_045` | private `MRKR_PSHCUTSCENE`, otherwise `MRKR_AMPHITHEATRE` |

### `Man2l0`

| Sequence | Marker behavior |
| --- | --- |
| `SEQ_000` | private ship uses `MRKR_HOB`; public uses `MRKR_PSHSHIP` |
| `SEQ_010` / `SEQ_015` / `SEQ_020` | private ship uses `MRKR_PSHSHIP2`, otherwise `MRKR_HOB`; duty completion is prompt-owned |
| `SEQ_035` | `MRKR_BADERON` |
| `SEQ_037` | `MRKR_S037_SEAFLD1` |
| `SEQ_042` | `MRKR_PSHMSKGUILD` |
| `SEQ_045` | `MRKR_ISAUDOREL` |
| `SEQ_050` | `MRKR_S050_SEAFLD2` |
| `SEQ_055` | private `MRKR_PSHSEAFLD`, otherwise `MRKR_S050_SEAFLD2` |
| `SEQ_070` | `MRKR_BADERON` |

## Director Handoff Contracts

| Quest | Director success handoff | Director failure handoff |
| --- | --- | --- |
| `Man2u0` | Sets minemite kill counter to `5`, clears active flag, sets complete-pending flag, then relies on Ascilia talk/notice to run `processEvent030` | Clears active/complete-pending flags, resets counter, finishes content area, may zone or end director depending on player presence |
| `Man2g0` | Director itself calls `processEvent010`, starts `SEQ_005`, finishes content, zones to `206`, ends director | Marks failed, logs or sends system error, cleans up spawned actors/effects, ends director on timeout or spawn failure |
| `Man2l0` | Sets side counter, clears active flag, sets complete-pending flag, and lets the duty trigger own `processEvent020(side)` | Clears duty flags, restores story actors, zones the player back to the retry/battle surface, ends director |

That asymmetry matters. Do not copy the Beckon director pattern into Twain or
Calamity without also changing the quest-side completion owner.

## Actor Owner Cheat Sheet

These tables map the live local owner to the recovered client method. They are
the fastest way to avoid binding a method to the wrong script.

### `Man2u0`

| Owner | Id | Sequences | Methods / behavior |
| --- | ---: | --- | --- |
| Momodi | `1000841` | Accept, `SEQ_000`, `SEQ_055` | `processEventMomodiStart`, `processEvent000_2`, final `processEventSystemMessage` and `sqrwa` |
| Rururaji | `1000840` | `SEQ_000`, `SEQ_010` | Owned by `PopulaceChocoboLender.lua`; calls `processEvent005`, then starts/restarts minemite duty |
| Ascilia | `1000042` | `SEQ_010` | `processEvent005_3`, `processEvent005_5`, and completion through `processEvent030` when pending |
| F'lhaminn | `1000038` | `SEQ_025` | `processEvent050_2` reminder |
| Nogeloix | `1000597` | `SEQ_015` | `processEvent030_2` reminder |
| Worrisome Assistant | `1001207` | `SEQ_020`, `SEQ_025` | `processEvent040_2` ambient |
| Well-washed Leech | `1001210` | `SEQ_020`, `SEQ_025` | `processEvent040_4` ambient |
| Chapeaued Chap | `1001277` | `SEQ_020`, `SEQ_025` | `processEvent040_5` ambient |
| Gogofu | `1000046` | `SEQ_030` | `processEvent065_2` ambient |
| Phrontistery trigger | `1090119` | `SEQ_015`, `SEQ_020`, `SEQ_025` | `processEvent040`, zone `181` type `8` |
| Sickroom trigger | `1090118` | `SEQ_020` | `processEvent050`, warp type `9`, start `SEQ_025` |
| Private-area exit trigger | `1090144` | `SEQ_020` | Return public `209`, start `SEQ_015` |
| Sickroom exit trigger | `1090141` | `SEQ_025` | Warp type `10` |
| Phrontistery exit trigger | `1090168` | `SEQ_025` | `processEvent060`, public `209`, linkpearl, start `SEQ_030` |
| Black Brush trigger | `1090169` | `SEQ_035` | `processEvent070`, start `SEQ_040` |
| Arrzaneth trigger | `1090253` | `SEQ_040`, `SEQ_045` | `processEvent080`, warp crypt type `7` |
| Crypt trigger | `1090131` | `SEQ_045` | `processEvent085`, zone `175`, start `SEQ_055` |
| Hahayo / Rorojaru | `1000047` / `1000374` | Exposed ENPCs | No current recovered method binding in local `onTalk`; keep as ambient placeholders |

### `Man2g0`

| Owner | Id | Sequences | Methods / behavior |
| --- | ---: | --- | --- |
| Miounne | `1000230` | Accept, `SEQ_005`, `SEQ_015`, `SEQ_035`, `SEQ_060` | Accept, reminders, final `processEvent080_01` and `sqrwa` |
| Nonolato | `1000463` | `SEQ_000`, `SEQ_003`, `SEQ_004` | `processEvent007`, prompt-area recovery |
| O-App-Pesi | `1000033` | `SEQ_003`, `SEQ_004`, `SEQ_025` | `processEvent007_2`, `processEvent040_4`, `processEvent050` |
| O-App-Pesi duty | `1000235` | `SEQ_004` | Relaunches Spirit duty |
| A'naidjaa | `1000465` | `SEQ_005` | `processEvent020`, starts linkpearl pack 1 |
| Soileine | `1000234` / `1700030` | `SEQ_015`, `SEQ_020`, `SEQ_025` | `processEvent030`, `processEvent030_2`, re-entry to Stillglade |
| Stillglade ambient cast | many | `SEQ_020`, `SEQ_025` | `processEvent030_3` through `030_9`, plus `040_2`, `040_3` |
| Fye | `1000014` | `SEQ_025`, `SEQ_040` | `processEvent045`, `045_2`, and `processEvent070` |
| CNJ guild push | `1090178` | `SEQ_020` | `processEvent040`, warp type `11`, start `SEQ_025` |
| Amphitheatre push | `1090179` | `SEQ_035` through `SEQ_055` | `processEvent060`, re-entry to festival type `12` |
| Festival cast | many | `SEQ_040` | `processEvent060_2` through `060_26` |
| Yda / Papalymo | `1000009` / `1000010` | `SEQ_040`, `SEQ_045` | Festival barks, then `processEvent070_2`, `070_3` |
| Echo push | `1090180` | `SEQ_045` | `processEvent080`, zone `155`, start `SEQ_060` |

### `Man2l0`

| Owner | Id | Sequences | Methods / behavior |
| --- | ---: | --- | --- |
| Baderon | `1000137` | Accept, `SEQ_000`, `SEQ_035`, `SEQ_037`, `SEQ_042`, `SEQ_070` | Accept, reminders, final `processEvent081_2` and `sqrwa` |
| Hob | `1000151` | `SEQ_000` through `SEQ_020` | Ship intro, return prompts, public/private ship travel |
| Barracuda knights | `1000183`, `1000184` | `SEQ_010` through `SEQ_020` | `processEvent011_3`, `011_4` |
| Docks trigger | `1090386` | `SEQ_000` through `SEQ_020` | Warp to ship intro type `8` |
| Ship door 1 | `1090098` | `SEQ_010` | `processEvent012`, warp hold type `1`, start `SEQ_015` |
| Ship door 2 | `1090099` | `SEQ_015` | Warp duty prompt type `0` |
| Duty prompt | `1090085` | `SEQ_015`, `SEQ_020` | Join prompt, `processEvent013`, then completion `processEvent020(side)` |
| Sea field push 1 | `1090082` | `SEQ_037` | `processEvent060`, linkpearl, start `SEQ_040` |
| MSK guild push | `1090003` | `SEQ_042` | `processEvent070`, start `SEQ_045` |
| Isaudorel | `1000152` | `SEQ_045` | `processEvent075`, start `SEQ_050` |
| Sea field push 2 | `1090086` | `SEQ_050`, `SEQ_055` | `processEvent080`, re-enter Echo private type `3` |
| Sea field push 3 | `1090087` | `SEQ_055` | `processEvent081`, zone `133`, start `SEQ_070` |
| Y'shtola | `1000001` | `SEQ_055` | `processEvent080_2` ambient |

## Safe Patch Queue

Small, low-risk next moves:

1. `Man2u0`: add temporary runtime logging around the Rururaji
   `PopulaceChocoboLender.lua` branch to confirm `processEvent005` returns and
   `startMan2u0MinemiteDuty` succeeds before touching the quest script.
2. `Man2u0`: keep `processEvent065_2` as the only new ambient bind until a live
   pass confirms Gogofu is visible in `SEQ_030`.
3. `Man2u0`: find a real owner/spawn for `processEvent040_3` and
   `processEvent070_2` before binding them. The second one is the Qoqoba-shaped
   gap.
4. `Man2g0`: probe O-App prompt result logging before changing
   `processEvent007_2`; the alternate `processEvent007_2_2` lacks the cutscene
   launch and is probably not the intended mainline route.
5. `Man2g0`: if Spirit loading fails, log in this order: prompt result,
   `GetArea(153, "PrivateAreaMasterPast", 1)`, director creation, Spirit spawn,
   and kill callback.
6. `Man2l0`: verify both `MAN2L0_SIDE_EMERICK` and
   `MAN2L0_SIDE_MERODAULYN` through `processEvent020(side)` before adjusting
   duty completion, because replay has two `man2l020` rows.
7. All three: leave the commented grand-company issuance grants alone until the
   reward contract is proven against the later `Fade to White` join.

Avoid for now:

- Do not move `Man2u0.processEvent005` out of `PopulaceChocoboLender.lua`
  without replacing the actual Rururaji actor owner.
- Do not bind `Man2u0.processEvent070_2` to Qoqoba using the `MAN1u0_qoqoba`
  spawn.
- Do not make Twain or Calamity directors kick their post-duty cutscene
  directly just because Beckon does; their quest scripts own those handoffs.
- Do not treat the `Man2l0` replay preview dispatcher as progression logic.

## Additional Confidence Pass

This is the "am I comfortable patching from this?" pass after checking the
raw recovered Lua, live adapters, actor class rows, static spawns, cutReplay
joins, and director handoffs.

### `Man2u0`

The remaining parked methods are not hiding extra cutscene flow. The recovered
client methods below are all dialogue-only, with no fade, no scene launcher,
and no required payload arguments:

| Method | Text ids | Confidence read |
| --- | --- | --- |
| `processEvent005_2` | `162`, `163` | Panic bark about F'lhaminn; no live owner found |
| `processEvent005_4` | `172` | Gold-dust instruction variant; likely redundant with Ascilia's wired `005_3` / `005_5` |
| `processEvent005_6` / `005_7` | `174`, `175` | Greinfarr-style lure barks, but active Greinfarr is not a talk owner |
| `processEvent040_3` | `168` | Sickroom "Ow!" bark; no actor constant or static owner found |
| `processEvent070_2` | `158`, `159` | Exile/Thancred aftermath bark; Qoqoba-shaped, but no `Man2u0` Qoqoba spawn exists |

Actor-class evidence backs up leaving them parked:

- Rururaji `1000840` is `/Chara/Npc/Populace/PopulaceChocoboLender`, so
  `processEvent005` belongs in `PopulaceChocoboLender.lua`. A generated
  owner-inference atlas still points at Momodi for this scene, but that is
  stale for the live route because it does not account for the cross-script
  actor owner.
- Active Greinfarr in the minemite duty is `2290014`,
  `/Chara/Npc/Monster/Fighter/FighterAllyOpeningAttacker`, with no talk
  event conditions. That makes `processEvent005_6` and `005_7` unsafe to bind
  unless Greinfarr is reintroduced as a real talk ENPC.
- Older Greinfarr `1000039` appears in earlier `Man1u0` sickroom rows, not the
  active `Man2u0` minemite duty surface.
- Qoqoba `1000855` appears as `MAN1u0_qoqoba` in zone `181` private type `7`;
  no `MAN2u0`/`man2u0` Qoqoba row was found.
- The active minemite private area is still the lower-case zone `170`,
  `PrivateAreaMasterPast`, type `5` surface. The older upper-case `MAN2u0_*`
  type `1` rows remain useful history but should not drive this route.

Comfort verdict: no more broad decomp needed for `Calamity Cometh`. The only
remaining work should be runtime probes: Rururaji launch, minemite completion,
Gogofu visibility, Momodi reward marker, and any missing bark reported during
play.

### `Man2g0`

The O-App duty prompt is comfortable enough to leave as-is. The recovered
`processEvent007_2` says text `246`, asks text `240`, plays `man2g000` when the
answer is `1`, and returns the ask result. The live script uses exactly that
result to call `doSEQ004CombatInstance`.

`processEvent007_2_2` is not a better mainline replacement. It has the same
talk/ask surface but omits the `man2g000` scene launcher, so it is best read as
an alternate helper or failed branch, not the primary duty launch.

The late parked Beckon helpers are also non-blocking:

- `processEvent005_2`, `007_3`, and `020_3` are dialogue-only reminders.
- `processEvent040_5` and `040_6` are O-App/conjurer dialogue variants without
  a current live owner.
- `processEvent1000_1`, `1000_2`, `processEventTrial001`, and
  `processEventTrial002` look like extra trial/ward support and are outside
  the current route.

Comfort verdict: the route shape and cutscene owners are good. Runtime should
focus on the Spirit director: prompt result, zone `153` private type `1`,
director creation, Spirit spawn, and kill callback to `processEvent010`.

### `Man2l0`

The side-dependent duty completion is now proven from both ends:

- Recovered `processEvent020(A3)` calls
  `startNQCutScene("man2l020", 1, true, A3)`, then `MAN2L030`, then
  `man2l040`.
- cutReplay has two `man2l020` rows, `11000405` and `11000406`, matching the
  extra side argument.
- The director stores the winning/surviving side: if Merodaulyn is defeated it
  completes with `MAN2L0_SIDE_EMERICK`; if Emerick is defeated it completes
  with `MAN2L0_SIDE_MERODAULYN`.
- The quest trigger, not the director, owns the final call:
  `processEvent020(side)`, `SEQ_035`, then zone back to Limsa.

The other questionable Twain methods do not need more decomp before testing:

- `processEvent010_2` and `processEvent011_2` are prompt-return helpers for
  ship travel.
- `processEvent030` is a fade helper with no scene key.
- `processEvent075_2` and `075_3` are extra Isaudorel-style barks without a
  current route owner.
- `processEventTalkMenuManCutPreview` is replay/preview dispatch only; its
  `man2l000`/`001`/`002` rows belong to previous quest `110003`, not progression
  for `110004`.

Comfort verdict: Twain does not need more decomp unless runtime proves a side
argument is inverted or the completion trigger is missing.

### Overall Verdict

Stop broad decomp here. The trio has enough evidence to patch and smoke-test
without guessing at client methods. Future decomp should be demand-driven:

1. A runtime step hangs with a known sequence and actor.
2. A marker points to the wrong surface after a verified sequence transition.
3. A cutscene returns an unexpected result shape.
4. A director can complete combat but cannot hand off to the quest trigger.
5. A visible NPC has no bark and can be matched to one of the parked methods.

## Probe Checklist

Suggested runtime smoke path:

1. `Man2u0`: accept from Momodi, talk Rururaji, verify `processEvent005`
   plays, private type `5` loads, five minemites complete, Ascilia fires
   `processEvent030`, and the route advances to the Phrontistery.
2. `Man2u0`: during `SEQ_030`, talk Gogofu and confirm only the ambient
   `processEvent065_2` bark plays. Leave `processEvent070_2` unbound until a
   correct actor/spawn is found.
3. `Man2l0`: verify both duty-side outcomes through `processEvent020(side)`
   and confirm the quest resumes at Baderon without double-kicking the scene.
4. `Man2g0`: verify `processEvent007_2` returns `1`, the zone `153` private
   type `1` duty starts, Spirit kill calls `processEvent010`, and the route
   resumes at A'naidjaa.
5. For all three: confirm the final `sqrwa` reward flow completes and does not
   grant the commented grand-company issuance items.
