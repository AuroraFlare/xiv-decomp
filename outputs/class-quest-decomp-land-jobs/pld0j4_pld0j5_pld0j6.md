# Pld0j4 - Poisoned Hearts (111284) - HOLD - VERIFIED

- SQL (VERIFIED): `(111284, 'Poisoned Hearts', 'Pld0j4', 0, 45)`.
- Availability (VERIFIED): disabled ("dialogue/delivery/interaction").
- Template row (VERIFIED): Paladin 45, prereq 111283, EXP 5340. Four AF
  markers 11224301-04 (Aurum Vale, Natalan, north of Camp Brittlebark,
  northeast of Camp Crimson Bark; every objective displays "???"), event
  `processEvent_getAF_info`, documented Gallant
  Cuisses/Gauntlets/Sollerets/Coronet (8051401/8071401/8081801/8013501).
- Needed-vs-existing: coffer actors, transforms, marker-to-item bindings,
  fourth-coffer completion owner missing. Hard stop at sequence 6. HOLD.

# Pld0j5 - Parley on High Ground (111285) - live slice, MOB ROW ADDED - VERIFIED

- SQL (VERIFIED): `(111285, 'Parley on High Ground', 'Pld0j5', 0, 45)`.
- Availability (VERIFIED): disabled ("Implemented - instance"). Template
  `offer = true`, prereq 111284, `completionOwner = "content"`.
- Template row (VERIFIED): Paladin 45. Jenlyns start (public). Pre-scene
  `processEvent_005NQ_1` (normal-area fade-in branch, args {true}), private
  fight director `Quest/QuestDirectorJobPld0j5`, maxParty 8 (maximum
  evidence), single target Jenlyns Straightblade actor 2289035 / mob 3064,
  then content-owned pld0j520 aftermath + automatic reward. Rewards: EXP
  5340, action 27159 (Cover line).
- Mob profile FIX (this phase, VERIFIED): mobTypeId 3064 had NO row.
  Added main-SQL row 3064 (quest Hyur swordsman actor; job 3, 52/52 staged;
  skill 15 staged; HP/MP engine-derived 0 per block convention; all-ones
  resists; provenance comment) + mirror (`brd_pld_job_quest_profiles.sql`).
  Journal-named soldiers stay unresolved (marked in row todo).
- Public high-ground marker retained for journal fidelity; the shell uses the
  caller's safe content boundary (marked). No central rows. OPEN: soldier
  roster; HP/MP exact values; scene transition ownership.

# Pld0j6 - Keeping the Oath (111286) - HOLD - VERIFIED

- SQL (VERIFIED): `(111286, 'Keeping the Oath', 'Pld0j6', 0, 50)`.
- Availability (VERIFIED): disabled ("Partially implemented - instance").
- Template row (VERIFIED): Paladin 50, prereq 111285, action 27148 (Hallowed
  Ground), item 8032701 (Gallant Surcoat), reward marker 11224502. Battle
  @11224501 (Camp Bluefog), maxParty 8, documented: Manipulated Eye
  2201706/3069/list 2 + Manipulated Ogre 2202503/3070/list 34 (BOTH mob IDs
  VERIFIED absent - no rows), scenes pld0j610/pld0j620.
- Needed-vs-existing: no combat rows, no copies/waves, allied
  Jenlyns/Solkzagyl behavior unknown, after-warp owner unknown. HOLD correct.
  Do NOT invent the fight.
