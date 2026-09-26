# Level 8 City Main Quests Decomp - 2026-07-07

Scope: the three level 8 starter-city main scenario quests immediately before
the level 13 city branch quests.

| City | Quest | Id | Code | Prereq | Follow-up |
| --- | --- | ---: | --- | --- | --- |
| Limsa Lominsa | Legends Adrift | `110003` | `Man1l0` | `110002` / Treasures of the Main | `110004` / Never the Twain Shall Meet |
| Gridania | Whispers in the Wood | `110007` | `Man1g0` | `110006` / Souls Gone Wild | `110008` / Beckon of the Elementals |
| Ul'dah | Golden Sacrifices | `110011` | `Man1u0` | `110010` / Court in the Sands | `110012` / Calamity Cometh |

## Short Version

All three local scripts are cutscene, NPC, push-trigger, linkpearl, and private
area flows. I found no active content director, BNPC spawn, monster party, kill
callback, or quest-fight wiring for `man1g0`, `man1l0`, or `man1u0`. The only
BNPC-table hit for these numeric strings is a loot row for `11000351`, not this
quest id.

Fixes made in this pass:

| Area | Fix |
| --- | --- |
| Whispers / Legends / Golden | Added nil guards in `onNpcLS` so stale or out-of-sequence linkpearl callbacks end cleanly instead of indexing a nil message pack |
| Whispers / Legends | Removed duplicate empty `getJournalMapMarkerList` definitions and redundant marker-local reads |
| Golden | Removed duplicate gil system message and stray global `currency` / `location` assignments on reward |
| Golden | Tightened Thaumaturges Guild push branches so `SEQ_050` and `SEQ_060` only advance when the expected trigger fires |

## Source Map

| Source | Notes |
| --- | --- |
| `Data/sql/gamedata_quests.sql` | quest ids, codes, levels, and city-branch prereqs |
| `Data/scripts/quests/man/man1g0.lua` | live Whispers quest route |
| `Data/scripts/quests/man/man1l0.lua` | live Legends quest route |
| `Data/scripts/quests/man/man1u0.lua` | live Golden quest route |
| `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man1g0.lua` | recovered Whispers client methods |
| `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man1l0.lua` | recovered Legends client methods |
| `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man1u0.lua` | recovered Golden client methods |
| `tools/outputs/lpb/quest_cutscene_decomp_20260618/quest_cutreplay_rows_joined.csv` | scene/replay id to quest/method cross-check |
| `Data/sql/server_eventnpc_spawn_locations.sql` | static actor, trigger, and private-area placement rows |

## Fight Surface Check

Searches across `Data/scripts/content`, `Data/scripts/directors/Quest`,
`server_battlenpc_spawn_locations.sql`, `server_battlenpc_mob_types.sql`, and
`server_battlenpc_mob_types_loot.sql` found no active combat implementation for
these three quests.

Golden Sacrifices has old external "combat" expectations, but the local
implementation is currently a scene chain through Platinum Mirage, Northern
Thanalan, and the Thaumaturges Guild. Do not wire a fight from the quest title
or category alone; it needs capture/decomp proof.

## Whispers in the Wood / Man1g0

Identity: `Whispers in the Wood`, quest id `110007`, level `8`, prereq
`110006` / Souls Gone Wild.

### Cutscene Matrix

| Scene | Recovered method | Live owner |
| --- | --- | --- |
| `man1g000` | `processEventMiounneStart` | Miounne accept |
| `man1g010` | `processEvent010` | A'naidjaa / Oak Atrium entry, warps to private type `6` |
| `man1g020` | `processEvent020` | Acorn Orchard push, warps to private type `7` |
| `man1g030` | `processEvent030` | Fye talk, warps to private type `8` |
| `man1g040` | `processEvent040` | Oak Atrium push, returns to public area |
| `man1g050` | `processEvent050` | Botanists' Guild push |
| `man1g060` | `processEvent060` | Moogle/Lifemend push, warps to private type `2` |
| `man1g070` | `processEvent070` | Private Lifemend push, returns public |
| `man1g080` | `processEvent080` | Opyltyl at Botanists' Guild |
| `man1g090` | `processEvent090` | Nonolato at Archers' Guild |
| `man1g100` | `processEvent100` | Quiver's Hold push |

