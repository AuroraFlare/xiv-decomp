# 110686 — Freedom Isn't Free (Etc2u1)

- Patch family: patch_1_18 (Etc sidequests). SQL: level 32, no prereq.
- Availability: commented out,
  `Partially implemented - open-world fight + mob kill/drop (Etc2u1)`.
- Quest giver: Halstein 1001007.
  Spawn VERIFIED (`halstein` @ zone 175, `-160.78, 188.7, 117.31`).
- Objective: kill Amalj'aa Strikers, BNPC class 2106541, x6.
  Objective item display: 11000201 (message 25226). Item row VERIFIED present.

## Kill-target verdict: ENTIRELY ABSENT (the concrete partial reason)

- `server_battlenpc_mob_types.sql`: **0 rows** for BNPC 2106541 — VERIFIED.
- `server_battlenpc_spawn_locations.sql`: **0 rows** for any
  `amaljaa_striker` — VERIFIED. The live Amalj'aa roster (captain, drubber,
  drudge, grappler, grunt, high divinator, lancer, pennoncier) contains NO
  striker role at all.
- Consequence: SEQ_001 unreachable live. Unlike 110665 (neighboring class
  exists), here the whole role is unrecovered. No spawns invented; no
  navmesh check applies.

## Sequence flow (from `Data/scripts/quests/etc/etc2u1.lua`, VERIFIED)

- `SEQ_ACCEPT`: Halstein `QFLAG_TALK`; offer delegate `processEventStart`;
  1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Halstein re-talk → `processEventFree`. `onKillBNpc`
  (SEQ_000 + class 2106541) → `IncCounter` → 25226; at >= 6 → 25225 → SEQ_001.
- `SEQ_001`: Halstein → `processEventClear` + `sqrwa(2820, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: kill counter. Markers 11068602 area / 11068601 Halstein —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventStart`, `processEventFree`, `processEventClear`,
`sqrwa` (exp 2820).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 4020006 x1 + 2820 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_QUESTITEM >= 6`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.
