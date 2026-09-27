# Lnc200 A Wailing Welcome — implementation notes

Implemented: 2026-09-26. Lancer 20 class quest.

## Retail route (evidenced)

- Offer: Willelda (actor 1000242) in the Wailing Barracks. Public
  spawn row exists (zone 206, 179.15 / 27.5 / -1580.59), matching DAT
  marker 11018004.
- Briefing: J'moldva (actor 1000599), `processEvent010`, DAT marker
  11018001. Public spawn row exists (zone 206, 195.04 / 27.9 /
  -1591.1), matching markers 11018001/03. No new spawns needed.
- Duty: Central Shroud chigoe-culling fight (DAT marker 11018002).
  The 1.0 walkthrough requires 4 Orchard Chigoe kills. Actor class
  2205605 is name-verified as "orchard chigoe" in DAT display text.
- Aftermath: J'moldva (DAT marker 11018003), `processEvent020`.
- Payment/reward: Willelda (DAT marker 11018004). DAT lines 32-34
  prove `processEvent040` is her payment speech; the final reward
  hook stays the recovered `processEvent030`, giving the hook order
  020 -> 040 -> 030. Central rows grant 20,000 gil + 2,000 Lancer
  marks; the script grants 1,760 EXP (post-1.20 level-20 maximum,
  Gla200 precedent) + Iron Guisarme (4080406, from the source-backed
  quest pass).

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Lnc200` row with
  `offer = true`, route [1] (J'moldva briefing), battle (4 targets),
  postBattleRoute [20] (J'moldva aftermath) and [21] (Willelda
  payment speech).
- `Data/scripts/directors/Quest/QuestDirectorClassLnc200.lua`: single
  wave of 4 Orchard Chigoes (2205605/3125), `requireAllTargets`,
  party cap 3, 600s timeout.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcId 3125. The actor
  class is DAT-backed; stat shape cloned from the generic chigoe
  (bnpcId 1005) with the curated Chigoe skill list 5013. All tuning
  beyond the DAT identity is reconstruction policy. Private
  encounter summons only.
- `tools/validate_lnc200_route.py`: static route/fight contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110180 added to `IMPLEMENTED_CLASS_IDS`.

## Documented defaults (not retail claims)

- Level 15 follows the rank-20 duty default (no retail level found);
  single wave; party cap 3 follows the PGL/GLA class-quest
  precedent (retail documents no limit).
- Spawn offsets are adapter formation offsets, not the duty layout.
- `processEvent020` owns the after-warp duty exit and plays as a
  normal talk callback here pending live verification.
- The Wailing Barracks Linkpearl grant stays unbound (no matching
  item found in the item tables).

## Verification

- `python -B tools/validate_lnc200_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
