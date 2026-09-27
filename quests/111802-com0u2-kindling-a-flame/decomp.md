# 111802 Kindling a Flame (Com0u2) — in-depth decomp

Immortal Flames opening quest 2 of 6, Story Lv22. Offer: First Flame
Lieutenant Aubrey (actor class 1500198) in the Hall of Flames, Ul'dah zone
233 (169.0, 0.0, -174.7, rot -1.5; spawn id 2817, uniqueId `flame_aubrey`).
Requires Lv22 + completed 111801 Career Opportunities (server gates;
`gamedata_quests.sql`: `(111802, 'Kindling a Flame', 'Com0u2', 111801, 22)`).
Provisional (non-binding) Flames membership; does not preclude other
companies' opening routes. Wiki: GamerEscape "Kindling a Flame" + Loremonger
dialogue transcript (seal lecture, join choice, Rahz pointer).

## Sequence / flags (server: Data/scripts/quests/com/com0u2.lua)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Talk to Aubrey | `processEventAUBREYStart`: join lecture + Yes/No; result 1 + `AcceptQuest` advances; any other result closes, no state change |
| 0 | Talk to Aubrey | Same NPC `QFLAG_TALK`/`QFLAG_REWARD`; accept path grants 250 Flame Seals (flag 22 checkpoint) then plays `processEventAUBREYFinal(0,0)`; after stale-guard recheck grants 1,100 EXP (flag 23) + `CompleteQuest` |

Quest-data flags: GC shared top bits — 21 accepted-choice (unused here, no
widget skip), 22 seals-paid, 23 EXP-paid (`gc_reward_checkpoint.lua`).
Single conversation completes the quest when accepted.

## Dialogue (Loremonger transcript + script event names)

