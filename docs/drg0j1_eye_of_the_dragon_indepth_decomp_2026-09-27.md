# DRG 111321 Drg0j1 — Eye of the Dragon (Lv30) — deep decomp

Target: `FF14-Decomp/docs/drg0j1_eye_of_the_dragon_indepth_decomp_2026-09-27.md`

## Stages / sequences (server adapter)

- Offer: Haurtefert 1000569 (Gridania, Wailing Barracks; spawn row 711,
  zone 206) `processEventStart` (intro flag arg4==1 pc24/0x31E, offer EQ
  pc80/0x3FE; balanced 1.5s fades on accept AND reject exits). Requires
  LNC 30 + PGL 15 (walkthrough).
- Route: Alberic 1002001 at the Gates of Judgement, marker 11226001
  (-179.35,-303.73, region 102/area 201), `processEventAlberic` briefing +
  `processEventAlbericAfter` reminder (unused R3 — no branch meaning).
  Alberic public spawn row 2360 zone 143 (-180.174,286.839,-304.109)
  corroborates the marker.
- Battle (sequence 5): cull at marker 11226002 (1483.930054,-895.229980,
  region 103/area 302, display ???): 3x Crabfisher 2204511/Lv33 +
  1x Ironshell 2207612/Lv35. Walkthrough (45,29) East Shroud matches the
  marker transform exactly (45.88,29.13). The walkthrough calls this an
  instance; the client director `QuestDirectorDrg0j101` is an empty
  SimpleQuestBattle shell (require + _defineClass only), so the adapter
  is a private SQB shell either way.
- Auto-aftermath: `processEventNQ` plays `drg0j110` (default fade
  contract: `startFadeOutCutSceneDefault` then
  `startNQCutScene("drg0j110",1)`). Estinien appears here ONLY.
- Reward: return to Alberic, marker 11226003, `processEventClear`
  (conversational 1.5s fades 0xAC1/0xADD — NOT a warp) +
  `processEventKokuti(3020410)`: item widget (caller arg = 3020410
  The Keeper's Hymn), global long 51126 + key 2000204 (Soul of the
  Dragoon) 0xEFC/w8, action 27266 Jump mode 1 0xF1C/w6. EXP 2661.
- Journal: Fst/455-459 (Haurtefert -> Alberic -> cull -> black-clad
  Estinien + light -> return); 3 companions permitted (4 total).
  Post-quest text 48 points to Alberic at 35.

## NPCs / mobs / positions

- Haurtefert 1000569 @ zone 206 (203.62,29.5,-1578.13) spawn row 711.
- Alberic 1002001 @ zone 143 (-180.174,286.839,-304.109) spawn row 2360.
- Fight marker 11226002: zone **151 East Shroud** (region 103/area 302),
  page 2100. Recorded ground: 788 nodes in r200; node 4916
  (1486.117,15.379,-894.077) dist 2.5 from marker; scene PC setup
  (1470.846,15.583,-889.638) rot -2.967 corroborates Y≈15.4.
  `!pos 151 1486.117 15.379 -894.077`. Recording
  `Data/quicknavmesh/zone_151.tsv` (5313 nodes, sha256
  609638ee4a73e8dfbe55c01f500e77b29a47f60c84ecce6c4269ee53c2e7ed75).
  Nearest ambient: goblin_butcher 70u, spiny_dormouse 78u (catalog rows
  1735/1778) — outside any reasonable leash, no adds.
- Crabfisher actor 2204511 = PiranhaSandyStandard/display 3204512;
  Ironshell actor 2207612 = CrabStandard/display 3207612 (actor-class
  rows inspected). NO public mob profile or spawn row for either ->
  private rows 32763 (lv33, list 5044) / 32764 (lv35, list 5038),
  explicitly labeled adapter policy (Drg0j5 mob-32729 precedent).
  Retail kits remain a live-capture follow-up.

## Instance / triggers / cutscenes / rewards

