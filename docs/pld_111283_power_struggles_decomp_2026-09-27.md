# 111283 Pld0j3 Power Struggles (Lv40) deep decomp (2026-09-27)

Chain: prereq 111282. Offer Jenlyns 1060042 (zone 209 spawn row 244).
Rewards: EXP 4260, Holy Succor 27149 (job 16). Unlocks 111284.

## Flow (DAT + bytecode, inspected)

1. Jenlyns `processEventJENLYNSStart` (offer EQ pc66; accepted branch:
   fadeOut 1s / wait 1 / fadeIn 1s, crystal carving).
   `processEventJENLYNSStart_1` is the pre-level hint (texts 2/3);
   `processEvent000` is contextual follow-up (texts 17-20). No NQ scene
   or warp.
2. Battle seq 5: Old Six-arms in Lower La Noscea (private adapter).
3. Completion at Jenlyns seq 10: First (worldMaster,51127,2000201) +
   Second (27149,2) (trailing 2 is an API arg, not rank/count) + Third
   showEventBeforeNpsLS(player,1000146,96).

Journal (Wil 519/520 identical; 521 next at 45): traitor Solkzagyl,
Sultansworn captain 30 years; "go to lower La Noscea and defeat the
giant crab king, Old Six-arms. It is recommended that three party
members accompany you." Adapter map: pld0j3 = {[0]=0,[5]=0}.

## Marker (quest_marker.csv, inspected)

- 11224201 battle: (710.32,373.38) m00029 101/101 display 4000257,
  MapMarkerQuestArea.

## Placement (map_coordinates.py; guide sections cited)

Guide: "All-zone interface" (Lower La Noscea 128/page 100), "Agent
workflow" (locate; unrecorded squares report nearby samples with
inside_selection=false and never borrow heights), "Calibration and
evidence" (La Noscea base 2528/3008; 100-unit grid checked vs patch 1.21
notes), "Generate placements" (planner fails without nodes; never
invents points).

`locate --zone 128 --page 100 --world 710.32 373.38`: map (32.38,33.81)
cell (32,33); **0 recorded points in r30** (live recording AND premerge
snapshot agree); nearest node 1537 d=101.6u. Height UNRESOLVED at center
by rule: nearby Y values belong only to their own positions.
Corroboration (not proof): forum 1.17 NM thread reports Old Six-arms
killed at Lower La Noscea <31,33>, adjacent to marker cell (32,33).

Disposition: PRIVATE open-world adapter (mandatory: marker is
ungrounded). No public spawn, no Y invented, no marker-area trigger.
Journal destination hint only.

## Mob (exact public profile, SQL-inspected)

Old Six-arms: actor 2107614 CrabNormalNM/display 3107616, mob 3078
(Lv47, NM flag; `mobs six` confirms). Skill list 6024 = Claw Guard
23133, Bubble Shower 23134, Backclip 23135, Sound of the Sea 23403
(eLeMeN NM list, verified); crab family list 21 = Brine Blast 23060,
Rage of the Deep 23061, Feeding Frenzy 23062, Deep Scratch 23075, Claw
Guard 23133, Bubble Shower 23134, Backclip 23135 (verified). Server mob
row 3078 binds list 6024 (authoritative). Single target,
requireAllTargets, timeout 900, maxParty 4 (recommendation). No
adds/phases in any source (video search: no 1.0 footage).

## Edge cases (shared runtime, inspected)

Same matrix as j1/j2: finish(false) paths -> retry seq 0 at Jenlyns;
lease; abandon blocked; leader-only start, cap 4 + minimumLevel (STAGED
patch adds 40); dismount gates; exact private kill reconciliation; no
quest items; no 1.x sync.

## Sources (all inspected)

quest_marker.csv 11224201; Wil 519-521; xtx_quest 111283;
quest_new_reward 111283 (27149); spawn row 244; actor 2107614; mob 3078;
skill lists 6024 + 21; battle command 27149; journal selectors;
DECOMP_EVENTS Pld0j3; pld0j3.json methods; template Pld0j3 +
QuestDirectorJobPld0j3; shared runtime; fandom 1.0 page; 1.17 NM thread.
