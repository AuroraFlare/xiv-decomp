# 110007 Whispers in the Wood (Man1g0, Lv.8) — instance/echo notes

Gridania MSQ #3. Prereq 110006 (Souls Gone Wild); next 110008 (Beckon of the
Elementals). Non-combat dialogue quest. All four "instances" are static
`PrivateAreaMasterPast` echo rooms (cutscenes + talk/push), no BNPCs, no
director, no dynamic content area. Bodies inspected: `Data/scripts/quests/man/
man1g0.lua` (666 lines), `server_zones_privateareas.sql`, `server_eventnpc_spawn_
locations.sql`, `server_battlenpc_spawn_locations.sql` (zero rows for these
areas), `Database.cs` (party/recovery/mount), `WorldManager.cs` (warps),
`Player.cs` (`AbandonQuest`, `CanMountInCurrentArea`), `PrivateArea.cs`,
`PrivateAreaPastExit.lua`, `global.lua` guards, Gamerescape Loremonger text.

## Echo rooms (all `canExitArea=0`, music 40)

| Use | Zone | Past # | Entry warp | Exit |
| --- | ---: | ---: | --- | --- |
| SEQ_005 CRP atrium | 206 | 6 | same-XYZ from Anaidjaa (11.86,8.75,-1265.19) | quest flow only |
| SEQ_010 Acorn Orchard | 206 | 7 | same-XYZ via s005 push | quest flow only |
| SEQ_015 CRP atrium (Yda/Papalymo) | 206 | 8 | same-XYZ via Fye talk | `WarpToPublicArea` same-XYZ |
| SEQ_035 moogle wood | 150 | 2 | explicit (-650.565,21.530,-1109.064,0.398) | `WarpToPublicArea` same-XYZ |

No-arg `WarpToPublicArea` keeps XYZ (not saved entrance); correct here because
echo rooms share public-zone geometry.

## Actors / positions / rot (SQL uniqueId, zone/past/x/y/z/rot)

206/6: s005 push 1090170 (-34.5,8,-1271,0); door 5900001 (18,9,-1270,0);
Caplan 1000822 (10.286,8.75,-1277.686,-0.036); Frances 1000466
(22.784,8.75,-1277.494,1.58); SquealingSprat 1000826 (-47.896,8.516,-1264.851,
-1.773); SugarSchoolgirl 1000824 (-40.817,8,-1252.622,2.99); Zezekuta 1000240
(15.314,8.75,-1263.129,3.106); Anaidjaa 1000465 (11.86,8.75,-1265.19,1.66);
ChalyoTamlyo 1000623 (-8.961,10.75,-1257.738,0); Decima 1000622
(-8.6,8.75,-1261.71,1.563); Ulmhylt 1000823 (-3.903,8.75,-1263.3,0.44).
206/7: Fye 1000014 (-31,8,-1244.5,-2.5); Tomboy 1000828 (-32.231,8.75,-1254.114,0);
Daughter 1000827 (-38.989,7.898,-1253.032,0.653).
206/8: Tomboy + Daughter (same XYZ as /7); s015 push 1090171 (-31.5,8,-1274.5,0).
150/2: s035 push 1090174 (-631,22,-1067,0); exit obj 1290003
(-633.662,20.952,-1075.982,0). No exit objects in 206/6,7,8 (by design: echo
rooms exit only via quest warps). Yda/Papalymo/E-Sumi/moogle/Khrimm/Lewin/
O-App-Pesi are client-cutscene-staged, no server ENPC rows.
Public: s025 push 1090172 206 (-204,18,-1477,0); s030 push 1090173 150
(-639,23,-1086,0); s055 push 1090175 206 (238.5,12,-1274,0); Opyltyl 1000236
206 (-205.68,20,-1454.72,3.08); Nonolato 1000463 206 (232.88,12.46,-1268.94,
-1.38); Miounne 1000230 155 (55.94,4,-1196.44,1.67). All pushes are
`PopulaceStandard` (correct invisible-volume class per instance guide).

## Coordinate verification (map_coordinates.py, used directly)

- 150 s030 (-639,-1086): 57 recorded pts in r30; nearest node 6702
  (-639.05,22.90,-1085.16) d=0.84. Trigger Y=23 on recorded ground.
