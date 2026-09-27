# DRG 111323 Drg0j3 — Unfading Scars (Lv40) — deep decomp

Target: `FF14-Decomp/docs/drg0j3_unfading_scars_indepth_decomp_2026-09-27.md`

## Stages / sequences (server adapter)

- Offer: Alberic 1002001 `processEventALBERICStart` (Nidhogg's
  awakening fifteen summers past, Alberic's grievous injuries and lost
  powers, orphaned Estinien; offer EQ pc137/0x5BA). Prerequisite 111322.
- Briefing repeat: `processEvent000_ALBERICS` (adapter launch stage, not
  a journal stage).
- Battle (sequence 5): Spitfire near Millers' Glade, marker 11226201
  (1314.180054,1409.469971, region 102/area 203, MapMarkerQuestArea):
  1x Spitfire actor 2106207/display 3106209/mob 3101/Lv47/skill
  list 1. Journal: Roc/23-25; 3 companions recommended (4 total).
- Completion: automatic on kill (walkthrough: quest completes on kill,
  Elusive Jump learned) via `onJobQuestCompleteFirst`
  (`openPublicInformLongDialogWidget(worldMaster,51126,2000204)` 0x90C)
  + `onJobQuestCompleteSecond`
  (`showGetJobAbilityWidget(27267 Elusive Jump,1)` 0x9A8) + `...Third`
  (`showEventBeforeNpsLS(player,1000275,86)` 0xA17). EXP 4260.
  No scene, no warp.
- Post-quest: check Ser Alberic Bale linkpearl; next quest at 45.

## NPCs / mobs / positions

- Alberic 1002001 @ zone 143 (-180.174,286.839,-304.109) spawn row 2360.
- Fight marker 11226201: zone **145 Coerthas Eastern Lowlands**
  (region 102/area 203), page 3200. Marker transform (50.26,35.53)
  matches the forum guide "Hunt Spitfire X50 Y35" exactly. Recorded
  ground: 806 nodes in r200; node 2738
  (1313.927,227.717,1410.028) dist 0.6 from marker.
  `!pos 145 1313.927 227.717 1410.028`. Recording
  `Data/quicknavmesh/zone_145.tsv` (3630 nodes, sha256
  dd8f1b09b3921bdce7435ef50b0454a281bfb8997cb136e1dd7ca9c9f30ad21f).
  Nearest ambient: brutal_sheep 42-68u (catalog rows 4552/4559-4561)
  — outside leash range, no adds.
- Spitfire actor 2106207 = SpriteBrownLesserNM/display 3106209;
  mob 3101 (lv47, list 1, comment "Coerthas, source position
  unavailable"). NO public spawn row for 2106207 -> private adapter
  owns the copy; ambient kills cannot satisfy the quest.
- Skill list 1 (inspected): Frenetic Flurry 23122, Romp 23123, Triple
  Tumble 23124 (Spriggan family rotation; eLeMeN list 6035
  corroborates Flurry).

## Instance / triggers / cutscenes / rewards

- Instance: private open-world adapter shell
  (`quest_sqb_drg0j3_<ownerId>`), maxPartySize 4 (journal
  recommendation), minimumLevel 40, timeout 900s, requireAllTargets.
  No level sync (no retail sync evidence). Mounted entry blocked;
  in-area mounting refused engine-side (private = mount-restricted).
- Trigger: retail field trigger owner unrecovered; adapter launches
  from Alberic's `processEvent000_ALBERICS` talk. Marker kept for
  journal fidelity.
- No NQ scene. Completion widgets fire on director success.
- Rewards: EXP 4260; Soul re-presentation (51126/2000204); action
  27267 Elusive Jump mode 1; linkpearl 1000275 event 86.

## Mechanics / phases / adds / positioning (external)

- GamerEscape Unfading Scars: talk to Alberic -> Millers' Glade ->
  kill Spitfire -> auto-complete + Elusive Jump -> check linkpearl.
  No phases, no adds, no positioning mechanic documented. No
  quest-specific YouTube footage with inspectable mechanics was
  found; the era shape (talk -> kill -> auto-complete) is shared
  with j2's archive video.
- Retail kit is a 3-skill Spriggan rotation with no AOEs or phases
  recovered; the adapter retains the exact public profile rather
  than inventing a phase machine.

## Edge cases -> guards

- Wipe/timeout/disconnect/death/area-exit/quest-changed ->
  gc_sqb_runtime finish() -> retrySequence 0 at Alberic (native lease
  guards orphan shells); abandon/reaccept -> bound-quest check fails
  -> no credit; party/solo -> leader-only start, cap 4, entrant
  validation + post-movie revalidation; chocobo -> mounted entry
  refused, in-area mount refused by engine; OOB -> boundary +
  re-entry disabled; retrigger -> exact uniqueId kill credit,
  requireAllTargets; ambient Spitfire -> reconciled against the
  exact spawned uniqueId, foreign kills ignored (and no public spawn
  row exists); sequence-break (talk spam / unrelated kill) -> marker-
  only hard stop: reward path reachable only via director success;
  offers -> globally held with all job quests in
  quest_availability.lua (product decision, not per-quest state).

## Sources

- Decompiled client scenario `quest/scenario/drg/drg0j3.luac` ->
  `lua/quest/scenario/drg/drg0j3.lua` (functions + widgets inspected);
  `docs/Dat Mining/drg0j3.csv` rows 21/22/23/26 (Millers' Glade /
  spriggan Spitfire / desecrating); `quest_marker.csv` 11226201;
  `xtx_displayName.csv` 3106209; `gamedata_actor_class.sql`
  SpriteBrownLesserNM row; `server_battlenpc_mob_types_loot.sql`
  mob 3101 row; `server_battlenpc_skill_list.sql` list 1 rows.
- `tools/mobspawns/map_coordinates.py` guide sections: All-zone
  interface (maps/locate with `--page` MapNavi row), Agent workflow
  (world-X/Z lookup + recorded-height selection), Calibration
  (Coerthas row 3200 family, base 3712/2144; Y from recorded nodes
  only, never extrapolated).
- GamerEscape Unfading Scars journal + walkthrough (inspected
  bodies); Square Enix forum Dragoon Job Quests guide (X50 Y35,
  snippet); Fandom Dragoon Quests 1.0 (snippet).
