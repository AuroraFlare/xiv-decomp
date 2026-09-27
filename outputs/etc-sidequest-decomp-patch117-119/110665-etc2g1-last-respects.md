# 110665 — Last Respects (Etc2g1)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 40, no prereq.
- Availability: commented out,
  `Partially implemented - open-world fight + mob kill/drop (Etc2g1)`.
- Quest giver: Eadbert 1001345.
  Spawn VERIFIED (`eadbert` @ zone 152, `-674.727, 4.072, -2498.26`).
- Objective: kill Lemurs, BNPC class 2100512, x4.
  Objective item display: 11000162 (message 25226). Item row VERIFIED present.

## Kill-target verdict: BNPC CLASS ABSENT (the concrete partial reason)

- `server_battlenpc_mob_types.sql`: **0 rows** for BNPC 2100512 — VERIFIED.
- The live `lemur` family is BNPC **2100505** (2 mob-type rows, levels
  40–44/46–48; 18 spawns, zones 152/154) — VERIFIED. Different class ID;
  does NOT satisfy `bnpc == 2100512`.
- Consequence: SEQ_001 unreachable live. The level band and habitat exist in
  the world under a neighboring class ID, which bounds the recovery work
  (class-ID reconciliation + spawn check), but no substitution was made.
  No navmesh check applies to the authored class.

## Sequence flow (from `Data/scripts/quests/etc/etc2g1.lua`, VERIFIED)

- `SEQ_ACCEPT`: Eadbert `QFLAG_TALK`; offer delegate `processEventEadbertStart`;
  1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Eadbert re-talk → `processEvent000`. `onKillBNpc`
  (SEQ_000 + class 2100512) → `IncCounter` → 25226; at >= 4 → 25225 → SEQ_001.
- `SEQ_001`: Eadbert → `processEvent005` + `sqrwa(4260, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: kill counter. Markers 11066501 area / 11066502 Eadbert —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventEadbertStart`, `processEvent000`, `processEvent005`,
`sqrwa` (exp 4260).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Currency 1000012 x20 + 4260 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_QUESTITEM >= 4`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.
