# 110360 She Walks in Beauty (Gld200, Lv.20 Goldsmith)

VERIFIED: decompiled client scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gld/gld200.lua`
(217 lines, full read) + DAT `gld200.csv` (104 rows) + DAT `quest_marker.csv` 11036001-09 +
DAT journals `xtx_journalxtxWil.csv` 31-37 + DAT parley titles 4301/4701/4801 +
SQL `gamedata_quests.sql`/`gamedata_quest_rewards.sql`/`gamedata_items.sql` rows +
walkthroughs ([GamerEscape](https://ffxiv.gamerescape.com/wiki/She_Walks_in_Beauty),
[Fandom](https://finalfantasy.fandom.com/wiki/Goldsmith_Quests_(version_1.0))).
Video: "FFXIV Archived 1.0: Goldsmith" referenced from the 1.0 Ul'dah MSQ compilation
([YouTube](https://www.youtube.com/watch?v=bEvxaIbGdPU) description); not watched, no claims taken.

## Sequence flow (VERIFIED: scenario + DAT journals + walkthrough)

ACCEPT Elecotte 1000950 (`processEventElecotteStart`, ask 52 + `showQuestInfomation` gate) ->
0 Colbernoux briefing {11036001} `013` ->
5 Z'ssapa consultation {11036002}, Amajina Silver Nuggets 11000121, scene `020`/gld20020 ->
10 nugget delivery to Colbernoux {11036003}, Brooch Pin 11000109 + brooch recipe, scene `030`/gld20030 ->
15 three miner Parleys {11036007,11036008,11036009}, one sketch per win
(11000110 Adorable / 11000111 Graceful / 11000112 Dashing), third win consolidates to
11000113 Ideal Miner Sketch ->
17 synthesize Z'ssapa's Brooch 11000108 (Requested Items, guild instance; after-warp scene
`040`/gld20040 plays on the synth-probe talk) ->
18 show brooch to Colbernoux {11036004}, consume brooch, +1,000 gil mid-route ->
20 F'lhaminn Echo {11036005}: `045` ask (51030 mode 2, client past-area entry) then `050`/gld20050 ->
25 Elecotte reward {11036006} `060` (text rows 47-50).

State-18 routing RESOLVED by DAT journal 35: "show your creation to Colbernoux".
The template's Z'ssapa objective was wrong; fixed in `class_quest_template.lua`.

## Actors/markers (VERIFIED: DAT markers + actorclass + spawn SQL)

Elecotte 1000950 (public row 182, zone 209). Z'ssapa 1000887 (public row 2464, zone 170
(92.767,183.826,-1030.44) = map (27.8,20.4) vs walkthrough (28,20)).
Colbernoux 1000949, F'lhaminn 1000842/1000038, miners 1000697/1000698/1000693: no public
rows existed; authored ids 3365-3370 at DAT-exact X/Z with catalog-adjacent Y
(holbubu 1.0y for Colbernoux; tyago_moui/yuyubesu/linette 2.7-6.1y for miners;
isabella/lefchild ~8y for guild F'lhaminn). Hnaufrid 1000635 optional helper (public row 154).
Miner/flag/title/sketch positional bindings marked (DAT titles share one name).

## Parley (VERIFIED: engine + DAT titles)

Server negotiation engine (`negotiation_game.lua` via command 29497) + titles 4301/4701/4801
("She Walks in Beauty"). Wins set recovered flags 2/3/4; third win consolidates to the Ideal
Sketch and advances 15->17. Losses retry freely; no lockout.

## Synthesis (VERIFIED: SQL recipe 5406)

Recipe 5406: Z'ssapa's Brooch 11000108 <- nuggets 11000121 + pin 11000109, job 'D'
(goldsmith, confirmed via silver-jewelry recipe 1367), level 20, zero-crystal shape
(5400-5404 quest-recipe precedent; authored), no facility. The pin-as-material binding
is marked-authored (retail material set unrecovered). Credit is snapshot-diff on the output at the probe talk
(no engine synth callback; Alc200 precedent). Requested syntheses grant no SP (engine-owned).

## Instances (INFERRED collapse, Alc200 precedent)

Accept, Amajina, and guild legs are retail instances; directors recovered empty and no
private-area owner exists, so all legs run in public with the recovered scenes played
as plain delegate scenes. No chocobo callback or actor anywhere in this quest.

## Rewards/sync/lockouts (VERIFIED: SQL + archive)

Central gil 20000 + script mid-route 1000 (archived 21000 total preserved) + marks
1000116x2000; Lua EXP 1760 (post-1.20 Lv.20 maximum). No tool grant (reward-era conflict:
Iron Ornamental Hammer 6040012 vs late-archive Linkpearl; Linkpearl item id unrecovered,
skipped per Alc200). No level sync, no lockouts, no timeout; one-time quest with chain
prereq (Gld300 requires 110360).

## Edge handling

Class Goldsmith + Lv.20 gate on offer and every talk; verified item grants with
inventory-full hold-and-retry; consume-verified deliveries; dup turn-ins blocked by
possession checks; total-loss nugget/pin/sketch re-grants (marked recovery); `onFinish`
consume-all on complete/abandon; abandon/re-accept restarts cleanly (no retained flags).

## Open gaps

Client sub-talk owners unwired (007_2..007_7, 013_2, 020_2, 030_2..030_11, 032_2..032_4,
040_2..040_4, 050_2); exact miner/title/sketch bindings; Linkpearl grant; live GM pass owed.
