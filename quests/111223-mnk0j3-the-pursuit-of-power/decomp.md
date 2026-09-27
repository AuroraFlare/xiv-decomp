# 111223 The Pursuit of Power (Mnk0j3) — in-depth decomp

Monk rank 40. Offer: Erik (1060033), Ul'dah zone 175 (-32.453, 192.1,
45.343; spawn id 2466). Requires MNK 40 + prior 111222 (server gates).

Full doc: `docs/mnk0j3_pursuit_of_power_decomp_2026-09-27.md`.

## Sequence / flags (server: job_quest_template.lua Mnk0j3, interaction completion)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Erik offer | `processEventStart` (offer pc88/0x679; accept 62 / decline 15; grants Outdated Aetheriometer 11000553) |
| 0 | Widargelt at Little Ala Mhigo (1060032; zone 171, 1213.7/251.528/106.977, id 2484) | `processEventStartAfter` (measurements unfinished → go to Mun-Tuy; local 1.5s fades, no warp) → launches battle → seq 5 |
| 5 | Slay the Prince of Pestilence | Director `QuestDirectorJobMnk0j3`: exact uniqueId kill → seq 6 |
| 6 | Measure at marker 11221203 | Use 11000553 in zone 157 within 40u of (-751.64,-2287.66) → completes IN PLACE: `processEventClear` (widget 58 + notify + wait 3 + `mnk0j310` Default + wait 1 + world 55) then `processEventAfget` (long 79 + ability 27109). No reward NPC |

Journal: Wil 544 (Widargelt) / 545 (Prince; RECOMMENDED 3 companions) /
546 (post-kill measurement) / 547 next notice. Selector map present.

## Dialogue / cutscenes

`mnk0j310` plays in place at the measurement point after
`processEventClear`. Erik's brief (two tasks): collect Widargelt's
aetheriometer at Little Ala Mhigo, then measure Mun-Tuy Cellars north of
Emerald Moss after defeating the Prince of Pestilence. Widargelt stalls
("measurements not yet complete"), sending the player to Mun-Tuy first.

## Objectives / markers

- 11221201 Widargelt (1213.67,107.29) = spawn row 2484.
- 11221202 fight: zone 157 Mun-Tuy Cellars, (-784.71,-2289.16), map
  (6.87,3.99); 62 recorded nodes, Y≈-24.1
  (`!pos 157 -784.970 -24.132 -2288.564`).
- 11221203 measurement: zone 157, (-751.64,-2287.66), map (7.20,4.00);
  46 recorded nodes, Y≈-23.3
  (`!pos 157 -751.212 -23.345 -2287.505`). Display ??? — no actor class;
  item-use is location-gated (zone 157 + 40u radius) instead of
  actor-bound. `processEventPoint` text 57 has no recovered push owner →
  follow-up, not a blocker.

## Instance / territory

- Fight: SimpleContentQuestBattle content copy
  `quest_sqb_mnk0j3_<pid>`, boundary radius 45. Re-entry disabled. Max
  party 4, timeout 900 s.

## Fight: Prince of Pestilence (single NM, lv 47)

- Actor class 2100610 (FlyNormalNM/display 3100612) / private mob type
  32736 (mob row 3081 does NOT exist — only a historical UPDATE mentions
  it → new private row 32736). Skill list 6026 = eLeMeN NM kit:
  Brundleflight 23064, Thunderstrike 23066, Thunderwall 23067,
  Thunderstorm 23068.
- Single wave, single kill credits (exact uniqueId). Enmity/leash:
  standard content AI + 45-yalm boundary circle.
- Walkthrough consensus: single fly NM in Mun-Tuy Cellars, no phases or
  adds; measurement step follows at a separate point.

## Triggers / edge handling

Kill→6 via director (exact uniqueId). Item use at 6 requires: quest
bound, sequence 6, exact slot, zone 157 within 40u of (-751.64,-2287.66);
then consumes item + `CompleteJobQuestFromInteraction` (guarded entry:
exact quest/sequence/eligibility, completionOwner interaction).
Out-of-zone/early use → silent reject (retail shows nothing until the
kill). Wipe/timeout/disconnect → retry at Widargelt (last route actor).
Abandon/reacquire → registry re-checks sequence; start-item re-granted
(HasItem guard prevents dupes). Party cap 4. Mounts: engine-handled +
3-layer gate. No sync (retail-fixed level 47 boss vs lv40 quest). No
lockout beyond the 900 s attempt timer.

## Rewards

Exp 4260 + action 27109, all central. IDs verified in gamedata.

## Sources

Recovered client `Mnk0j3` + `QuestDirectorJobMnk0j3`, DAT markers,
server_eventnpc/mob/skill SQL rows above, 1.0 journal archive (Fandom
Monk Quests 1.0: Little Ala Mhigo → Mun-Tuy → Prince → measure).
Runtime tests: `test_mnk.lua` Mnk0j3 groups PASS.
