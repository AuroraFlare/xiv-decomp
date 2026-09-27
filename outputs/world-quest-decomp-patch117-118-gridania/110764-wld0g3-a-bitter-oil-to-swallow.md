# 110764 — A Bitter Oil to Swallow (Wld0g3)

- Patch family: patch_1_18 (Gridania world quests). SQL: level 17, no prereq.
- Quest giver: Eugenaire, ENPC 1001190, spawn zone 206 (Gridania)
  `-70.88, 5.104, -1231.34` — VERIFIED.
- Objective: kill Oilbugs, BNPC class 2103910, x8.
  Objective item display: 11000302 `Scarlet Oil` — VERIFIED.
- Mob profile — VERIFIED (`server_battlenpc_mob_types.sql` line 434):
  mob type 1204 `oilbug`, BNPC 2103910, levels 17–19.
  Open-world spawns — VERIFIED: 14 rows, zone 154 South Shroud
  (`oilbug_154_1..14`, x≈517–617, z≈1030–1083).
  (Old atlas row said `no_mob_type` for this BNPC — superseded; type 1204
  exists with spawns. VERIFIED.)
  No chocobo involvement; full open-world mob kills, no placeholders.

## Sequence flow (from `Data/scripts/quests/wld/wld0g3.lua`, VERIFIED)

- `SEQ_ACCEPT` → Eugenaire `QFLAG_TALK` → `processEventEugenaireStart`
  → accept → `StartSequence(SEQ_000)`.
- `SEQ_000`: Eugenaire re-talk → `processEvent_000` reminder.
- `onKillBNpc`: class + seq check → `IncCounter(0)` → 25226 per kill;
  at >= 8 → 25225 → `StartSequence(SEQ_001)`.
- `SEQ_001`: Eugenaire → `processEvent_010`, `processEvent_010_1`,
  `processEvent_020`, `processEvent_030` (4-part turn-in) +
  `sqrwa(REWARD_EXP=960, 1, 1, 9)` → `CompleteQuest`.
- Journal: counter via `getJournalInformation`; markers
  `MRKR_OILBUG_AREA` (11120202) / `MRKR_EUGENAIRE` (11120201), authored —
  INFERRED positions.

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventEugenaireStart`, `processEvent_000`, `processEvent_010`,
`processEvent_010_1`, `processEvent_020`, `processEvent_030`, `sqrwa`.

## Rewards — VERIFIED (`gamedata_quest_rewards.sql`)

Item 8031227 x1 + 960 exp. Lua `REWARD_EXP` (960) matches SQL exp.

## Loophole audit (implementation pass)

- `npc:GetActorClassId()` colon form already correct — no change.
- FIXED: overkill guard in `onKillBNpc` (early return at counter >= 8).
- Verified safe, no change: wrong mobs ignored; post-complete kills
  ignored; abandon/re-accept reset (engine); single-claim rewards (engine);
  `UpdateENPCs`/`EndEvent` on every talk path; `StartSequence` pushes
  state engine-side.

## Navmesh ground support (VERIFIED 2026-09-27 via `map_coordinates.py locate`)

- Zone 154 South Shroud, native page 2400. Live recording `Data/quicknavmesh/zone_154.tsv` (3,860 nodes, sha256 `d81b2ed0…`).
- Spawn 1 `(607.688, -11.462, 1072.542)` cell (37,48): 34 recorded points inside the 30-unit selection; recorded node 81 sits at the exact spawn XYZ (distance 0.00, identical Y). Three oilbug rows in selection.
- Strongest ground support of the five kill quests: exact-node match, not proximity inference.
