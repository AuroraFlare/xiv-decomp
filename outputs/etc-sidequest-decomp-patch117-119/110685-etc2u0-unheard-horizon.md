# 110685 — The Unheard Horizon (Etc2u0)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 20, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc2u0)`.
- Quest giver: Gegeissa, native 1400157 / actor 1001424.
  Actor spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `gegeissa` @ zone 170, `-56.69, 192, -6.59`).
- Objective: push-interact `BEAST_OBJECTIVE` 1090222
  (`etc2u0_horizon_beast_objective` @ zone 172,
  `-1055.000, 55.860, -129.000`) — VERIFIED static row.
  "Clear the monsters near Camp Horizon."
- No kill counter, no objective item. Same structural template as Etc2l1.

## Sequence flow (from `Data/scripts/quests/etc/etc2u0.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Gegeissa variants `QFLAG_TALK`; delegate
  `processEventStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Gegeissa re-talk → `processEventFree`. `onPush` on 1090222
  (SEQ_000 only) → 25225 → SEQ_001 + `UpdateENPCs`.
- `SEQ_001`: Gegeissa → `processEventClear` + `sqrwa(1440, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: 1 iff SEQ_001. Markers 11068502 area (SEQ_000) /
  11068501 Gegeissa (SEQ_001) — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventStart`, `processEventFree`, `processEventClear`,
`sqrwa` (exp 1440).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8030423 x1 + 1440 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all paths; push gated on sequence + actor.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Retail mechanic is an instanced fight near Camp Horizon; the push objective
  stands in for that encounter surface.
- What exists: static push objective with world XYZ, full Lua, giver spawn,
  reward rows.
- What is missing: the instanced fight — no encounter script, no mob roster,
  no BCNM surface recovered. Live-client acceptance open.
