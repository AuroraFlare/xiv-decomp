# 110683 — Traumaturgy (Etc1u8)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 36, prereq 110682.
- Availability: commented out, `Partially implemented - instance (Etc1u8)`.
- Quest giver: Totono, native 1500020 / actor 1001143 (spawn VERIFIED, zone
  209 — see 110682).
- Objective: push-interact `AMALJAA_OBJECTIVE` 1090218
  (`etc1u8_amaljaa_ring_objective` @ zone 171,
  `1778.230, 258.000, -522.880`) — VERIFIED static row. "Search the mesa
  northeast of Halatali for Theda's ring."
- Item: `ITEM_THEDAS_RING` 11000166, granted on push (HasItem-guarded),
  25246 messaged, removed at turn-in AND in `onFinish`. Item row VERIFIED.
- Chain: SQL prereq 110682 VERIFIED, matching the Lua header
  ("Quest 110682, Level 36"). Structural sequel to Clasping to Hope with a
  second objective actor and a second item.

## Sequence flow (from `Data/scripts/quests/etc/etc1u8.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Totono variants `QFLAG_TALK`; delegate
  `processEventTotonoStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Totono re-talk → `followEvent005`. `onPush` on 1090218
  (SEQ_000 only) grants ring if missing, plays 25225, advances to SEQ_001.
- `SEQ_001`: Totono → `processEvent010` + `sqrwa(3540, 1, 1, 9)` +
  ring removal → single `CompleteQuest`.
- Journal: SEQ_001 flag + HasItem bit. Markers 11068301 area / 11068302
  Totono — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventTotonoStart`, `followEvent005`, `processEvent010`,
`sqrwa` (exp 3540).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3020528 x6 + 3540 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all paths; push gated on sequence + actor;
  item grant/removal idempotent via `HasItem` guards.

## Instance-surface need (UNRECOVERED — do NOT stub)

- Same standing as 110682: the push objective stands in for an instanced
  Amalj'aa-fight leg that has no recovered encounter script, mob roster, or
  BCNM surface. Full Lua, giver spawn, objective XYZ, and reward rows exist.
  Live-client acceptance open.
