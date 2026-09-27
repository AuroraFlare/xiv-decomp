# War0j3 - Curious Gorge Goes to the Bazaar (111203) - HOLD - VERIFIED

- SQL (VERIFIED): `(111203, 'Curious Gorge Goes to the Bazaar', 'War0j3', 0,
  40)`.
- Availability (VERIFIED): disabled ("Partially implemented - instance").
- Template row (VERIFIED): Warrior 40, prereq 111202, EXP 4260, action 27188.
  Battle @11220201 ONLY (northern Canyon Condor objective); 11220202 is the
  east-gate rendezvous aftermath (marked, must not be treated as a battle
  entry). Documented: Canyon Condor actor 2201208 (NO profile - VERIFIED),
  "flock" gives no count; aftermath `processEvent005`/war0j310, return
  `processEvent010`, reward `processEventKokuti`. MaxParty 4.
- Needed-vs-existing: no mob profile/skills, no count, empty director (no
  waves, entry owner, aftermath transition, retry lifecycle). HOLD correct.

# War0j4 - Looking the Part (111204) - HOLD - VERIFIED

- SQL (VERIFIED): `(111204, 'Looking the Part', 'War0j4', 0, 45)`.
- Availability (VERIFIED): disabled ("dialogue/delivery/interaction").
- Template row (VERIFIED): Warrior 45, prereq 111203, EXP 5340. Four AF
  markers 11220301-04 (Cutter's Cry, Natalan, Turning Leaf, Craneperch
  Tower; all display "???" 4000257, not actor classes - marked), event
  `processEvent_getAF_info`, documented Fighter's
  Breeches/Gauntlets/Jackboots/Burgeonet (8051403/8071403/8081803/8013503).
- Needed-vs-existing: coffer actors, Y/rotation, marker-to-item bindings
  missing; sequence 6 hard stop. HOLD.

# War0j5 - Proof is in the Pudding (111205) - HOLD - VERIFIED

- SQL (VERIFIED): `(111205, 'Proof is in the Pudding', 'War0j5', 0, 45)`.
- Availability (VERIFIED): disabled ("open-world fight + mob kill/drop").
- Template row (VERIFIED): Warrior 45, prereq 111204, EXP 5340, action 27192.
  Battle @11220401 (cave southeast of Camp Iron Lake), maxParty 8 (total
  recommendation), documented: Audhumbla actor 2100804 (NO profile -
  VERIFIED). Great Buffalo 2100801/mob 3045 is a DIFFERENT NM and must not
  be substituted (marked).
- Needed-vs-existing: no profile/skills/spawn owner. HOLD.

# War0j6 - How to Quit You (111206) - HOLD - VERIFIED

- SQL (VERIFIED): `(111206, 'How to Quit You', 'War0j6', 0, 50)`.
- Availability (VERIFIED): disabled ("Partially implemented - instance").
- Template row (VERIFIED): Warrior 50, prereq 111205, action 27189, item
  8032703 (Fighter's Cuirass). Battle @11220502 (Silver Bazaar), maxParty 8,
  documented: frenzied Curious Gorge 2289037/3012 (exact local profile -
  mob 3012 VERIFIED absent, no row) + quest Cliffdiver 2201209 (no profile).
  Scenes processEvent010/020/war0j620; reward destination binding unrecovered
  (marked); reminder marker 11220501 (Curious Gorge's cave).
- Needed-vs-existing: Cliffdiver profile/skills/copies/waves, scene
  transition, entry/after-warp ownership, director lifecycle unresolved.
  HOLD correct.
