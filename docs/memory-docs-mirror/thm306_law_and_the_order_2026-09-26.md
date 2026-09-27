# Thm306 Law and the Order — implemented

Implemented: 2026-09-26. Thaumaturge 36.

## Retail route

Yayake (offer, Ossuary) -> I'loofii briefing 020 -> wreck-site rival talk
030 (Horizon's Edge Footfalls, under the bridge in the canyon) -> Echo 035
-> private duel (battle handoff 040) -> aftermath 050 -> I'loofii
report/reward 060. Chain: follows Thm300.

## Decomp evidence

- DAT markers 11024201/02/03/05 (Ossuary briefing, wreck talk, wreck
  Echo, Ossuary report). Markers 11024202/03 share the wreck X/Z
  (-1849.86/-281.51), resolving to map square 8/27 under the calibrated
  Western Thanalan transform; the Gamerescape "(8,2)" square disagrees
  in Y (X matches) and is recorded as an unresolved wiki typo — DAT X/Z
  plus recorded ground rule the placement. Markers 11024204/06-20 are
  rejected filler.
- Decompiled scenario `thm306.lua`: YayakeStart (thm30610), 020
  (thm30620), 030 (thm30630), 035 (pure `ask(51030,2)` Echo gate, result
  1 continues), 040 (thm30640 battle handoff, after-warp), 050
  (thm30650 aftermath, after-warp), 060 (thm30660 report). The 010_2-7
  talks are unowned Ossuary chatter and the _2+ variants are post-quest
  chatter; both stay unbound.
- The duel is nonlethal by story: I'loofii intervenes ("That is enough!")
  and the beaten rival stands judgment. No retail source spawns live
  chocobos at the wreck; the coach accident is backdrop, so no chocobo
  actor is spawned anywhere in this implementation.
- DAT display names: 1000607/4000189 route rival, 2289015/4000189 battle
  rival, 1000846 Yayake, 1000847 I'loofii.

## Implementation

- Template `Thm306`: route [1] I'loofii, [2] rival talk, [3] Echo gate
  (`requiredResult = 1`, PGL306 precedent), battle with 040 as the
  preEvent (ARC200 precedent), direct payout to I'loofii (no
  post-battle route; the 050 aftermath plays in the instance).
- Director `QuestDirectorClassThm306`: sequences 10 -> 20 / 0, party cap
  3, 600s timeout. The rival yields at 25% HP on the completion poll
  (kill path kept as a safe fallback); either way she is despawned alive
  and `processEvent050` plays as the battle success event before the
  return. A missing HP surface degrades to kill-to-win without error.
- Mob profile: new 32742 (level 36, THM job 22, skill list 14, mirroring
  the rank-36 Ossuary Almstaker precedent; private summon only).
- Rewards: 4,720 EXP in script (post-1.20 level-36 maximum); 36,000 gil
  + 3,600 marks in the central rows. No item reward in DAT.
- Spawn scaffold 3309 (`thm306_wreck_rival`, zone 172, exact recorded
  ground node 8267, 2.7 yalms from the DAT pin on a connected path in
  the canyon floor below the bridge).

## Verification

`tools/validate_thm306_route.py` PASS (route, Echo gate, duel mechanics,
aftermath, profiles, spawns, markers, rewards, availability).
`tools/validate_quest_availability.py` PASS.
