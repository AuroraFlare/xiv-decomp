# 110773 — Sour Grapes (Wld0l3)

- Patch family: patch_1_18 (Limsa Lominsa world quests). SQL: level 17, no prereq — VERIFIED (`gamedata_quests.sql:341`).
- Quest giver / turn-in: Syzfrusk (winemaker), ENPC 1001306 (display 1600198, PopulaceStandard) — VERIFIED in `gamedata_actor_class.sql`.
- Public spawn VERIFIED: `Q_syzfrusk@zone130 583.933, 54.165, -1199.93` (Wineport).
- Objective: visit Lolojo at Red Rooster Stead, then return. No combat, no chocobo/escort — VERIFIED (full file read).
- Contact: Lolojo, ENPC 1001603 (display 1500063, PopulaceStandard) @ `lolojo@zone130 1078.7, 54.5, -451.9` — VERIFIED (south down La Thagran Eastroad per dialogue).
- Story (retail dialogue text, VERIFIED in `quest_dialogue_text_index.csv`): kobolds stripped every vine after harvest; pirate patrols that used to protect the stead are gone because the Admiral's yellowjackets rounded up local pirates; Lolojo also lost dodo eggs, tools, scarecrows to fire; Syzfrusk rants at the turn-in but pays.

## Sequence flow (from `Data/scripts/quests/wld/wld0l3.lua`, VERIFIED)

- `SEQ_ACCEPT` (65535): Syzfrusk `QFLAG_TALK`. Talk → `processEventOffersStart` (offer widget with accept/decline branches in retail text); return 1 → `AcceptQuest` → `onStart` → `SEQ_000`.
- `SEQ_000`: Syzfrusk (no flag) + Lolojo `QFLAG_TALK`.
  - Syzfrusk re-talk → `processEventFree` (directions reminder, no state change).
  - Lolojo → `processlolojoEvent` → `StartSequence(SEQ_001)`.
- `SEQ_001`: Lolojo (no flag) + Syzfrusk `QFLAG_REWARD`.
  - Syzfrusk → `processEventClear` + `sqrwa(841, 1, 1, 9)` → `CompleteQuest`.
  - Lolojo re-talk → `processlolojoEventFree`, then redundant `StartSequence(SEQ_001)` (no-op — harmless, matches family pattern, left as-is).
- Journal markers: SEQ_000 → 11110201 (Lolojo); SEQ_001 → 11110202 (Syzfrusk). Coordinates authored, no DAT rows — INFERRED.
- Journal text (DAT, VERIFIED): `xtx/journalxtxSea:224` SEQ_000 (shipment missing; ask Lolojo), `:225` SEQ_001 (kobold theft; give Syzfrusk the bad news), `:223` completion. No Lua journal getter — sequence-driven from DAT — VERIFIED.

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventOffersStart`, `processEventFree`, `processlolojoEvent`, `processEventClear`, `processlolojoEventFree`, `sqrwa` (exp 841).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql:336-337`)

Leather Pot Helm (8011517 VERIFIED) x1 + 841 exp. Lua `sqrwa` exp 841 matches. (Atlas `quest_cutscene_matrix_index.csv` shows a stale `sqrwa 200` row for this file — superseded by the VERIFIED literal `sqrwa(841, 1, 1, 9)` at line 74.)

## Accept-path verdict — `not player:HasQuest(quest)` INCORRECT, fixed in Part 2

- Same post-complete re-offer loophole as Wld0l1: after `CompleteQuest`, `HasQuest` is false while sequence is `SEQ_COMPLETED`, so the offer event can re-fire and `AcceptQuest` can re-add the quest outside the repeatable config. Fixed to `npcClassId == SYZFRUSK and seq == SEQ_ACCEPT` (family standard per `wld0u1`/`wld0l2`).
- Abandon/re-accept safe via engine fresh `QuestData`; reward single-claim via engine slot guard — VERIFIED, no changes needed.

## Other fixes applied (Part 2)

- `npc.GetActorClassId()` (dot) → `npc:GetActorClassId()` (colon) — proven form, see Wld0l1 doc.
- No chocobo involvement confirmed; walk-and-talk preserved with full NPC coverage.
- `UpdateENPCs`/`EndEvent` already on every path — VERIFIED, no change.
