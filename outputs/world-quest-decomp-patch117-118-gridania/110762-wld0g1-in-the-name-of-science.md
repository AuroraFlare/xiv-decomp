# 110762 — In the Name of Science (Wld0g1)

- Patch family: patch_1_17 (Gridania world quests). SQL: level 10, no prereq.
- Quest giver: Marcette, ENPC 1001583, spawn zone 206 (Gridania)
  `22.84, 10.9, -1306.83` — VERIFIED (`server_eventnpc_spawn_locations.sql`).
- Objective: kill Sabletooth Spriggans, BNPC class 2106214, x4.
  Objective item display: 11000164 `Sable Tooth` — VERIFIED (`gamedata_items.sql`).
  Counter message 25226 `You obtain <item> (X of Y)` per kill.
- Mob profile — VERIFIED (`server_battlenpc_mob_types.sql` line 205):
  mob type 1004 `sabletooth_spriggan`, BNPC 2106214, levels 10–10.
  Open-world spawns — VERIFIED: 7 rows, zone 150 Central Shroud
  (`sabletooth_spriggan_150_1..7`, x≈250–269, z≈+2..−83).
  No chocobo involvement; full open-world mob kills, no placeholders.

## Sequence flow (from `Data/scripts/quests/wld/wld0g1.lua`, VERIFIED)

- `SEQ_ACCEPT` (offer): `onStateChange` sets Marcette `QFLAG_TALK`.
  `onTalk` Marcette → delegate `processEventAtellouneStart`; return 1 →
  `player:AcceptQuest(quest)` → engine `OnAccept` creates fresh `QuestData`
  and calls `onStart` → `StartSequence(SEQ_000)`.
- `SEQ_000` (kill): `onStateChange` clears Marcette flag, registers
  BNPC 2106214 as quest ENPC. Marcette re-talk → delegate `processEvent000_2`
  (progress reminder, no state change).
- `onKillBNpc`: only when `seq == SEQ_000` and class == 2106214.
  `IncCounter(0)` → 25226 message; at >= 4 → 25225 `Objectives complete!`
  → `StartSequence(SEQ_001)`.
- `SEQ_001` (turn-in): Marcette → `processEvent010` + `sqrwa(300, 1, 1, 9)`
  → `player:CompleteQuest(quest)` (SQL auto-grants gil/item/exp).
- Journal: `getJournalInformation` returns kill counter;
  markers `MRKR_SPRIGGAN_AREA` (11120002) in SEQ_000,
  `MRKR_MARCETTE` (11120001) in SEQ_001.
  Marker coordinates are authored (no DAT marker rows in atlas) — INFERRED.

## Delegates (all VERIFIED as literal callsites; DAT-side scene IDs unverified)

`processEventAtellouneStart` (accept), `processEvent000_2` (progress),
`processEvent010` (turn-in), `sqrwa` (reward screen, exp 300).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

2500 gil + item 8031514 x1 + 300 exp. Lua `sqrwa` exp (300) matches SQL exp.

## Loophole audit (implementation pass)

- FIXED: `npc.GetActorClassId()` dot-call → `npc:GetActorClassId()`
  (MoonSharp instance-method convention; matches Wld0g2/Wld0g3).
- FIXED: overkill guard — `onKillBNpc` returns early when counter already
  >= 4 before `IncCounter` (engine `IncCounter` is unbounded).
- Verified safe, no change: wrong mobs ignored (class check); post-complete
  kills ignored (seq check + engine `OnComplete` nulls data, SEQ_COMPLETED);
  abandon/re-accept resets (engine `OnAccept` builds fresh `QuestData`,
  `OnAbandon` nulls data); reward single-claim (engine `CompleteQuest`
  + `QuestAvailability.ShouldGrantCompletionRewards` repeat guard);
  `UpdateENPCs`/`EndEvent` on every talk path; `StartSequence` already
  pushes quest state engine-side so no extra update needed in `onKillBNpc`.
- Added `REWARD_EXP = 300` constant (was literal), matching Wld0g3 style.
  Value unchanged.

## Navmesh ground support (VERIFIED 2026-09-27 via `map_coordinates.py locate`)

- Zone 150 Central Shroud, native page 2000. Live recording `Data/quicknavmesh/zone_150.tsv` (7,030 nodes, sha256 `c2388186…`).
- Spawn 1 `(250.350, 3.646, 1.916)` cell (33,38): 40 recorded points inside the 30-unit selection; nearest node 3989 `(249.888, 3.883, 5.800)` at 3.91 yalms, Y within 0.3 of spawn Y. Two spriggan rows in selection.
- Spawn Y values stand as authored; nearby sample heights are context only, not a heightmap.
