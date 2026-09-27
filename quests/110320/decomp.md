# 110320 An Ear for Quality (Bsm200, Lv.20 Blacksmith/Armorer)

VERIFIED: decompiled client scenario `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/bsm/bsm200.lua`
(257 lines, full read) + DAT `bsm200.csv` (89 rows, full read) + DAT journals `xtx_journalxtxSea.csv`
115-118/140/329-335 (full read) + DAT `quest_marker.csv` 11032001-20 + DAT `xtx_quest.csv` row 110320
(counter model) + DAT `actorclass.csv`/`xtx_displayName.csv`/`xtx_itemName.csv` bindings + SQL
`gamedata_quests.sql`/`gamedata_quest_rewards.sql`/`gamedata_recipes.sql` rows + walkthroughs
([GamerEscape](https://ffxiv.gamerescape.com/wiki/An_Ear_for_Quality), archive A1
`docs/ffxiv-1.0-wiki/pages/An_Ear_for_Quality.html`). YouTube: 1.0 BSM/ARM quest footage is
referenced from a lore-video description ([YouTube](https://www.youtube.com/watch?v=_mD_SxbTkzc));
not watched, no claims taken.

## Sequence flow (VERIFIED: scenario + dialogue + journals + walkthrough)

ACCEPT Bodenolf 1000144 (`processEventBodenolfStart`: rows 1-3, ask 30 Aye/Nay,
`showQuestInfomation` gate, warp on accept; branch = current class locks) ->
0 Mimidoa briefing {11032001}, journal 115 (bare advance) ->
5 forge branch case, turn in to Mimidoa {11032002,11032003}, `processEvent005` ->
7 branch-giver recipe talk (flag) + forge trembler + Mimidoa turn-in (bare; no scene maps 7->8) ->
8 giver + coil + Mimidoa turn-in, `processEvent010` -> NQ `bsm20010` (instrument test) ->
9 giver + horn + Mimidoa finale with ALL FOUR parts, `processEvent020` -> NQ `bsm20020`:
consume 4, branch marks 2000, EXP 2000, gil central. Complete.

Parts are kept until the finale (walkthrough shows a single completion talk; journal 117/334
turn-ins stage the pieces). Traded parts credit (snapshot-diff + possession double-check).
Wrong-branch crafts never credit (branch-locked part IDs; A1 notes corroborate for 1.22c).

## Actors/givers/markers (VERIFIED: dialogue + S015 handlers + displays + spawn SQL)

Giver chains are DAT-direct, not positional: Mimidoa names Iofa/Colson/Sosoze for the BSM
trembler/coil/horn (rows 64/66/68) and Trinne/Syngsmyd/Hihine for the ARM set (rows 71/73/75);
client sub-talks `S015_1..6` follow the same trembler->coil->horn order per branch
(rows 77-88). Markers 04-09 triangulate by display: 04 Iofa 1100138, 05 Colson 1000073,
06 Sosoze 1500071, 07 Trinne 1300093, 08 Syngsmyd 1600195, 09 Hihine 1500052
(marker<->stage pairing by display is marked, low-risk).

All ten spawns verified public in live SQL at DAT-exact X/Z: Bodenolf id 306, Mimidoa NEW
id 3382 (-483.67, 44.5, 404.51; markers 01/02/03 X/Z + node-436 balcony Y, 1.2 ylm off),
Iofa 304, Colson 373, Sosoze 372, Trinne 375, Syngsmyd 332, Hihine 374, Smydhaemr 377,
Joellaut 329. Markers 10-20 are filler (-431,187) and are never sent.

## Synthesis (VERIFIED: 8/8 DAT-corroborated; one wiki error corrected)

Giver dialogue states trembler/coil/horn materials (rows 78/80/82/84/86/88) and the journals
state all eight recipes including both cases (116/140/118/329/330/331/332/333). SQL 5390-5397
match DAT exactly. CORRECTION: the A1/GE walkthrough case materials (ARM = 2 plates,
BSM = plate + rivets) are wiki errors — DAT journals 116 (BSM: 2x Bronze Ingot) and 140
(ARM: Bronze Plate + Bronze Rivets) side with SQL. A1's own journal quote is loose prose
for row 140. Credit is snapshot-diff on outputs at probe talks (no engine synth callback);
Requested syntheses grant no SP (engine-owned).

## Cutscenes/sub-talks (VERIFIED: scenario)

Fired by the server: offer, 005, 010 (`bsm20010`), 020 (`bsm20020`). Unwired client sub-talks:
005_2..11 (ambient 37-54), 007_2 (61), 010_2..7 (ambient 15-20/55-60), S010_1..6 (judgements
62-75, heard inside the main flow), S013_2 (89), S015_1..6 (giver recipes 77-88; the server
plays bare flag talks instead), 018_1..6 (giver repeats). No chocobo callback or actor.

## Instances (marked collapse, Tan200/Cul200 precedent)

Retail runs a guild-area instance (A1 step 6); no Bsm200 private area is recovered, so all
legs run on public zone-230 spawns with recovered scenes played as plain delegate scenes.

## Rewards/sync/lockouts (VERIFIED: SQL + archive)

Central gil 20000 (lowest of DAT variants 26000/23000/20000; archive ~20,000 corroborates) +
branch marks 2000 script-side (central rows autoGrant=0) + EXP 2000 script-side (post-1.20
maximum, archive-corroborated). NOT granted: Crowsbeak Hammer / Iron Raising Hammer (tool
era unresolved), Naldiq & Vymelli's Linkpearl (no item ID in xtx_itemName). No level sync,
no lockouts, no timeout; one-time quest, chain head (110321 requires 110320).

## Edge handling (live lua, verified by read)

Class/level gate on offer and every talk; branch lock at accept with mid-quest class-switch
refusal; recipe flags gate turn-ins (cleared on re-accept); verified marks grant; consume-all
`onFinish` (both branches, NQ+HQ); ENPC refresh + EndEvent on every path; branch-aware
markers (giver + 11032002 per stage; 01/02/03 as recovered).

## Open gaps (all minor; quest enables)

Linkpearl reward ID unrecoverable (no grant); marker<->sequence binding by display
triangulation (marked); retail instance presentation (public routing marked). Live GM
playthrough owed: offer/briefing/4 stages/finale on both branches.
