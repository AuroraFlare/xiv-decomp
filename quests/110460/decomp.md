# 110460 A Piece of History (Min200) — indepth decomp 2026-09-27

Miner Lv.20 class quest. Gather-three-distinct-finds + delivery/appraisal.
No combat, no instance in the live route, no mobs, no sync, no lockout.

## Sources (bodies inspected)

- Live script `FF14-Memory/Data/scripts/quests/min/min200.lua` (bespoke) +
  `min_quest_helpers.lua`; decomp source row `Min200` in
  `class_quest_template.lua`; `docs/min200_a_piece_of_history_2026-09-26.md`;
  pack doc `FF14-Decomp/docs/class-quest-gathering-indepth-decomp-2026-09-27.md`.
- Client scenario `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/min/min200.lua`
  (decompiled); DAT `quest_marker.csv` rows 11046001-11046008; `xtx_quest` 110460.
- Walkthrough: <https://ffxiv.gamerescape.com/wiki/A_Piece_of_History>
  (Linette offer; Z'ssapa twins scene with cosmetic Lalafell choice; second
  Z'ssapa talk names the 3 finds; mine near ??? at 37-27 Eastern / 15-28
  Western / 25-27 Central Thanalan; Prospect unneeded, Lay of the Land only;
  Z'ssapa appraisal; Nenekko instance interlude; Linette reward; prereq
  Fade to White 110013).
- Footage: `https://www.youtube.com/watch?v=1TDAwECkPY0` ch 00:00-06:45
  (A Piece of History; per pack doc A9 log).

## Sequence / flags / counters

Driver-compatible ladder: ACCEPT (Linette) -> 1 briefing -> 2 item list ->
3 mining + appraisal -> 0 Linette reward.
Counters 0-2: briefing-time owned baselines per find (slots 0-3 are the only
persisted counters). Flags 0-2: obtained booleans per find.
Credit per find = max(0, owned - baseline); pre-briefing finds never count.
Journal during seq 3 returns live net-gain flags `(eye, wood, ewer, 0, 3)`
matching DAT `$E8(2..4)` cells; all other states return zeros.

## NPCs / actors

- Linette 1000861 (offer + reward), zone 209, public row 177
  (-92.38 / 195.6 / 313.43); X/Z match DAT reward marker 11046005.
- Z'ssapa 1000887 (briefing/list/appraisal), Nanawa Mines entrance,
  zone 170, public row 2464 (92.767 / 183.826 / -1030.44), X/Z DAT-exact
  for marker 11046001. Resolves template candidates {1000887, 1001217}.
- Nenekko interlude actors (030 shard scene / 035 walk-home / 040): all three
  1500080-class candidates exist as classes but have NO spawn row anywhere;
  interlude unbound (walk-home auto-resolves per walkthrough, no escort AI owed).

## Dialogue / cutscene IDs (delegateEvent)

`processEventLinetteStart` (offer, nil-accept) -> `processEvent010`
(briefing + baseline snapshot; twin choice cosmetic, no result gate) ->
`processEvent015_1` + `processEvent015_2` (item list) -> `processEvent020`
(appraisal; always plays, advances only on full pack) -> `processEvent050`
(Linette reward). 017_A/B/C appraisal branches unbound (no selection rule).

## Objectives / mechanics

Mine one each: Sheep's-eye 11000012, Petrified Wood 11000013,
Ewer Fragment 11000014. NQ only (quantities convention); HQ does not count.
No source fixes which find comes from which area, so every area pool carries
all three finds and the gate requires one of each. Prospect/Lay-of-the-Land
gating unmodeled (no required-action gate in engine). No `onGather` handler:
C# fans out only `onFishCatch`; credit is snapshot-only (completable).

## Territories / gathering pools (mob-guide positions)

- 11046006 Drybone: zone 171, pool 30071 (nearest node 27.3 yalms).
- 11046007 Horizon's Edge: zone 172, pool 30081 (nearest node 34.0 yalms).
- 11046008 Black Brush: zone 170, pool 30061 (nearest node 29.7 yalms).
Pool rows live ONLY in `Data/sql/live migrations/min200_route.sql`
(weight 100, sweetSpot NULL); finds absent from `Data/gather.csv` so the
generated import cannot emit them. All three area markers surface in the
journal map during delivery (retail behavior). Appraisal marker 11046003
shows when ready; reward marker 11046005 at Linette.
Position method per `FF14-Memory/docs/mob_map_coordinates.md`:
DAT-exact marker X/Z + recorded-ground Y via `map_coordinates.py`.

## Mobs / fight

None. Template `combat = false`; no director; no mob IDs/stats/abilities/AI.
No chocobo: 0 `IssueChocobo|SpawnChocobo|ChocoboMount|IssueMount` hits in
pack scripts; no instance exists so no unsummon/block is owed.

## Triggers

No push triggers. Talk-only route (Linette / Z'ssapa).

## Rewards / sync / lockouts

Central: 20,000 gil + 2,000 Miners' Guild marks (item 1000121) via
`gamedata_quest_rewards`. No EXP (post-1.20 amount unresolved), no Iron
Dolabra (reward-era conflict). No level sync (no fight), no lockout, no timer.
Prereq Fade to White (110013) documented, unenforced (no driver support).

## Loophole coverage (verified in script body)

Class+level (Miner 20) gates every talk/ENPC path; nil-accept offer retries on
full log; partial pack holds with "Finds appraised: n of 3" after the reminder;
consume verified per item with failure message; finds kept on abandon and
re-snapshotted on re-accept (no double credit); counters/flags persisted
across logout/DC; sequence-gated talks (no sequence break); no dup turn-in
(single full-pack consume); inv-full N/A (no grants).

## Implementation files (all pre-existing, verified)

`Data/scripts/quests/min/min200.lua`, `min_quest_helpers.lua`,
`class_quest_template.lua` Min200 row, `quest_availability.lua` (110460
enabled), `Data/sql/live migrations/min200_route.sql`,
`tools/validate_min200_route.py` (PASS).
