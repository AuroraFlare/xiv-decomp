# 110302 Spanning the Spectrum — `Wdk306` (Carpenter 36)

- Class: CRP 29 | Level: 36 | Offer: Marcelloix 1000596 | Prereq: 110301 (SQL)
- Client scenario: `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/wdk/wdk306.lua`
  (315 lines, full body read). Text bank 439.
- Walkthroughs: NO Gamer Escape page; garlemald-server issue #86 (one-line:
  Marcelloix -> Acorn Orchard children -> Fairweather Fetish + Large Leaf
  crafts). Metadata-only route (marked throughout server script).

## Sequence flow (scenario Lua structure; journal unrecovered)
- ACCEPT Marcelloix `processEventMarcelloixStart` (talks 3-5, quest-info,
  warp on accept) -> 0 prep (supply baselines; `processEvent010` =
  `wdk30610`) -> 5 supplies (10x Large Leaf 11000066 + 10x Fairweather
  Fetish 11000065 probe; `processEvent020` = `wdk30620`) -> 10 Nonolato
  scouting briefing (Gods' Quiver Petition 11000028; `processEvent023`
  talks 133-136) -> 12 Wybir rendezvous (`processEvent025` talks 139-141
  + warp) -> 13 arrow-support route (ALLY SHOOTS, player kills nothing;
  NO driver: roster/count/recipe/delivery/failure/transforms missing) ->
  14 A'naidjaa report (`processEvent030` = `wdk30630`) -> 15 Mirror
  excursion (`processEvent040` = `wdk30640`) -> 20 child talks
  (`processEvent050` = `wdk30650`) -> 25 rain drawings (ask-108 gate
  `processEvent055`) -> 28 Marcelloix artwork finale (`processEvent060`
  = `wdk30660`; NO artwork item documented).
- Ambient (unmapped): `MarcelloixStart_2`, `005_2..005_7`, `020_1`,
  `023_1`, `030_2..030_5`, `040_2..040_7`, `050_2..050_7`, `055_2`,
  `S000_1..S000_7`, `S001_2..S001_7`, `S002_2..S002_7`.

## Actors/markers (VERIFIED: spawn SQL + quest_marker.csv + map tool)
- Nonolato 1000463 @ z206 (232.88, 12.46, -1268.94) map (8.41, 5.55) p2800.
- A'naidjaa 1000465 @ z206 (11.86, 8.75, -1265.19).
- Ryd 1000412 public guild-side (-42.47, 8, -1257.6); marker 11030209 binds
  Ryd variant actor 1000414 (displayName "Ryd") at Mirror (460.69, -111.58).
- Marcelloix 1000596 / Wybir 1000556: NO spawn rows (HOLD).
- Live markers 11030201-04,06-10 (05 + 11-20 filler): 01 prep (-34.49,
  -1271.99); 02 supplies (-37.25, -1257.62); 03 Nonolato exact; 04 Wybir
  (1356.67, 955.83, place 305); 06 A'naidjaa exact; 07-10 Mirror cluster
  (region 103 place 301): 07 (487.09, -126.32), 08 Marcelloix-side
  (502.44, -123.38), 09 Ryd 1000414 (460.69, -111.58), 10 (462.57, -115.71).
  Mirror zone ID unresolved (no spawn rows; Ryd public spawn guild-side).

## Items (VERIFIED: gamedata_items SQL)
11000066 Large Leaf; 11000065 Fairweather Fetish; 11000028 Gods' Quiver
Petition. Gathering nodes + fetish recipe unregistered (HOLD).

## Combat/sync/lockout/instance
- No player combat: ally-shooter route (Wybir shoots; player supplies
  arrows, zero kills). No roster/mobs recovered. No sync/timeout/lockout.
- Two recovered directors empty (no content owner). Chocobo: none (1.x no
  battle chocobos; no content area created).

## Rewards (VERIFIED: SQL + script)
Central: gil 36000 + marks 1000113x3600 (top variants; raw rules
unresolved). Script EXP 4720 (post-1.20 max).

## Edge handling (server script)
Class+level+prereq gate every path; supply baselines re-snapshot at prep
(re-accept/abandon safe); net-gain + held-count double probe (no dup
credit, no trade-in exploit without held stock); verified petition grant;
ask-decline holds at drawings; arrow leg hard-holds with message (never
advances without driver); finale consumes nothing (no artwork item);
logout/DC safe (persisted counters); death/timeout N/A.

## Open gaps (HOLD)
- Marcelloix/Wybir/youngling-Mirror spawns (or instance owners);
  ally-shooter driver; leaf nodes + fetish recipe; content directors;
  artwork item; journal/walkthrough archive.
