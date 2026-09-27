# 110682 — Clasping to Hope (Etc1u7)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 34, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc1u7)`.
- Quest giver: Totono, native 1500020 / actor 1001143.
  Actor spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `totono` @ zone 209, `-305, 206, 227.27`). Native 1500020 has no static
  row (native/cutscene variant pattern) — VERIFIED by absence query.
- Objective: push-interact `AMALJAA_OBJECTIVE` 1090217
  (`etc1u7_amaljaa_clasp_objective` @ zone 171,
  `1586.030, 256.900, -124.820`) — VERIFIED static row. "Search near
  Halatali for Theda's clasp."
- Item: `ITEM_NOVICES_CLASP` 11000165, granted on push (HasItem-guarded),
  messaged with 25246, removed at turn-in AND in `onFinish` (double-removal
  is safe: both sites guard with `HasItem`). Item row VERIFIED present.

## Sequence flow (from `Data/scripts/quests/etc/etc1u7.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Totono variants `QFLAG_TALK`; delegate
  `processEventTotonoStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Totono re-talk → `followEvent005`. `onPush` on 1090217
  (SEQ_000 only) grants clasp if missing, plays 25225, advances to SEQ_001.
- `SEQ_001`: Totono → `processEvent010` + `sqrwa(3180, 1, 1, 9)` +
  clasp removal → single `CompleteQuest`.
- Journal: SEQ_001 flag + HasItem bit. Markers 11068201 area / 11068202
  Totono — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventTotonoStart`, `followEvent005`, `processEvent010`,
`sqrwa` (exp 3180).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3020516 x6 + 3180 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls throughout; single
  `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all paths; push gated on
  sequence + actor; item grant/removal idempotent via `HasItem` guards.
- No kill counter exists; no overkill surface.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Retail mechanic is an instanced Amalj'aa fight near Halatali; the push
  objective stands in for that encounter surface.
- What exists: static push objective with world XYZ, clasp item flow, full
  offer/push/turn-in Lua, giver spawn, reward rows.
- What is missing: the instanced fight — no encounter script, no mob roster,
  no BCNM surface recovered. Sequel quest 110683 repeats the pattern with a
  second objective (1090218). Live-client acceptance open.
