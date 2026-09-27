# 110301 Hide and Seek Shenanigans — `Wdk300` (Carpenter 30)

- Class: CRP 29 | Level: 30 | Offer: A'naidjaa 1000465 | Prereq: 110300 (SQL)
- Client scenario: `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/wdk/wdk300.lua`
  (377 lines, full body read). Text bank 435.
- Walkthroughs: Gamer Escape `Hide_and_Seek_Shenanigans` (full journal,
  fetched); garlemald-server issue #85 (route checklist).

## Sequence flow (VERIFIED: scenario Lua + wiki journal)
- ACCEPT A'naidjaa `processEventANaidjaaStart` -> 0 watch (workshop door;
  `processEvent010` = cutscene `wdk30010` + warp) -> 5 supervise
  (`processEvent020` = `wdk30020`) -> 10 hide-and-seek: Nicoliaux (Acorn
  Orchard) -> Sansa lead -> Ryd (Wailing Barracks) -> Powle lead ->
  Elyn (Quiver's Hold) -> Nicoliaux lead -> Aunillie (never left workshop).
  3 proven Parleys (titles 2101/2201/2301; 4th variant 2302 unmapped) ->
  14 Aunillie reveal (`processEvent025_2` talk 163) -> 15 blocks grant
  (Colorful Building Block 11000029; `processEvent030` = `wdk30030`) ->
  20 Phrontistery delivery to Nogeloix (`processEvent040` = `wdk30040`) ->
  25 package/Salve grant (Sable Salve 11000027; `processEvent050` =
  `wdk30050`) -> 30 Roost delivery to Marcelloix (ask-108 gate
  `processEvent055`) -> 35 V'korolon cure (consume salve;
  `processEvent060` talks + `wdk30060`) + A'naidjaa finale
  (`processEvent070` talks 58-61, reward).
- Ambient/sub-scenes (unmapped): `005_2..005_13`, `040_2..040_7`,
  `050_2..050_7`, `055_2`, `S000_0..S000_6`, `S001_1..S001_5` (nested
  asks 129/132/135), `S002_1..S002_6`, `S003_1..S003_6` (scheduler call).

## Actors/markers (VERIFIED: spawn SQL + quest_marker.csv + map tool)
- A'naidjaa 1000465 @ z206 (11.86, 8.75, -1265.19).
- Children public z206: Nicoliaux 1000409, Ryd 1000412, Elyn 1000411
  (positions in 110300 decomp); Powle 1000238 (-33.08, 8.5, -1242.15);
  Sansa 1000239 (46.19, 8.57, -1268.59); Aunillie 1000410 (-34.16, 8.5,
  -1241.01). Willelda 1000242 @ z206 (179.15, 27.5, -1580.59) map
  (7.87, 2.43) p2800, 0 recorded pts.
- Nogeloix 1000597 @ z209 Ul'dah (-211.67, 229.6, 279.04) map (5.24, 6.31)
  p1900, 0 recorded pts (Phrontistery interior).
- V'korolon 1000458 @ z155 Gridania/Roost (55.82, 4, -1212.23) map
  (6.64, 6.12) p2700, 182 recorded pts.
- Marcelloix 1000596: NO spawn row (unspawned; Roost delivery unroutable).
- Live markers 11030101,03-13 (02 + 14-20 filler): 01 workshop door
  (-20.3, -1254); 03/08/09/11/13 A'naidjaa exact; 04 workshop (-37.25,
  -1257.62); 05 Willelda exact; 06 (155, -1575) + 07 (210, -1240) hide
  spots; 10 Nogeloix exact (region 104 place 421); 12 V'korolon exact.

## Parley (VERIFIED: parley reg + wdk300 script)
Board titles 2101/2201/2301 (+2302 unmapped); defaults diff 3 / turns 12 /
time 20. Server: window talks stamp `negotiation.*` tempvars idempotently
per child; `onNegotiationResult` sets win flags 0-2, clears board, 3/3
advances. Intro flags 4-6 (authored, new slots).

## Items (VERIFIED: gamedata_items SQL)
11000029 Colorful Building Block; 11000027 Sable Salve. No recipes (HOLD).

## Combat/sync/lockout/instance
- No mobs, no fight. Late private scene (ask-108) has no content owner;
  server plays delegate ask only. Chocobo: none (1.x no battle chocobos;
  no content area created). No timeout/lockout/party.

## Rewards (VERIFIED: SQL + script)
Central: gil 30000 + marks 1000113x3000. Script EXP 3420 (post-1.20 max).
Sugarloaf Hat NOT granted (era unresolved).

## Edge handling (server script)
Class+level+prereq gate every path; parley win idempotent (flags persist
logout/DC; intro-gated, sequence-gated); loss retries; board cleared on
win (no cross-quest re-parley); verified grant/consume (inv-full retry,
no dup turn-ins); cure-flagged finale (order enforced); re-accept safe;
abandon: no engine hook, state re-entrant; death/timeout N/A.

## Open gaps (HOLD)
- Marcelloix public spawn (or Roost instance owner); hide-spot trigger
  owners; ask-108 late-scene lifetime; 4th Parley 2302 mapping.