Aubrey: Flames rekindled / provisional-recruit offer ("not binding ... will
not preclude you from assisting the Grand Companies of other nations") →
choice "Yes, freedom sounds nice." → seal lecture (seals = company currency,
Flame-only, buy otherwise-unobtainable goods/power/fame) → hands a starter
purse of seals → points to "lovely Miqo'te standing just next to me", Flame
Sergeant First Class Rahz (next quest 111803). Decline: lecture ends, no
reward, quest remains open. Client text bank/event IDs: OPEN (retail scene
numbers not recovered; server plays delegate events by name).

## Objectives / markers

- Journal: `getJournalInformation` seq 0 → {342}; DAT `xtx_quest.csv` row 495
  binds all four journal slots to `xtx/journalxtxWil` row 342; quest.csv row
  495: lv 22, reward-set marker 101, marker base 11060001.
- Map marker: `getJournalMapMarkerList` seq 0 → {11170003} (Aubrey).
- Journal text (wiki): "At the behest of First Flame Lieutenant Aubrey, you
  have joined the Immortal Flames on a provisional basis. To learn more of
  company currency and the items available for purchase, speak with Flame
  Sergeant First Class Rahz."

## NPCs / positions (map_coordinates, zone 233 Hall of Flames, page 50)

- Aubrey 1500198: `!pos 233 169.000 0.000 -174.700` → map (1.93, 1.21), cell
  (1,1). VERIFIED: spawn SQL row id 2817 + tool `locate --zone 233 --world
  169 -174.7` (map_available; 0 recorded navmesh nodes; catalog landmark,
  distance 0.0). Matches forum `<1,1> Hall of Flames, Lv22` listing.
- Rahz 1500201: (169.0, 0.0, -177.3), 2.6 yalms from Aubrey — VERIFIED adjacent
  per dialogue. Next-quest giver, not interacted with here.
- No other actors, triggers, movers, or pickups. No recording exists for zone
  233 (`zone_233.tsv` absent); Y=0 is the catalog spawn height, not a captured
  floor — pending live `!pos` floor confirmation like all GC-HQ interiors.

## Instance / territory

None. Entire quest resolves in the public Hall of Flames (zone 233). No
private area, no SimpleContentQuestBattle, no warp, no boundary, no re-entry
rules. Leaving the zone mid-dialogue ends the event; nothing persists except
paid-checkpoint flags after their yield.

## Mobs / waves / abilities

None — dialogue/delivery/interaction quest with zero combat. No BNPC roster,
no spawn waves or triggers, no abilities, no aggro/leash, no level sync
(1.0 retail had none; overlevel irrelevant without combat). Per the
coordinate guide: no mob positions to author; Aubrey/Rahz catalog positions
above are NPC landmarks, not mob placements (no `plan`/SQL export performed).

## Rewards

- 250 Flame Seals: `GrantGCQuestSeals(player, 3, 250, "Kindling a Flame")`
  (`gcseals.lua`): cap-checked against rank table (`rankSealCap`, Recruit 127
  → 10,000); over-cap returns false with system-error message, quest stays
  retryable, nothing consumed. Attention message 25228 on success.
- 1,100 EXP: `GrantGCQuestExpOnce` to current class/job.
- Both pay-once persisted (flags 22/23, `characters_quest_scenario.flags`
  MEDIUMINT). No gil, items, or central `gamedata_quest_rewards` row claimed.
- Next unlock: 111803 Burning a Hole in One's Pocket (Rahz shop intro).

## Triggers / edge handling (all VERIFIED in script + shared guards + tests)

- Accept/decline: only result-1 advances; decline/close/Nil/false/0/-1/"1"
  replies → EndEvent, no transaction (runtime-test matrix on sibling routes).
- Failed `AcceptQuest` → no enlist, no seals, event closes.
- Stale continuation: `CanContinueGrandCompanyQuestDialogue` (Map
  Server/WorldManager.GcQuests.cs) binds connected player + accepted quest +
  quest-data object + sequence before AND after every client yield; DC/relog/
  timeout/quest-swap invalidates the resume → silent return, EndEvent.
- Interrupted closing dialogue: seals checkpoint (flag 22) precedes
  `processEventAUBREYFinal`; retry skips repaid seals AND repaid EXP
  (flags 22/23 reloaded from save) — "tutorial retry pays once" regression.
- Seal-cap mid-dialogue: grant fails closed, no flag set, player keeps quest,
  can retry after spending seals.
- Abandon: quest data (incl. flags 22/23) discarded; re-offer restarts clean;
  no orphan items (none issued); prereq 111801 completion persists.
- Death: public zone, no penalty path; event ends, retry at Aubrey.
- Repeats: non-repeatable story quest; completed quest cannot reopen dialogue
  (SEQ_COMPLETE guard in tests).
- Prerequisite breaks: offer gated on 111801 completion + Lv22 +
  `GrandCompanyOpeningQuestRules` (Flames route; enlisted-foreign-company
  members cannot accept; questCompany 3 vs enlistedCompany check).
- Party: N/A (no battle, no shared objectives). Mounts/chocobo: N/A (no
  instance/SQB; companion rules don't apply to public dialogue).
- Crash between currency/EXP/flag writes: separate DB ops, not atomic
  (documented shared GC persistence limit; no evidence to change it).

## Sources

`com0u2.lua` (full body), `gc_reward_checkpoint.lua`, `gcseals.lua`,
`quest_availability.lua:324`, `gamedata_quests.sql:524`,
`server_eventnpc_spawn_locations.sql` rows 2816–2817, `quest.csv:495`,
`xtx_quest.csv:495`, `GrandCompanyOpeningQuestRules.cs`,
`WorldManager.GcQuests.cs` (guard decl), `grand-company-runtime-tests`
Program.cs:153–160 (seal-tutorial route u/111802),
`gc_opening_quests_completion_2026-09-19.md`,
`gc_finalization_2026-09-17.md`, map_coordinates zone-233 locate output,
GamerEscape wiki + Loremonger transcript, forum `<1,1>` listing.

## Open gaps

- Live-client acceptance: native tutorial/widget lifecycle, cap-refusal UX,
  pay-once closing retry (per completion audit; route stays ordinary-offer
  gated until a recorded playthrough).
- Zone 233 has no navmesh recording; Aubrey/Rahz Y=0 is catalog height.
- Retail scene/cutscene numbers and client text-bank IDs unrecovered.
