# DRG 111322 Drg0j2 — Lance of Fury (Lv35) — deep decomp

Target: `FF14-Decomp/docs/drg0j2_lance_of_fury_indepth_decomp_2026-09-27.md`

## Stages / sequences (server adapter)

- Offer: Alberic 1002001 `processEventALBERICStart` (Haldrath/Nidhogg
  origin history; offer EQ pc105/0x589). Prerequisite 111321.
- Briefing repeat: `processEvent000_ALBERICS` (adapter launch stage, not
  a journal stage — the accepted briefing already gives the objective).
- Battle (sequence 5): Bomb Baron in Cassiopeia Hollow, marker 11226101
  (1010.590027,-913.229980, region 101/area 113, MapMarkerQuestArea):
  1x Bomb Baron actor 2101610/display 3101612/mob 3007/Lv42/fire/
  skill list 12. Journal: Roc/20-22; 3 companions recommended (4 total).
- Completion: automatic on kill (walkthrough: Disembowel granted on
  objective complete) via `onJobQuestCompleteFirst`
  (`openPublicInformLongDialogWidget(worldMaster,51126,2000204)` 0x891)
  + `onJobQuestCompleteSecond`
  (`showGetJobAbilityWidget(27272 Disembowel,3)` 0x92D) + `...Third`
  (`showEventBeforeNpsLS(player,1000275,85)` 0x99C — NPC Linkpearl
  "Ser Alberic Bale"). EXP 3360. No scene, no warp.
- Post-quest: linkpearl chat; next quest at 40.

## NPCs / mobs / positions

- Alberic 1002001 @ zone 143 (-180.174,286.839,-304.109) spawn row 2360.
- Fight marker 11226101: zone **132 Cassiopeia Hollow**, page 700.
  Wiki cell (3,5): zone-132 local world (990,-858). Recorded-ground
  anchor: node 272 (991.136,-77.638,-850.732), 111 recorded pts in
  cell, dist 7.4 from cell center. `!pos 132 991.136 -77.638 -850.732`.
  Recording `Data/quicknavmesh/zone_132.tsv` (1358 nodes, sha256
  4162635180e65e566355d733a839711bc30c5c09ea80d088369e999e0cf30760;
  NOTE: registry cites superseded hash 3daec55e — XYZ re-verified
  identical in the live recording). Nearest ambient: skeleton
  swordbearer/orobon/goblin thug ~29-31u (catalog rows
  960798/961220/960704) — open-world aggro possible in retail; the
  private shell excludes them.
- Bomb Baron actor 2101610 = BombLesserNM/display 3101612; mob 3007
  (lv42, fire, list 12, comment "Cassiopeia Hollow; source location
  only"). NO public spawn row for 2101610 -> private adapter owns the
  copy; ambient kills cannot satisfy the quest.
- Skill list 12 (inspected): Fireball 23032, Self-destruct 23033+23628,
  Combustion 23034, Fast Burn 23036, Burning Cyclone 23274, Firecracker
  Shower 23315, Hellfire 23368/23408/23409, Firedamp 23396, Fire II
  23508, Burn II 23509 (+23581 row present).

## Instance / triggers / cutscenes / rewards

- Instance: private open-world adapter shell
  (`quest_sqb_drg0j2_<ownerId>`), maxPartySize 4 (journal
  recommendation), minimumLevel 35, timeout 900s, requireAllTargets.
  No level sync (no retail sync evidence). Mounted entry blocked;
  in-area mounting refused engine-side (private = mount-restricted).
- Trigger: retail field trigger owner unrecovered; adapter launches
  from Alberic's `processEvent000_ALBERICS` talk. Marker kept for
  journal fidelity.
- No NQ scene. Completion widgets fire on director success.
- Rewards: EXP 3360; Soul re-presentation (51126/2000204); action
  27272 Disembowel mode 3; linkpearl 1000275 event 85.

## Mechanics / phases / adds / positioning (external)

- GamerEscape Lance of Fury (1.0): talk to Alberic (linkpearl) ->
  Cassiopeia Hollow due south of Camp Bloodshore -> (3,5) -> kill Bomb
  Baron -> check linkpearl -> Disembowel auto-granted. No phases, no
  adds documented.
- YouTube: "Dragoon: Lv.35 Lance of Fury // FFXIV Quest Archive"
  (Meowlo's FFXIV Quest Archive, video i_k_E-vMx94; page fetched, body
  is a JS shell with no inspectable description transcript). Era
  shape: talk -> open-world kill -> auto-complete + linkpearl chat.
- Retail mechanic note: Self-destruct (23033/23628) in the recovered
  kit is the fight's signature threat (burn it down / be ready for
  the explosion). No HP-threshold phase callbacks were recovered, so
  the adapter runs the profile's normal AI cadence — no invented
  self-destruct timer or phase machine.

## Edge cases -> guards

- Wipe/timeout/disconnect/death/area-exit/quest-changed ->
  gc_sqb_runtime finish() -> retrySequence 0 at Alberic (native lease
  guards orphan shells); abandon/reaccept -> bound-quest check fails
  -> no credit; party/solo -> leader-only start, cap 4, entrant
  validation + post-movie revalidation; chocobo -> mounted entry
  refused, in-area mount refused by engine; OOB -> boundary +
  re-entry disabled; retrigger -> exact uniqueId kill credit,
  requireAllTargets; ambient Bomb Baron -> reconciled against the
  exact spawned uniqueId, foreign kills ignored (and no public spawn
  row exists); sequence-break (talk spam / unrelated kill) -> marker-
  only hard stop: reward path reachable only via director success;
  offers -> globally held with all job quests in
  quest_availability.lua (product decision, not per-quest state).

## Sources

- Decompiled client scenario `quest/scenario/drg/drg0j2.luac` ->
  `lua/quest/scenario/drg/drg0j2.lua` (functions + widgets inspected);
  `docs/Dat Mining/drg0j2.csv` rows 10/14/25 (bomb baron / Cassiopeia
  Hollow / east of Camp Bloodshore); `quest_marker.csv` 11226101;
  `xtx_displayName.csv` 3101612; `gamedata_actor_class.sql`
  BombLesserNM row; `server_battlenpc_mob_types_loot.sql` mob 3007
  row; `server_battlenpc_skill_list.sql` list 12 rows.
- `tools/mobspawns/map_coordinates.py` guide sections: All-zone
  interface (maps/locate with `--page` MapNavi row, `--cell` grid
  square), Agent workflow (recorded-height selection; center Y stays
  unresolved), Generate placements (reviewed profile lookup).
- GamerEscape Lance of Fury (1.0) journal + walkthrough (inspected
  bodies); Square Enix forum Dragoon Job Quests guide (snippet);
  YouTube quest-archive video page (title inspected, no transcript).
