# 111802 Kindling a Flame — `Com0u2` (Ul'dah GC opening, seal tutorial)

- Story Lv22 | Offer: First Flame Lieutenant Aubrey 1500198, Hall of Flames zone 233
  (169.0, 0.0, -174.7, rot -1.5; spawn id 2817) | Availability: implemented
- Lua: `Data/scripts/quests/com/com0u2.lua` (GC seal-tutorial pattern, shared
  `gc_reward_checkpoint` + `gcseals` helpers). No template config.
- SQL prereq: 111801 Career Opportunities (`gamedata_quests.sql` row 524);
  Lv22 gate; allegiance rechecked at offer (`GrandCompanyOpeningQuestRules`).
- Dialogue-only: one NPC, no items, no movers, no instance, no mobs, no
  chocobo surface. Next: 111803 Burning a Hole in One's Pocket (Rahz).

## Sequence flow (VERIFIED: com0u2.lua + xtx_quest.csv row 495 + wiki)
- ACCEPT Aubrey `processEventAUBREYStart` (result 1 accepts; anything else
  closes, retryable) -> 0 Aubrey `processEventAUBREYFinal` closing widget ->
  250 Flame Seals (company 3, checkpoint flag 22) + 1,100 EXP (flag 23) ->
  CompleteQuest. Single talk completes when accepted; journal 342 until done.
- Decline/cancel at either widget: no transaction, quest stays open, EndEvent.

## Delegate events (VERIFIED: com0u2.lua onTalk)
Wired: `processEventAUBREYStart` (offer/seal lecture + join choice),
`processEventAUBREYFinal` (closing, args 0, 0). No ambient/after-warp events.

## Actors/markers (VERIFIED: spawn SQL + map_coordinates zone 233 p50)
Aubrey 1500198 @ zone 233 (169.0/0.0/-174.7) = map (1.93,1.21) cell (1,1):
matches forum `<1,1> Hall of Flames` hint. Rahz 1500201 adjacent
(169.0/0.0/-177.3, 2.6 yalms): matches "Miqo'te standing just next to me".
Marker 11170003 (seq 0); journal sheet `xtx/journalxtxWil` row 342 (DAT).

## Fight
None. No battle director, no waves, no aggro/leash/sync surface. Public-zone
dialogue; death/timeout/DC simply end the event; progress is flag-gated.

## Rewards (VERIFIED: com0u2.lua + gcseals.lua + runtime tests)
250 Flame Seals via `GrantGCQuestSeals(company 3)` — cap refusal returns false,
quest stays retryable, nothing consumed. 1,100 EXP via `GrantGCQuestExpOnce`.
Both pay-once persisted (flags 22/23); interrupted closing dialogue repays
neither (regression: tutorial checkpoint precedes closing widget call).

## Edge handling (VERIFIED: script + gc_finalization_2026-09-17 + tests)
Stale-continuation guard `CanContinueGrandCompanyQuestDialogue` binds player,
quest, quest-data and sequence before AND after each yield; abandon clears
flags with quest data; non-repeatable story quest; company-3 allegiance gate;
completed quest cannot reopen dialogue. No chocobo/instance/level-sync/mount
handling needed (no battle). Seal-cap and failed-accept paths covered by
`grand-company-runtime-tests` (seal-tutorial route u/111802).

## Open gaps
- Live-client acceptance: native tutorial/widget lifecycle, seal-cap refusal
  text, pay-once closing retry (per gc_opening_quests_completion_2026-09-19).
