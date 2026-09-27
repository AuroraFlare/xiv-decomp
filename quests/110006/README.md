# Quest 110006 / Man0g1 "Souls Gone Wild" — indepth decomp notes

Lv.1 Gridania MSQ, prereq 110005 (Sundered Skies). Instance+escort duty:
White Wolf Gate → private Central Shroud (zone 150) escort of Powle + Sansa
to Lifemend Stump, then stump echo + LNC-guild echo + Miounne turn-in.

## Sources (all bodies inspected, not just grep)

- `FF14-Memory/Data/scripts/quests/man/man0g1.lua` (1262 lines)
- `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorMan0g101.lua`
- `FF14-Memory/Data/scripts/content/SimpleContentMan0g101.lua`
- `FF14-Memory/Data/escortnavmesh/souls_gone_wild.json` (341 waypoints, 5 stops)
- `FF14-Memory/Map Server/Actors/Director/EscortRouteDirector.cs`
- `FF14-Memory/Map Server/DataObjects/ChocoboCaravanRoute.cs`
- `FF14-Memory/Map Server/Utils/EscortRouteBuilderUtils.cs` (souls defaults)
- `FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql` rows 1096/1097/2710
- `FF14-Memory/Data/sql/server_battlenpc_mob_types.sql` bnpc 1365 row + schema
- `FF14-Memory/docs/mob_map_coordinates.md` + `map_coordinates.py` locate runs
- Web: FFXIV wiki "Souls Gone Wild" snippets (instance bubble re-centers on
  children; leaving it fails; slay beasties; Lifemend Stump at 23-27)

## Files

- `actors_positions.md` — actors, triggers, markers, coords/rot/map squares
- `seq_events_cutscenes.md` — SEQ branches, processEvents, journal/markers
- `escort_fight.md` — route, 5 phases, mob AI/aggro/leash/reset, escort rules
- `fail_edges.md` — timeout/death/disconnect/abandon/chocobo/party/loopholes

## Implementation status (FF14-Memory, this pass)

Brought to Man0u102 (Court) parity: ally escorts with HP protection,
no-chocobo entry + route rule, relog-safe director, death/timeout/leave
handling, entry rollback. Pinned by `tests/test_souls_gone_wild.py`
(`souls-gone-wild` suite). Open items are concrete gaps in `fail_edges.md`.
