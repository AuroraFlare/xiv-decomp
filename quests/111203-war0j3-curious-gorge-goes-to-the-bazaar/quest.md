# 111203 Curious Gorge Goes to the Bazaar — `War0j3`

- Job: WAR 17 (base MRD 4 + GLD 3/15) | Level: 40 | Offer: Curious Gorge 1060028
- Prereq: 111202 | Status: Implemented
- Quest scripts: thin `war0j3.lua` + `job_quest_template.lua:War0j3` (template route).
- Companion: `FF14-Decomp/docs/war0j1-war0j6_deep_decomp_2026-09-27.md` s111203.

## Sequence flow (VERIFIED: war0j3.csv + template rows + hooks + Gamer Escape)
- ACCEPT Gorge `processEventCURIOUSGORGEStart` (15/14; dual-pronged assault) ->
  battle seq 5 {11220001-class marker 11220201} northern condor fight ->
  east-gate aftermath `processEvent005` + NQ `war0j310` at 11220202 ->
  `processEvent010` (Gorge talk) -> `processEventKokuti` (ability 27188
  Collusion) -> cave return 11220203. Journal Wil 497/498/499 = three beats.
- Scene war0j310: PC (-1342.66,56.70,489.33), Gorge (-1363.92,56.17,522.64);
  three Vulture scene actors 1001084 != combat actor (scene birds prove no
  combat count).

## Delegate events (VERIFIED: template `JOB_QUEST_DECOMP_EVENTS`)
Wired: accept `processEventCURIOUSGORGEStart`, complete
{processEvent010, processEventKokuti}; director successEvent `processEvent005`
+ successScene `war0j310` play content-owned on victory.

## Actors/markers (VERIFIED: quest_marker.csv + server_eventnpc_spawn_locations.sql)
- Curious Gorge 1060028/eventspawn 2483/zone 172 (-1115.45,53.26,285.721).
- 11220201 battle (-1343.82,364.39,map 403); 11220202 aftermath
  (-1343.12,480.08,map 403); 11220203 cave return (-1116.04,285.49,map 403).

## Fight (VERIFIED: actor class + mob row; count/level INFERRED-tuning)
5x Canyon Condor 2201208/BirdStandard/3201208, NEW private mob 32757 lv43
(Gamer Escape: "Canyon Condors (Level 43)"; five per archived transcript),
skillListId 0 melee-only (no recovered retail list; no family substitution).
Single wave; `QuestDirectorWar0j301` empty (no wave metadata). Director
`QuestDirectorJobWar0j3`: seq 5->10, retry 0, 900 s, party <=4,
requireAllTargets, offsets +/-6 + center.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + sAgent-workflow)
Zone 172 Western Thanalan, native page 1300 (scale 1, base 2687/3072):
- Battle 11220201 -> map (13.43,34.36) = Gamer Escape "13-34"; 34 recorded
  pts; nearest `!pos 172 -1334.994 56.862 365.593` (8.91u).
- Aftermath 11220202 -> map (13.44,35.52) = Gamer Escape "13-35"; 12 recorded
  pts; nearest `!pos 172 -1337.311 56.232 464.465` (16.66u).
Private shell `quest_sqb_war0j3_<ownerId>`; no public spawn rows.

## Rewards (VERIFIED: template row)
EXP 4260 + action 27188 (Collusion). No items -> no item-loss surface.

## Mechanics (VERIFIED: Gamer Escape + Fandom 1.0, fetched 2026-09-27)
GE: "Travel to 13-34 Western Thanalan to enter an instance. Inside you will
face a number of Canyon Condors (Level 43). Defeat them and then travel to
13-35 ... to receive a cutscene." Fandom: two-pronged attack, frenzied
slaughter, "You monster!", Gorge flees to the Wells. No 1.0-era YouTube
footage found; video verification unresolved.

## Edge handling (VERIFIED: gc_sqb_runtime.lua + gc_sqb_quest.lua bodies)
Same contract as War0j1/2 plus content-owned aftermath: war0j310 play
failure -> success=false -> retry path (no stuck state); reward stays owned
by quest script after director clears. No sync (shared C# gap).

## Open gaps
- `war0j310` arg4 source unrecovered (cosmetic; NQ plays with recorded args).
- Live entry-scene lifetime; client acceptance.
