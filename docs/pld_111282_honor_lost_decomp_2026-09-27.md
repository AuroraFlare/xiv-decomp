# 111282 Pld0j2 Honor Lost (Lv35) deep decomp (2026-09-27)

Chain: prereq 111281. Offer Jenlyns 1060042 (zone 209 spawn row 244).
Rewards: EXP 3360, Divine Veil 27147 (job 16). Unlocks 111283.

## Flow (DAT + bytecode, inspected)

1. Jenlyns `processEventJENLYNSStart` (accept EQ pc84; accepted branch:
   fadeOut 1s / wait 3 / fadeIn 1s while Jenlyns carves the crystal;
   texts 17/21). `processEvent000_JENLYNS` is a reminder. No NQ scene,
   warp, or movement: the offer presentation is local training.
2. Battle seq 5: Alux in Mun-Tuy Cellars (private open-world adapter).
3. Completion at Jenlyns seq 10: `onJobQuestCompleteFirst`
   (worldMaster,51127,2000201) + `Second` (27147,1) + `Third`
   showEventBeforeNpsLS(player,1000146,95). No extra waits.

Journal (Wil 516/517 identical; 518 next at 40): Oathkeeper stolen by a
traitor; "find and defeat the alux beast that lurks in the Mun-Tuy
Cellars of the North Shroud. It is recommended that three party members
accompany you." Adapter map: pld0j2 = {[0]=0,[5]=0}.

## Marker (quest_marker.csv, inspected)

- 11224101 battle: (-927.95,-2128.40) m00029 103/311 display 4000257,
  MapMarkerQuestArea.

## Placement (map_coordinates.py; guide sections cited)

Guide: "All-zone interface" (Mun-Tuy 157/page 2500 native binding),
"Agent workflow" (locate), "Calibration and evidence" (native table
bindings, not shared-region transforms), "Generate placements" (recorded
XYZ only; private content stays out of public SQL).

`locate --zone 157 --page 2500 --world -927.95 -2128.40`: map (5.44,5.60)
cell (5,5); 28 recorded points in r30; nearest node 663
`!pos 157 -928.028 -23.890 -2127.993` d=0.41u; ground Y ~-23.9.
4 ambient catalog mobs inside r30 (cellar_puk row 960275 d=5.2u; three
mun_tuy_squirrels d=6.3/16.5/18.3u): the adapter credits ONLY the
private uniqueId kill, never an ambient kill.

Disposition: PRIVATE open-world adapter. Marker is the journal
destination hint; the fight runs in the per-owner shell. No public Alux
spawn is authored (public trigger owner unverified; guide: no invented
ground/plans into public SQL).

## Mob (exact public profile, SQL-inspected)

Alux: actor 2102609 ImpNormalNM/display 3102611, mob 3000 (Lv42, NM
flag), skill list 42 = Impish Incantations 23116/23117/23118 (verified).
eLeMeN notes Stardust 23119 on the NM list, but the server profile is
authoritative; no phase/add callback is invented. Single target,
requireAllTargets, timeout 900, maxParty 4 (recommendation).
Video search returned no 1.0 Alux footage; fandom journal names a lone
"alux beast": no adds.

## Edge cases (shared runtime, inspected)

Same matrix as j1: wipe/timeout/death/disconnect/area-exit/quest-changed
-> finish(false) -> retry seq 0 at Jenlyns; live-shell lease; abandon
blocked by boundQuestIsCurrent; leader-only start, cap 4, entrant gates
+ minimumLevel (STAGED patch adds 35); mounted entrants refused
(dismount message); exact private-area kill reconciliation; no quest
items (nothing to lose); no 1.x sync.

## Sources (all inspected)

quest_marker.csv 11224101; Wil 516-518; xtx_quest 111282;
quest_new_reward 111282 (27147); spawn row 244; actor 2102609; mob 3000
(`mobs alux` confirms Lv42 NM); skill list 42; battle command 27147;
journal selectors; DECOMP_EVENTS Pld0j2; pld0j2.json methods; template
Pld0j2 + QuestDirectorJobPld0j2; shared runtime; fandom 1.0 page.
