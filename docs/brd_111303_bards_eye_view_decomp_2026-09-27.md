# Brd0j3 deep decomp: Bard's-Eye View (111303, Lv40)

JOB BRD, 2026-09-27. Open-world quest (exact private adapter). Status:
already Implemented; this pass verifies and documents (no code change:
`validate_job_brd_routes.py` pins the exact contracts).

## Sources

- `job_blm_pld_brd_drg_decomp_2026-09-07.md` (Bard/111303 section)
- `marker-evidence.json`: 11225201 (-186.18, -337.32, 103/301)
- `docs/Dat Mining/brd0j3.csv`
- `class_job_quest_implementation_2026-08-23.md` (Brd0j3 adapter section)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jehantel (`processEventJEHANTELStart`, EQ pc110/0x442) | NPC |
| 5 | Phaia in Central Shroud | Private SQB battle |
| 10 | Jehantel completion widgets | NPC |

No route steps, no NQ scene, no battle-start API in the scenario chunk.
Journal: Fst 442-444 (Fst 443 selector; 444 is a next-quest notice).

## NPCs and mobs

- Phaia: actor 2101509 / display 3101511, mob 3080, skill list 6025
  (Reckless Charge 23155, Bristle 23156, Bellowing Grunt 23157).
  Staged job 4, Lv47. Distinct NM profile, never a generic boar.
  Single target, single phase; no enrage in the recovered list.
- Marker 11225201 -> Central Shroud (zone 150); no public spawn row is
  materialized, so the private shell owns the whole boundary (private
  unique `brd0j3_phaia`).
- Party: 4 total, launcher-enforced.

## Rewards

EXP 4260; completion widgets: `(worldMaster,51138,3101511)` (note: row
51138, not Bardi's 51122), `(27238,2)` Paeon of War, linkpearl
`(player,1200133,83)`.

## Edge-case coverage (verified, not changed)

Same launcher + `gc_sqb_runtime` guarantees as Brd0j2 (entry/owner/
kill-boundary guards, fail-to-retry, party return, anti-retrigger).
No chocobo/level-sync systems in 1.x; entrants are players only.

## Follow-up (not done here)

Giver reachability via new Jehantel spawn 3260; offer availability
needs 111303 uncommented in `quest_availability.lua` by the integrator.
