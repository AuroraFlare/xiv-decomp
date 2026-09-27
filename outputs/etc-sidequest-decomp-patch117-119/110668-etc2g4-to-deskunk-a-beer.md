# 110668 — To Deskunk A Beer (Etc2g4)

- Patch family: patch_1_18 (Etc sidequests). SQL: level 31, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc2g4)`.
- Principals: Lefwyne, native 1000164 / actor 1001396 (actor spawn VERIFIED:
  `lefwyne` @ zone 206, `180.42, 25.82, -1400.37`); Janlenoux, native
  1200164 / actor 1001356 (actor spawn VERIFIED: `janlenoux` @ zone 145,
  `2555.74, 175.83, 1306.52`). Native variants have no static rows (pattern).
- Objective chain (4 sequences): SEQ_000 ask Janlenoux at Owl's Nest →
  SEQ_001 report to Lefwyne → SEQ_002 obtain sourleaf nectar via
  push-interact `SOURLEAF_OBJECTIVE` 1090215
  (`etc2g4_sourleaf_objective` @ zone 150, `-568.000, 3.800, -813.840`) —
  VERIFIED static row → SEQ_003 return nectar.
- Item: `ITEM_SOURLEAF_NECTAR` 11000202, granted on push (HasItem-guarded),
  25246 messaged, removed at turn-in AND in `onFinish`. Item row VERIFIED.

## Sequence flow (from `Data/scripts/quests/etc/etc2g4.lua`, VERIFIED)

- `SEQ_ACCEPT`: Lefwyne pair `QFLAG_TALK`; delegate `processEventLefwyneStart`;
  1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Lefwyne re-talk → `processEvent_000` reminder. Janlenoux →
  `processEvent_010` → unconditional `StartSequence(SEQ_001)`.
- `SEQ_001`: Janlenoux re-talk → `processEvent_010_1` reminder. Lefwyne →
  `processEvent_020` → unconditional `StartSequence(SEQ_002)`.
- `SEQ_002`: Lefwyne re-talk → `processEvent_020_1` reminder. `onPush` on
  1090215 (SEQ_002 only) grants nectar, plays 25225, advances to SEQ_003.
  Talk-to-advance branches cannot refire (sequence has moved on) — VERIFIED
  no double-advance.
- `SEQ_003`: Lefwyne → `processEvent_030` + `sqrwa(2700, 1, 1, 9)` + nectar
  removal → single `CompleteQuest`.
- Journal: sequence + HasItem bit. Markers 11066802 Janlenoux (SEQ_000) /
  11066801 Lefwyne (SEQ_001+003) / 11066803 sourleaf area (SEQ_002) —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventLefwyneStart`, `processEvent_000`, `processEvent_010`,
  `processEvent_010_1`, `processEvent_020`, `processEvent_020_1`,
  `processEvent_030`, `sqrwa` (exp 2700).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

14000 gil + 2700 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls throughout; single
  `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all talk/push paths; push gated
  on sequence + actor; nectar grant/removal idempotent.
- No kill counter exists; no overkill surface.

## Instance-surface need (UNRECOVERED — do NOT stub)

- The Lefwyne/Janlenoux talk chain is fully implemented; the `instance` tag
  attaches to the sourleaf-brewing leg (SEQ_002).
- What exists: static push objective with world XYZ, nectar item flow, full
  4-sequence Lua, both giver spawns, reward rows.
- What is missing: the instanced content behind the sourleaf objective — no
  encounter script or scene surface recovered. Live-client acceptance open.
