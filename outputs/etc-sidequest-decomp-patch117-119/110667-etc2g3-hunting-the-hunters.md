# 110667 — Hunting the Hunters (Etc2g3)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 24, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc2g3)`.
- Quest giver: O'dhinek, native 1900140 / actor 1000829.
  Actor spawn VERIFIED (`odhinek` @ zone 206, `241.82, 13, -1276.62`).
- Objective: push-interact `IXAL_OBJECTIVE` 1090219
  (`etc2g3_ixal_objective` @ zone 154, `1269.860, -9.400, 1094.050`)
  — VERIFIED static row. "Hunt the Ixal near Quarrymill."
- No kill counter, no objective item. Same structural template as
  Etc2l1/Etc2u0.

## Sequence flow (from `Data/scripts/quests/etc/etc2g3.lua`, VERIFIED)

- `SEQ_ACCEPT`: both O'dhinek variants `QFLAG_TALK`; delegate
  `processEventODhinekStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: O'dhinek re-talk → `processEvent000`. `onPush` on 1090219
  (SEQ_000 only) → 25225 → SEQ_001 + `UpdateENPCs`.
- `SEQ_001`: O'dhinek → `processEvent010` + `sqrwa(1751, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: 1 iff SEQ_001. Markers 11066702 area / 11066701 O'dhinek —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventODhinekStart`, `processEvent000`, `processEvent010`,
`sqrwa` (exp 1751).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3920003 x100 + 1751 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls throughout (no dot bugs found);
  single `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths; push gated
  on sequence + actor.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Retail mechanic is an Ixal hunt near Quarrymill with instanced content;
  the push objective stands in for that surface.
- What exists: static push objective with world XYZ, full Lua, giver spawn,
  reward rows.
- What is missing: the hunt encounter itself — no mob roster, no encounter
  script, no BCNM surface recovered. Live-client acceptance open.
