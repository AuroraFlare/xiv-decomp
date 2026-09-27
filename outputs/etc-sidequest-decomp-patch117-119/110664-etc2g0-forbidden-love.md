# 110664 — A Forbidden Love (Etc2g0)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 30, prereq 110663.
- Availability: commented out,
  `Partially implemented - open-world fight + mob kill/drop (Etc2g0)`.
- Quest giver: Ethelinda 1001352.
  Spawn VERIFIED (`ethelinda` @ zone 154, `1313.99, -11.8, 963.94`).
  Second principal: Lonsygg 1000951 (spawn VERIFIED, see 110663).
- Objective: kill Mirror Roselets, BNPC class 2102708, x3.
  Objective item display: 11000161 (message 25226). Item row VERIFIED present.
- Chain: SQL prereq 110663 VERIFIED, matching the Lua header
  ("Etc1g9 completed"). Three-sequence chain: SEQ_000 kill →
  SEQ_001 report to Lonsygg → SEQ_002 return to Ethelinda.

## Kill-target verdict: ABSENT FROM WORLD (the concrete partial reason)

- `server_battlenpc_mob_types.sql`: **0 rows** for BNPC 2102708 — VERIFIED.
- `server_battlenpc_spawn_locations.sql`: **0 rows** for any mirror-roselet
  family member — VERIFIED.
- Nearest live family: `pruned_roselet` BNPC 2102722 (2 mob-type rows,
  9 spawns). Different class ID; does NOT satisfy `bnpc == 2102708`.
- Consequence: SEQ_001/SEQ_002 unreachable live. No spawns invented; no
  navmesh check applies. Mob-type + spawn recovery remains open work.

## Sequence flow (from `Data/scripts/quests/etc/etc2g0.lua`, VERIFIED)

- `SEQ_ACCEPT`: Ethelinda `QFLAG_TALK`; offer delegate
  `processEventEthelindaStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Ethelinda re-talk → `processEvent000_2`. `onKillBNpc`
  (SEQ_000 + class 2102708) → `IncCounter` → 25226; at >= 3 → 25225 → SEQ_001.
- `SEQ_001`: Lonsygg → `processEvent000` → `StartSequence(SEQ_002)`
  (talk-driven, unconditional in SEQ_001); Ethelinda re-talk →
  `processEvent000_2` reminder.
- `SEQ_002`: Ethelinda → `processEvent005` + `sqrwa(2661, 1, 1, 9)` →
  single `CompleteQuest`; Lonsygg re-talk → `processEvent005_2`.
- Journal: kill counter. Markers 11066401 area / 11066402 Lonsygg /
  11066403 Ethelinda — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventEthelindaStart`, `processEvent000_2`, `processEvent000`,
`processEvent005`, `processEvent005_2`, `sqrwa` (exp 2661).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3910305 x12 + 2661 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_QUESTITEM >= 3`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.