### Route

| Sequence | Live action |
| --- | --- |
| `SEQ_ACCEPT` | Miounne accepts the quest with `processEventMiounneStart` |
| `SEQ_000` | A'naidjaa plays `processEvent010`, starts `SEQ_005`, and warps to `PrivateAreaMasterPast` type `6` |
| `SEQ_005` | Oak Atrium side NPCs expose `processEvent010_2` through `010_8`; push plays `processEvent020`, starts `SEQ_010`, and warps to private type `7` |
| `SEQ_010` | Fye plays `processEvent030`, starts `SEQ_015`, and warps to private type `8`; A'naidjaa can re-enter the earlier private area |
| `SEQ_015` | Oak Atrium push plays `processEvent040`, starts Miounne NPC linkpearl pack `1`, and returns public |
| `SEQ_020` | Linkpearl completion advances to `SEQ_025` |
| `SEQ_025` | Botanists' Guild push plays `processEvent050` and starts `SEQ_030` |
| `SEQ_030` | Moogle push plays `processEvent060`, starts `SEQ_035`, and warps to Lifemend private type `2` |
| `SEQ_035` | Private moogle push plays `processEvent070`, starts `SEQ_040`, and returns public; public moogle push re-enters private type `2` |
| `SEQ_040` | Opyltyl plays `processEvent080`, starts Miounne NPC linkpearl pack `2`, and moves to `SEQ_045` |
| `SEQ_045` | Linkpearl completion advances to `SEQ_050` |
| `SEQ_050` | Nonolato plays `processEvent090` and starts `SEQ_055` |
| `SEQ_055` | Quiver's Hold push plays `processEvent100`, starts linkpearl pack `3`, and moves to `SEQ_060` |
| `SEQ_060` | Linkpearl completion advances to `SEQ_065` |
| `SEQ_065` | Miounne completes the quest and grants gil/EXP |

### NPC / Private Area Notes

Key private areas:

| Area | Static rows |
| --- | --- |
| Oak Atrium private type `6` | `man1g0_s005_Push6CRP`, Caplan, Frances, Squealing Sprat, Sugarstrung Schoolgirl, Zezekuta, A'naidjaa, Chalyo Tamlyo, Decima, Ulmhylt |
| Acorn Orchard private type `7` | Fye, Deserted Daughter, Troublesome Tomboy |
| Oak Atrium private type `8` | return push plus Deserted Daughter / Troublesome Tomboy |
| Lifemend private type `2` | private moogle push plus private-area exit |

The script intentionally uses public markers while outside a private area and
private markers after the warp. That is important for re-entry behavior.

## Legends Adrift / Man1l0

Identity: `Legends Adrift`, quest id `110003`, level `8`, prereq `110002` /
Treasures of the Main.

### Cutscene Matrix

| Scene | Recovered method | Live owner |
| --- | --- | --- |
| `man1l200` | `processEvent200` | Baderon accept / Drowning Wench entry |
| `man1l210` | `processEvent210` | Drowning Wench private push |
| `man1l215` | `processEvent215` | Baderon inside echo, exits public |
| `man1l400` | `processEvent400` | Waekbyrt / Astalicia entry |
| `man1l410` | `processEvent410` | lower Astalicia push |
| `man1l420` | `processEvent420` | upper Astalicia push, exits public |
| `man1l600` | `processEvent600` | Fishermen's Guild trigger |
| `man1l610` | `processEvent610` | Lower La Noscea trigger; includes player main-skill argument in cutscene replay data |
| `man2l000` | `processEvent2000` | Ptahjha / Arcanists' Guild echo entry |
| `man2l001` | `processEvent2001` | lower Arcanists' Guild push |
| `man2l002` | `processEvent2002` | upper Arcanists' Guild push, exits public |

