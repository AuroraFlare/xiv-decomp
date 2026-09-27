# Drg0j1 — Eye of the Dragon (111321, Lv30) — HOLD

- Quest ID 111321 (VERIFIED). Base 8 (LNC), job 19 (DRG), secondary 2/15,
  level 30. Offer actor 1000569 (Haurtefert); route/reward actor 1002001
  (Alberic). Hidden (no `offer`).
- Decomp: `job-gc-decomp-20260907/quests/drg0j1.json` (luac sha pinned).
  Decomp events (VERIFIED line 1553-1559): accept `processEventStart`,
  complete `processEventClear` + `processEventKokuti(3020410)`.

## Sequence flow

- Offer 1000569 with follow-up `processEventStartAfter` (documented).
- 0: route step — actor 1002001, event `processEventAlberic`, marker
  11226001, follow-up `processEventAlbericAfter` (VERIFIED).
- 5: battle boundary, marker 11226002, 4-party cap. Documented targets
  only → hard stop.
- Documented aftermath: `processEventNQ` / scene `drg0j110`, then
  Alberic `processEventClear` + `processEventKokuti(3020410)`
  (cutscene-only Estinien must not be materialized — VERIFIED).

## ENPC/BNPC IDs

- 1000569 Haurtefert, 1002001 Alberic (VERIFIED).
- Documented enemies: 3x actor 2204511 / display 3204512 "Crabfisher"
  (Lv33) + 1x actor 2207612 / display 3207612 "Ironshell" (Lv35).
  Neither has an exact mob profile/skills; family analogues
  Piranha/Orobon list 5044 and Crab/Megalocrab list 5038 are evidence
  only (VERIFIED gap).

## Markers

11226001 (Alberic), 11226002 (battle, x 1483.930054 / z -895.229980,
mapRegion 103 / mapArea 302, "near Camp Nine Ivies in the East Shroud" —
VERIFIED template values; zone = East Shroud 151). Navmesh 2026-09-27:
35 recorded points within 30 yalms, nearest node 4916 at 2.47 yalms
(`Data/quicknavmesh/zone_151.tsv:4921`); center height unresolved. Ground
support exists but NO spawn is placed and wave/entry owner unknown.
11226003 (reward). Journal: `{[0]=0,[5]=1,[10]=2}` (Fst 456-458).

## Rewards (design, inert)

- EXP 2661, action 27266, key item 2000204, item 3020410. No central rows
  (VERIFIED).

## Prereq chain

Root of the Dragoon chain. Gates Drg0j2 (111322).

## Instance surface

- Needed: 4-actor objective + NQ/drg0j110 aftermath + empty
  `QuestDirectorDrg0j101` lifecycle (waves, entry actor, retry owner all
  unknown).
- Existing: none. Do NOT invent the fight or substitute family profiles.
