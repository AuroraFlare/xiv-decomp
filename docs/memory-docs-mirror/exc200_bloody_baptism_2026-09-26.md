# Exc200 Bloody Baptism — implementation notes

Implemented: 2026-09-26. Marauder 20 class quest.

## Retail route (evidenced)

- Offer: Waekbyrt (actor 1000003) in Limsa Lominsa, Marauder 20+.
  Public spawn row exists in `server_eventnpc_spawn_locations.sql`
  (zone 230, -752.53 / 7.35 / 382.14).
- Briefing: Nunuba (actor 1000004) gives the Trident Map briefing
  (`processEvent015`, DAT marker 11010001 at Nunuba's position).
  Public spawn row exists (zone 230, -753.44 / 8.19 / 398.01).
- Duty: Swiftperch Tower private fight (DAT marker 11010002, Western La
  Noscea region 101 area 102). The 1.0 walkthrough confirms Tower
  Lemmings at level 15 and the Lord of Swiftperch at level 20; the
  journal counts 8/8 kills.
- Report/reward: Nunuba (DAT marker 11010003), final hook
  `processEvent050`. Central rows grant 20,000 gil + 2,000 Marauder
  marks; the script grants 1,760 EXP (post-1.20 level-20 maximum, Gla200
  precedent) + Iron Bill (4040405, from the source-backed quest pass).

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Exc200` row with
  `offer = true`, route [1] (Nunuba briefing, requiredResult 1), battle
  (8 targets, `preEvent = "processEvent020"` for the duty-entry scene
  per the Gla306 precedent), postBattleRoute [20] (Nunuba report, 030
  then 040).
- `Data/scripts/directors/Quest/QuestDirectorClassExc200.lua`: single
  wave of 7x Tower Lemming (2204003/3129) + Lord of Swiftperch
  (2204004/3130), `requireAllTargets`, party cap 3, 600s timeout.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcIds 3129/3130. Actor
  classes are DAT-backed; levels are walkthrough-sourced; all other
  tuning is reconstruction policy cloned from the level-15 rodent
  `moiling_mole` with the curated Mole skill list 5039. Private
  encounter summons only (no public spawns, no drop pools).
- `tools/validate_exc200_route.py`: static route/fight contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110100 added to `IMPLEMENTED_CLASS_IDS`.

## Documented defaults (not retail claims)

- The Lord counts as one of the eight journal kills (7+1=8).
- Single wave; retail wave order is unrecovered.
- Party cap 3 follows the PGL/GLA class-quest precedent.
- Spawn offsets are adapter formation offsets, not the tower layout.
- `processEvent030`/`040` play in numeric order at Nunuba; Waekbyrt's
  post-fight lines (`processEvent040_2`) stay unbound for lack of
  marker/owner evidence, as does the Trident Map item handoff
  (flavor only; duty entry needs no key item server-side).

## Verification

- `python -B tools/validate_exc200_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