The `man2l000` to `man2l002` scenes are owned by `Man1l0` in the recovered
rows and are also bridge material for the follow-up `Man2l0` route.

### Route

| Sequence | Live action |
| --- | --- |
| `SEQ_ACCEPT` | Baderon accepts with `processEvent200` |
| `SEQ_000` | Quest start warps to Drowning Wench private type `3`; adventurer side barks use `processEvent200_2` through `200_7`; private push plays `processEvent210` |
| `SEQ_010` | Baderon plays `processEvent215`, starts `SEQ_020`, and returns public |
| `SEQ_020` | Waekbyrt plays `processEvent400`, starts `SEQ_030`, and warps to Astalicia private type `6` |
| `SEQ_030` | lower Astalicia push plays `processEvent410`, starts `SEQ_040`, and warps lower on the ship |
| `SEQ_040` | upper Astalicia push plays `processEvent420`, queues Baderon linkpearl pack `1`, starts `SEQ_050`, and returns public |
| `SEQ_050` | Linkpearl completion advances to `SEQ_060` |
| `SEQ_060` | Fishermen's Guild push plays `processEvent600` and starts `SEQ_070` |
| `SEQ_070` | Lower La Noscea push plays `processEvent610`, queues linkpearl pack `2`, and starts `SEQ_080` |
| `SEQ_080` | Linkpearl completion advances to `SEQ_090` |
| `SEQ_090` | Ptahjha plays `processEvent2000`, starts `SEQ_100`, and warps to Arcanists' Guild private type `7` |
| `SEQ_100` | lower ACN push plays `processEvent2001` and starts `SEQ_110` |
| `SEQ_110` | upper ACN push plays `processEvent2002`, queues linkpearl pack `3`, starts `SEQ_120`, and returns public |
| `SEQ_120` | Linkpearl completion advances to `SEQ_122` |
| `SEQ_122` | Baderon completes the quest and grants gil/EXP |

### NPC / Private Area Notes

Key private areas:

| Area | Static rows |
| --- | --- |
| Drowning Wench private type `3` | Baderon, Mytesyn, adventurer variants, Y'shtola, private push, private-area exit |
| Astalicia private type `6` | Cuda Knights, pirate variants, Waekbyrt, Bayard, push, exits |
| Arcanists' Guild private type `7` | lower/upper pushes, assessors, Ptahjha, Haldberk, Lilina, Dodoroba, Ivan, Merodaulyn, pirate variants, dead assessors, exit |

Unresolved capture target: `seq000_100_onTalk` still has two placeholder
branches for `processEvent2000_10` and `processEvent2000_11` with actor class
`0`. The current `SEQ_110` maps those methods to Thewy/Freckled pirates and
dead assessors, but the lower-area owner intent is not safe to guess from this
data alone.

## Golden Sacrifices / Man1u0

Identity: `Golden Sacrifices`, quest id `110011`, level `8`, prereq `110010` /
Court in the Sands.

### Cutscene Matrix

| Scene | Recovered method | Live owner |
| --- | --- | --- |
| `man1u000` | `processEventMomodiStart` | Momodi accept |
| `man1u010` | `processEvent010` | Momodi private Quicksand intro |
| `man1u020` | `processEvent020` | Platinum Mirage room trigger |
| `man1u021` | `processEvent021` | Thancred accusation scene |
| `man1u030` | `processEvent030` | Northern Thanalan Flhaminn trigger |
| `man1u040` | `processEvent040` | Northern Thanalan private-area trigger |
| `man1u050` | `processEvent050` | Ascillia talk in Northern Thanalan private area |
| `man1u060` | `processEvent060` | Yayake / Thaumaturges Guild entry |
| `man1u070` | `processEvent070` | Thaumaturges Guild hall trigger |
| `man1u080` | `processEvent080` | Niellefresne talk |
| `man1u090` | `processEvent090` | Thaumaturges Guild exit trigger |
| none | `processEvent100` | Momodi completion dialogue |

