# Ore for an Ore — 110687 (Etc2u2, patch_1_23)

- Script: `Data/scripts/quests/etc/etc2u2.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23, commented out but labeled Implemented
  (Lv 28, any DoW/DoM).
- Type: open-world fight + mob kill/drop (counter, no physical drop).
  No chocobo. No instance.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Pahja Zhwan (1001840) TALK, class-gated offer
  `processEventPAHJAZHWANStart`; accept -> `AcceptQuest`.
- SEQ_000: Pahja reminder `processEvent000`; `onKillBNpc` increments
  COUNTER_QUESTITEM per Iron Coblyn kill with 25226 progress message
  (item 11000226 Coblyn Larva, X of 10); at 10 -> objectives-complete +
  `StartSequence(SEQ_005)`. Kill counting gated on SEQ_000 (verified).
- SEQ_005: `processEvent010` + `sqrwa(2970)` + `CompleteQuest`.
  Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventPAHJAZHWANStart`, `processEvent000`, `processEvent010`, `sqrwa`
— full recovered set bridged (verified). Wiki archive (#102) confirms.

## Actors / mobs (verified spawn rows)

- 1001840 `pahja_zhwan`, zone 209 (-113.19, 194.2, 324.25) — matches DAT
  marker 11068702 (verified).
- BNPC 2102105 `iron_coblyn`, mob types 1071 + 39323
  (`server_battlenpc_mob_types.sql`, verified); spawn rows zone 176
  (Nanawa Mines), e.g. ids 1069-1074 + 960180/960181
  (`server_battlenpc_spawn_locations.sql`, verified).

## Markers (DAT-verified)

- 11068701 coblyn area (100.43, -1231.77, area type), 11068702 Pahja Zhwan.
  Returned per sequence (verified).

## Counters / journal

- Counter 0 = larvae count; journal returns it (verified).
- Journal text: xtx_quest Wil/599-601 (verified).

## Rewards (SQL parity verified)

- `(110687, 1, 'Item', 7010104, 1, 'dat-new', autoGrant 1)`,
  `(110687, 2, 'Exp', 0, 2970, 'wiki', autoGrant 1)`.
- `sqrwa(2970)` matches SQL 2970 (verified). No manual grants in script
  (verified correct — auto-grant owns delivery).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110687, ..., 0, 28)`. Header agrees.

## Mob spawn evidence + navmesh verdict

- Documented BNPC 2102105 with live zone-176 spawns (above).
- Navmesh (`map_coordinates.py locate --zone 176 --world -121.446 -1297.576`,
  recording zone_176.tsv sha 47805f4d..., 1808 nodes): 30 recorded points in
  30-yalm radius; nearest node 475 at 1.9 yalms, Y 167.36 vs spawn Y 167.42
  (verified grounded — spawn Y consistent with recorded ground).
- VERDICT: kill route ground support PRESENT. No invented heights (spawn
  rows carry literal Y; nearby recorded nodes corroborate).

## Instance surface

- None needed — open-world kill quest (verified).

## Inferred vs verified

- VERIFIED: delegates, giver + mob spawns, markers, journal rows, counters,
  reward parity, navmesh ground.
- INFERRED: "larva" as counter-only objective (no physical drop table
  recovered — deterministic counter retained, no drop probability claimed).

## Hardening (Part 2)

- `npc.GetActorClassId()` -> `npc:GetActorClassId()`; lowercase
  `quest:getSequence()` -> `GetSequence()` in journal marker callback.
  No logic change (kill gate, rewards, completion verified correct).
