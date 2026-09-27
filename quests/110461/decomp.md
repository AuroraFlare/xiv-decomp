# 110461 Little Saboteurs (Min300) — indepth decomp 2026-09-27

Miner Lv.30 class quest. Talk + Parley + Linkpearl + buried-box push + ordered
twin Echoes. Non-combat ("No mining involved this time! Just parley and some
cute scenes"). No mobs, no fight, no sync, no lockout.

## Sources (bodies inspected)

- Live script `FF14-Memory/Data/scripts/quests/min/min300.lua` (bespoke) +
  `min_quest_helpers.lua`; decomp source row `Min300` in
  `class_quest_template.lua`; `docs/min300_little_saboteurs_2026-09-27.md`;
  `docs/min300_min306_registration_2026-09-27.md`; pack doc
  `FF14-Decomp/docs/class-quest-gathering-indepth-decomp-2026-09-27.md` s8 (video log).
- Client scenario `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/min/min300.lua`
  (decompiled); DAT `quest_marker.csv` rows 11046101-11046114 (11046115-20 filler);
  `xtx_quest` 110461 J179-188; DAT negotiation title 1201; NpcLS 25.
- Walkthrough: <https://ffxiv.gamerescape.com/wiki/Little_Saboteurs>
  (Linette -> V'korolon Roost cutscene -> Chocobo Stables coachman talk+parley ->
  talk again + NPC Linkpearl -> Camp Tranquil (46,51) ??? instance -> Linette ->
  Goldsmith-guild Nenekko instance -> Linette + Echo both twins).
  Journal text confirms the full 10-beat chain (Roost -> stables -> parley ->
  linkpearl -> flower field box -> Linette -> Eshtaime -> Nenekko feelings ->
  Linette/mother -> Echo twins).
- Footage: `https://www.youtube.com/watch?v=FovlRIqOqPg` (Oroelf 2013-03-14 full);
  `https://www.youtube.com/watch?v=Xy6DUi4Msdk` (ElysiaZalakria 2011-10-03, 1.18b);
  `https://www.youtube.com/watch?v=dTMkeJlbHxU` (WotgAshiee LP547 2012-07-20);
  `https://www.youtube.com/watch?v=1TDAwECkPY0` (compilation ch 06:45-18:30);
  `https://www.youtube.com/watch?v=YHTP84yaLV8` (2010-12-24 full; reward
  30,000 gil + 3,000 marks).
- eLeMeN archive `.../quest/ClassQuest/Miner2.html` (JP journals; reward 30,000
  gil + EXP ~3420 added patch 1.20, tokens A-3000 removed).

## Sequence / flags / counters

Retail ladder: ACCEPT (Linette) -> 0 Roost briefing -> 5 driver clue ->
7 Parley -> 13 Linkpearl report -> 14 buried box -> 20 Linette interim ->
25 Eshtaime arrival -> 30 Nenekko feelings -> 35 Linette return ->
40 twin Echoes + reward. Journal keys text off the sequence (seq 14 covers
14<=seq<20); all J179-188 rows static, `getJournalInformation` returns zeros,
progress rides on attention messages.
Flags: 0 parley-introduced, 1 Echo Popokkuli, 2 Echo Seserukka. No counters.

## NPCs / actors

- Linette 1000861 (offer/interim/return), zone 209 public row 177.
- V'korolon 1000458 (Roost briefing), Gridania, marker 11046101.
- Chocobo-carriage driver 1700010 (clue + Parley), spawn row 3336, zone 155
  (62.04 / 10.56 / -1241.93); display 4000559 DAT-exact X/Z.
- Nenekko 1000604 (Eshtaime), spawn row 3338, zone 209
  (-135.93 / 201.5 / 266.43); DAT-exact X/Z. Candidates 1000604/2290035
  appearance-identical; 1000888 alternate outfit. Shopping encounter is public
  per J185 (no instance); mother's lines ride in the 030 client scene.
- Popokkuli 1000857 row 3339 (-95.66 / 195.6 / 316.79) + Seserukka 1000858
  row 3340 (-94.57 / 195.6 / 316.46), zone 209, DAT-exact X/Z.
  Popokkuli 1000857 chosen display-exact and unused elsewhere (avoids
  MSQ-actor reuse of private-only 1000040/1000041).
- Buried box: generic 1000174 trigger row 3337 `min300_buried_box`, zone 154
  (1504.37 / -0.24 / 1312.72), DAT-exact X/Z (Longroot flower field).

## Dialogue / cutscene IDs (delegateEvent)

`processEventLinetteStart` (offer, nil-accept) -> `processEvent010` (Roost) ->
`processEvent013` (driver clue rows 19-21; also intro at seq 7) ->
`processEvent017` (parley-win boundary) -> `processEvent020` (Linkpearl
transition, afterWarp client-staged) -> `processEvent025` (Linette interim
rows 33-34) -> `processEvent030` (Eshtaime arrival, afterWarp) ->
`processEvent040` (Nenekko feelings, afterWarp) -> `processEvent050`
(Linette/mother, afterWarp) -> `processEvent060` (Popokkuli Echo, ask 51030
mode 2 result 1) -> `processEvent070` (Seserukka Echo, completion boundary).
Chocobo-Stables/Eshtaime "transitions" need no server warp (client-staged).
Ambient variants 005/010/013/017/025/040/050 + 017_2/3 twin box lines unbound
(no owners). No quest-specific Linkpearl text in DAT/scenario: one
server-authored status line + engine glow (Hrv300 precedent, no retail text
invented).

## Objectives / mechanics

Parley: title 1201 "Little Saboteurs" (DAT negotiation row), required 0,
Man300 defaults difficulty 3 / 12 turns / 20s. Intro talk stamps negotiation
temp vars (idempotent); gated win plays 017, advances 7->13, lights NpcLS 25
(DAT "Amajina & Sons Mineral Concern"); losses retry with redirect.
Linkpearl: `NewNpcLsMsg(25)` + `onNpcLS` (Man300/whm0j4 pattern); seq 13 has
no map marker (11046105 is a -431/187 placeholder, stays unbound).
Box: one push advances (no recovered box event), actor retired session-scoped.
Echoes: ask-gated, Popokkuli first enforced with redirect (070 is the
completion boundary). Placeholders 11046102/03/05/07 never bound.

## Territories / positions (mob-guide method)

Gridania zones (Roost 11046101; driver 11046104) -> South Shroud Longroot
field 11046106 -> Ul'dah (Linette 11046108/11046111; Eshtaime 11046109;
Nenekko 11046110; twins 11046112/13). 11046114 Echo flower-field geography
replay-only, unbound. Y from recorded ground / nearest catalog rows per
`FF14-Memory/docs/mob_map_coordinates.md` (`map_coordinates.py`); rotations
0.0 scaffolds. Rows also mirrored in
`Data/sql/live migrations/min300_min306_route.sql`.