### Route

| Sequence | Live action |
| --- | --- |
| `SEQ_ACCEPT` | Momodi accepts with `processEventMomodiStart` |
| `SEQ_000` | quest start warps to Quicksand private type `0`; Momodi plays `processEvent010`, starts `SEQ_005`, and returns public |
| `SEQ_005` | Gagaruna plays `processEvent015` and starts `SEQ_010`; Momodi/Qata/Mammet have reminders |
| `SEQ_010` | Gambling hall trigger zones into private Platinum Mirage type `6`; room trigger plays `processEvent020`, zones to type `7`, and starts `SEQ_015` |
| `SEQ_015` | Thancred plays `processEvent021`, zones out, queues Momodi linkpearl pack `1`, and starts `SEQ_025` |
| `SEQ_025` | Deaustie plays `processEvent028` and starts `SEQ_028`; Gagaruna and Momodi have questionable reminder owners marked for capture |
| `SEQ_028` | Flhaminn trigger plays `processEvent030` and starts `SEQ_030` |
| `SEQ_030` | Northern Thanalan trigger plays `processEvent040`, warps to private type `0`, and starts `SEQ_035` |
| `SEQ_035` | Ascillia plays `processEvent050`, zones out, queues linkpearl pack `2`, and starts `SEQ_040` |
| `SEQ_040` | linkpearl completion advances to `SEQ_045` |
| `SEQ_045` | Yayake plays `processEvent060`, warps to Thaumaturges Guild private type `4`, and starts `SEQ_050` |
| `SEQ_050` | expected hall trigger plays `processEvent070` and starts `SEQ_055` |
| `SEQ_055` | Niellefresne plays `processEvent080` and starts `SEQ_060`; Thancred and other NPCs have side barks |
| `SEQ_060` | expected exit trigger plays `processEvent090`, zones public, queues linkpearl pack `3`, and starts `SEQ_070` |
| `SEQ_070` | Momodi completes the quest and grants gil/EXP; Yayake and Gogofu have side dialogue |

The live route skips `SEQ_020` after Thancred and goes straight to `SEQ_025`.
That matches the implemented marker/linkpearl surface: `SEQ_025` is where
Deaustie is exposed and the queued Momodi linkpearl pack is readable.

### NPC / Private Area Notes

Key private/static rows:

| Area | Static rows |
| --- | --- |
| public Ul'dah / Platinum Mirage | Gagaruna, gambling hall trigger, room trigger |
| Platinum Mirage private type `7` | Thancred, Greinfarr, Niellefresne, Flhaminn |
| Northern Thanalan public/private | Flhaminn trigger, Northern Thanalan trigger, Ascillia, private Flhaminn |
| Thaumaturges Guild private type `4` | hall triggers, Niellefresne, Thancred, Downcast Derelict, Swollen-eyed Strumpet, Z'ssapa, Sinette, Ailing Roegadyn, private-area exit |

Remaining capture targets:

| Surface | Reason |
| --- | --- |
| `processEvent021_2` / Gagaruna and `processEvent025_2` / Momodi | live script already comments these as needing retail accuracy checks |
| `processEvent1000_4` / Gogofu | side-dialogue owner is plausible but still marked for retail confirmation |
| Platinum Mirage room furniture/mapobjs | script comment says the private room needs chair/mapobj work |

## Validation

Commands run after the code changes:

| Check | Result |
| --- | --- |
| focused `npx luaparse` parse on `man1g0.lua`, `man1l0.lua`, `man1u0.lua` | `parsed=3 errors=0` |
| `git diff --check` | clean; only CRLF conversion warnings from Git |
| `dotnet build Meteor.sln` | succeeded with `39 Warning(s), 0 Error(s)` |

The build warnings are the existing warning families: net6 target framework
support, DotNetZip advisory, and old assembly reference/resolve conflicts.
