# 110744 — Winds of Change (Etc3l1)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 15, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc3l1)`.
- Quest giver: Zanthael, native 1600258 / actor 1000351.
  Actor spawn VERIFIED (`zanthael` @ zone 133, `-441.8, 21, 175`).
  Native 1600258 has no static row (variant pattern) — VERIFIED absence.
- Objective A (SEQ_000): speak with five La Nosceans — Bibiraka
  1400154/1001511, Arthurioux 1200097/1000133, J'Ghonako 1900044/1000342,
  Sundhimal 1600182/1000349, Gert 1100075/1500004. Flags 0–4 +
  `COUNTER_TALKED` (target 5); message 51061, 25225 at 5/5.
  Actor-variant spawns VERIFIED (1001511/1000133/1000342/1000349 @ zone 230;
  1500004 @ zone 230); native variants have no static rows (pattern).
- Objective B (SEQ_002): push-interact `OBJECTIVE` 1090227
  (`etc3l1_garlean_cave_objective` @ zone 128,
  `-156.620, 25.600, -92.190`) — VERIFIED static row.

## Sequence flow (from `Data/scripts/quests/etc/etc3l1.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Zanthael variants `QFLAG_TALK`; delegate
  `processEventZanthaelStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: five talk branches (first-talk/`01` re-talk pairs) via
  `markTalked`; >= 5 → 25225 → SEQ_001. Zanthael re-talk → `processEvent000`.
  `onStateChange` SEQ_000 also registers OBJECTIVE with no flag (visible but
  not pushable until SEQ_002).
- `SEQ_001`: Zanthael → `processEvent000_1` → `StartSequence(SEQ_002)`.
- `SEQ_002`: Zanthael re-talk → `processEvent005` reminder. `onPush` on
  1090227 (SEQ_002 only) plays three delegates
  (`processEventLtrimmna/Lowell/Kopelyorpel`) + 25225 → SEQ_003.
- `SEQ_003`: Zanthael → `processEvent010` + `sqrwa(500, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: sequence + talk counter. Markers: `{}` always — VERIFIED absence.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventZanthaelStart`, `processEvent000`, five first-talk + five `01`
  re-talk, `processEvent000_1`, `processEvent005`, three push delegates,
  `processEvent010`, `sqrwa` (exp 500).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

7500 gil + item 8090402 x1 + 500 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; dual-ID `isX` helpers; flag
  gating; single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths;
  push gated on SEQ_002 + actor class.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Talk chain (SEQ_000–001) fully implemented; the `instance` tag attaches to
  the SEQ_002 Garlean-cave objective.
- What exists: static push objective with world XYZ, full 4-sequence Lua,
  giver spawn, reward rows.
- What is missing: the instanced/cutscene content behind the cave
  interaction — no encounter script or scene surface recovered. The three
  push delegates are DAT scene references, unverified live. Acceptance open.
