# 110361 F'lhaminn's Flower (Gld300, Lv.30 Goldsmith)

VERIFIED: decompiled client scenario `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/gld/gld300.lua`
(216 lines, full read) + DAT `gld300.csv` (115 rows) + DAT `quest_marker.csv` 11036101-10 +
DAT journals `xtx_journalxtxWil.csv` 157-168 + DAT parley title 3801 +
SQL `gamedata_quests.sql` (prereq 110360)/rewards/items rows +
walkthroughs ([GamerEscape](https://ffxiv.gamerescape.com/wiki/F%27lhaminn%27s_Flower),
[Fandom](https://finalfantasy.fandom.com/wiki/Goldsmith_Quests_(version_1.0))).
Video: "FFXIV Archived 1.0: Goldsmith" referenced from the 1.0 Ul'dah MSQ compilation
([YouTube](https://www.youtube.com/watch?v=bEvxaIbGdPU) description); not watched, no claims taken.

## Sequence flow (VERIFIED: scenario + DAT journals + walkthrough)

ACCEPT Elecotte 1000950 (`processEventElecotteStart`, `showQuestInfomation` gate) ->
0 ten-blossom commission `020`/gld30020 (dynamic payload) ->
5 Opyltyl refusal {11036101} `030`/gld30030 (flag 0), then V'korolon inquiry {11036102}
`040`/gld30040 (afterWarp: Roost rendezvous, client-side; Shattered Brooch 11000122 granted
at this transition, owner marked) ->
10 Juliembert escort entry {11036103} (entry-ask unrecovered: talk enters directly, marked) ->
14 escort duty (INTERNAL, non-retail state) -> 15 clearing reached {11036110} ->
20-24 Moogle Parley (title 3801; opponent actor UNRESOLVED, route HOLDs here) ->
25-32 win: Pearl Clover Blossom 11000123 (one, despite the ten requested) ->
33 Elecotte report {11036105} `060`/gld30060 (afterWarp; V'korolon return {11036104}
transition-owned) -> 35 Colbernoux delivery request {11036106} `067`, repaired
F'lhaminn's Flower 11000124 granted -> 40 delivery to F'lhaminn at Amajina {11036107} `075` ->
48 Echo `078` ask (51030 mode 2) -> 50 Colbernoux reward {11036108} `090` (text rows 58-59).

DAT journals 157-168 confirm every leg, incl. "giving augite to the spriggan will
invigorate and energize it" (160) and the one-blossom outcome (163).

## Escort (IMPLEMENTED on recorded ground; roster/marks authored)

Route `gld300_spriggan_escort`: 23 recorded zone-154 nodes (3438->3460, (828.6,0.1,1057.7)
to (865.2,16.1,962.7), zero-gap chain, ~140 yalms) near Camp Tranquil/Juliembert
(public row 974, (726.57,-11.52,1131.33)). Spriggan ally actor candidate 2290036
(display 3206201, actorclass-verified; quest binding unresolved). Three ambush stops
(bnpc 3157/3158/3159, Lv.30 clones of nearby opo-opo/funguar/land_angler profiles;
retail roster/transforms/waves unrecovered). Spriggan death fails; owner >60y for 10s
fails; route budget 900s + 960s director backstop; completion advances to 15.

## Mechanics gaps (OPEN, offer HOLD-gated)

- Moogle opponent: no actor binding (marker 11036110 actorUnresolved; Kuplu Kopo
  1001252/1700011 is third-party-only, no spawns; DAT row 115 "kupo!" confirms only
  that the opponent is a moogle). Parley ranges 20-32 cannot run.
- Stone nodes: retail gathers Mismatched Stones 11000115 at botany-like green markers
  along the route; node actors unrecovered. Stand-in (marked): director grants 2 stones
  per cleared ambush (typed escort events 200/201/202).
- Augite use: no engine item-command/heal hook for the escort ally
  (`EscortRouteDirector.cs` exposes no heal; no Lua `onItemUse`). Recipe 5407
  (Violet Augite <- 2x stones, job 'D', Lv.30, RECOVERED 2:1 ratio) is registered and
  synthable, but the heal/buff effect needs a C# escort-heal API or item-command plumbing.
- V'korolon-return and Elecotte-handoff private areas: client-scene-only (Alc200 precedent).

## Entry rules (VERIFIED: gld_quest_helpers.lua + route JSON)

`GldCanEnterEscort`: dismount first (chocobo BLOCKED from the duty), entrant
alive/connected/in a public area; NO combat-class requirement (crafter quest:
the goldsmith enters with the spriggan); route `canCallBackChocobo=false`.
Death/wipe: escort failure reverts to 10 for retry. Logout/DC: director re-resolves
the live member each tick; `onPlayerLeft` reverts to 10. Timeout: failure revert to 10.

## Actors/markers (VERIFIED: DAT markers + spawn SQL)

Elecotte (row 182), Opyltyl 1000236 (row 547, zone 206), V'korolon 1000458 (row 576,
zone 155), Juliembert 1500098 (row 974, zone 154), F'lhaminn 1000038 at Amajina
(authored row 3367, DAT-exact X/Z, Y 195.5 adjacent). Colbernoux reward via row 3365.
Roost Colbernoux is client-scene-only (no spawn invented).

## Rewards/sync/lockouts (VERIFIED: SQL)

Central gil 30000 + marks 1000116x3000; Lua EXP 3420 (post-1.20 Lv.30 maximum).
No level sync, no lockouts; one-time quest, prereq 110360 enforced.

## Edge handling

Class Goldsmith + Lv.30 + completed-110360 gate on offer and every talk; order gate
(Opyltyl before V'korolon); verified flower grant; consume-verified delivery; Echo
ask accept-only; `onFinish` consume-all leftovers; full-inventory hold-and-retry.

## Open gaps

Moogle actor; node actors; augite-use plumbing; sub-talk owners (010_2..010_7, 020_2,
030_2, 040_2, 055_2, 058_2..058_8, 060_2, 067_2); Linkpearl summons skipped; GM pass owed.
