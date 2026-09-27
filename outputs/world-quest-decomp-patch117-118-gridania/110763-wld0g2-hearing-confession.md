# 110763 — Hearing Confession (Wld0g2)

- Patch family: patch_1_17 (Gridania world quests). SQL: level 10, no prereq.
- Quest giver / turn-in: Swaenhylt, ENPC 1001582, spawn zone 206 (Gridania)
  `17.61, 21.75, -1432.55` — VERIFIED.
- Objective: talk to 4 lost souls, then return. No combat, no chocobo.
- Souls (class IDs VERIFIED in `gamedata_actor_class.sql`; spawns VERIFIED in
  `server_eventnpc_spawn_locations.sql`):
  - Flavielle 1001459 — zone 155 Gridania `75.4, 4.2, -1220.13`
  - Keketo 1001346 — zone 154 South Shroud `1451.0, -11.8, 875.0`
  - Ceadde 1000330 — zone 230 Limsa Lominsa `-778.64, 12, 226.64`
  - Thimm 1001439 — zone 175 Ul'dah `3.52, 196, 110.96`
  - (Old atlas flagged Keketo `path_missing`; current SQL has its
    PopulaceStandard path — resolved, VERIFIED.)

## Sequence flow (from `Data/scripts/quests/wld/wld0g2.lua`, VERIFIED)

- `SEQ_ACCEPT`: Swaenhylt `QFLAG_TALK`. Talk → `processEventSwaenhyltStart`;
  return 1 → `AcceptQuest` → `onStart` → `StartSequence(SEQ_000)`.
- `SEQ_000`: `onStateChange` registers Swaenhylt (no flag) plus each soul
  with `QFLAG_TALK` iff its flag is unset, else `QFLAG_NONE` — completed
  souls lose their talk marker. VERIFIED.
- `onTalk` per soul: first talk → `SetFlag(i)`, `incCounter = true`,
  first-time delegate (`processEvent005` Flavielle / `010` Keketo /
  `015` Ceadde / `020` Thimm). Re-talk → `_2` variant
  (`processEvent005_2`, `010_2`, `015_2`, `020_2`), no flag/counter change.
  Swaenhylt mid-quest → `processEvent000_2` reminder.
- Counter block: only when `incCounter`: `IncCounter(0)` → attention 51063
  `You have heard a lost soul's confession. (X of 4)`; then
  `seq000_checkCondition(data)` (all 4 flags) → attention 25225
  `objectives complete` → `StartSequence(SEQ_001)`.
- `SEQ_001`: Swaenhylt `QFLAG_REWARD`. Talk → `processEvent025` +
  `sqrwa(300, 1, 1, 9)` → `CompleteQuest`.
- Journal markers: SEQ_000 returns only un-talked souls' markers
  (11120101–11120104), hiding completed souls — VERIFIED in code;
  SEQ_001 returns Swaenhylt marker (11120105).
  Marker coordinates authored, no DAT rows — INFERRED.

## Re-talk / double-count audit (VERIFIED correct, no change)

- Repeat talks cannot double-count: flag check gates both `SetFlag` and
  `incCounter`; counter increments at most 4 times (once per flag).
- `seq000_checkCondition` requires all 4 flags, not counter value, so a
  desynced counter alone cannot complete the quest.
- Abandon/re-accept resets flags+counter (engine fresh `QuestData`).
- Reward single-claim via engine `CompleteQuest` repeat guard.
- `UpdateENPCs`/`EndEvent` on every talk path (the inner `UpdateENPCs`
  before `StartSequence` is redundant with the trailing call — harmless,
  left as-is).
- Uses `npc:GetActorClassId()` colon form — correct, no change.

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventSwaenhyltStart`, `processEvent000_2`, `005`/`005_2`,
`010`/`010_2`, `015`/`015_2`, `020`/`020_2`, `025`, `sqrwa` (exp 300).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3010201 x12 + item 8012011 x1 + 300 exp. Lua `sqrwa` exp matches.
Note: old Lua header comment said `Rewards 200 gil` — stale, FIXED to the
SQL-backed rewards. No SQL change.
