# Brd0j2 deep decomp: The Archer's Anthem (111302, Lv35)

JOB BRD, 2026-09-27. Open-world quest (exact private adapter). Status:
already Implemented; this pass verifies and documents (no code change:
`validate_job_brd_routes.py` pins the exact contracts).

## Sources

- `job_blm_pld_brd_drg_decomp_2026-09-07.md` (Bard/111302 section)
- `marker-evidence.json`: 11225101 (-160.92, -1315.21, 104/412)
- `docs/Dat Mining/brd0j2.csv` (offer/bardic-history/linkpearl texts)
- `class_job_quest_implementation_2026-08-23.md` (Brd0j2 adapter section)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jehantel (`processEventJEHANTELStart`, EQ pc149/0x4DE) | NPC |
| 5 | Lone jackal Bardi in Nanawa Mines | Private SQB battle |
| 10 | Jehantel completion widgets | NPC |

No route steps, no NQ scene/warp, no persisted flags. Journal: Fst
439-441 (Fst 440 selector; 441 is a next-quest notice).

## NPCs and mobs

- Bardi: actor 2101413 / display 3101415, public mob 3003, skill list
  6002 (Midnight Howl 23142, Threatening Growl 23143, Foul Bite 23144,
  Sanguine Bite 23145). Staged Lv42. Single target, single phase;
  1.x retail has no enrage/phases for this NM (verified against skill
  list contents: family howls + bites only).
- Marker 11225101 -> Nanawa Mines zone 176; public NM spawn
  `nm_bardi_176_1` exists but never satisfies the quest (private
  unique `brd0j2_bardi` + owner/area/sequence checks).
- Party: 4 total (player + three), enforced by launcher cap.

## Rewards

EXP 3360; completion widgets: `(worldMaster,51122,3101415)`,
`(27239,2)` Minuet of Rigor, linkpearl `(player,1200133,82)`.

## Edge-case coverage (verified, not changed)

Launcher + `gc_sqb_runtime`: leader-only entry, cap 4, member
same-area/alive/combat-ready checks, live-shell re-entry guard,
owner binding across relog, ambient-kill rejection, death/timeout/
disconnect/area-exit/quest-change fail-to-retry (seq 0), retrigger
guards (`creditedTargets`/`finishing`), party return. No chocobo or
level-sync systems exist in 1.x; the entrant list admits players only.

## Follow-up (not done here)

Jehantel's public spawn (new spawn 3260 in the BRD migration) also
repairs this quest's giver reachability; offer availability still
requires the integrator to uncomment 111302 in `quest_availability.lua`.
