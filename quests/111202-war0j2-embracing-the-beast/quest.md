# 111202 Embracing the Beast — `War0j2`

- Job: WAR 17 (base MRD 4 + GLD 3/15) | Level: 35 | Offer: Curious Gorge 1060028
- Prereq: 111201 | Status: Implemented
- Quest scripts: thin `war0j2.lua` + `job_quest_template.lua:War0j2` (template route).
- Companion: `FF14-Decomp/docs/war0j1-war0j6_deep_decomp_2026-09-27.md` s111202.

## Sequence flow (VERIFIED: war0j2.csv + template rows + hooks)
- ACCEPT Gorge `processEventCURIOUS_GORGEStart` (offer 17/decline 16;
  linkpearl handoff) -> battle seq 5 {11220101} -> completion hooks First
  (world text 51119), Second (ability 27187), Third
  (`showEventBeforeNpsLS(1600318,75)`). Journal: Sirocco west of Humblehearth,
  Central Shroud; 3 companions / 4 total (party <=4).

## Delegate events (VERIFIED: template `JOB_QUEST_DECOMP_EVENTS`)
Wired: accept `processEventCURIOUS_GORGEStart`, complete
{onJobQuestCompleteFirst, onJobQuestCompleteSecond}, completeAfter
onJobQuestCompleteThird. Scenario-body fragments (decomp_more war0j2.lua)
unverifiable in this checkout — see Open gaps.

## Actors/markers (VERIFIED: quest_marker.csv + server_eventnpc_spawn_locations.sql)
- Curious Gorge 1060028/eventspawn 2483/zone 172 (-1115.45,53.26,285.721).
- 11220101 (-414.89,-606.41,map 301, MapMarkerQuestArea). No Y/facing/trigger
  in DAT — private shell owns the spawn.

## Fight (VERIFIED: actor class + mob rows + skill lists)
1x Sirocco 2100309/SerowFemaleNM/3100311, mob 3097 lv42, skill list 6031
(eLeMeN NM list mirroring list 4: 23078,23079,23166,23196). Single target,
single wave; no retail phases/adds (empty client director). Director
`QuestDirectorJobWar0j2`: seq 5->10, retry 0, 900 s, party <=4,
requireAllTargets.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + sAgent-workflow)
Zone 150 Central Shroud, native page 2100 (scale 1, base 3104/3808):
- 11220101 -> map (26.89,32.02); **0 recorded pts within 30u**; nearest node
  2486 `!pos 150 -319.302 3.392 -762.541` (~183u, inside_selection=false).
- No public placement possible: fight stays in private shell
  `quest_sqb_war0j2_<ownerId>` (source-backed AI, private boundary). Zones
  151/152 checked and rejected (wrong territory for marker map 301).

## Rewards (VERIFIED: template row)
EXP 3360 + action 27187 (Inner Beast). No items -> no item-loss surface.

## Mechanics (VERIFIED: Fandom 1.0 journals, fetched 2026-09-27)
Agile antelope prey; transcript notes mate-as-decoy behavior (not modeled —
no retail AI source). No 1.0-era YouTube footage found (wikis/issues only);
video verification unresolved.

## Edge handling (VERIFIED: gc_sqb_runtime.lua + gc_sqb_quest.lua bodies)
Same contract as War0j1: mounted-start refusal (leader + party), death/
timeout/disconnect/area-exit/quest-changed -> retry seq 0, exact-uniqueId
kill credit, owner-only completion. No sync (shared C# gap).

## Open gaps
- `validate_job_war0j2_route.py` FAIL pre-existing: missing untracked
  `tools/outputs/lpb/decomp_more_20260617/.../war0j2.lua` (scenario asserts
  unverified; all non-scenario asserts pass). Re-run where the file exists.
- Live trigger owner + retail phase/balance (live-verification follow-ups).
