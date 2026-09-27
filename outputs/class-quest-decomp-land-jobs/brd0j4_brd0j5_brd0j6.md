# Brd0j4 - Doing It the Bard Way (111304) - HOLD - VERIFIED

- SQL (VERIFIED): `(111304, 'Doing It the Bard Way', 'Brd0j4', 0, 45)`.
- Availability (VERIFIED): disabled ("Partially implemented - instance").
- Template row (VERIFIED): `completionOwner = "content"`. Bard 45, prereq
  111303, action 27232. Battle @11225301 (Ixali van north of Hyrstmill),
  maxParty 8, `documentedTargets`: Ixali Scout 2206412 (lvl 52, NO profile -
  VERIFIED) + Scout Wolf 2201428 (lvl 50, NO profile - VERIFIED). Scenes
  brd0j410/brd0j420 + reward variants recovered; Jehantel draws his bow but
  is not a battle ally (marked).
- Needed-vs-existing: no combat profiles, no copies/waves, no entry/after-warp
  owner, empty director. HOLD correct. Do NOT invent the fight.

# Brd0j5 - Pieces of the Past (111305) - HOLD - VERIFIED

- SQL (VERIFIED): `(111305, 'Pieces of the Past', 'Brd0j5', 0, 45)`.
- Availability (VERIFIED): disabled ("dialogue/delivery/interaction").
- Template row (VERIFIED): Bard 45, prereq 111304, EXP 5340. Four AF markers
  11225401-04 (Cutter's Cry, Zahar'ak, Turning Leaf, cave south of Camp Iron
  Lake), event `processEvent_getAF_info`, documented items Choral
  Tights/Ringbands/Sandals/Chapeau (8051405/8071405/8081805/8013505).
- Needed-vs-existing: coffer actor classes, full transforms, marker-to-item
  bindings, Jehantel spawn, fourth-coffer completion owner ALL missing.
  Marker-only row stays a hard stop (driver `startGameplayBoundary` never
  exposes sequence 6). HOLD correct.

# Brd0j6 - Requiem for the Fallen (111306) - HOLD - VERIFIED

- SQL (VERIFIED): `(111306, 'Requiem for the Fallen', 'Brd0j6', 0, 50)`.
- Availability (VERIFIED): disabled ("Partially implemented - instance").
- Template row (VERIFIED): Bard 50, prereq 111305, action 27227
  (Battle Voice), item 8032705 (Choral Robe). Battle @11225501 (beyond
  Griffin Crossing, Coerthas Central Highlands, zone 143), maxParty 8,
  five documented types: Yotoli Hueloc 2206413 (mob 3117, list 14, CNJ spells
  unassigned - VERIFIED no mob row) + sabreur/strongbeak/bravewing/fogcaller
  2206414-17 (NO profiles - VERIFIED). Scene `processEvent_010`/brd0j610 +
  `processEventClear` recovered.
- Needed-vs-existing: copies/waves/kill rule unknown; marker lacks
  actor/Y/rotation/content transform; Jehantel not a proven ally; director
  empty. HOLD correct. No authoritative EXP added (marked).
