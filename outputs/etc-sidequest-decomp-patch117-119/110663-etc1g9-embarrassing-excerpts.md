# 110663 — Embarrassing Excerpts (Etc1g9)

- Patch family: patch_1_17a (Etc sidequests). SQL: level 30, no prereq.
- Availability: commented out,
  `Implemented - open-world fight + mob kill/drop (Etc1g9)`.
- Quest giver: Lonsygg 1000951 (2 static rows; canonical `lonsygg` @
  zone 155, `162.79, -1.48, -1153.32`) — VERIFIED.
- Objective: kill Opo-Opos, BNPC class 2100503, x5.
  Objective item display: 11000160 (message 25226). Item row VERIFIED present.
- Chain role: SQL prereq OF 110664 (A Forbidden Love) — VERIFIED
  (`gamedata_quests.sql`: 110664 prereq 110663).

## Kill-target verdict: PRESENT

- Mob types VERIFIED: 13 `opo-opo` rows for BNPC 2100503, incl. row 1206
  levels 21–24.
- Spawns VERIFIED: 29 `opo-opo` rows, zone 154 South Shroud, e.g.
  `opo_opo_154_1` `(929.175, -11.938, 574.104)` on mob type 1206.
- Level note (INFERRED observation, not a bug): quest level 30 vs mob band
  21–24. Under-level quest mobs are an authored retail pattern; spawns and
  counts are untouched.

## Sequence flow (from `Data/scripts/quests/etc/etc1g9.lua`, VERIFIED)

- `SEQ_ACCEPT`: Lonsygg `QFLAG_TALK`; offer delegate
  `processEventLonsyggStart`; 1 → `AcceptQuest` → SEQ_000.
- `SEQ_000`: Lonsygg re-talk → `processEvent005_2`. `onKillBNpc`
  (SEQ_000 + class 2100503) → `IncCounter` → 25226; at >= 5 → 25225 → SEQ_001.
- `SEQ_001`: Lonsygg → `processEvent010` + `sqrwa(2661, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: kill counter. Markers 11066301 area / 11066302 Lonsygg —
  INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventLonsyggStart`, `processEvent005_2`, `processEvent010`,
`sqrwa` (exp 2661).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Currency 1000013 x20 + 2661 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → colon form.
- FIXED: overkill guard (early return at `COUNTER_QUESTITEM >= 5`).
- Verified safe, no change: class/seq gating; single `CompleteQuest`;
  `UpdateENPCs`/`EndEvent` on all talk paths.

## Navmesh ground support (VERIFIED via `map_coordinates.py locate`)

- Zone 154 South Shroud, native page 2400. Live recording
  `Data/quicknavmesh/zone_154.tsv` (3,860 nodes).
- Spawn `opo_opo_154_1` `(929.175, -11.938, 574.104)`: 13 recorded points
  in selection; nearest recorded `(929.2, -11.9, 574.1)` at 0.1 yalms with
  matching Y; 1 same-family mob row in selection.
- Verdict: STRONG ground context (nearest sample effectively on the spawn).
  Spawn Y still stands as authored SQL. Supplemental premerge snapshot for
  zone 154 (1,435 additional XYZ) NOT merged per source-isolation rules.
