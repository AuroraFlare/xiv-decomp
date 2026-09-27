# 111807 By Fire Reborn (Com0u7) — in-depth breakdown

ORIGINAL WORK ONLY. No Square Enix client binaries or proprietary code were
decompiled, disassembled, or copied. Sources: public wikis (GamerEscape,
Final Fantasy Wiki), patch-1.19 notes/forum posts, the AuroraFlare
FF14-Memory server implementation and DAT CSVs already in the repo, and the
`mob_map_coordinates.md` coordinate guide. All implementation bodies cited
below were opened and read.

Immortal Flames enlistment quest, Story Lv25, patch 1.19. Offer: First Flame
Lieutenant Aubrey (actor class 1500198) in the Hall of Flames, Ul'dah zone
233 (169.0, 0.0, -174.7, rot -1.5; spawn id 2817, uniqueId `flame_aubrey`).
Requires Lv25 + completed 111806 Know Your Enemy + NO Grand Company
membership (server gates; `gamedata_quests.sql` row 529:
`(111807, 'By Fire Reborn', 'Com0u7', 111806, 25)`).
Effect: permanent, irreversible enlistment in the Immortal Flames (company 3)
at rank 11 (Flame Private Third Class). Wikis: GamerEscape "By Fire Reborn"
+ Plot Details transcript; Final Fantasy Wiki "Immortal Flames Quests
(version 1.0)" section (Lv25, Recruit, Aubrey, 1000 Flame Seals, ~1,080 EXP,
Hall of Flames (1,1), preceded by Know Your Enemy, followed by Different
Strokes + It Kills with Fire (Ul'dah)).

## Objectives / phases

Single phase, single NPC, no items, no movers, no instance.

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT (offer) | Talk to Aubrey | `processEventAubreyStart`: enlistment lecture + oath Yes/No; numeric result 1 + `AcceptQuest` advances and persists accepted-choice flag 21; any other reply closes with zero transaction |
| 0 | Talk to Aubrey (report) | Same NPC `QFLAG_TALK`; `TryJoinGrandCompany(3, 111807)` (rank 11; idempotent) -> 1,000 Flame Seals (flag 22 checkpoint) -> `processEventAubreyEnd(0,0)` closing widget -> stale-guard recheck -> 1,080 EXP (flag 23) + `CompleteQuest` |

Quest-data flags: GC shared top bits — 21 accepted-choice, 22 seals-paid,
23 EXP-paid (`gc_reward_checkpoint.lua`). One conversation completes the
quest when the oath is accepted.

Journal (single entry, both wikis agree): "You have officially enrolled as a
private in the Immortal Flames, Grand Company of Ul'dah. To hear more of the
duties and benefits associated with being a sworn Flame, speak with Second
Flame Lieutenant Lannis." Lannis is a post-quest pointer, not an objective
NPC of this quest.

## NPCs / spawns with guide coordinates

Tool: `tools/mobspawns/map_coordinates.py locate --zone 233` (Hall of
Flames). Zone 233 has ZERO recorded navmesh nodes, so heights are catalog
spawn heights (Y=0), not captured floor — pending live `!pos` confirmation
like all GC-HQ interiors. No mob placements authored (no combat); the
positions below are NPC landmarks, not mobspawns (no `plan`/SQL export).

- Aubrey 1500198 `flame_aubrey`: `!pos 233 169.000 0.000 -174.700`, rot -1.5.
  Tool: map (1.93, 1.21), cell (1,1). VERIFIED: spawn SQL row id 2817.
  Matches wiki `Hall of Flames (1,1)` and the sibling Com0u2 measurement.
- Lannis 1001739 `flame_lannis` (Second Flame Lieutenant Lannis, mentioned /
  next-step contact, NOT interacted with here):
  `!pos 233 155.000 0.000 -182.000`, rot 1.5. Tool: map (1.79, 1.14), cell
  (1,1). VERIFIED: spawn SQL row id 2820. ~15.8 yalms from Aubrey.
- No other actors, triggers, movers, or pickups.

## Triggers / dialogue flow

Retail dialogue (GamerEscape Plot Details, Part 1, Aubrey — summarized in
original words): welcome back; the other city-states' companies are not for
one who burns as a Flame; enlistment terms — the other companies are told,
they strip any rank and strike the recruit from their rolls; kept Storm /
Serpent seals will no longer be honored by foreign quartermasters, while
Flame Seals stay good; the oath is permanent (cannot leave, cannot join
another company); the regulations require him to say so. Choice:
"No, this sounds... painful." -> decline ("the warmth and light of the
Flames await you should you change your mind"), quest stays open; vs
"Yes. Yeees! Yeeeeeesss!!!" -> enlist. Server plays delegate events by
name; retail scene/cutscene numbers unrecovered.

Server flow (`gc_enlistment_quest.lua` CONFIGS.Com0u7 + onTalk, all read):
1. Talk to Aubrey at SEQ_ACCEPT or 0 (wrong NPC/sequence -> EndEvent).
2. If flag 21 unset: `CanStartGrandCompanyEnlistmentQuest(111807)` must pass
   (zero membership: `gcCurrent == 0`, all three ranks 0; `Player.cs:5713`);
   play `processEventAubreyStart`; stale-guard recheck
   (`CanContinueGrandCompanyQuestDialogue`, `WorldManager.GcQuests.cs:41`,
   which routes SEQ_ACCEPT through offer-identity validation and seq 0
   through journal/data/sequence identity); require numeric 1 AND
   `AcceptQuest`; persist flag 21.
3. `TryJoinGrandCompany(3, 111807)` (`Player.cs:5755`, under
   `grandCompanyProgressionLock`): requires `IsGrandCompanyEnlistmentQuest`
   (`Player.cs:5910`) + accepted journal; idempotent retry path
   (`alreadyJoinedAtInitialRank` -> re-sync, true); otherwise requires fully
   unjoined state, then `Database.TryJoinGrandCompany`, sets company 3 /
   rank 11 (`GrandCompanyInitialRank = 11`, `Player.cs:575`), syncs
   progression. Failure -> system-error message + EndEvent, quest open.
4. `GrantGCQuestSealsOnce(player, quest, 3, 1000, "By Fire Reborn")`: pay-once
   flag 22. Join runs BEFORE this grant, so the rank-11 cap (10,000,
   `rankSealCap[11]` in `gcseals.lua`) already applies. Cap/full failure ->
   EndEvent, quest retryable, join NOT rolled back (idempotent on retry).
5. Play `processEventAubreyEnd(0,0)`; stale-guard recheck; `GrantGCQuestExpOnce`
   (1,080, flag 23); `CompleteQuest`; EndEvent.

## Fight tuning

None — dialogue/delivery/interaction quest with zero combat. No BNPC roster,
no spawn waves or triggers, no abilities, no aggro/leash, no level sync
(1.0 retail had none; overlevel irrelevant without combat), no instance, no
SimpleContentQuestBattle, no warp, no boundary, no re-entry rules. Leaving
the zone mid-dialogue ends the event; only paid-checkpoint flags persist.

Chocobo/companion: N/A — no battle or instance surface exists for this quest,
so there is nothing to disable; companion rules do not apply to public Hall
of Flames dialogue (same surface class as Com0u2; contrast squad-battle
quests such as Com0u4 which DO carry companion handling).

## Rewards

- Membership: Immortal Flames (company 3), rank 11 = Flame Private Third
  Class (Fandom "Reward: Flame Private Third Class" + `GrandCompanyInitialRank`).
- 1,000 Flame Seals (item 1000203, `companySeal[3]`): cap-checked
  (`GrantGCQuestSeals` -> `AddGCSeals` vs `rankSealCap`); over-cap returns
  false with system-error message, quest stays retryable, nothing consumed.
  Attention message 25228 on success.
- 1,080 EXP to current class/job (`GrantGCQuestExpOnce`).
- Both pay-once persisted (flags 22/23, `characters_quest_scenario.flags`
  MEDIUMINT 24-bit; top bits 21-23 reserved by this helper family).
- DAT: `quest.csv:500` (lv 25, reward-set marker 101, marker base 11060001),
  `xtx_quest.csv:500` (all journal slots -> `xtx/journalxtxWil` row 430),
  `quest_reward.csv:480` (111807 row present, seal item 1000203 referenced).
- Unlocks: 111816 It Kills with Fire (Ul'dah, Lv30) and 111817 Prying Eyes
  (`gamedata_quests.sql` rows 538-539); GamerEscape lists Different Strokes
  as unlocked (transitively via 111817 -> 111818).

## Journal / markers

- `getJournalInformation` seq 0 -> {430} (matches `xtx_quest.csv:500`).
- `getJournalMapMarkerList` -> {} by design: `quest_marker.csv` contains NO
  111807 row, and no sibling-enlistment marker evidence exists, so the shared
  module's `config.marker == nil` path (return {}) is correct. A marker ID
  must NOT be invented. If retail evidence surfaces later, add
  `marker=<id>` to the Com0u7 CONFIG row only.

## Wipes / resets / edge cases / no-loophole checklist

All VERIFIED in script + C# + `grand-company-runtime-tests` enlistment route
("u",3,111807,...) unless noted:

- [x] Decline/cancel at oath widget (Nil/false/true/0/-1/"1" replies):
      no accept, no join, no seals, no EXP, EndEvent ("cancelled enlistment
      has no transaction"). Quest stays open, infinitely retryable.
- [x] Failed `AcceptQuest`: no flag 21, no join, EndEvent.
- [x] Failed join (`failJoin`): accept persisted (flag 21), no seals;
      retry SKIPS the already-answered oath widget (no double-prompt).
- [x] Seal-cap/full at grant: no flag 22, quest retryable; retry replays
      join idempotently then re-attempts seals. Join-then-seals ordering
      guarantees the rank-11 cap (not rank-0 cap of 0) applies.
- [x] Interrupted closing dialogue: seals checkpointed BEFORE
      `processEventAubreyEnd`; reloaded flags prevent seal re-grant
      ("interrupted closing dialogue does not repay seals": grants == 1).
- [x] Failed completion: no EXP re-grant on retry ("completion failure
      retry does not repay EXP").
- [x] Completed quest cannot reopen dialogue (SEQ_COMPLETE guard).
- [x] Stale continuation: DC/relog/timeout/quest-swap/offer-withdrawn/
      offer-replaced invalidates resume at BOTH yields (offer + closing);
      silent return, EndEvent. 24-bit flag schema asserted against live
      `characters_quest_scenario.sql` in the test fixture.
- [x] Double-enlist: second `TryJoinGrandCompany` while already rank 11 in
      company 3 re-syncs and returns true (no duplicate DB row, no rank
      change). Enlisting in a SECOND company afterwards is blocked by the
      `gcCurrent != 0` check (matches retail "cannot leave / cannot join"
      oath terms).
- [x] Foreign-enlisted / pre-ranked player: offer gate
      (`CanStartGrandCompanyEnlistmentQuest`) AND join-time lock re-check
      both require fully unjoined state — no TOCTOU window.
- [x] Abandon: quest data incl. flags 21-23 discarded; re-offer restarts
      clean; no orphan items (none issued); prereq 111806 completion
      persists. NOTE: membership itself is NOT revoked on abandon (retail-
      correct: the oath is permanent once sworn).
- [x] Death: public zone, no penalty path; event ends, retry at Aubrey.
- [x] Repeats: non-repeatable story quest.
- [x] Party: N/A (no battle, no shared objectives).
- [x] No-item quest: no evidence-consumption loophole possible
      (`HasGCQuestCompletionEvidence` not needed on this route).
- [!] Crash between currency/EXP/flag writes: separate DB ops, not atomic
      (documented shared GC persistence limit, `gc_reward_checkpoint.lua`
      header; no evidence to change it).
- [!] Offer currently DISABLED: 111807 is commented out in
      `quest_availability.lua:349` (whole `patch_1_19` block, incl. prereqs
      111805/111806). Enabling is a patch-gating decision, deliberately not
      taken in this quest-scoped task.

## Server implementation status: 100% (verified, no edit required)

`Data/scripts/quests/com/com0u7.lua` is the 2-line shared-module delegate
(`InitGrandCompanyEnlistmentQuest("Com0u7")`), byte-for-shape identical in
role to `com0l7.lua`/`com0g7.lua`. Journal 430, officer 1500198, company 3,
1,000 seals, 1,080 EXP, both event names, and the full edge matrix above are
verified against DAT CSVs, wikis, C# bodies, and the passing suite
(`dotnet run` in `tools/grand-company-runtime-tests`: "Grand Company runtime
tests passed (2541 assertions)"). Deliberate non-changes: no invented map
marker (no DAT row), no availability flip (patch-gating decision).

## Sources (every body opened)

`com0u7.lua`, `gc_enlistment_quest.lua` (full), `gc_reward_checkpoint.lua`
(full), `gcseals.lua` (full), `quest_availability.lua:330-354`,
`gamedata_quests.sql:523-541`, `server_eventnpc_spawn_locations.sql:1885,1888`,
`quest.csv:500`, `xtx_quest.csv:500`, `quest_reward.csv:480`,
`quest_marker.csv` (negative: no 111807 row), `Player.cs:5713-5784,5910-5915`
+ `:575`, `WorldManager.GcQuests.cs` (full),
`tools/grand-company-runtime-tests/Program.cs:80-152`,
`map_coordinates.py locate --zone 233` (Aubrey + Lannis outputs),
GamerEscape "By Fire Reborn" + "By Fire Reborn/Plot Details",
Final Fantasy Wiki "Immortal Flames Quests (version 1.0)" (By Fire Reborn
section), patch 1.19 notes quest-name mapping, sibling
`111802-com0u2-kindling-a-flame/{quest,decomp}.md` + `com0u4.lua` conventions.

## Open gaps

- Offer disabled (`quest_availability.lua:349`); prereqs 111805/111806 also
  gated; com0u6 carries a Charledore-actor audit note.
- Live-client acceptance: native oath-widget lifecycle, cap-refusal UX,
  pay-once closing retry.
- Zone 233 has no navmesh recording; Aubrey/Lannis Y=0 is catalog height.
- Retail scene/cutscene numbers, and the Lannis follow-up binding, unrecovered.
- The cited unlisted legacy YouTube video (`U3VhYJfWKtc`, MMORPG.com forum
  thread "Immortal Flames Video - By Fire Reborn (Level 20 Quest)") could not
  be content-verified; nothing in this breakdown depends on it.
