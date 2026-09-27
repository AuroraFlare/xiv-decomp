# Thm300 Revelry in Rivalry — implemented

Implemented: 2026-09-26. Thaumaturge 30.

## Retail route

Yayake (offer, Ossuary) -> rival talk 020 (Ishgard send-off) -> Baderon
lead 025 (Limsa) -> rescue duty at Lower La Noscea (20,26) -> Bodenolf
report (027 when the smith falls, 028 when she survives) -> Bodenolf Echo
030 -> Yayake 035 -> rival 040 -> Yayake reward 050. Chain: follows Thm200;
Thm306 follows this quest.

## Decomp evidence

- DAT markers 11024101-09 (Ossuary rival, Baderon, rescue site display
  4000257, Bodenolf x3, Yayake, rival, Yayake). Marker 11024103 resolves
  to map square 20/26 under the calibrated Lower La Noscea transform,
  matching the Gamerescape walkthrough square. Markers 11024110-20 are
  rejected filler (unrelated rows).
- Decompiled scenario `thm300.lua`: YayakeStart (thm30010), 020
  (thm30020), 025 (Baderon lead), 027/028 (dead/survived reports), 030
  and 030_1 (same Echo outcome, different brush-off line: DAT rows
  67 vs 66), 035 (Yayake, after-warp, no direct scene), 040 (thm30040),
  050 (reward talk). The 010_2-7 talks are unowned Ossuary chatter and
  the _2+ variants are post-quest chatter; both stay unbound. The 030_1
  dead/survived pairing is unresolved, so the route plays 030.
- Journal and dialogue name one beast ("the beast which
  threatened/ravaged"), and the walkthrough names the bomb Ignis Fatuus
  attacking the bizarre blacksmith. The stale "8 Lemming" objective
  metadata is rejected (it repeats verbatim across unrelated quests and
  contradicts the journal, dialogue, and walkthrough).
- DAT display names: 1000607/4000189 route rival, 1000137 Baderon,
  1001008/4000348 field smith, 2290023/4000348 protected smith,
  2201603/3201603 ignis fatuus. The bomb model path
  `BombLesserScenarioThmLv30` names the Thm300 quest bomb at level 30.
  (The Garlemald-tracker spelling "Ignus" is wrong; DAT and Gamerescape
  agree on "Ignis".)

## Implementation

- Template `Thm300`: route [1] rival, [2] Baderon, [3] smith push trigger
  (no decomp talk event exists at the rescue site; the push is the
  retail Duty-Calls prompt), single-target battle plus the protected
  smith actor, post-battle route [20]-[23], payout to Yayake at 30.
- The smith outcome selects the report through a counter-conditional
  route event (new additive `counterEvent` step field): counter slot 2
  value 5 plays 028 (survived), anything else plays 027 (dead),
  mirroring the DAT journal branch. A failed counter read falls back to
  the plain step event so the route cannot softlock.
- Director `QuestDirectorClassThm300`: sequences 10 -> 20 / 0, party cap
  3, 600s timeout. The bomb kill wins either way. Engine mobs only
  target players, so the bomb's canonical attacks on the smith run as
  scripted attrition on the completion poll (about a 100-second rescue
  window); on KO the smith despawns. The bomb credit records the outcome
  counter and grants the Writ of Access proof (item 11000030)
  defensively. Granted proof items are not consumed at completion.
- Mob profile: new 32740 (level 30, bomb skill list 5010, hover height
  0.8, private summon only).
- Rewards: 3,420 EXP in script (post-1.20 level-30 maximum); 30,000 gil
  + 3,000 marks in the central rows. No item reward in DAT.
- Spawn scaffolds: 3307 (`thm300_ossuary_rival`, zone 209, DAT X/Z,
  same-hall floor Y 206.5, flagged — no interior navmesh within 127
  yalms) and 3308 (`thm300_smith_trigger`, zone 128, exact recorded
  ground node 821, 2.3 yalms from the DAT pin on a connected path).

## Verification

`tools/validate_thm300_route.py` PASS (route, branch, Echo gate, rescue
mechanics, profiles, spawns, markers, rewards, availability).
`tools/validate_quest_availability.py` PASS.
