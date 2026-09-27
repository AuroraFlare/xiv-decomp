# 110321 Song of the Sirens (Bsm300, Lv.30 Blacksmith/Armorer)

VERIFIED: decompiled client scenario `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/bsm/bsm300.lua`
(main events full read) + DAT `bsm300.csv` (rows 1-95 + item-ref sweep, read) + DAT journals
`xtx_journalxtxSea.csv` 97-107 (full read) + DAT `quest_marker.csv` 11032101-20 + DAT
`xtx_negotiationTable.csv` titles 4201/4302/4401/4601/4702/4901 + DAT `actorclass.csv`/
`xtx_displayName.csv`/`xtx_itemName.csv` bindings + SQL quest/reward rows + walkthrough
([GamerEscape](https://ffxiv.gamerescape.com/wiki/Song_of_the_Sirens), 21 steps, ARM author).
YouTube lore video references 1.0 footage ([YouTube](https://www.youtube.com/watch?v=_mD_SxbTkzc));
not watched, no claims taken.

## Sequence flow (VERIFIED: scenario + dialogue + journals + walkthrough)

ACCEPT Bodenolf (`processEventBodenolfStart` + warp; requires 110320) ->
0 Mimidoa briefing `003` (sirens rumor, windwheel, Amajina contract; journals 97-98) ->
5 Linette/Ul'dah denial `004`/`004_1` (Syndicate refuses export; journal 99) ->
10 Mimidoa linkpearl `006` (NpcLS "Naldiq & Vymelli's" per journal 99 + walkthrough step 4;
NpcLS id unrecovered; journal 100) ->
15 Z'ssapa at the Nanawa entrance (cave-in brief, journals 101-102) -> warp into the mine
instance (walkthrough step 6; no director recovered) ->
20-24 six miner Parleys + talk-to-calm rescue `007`/`009` (journal 102: "parley tiles with
the injured to keep their spirits up") -> shining-spot cutscene `010` -> NQ `bsm30010` ->
25 survivor behind the rocks (journal 103) ->
30 material in hand (journal 104: ore granted as thanks) ->
35 supplies handoff `015` (rows 27-29: Mimidoa takes supplies, grants his pre-forged wheel;
journal 105 "previously crafted"; walkthrough step 17) ->
40 captain delivery `020` -> NQ `bsm30020` + ferry test ride `030` -> NQ `bsm30030`
(journal 106: Vesper Bay) ->
45 report `040` (rows 40-42 + melody ask 152: three siren options with scheduler playback;
options 1/2 -> row 44, option 3 -> row 43; journal 107). Walkthrough "(Siren #3 is the
correct one...)" corroborates option 3 as the dramatic answer.

## Miners: all six identified (CORRECTION this pass)

Walkthrough order: Qualmish (4000211) -> Melancholy (4000209, marker 10) -> Scathed (4000208)
-> Tear-struck (4000204, marker 11) -> Disconcerted (4000205, marker 12) -> Overtired
(4000206), then the shining-spot cutscene. Actor twins exist for all six: 1000699/1700022,
1000697/1700020, 1000696/1700019, 1000692/1700015, 1000693/1700016, 1000694/1700017
(which twin is the instance one is unrecovered). CORRECTION: Z'ssapa is the instance ENTRY
(talk -> warp; cave-in briefer per journals 101-102), NOT a parley opponent — 6 titles + 6
interior miners = the exact documented 6-count, and Z stands outside at marker 03. Markers
07/08/09 are display ??? (4000257, literally "???"), NOT miners: 07/08 are Nanawa-interior
trigger candidates (cave-in/shining-spot), 09 a Limsa trigger (likely ferry/instance exit).
Miner<->title binding stays positional (walkthrough spatial order is the natural hypothesis).
Open modeling note: CLASS_QUESTS says 3 stages/miner (18 flags, the live-lua model) but the
walkthrough plays one win per miner and only 6 titles exist — 18-vs-6 unresolved (HOLD).

## Branch material + grant-in-scene wheel (VERIFIED, triple-confirmed)

Row 20 (JP/DE/FR switch) makes the material branch-determined: BSM parleys for Seastone
11000023, ARM for Reverberating Steel 11000024 (walkthrough ARM author received the steel).
The player NEVER synthesizes the wheel: Mimidoa forges it (rows 28-29 "the [wheel] I made"),
journal 105 ("previously crafted ... during your absence"), walkthrough step 17 ("You will
receive the Whistling Windwheel"). No windwheel recipe exists or is needed.

## NPCs/spawns (VERIFIED: displays + live SQL)

Bodenolf 306, Mimidoa 3382 (shared Bsm200 row), Linette 177 (marker-exact), Z'ssapa 2464:
all public. NO spawn anywhere for the ferry captain 1000539 (marker 05 ungrounded:
-823.76/191.84 docks) or tear-struck 1000692 / scathed 1000696+1700019 / overtired
1000694+1700017 / qualmish 1700022 / melancholy 1700020 / disconcerted 1700016; the
100069x twins that do have rows (melancholy 3368, disconcerted 3370, qualmish 2634) belong
to other content (gld200 zone-209 / zone-180), none in zone 176. Nanawa ground verified
live: 26 recorded points at (305,-1230), nearest node 1175 Y=167.58 (miner Y≈167.6), 4
existing mobs in 30 ylm — placements need care and are NOT made (HOLD quest).

## Instances/rewards/sync (VERIFIED: walkthrough + SQL + DAT)

Retail: guild instance + Nanawa mine instance (warp) + ferry instance; no directors
recovered. Rewards: gil 30000 central + marks 3000 script-side by current class (central
rows autoGrant=0) + EXP 3000 (post-1.20 L30 maximum). No tool grant (era unresolved).
Non-combat: no sync, lockouts, or timeout; one-time quest. No chocobo involvement (the
ferry ride is NPC travel + NQ cutscene, never a player mount).

## Gaps (quest stays HOLD-gated)

Title<->miner binding; ??? trigger bindings (07/08/09); Nanawa instance owner; captain
spawn; NpcLS linkpearl id; ferry-ride owner; twin selection; 18-vs-6 flag model.
LIVE-LUA DEFECT (reported, not edited — validators/tests pass on the current table):
`MINERS[1]` = Z'ssapa-as-opponent with 2 nil slots contradicts the walkthrough + count
arithmetic; the table should become the 6 interior miners above with positional titles.
CLOSED this pass: 6 DAT titles; Linette/Z'ssapa/captain actors; all 6 miner identities;
branch material; grant-in-scene wheel (triple-confirmed); melody-answer mapping; journals.
