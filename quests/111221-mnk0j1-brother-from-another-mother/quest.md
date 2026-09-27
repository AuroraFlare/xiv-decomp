# 111221 Brother from Another Mother — `mnk0j1` (normalized from Batch MNK-A)

- Job: MNK 15 (base PUG 2) | Level: 30 | Offer: Gagaruna 1000862 | Availability: enabled
- Lua: `Data/scripts/quests/job_quest_template.lua` (Mnk0j1 template adapter). No bespoke script.
- SQL prereq: 0 (no prior-quest gate; PGL30+LNC15 server gates).

## Sequence flow (VERIFIED: indepth decomp + template + wiki s1)
- ACCEPT Gagaruna `processEventGAGARUNAStart` (arg4 OR arg5 text; accept 8 / decline 7,37) -> 0 Erik
  (`processEvent005`, Mythril Pit T-8 handoff) -> 5 private battle
  (three Runagate Imps, exact uniqueIds) -> 10 automatic
  `processEvent010` (`mnk0j110`) + `010_2_system` (item 3020410) +
  `010_3_system` (Shoulder Tackle 27108). No reward NPC.

## Delegate events (VERIFIED: indepth process_events)
Wired: GagarunaStart/005/010/010_2_system/010_3_system.
Client director `QuestDirectorMnk0j101` recovered EMPTY (shell only).

## Actors/markers (VERIFIED: SQL rows + DAT markers)
Gagaruna 1000862 (z175 id 61); Erik 1060033 (z175 id 2466); Widargelt
1060032 + imp shell 1001960 scene-only. Markers 11221001 (Erik
handoff), 11221002 (fight z171: 1283.36,-155.49; 22 navmesh nodes,
Y~256.4).

## Fight (VERIFIED: template + mob SQL + walkthrough)
`QuestDirectorJobMnk0j1`: 2202611/mob 32735 Runagate Imp x3, lv 35,
skill 5034 (adapter policy; retail kit unrecovered). Expected 5 ->
success 10 -> retry 0. 900 s, party 4. Quest `onKillBNpc` inert;
director credits exact-uniqueId kills, requireAllTargets.

## Rewards (VERIFIED: gamedata_items.sql + template)
Central: Exp 2661 + Soul of the Monk 2000202x1 (key) + The Keeper's
Hymn 3020410x1 + Shoulder Tackle 27108x1. Lua plays presentation only.

## Edge handling (VERIFIED: indepth s6 + gc_sqb runtime)
Wipe/timeout/death/DC/exit → retry 0 at Erik; abandon → bound-quest
check; leader-only start, cap 4, entrant validation; cutscene skip →
NQ default, completion independent; OOB → boundary + no re-entry. No
chocobo (3-layer mount gate + engine denial). No sync. No lockout.

## Open gaps
- Retail trigger at Mythril Pit destination vs adapter launch from Erik's
  route talk (documented, Blm0j3-precedent accepted).
- Retail Runagate Imp skill kit unrecovered (list 5034 labeled adapter).
- Live-client acceptance of fight/scenes (formation offsets).
