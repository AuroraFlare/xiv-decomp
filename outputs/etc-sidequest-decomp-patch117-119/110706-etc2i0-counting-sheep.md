# 110706 — Counting Sheep (Etc2i0)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 25, no prereq.
- Availability: commented out,
  `Implemented - open-world fight + mob kill/drop (Etc2i0)`.
- Quest giver: Patrick 1001358.
  Spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `patrick` @ zone 145, `2627.58, 174.745, 1392.85`).
- Objective: kill Dreadwolves, BNPC class 2101403, x4
  (display 3101403, message 50041).

## Kill-target verdict: PRESENT

- Mob type VERIFIED: row 39361 `dreadwolf` BNPC 2101403, levels 25–29
  (4 further rows cover adjacent bands).
- Spawns VERIFIED: 13 `dreadwolf` rows, zone 157, e.g. map-placed
  `(-899.332, -16.353, -2062.338)`.
- Quest level (25) meets mob band (25–29) — VERIFIED alignment.

## Sequence flow (from `Data/scripts/quests/etc/etc2i0.lua`, VERIFIED)

- `SEQ_ACCEPT`: Patrick `QFLAG_TALK`; offer delegate `processEventPatrickStart`;
  1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Patrick re-talk → `processEvent000`. `onKillBNpc` (SEQ_000 +
  class 2101403) → `IncCounter` → 50041; at >= 4 → 25225 → SEQ_001.
- `SEQ_001`: Patrick → `processEvent010` + `sqrwa(1620, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: `getJournalInformation` returns kill counter.
  Markers 11101901 area / 11101902 Patrick — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventPatrickStart`, `processEvent000`, `processEvent010`,
`sqrwa` (exp 1620).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3010009 x12 + 1620 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_KILLS >= OBJECTIVE_AMOUNT`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.

## Navmesh ground support (VERIFIED via `map_coordinates.py locate`)

- Zone 157, spawn `(-899.332, -16.353, -2062.338)`: 29 recorded points in
  the 30-unit selection; nearest recorded `(-899.2, -16.3, -2062.9)` at
  0.6 yalms, Y within 0.1 of spawn Y; 5 same-family mob rows in selection.
- Verdict: STRONG ground context. Spawn Y still stands as authored SQL
  (samples are context, not a heightmap). No supplemental snapshot covers
  zone 157 (premerge set has none) — recorded here as checked, not missing.
