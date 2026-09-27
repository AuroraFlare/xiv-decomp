# Cnj200 Dendrological Duties — implementation notes

Implemented: 2026-09-26. Conjurer 20 class quest.

## Retail route (evidenced)

- Offer: Soileine (actor 1000234) in the Conjurers' Guild. Public
  spawn row exists (zone 206, -330.81 / 8 / -1682.83), matching DAT
  marker 11026004.
- Briefing: Brother Telent (actor 1000504), `processEvent015`, DAT
  marker 11026001. Public spawn row exists (zone 206, -354.23 /
  6.24 / -1697.72), matching markers 11026001/03. No new spawns
  needed.
- Duty: dead-tree-clearing fight (DAT marker 11026002). The 1.0
  walkthrough requires fighting one after another: 4 Rabid Coywolves
  then the stronger Alpha Coywolf. Actor classes 2201408/09 are
  name-verified as "rabid coywolf" / "alpha coywolf" in DAT display
  text. The entry scene runs as the battle preEvent (Gla306
  precedent).
- Report: Telent (DAT marker 11026003), `processEvent030`.
- Reward: Soileine (DAT marker 11026004), final hook
  `processEvent040`. Central rows grant 20,000 gil + 2,000 Conjurer
  marks; the script grants 1,760 EXP (post-1.20 level-20 maximum,
  Gla200 precedent) + Yew Radical (5030306, from the source-backed
  quest pass).

## Server mapping

- `Data/scripts/quests/class_quest_template.lua`: `Cnj200` row with
  `offer = true`, route [1] (Telent briefing), battle (5 sequential
  single-target waves, `preEvent = "processEvent020"`),
  postBattleRoute [20] (Telent report).
- `Data/scripts/directors/Quest/QuestDirectorClassCnj200.lua`: waves
  1-4 Rabid Coywolf (2201408/3127), wave 5 Alpha Coywolf
  (2201409/3128), `requireAllTargets`, party cap 3, 600s timeout.
  Later waves spawn through the verified `gc_sqb_runtime` wave
  support.
- `Data/sql/server_battlenpc_mob_types.sql`: bnpcIds 3127/3128. The
  actor classes are DAT-backed; stat shape cloned from
  `feral_watchdog` (bnpcId 1007) with the curated canine skill list
  5062. All tuning beyond the DAT identity is reconstruction
  policy. Private encounter summons only.
- `tools/validate_cnj200_route.py`: static route/fight contract check.
- Availability row annotated Implemented (stays commented per the
  class-quest convention); 110260 added to `IMPLEMENTED_CLASS_IDS`.

## Documented defaults (not retail claims)

- Levels 15/17 (rabids at the rank-20 duty standard, alpha "a little
  stronger" per the walkthrough); party cap 3 follows the PGL/GLA
  class-quest precedent.
- Spawn offsets are adapter formation offsets, not the duty layout.
- Morys's post-kill appearance stays unbound: no content-owner
  variant exists for him in this duty.

## Verification

- `python -B tools/validate_cnj200_route.py` → PASS
- `python -B tools/validate_quest_availability.py` → PASS
