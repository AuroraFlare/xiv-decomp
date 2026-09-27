# 110772 — Letting Out Orion's Belt (Wld0l2)

- Patch family: patch_1_17a (Limsa Lominsa world quests). SQL: level 10, no prereq — VERIFIED (`gamedata_quests.sql:340`).
- Quest giver / turn-in: Ahldskyf (Captain of trading ship Orion), ENPC 1000332 (display 1600019, PopulaceStandard) — VERIFIED in `gamedata_actor_class.sql`.
- Public spawn VERIFIED: `ahldskyf@zone230 -804.94, 8, 243.25` (Limsa Lominsa).
- Objective: talk to 4 gourmands, then return. No combat, no chocobo/escort — VERIFIED (full file read).
- Gourmands (class IDs + spawns VERIFIED):
  - F'zhumii 1000226 (display 1900053) @ `zone133 -462.43, 20.76, 178.16`
  - Shoshoma 1000334 (display 1500044) @ `zone230 -566.26, 19.83, 279.8`
  - Daca Jinjahl 1000202 (display 1900072) @ `zone230 -624.77, 4.25, 354.05` (plus a `man0l1_fsh_daca_jinjahl` private-area instance row — same XYZ, separate lifecycle, untouched)
  - Aentfoet 1000064 (display 1600002) @ `zone230 -512.42, 42.3, 39.5`
- Header comment `Notes: Rewards 200 gil` is STALE — actual SQL-backed rewards are 5000 gil + Hempen Kecks + 300 exp (same staleness class as group B's `wld0g2` header; FIXED in Part 2 to the SQL values).

## Sequence flow (from `Data/scripts/quests/wld/wld0l2.lua`, VERIFIED)

- `SEQ_ACCEPT` (65535): Ahldskyf `QFLAG_TALK`. Talk → `processEventAhldskyffStart`; return 1 → `AcceptQuest` → `onStart` → `SEQ_000`.
- `SEQ_000`: `onStateChange` registers Ahldskyf (no flag) plus each gourmand with `QFLAG_TALK` iff its flag is unset, else `QFLAG_NONE` — completed gourmands lose their talk marker. VERIFIED.
- `onTalk` per gourmand: first talk → `SetFlag(i)`, `incCounter = true`, first-time delegate (`processEvent000` F'zhumii / `005` Shoshoma / `010` Daca Jinjahl / `015` Aentfoet). Re-talk → `_1` variant (`000_1`, `005_1`, `010_1`, `015_1`), no flag/counter change. Ahldskyf mid-quest → `processEventAhldskyffStart_1` reminder.
- Counter block: only when `incCounter`: `IncCounter(0)` → attention 51063 (`... of 4`); then `seq000_checkCondition(data)` (all 4 flags) → attention 25225 (objectives complete) → inner `UpdateENPCs` (band-aid for a `QFLAG_TALK` refresh issue, redundant with trailing call — harmless, left as-is) → `StartSequence(SEQ_001)`.
- `SEQ_001`: Ahldskyf `QFLAG_REWARD`. Talk → `processEvent020` + `sqrwa(300, 1, 1, 9)` → `CompleteQuest`. Gourmand talks in SEQ_001 are not ENPC-flagged and hit no branch (silent `EndEvent`) — no change; C# `IsQuestENPC` gating means they rarely reach the script.
- Journal markers: SEQ_000 returns only un-talked gourmands' markers (11110101–11110104), hiding completed ones — VERIFIED in code; SEQ_001 returns Ahldskyf marker (11110105). Coordinates authored, no DAT rows — INFERRED.
- Journal text (DAT, VERIFIED): `xtx/journalxtxSea:202` SEQ_000 (take flour-bread sample baked by the ship's cook to convince the Orion's owner re: Radz-at-Han sale), `:203` SEQ_001, `:201` completion; references item 11000176 = Fishtack (`gamedata_items.sql` DummyItem VERIFIED — odd name, recorded as-is from DAT).

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventAhldskyffStart`, `processEventAhldskyffStart_1`, `000`/`000_1`, `005`/`005_1`, `010`/`010_1`, `015`/`015_1`, `020`, `sqrwa` (exp 300).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql:333-335`)

5000 gil + Hempen Kecks (8050609 VERIFIED) x1 + 300 exp. Lua `sqrwa` exp 300 matches.

## Accept-path verdict — `SEQ_ACCEPT` + offer-NPC CORRECT, no change

- File already uses `sequence == SEQ_ACCEPT and classId == AHLDSKYF` — the family-correct form (matches `wld0u1`, `wld0g2`). Post-complete `SEQ_COMPLETED` cannot re-fire the offer.
- Already uses colon `npc:GetActorClassId()` — correct, no change.

## Re-talk / double-count audit (VERIFIED correct, no change)

- Repeat talks cannot double-count: flag check gates both `SetFlag` and `incCounter`; counter increments at most 4 times.
- `seq000_checkCondition` requires all 4 flags, not the counter value, so a desynced counter alone cannot complete the quest.
- Abandon/re-accept resets flags+counter via engine fresh `QuestData` (`Quest.cs:349-356`).
- Reward single-claim via engine `CompleteQuest` slot guard (`Player.cs:6096-6142`).
- `UpdateENPCs`/`EndEvent` on every talk path — VERIFIED.

## Open gap (INFERRED, not changed)

- Retail turn-in text (`quest_dialogue_text_index.csv`, `processEvent020`) contains "Ah well, I suppose three of four is not that bad..." — suggesting retail may have had a partial-completion (3-of-4) branch or conditional flavor. Local logic requires all 4 flags. The recovered retail client Lua path cited by the atlas (`tools/outputs/lpb/decomp_more_20260617/.../wld0l2.lua`) no longer exists in-repo, so no sequence proof is available. Behavior left at all-4; needs retail sequence recovery before any change.
