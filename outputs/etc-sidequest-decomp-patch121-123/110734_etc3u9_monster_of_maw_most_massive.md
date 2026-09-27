# Monster of Maw Most Massive — 110734 (Etc3u9, patch_1_23a)

- Script: `Data/scripts/quests/etc/etc3u9.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_23a, commented out (Lv 45, any DoW/DoM).
- Type: open-world fight + mob kill/drop (counter, no physical drop).
  No chocobo. No instance.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: Dural Tharal (1002101) TALK, class-gated offer
  `processEventStart(0, OBJECTIVE_AMOUNT=8)`; accept -> `AcceptQuest`.
- SEQ_000: reminder `processEventFree(0, 8)`; `onKillBNpc` increments
  COUNTER_QUESTITEM per Musk Roseling kill with 25226 progress message
  (item 11000149 pollen, X of 8); at 8 -> objectives-complete +
  `StartSequence(SEQ_001)`.
- SEQ_001: `processEventClear` + `sqrwa(5340)` + `CompleteQuest`.
  Single CompleteQuest (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventStart`, `processEventFree`, `processEventClear`, `sqrwa` —
full recovered set bridged (verified). Wiki archive (#109) confirms,
incl. a video reference (unwatched; recorded as provenance only).

## Actors / mobs (verified spawn rows)

- 1002101 `dural_tharal`, zone 175 (-131.03, 193, 29.41).
- BNPC 2102717 `musk_roseling`, mob type 39201
  (`server_battlenpc_mob_types.sql`, verified); spawn rows zone 130,
  ids 960006-960009, e.g. (1127.14, 49.323, -597.331)
  (`server_battlenpc_spawn_locations.sql`, verified).

## Markers (DAT-verified)

- 11063801 roseling area (1096.12, -578.48, area type), 11063802 Dural
  Tharal (actor 1900024? marker-bound actor id; recorded as DAT-literal).
  Returned per sequence (verified).

## Counters / journal

- Counter 0 = pollen count; journal returns it (verified).
- Journal text: xtx_quest Wil/614-616 (verified).

## Rewards (SQL parity verified)

- `(110734, 1, 'Gil', 1000001, 8000, 'dat-new', autoGrant 1)`,
  `(110734, 2, 'Item', 3020608, 20, 'dat-new', autoGrant 1)`,
  `(110734, 3, 'Exp', 0, 5340, 'wiki', autoGrant 1)`.
- `sqrwa(5340)` matches SQL 5340 (verified). No manual grants in script
  (verified correct — auto-grant owns delivery).

## Prereqs (verified)

- `gamedata_quests.sql`: `(110734, ..., 0, 45)`. Header agrees.

## Mob spawn evidence + navmesh verdict

- Documented BNPC 2102717 with live zone-130 spawns (above).
- Navmesh (`map_coordinates.py locate --zone 130 --world 1127.140 -597.331`):
  37 recorded points in radius; nearest node 2514 at 0.75 yalms,
  Y 49.15 vs spawn Y 49.323 (verified grounded).
- VERDICT: kill route ground support PRESENT. No invented heights.

## Instance surface

- None needed — open-world kill quest (verified).

## Inferred vs verified

- VERIFIED: delegates, giver + mob spawns, markers, journal rows, counters,
  reward parity, navmesh ground.
- INFERRED: "pollen" as counter-only objective (no physical drop table
  recovered — deterministic counter retained, no drop probability claimed).

## Hardening (Part 2) — real bug fixed

- `onKillBNpc` counted Musk Roseling kills in ANY sequence (no stage gate):
  pre-accept and post-completion kills inflated the counter. Added
  `quest:GetSequence() == SEQ_000` gate (matches etc2u2 + campaign
  convention "counts kills only during its combat stage").
- `npc.GetActorClassId()` -> `npc:GetActorClassId()`; lowercase
  `quest:getSequence()` -> `GetSequence()` in journal marker callback.
