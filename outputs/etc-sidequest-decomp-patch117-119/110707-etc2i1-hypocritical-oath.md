# 110707 — A Hypocritical Oath (Etc2i1)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 25, no prereq.
- Availability: commented out,
  `Implemented - open-world fight + mob kill/drop (Etc2i1)`.
- Quest giver: Arscelin 1001574.
  Spawn VERIFIED (`arscelin` @ zone 145, `2625, 174.724, 1329`).
- Objective: kill Antelope Does, BNPC class 2100314, x5.
  Objective item display: 11000177 (message 25226). Item row VERIFIED present.
- Code note: `OBJECTIVE_AMOUNT = 5` lacks a trailing semicolon
  (`etc2i1.lua` line 32). Harmless in Lua; left untouched (style-only).

## Kill-target verdict: PRESENT

- Mob types VERIFIED: 2 `antelope_doe` rows for BNPC 2100314 — levels
  20–22 (row 1205) and 40–43.
- Spawns VERIFIED: 46 `antelope_doe` rows, zones 153/154, e.g.
  `antelope_doe_153_1` `(153, -1633.124, -11.711, -749.259)`.
- Quest level (25) vs bands 20–22/40–43: the killable band near the quest
  level is the lower one — recorded as authored retail layout, not adjusted.

## Sequence flow (from `Data/scripts/quests/etc/etc2i1.lua`, VERIFIED)

- `SEQ_ACCEPT`: Arscelin `QFLAG_TALK`; offer delegate
  `processEventArscelinStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Arscelin re-talk → `processEvent000`. `onKillBNpc`
  (SEQ_000 + class 2100314) → `IncCounter` → 25226; at >= 5 → 25225 → SEQ_001.
- `SEQ_001`: Arscelin → `processEvent010` + `sqrwa(1620, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: kill counter. Markers 11102001 Arscelin / 11102002 antelope area
  (note reversed numbering vs siblings) — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventArscelinStart`, `processEvent000`, `processEvent010`,
`sqrwa` (exp 1620).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

12500 gil + 1620 exp. Lua `sqrwa` exp (1620) matches SQL exp. (Gil auto-grants
on `CompleteQuest`; no manual `AddGil` in Lua — correct, no double.)

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_QUESTITEM >= 5`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.

## Navmesh ground support (VERIFIED via `map_coordinates.py locate`)

- Zone 153, spawn `antelope_doe_153_1` `(-1633.124, -11.711, -749.259)`:
  **0 recorded points** in the 30-unit selection; nearest recorded
  `(-1939.5, 0.1, -891.2)` at ~338 yalms; 3 same-family mob rows in selection.
- Verdict: GROUND UNRESOLVED at this spawn. Spawn XYZ stands exactly as
  authored SQL; no height invented, no nearby sample borrowed. Supplemental
  premerge set has no zone-153 file (checked) — coverage is genuinely absent,
  not merely unmerged. This mirrors the standing `pending recorded ground`
  annotation used for sibling disabled kill quests.