## Mobs / fight

None. Template `combat = false`, `documentedDirector` recoveredEmpty; no mob
IDs/stats/abilities/AI. No chocobo: 0 mount-spawn API hits; "Chocobo Stables"
/ "chocobo-carriage driver" hits are marker-role/journal narrative text only.
No instance exists server-side, so no unsummon/block is owed.

## Rewards / sync / lockouts

Central: 30,000 gil + 3,000 Miner marks (1000121). Script grants 3,420 EXP
(post-1.20 tier maximum, Arc300/Exc300 precedent; eLeMeN ~3420) + `sqrwa`
presentation. No level sync (no fight), no lockout, no timer.
Prereq: Miner 30 + 110460 completed, enforced in-script (Fsh300 precedent).

## Loophole coverage (verified in script body)

Qualified-gate on every handler (class+level+prereq); nil-accept offer retries
on full log; parley loss/callout retry; pearl glow is the prompt, msgStep!=0
ends cleanly; box uniqueId check (unknown/generic actors never advance) +
session retire; Echo order enforced; completion (CompleteQuest+AddExp) only on
Echo result 1; flags persisted across logout/DC; re-accept re-clears flags;
sequence-gated talks/pushes (no sequence break); no dup (flag-gated Echoes,
one-shot box); inv-full N/A (no item grants); death/wipe N/A (no fight).

## Implementation files (all pre-existing, verified)

`Data/scripts/quests/min/min300.lua`, `class_quest_template.lua` Min300 row
(`offer = true`), `quest_availability.lua` (110461 enabled),
`server_eventnpc_spawn_locations.sql` rows 3336-3340 + live migration,
`tools/validate_min300_route.py` (PASS).