- 206 s005 (-34.5,-1271): 59 recorded pts; nearest (-34.76,7.75). Y=8 OK.
- 206 Fye (-31,-1244.5): 14 recorded pts; nearest node 374 d=5.04, Y 7.87. OK.
- Zero existing mobs in all selections. No mob placements authored: none exist
  by design (retail story has no fight; Gamerescape confirms talk-only flow).

## SEQ/event branches (all wired, no loopholes)

ACCEPT(Miounne)→000(Anaidjaa talk→010+Past6)→005(s005 push→020+Past7)→010(Fye
talk→030+Past8; kids ambient 020_3/020_4; Anaidjaa fallback replays 010,
resets to 005 = retail Fye-pointer)→015(s015 push→040+public+LS1)→020(linkpearl
pack1→025)→025(s025 push→050)→030(s030 push→060+150/2)→035(s035 push→070+
public; s030 replays 060+re-enters 150/2)→040(Opyltyl talk→080+LS2)→045
(linkpearl pack2→050)→050(Nonolato talk→090)→055(s055 push→100+LS3)→060
(linkpearl pack3→065)→065(Miounne reward: `sqrwa`+15000 gil+300 exp).
Reminder talks wired 2026-09-27: 000_2, 020_2 (Zezekuta at 010), 040_2 (020),
050_2 (030), 080_2 (Opyltyl at 045), 080_3 (045), 090_2 (Nonolato at 055).
Unwired (no retail actor IDs): 090_3/090_4/090_5 (3 unnamed Quiver archers),
060_2 (moogle mid-wander line, cutscene-internal), 1000_2 (speaker uncertain),
1000_5 (entry prompt; unused — echo warps ride inside cutscenes, no prompt).

## Fight / AI / phases / escort — N/A (verified, not assumed)

No `SpawnEnemy`/`CreateContentArea`/director/kill-counter in script; no BNPC
rows; journal SEQ_035 "wander around nearby" is a push-volume trigger, not an
escort (no follow/teleport/aggro). Party/solo scaling, enrage, leash, reset:
not applicable. Parties are NOT locked or isolated here (areas absent from
`IsPartyLockedStaticInstanceArea`, no director): shared static layer per repo
convention for all echo quests — retail solo-only Echo is a known engine gap.

## Fail edges (engine-verified)

- Chocobo/mount: blocked in ALL private areas by `IsMountRestrictedArea`
  (`area.IsPrivate()` → `SetMountState` refuses). Satisfied, no quest code.
- Abandon: impossible — engine refuses in-instance (msg 25235) and MSQ can
  never be abandoned (msg 25233). No quest code needed.
- Disconnect/relog: static areas restore in place from
  `characters.currentPrivateArea(Type)`; startup sweep only touches dynamic +
  allowlisted static, so echo progress + sequence persist. Death: no mobs; a
  Return/homepoint exit is recoverable via Anaidjaa (→005) / s030 (→150/2)
  re-entry guards. Timeout: none (no timers in retail flow).
- Exit objects: 150/2 has one but `canExitArea=0`, and the PastExit warp-back
  is commented out engine-wide — walking out of bounds is unenforced (engine
  gap, same as other echo quests). 206/6,7,8 have no exit object; leaving is
  only possible via teleport/Return, covered by re-entry guards above.
- `!questcomplete man1g0 <checkpoint>`: crp/orchard/fye/atrium/growery/stump/
  moogle/opyltyl/quiver/lewin/miounne warp+stage profiles added (public coords
  from SQL/markers; private warps use trigger/entry XYZ).

## Sources

- `FF14-Memory/Data/scripts/quests/man/man1g0.lua` (full body)
- `FF14-Memory/Data/sql/server_zones_privateareas.sql` rows 35-38
- `FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql` rows 547,587,699,
  1119-1125,1126-1139,2731; `server_battlenpc_spawn_locations.sql` (nil)
- Gamerescape `Loremonger:Whispers_in_the_Wood` (dialogue/mechanics cross-check)
- `Map Server/{Database,WorldManager,Actors/Chara/Player/Player,Actors/Area/
  PrivateArea}.cs`, `Data/scripts/{global.lua,base/chara/npc/object/
  PrivateAreaPastExit.lua,commands/gm/questcomplete.lua}`
