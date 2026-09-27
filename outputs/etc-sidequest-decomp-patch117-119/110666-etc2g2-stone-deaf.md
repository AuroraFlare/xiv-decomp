# 110666 — Stone Deaf (Etc2g2)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 18, no prereq.
- Availability: commented out,
  `Partially implemented - open-world fight + mob kill/drop (Etc2g2)`.
- Quest giver: Kinborow 1000509.
  Spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `kinborow` @ zone 206, `-362.96, 6.82, -1693.98`).
- Objective: kill Canopy Galagos, BNPC class 2100502, x5.
  Objective item display: 11000163 (message 25226 `You obtain <item> (X of Y)`).
  Item row VERIFIED present in `gamedata_items.sql`.

## Kill-target verdict: ABSENT FROM WORLD (the concrete partial reason)

- `server_battlenpc_mob_types.sql`: **0 rows** for BNPC 2100502 — VERIFIED.
- `server_battlenpc_spawn_locations.sql`: **0 rows** for any canopy-galago
  family member — VERIFIED.
- Nearest live family: `curious_galago` BNPC 2100516 (3 mob-type rows,
  26 spawns). It is a different class ID and does NOT satisfy the quest's
  `bnpc == 2100502` check — INFERRED kinship, not a substitute.
- Consequence: `onKillBNpc` can never fire for the authored class, so SEQ_001
  is unreachable in the live world. No spawns were invented; no navmesh check
  applies (nothing to locate). Mob-type + spawn recovery remains open work.

## Sequence flow (from `Data/scripts/quests/etc/etc2g2.lua`, VERIFIED)

- `SEQ_ACCEPT`: Kinborow `QFLAG_TALK`; offer delegate `processEventStart`;
  1 → `AcceptQuest` → `onStart` → SEQ_000.
- `SEQ_000`: Kinborow re-talk → `processEventFree` reminder.
  `onKillBNpc` fires only for SEQ_000 + class 2100502 → `IncCounter` → 25226;
  at >= 5 → 25225 → `StartSequence(SEQ_001)`.
- `SEQ_001`: Kinborow → `processEventClear` + `sqrwa(1170, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: `getJournalInformation` returns kill counter.
  Markers 11066602 area / 11066601 Kinborow — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventStart`, `processEventFree`, `processEventClear`, `sqrwa` (1170).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

10000 gil + item 8030821 x1 + 1170 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard — `onKillBNpc` returns early when the counter already
  meets `OBJECTIVE_AMOUNT` (engine `IncCounter` is unbounded; without the
  guard, post-completion-window kills could over-increment before the sequence
  flips).
- Verified safe, no change: wrong mobs ignored (class check); post-complete
  kills ignored (seq check + engine `OnComplete` nulls data); single
  `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all talk paths
  (`StartSequence` pushes quest state engine-side, so no extra update needed
  in `onKillBNpc`, per prior-phase convention).
