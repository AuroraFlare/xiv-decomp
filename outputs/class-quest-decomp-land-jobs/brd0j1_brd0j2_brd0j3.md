# Brd0j1 - A Song of Bards and Bowmen (111301) - HOLD - VERIFIED

- SQL (VERIFIED): `(111301, 'A Song of Bards and Bowmen', 'Brd0j1', 0, 30)`.
- Availability (VERIFIED): disabled ("Partially implemented - instance").
- Wrapper (VERIFIED): `brd/brd0j1.lua` = `InitJobQuest("Brd0j1")` only; all
  logic in `job_quest_template.lua` row.
- Template row (VERIFIED): Bard 30 (base ARC 7, job 18, sub CNJ 23/15).
  Offer actor 1000830 Georjeaux (public row 701, zone 206, VERIFIED).
  Route: Jehantel 1060039 `processEvent000` @11225001 -> Pukno Poki 1001936
  `processEvent005` @11225002 -> battle @11225003 -> Jehantel reward @11225004.
  Rewards: EXP 2661, action 27237, key item 2000203, item 3020410.
- Needed-vs-existing: battle needs four Qiqirn Shirrer actor 2206306; NO
  `mobTypeId`/profile exists (VERIFIED absent from mob_types), Jehantel has
  NO public spawn (VERIFIED zero rows), Pukno Poki 1001936 has NO spawn
  (VERIFIED zero rows), director empty. HOLD correct. Do NOT invent the
  fight (generic Qiqirn substitution explicitly rejected in row todo).
- Journal/markers: job marker family 112250xx (recovered; 111201xx-111303xx
  rows belong to unrelated wld scripts - marked in template).

# Brd0j2 - The Archer's Anthem (111302) - live adapter - VERIFIED

- SQL (VERIFIED): `(111302, 'The Archer''s Anthem', 'Brd0j2', 0, 35)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter for
  open-world fight"). Template `offer = true`, prerequisite 111301.
- Template row (VERIFIED): Bard 35. Offer/completion: Jehantel 1060039
  `processEventJEHANTELStart` (NO public spawn - VERIFIED zero rows; reachability
  unverified, flagged in decomp). Battle: private adapter, marker 11225101
  (Nanawa Mines, source-backed), director
  `Quest/QuestDirectorJobBrd0j2`, maxParty 4 (total), requireAllTargets,
  single target Bardi actor 2101413 / mob 3003 / skill 6002.
- Mob profile (VERIFIED, this phase): mob_types row
  `(3003, 2101413, 'bardi', ..., 42, 42, 19992, 773, ..., 6002, 0, 3003)`
  exists; skill list 6002 = Bardi NM moves (Midnight Howl, Threatening
  Growl). No new SQL needed.
- Needed-vs-existing: complete. Ambient-kill protection via private uniqueId
  `brd0j2_bardi`. Rewards: EXP 3360, action 27239. No central reward rows
  (VERIFIED zero) - no double-grant.
- Navmesh (VERIFIED this phase): Bardi marker 11225101 exists in DAT
  `quest_marker.csv` (Nanawa Mines 104/412, -160.92/-1315.21). `locate
  --zone 176 --map 3.83 5.73 --radius 60`: 44 recorded nodes, nearest node
  458 at 5.9 yalms (y≈167, walked ground). The fight itself runs in a
  private shell at caller Y; no static placement, no invented heights
  (template targets carry no Y - verified by grep).

# Brd0j3 - Bard's-Eye View (111303) - live adapter, MOB ROW ADDED - VERIFIED

- SQL (VERIFIED): `(111303, 'Bard''s-Eye View', 'Brd0j3', 0, 40)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter").
  Template `offer = true`, prerequisite 111302.
- Template row (VERIFIED): Bard 40. Jehantel offer/completion (same spawn gap
  as Brd0j2). Battle @11225201 (Central Shroud, source-backed), director
  `Quest/QuestDirectorJobBrd0j3`, maxParty 4, single target Phaia actor
  2101509 / mob 3080 / NM skill 6025 (Reckless Charge, Bristle, Bellowing
  Grunt - VERIFIED in skill list).
- Mob profile FIX (this phase, VERIFIED): mobTypeId 3080 had NO
  `server_battlenpc_mob_types` row, so `SpawnEnemyByMobTypeId` returned null
  and the "implemented" fight could never spawn. Added main-SQL row 3080
  (BoarNormalNM 2101509, job 4, 47/47 staged, NM skill 6025; HP/MP stay
  engine-derived 0 per the job-block convention - staged 28928/851 retained
  in the loot staging tables; speed/resists from public wild_hog 1190;
  provenance comment inline) + live-migration mirror
  (`brd_pld_job_quest_profiles.sql`).
- Rewards: EXP 4260, action 27238. No central rows. OPEN: Jehantel spawn;
  public trigger owner; retail balance.
