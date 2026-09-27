# 110774 — Sniffing Out a Profit (Wld0l4)

- Patch family: patch_1_18 (Limsa Lominsa world quests). SQL: level 37 — VERIFIED (`gamedata_quests.sql:342`). Prereq: header comment requires "Letting Out Orion's Belt" (Wld0l2), but SQL `prerequisite` was 0 — MISMATCH, fixed in Part 2 to 110772.
- Quest giver / turn-in: Ahldskyf, ENPC 1000332 (display 1600019) @ `ahldskyf@zone230 -804.94, 8, 243.25` — same public spawn as Wld0l2 — VERIFIED.
- Objective: travel to Halfstone settlement, see Faine, then return. No combat, no chocobo/escort — VERIFIED (full file read).
- Contact: Faine, ENPC 1001608 (display 1300151, PopulaceStandard) @ `faine@zone129 -1801, 60.2, -928.3` (Halfstone via De Nevelle Westroad) — VERIFIED.
- Story (retail dialogue text, VERIFIED in `quest_dialogue_text_index.csv`): the Orion sold La Noscean flour in Radz-at-Han, but the owner chartered five more ships that flooded the market; Ahldskyf needs new cargo. Halfstone's grapes/oranges are pre-sold, but Faine gifts Althyk Lavender (deep roots vs. salt wind; useless locally) — Ahldskyf realizes Thavnairian nobles pay absurd coin for fragrances and resolves to buy every sprig.
- Chain note: the offer dialogue explicitly recalls the flour shipment ("the kindly adventurer who assisted me"), corroborating the Wld0l2 → Wld0l4 prerequisite narratively as well as structurally.

## Sequence flow (from `Data/scripts/quests/wld/wld0l4.lua`, VERIFIED)

- `SEQ_ACCEPT` (65535): Ahldskyf `QFLAG_TALK`. Talk → `processEventAhldskyffStart` (offer widget with decline branch "It is not for us to question the will of the Twelve..."); return 1 → `AcceptQuest` → `onStart` → `SEQ_000`.
- `SEQ_000`: Ahldskyf (no flag) + Faine `QFLAG_TALK`.
  - Ahldskyf re-talk → `processEvent000` (Halfstone directions reminder, no state change).
  - Faine → `processEvent005` → `StartSequence(SEQ_001)`.
- `SEQ_001`: Faine (no flag) + Ahldskyf `QFLAG_REWARD`.
  - Ahldskyf → `processEvent010` + `sqrwa(3100, 1, 1, 9)` → `CompleteQuest`.
  - Faine re-talk → `processEvent005_2`, then redundant `StartSequence(SEQ_001)` (no-op — harmless, family pattern, left as-is).
- Journal markers: SEQ_000 → 11110301 (Faine); SEQ_001 → 11110302 (Ahldskyf). Coordinates authored, no DAT rows — INFERRED.
- Journal text (DAT, VERIFIED): `xtx/journalxtxSea:227` SEQ_000 (Halfstone via De Nevelle Westroad), `:228` SEQ_001, `:226` completion; references item 11000304 = Althyk Lavender (`gamedata_items.sql` DummyItem VERIFIED — matches the gifted flower).

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventAhldskyffStart`, `processEvent000`, `processEvent005`, `processEvent005_2`, `processEvent010`, `sqrwa` (exp 3100).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql:338-339`)

Grade 4 Dark Matter (10013004 VERIFIED) x2 + 3100 exp. Lua `sqrwa` exp 3100 matches.

## Accept-path verdict — `not player:HasQuest(quest)` INCORRECT, fixed in Part 2

- Same post-complete re-offer loophole as Wld0l1/Wld0l3. Fixed to `npcClassId == AHLDSKYF and seq == SEQ_ACCEPT` (+ `not player:HasQuest(quest)` belt-and-braces guard where needed — kept minimal per family standard).
- Prereq chain now enforced at the engine layer: `gamedata_quests.prerequisite 0 → 110772` (mirrors sibling chains `110756→110754`, `110765→110762`). Enforcement path VERIFIED: `PrereqBitfield → AvailableQuestsBitfield → CanAcceptQuest` (`QuestStateManager.cs:204-280,604-616`; `Player.cs:5981-5990`). Note both quests are currently offer-disabled in `quest_availability.lua`, so the chain activates when enabled.

## Other fixes applied (Part 2)

- `npc.GetActorClassId()` (dot) → `npc:GetActorClassId()` (colon) — proven form.
- Header comment `SEQ_001 = 1; -- Talk to Faine.` corrected to `-- Return to Ahldskyf.` (was a copy of the SEQ_000 line; behavior unchanged).
- No chocobo involvement confirmed; walk-and-talk preserved with full NPC coverage.
- `UpdateENPCs`/`EndEvent` already on every path — VERIFIED, no change.
