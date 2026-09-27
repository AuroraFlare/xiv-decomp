# Whm0j1 Seeds of Initiative (111241) indepth decomp - 2026-09-27 (JOB WHM-A)

Lv30 CNJ->WHM unlock. Soileine (Stillglade Fane) -> Raya-O-Senna lakeside
cave -> Mun-Tuy Cellars brood fight (1 Diremite + 3 Mitelings, reclaim
Nirvana) -> Raya reward chain -> Soul of the White Mage + Presence of Mind.
Status: Implemented, bespoke private adapter (whm0j1.lua + director).

## Client scenario (job_war_mnk_whm_decomp_2026-09-07 Whm0j1 + calls/bytecode/scene)

- `processEventStart`: accept 6 / decline 5; `StartAfter` reminder 7.
- `processEventRayao(arg4)`: arg4==1 returning greeting 9 else first-meeting
  8; dialogue only, not battle authorization.
- `processEventClear`: says 23,24, returns WITHOUT finishing the turn.
- `processEventClearNQ`: Default fade-out, finishes turn, wait 1, plays
  `whm0j110`, fade-in. Split handoff is deliberate; kept intact.
- `processEventJob` (item widget) + `processEventKokuti` (presents 27344,1).
- Moogle A/B00-02 + misspelled `RyaoAfter`: progress-keyed variants, not
  extra objectives. Moogle turns use `startCliantTalkTurnNoWait(1,player)`.
- Client director `QuestDirectorWhm0j101`: empty shell, no count/waves/kills.
- Scene whm0j110: Raya 1001570, Oha-Sok 1060030, Pukni Pakk 1001937, Kupcha
  Kupa 1001938, prop 1200318. PC/Raya share one setup point; never copy
  scene setups into persistent spawns.

## Stages / flags / markers / positions

- SEQ: ACCEPT Soileine -> 0 Raya route -> 5 battle (retry at Raya) -> 10
  reward at Raya. FLAG_MET_RAYA bit 0; cleared in onStart (abandon-safe).
- Markers (quest_marker.csv): 11222001 route cave (-1540.98,-1588.34)
  m00013 103/303; 11222002 battle (-1008.96,-2091.48) m00013 103/311
  display 4000257; 11222003 reward = cave.
- Coord guide "All-zone interface" + "Agent workflow": zone 157 page 2500
  locate (-1008.96,-2091.48) = map (4.63,5.97), 0 recorded points within
  30y, nearest node 646 (-975.78,-19.71,-2094.78) 33.3y away,
  inside_selection=false, height UNRESOLVED. Public placement there would
  be ungrounded: private adapter only. Marker pins journal destination.
- Cave zone 152 page 2200: map (15.63,22.20) = patch 1.21 (15,22), 26
  recorded points in selection (grounded public area; Raya spawn UNREVIEWED).
- Web (fandom + GamerEscape, bodies inspected): brood ensconced in Mun-Tuy
  Cellars north of Camp Emerald Moss; party of 4 recommended. No 1.x
  footage URL exists (registry period_footage_note); no phases/add-timing
  beyond the 1+3 roster is retail-proven.

## NPCs / mobs

- Soileine 1000234: public spawn verified (Gridania 206,
  -330.813,8.0,-1682.83, eventnpc row 2296).
- Raya-O-Senna 1001570: NO spawn row; marker X/Z proposal UNREVIEWED, no
  SQL emitted. Oha-Sok + moogles: scene-only.
- Adapter mobs (WHM_whm_quest_mobs.sql, idempotent): 3146 Miteling
  Straggler lv30, 3147 Diremite Straggler lv32, mite family skill 5018
  (Caustic Blow 23288, Deadly Thrust 23289/23291, Realm Shaker 23290,
  Sticky Web 23294). No retail profile exists for 2201114/2201115.
- Waves (EXPLICIT adapter policy): wave 1 = 3x Miteling, wave 2 = 1x
  Diremite; offsets place them relative to entrant inside the boundary.

## Instance / fail / sync

- Private shell: maxPartySize 4, minimumLevel 30 (owner AND entrants at
  launch + recheck after entry movie), partyRadius 30, boundaryRadius 40
  (SetBoundaryCircle), timeout 600. No retail enrage: enrage = timeout
  fail to Raya retry. 1.x has no sync-down; over-level allowed.
- Wipe/timeout/disconnect/death-during-scene/abandon/re-enter/spawn-fail:
  all land on seq 5 with Raya as visible retry; victory persists BEFORE
  the aftermath attempt (cutscene-skip safe); native live-shell lease
  blocks duplicate shells; onKillBNpc inert (director uniqueId
  reconciliation only; ambient/stale/duplicate kills never credit).
- NO chocobos: gc_sqb_quest.lua isMounted gates refuse mounted leader
  ("Dismount your chocobo...") and mounted members at CanStart AND Start;
  0 mount APIs in whm scripts (contract scan); private-area engine ban.

## Rewards

- EXP 2661; action Presence of Mind 27344; key item 2000206 Soul of the
  White Mage; item 3020410 The Keeper's Hymn. Nirvana 11000551 is
  Normal/DummyItem: recovery = quest flag/counter on director victory,
  presented via prop 1200318; no AddItem(11000551) anywhere.

## Sources

- job_war_mnk_whm_decomp_2026-09-07.md Whm0j1 + whm0j1.calls/bytecode/scene
- quest_marker.csv 11222001-3; actorclass_graphic 2201114/2201115
- fandom White Mage Quests (1.0); GamerEscape Seeds_of_Initiative
- map_coordinates.py locate zone 157/152 (this pass); gamedata_items SQL
