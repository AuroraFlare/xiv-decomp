# War0j6 deep decomp: How to Quit You (111206, Lv50)

JOB WAR war-b, 2026-09-27. Quest battle: frenzied Curious Gorge +
Cliffdivers at the Silver Bazaar, with entry/aftermath scenes and a
Bazaar reward talk. Implementation already exists (shared template +
`QuestDirectorJobWar0j6`); this file records the in-depth decomp.

## Sources

- `war0j1-war0j6_deep_decomp_2026-09-27.md` (War0j6 section)
- `job_quest_template.lua` War0j6 row + scenario hooks
  (`processEvent010` entry, `battleAftermath = "processEvent020"`,
  `war0j620` aftermath scene, `processEventClear` reward with
  8032703); director `QuestDirectorJobWar0j6` (seq 5->10, retry 0,
  1200s timeout, party <= 8, successEvent `processEvent020`)
- Markers 11220501 (cave reminder, actor 1600318) and 11220502
  (Bazaar battle+reward, -1343.12/480.08, display ???)
- Fandom 1.0 journal: Gorge vs Broken Mountain (his brother, lost to
  the inner beast), then Gorge "sets his frenzied gaze on you";
  "You have helped Curious Gorge regain control of his inner beast.
  Now speak with him once more at the Silver Bazaar"; "Up to seven
  party members may accompany you. (Recommended)" (8 total); reward
  Fighter's Cuirass + Mighty Strikes (no EXP line)
- No 1.0-era YouTube footage found (modern retrospectives only)

## Stages and flow

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Curious Gorge (13/12) | NPC |
| 0 | Travel to the Silver Bazaar (`processEvent010`) | NPC |
| 5 | NQ `war0j610` entry (Gorge + Broken Mountain 1001985 + 3 Cliffdiver scene actors 1001982), then fight frenzied Gorge + Cliffdivers | Content |
| 10 | NQ `war0j620` aftermath (`processEvent020`), then FINAL TALK AT THE SILVER BAZAAR (Wil 510; cave marker 11220501 is reminder-only, never the reward return) -> `processEventClear` (ability 27189, cuirass 8032703) | Content/NPC |

Entry scene PC (-1342.66,56.70,489.33); Gorge aftermath setup
(-1366.46,56.16,522.07). Broken Mountain is scene-only (never a
combat target in any recovered source).

## Targets (map_coordinates placement)

- 1x Curious Gorge 2289037/mob 3012/lv55/skill list 15 (23484, 23490,
  23493, 23494): EXACT recovered profile.
- 3x Cliffdiver 2201209/BirdNormalWar0j6/3201209/lv53, private mob
  32759, skillListId 0 (melee-only). The scene shows 3 birds; combat
  copies are unrecovered, so 3 copies single-wave is labeled tuning.

Marker 11220502 (zone 172, Western Thanalan) has 12 recorded points
in selection at Y ~56.1-56.2 (nodes 6492/6493). The client
`QuestDirectorWar0j601` is an empty shell: no copies, waves, phases,
adds timing, or enrages anywhere. No retail source distinguishes a
Gorge-first vs birds-first order; require-all-targets single wave.

## Anti-loophole rules (verified in the shared runtime)

Wipe/death -> retry; 1200s timeout; abandon/reacquire journal guards
(no rewrite of a new journal after the aftermath movie);
disconnect fail + same-character relog rebind; death-during-event
post-movie revalidation (2s settle); area-exit fail; retrigger
guards (`creditedTargets` + finishing lease + exact-uniqueId kill
credits); party cap 8 with leader-only entry and member validation;
minimumLevel gates owner + party (no 1.x level sync); mounted
leader/members refused with dismount message (no battle chocobos);
unplayed `war0j620` fails the phase (no reward leak).

## Implementation

Existing: template War0j6 battle block, `QuestDirectorJobWar0j6.lua`,
private profile 32759 (migration + main-SQL parity row), Gorge
2289037/3012 exact row. Untouched this pass; pinned by
`validate_job_war0j3_war0j6_adapters.py` (PASS). Known gap (kept
honest): the destination-owned Bazaar reward-talk actor binding is
unrecovered, so the public Gorge spawn owns the reward talk
(`rewardActor = 1060028`, standard SEQ_JOB_REWARD flow).
