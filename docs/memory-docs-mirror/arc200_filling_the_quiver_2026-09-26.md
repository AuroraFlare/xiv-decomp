# Arc200 Filling the Quiver — implementation notes

Implemented: 2026-09-26. Archer 20 class quest.

## Retail route (evidenced)

- Offer: Nonolato (actor 1000463) in Quiver's Hold. Public spawn row
  exists (zone 206, 232.88 / 12.46 / -1268.94).
- Briefing: Keelty (actor 1000587) at the back of the guild hall
  (`processEvent010`, DAT marker 11016001 at 261.38 / -1264.70).
  Keelty had no spawn row; added as id 3291.
- Rendezvous: Camp Emerald Moss fence opening (DAT marker 11016002,
  zone 152). Added talk trigger id 3292 reusing the generic
  destination actor class 1000174 (display 4000257), following the
  PGL306 bazaar-trigger precedent. Retail fires this on walking
  through; the server approximates it as talking to the trigger.
- Duty: Fallgourd private fight (DAT marker 11016003). The 1.0
  walkthrough requires 5 Yarzon Invader kills; the Insatiable Ixal
  flees and is never an objective. All three candidate actor classes
  (2205503/04/05) are name-verified as "yarzon invader" in DAT
  display text; all run at level 15.
- Report/reward: Nonolato (DAT marker 11016004), final hook
  `processEvent050`. Central rows grant 20,000 gil + 2,000 Archer
  marks; the script grants 1,760 EXP (post-1.20 level-20 maximum,
  Gla200 precedent) + Elm Velocity Bow (4070011, from the
  source-backed quest pass).

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Arc200` row with
  `offer = true`, route [1] (Keelty briefing) and [2] (fence
  trigger), battle (5 targets, `preEvent = "processEvent030"` per the
  Gla306 lead-in precedent), postBattleRoute [20] (Nonolato report).
- `Data/scripts/directors/Quest/QuestDirectorClassArc200.lua`: single
  wave of 5 Yarzon Invaders (2x 2205503/3122, 2x 2205504/3123, 1x
  2205505/3124), `requireAllTargets`, party cap 3, 600s timeout.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcIds 3122/3123/3124.
  Actor classes are DAT-backed; level 15 follows the walkthrough;
  stat shape cloned from `yarzon_bleeder` with the curated Yarzon
  skill list 5063. All other tuning is reconstruction policy.
  Private encounter summons only.
- `Data/sql/server_eventnpc_spawn_locations.sql` + migration
  `Data/sql/live migrations/arc200_route.sql`: Keelty (3291) and the
  fence trigger (3292).
- `tools/validate_arc200_route.py`: static route/fight contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110160 added to `IMPLEMENTED_CLASS_IDS`.

## Documented defaults (not retail claims)

- 2/2/1 variant mix across the three Invader actor classes; single
  wave; party cap 3 follows the PGL/GLA class-quest precedent.
- Spawn offsets are adapter formation offsets, not the duty layout.
- Keelty Y=14.0 follows the adjacent catalog floor (Piers 14.0 four
  yalms away; nearest recorded node is 32 yalms out at y=12) and her
  rotation is a scaffold: correct both after a live map capture.
- Fence trigger Y=20.293 is the nearest recorded navmesh node
  (zone_152, 1.09 yalms from the marker).
- `processEvent010`/`040` own after-warp fades and play as normal
  talk callbacks here; the event lifetime across the warp still
  needs live verification.

## Verification

- `python -B tools/validate_arc200_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
