# 110261 Good Knight, Sweet Dreams (Cnj300) — in-depth decomp

Conjurer rank 30. Offer/reward: Soileine (1000234/display 1300064),
Stillglade Fane zone 206 (spawn 2296). Requires CNJ + level 30;
gamedata prereq 110260 (server does not gate offers on prerequisites).
Text bank `_loadTextDataPermanently(483, "cnj300")`.

## Sequence / flags (server: class_quest_template.lua:Cnj300, driver)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Soileine offer | `processEventSoileineStart`: talk rows 3-6+57, double `showQuestInfomation` call (accept on 1/nil) |
| 1 | Lifemend Morys (1000505; zone 150, -792.368/20.346/-1065.936, id 3298) | `processEvent010` (`cnj30010`) + afterEvent `processEvent010_2` linkpearl reply (rows 110-111) folded into the same interaction; marker 11026101 |
| 2 | Amberscale duty trigger (1000174; zone 150, -543.79/Y UNRESOLVED/-511.35, id 3299) | Proximity push, no talk event; launches duty; marker 11026102 |
| 10 | Six-elemental duty (internal) | `processEvent015_1` Morys briefing (rows 120-122: "See the elementals. Their natures. Their aspects. Magic will serve you.") as preEvent; no public ENPC |
| 20 | Soileine return | `processEvent030` (`cnj30030`); marker 11026103. Retail branches seq 15 on journal data; driver plays linearly (documented approximation) |
| 21 | Owl's Nest Yuhelmeric (1000370; zone 145, 2550.82/175.35/1304.72, id 3235) | `processEvent040` (`cnj30040`, after-warp); marker 11026104 |
| 22 | Rescued-knight Echo gate (1000573; zone 145, 2567.162/175.709/1309.727, id 3300) | `processEvent050`: talk row 34 + Echo ask 51030 (double-called: branch + return); result 1 plays `cnj30050` (arg 2) and advances; decline (row 129) holds; marker 11026105 |
| 23 | Forest-border Morys (1000505; zone 152, -1602.12/Y UNRESOLVED/-1854.22, id 3301) | `processEvent060` (`cnj30060`); marker 11026106 |
| 30 | Soileine reward | `processEvent070` (`cnj30070`) + `sqrwa 3420`; marker 11026107 |

Ambient delegate events (client scenario, unowned/unbound): 005_2..005_11,
020_2..020_6, 030_2..030_8, 040_1..040_6, 050_1..050_6. Patrol legs
(Humblehearth/Camp Emerald Moss) have no DAT markers: journal-only.

## Dialogue / cutscenes (recovered client Cnj300)

cnj30010 (Lifemend), cnj30020 (knight aftermath, after-warp, plays as
battle success scene), cnj30030 (Soileine), cnj30040 (Owl's Nest,
after-warp), cnj30050 (Echo vision, arg 2), cnj30060 (forest border),
cnj30070 (reward).

## Objectives / markers (DAT quest_marker; 11026108-20 filler)

11026101 Lifemend (-792,-1070) → square (23,27), exactly the wiki's
"Lifemend Stump (23,27)"; recorded ground Y 20.35 at the marker.
11026102 Amberscale (-543.79,-511.35) → (25,32), exactly the wiki's
"Amberscale Rock (25,32)"; corridor unrecorded (Y UNRESOLVED — 0 recorded pts ≤30 ylm, nearest node 1077 @245.9 ylm NOT borrowed per guide; needs `!quicknavmesh` capture).
11026103 Soileine (-331,-1683); 11026104 Owl's Nest (2454,1209, zone
145) → (61,33); 11026105 knight (2573.25,1305.79) → (62,34);
11026106 forest border (-1602.12,-1854.22, zone 152) → (15,19),
unrecorded corridor end (Y UNRESOLVED — 0 recorded pts ≤30 ylm, nearest node 2567 @63.5 ylm NOT borrowed per guide; needs `!quicknavmesh` capture); 11026107 Soileine reward.
Conversions via `tools/mobspawns/map_coordinates.py` (zones 150/145/152
native pages 2000/3200/2200).

## Instance / territory

Fight: SimpleContentQuestBattle content copy `quest_sqb_cnj300_<pid>`
(private area; adapter fan formation offsets, not retail layout).
Client directors unrecovered. Fail/timeout/death returns to retry
seq 0. Retail linkpearl exit is folded into the 010_2 afterEvent;
no linkpearl-from-menu step exists in the driver.

## Fight: six aspect elementals, single group (lv 25)

- Fire 2204601/3134, Ice 2204701/3135, Wind 2204801/3136, Earth
  2204901/3137, Lightning 2205001/3138, Water 2205101/3139 — all wave
  1, lv 25, `cnj300_{fire,ice,wind,earth,lightning,water}_elemental`.
- Stats: shape cloned from open-world earth elemental, neutral
  resists, skillList 5021 (Elemental: Aetherial Barrier 23152).
  Retail aspect strengths/weaknesses are unrecovered (walkthrough
  says they help; eLeMeN family entry has empty resists; no DAT
  resistance table known) and are NOT enforced.
- Morys (content variant 2290033) stages present but non-assist;
  fallen knight (1000573) stages as dressing; knight aftermath
  `processEvent020`/`cnj30020` runs as the battle success scene.
- Director QuestDirectorClassCnj300: expected 10 → success 20 → retry
  0, requireAllTargets, party cap 3, timeout 600 s; exact-actor kill
  reconciliation, no dup/foreign credit.
- Phases/reinforcements: none (single six-pack wave). Enmity/leash:
  standard content AI.

## Triggers / edge handling

Class+level gates on every entry point; Echo decline holds seq 22;
failed launch reverts to seq 0; death/timeout/disconnect/area-exit/
abandon/logout/DC via gc_sqb_runtime (retry 0, teardown, relog
rebind); dismount gate at entry + private-area mount block +
transition/per-tick force-dismount; party leader-only start, max 3,
same-area/alive/combat-class checks. No level sync; overlevel
allowed. No lockout beyond 600 s. No item reward (none evidenced).

## Rewards (gamedata_quest_rewards + script)

Gil 30000 + CNJ marks 1000111x3000 (central) + Exp 3420 (script,
post-1.20 level-30 maximum). No item.

## Sources

- Client scenario decomp `.../lua/quest/scenario/cnj/cnj300.lua`;
  DAT `docs/Dat Mining/cnj300.csv` (129 rows), `quest_marker.csv`
  11026101-07 (+08-20 filler), display 1000175/1200022/4000257/
  4000470/3204601-3205101; `quest.csv` row 110261 (prereq 110260).
- Gamer Escape `Good_Knight,_Sweet_Dreams` (14-step walkthrough:
  Lifemend (23,27), Amberscale (25,32), six elementals one group,
  Morys non-assist, knight, linkpearl exit, Owl's Nest, Echo) +
  Plot Details transcript; FFXIV Wiki `Conjurer_Quests_(version_1.0)`
  (journal, 3420 EXP, no item).
- YouTube `Qb01veh35i8` + `KDkdL7XCBPg` (Part 1: Ishgardian knight,
  "dragon" at the bat-shaped rock) + `Fl5tkBuF9Yc` v1.23b CNJ story.
- Map conversions via `tools/mobspawns/map_coordinates.py`.

## Open gaps

- Live-client acceptance of scenes/fight positions (offsets, cap,
  timer, after-warp lifetimes are documented defaults).
- Retail aspect strengths/weaknesses + seq-15 journal branch.
- Retail patrol legs + linkpearl-from-menu exit (no DAT markers).
