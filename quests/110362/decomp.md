# 110362 Struck Through the Heart (Gld306, Lv.36 Goldsmith)

VERIFIED: decompiled client scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gld/gld306.lua`
(183 lines, full read) + DAT `gld306.csv` (80 rows) + DAT `quest_marker.csv` 11036201-06 +
DAT journals `xtx_journalxtxWil.csv` 169-173/237-238 + DAT parley title 5201 +
SQL `gamedata_quests.sql` (prereq 110361)/rewards/items rows +
walkthroughs ([GamerEscape](https://ffxiv.gamerescape.com/wiki/Struck_Through_the_Heart),
[Fandom](https://finalfantasy.fandom.com/wiki/Goldsmith_Quests_(version_1.0))).
Video: "FFXIV Archived 1.0: Goldsmith" referenced from the 1.0 Ul'dah MSQ compilation
([YouTube](https://www.youtube.com/watch?v=bEvxaIbGdPU) description); not watched, no claims taken.

## Sequence flow (VERIFIED: scenario + DAT journals/dialogue + walkthrough)

ACCEPT Elecotte 1000950 (`processEventElecotteStart` = `gld30610` cutscene) ->
0 Elecotte storehouse assignment (bare advance; no 0->1 scene) ->
1 Sence Parley {11036201}: `011` setup talk, stamp title 5201, win advances via
`onNegotiationResult` (losses retry freely) ->
2 Sence bag talk `012` ("Gather whatever materials you need, put them in this bag",
DAT rows 79-80; row 73 "Sence provides you with a bag" implemented as FLAG_BAG, no item
id exists), then three storehouse caches (generic points; pickup text DAT row 84 "A number
of highly valuable goldsmithing materials are gathered here"; dup text DAT row 83 "The bag
already contains that material" is the RECOVERED dup rule), then Sence approval `015`/
gld30615 (verify-only: "they will be yours to take", DAT row 80; materials are consumed
by the synthesis, not the approval) ->
3/4 synthesize Heartstrike Replica 11000116 (Requested Items, no SP) and deliver to
Elecotte {11036205}: 3 verifies net-gain (bare), 4 consumes + `020`/gld30620 ->
5 Ossuary meeting {11036202/11036203}: `025` ask (51030 mode 2) ->
10 Niellefresne/Greinfarr Echo `030`/gld30630 (afterWarp, client past-area) ->
15 Colbernoux reward {11036204} `040` (text rows 32-33 + chara scheduler).

DAT journals 169-173/237-238 confirm every state; DAT rows 64/66/73/76-86 confirm the
bag/cache/approval mechanics in full.

## Actors/markers (VERIFIED: DAT markers + actorclass + spawn SQL)

Elecotte (row 182). Sence 1001498: no public row existed; authored row 3371 at
DAT marker 11036201 (-135.96,201.5,280.14) sharing exact X/Z with the pre-existing
storehouse door trigger (row 251, actor 1090123) which grounds Y=201.5.
Caches: rows 3372-3374 (generic actor 1000174, cnj306/fsh300 trigger precedent),
+-3y offsets, fixed one-each binding (A=ore 11000117, B=shards 11000118, C=water
11000119; positional, marked). Colbernoux: guild row 3365 (shared with Gld200/300)
+ Ossuary row 3375 at marker 11036203 (-210.47,198.0,231.67), Y from the MSQ
Niellefresne copy 5.4y away; Ossuary entry trigger pre-exists (row 252, actor 1090131,
exact marker 11036202 X/Z, Y 202.05). Niellefresne 1001867 / Greinfarr unbound (Echo-only).

## Parley (VERIFIED: engine + DAT title)

Title 5201 ("Struck Through the Heart"). Board stamped idempotently on the state-1 Sence
talk (Hrv300 pattern + `SetNegotiatable`); gated win advances 1->2 and clears the board.

## Synthesis (VERIFIED: SQL recipe 5407)

Recipe 5408: Heartstrike Replica 11000116 <- ore + shards + silverwater, job 'D', Lv.36,
zero-crystal shape (5400-5404 quest-recipe precedent; authored), no facility. Credit is snapshot-diff on the
output (no engine callback; Alc200 precedent). No SP (engine-owned).

## Instances (INFERRED collapse, Alc200 precedent)

Storehouse and Ossuary legs are retail instances; the storehouse interior zone is
unrecovered (private marker region 205 has no public-zone binding) and directors are
recovered empty, so Sence + caches + Ossuary Colbernoux are staged in public at the
DAT door/boundary markers with all recovered scenes played as plain delegate scenes.
No chocobo callback or actor anywhere in this quest.

## Rewards/sync/lockouts (VERIFIED: SQL + archive)

Central gil 36000 (top of the 36000/28800/25200 variants; selection rule unresolved) +
marks 1000116x3600; Lua EXP 4720 (post-1.20 Lv.36 maximum). No level sync, no lockouts,
no timeout; one-time quest, prereq 110361 enforced.

## Edge handling

Class Goldsmith + Lv.36 + completed-110361 gate on offer and every talk; ask-gated
Echo (accept-only); bag flag gates caches; caches re-grant missing materials only
(dup-safe per DAT row 83); approval requires all three; consume-verified delivery;
`onFinish` consume-all; abandon/re-accept restarts cleanly.

## Open gaps

Sub-talk owners unwired (010_2..010_7, 011_2, 012_2..012_5, 013_2, 015_2/015_2_2,
030_2..030_6, 000_1..000_3); reward-variant rule; Niellefresne/Greinfarr bindings;
cache->material positional binding; GM pass owed.
