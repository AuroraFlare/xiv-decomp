# Waste Not Want Not — 110828 (Etc5g0, patch_1_21)

- Script: `Data/scripts/quests/etc/etc5g0.lua` (server repo). Availability:
  `quest_availability.lua` patch_1_21, commented out (LV 1, second MSQ done).
- Type: dialogue/delivery/interaction. No kill, no instance, no chocobo.

## Sequence flow (verified vs production script)

- SEQ_ACCEPT: V'korolon (1000458) TALK. Offer `processEventVKOROLONStart`;
  accept returns 1 -> `AcceptQuest`, `StartSequence(SEQ_000)`, `wait(2)`,
  `attentionMessage(25246, bag 11000224 x1)` display-only (bag is a DummyItem,
  never added to inventory — journal-display pattern).
- SEQ_000: V'korolon reminder `processEvent_000_1`; Pfarahr (1001707)
  `processEvent_010` -> SEQ_001.
- SEQ_001: V'korolon `processEvent_020` + `sqrwa(200,1)` + `CompleteQuest`.
  Pfarahr reminder `processEvent_010_1`. Single CompleteQuest (verified).
- `onStart`/`onFinish` empty; accept path drives `StartSequence` (verified).

## Delegates (verified bridged, parity `event_bridge_complete_or_superset`)

`processEventVKOROLONStart`, `processEvent_000_1`, `processEvent_010`,
`processEvent_010_1`, `processEvent_020`, `sqrwa`.
Recovered client set (side_world_code_parity.csv): same five + `sqrwa`.
Wiki archive (#124) confirms roles, including Hildibrand finish cutscene.

## Actors (verified spawn rows)

- 1000458 `vkorolon`, zone 155 (55.82, 4, -1212.23).
- 1001707 `pfarahr`, zone 155 (64.18, -6.8, -1217.46).
- Source: `Data/sql/server_eventnpc_spawn_locations.sql`.

## Markers (DAT-verified, quest_marker.csv)

- 11082001 (Pfarahr objective), 11082002 (V'korolon return). Production
  `getJournalMapMarkerList` returns them per sequence (verified).

## Counters / journal

- No counters. `getJournalInformation` returns bag item 11000224 at SEQ_000.
- Journal text: xtx_quest Fst/461 (seq 0), Fst/462 (seq 1) (verified).
- Cutscene row: cutReplay.csv `11082801,etc5g010` (verified).

## Rewards (SQL parity verified)

- `gamedata_quest_rewards.sql`: `(110828, 1, 'Exp', 0, 200, autoGrant 1)`.
- Production `sqrwa(200, 1)` matches SQL 200 (verified). No manual
  AddItem/AddExp/AddGil in script (verified) — auto-grant owns delivery.

## Prereqs (verified)

- `gamedata_quests.sql`: `(110828, ..., 110006, 1)` — second Gridania MSQ.
- Header comment agrees (110002/110006/110010).

## Mob spawn evidence

- None — no kill objective.

## Instance surface

- None needed; no private-area warp in script (verified).

## Inferred vs verified

- VERIFIED: delegates bridged, actors spawned, markers in DAT, journal rows,
  cutscene row, reward parity, single completion path.
- INFERRED: exact client cutscene framing of `processEvent_020`
  (Hildibrand finish); no live-client playback.

## Hardening (Part 2)

- Canonical `quest:GetSequence()` in `onTalk`/journal callbacks
  (MoonSharp is case-insensitive; no behavior change).
- No logic change: offer gate, EndEvent/UpdateENPCs coverage, rewards
  already correct.
