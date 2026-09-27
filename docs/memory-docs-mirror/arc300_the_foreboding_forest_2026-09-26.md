# Arc300 The Foreboding Forest — implemented

Implemented: 2026-09-26. Archer 30.

## Retail route

Nonolato (offer, Quiver's Hold) -> Keelty briefing 010 -> Owl's Nest
gate cutscene 015 -> Vairemont delivery 020 -> Keelty at Owl's Nest
027, then again 030 -> North Shroud road ambush 040 -> private duty
against one Bandit Pathfinder and one Bandit Scout (30-minute cap) ->
post-fight Keelty report with a Yes gate 050 -> Nonolato reward.
Chain: follows Arc200; Arc306 follows this quest.

## Decomp evidence

- DAT markers 11016101-08 (Hold Keelty, Owl gate, Vairemont, Owl
  Keelty x2, road ambush, post-fight Keelty, Nonolato). Markers
  11016109-20 are rejected filler.
- Decompiled scenario `arc300.lua`: NonolatoStart, 010, 015, 020, 025,
  025_2, 027, 030, 040, 050. The 025/025_2 Pascaleret interlude talks
  have no recovered owner and stay unbound; their story content rides
  inside the 027/030 cutscenes. 040's client-internal ask is not
  result-gated: the scene always advances and the native duty prompt
  carries any decline. The final Nonolato turn-in has no recovered
  completion event, so the reward runs on the standard path.
- The 1.0 walkthrough fixes the ambush contract: Bandit Pathfinder +
  Bandit Scout, 30 minutes, "easy for Archer Rank 30", buff-up beat
  before the fight, "say Yes" to Keelty after. The post-fight Echo
  vision of Keelty and Siward is a cutscene, not a past-area entry,
  so no Echo subsystem is needed.
- DAT display names: 1000463/1400007 Nonolato (exact public spawn),
  1000587/1100199 Keelty (exact public spawn; field phases reuse the
  class), 1000586/1200019 Vairemont (PopulaceStandard, quest
  talkable), 2280165/3280164 Bandit Pathfinder, 2280164/3280163
  Bandit Scout (distinct graphic rows).

## Implementation

- Custom script `Data/scripts/quests/arc/arc300.lua` (outside the
  generic driver; the template keeps metadata only). Keelty shares
  one actor class across three phases, so every Keelty talk is
  disambiguated by 60-yalm proximity to the expected DAT marker; a
  same-class talk at the wrong phase plays nothing.
- Director `QuestDirectorClassArc300` (gc_sqb): sequences 21 -> 25 /
  20, party cap 3, 1800s timeout (the recovered 30-minute cap), both
  kills required. Spawn offsets follow the documented rank-30
  defaults.
- Mob profiles: new 32747 (scout, level 30) and 32748 (pathfinder,
  level 30), cloned from the Kraken Deckhand humanoid with skill
  list 15. Exact jobs/skills are unrecovered.
- Rewards: 3,420 EXP in script (post-1.20 level-30 maximum); 30,000
  gil + 3,000 Archer marks in the central rows. No item reward.
- Spawn scaffolds: 3319 (`arc300_owl_gate`, zone 145, DAT X/Z,
  gatehouse floor Y 182.3 between odeve/emerissel; nearest navmesh
  73 yalms out), 3320 (`arc300_vairemont`, zone 145, navmesh-exact
  Y 175.5), 3321 (`arc300_keelty_owl`, zone 145, navmesh-exact
  Y 175.7), 3322 (`arc300_ambush_trigger`, zone 152, DAT X/Z,
  forest-border floor Y 32.6), 3323 (`arc300_keelty_post`, zone 152,
  DAT X/Z, navmesh floor Y 31.3, 58 yalms out, flagged).

## Verification

`tools/validate_arc300_route.py` PASS (route, proximity phases, Yes
gate, ambush roster/cap, profiles, spawns, markers, rewards,
availability). `tools/validate_quest_availability.py` PASS.
`tools/validate_class_quest_mob_types.py` PASS.

## Live offers

110161 is uncommented (enabled) in `quest_availability.lua`. Its SQL
prerequisite is 110160, so Arc200 (implemented, validator-passing) is
enabled alongside it; without that a fresh server could never reach
this quest. Failed duty starts that already own event cleanup are
never ended twice, and the 050 Yes gate advances on a nil result
rather than softlocking.
