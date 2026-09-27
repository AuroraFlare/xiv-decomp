# 111807 By Fire Reborn — `Com0u7` (Immortal Flames enlistment, rank 11)

- Story Lv25, patch 1.19 | Offer: First Flame Lieutenant Aubrey 1500198,
  Hall of Flames zone 233 (169.0, 0.0, -174.7, rot -1.5; spawn id 2817)
  | Availability: script complete, offer currently patch-gated OFF
  (`quest_availability.lua:349`, whole `patch_1_19` block commented)
- Lua: `Data/scripts/quests/com/com0u7.lua` — 2-line delegate to shared
  `InitGrandCompanyEnlistmentQuest("Com0u7")` (`gc_enlistment_quest.lua`).
  No per-quest logic, no template config. Matches sibling stubs
  `com0l7.lua`/`com0g7.lua` byte-for-shape.
- SQL prereq: 111806 Know Your Enemy (`gamedata_quests.sql` row 529);
  Lv25 gate; must hold NO company membership at offer
  (`Player.CanStartGrandCompanyEnlistmentQuest`: `gcCurrent == 0` and all
  three company ranks 0). Unlocks 111816 It Kills with Fire (Ul'dah, Lv30)
  and 111817 Prying Eyes (rows 538-539).
- Dialogue-only enlistment: one NPC (Aubrey), no items, no movers, no
  instance, no mobs, no chocobo surface. Effect: joins Immortal Flames
  (company 3) at rank 11 (Flame Private Third Class), 1,000 Flame Seals,
  1,080 EXP. Journal points at Second Flame Lieutenant Lannis 1001739
  (zone 233 (155.0, 0.0, -182.0), spawn id 2820) as the post-enlistment
  contact; Lannis is NOT interacted with in this quest.

## Sequence flow (VERIFIED: gc_enlistment_quest.lua + xtx_quest.csv row 500 + wikis + runtime tests)
- ACCEPT/offer Aubrey `processEventAubreyStart` (enlistment lecture + oath
  choice; numeric 1 + `AcceptQuest` advances; anything else closes,
  retryable) -> flag 21 accepted-choice persisted -> `TryJoinGrandCompany`
  (company 3, rank 11; idempotent retry) -> 1,000 Flame Seals (flag 22
  checkpoint) -> `processEventAubreyEnd(0,0)` closing widget ->
  1,080 EXP (flag 23) -> CompleteQuest. Journal 430 until done.
- Decline/cancel at offer widget: no transaction, quest stays open, EndEvent.

## Delegate events (VERIFIED: gc_enlistment_quest.lua CONFIGS.Com0u7 + onTalk)
Wired: `processEventAubreyStart` (offer/lecture + oath choice),
`processEventAubreyEnd` (closing, args 0, 0). No ambient/after-warp events.

## Actors/markers (VERIFIED: spawn SQL + map_coordinates zone 233 Hall of Flames)
Aubrey 1500198 @ zone 233 (169.0/0.0/-174.7) = map (1.93,1.21) cell (1,1):
matches wiki `Hall of Flames (1,1)` location. Lannis 1001739
@ zone 233 (155.0/0.0/-182.0) = map (1.79,1.14) cell (1,1), ~15.8 yalms
from Aubrey. Journal sheet `xtx/journalxtxWil` row 430 (DAT
`xtx_quest.csv:500`). NO native marker: `quest_marker.csv` has no 111807
row, so `getJournalMapMarkerList` correctly returns {} (marker deliberately
unresolved, not invented).

## Fight
None. No battle director, no waves, no aggro/leash/sync surface. Public-zone
dialogue; death/timeout/DC simply end the event; progress is flag-gated.
Chocobo/companion: N/A — no instance or squad battle; companion rules do not
apply to public dialogue (same surface class as Com0u2).

## Rewards (VERIFIED: script + gcseals.lua + Fandom + runtime tests)
Membership: company 3 at rank 11 via `TryJoinGrandCompany` (DB
`TryJoinGrandCompany` + `SynchronizeGrandCompanyProgression`; join runs
BEFORE the seal grant so the rank-11 cap of 10,000 already applies).
1,000 Flame Seals via `GrantGCQuestSealsOnce` — cap refusal returns false,
quest stays retryable, join is idempotent on retry. 1,080 EXP via
`GrantGCQuestExpOnce`. Both pay-once persisted (flags 22/23); interrupted
closing dialogue repays neither.

## Edge handling (VERIFIED: script + Player.cs + WorldManager.GcQuests.cs + tests)
Stale-continuation guard `CanContinueGrandCompanyQuestDialogue` binds player,
quest, quest-data and sequence before AND after each yield (both the
SEQ_ACCEPT offer path and the seq-0 resume path); abandon clears flags with
quest data; non-repeatable story quest; zero-membership gate at offer AND at
join (second check inside `TryJoinGrandCompany` lock); completed quest cannot
reopen dialogue. Cancel matrix (Nil/false/true/0/-1/"1"), failed accept,
failed join, seal-cap, interrupted closing, and failed completion are all
covered by `grand-company-runtime-tests` (enlistment route u/111807).
No chocobo/instance/level-sync handling needed (no battle).

## Open gaps
- Offer disabled: 111807 (with prereqs 111805/111806) is commented out in
  `quest_availability.lua` patch_1_19 block. Enabling is a patch-gating
  decision, not taken here.
- Live-client acceptance: native oath-widget lifecycle, cap-refusal text,
  pay-once closing retry.
- Zone 233 has no navmesh recording; Aubrey/Lannis Y=0 is catalog height.
- Retail scene/cutscene numbers and Lannis follow-up quest binding unrecovered.
