# 111201 Pride and Duty (Will Take You from the Mountain) — `War0j1`

- Job: WAR 17 (base MRD 4 + GLD 3/15) | Level: 30 | Offer: Neale 1000090 | Status: Implemented
- Quest scripts: thin `war0j1.lua` + `job_quest_template.lua:War0j1` (template route).
- Companion: `FF14-Decomp/docs/war0j1-war0j6_deep_decomp_2026-09-27.md` s111201.

## Sequence flow (VERIFIED: war0j1.csv + template rows + hooks)
- ACCEPT Neale `processEventStart` (offer 12/decline 11) -> 0 route ->
  Gorge cave `processEventCurious` (texts 14-20; 20 = antling nest north) ->
  battle seq 5 {11220002} -> 10 reward Gorge `processEventClear` +
  `processEventJob` (item arg 3020410, ability 27186) -> Neale
  `processEventClearAfter` ambient (texts 35-36, Astalicia report; NOT auto-run
  through Gorge — validator asserts absence from War0j1 hooks).

## Delegate events (VERIFIED: template `JOB_QUEST_DECOMP_EVENTS`)
Wired: processEventStart/processEventCurious/processEventClear/processEventJob.
Neale ambient 035_036 unbound (manual talk only).

## Actors/markers (VERIFIED: quest_marker.csv + server_eventnpc_spawn_locations.sql)
- Neale 1000090/eventspawn 315/zone 230 (-791.43,9.15,381.93).
- Curious Gorge 1060028/eventspawn 2483/zone 172 (-1115.45,53.26,285.721).
- 11220001/11220003 cave (-1116.04,285.49,map 403); 11220002 fight
  (-1090.64,43.22,map 403). 11220004-10 filler (MapMarker 11000101).

## Fight (VERIFIED: actor class + skill list + mob row; count INFERRED)
4x Antling Worker 2203001/TermiteStandard/3203001, private mob 32730 lv30,
skill list 3 (23226,23227,23229,23560). Four-copy count = adapter tuning for
journal "group"; client `QuestDirectorWar0j101` empty (no waves/phases).
Director `QuestDirectorJobWar0j1`: seq 5->10, retry 0, 900 s, party <=4,
requireAllTargets, single wave, offsets +/-3.

## Placement (VERIFIED: mob_map_coordinates.md sAll-zone + sAgent-workflow)
Zone 172 Western Thanalan, native page 1300 (scale 1, base 2687/3072):
- Fight 11220002 -> map (15.96,31.15); 33 recorded pts; nearest node 6985
  `!pos 172 -1092.375 56.640 41.488` (2.45u). Y unresolved at center per guide.
- Cave 11220001/03 -> map (15.71,33.57); 22 recorded pts; nearest
  `!pos 172 -1109.995 91.105 278.847` (8.98u).
Private shell `quest_sqb_war0j1_<ownerId>`; spawn origin + formation offsets.
No public spawn rows (validator forbids `antling_*_172`).

## Rewards (VERIFIED: template row)
EXP 2661 + action 27186 + keyitem 2000203 (Soul of the Warrior) + item 3020410.
NOTE: item grant has no inventory-full retry (shared-driver gap, same as
gla200 — left for a driver-level pass).

## Edge handling (VERIFIED: gc_sqb_runtime.lua + gc_sqb_quest.lua bodies)
Launcher refuses mounted starts (leader + party, actionable dismount
messages); mounting inside engine-denied. Runtime: death/timeout/disconnect/
area-exit/quest-changed -> fail -> retry seq 0; kill credits reconcile exact
uniqueIds (ambient kills ignored); owner-only completion; cutscene-skip
failure -> retry path. No retail sync: overlevel uncapped (shared C# gap).

## Open gaps
- Live entry-scene lifetime; client acceptance.
- War0j1 inventory-full retry + level sync (shared-driver follow-ups).
