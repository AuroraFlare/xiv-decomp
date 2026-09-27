# 111417 The Cove — `Gcl301`

- Maelstrom side quest | Level 25 | Patch 1.19 | Rank: Storm Private Third Class
- Offer: Clifton 1000199, Fisherman's Bottom, Limsa Lominsa Lower Decks (5,6)
- Prereq: 111407 Till Sea Swallows All (SQL authoritative); gates 111418 Saving the Stead Instead
- Quest scripts: thin `gcl301.lua` + `gc_sidequest.lua:Gcl301` + `gc_sidequest_battles.lua`
  + director `QuestDirectorGcSideGcl301` + `gc_sqb_runtime` + `gc_sqb_quest` launcher
  + `gc_sidequest_item_objectives.lua` (anti-venom)
- Status: Implemented. Offer row stays commented in `quest_availability.lua` pending
  client acceptance, per repo policy for all reconstructed 1.19 offers.

## Objectives / phases (VERIFIED: journal CSV + wiki)

- Journal 272 (seq 0): clear the cove NW of Aleport; dispose of 6 dart slugs;
  apply Clifton's anti-venom when poisoned. Up to two party members may accompany.
  Anti-venom is applied via the interaction menu.
- Journal 273 (seq 10): slugs slain, puller dived to perform experiment; return to
  the Fishermen's Guild and await Clifton's return.
- Flow: ACCEPT (Clifton) -> 0 (kill 6 in private battle) -> 10 (report to Clifton).

## Actors / markers / spawns (VERIFIED: SQL + placements + map tool)

- Clifton 1000199/eventspawn 346/zone 230 (-618.03, 4.55, 353.03, rot -2.4).
- Public battle trigger 1099541 `gcl301_battle_entry`/eventspawn 3280/zone 129
  (-1653.540039, 4.74824, -896.0). Push entry, 14u XZ / 2.5u Y tolerance.
- Zone 129 Western La Noscea, native page 100 (scale 1, base 2528/3008):
  trigger -> map (8.74, 21.12), square (8,21). 32 recorded pts; node 3646 is the
  exact user-standing support `!pos 129 -1653.540039 4.74824 -896.0`.
- Markers: start/reward 11183002, battlefield 11183001 (patch-1.19 family rows;
  current quest rows omit battlefield markers, so template reports markers 0).
- 6x dart slug 2104217/SlugLesserStandard/mob 40301, lv 25, wave 1, private shell
  `gc_sqb_gcl301_<ownerId>`; homes frozen to route + offsets (authored formation,
  native homes unrecovered):

| # | offset | floor Y | support node | dist |
| --- | --- | --- | --- | --- |
| 1 | (-6,+5) | 4.500948 | 3654 | 3.97 |
| 2 | (0,+6) | 4.500948 | 3654 | 4.86 |
| 3 | (+6,+5) | 5.866395 | 3649 | 6.66 |
| 4 | (-6,+11) | 4.500948 | 3654 | 9.19 |
| 5 | (0,+12) | 4.500948 | 3654 | 10.21 |
| 6 | (+6,+11) | 4.882059 | 3653 | 12.01 |

No public spawn rows; all targets are private one-shot lifecycle members.

## Triggers

- `onPush` on trigger 1099541: seq 0, same area, zone 129, inside 14u/2.5u box.
- `StartGrandCompanySquadBattle`: combat class/job, alive, lv 25+, not mounted,
  leader-only party pull (max 3, same area, combat-ready, idle events), no live
  shell with the same name, party radius 30u.

## Dialogue flow (VERIFIED: gcl301.md paths + gcl301.csv texts 2-29)

- `processEventCLIFTONStart(ownCompany)`: company members hear text 29, others
  text 2; shared pitch 3/26/4/27/5/28/6/7/8 (quota, Aero-on-Widow-Cliffs idea,
  "Awawa" bubble plan, 6 slugs, venom warning); `showQuestInfomation` accept ->
  texts 10-12 (nets already set, anti-venom 11000407 grant) / decline -> text 9.
- `processEvent_000` (seq 0 reminder): texts 13-14 (NW of Aleport, 6 slugs,
  reapply anti-venom generously).
- `processEvent_010` (seq 10 report): texts 15-25 (no fish caught, porpoise,
  sea-harmony resolve, Barrel-pond expansion, thanks).
- Accept item 11000407 Dart Slug Anti-venom granted + repaired at every
  non-accept sequence; removed at completion.

## Fight tuning (VERIFIED: battles config + mob/skill SQL)

- Single wave, requireAllTargets, 1800 s timeout, boundary radius 45u.
- Mob 40301 `gc_side_dart_slug`: lv 25/25, skill list 5053 (Viscous Discharge
  23099, Mucous Discharge 23100/23347). No loot rows (quest kill credits only).
- Success -> seq 10; failure -> seq 0 retry. No retail wave/threshold data was
  recovered; the journal's "six" is the full roster (count RECOVERED, formation
  authored).
- Anti-venom: reusable token inside the owned battle; clears Poison status and
  prints the dose message. Outside the owned battle it refuses with an error.
  Authored representation of the journal's uncounted "several doses".

## Chocobo disabled (VERIFIED: gc_sqb_quest.lua bodies)

- Leader mounted -> entry refused with "Dismount your chocobo..." message.
- Each party member mounted -> refused with "Every party member must dismount...".
- Post-movie re-validation refuses mounted entrants before publication.

## Wipes / resets / edge cases (VERIFIED: gc_sqb_runtime.lua bodies)

- Death, 1800 s timeout, disconnect, area exit, quest changed/abandoned,
  entry failure, wave-spawn failure -> fail -> seq 0 with trigger re-armed.
- Kill credits reconcile exact uniqueIds: dead + same area + same class; foreign
  same-class kills and duplicate callbacks never credit.
- Owner-only completion; relog rebinds the same character id, never a helper.
- Seals (300) and EXP (1891) each checkpointed once; completion requires the
  `_010` scene to still be current, else the quest stays open for retry.
- Helpers without the quest get no journal writes.

## No-loophole checklist

- [x] Ambient overworld slug kills cannot credit (private roster only).
- [x] Mounted entry blocked for leader and every member, twice (pre + post movie).
- [x] Over-level / wrong-class / dead / transferring entrants refused.
- [x] Non-leader cannot drag a party into the shell.
- [x] Partial kills, timeout, death, disconnect, exit all retry from seq 0.
- [x] Anti-venom unusable outside the owned battle; removed on completion.
- [x] Double reward impossible (seals + EXP checkpoints).
- [x] Re-entry disabled; second shell per owner blocked by name.
- [x] Stale-session / replaced-journal callbacks cannot rewrite the new journal.

## Rewards (VERIFIED: gc_sidequest.lua + wiki)

300 Storm Seals + 1891 EXP (wiki lists ~1,890 EXP). Anti-venom cleaned up.

## Open gaps / conflicts

- Retail dive/experiment beat (journal 273 "watched the puller dive") has no
  recovered scene or callback; the server moves straight to the seq-10 report.
  Do not invent a dive cutscene without scene data.
- Wiki "Preceded by Saving the Stead Instead" conflicts with SQL
  (`111418 prereq 111417`); SQL is authoritative per repo decomp notes.
- No dedicated YouTube walkthrough found; wiki journal text is the public source.
- Live entry-scene lifetime; client acceptance (offer still commented).
