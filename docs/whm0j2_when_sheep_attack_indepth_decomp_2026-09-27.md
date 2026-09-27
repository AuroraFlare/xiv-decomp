# Whm0j2 When Sheep Attack (111242) indepth decomp - 2026-09-27 (JOB WHM-A)

Lv35 WHM. Raya-O-Senna cave -> Downy Dunstan SW of Camp Glory (single-NM
open-world private adapter) -> linkpearl return -> Raya report -> Regen.
Prereq 111241. Status: Implemented, verified unchanged (template-driven
whm0j2.lua + QuestDirectorJobWhm0j2).

## Client scenario (job_war_mnk_whm decomp Whm0j2 + calls/bytecode/scene)

- `processEventRAYAOSENNAStart`: opens talk, plays `whm0j210` with Default
  fades (verified in whm0j2.calls.md: NQ call at 0x392, offer result at
  0x49E), continues offer speech, THEN quest choice (accept 14 / decline
  13). Scene plays on BOTH branches.
- `processEvent005`: full post-kill report: Raya scheduler wait, 39..41,
  player scheduler 67108919, `sayFreeDisplayName(2600009,quest,42)` + text
  43 for Oha-Sok (free-speaker path, NOT a spawned ally), long 52,
  (27358,2), 46, world 47, close. Do NOT append onJobQuestComplete
  variants (duplicates the ability widget).
- Journal Fst 418 (sheep objective), 465 (return), selector 11/Fst 463
  (linkpearl return; not a second chat). whm0j210: 11 slots, zero initial
  placements; cave staging in later blocks only.

## Stages / markers / positions

- Template SEQ: offer at Raya -> battle -> reward at Raya.
- Markers: 11222101 battle (1201.08,1124.74) m00029 102/203
  MapMarkerQuestArea; 11222102 reward cave (-1540.98,-1588.34).
- Coord guide "All-zone interface" + "Agent workflow": zone 145 page 3200
  locate (1201.08,1124.74) = map (49.13,32.69) cell (49,32), matching
  walkthrough 48-32 and Kai (49,32); 0 recorded points within 30y,
  nearest node 1786 at 33.6y, height UNRESOLVED. Private adapter only.
- Web (bodies inspected): "subdue Downy Dunstan using white magic" (class
  gate enforces WHM; no per-spell retail predicate recovered); "Your job
  must be White Mage when slaying"; up to three companions; linkpearl
  return on success. Single-phase solo-NM fight: no adds/phases/
  positioning beyond the marker area. No 1.x footage URL found.

## NPCs / mobs

- Raya-O-Senna 1001570: offer + reward; placement UNREVIEWED (no spawn
  row), no SQL emitted. Oha-Sok: free-speaker text only.
- Coord guide "Generate placements" mobs lookup: downy_dunstan bnpcId
  3019 lv42. Exact contract: actor 2106017 / display 3106019 / mob 3019;
  Kai NM stats lv42 HP17493 MP773 (loot SQL corroborates); NM skill list
  6010 = Lullaby 23239. Private uniqueId `whm0j2_downy_dunstan`: ambient
  kills can never credit.

## Instance / fail / sync

- maxPartySize 4, minimumLevel 35 (owner + entrants, launch + post-movie
  recheck), requireAllTargets, timeout 900, boundary circle. No sync-down.
- Wipe/timeout/disconnect/abandon/re-enter/duplicate-kill: gc_sqb_runtime
  owner binding + relog rebind + boundQuestIsCurrent abandon guard +
  uniqueId wave reconciliation + live-shell anti-dup; fail lands on
  public retry (director retrySequence 0 = Raya offer point).
- NO chocobos: launcher isMounted gates (leader + every member) +
  private-area engine ban; 0 mount APIs in whm scripts/directors.

## Rewards

- EXP 3360; action Regen 27358 (widget mode 2). Unlocks 111243.

## Sources

- job_war_mnk_whm_decomp_2026-09-07.md Whm0j2 + whm0j2.calls.md (read)
- quest_marker.csv 11222101/2; mob_types 3019; skill_list 6010; Kai 3019
- fandom White Mage Quests (1.0); GamerEscape When_Sheep_Attack; SE
  forum WHM guide; patch 1.21 notes (Raya 15,22)
- map_coordinates.py locate zone 145 (this pass)
