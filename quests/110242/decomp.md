# 110242 Law and the Order — `thm306` (THM Lv.36)

- Class: THM 22 | Level: 36 | SQL prereq: 0 | SQL code: `Thm306`
- Server: `Data/scripts/quests/thm/thm306.lua` (driver stub) + `class_quest_template.lua:Thm306`
- Director: `Data/scripts/directors/Quest/QuestDirectorClassThm306.lua` (`Quest/QuestDirectorClassThm306`)
- Availability: enabled (implemented instance row); `tools/validate_thm306_route.py` PASS (re-run 2026-09-27)
- Decomp scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/thm/thm306.lua` (4537 bytes)

## Sequence / flags / objectives

| Seq | Objective | Actor | Marker | Event |
|---|---|---|---|---|
| ACCEPT | Offer from Yayake | 1000846 Yayake | — | processEventYayakeStart (thm30610) |
| 0 | Retry at Yayake after duty failure | 1000846 | — | — |
| 1 | I'loofii briefing (carriage accident, vengeance orders) | 1000847 | 11024201 | processEvent020 (thm30620) |
| 2 | Wreck-site rival talk (Horizon's Edge Footfalls, under the bridge) | 1000607 | 11024202 | processEvent030 (thm30630) |
| 3 | Rival Echo gate (`ask(51030,2)`, result 0 holds) | 1000607 | 11024203 | processEvent035 (requiredResult 1) |
| 10 | Inside nonlethal duel (internal) | content-owned | 11024203 | preEvent 040 (thm30640) → fight → 050 |
| 20 | I'loofii report/reward | 1000847 | 11024205 | processEvent060 (thm30660) |

Markers 02/03 share the wreck-site home. No quest items; no counters. Unbound: `010_2-7`
Ossuary chatter, `020_2/020_3`, `040_2/040_3`, `050_2-7` (post-quest).

## NPCs / markers (DAT quest_marker.csv, verified)

- 11024201 briefing (-306.80, 239.27, 1900025) / 11024205 report (same X/Z)
- 11024202 wreck talk + 11024203 wreck Echo/duel: (-1849.860, -281.510, 4000189),
  region 104 area 403
- 11024204/06-20 rejected filler. DAT displays: route rival 1000607/4000189, battle
  rival 2289015/4000189, Yayake 1000846, I'loofii 1000847

## Spawn positions (map_coordinates.py, re-verified 2026-09-27)

- Scaffold 3309 `thm306_wreck_rival`, zone 172: (-1849.756, 24.922, -284.174) =
  exact recorded ground node 8267 (0.0005u, 36 pts in selection, canyon floor
  below the bridge, 2.7u from the DAT pin on a connected path)
- `locate --zone 172 --page 1300 --world -1849.756 -284.174` → map (8.37, 27.88),
  cell (8,27). GamerEscape "(8,2)" disagrees in Y (X matches) — recorded as an
  unresolved wiki typo; DAT X/Z + recorded ground rule the placement
- Duel rival spawns in the private area at formation offset; no public-world fight
  spawns. No chocobo actor anywhere (coach accident is backdrop only)

## Fight: nonlethal duel vs the Overweening Thaumaturge

- Rival: 2289015 / mobType 32742, Lv.36, THM job 22, skill list 14 (rank-36 Ossuary
  Almstaker precedent)
- Story-nonlethal: I'loofii intervenes ("That is enough!"), the beaten rival stands
  judgment. Director ends the fight on the yield poll (rival HP ≤ 25% max, checked
  on the completion poll) with the kill path as a safe fallback; either way the
  rival is despawned alive and `processEvent050` (thm30650) plays as the in-instance
  success event before the return. A missing HP surface degrades to kill-to-win
  without error
- `processEvent040` (thm30640) is the battle-handoff preEvent (ARC200 precedent)
- Director 10 → 20 / 0; party cap 3; 600 s; boundary 45.0

## Triggers / rewards / sync / lockouts

- Entry: Echo gate result 1 → push/talk flow → `StartPrivateQuestBattle`; mounted
  blocked (leader + helpers, re-checked after preEvent)
- Death/disconnect/area-exit/abandon/600 s timeout/failed entry → retry seq 0;
  `DisableReentry` blocks mid-duty rejoin
- Overlevel: no 1.0 level sync; owner gated THM ≥ 36 at accept/talk/push, no maximum
- Rewards: 4720 EXP script (post-1.20 Lv.36 max); 36000 gil + 3600 marks 1000110
  central. No item reward in DAT
- One-time quest bit; Echo gate result 0 holds seq 3 (no skip); reward only at seq 20

## Sources / gaps

- GamerEscape Law and the Order (journal + walkthrough: Yayake → I'loofii → Horizon's
  Edge under-bridge site → Echo → duel → I'loofii report); Fandom THM 1.0; YouTube
  fzug_RoAlbA + mFHVGOK7Tuk (yield mechanic, previously reviewed per CSV notes)
- OPEN: live-client acceptance; 25% yield threshold authored; offsets/party/timeout
  INFERRED; wiki (8,2) Y-typo unresolved
