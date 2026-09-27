# 110480 Gridanian Roots — `Hrv200` (Botanist 20)

- Class: BTN (40) | Level: 20 | Offer+reward: Opyltyl 1000236 | Prereq SQL: 0 (conflict: archive 110013 / eLeMeN main-clear; SQL stands)
- Lua: bespoke `Data/scripts/quests/hrv/hrv200.lua` + `hrv_quest_helpers.lua`. Offer HOLD-gated (`HRV200_OFFER_ENABLED=false`).
- Availability: commented Implemented row (crafting/gathering/delivery).

## Sequence flow (VERIFIED: decomp hrv200.lua, DAT markers/text, Gamerescape walkthrough, Slerp Lederp ch 0:00-4:50)
- ACCEPT Opyltyl `processEventOpyltylStart` (ask 35 mode 2, nil-accept) -> [0] Cicely 1000326 @11048001 `010` briefing cutscene hrv20010 -> [5] Quarrymill weed-clear + Spiny Turnip Leaves harvest, 10-minute instance @11048002 -> Cicely aftermath + moogle `020` hrv20020 after warp-out (`020_1` non-warp alternate) -> [10] guild trigger 1090046 push @11048003 + Opyltyl @11048004: `020_3` talk + `030` reward cutscene hrv20030 after warp-out -> Brass Hatchet + EXP 1760 + central gil/marks.

## Delegate events (VERIFIED: decomp scenario 110 lines)
OpyltylStart/010/020/020_1/030; sub-talks 005_2..005_5, 010_2 (bypass refusal), 010_3, 020_2, 020_3 (reward talk), 020_4. Strict gates: offer nil-accept; no result gate on 010/020/030.

## Actors/markers (VERIFIED: DAT quest_marker.csv, spawn SQL)
Opyltyl 547 zone 206 (-205.68/20/-1454.72); Cicely 548 zone 206; guild trigger 553/1090046 zone 206 (-202.91/18.09/-1477.51). Live 11048001-04; 11048005-20 filler (-431,187).

## Gathering/instance (VERIFIED: walkthrough + map tool this pass)
Quarrymill zone 154 South Shroud cell (45,47), center (1446,-258→942z); 24 recorded nodes in cell, nearest node 3626 `!pos 154 1429.437 -12.410 925.895` (23.1y). Instance: 10-min timer, entry trigger + weed/leaf quota unrecovered; zone 154 has no public gathering points, so no pool bound. Leaves 11000018 visible state 5, cleanup state 10.

## Mobs (VERIFIED: no combat in scenario; map catalog)
No quest mobs. Nearest public mobs: pterocTrap/qigirn ~95y+ from cell center. No chocobo handling needed (open-world + future non-combat instance; standard unsummon-on-instance-entry applies when instance lands).

## Rewards (VERIFIED: gamedata_quest_rewards.sql, gamedata_items.sql)
Central: 20,000 gil + 2,000 Botanist marks (1000122). Script: Brass Hatchet 7020011 (grant-before-cleanup, retry flag) + EXP 1760 flat (post-1.20 max).

## Edge handling (VERIFIED: script body)
BTN20 gate all paths; re-accept clears flags/counters; full-inv holds reward; abandon/completion consumes all leaves; guild push multiplexed per-quest, shared actor never despawned; death/DC/timeout N/A (no combat live; instance ticket owns timer-expiry when built); overlevel sync N/A (gather, no sync); dup turn-in impossible (single consume-all + grant-once flag).

## Open gaps (HOLD)
G3-a weed/leaf count; G3-b Quarrymill instance + timer expiry; G3-c guild instance; G3-d prereq conflict; G3-e linkpearl; G3-f EXP scaling; unwired sub-talks 005_2..005_5/010_3/020_2/020_4.
