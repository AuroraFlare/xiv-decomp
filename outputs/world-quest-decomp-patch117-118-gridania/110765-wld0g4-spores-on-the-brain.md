# 110765 — Spores on the Brain (Wld0g4)

- Patch family: patch_1_18 (Gridania world quests).
  SQL: level 11, prereq 110762 (Wld0g1 chain) — VERIFIED
  (`gamedata_quests.sql` line 333).
- Quest giver: Marcette, ENPC 1001583 (same actor as Wld0g1), zone 206.
- Objective: kill Mature Funguars, BNPC class 2105916, x8.
  Objective item display: 11000301 `Mature Funguar Spore Sac` — VERIFIED.
- Mob profile — VERIFIED (`server_battlenpc_mob_types.sql` line 275):
  mob type 1074 `mature_funguar`, BNPC 2105916, levels 11–13.
  Open-world spawns — VERIFIED: 10 rows, zone 152 North Shroud
  (`mature_funguar_152_1..10`, x≈−1212..−1281, z≈−1622..−1671).
  No chocobo involvement; full open-world mob kills, no placeholders.

## Sequence flow (from `Data/scripts/quests/wld/wld0g4.lua`, VERIFIED)

- `SEQ_ACCEPT` → Marcette `QFLAG_TALK` → `processEventMarcetteStart`
  → accept → `StartSequence(SEQ_000)`.
- `SEQ_000`: Marcette re-talk → `processEvent000_2` reminder.
- `onKillBNpc`: class + seq check → `IncCounter(0)` → 25226 per kill;
  at >= 8 → 25225 → `StartSequence(SEQ_001)`.
- `SEQ_001`: Marcette → `processEvent010` + `sqrwa(500, 1, 1, 9)`
  → `CompleteQuest`.
- Journal: counter via `getJournalInformation`; markers
  `MRKR_FUNGUAR_AREA` (11120301) / `MRKR_MARCETTE` (11120302), authored —
  INFERRED positions. (Note swapped numbering vs Wld0g1; cosmetic only.)

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventMarcetteStart`, `processEvent000_2`, `processEvent010`, `sqrwa`.

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

5000 gil + item 8011815 x1 + 500 exp. Lua `sqrwa` exp (500) matches SQL.

## Prereq chain — VERIFIED

`gamedata_quests.sql` Wld0g4 row carries prereq 110762; engine enforces
completion-bit prerequisite. Wld0g1 completion therefore unlocks Wld0g4.

## Loophole audit (implementation pass)

- FIXED (critical): `npc.GetActorClassId()` dot-call → colon form.
  With the dot form no talk branch could match, soft-locking offer,
  progress and turn-in.
- FIXED: overkill guard in `onKillBNpc` (early return at counter >= 8).
- Added `REWARD_EXP = 500` constant (was literal), matching Wld0g3 style.
  Value unchanged.
- Verified safe, no change: wrong mobs ignored; post-complete kills
  ignored; abandon/re-accept reset (engine); single-claim rewards (engine);
  `UpdateENPCs`/`EndEvent` on every talk path.

## Navmesh ground support (VERIFIED 2026-09-27 via `map_coordinates.py locate` + `render`)

- Zone 152 North Shroud, native page 2200. Ten spawns form a trail `(-1211,-1621)` to `(-1281,-1665)`, authored Y 31-32 (coherent along the trail).
- Live recording `Data/quicknavmesh/zone_152.tsv` (6,589 nodes, sha256 `40ee8f66…`) is thin at the trail head: 2 points within 30 units of spawn 1 (nearest node 6234 at 29.70 yalms).
- Frozen snapshot `Data/quicknavmesh-evidence/quicknavmesh-20260924/zone_152.tsv` covers the trail: 33 points near the midpoint; node 6231 `(-1235.181, 31.243, -1656.614)` is 1.03 yalms from spawn 5 `(-1234.496, 31.275, -1655.845)` with matching Y. Sources are never merged; node IDs stay source-local.
- Native-client render (576 tiles, resource 30030) shows the trail on open green terrain with a recorded path passing through the cluster. Map artwork is context, not collision proof.
- No respawn/move needed: existing rows keep authored XYZ; snapshot proximity corroborates rather than replaces them. Live floor acceptance still open.
