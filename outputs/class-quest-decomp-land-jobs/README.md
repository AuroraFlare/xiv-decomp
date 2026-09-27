# LAND + Jobs class-quest decomp (Phase 3)

Scope: `Data/scripts/quests/fsh/`, `min/`, `wdk/`, `hrv/`, `noc/`, `brd/`,
`pld/`, `war/` in the server repo (FF14-Memory), plus the `Brd*` / `Pld*` /
`War*` rows of `Data/scripts/quests/job_quest_template.lua` and the
`Fsh*` / `Min*` / `Hrv*` / `Wdk*` rows of
`Data/scripts/quests/class_quest_template.lua`.

Quest IDs/names: `Data/sql/gamedata_quests.sql` (single source for code, title,
chain prerequisite, level). Availability posture:
`Data/scripts/quests/quest_availability.lua` (`class_quests` and `job_quests`
sections; all rows in scope are commented out except `110500 Fsh200`, which is
enabled).

## Legend

- VERIFIED: read directly from a repo file (path cited). SQL row text quoted.
- RECOVERED: client DAT/decomp metadata embedded in script headers or template
  `documented*` blocks (not independently re-mined here).
- AUTHORED: server reconstruction choice, always marked inline in the scripts.
- INFERRED: this decomp's reading of the evidence (marked as such).
- OPEN: needed evidence that does not exist in the repo.

## Prior atlases used

- `class-quest-gathering-decomp-20260927` (quest_list, markers, rewards,
  gathering_targets, events, gaps CSVs) - land quest roster baseline.
- `class-quest-20-30-36-*` audits (atlas, gate, global, mob-roster,
  reward-marker-event, sequence-journal) - cross-checks for states/markers.
- `job-gc-decomp-20260907` - job quest battle-contract context.
- `meteor-wiki-quests/quests-archive.md` (as named in the work order) was NOT
  found in the server repo; wiki-derived facts below come via the scripts'
  own cited sources (`wiki`/`dat-old` reward rows, walkthrough references in
  headers). No URL is invented here.

## Method

Each quest file records: sequence flow, delegate events, ENPC/BNPC IDs, map
markers, counters/flags, journal hooks, gather/delivery mechanics, rewards,
prereq chains, mob profiles + spawn evidence (where kills exist). Gathering
quests are delivery-gated; none in scope has a kill objective. Job-quest
instanced/open-world battles record needed-vs-existing surface per quest; no
fight is invented (HOLD rows stay HOLD).

## Hardening changes (this phase, server repo)

1. `hrv/hrv300.lua`: `getJournalMapMarkerList` returned Lua tables
   (`{a, b}`) for SEQ_011/SEQ_025. The engine (`Quest.GetJournalMapMarkerList`
   -> `RequestQuestJournalCommand` -> `unpack(mapMarkers)` +
   `questMapMarkerFilter.filterForPlayer` with `ipairs`) expects multiple
   return values. Fixed to multi-return. Real bug.
2. `fsh/fsh300.lua`, `fsh/fsh306.lua`: `math.randomseed(os.time())` ran on
   every timed-assignment roll, so two assignments in the same second repeat
   the selector. Seeded once at script load. Real (minor) bug.
3. `fsh/fsh300.lua` header: Sisipu blocker note updated - public row 3329
   (`fsh306_sisipu`, zone 230) exists in main spawn SQL; Barrel boat-travel
   blocker still holds. Doc accuracy only; HOLD unchanged.
4. `job_quest_template.lua` todos: War0j2 skill claim `4` -> `6031`, Pld0j3
   skill claim `21` -> `6024` (both now match the NM skill lists on the
   `server_battlenpc_mob_types` rows). Doc accuracy only.
5. `server_battlenpc_mob_types.sql`: added the 8-row
   "Brd/Pld/War job-quest private-battle profiles 2026-09-27" block for live
   (offer=true) job fights that referenced non-existent mobTypeIds
   (3080 Phaia, 3000 Alux, 32730 Antling Worker, 32731-32734 Pld0j1 quartet,
   3064 Jenlyns Straightblade). Without rows,
   `Area.SpawnEnemyByMobTypeId` returns null and the fights never spawn (same
   failure class as the GLA/PGL bug pinned by
   `tools/validate_class_quest_mob_types.py`). Full 41-column rows following
   the parallel Phase-3 melee block's convention (engine-derived HP/MP,
   drops 0, no public spawns). 32730-32734 values mirror the existing
   `war0j1_antling_workers.sql` / `pld0j1_undead.sql` migrations (which now
   carry main-SQL parity notes); 3080/3000/3064 use staged research
   (levels/jobs/NM-or-family skill lists) + a new mirror migration
   `brd_pld_job_quest_profiles.sql`.
6. `tools/validate_job_quest_mob_types.py` (new file from the parallel melee
   phase, which anticipated this: "covered when they land in main SQL"):
   extended `SCOPE` from Mnk/Drg to Brd/Pld/War so the new rows are
   regression-covered. No `tests/suites.json` change (file is outside the
   runner catalog).

`quest_availability.lua` untouched. `tests/suites.json` untouched.
