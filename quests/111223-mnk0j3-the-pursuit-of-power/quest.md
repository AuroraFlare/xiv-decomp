# 111223 The Pursuit of Power — `mnk0j3` (normalized from Batch MNK-A)

- Job: MNK 15 (base PUG 2) | Level: 40 | Offer: Erik 1060033 | Availability: enabled
- Lua: `Data/scripts/quests/job_quest_template.lua` (Mnk0j3, interaction completion) + `com/job_quest_item_objectives.lua` (11000553, zone-gated).
- SQL prereq: 111222.

## Sequence flow (VERIFIED: indepth decomp + template + wiki s3)
- ACCEPT Erik `processEventStart` (accept 62 / decline 15; grants
  Outdated Aetheriometer 11000553) -> 0 Widargelt
  `processEventStartAfter` (Little Ala Mhigo; stalls → Mun-Tuy) -> 5
  private Prince of Pestilence (exact uniqueId) -> 6 measure at
  11221203 (zone 157, 40u) → in-place `processEventClear`
  (`mnk0j310`) + `processEventAfget` (ability 27109). No reward NPC.

## Delegate events (VERIFIED: indepth process_events)
Wired: Start/StartAfter + Clear/Afget via `CompleteJobQuestFrom-
Interaction`. `processEventPoint` text 57 has no recovered push
owner (follow-up, not blocker).

## Actors/markers (VERIFIED: SQL rows + DAT markers)
Erik 1060033 (z175 id 2466); Widargelt 1060032 (z171 id 2484 =
11221201). 11221202 fight (z157: -784.71,-2289.16; 62 nodes,
Y~-24.1); 11221203 measure (z157: -751.64,-2287.66; 46 nodes,
Y~-23.3; display ???, location-gated, no actor class).

## Fight (VERIFIED: template + mob/skill SQL + walkthrough)
`QuestDirectorJobMnk0j3`: 2100610/mob 32736 Prince of Pestilence x1,
lv 47, skill 6026 (Brundleflight 23064, Thunderstrike 23066,
Thunderwall 23067, Thunderstorm 23068). Expected 5 -> success 6 ->
retry 0. 900 s, party 4. Mob row 3081 does not exist → private
row 32736.

## Rewards (VERIFIED: gamedata + template)
Central: Exp 4260 + action 27109. Instrument consumed at seq 6.

## Edge handling (VERIFIED: indepth s5 + interaction entry + gc_sqb)
Kill→6 via director; measure needs bound quest + seq 6 + exact slot
+ zone 157 within 40u (silent reject otherwise); guarded
`CompleteJobQuestFromInteraction` (exact quest/sequence/eligibility).
Wipe/timeout/death/DC → retry at Widargelt; abandon → registry
re-check, start-item re-granted (HasItem anti-dupe). Cap 4. No
chocobo. No sync. No lockout.

## Open gaps
- `processEventPoint` push owner unrecovered.
- Live-client acceptance of fight/measurement visuals.
