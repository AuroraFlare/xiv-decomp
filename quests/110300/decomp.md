# 110300 The Mouths of Babes — `Wdk200` (Carpenter 20)

- Class: CRP 29 | Level: 20 | Offer: A'naidjaa 1000465 | Prereq: none (SQL chain 0)
- Client scenario: `tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/wdk/wdk200.lua`
  (237 lines, full body read). Text bank 431.
- Walkthroughs: Gamer Escape `The_Mouths_of_Babes` (journal + steps, fetched);
  garlemald-server issue #84 (route checklist).

## Sequence flow (VERIFIED: scenario Lua + wiki journal)
- ACCEPT A'naidjaa `processEventANaidjaaStart` (ask-44 branch, quest-info
  confirm) -> 0 lesson (Acorn Orchard younglings; Vibrant Arrows 11000026
  grant; `processEvent010` = cutscene `wdk20010` + warp) -> 5 deliver arrows
  to Wybir at Quarrymill (bare handoff; Splintered Bow 11000061 grant) ->
  10 branch search (3 x `???`, instance with Wybir per wiki) -> 12 repair
  (`processEvent020` = cutscene `wdk20020`; ask-85 branch choice via
  `020_3/020_4/020_5`; suitable = BLOOMING per wiki; `processEvent025`
  talk 19-21) -> 15 showing (consume Blooming Bow 11000058; `processEvent030`
  = cutscene `wdk20030`) -> 20 report (younglings + Marcelloix meeting
  scene-internal; A'naidjaa `processEvent040` talks 39-42, reward).
- Ambient (unmapped, never invented): `005_2..005_7`, `010_2..010_8`,
  `020_2`, `020_3_2`, `020_4_2`, `020_5_2`, `020_6`, `020_7`, `025_2`,
  `025_3`, `030_2..030_7`.

## Actors/markers (VERIFIED: spawn SQL + quest_marker.csv + map tool)
- A'naidjaa 1000465 @ z206 (11.86, 8.75, -1265.19), map (6.20, 5.59) p2800.
- Youngling public cluster z206: Powle 1000238 (-33.08, 8.5, -1242.15),
  Sansa 1000239 (46.19, 8.57, -1268.59), Aunillie 1000410 (-34.16, 8.5,
  -1241.01), Nicoliaux 1000409 (-27.52, 8.4, -1244.59) map (5.80, 5.79),
  Ryd 1000412 (-42.47, 8, -1257.6) map (5.66, 5.66), Elyn 1000411
  (-46.06, 8.69, -1274.25) map (5.62, 5.50).
- Wybir 1000556: NO spawn row (unspawned). Wiki places her at Quarrymill,
  South Shroud z154 (Camp Tranquil aetheryte (734, -12, 1126) z154).
- Marcelloix 1000596: NO spawn row (unspawned).
- Live markers 11030001-06 (07-20 filler): 01 (-34.49, -1271.99, orchard),
  02/04 (1356.67, 955.83, Wybir/Quarrymill instance-side, place 305),
  03 (-37.25, -1257.62, branch search), 05/06 report (A'naidjaa exact).

## Items (VERIFIED: gamedata_items SQL)
11000026 Vibrant Arrows; 11000061 Splintered Bow; 11000062/63/64
Blooming/Supple/Sturdy Branch; 11000058/59/60 Blooming/Supple/Sturdy Bow.
ZERO quest-item recipes in Data/recipes.csv (HOLD blocker).

## Combat/sync/lockout/instance
- No mobs, no BNPC refs, no fight, no enmity/leash/sync. Non-combat.
- Instance: wiki confirms Wybir bow-repair scene is instanced (Wybir + 3
  ???). No director/content owner recovered; server plays delegate scenes
  only. Chocobo: 1.x has no battle chocobos; script creates no content
  area, so no mount can join (repo precedent).
- No timeout, no lockout, no party.

## Rewards (VERIFIED: gamedata_quest_rewards.sql + script)
Central: gil 20000 + CRP marks 1000113x2000. Script: EXP 1760 (post-1.20
max). Wiki-era Bas-relief Iron Saw NOT granted (era unresolved).

## Edge handling (server script)
Class+level gate on every path; verified grants (inv-full retry msg);
verified consumes (no dup turn-ins); discoveries persisted (counters 2/3 +
flag 0); suitable-repair flag 1; wrong-bow refusal holds; ask-decline
holds; re-accept safe (held-count, idempotent grants); abandon: no engine
hook — leftovers persist, flow re-entrant; death/logout N/A (no combat,
persisted state).

## Open gaps (HOLD)
- Wybir/Marcelloix spawns (or instance owners); 3 x ??? search callbacks;
  bow-repair recipes + outcome mapping; wdk20010/20 scene lifetimes.
