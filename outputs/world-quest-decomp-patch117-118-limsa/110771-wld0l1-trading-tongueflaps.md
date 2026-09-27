# 110771 — Trading Tongueflaps (Wld0l1)

- Patch family: patch_1_17 (Limsa Lominsa world quests). SQL: level 5, no prereq — VERIFIED (`gamedata_quests.sql:339`).
- Quest giver / turn-in: Sweetnix Rosycheeks, ENPC 1001573 (display 2500001, `/Chara/Npc/Populace/PopulaceStandard`, talkDefault) — VERIFIED in `gamedata_actor_class.sql`.
- Public spawn VERIFIED (`server_eventnpc_spawn_locations.sql`): `sweetnix_rosycheeks@zone133 -477.8, 32, 168.21` rot -2.49.
- Objective: talk to Ryssfloh, then return. No combat, no item, no chocobo/escort — VERIFIED (full file read; no chocobo/escort/chocobo-rental references).
- Middleman: Ryssfloh, ENPC 1000359 (display 1600154, PopulaceStandard) @ `ryssfloh@zone128 58.78, 46.1, -12.45` — VERIFIED. Journal places him at Camp Bearded Rock (bow-wielding Yellowjacket).

## Sequence flow (from `Data/scripts/quests/wld/wld0l1.lua`, VERIFIED)

- `SEQ_ACCEPT` (= 65535 = `SEQ_NOT_STARTED`, `Data/scripts/quest.lua:17`): Sweetnix `QFLAG_TALK`. Talk → `processEventSweetnixStart`; return 1 → `AcceptQuest` → `onStart` → `StartSequence(SEQ_000)`.
- `SEQ_000`: Sweetnix (no flag) + Ryssfloh `QFLAG_TALK`.
  - Sweetnix re-talk → `followEvent005` (reminder, no state change).
  - Ryssfloh → `processEvent010` → `StartSequence(SEQ_001)`.
- `SEQ_001`: Ryssfloh (no flag) + Sweetnix `QFLAG_REWARD`.
  - Sweetnix → `processEvent020` + `sqrwa(200, 1, 1, 9)` → `CompleteQuest`.
  - Ryssfloh re-talk → `followEvent015`, then redundant `StartSequence(SEQ_001)` (no-op, same sequence — harmless, matches `wld0u1.lua` family pattern, left as-is).
- Journal markers: SEQ_000 → 11110001 (Ryssfloh); SEQ_001 → 11110002 (Sweetnix). Marker coordinates authored, no DAT rows — INFERRED.
- Journal text (DAT, VERIFIED in `quest_dat_journal_index.csv` / `quest_journal_coverage_index.csv`): `xtx/journalxtxSea:199` SEQ_000 ("goblin Sweetnix is willing to pay you handsomely to go and speak with a bow-wielding Yellowjacket named Ryssfloh stationed at Camp Bearded Rock"), `:200` SEQ_001 (Ryssfloh divulged camp/duties/discontent over thalassocratic funding cuts to the First Squadron Second Levy Infantry; asked secrecy), `:198` completion. No Lua journal getter — text is sequence-driven from DAT — VERIFIED (only `getJournalMapMarkerList` defined).

## Delegates (literal callsites VERIFIED; DAT scene IDs unverified)

`processEventSweetnixStart`, `followEvent005`, `processEvent010`, `processEvent020`, `followEvent015`, `sqrwa` (exp 200).

## Rewards — VERIFIED (`gamedata_quest_rewards.sql:330-332`)

2500 gil + Hempen Acton (8030819, `gamedata_items.sql` VERIFIED) x1 + 200 exp. Lua `sqrwa` exp 200 matches. `sqrwa` is display-only; `CompleteQuest` auto-grants SQL rewards (engine `Player.cs:6096-6142`).

## Accept-path verdict — `not player:HasQuest(quest)` INCORRECT, fixed in Part 2

- File used offer guard `npcClassId == SWEETNIX and not player:HasQuest(quest)`. After `CompleteQuest` the quest leaves the journal (`questScenario[slot] = null`) while `currentSequence = SEQ_COMPLETED`, so `HasQuest` is false again and a post-complete talk re-fires the offer event → repeat-accept bypass of the one-time/repeatable config. `seq == SEQ_ACCEPT` (65535) cannot re-fire post-complete. Sibling `wld0u1.lua`/`wld0l2.lua` use the `SEQ_ACCEPT` form — CORRECT.
- Abandon/re-accept is safe under either form: `OnAbandon` resets to `SEQ_NOT_STARTED` + `data = null` (`Quest.cs:366-372`), and `OnAccept` builds fresh `QuestData` (`Quest.cs:349-356`).
- Reward single-claim is engine-guaranteed: second `CompleteQuest` finds no journal slot → no-op; full-inventory failure returns before completion (retry-safe).

## Other fixes applied (Part 2)

- `npc.GetActorClassId()` (dot) → `npc:GetActorClassId()` (colon). Colon is the proven form (234 repo callsites incl. same-family `wld0l2`/`wld0g2`); dot drops `self` under MoonSharp userdata binding. Behavior-neutral if the binding tolerated dot, a real fix if not.
- No chocobo involvement confirmed; no new steps added — walk-and-talk preserved with full NPC coverage (both ENPCs handled in both sequences).
- `UpdateENPCs`/`EndEvent` already on every path (offer path returns after `EndEvent`; `OnAccept`→`onStart` publishes markers) — VERIFIED, no change.
