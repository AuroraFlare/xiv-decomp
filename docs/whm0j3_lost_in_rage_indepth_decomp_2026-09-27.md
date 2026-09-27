# Whm0j3 Lost in Rage (111243) indepth decomp - 2026-09-27 (JOB WHM-A)

Lv40 WHM. Raya-O-Senna cave -> Cactuar Jack east of Camp Horizon
(single-NM open-world private adapter) -> return to cave -> Esuna.
Prereq 111242. Status: Implemented, verified unchanged (template-driven
whm0j3.lua + QuestDirectorJobWhm0j3).

## Client scenario (job_war_mnk_whm decomp Whm0j3 + calls/bytecode)

- `processEventRAYAOSENNAStart`: accept 16 / decline 15, single stored
  result. NO NQ scene or fade call anywhere in this quest.
- `processEvent005`: Raya report + reward: 24,25,26,27, long 31, ability
  (27357,2), 28,29, world 30, close. Text 24 makes the ABSENCE of an
  elemental manifestation explicit: never translate into an extra
  spawned elemental objective. No onJobQuestComplete variants exist.
- Journal Fst 421 (Cactuar Jack east of Camp Horizon), 464 (return to
  cave after subduing). Start_1/000_* are Raya/moogle variants, not
  extra objectives.

## Stages / markers / positions

- Template SEQ: offer at Raya -> battle -> reward at Raya.
- Markers: 11222201 battle (-881.29,2.4) m00029 104/403
  MapMarkerQuestArea; 11222202 reward cave (-1540.98,-1588.34).
- Coord guide "All-zone interface" + "Agent workflow": zone 172 page 1300
  locate (-881.29,2.4) = map (18.06,30.74), matching walkthrough 18-31
  and Kai (18,30); 0 recorded points within 30y, nearest node 5287 at
  43.5y, height UNRESOLVED. Private adapter only.
- Ambient NM spawn nm_cactuar_jack_172_1 (-835.122,120.116,-15.025) is
  evidence only; quest uses private uniqueId so ambient kills never
  credit.
- Web (bodies inspected): "Your job must be white mage when slaying";
  up to three companions; single-phase solo-NM fight, no adds/phases.
  No 1.x footage URL found.

## NPCs / mobs

- Raya-O-Senna 1001570: offer + reward; placement UNREVIEWED (no spawn
  row), no SQL emitted.
- Coord guide "Generate placements" mobs lookup: cactuar_jack bnpcId
  3009 lv47 NM. Exact row: actor 2100910, lv47, HP26449, MP851, skill
  list 6006 = 1000 Needles 23147, Tender Thrust 23148, Sun Spines
  23149, 100 Needles 23413. Private uniqueId `whm0j3_cactuar_jack`.

## Instance / fail / sync

- maxPartySize 4, minimumLevel 40 (owner + entrants, launch + post-movie
  recheck), requireAllTargets, timeout 900, boundary circle. No sync-down.
- Same gc_sqb guarantees as Whm0j2: owner binding, relog rebind,
  abandon guard, uniqueId reconciliation, duplicate/foreign-kill
  rejection, timeout/wipe fail to public retry (retrySequence 0 = Raya),
  live-shell anti-duplication. Quest onKillBNpc inert.
- NO chocobos: launcher isMounted gates (leader + every member) +
  private-area engine ban; 0 mount APIs in whm scripts/directors.

## Rewards

- EXP 4260; action Esuna 27357 (widget mode 2). Unlocks 111244.

## Sources

- job_war_mnk_whm_decomp_2026-09-07.md Whm0j3 + whm0j3.calls/bytecode
- quest_marker.csv 11222201/2; mob_types 3009; skill_list 6006; Kai 3009
- fandom White Mage Quests (1.0); GamerEscape Lost_in_Rage; SE forum
  WHM guide (Copperbell entrance via Camp Horizon)
- map_coordinates.py locate zone 172 (this pass)