- Instance: private quest-battle content
  (`quest_sqb_drg0j1_<ownerId>`), maxPartySize 4 (journal: 3
  companions), minimumLevel 30, timeout 900s, requireAllTargets, single
  simultaneous wave (walkthrough does not expose simultaneous-vs-phased;
  adapter tuning). No level sync (no retail sync evidence; 4-job
  consensus). Mounted entry blocked ("Dismount your chocobo...");
  in-area mounting refused engine-side (private areas are
  mount-restricted: `IsMountRestrictedArea` true for `IsPrivate()`).
- Trigger: entry exclamation at the creek (walkthrough); adapter
  launches from the route talk (Blm0j3 precedent). Marker kept for
  journal fidelity.
- Cutscene `drg0j110` (client `cut/drg0j110/drg0j110`, sha256
  aa840c999b9e06bef6d6ba1ad993c4c9b1e75b35b7b4c522d0632895c614cd51):
  PC + Estinien 1060040 + anonymous 1000935 (display ???). Plays
  automatically on victory (`successEvent = "processEventNQ"`); NQ
  default skip path; completion independent of playback
  (sequence guarded by exact quest/sequence/area/name).
- Rewards: EXP 2661; key item 2000204 Soul of the Dragoon; item
  3020410; action 27266 Jump. Item 3020410 is The Keeper's Hymn,
  NOT a soul crystal.

## Mechanics / phases / adds / positioning (external)

- GamerEscape Eye of the Dragon (1.0): Lancer's Guild -> Haurtefert
  (PGL 15 required) -> Gates of Judgement (35,18) -> Alberic -> Camp
  Nine Ivies (45,29) exclamation by the stream -> instance: one
  Ironshell + three Crabfishers -> return to Alberic. No phases, no
  adds, no positioning mechanic documented. No quest-specific YouTube
  footage with inspectable mechanics was found (ARR-era quests of the
  same name dominate results); the j2 archive video confirms the era's
  talk -> kill -> auto-complete shape.
- Skill analogues: list 5044 (Piranha/Orobon family) / 5038 (Crab
  family) are adapter policy; retail Crabfisher/Ironshell kits
  unrecovered — no retail AOEs/phases can be claimed.

## Edge cases -> guards

- Wipe/timeout/disconnect/death/area-exit/quest-changed ->
  gc_sqb_runtime finish() -> retrySequence 0 at Alberic route step
  (native lease guards orphan shells); abandon/reaccept ->
  bound-quest check fails -> no credit; party/solo -> leader-only
  start, cap 4, entrant validation
  (online/same-area/combat-class/alive/minimumLevel) + post-movie
  revalidation; chocobo -> mounted entry refused (leader + every
  member), in-area mount refused by engine; cutscene skip -> NQ
  default path; OOB -> boundary + re-entry disabled; retrigger ->
  exact uniqueId kill credits, requireAllTargets; Estinien ->
  never a target or ally (cutscene-only); ambient kills ->
  reconciled against exact spawned uniqueIds, foreign same-class
  kills ignored; offers -> globally held with all job quests in
  quest_availability.lua (product decision, not per-quest state).

## Sources

- Decompiled client scenario `quest/scenario/drg/drg0j1.luac`
  (sha256 9f8a2b6085d55c1b2e54e3093beed4be1719d7a78e560cd4d87980c58ccdb891)
  + `quests/drg0j1.json` method inventory + `bytecode/drg0j1.txt`;
  empty `questdirectordrg0j101.txt` shell.
- `docs/Dat Mining/drg0j1.csv` rows 2-51 (dialogue inspected);
  `quest_marker.csv` rows 11226001/2/3; `xtx_displayName.csv`
  3204512/3207612; `gamedata_actor_class.sql` PiranhaSandyStandard /
  CrabStandard rows; `server_eventnpc_spawn_locations.sql` rows 711/2360.
- `tools/mobspawns/map_coordinates.py` guide sections: All-zone
  interface (maps/locate), Agent workflow (world-X/Z lookup +
  recorded-height selection), Calibration (Black Shroud row 2100,
  base 3104/3808; Y from recorded nodes only, never extrapolated).
- GamerEscape Eye of the Dragon (1.0) journal + walkthrough (inspected
  bodies); Fandom Dragoon Quests 1.0 (Estinien/Camp Nine Ivies).
