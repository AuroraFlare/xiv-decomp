# Pld0j1 - Paladin's Pledge (111281) - live adapter, MOB ROWS ADDED - VERIFIED

- SQL (VERIFIED): `(111281, 'Paladin''s Pledge', 'Pld0j1', 0, 30)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter for quest
  battle"). Template `offer = true`.
- Template row (VERIFIED): Paladin 30 (base GLA 3, job 16, sub CNJ 23/15).
  Route: Lulutsu 1000863 -> Jenlyns 1060042 `processEvent082` @11224001
  (Jenlyns public row 244, zone 209, VERIFIED) -> battle @11224002 (south of
  Coffer & Coffin, journal) -> Jenlyns reward @11224003. Rewards: EXP 2661,
  action 27146 (Shield Bash line), key item 2000201, item 3020410.
- Battle (VERIFIED): private, director `Quest/QuestDirectorJobPld0j1`,
  maxParty 4, requireAllTargets, four DAT-backed undead resources, one copy
  each (adapter policy, marked): Wandering Soldier 2201807, Wandering Mage
  2201808, Wandering Bogy 2204318, Specter 2206901 (generic SpecterStandard
  fallback for the empty SpecterNormalPld0j1 shell - marked). Success owns
  the pld0j110 crystal aftermath.
- Mob profiles FIX (this phase, VERIFIED): mobTypeIds 32731/32732/32733/32734
  had NO rows (the 327xx block jumps 32728 -> 32737), so all four spawns
  returned null. Promoted the existing `pld0j1_undead.sql` migration values
  into main-SQL full rows (jobs 8/22/22/22, level 30, skills 88/5061/32/32;
  speeds/floats/resists from public family analogues 1310/1179/39411/1752;
  HP/MP engine-derived 0; drops 0; provenance comments) + parity note in the
  migration header. Counts/formation stay adapter policy.
- No central reward rows (VERIFIED zero). OPEN: retail count/formation;
  exact levels/skills; content owner.

# Pld0j2 - Honor Lost (111282) - live adapter, MOB ROW ADDED - VERIFIED

- SQL (VERIFIED): `(111282, 'Honor Lost', 'Pld0j2', 0, 35)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter for
  open-world fight"). Template `offer = true`, prereq 111281.
- Template row (VERIFIED): Paladin 35. Jenlyns `processEventJENLYNSStart`
  (public spawn VERIFIED). Battle @11224101 (Mun-Tuy Cellars marker,
  source-backed), director `Quest/QuestDirectorJobPld0j2`, maxParty 4
  (recommendation total), single target Alux actor 2102609 (ImpNormalNM,
  display 3102611) / mob 3000 / skill 42.
- Mob profile FIX (this phase, VERIFIED): mobTypeId 3000 had NO row.
  Added main-SQL row 3000 (job 23, 42/42 staged, family skill 42; HP/MP
  engine-derived 0 per block convention - staged 27489/23190 retained;
  speed/float/resists from public firestarter_imp 1298; provenance comment)
  + mirror (`brd_pld_job_quest_profiles.sql`). No eLeMeN NM-specific Alux
  skill list exists (checked), so family 42 is the documented binding.
- Navmesh (VERIFIED this phase): Alux marker 11224101 in DAT (Mun-Tuy 103/311,
  -927.95/-2128.4). `locate --zone 157 --map 5.44 5.60 --radius 60`: 86 nodes,
  nearest node 663 at 0.03 yalms (y≈-23.9). Private shell at caller Y; no
  invented heights.
- Rewards: EXP 3360, action 27147. No central rows. OPEN: public trigger
  owner; retail phase/balance.

# Pld0j3 - Power Struggles (111283) - live adapter - VERIFIED

- SQL (VERIFIED): `(111283, 'Power Struggles', 'Pld0j3', 0, 40)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter").
  Template `offer = true`, prereq 111282.
- Template row (VERIFIED): Paladin 40. Jenlyns start (public). Battle
  @11224201 (Lower La Noscea marker), director
  `Quest/QuestDirectorJobPld0j3`, maxParty 4, single target Old Six-arms
  actor 2107614 / mob 3078.
- Mob profile (VERIFIED, this phase): row
  `(3078, 2107614, 'old_six_arms', ..., 47, 47, 11020, 851, ..., 6024, 0,
  3078)` exists; skill 6024 = Old Six-arms NM moves (Claw Guard, Bubble
  Shower, Backclip, Sound of the Sea). Row todo's "skill list 21" was stale
  (21 is the family crab list); corrected to 6024. No new SQL needed.
- Rewards: EXP 4260, action 27149. No central rows. OPEN: public trigger
  owner; retail balance.
