# 110643 — Fishing for Answers (Etc2l0)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 25, no prereq.
- Availability: commented out,
  `Implemented - open-world fight + mob kill/drop (Etc2l0)`.
- Quest giver: Robairlain 1000050.
  Spawn VERIFIED (`robairlain` @ zone 230, `-617.1, 11.84, 261.67`).
- Objective: kill Giant Crabs, BNPC class 2107601, x5
  (display 3107601, message 50041).

## Kill-target verdict: PRESENT

- Mob types VERIFIED: 5 `giant_crab` rows for BNPC 2107601 — bands 25–28
  (row 1065), 26–30, 20–25, 25–29, 30–34.
- Spawns VERIFIED: 48 `giant_crab` rows, zones 129/130, e.g.
  `giant_crab_129_1` `(129, -1616.68, 5.494, -636.763)` on mob type 1065.
- Quest level (25) meets the 25–28 band — VERIFIED alignment.

## Sequence flow (from `Data/scripts/quests/etc/etc2l0.lua`, VERIFIED)

- `SEQ_ACCEPT`: Robairlain `QFLAG_TALK`; offer delegate
  `processEventEadbertStart` (retail copy/paste naming, preserved verbatim);
  1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Robairlain re-talk → `processEvent000`. `onKillBNpc`
  (SEQ_000 + class 2107601) → `IncCounter` → 50041; at >= 5 → 25225 → SEQ_001.
- `SEQ_001`: Robairlain → `processEvent005` + `sqrwa(1891, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: no `getJournalInformation` (counter via 50041 messages only).
  Markers 11064301 area / 11064302 Robairlain — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventEadbertStart`, `processEvent000`, `processEvent005`,
`sqrwa` (exp 1891).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 3940007 x50 + 1891 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_KILLS >= OBJECTIVE_AMOUNT`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.

## Navmesh ground support (VERIFIED via `map_coordinates.py locate`)

- Zone 129 Western La Noscea, native page 200. Live recording
  `Data/quicknavmesh/zone_129.tsv` (3,732 nodes).
- Spawn `giant_crab_129_1` `(-1616.68, 5.494, -636.763)`: 4 recorded points
  in the 30-unit selection; nearest node 713
  `(-1631.612, 44.097, -656.581)` at 24.8 yalms; 4 same-family mob rows
  (incl. a second crab cluster at Y ~43.7) in selection.
- Verdict: CONTEXT ONLY — nearest recorded point is ~25 yalms out and on a
  different elevation band. Spawn Y stands as authored SQL; no heightmap
  claim. Supplemental premerge snapshot for zone 129 exists (0 additional
  XYZ — checked, nothing to add).
