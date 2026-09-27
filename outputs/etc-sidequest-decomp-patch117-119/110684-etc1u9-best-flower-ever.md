# 110684 — Best Flower Ever (Etc1u9)

- Patch family: patch_1_17 (Etc sidequests). SQL: level 10, no prereq.
- Availability: commented out, `Partially implemented - instance (Etc1u9)`.
- Quest giver: Sasapano, native 1400140 / actor 1001317.
  Actor spawn VERIFIED (`server_eventnpc_spawn_locations.sql`:
  `sasapano` @ zone 171, `1134.54, 312.193, -1127.78`).
- Objective: kill Rabid Dodos, actor 2202008, x6 (display 3202008,
  message 50041). NOTE: despite the `instance` availability tag, the Lua is
  a pure open-world kill quest with no instance/push surface — tag-vs-code
  mismatch recorded below.

## Kill-target verdict: PRESENT (code reads as complete kill quest)

- Mob type VERIFIED: row 1363 `rabid_dodo` BNPC 2202008, levels 10–10
  (`server_battlenpc_mob_types.sql`).
- Spawns VERIFIED: 9 `rabid_dodo_171_*` rows, zone 171 Eastern Thanalan,
  e.g. `rabid_dodo_171_1` `(1312.609, 247.788, -1026.482)`.
- Quest level (10) matches mob level (10) — VERIFIED alignment.

## Sequence flow (from `Data/scripts/quests/etc/etc1u9.lua`, VERIFIED)

- `SEQ_ACCEPT`: both Sasapano variants `QFLAG_TALK`; delegate
  `processEventSasapanoStart`; 1 → `AcceptQuest` → `onStart` (counter reset)
  → SEQ_000.
- `SEQ_000`: Sasapano re-talk → `processEvent000`. `onKillBNpc` (SEQ_000 +
  class 2202008) increments with CLAMP (pre-existing: caps at 6, writes back)
  → 50041 message; at >= 6 → 25225 → SEQ_001 + `UpdateENPCs`.
- `SEQ_001`: Sasapano → `processEvent005` + `sqrwa(300, 1, 1, 9)` →
  single `CompleteQuest`.
- Journal: SEQ_000 counter (capped display) / SEQ_001 flag.
  Markers 11068401 area / 11068402 Sasapano — INFERRED coordinates.

## Delegates (VERIFIED callsites; DAT scenes unverified)

`processEventSasapanoStart`, `processEvent000`, `processEvent005`,
`sqrwa` (exp 300).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

5000 gil + item 8081016 x1 + 300 exp. Lua `sqrwa` exp matches SQL.

## Loophole audit (implementation pass)

- Verified safe, no change: colon-form calls throughout (no dot bugs found);
  clamp guard already bounds the counter (equivalent to the overkill-guard
  pattern applied to sibling quests); wrong-mob/seq gating; single
  `CompleteQuest`; `UpdateENPCs`/`EndEvent` on all talk paths.
- Tag-vs-code mismatch (INFERRED, needs owner review): availability says
  `instance`, but the script has no 109xxxx objective, no encounter handoff,
  and a fully supported open-world kill target. Either the tag is stale or a
  retail instanced leg is unrepresented. No code change made on this basis;
  quest left disabled per instructions.

## Navmesh ground support (VERIFIED via `map_coordinates.py locate`)

- Zone 171 Eastern Thanalan, native page per `maps --zone 171`.
  Spawn `rabid_dodo_171_1` `(1312.609, 247.788, -1026.482)`: 1 recorded
  point in the 30-unit selection, nearest at 30.0 yalms (selection edge).
- Verdict: MARGINAL context only. Spawn Y stands as authored SQL; nearby
  sample heights are context, not a heightmap. Supplemental premerge snapshot
  for zone 171 exists (511 additional XYZ) but was NOT merged, per
  source-isolation rules.
