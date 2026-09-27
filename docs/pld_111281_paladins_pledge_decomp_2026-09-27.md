# 111281 Pld0j1 Paladin's Pledge (Lv30) deep decomp (2026-09-27)

Chain: first PLD quest. Offer Lulutsu 1000863 (Ul'dah zone 209,
spawn row 178 at -193.46,195.05,183.65). Requires GLA 30 + CNJ 15.
Rewards: EXP 2661, Cover 27146 (job 16), Soul of the Paladin key item
2000201, The Keeper's Hymn 3020410. Unlocks 111282.

## Flow (DAT + bytecode, inspected)

1. Lulutsu `processEventLULUTSUStart` (offer; text switch arg1==numeric1;
   accept/decline independent). `processEvent055` repeats the lead.
2. Jenlyns 1060042 `processEvent082` (route seq 0, marker 11224001;
   task texts 29/50). `processEvent083` is later exposition, not a battle
   unlock. Jenlyns spawn row 244: zone 209 (-113.68,218,148.92), matching
   markers 11224001/11224003 X/Z (-113.68,148.92).
3. Battle seq 5 at marker 11224002 (private SQB; see below).
4. Success scene `pld0j110` via `processEvent010` (after-warp post-kill
   wrapper; `015` is the default-fade twin). Presents Engraved Crystal
   11000558 (DummyItem: scene prop, never inventory).
5. Return to Jenlyns seq 10: `processEvent020` induction (talk stays open)
   + `processEventKokuti(3020410)` (item widget, ability (27146,1), closes
   talk). Server grants EXP/action/key item/item authoritatively.

Journal (xtx_journalxtxWil 511-514, xtx_quest selectors 0/1/2):
Wil/512 route to Jenlyns at Hustings Strip; Wil/513 undead south of the
Coffer & Coffin, "Up to three party members may accompany you.
(Recommended)" (total 4, recommendation); Wil/514 free-paladin crystal
after the last monster; Wil/515 next quest at 35.
Journal adapter map exists: pld0j1 = {[0]=0,[5]=1,[10]=2}.

## Markers (quest_marker.csv, inspected)

- 11224001 route: (-113.68,148.92) m00013 104/421 display 1000146 (Jenlyns).
- 11224002 battle: (-1800.80,0.82) m00013 104/403 display 4000257 (???).
- 11224003 reward: same X/Z as 11224001.

## Placement (map_coordinates.py; guide sections cited)

Guide: `docs/mob_map_coordinates.md` "All-zone interface" (page identity,
native bindings), "Agent workflow" (locate/world/map), "Calibration and
evidence" (Thanalan base 2687/3072 scale 1), "Generate placements"
(private zones stay out of public SQL).

`locate --zone 172 --page 1300 --world -1800.8 0.82`: Western Thanalan
map (8.86,30.73) cell (8,30); 44 recorded points in r30 (56 in r45);
nearest node 4451 `!pos 172 -1799.211 72.242 2.330` d=2.19u; ground Y
~72.0-72.5. No catalog mobs within 75u (nearest: cactuar row 728).
Scene `pld0j110` setup (-1804.98,72.17,0.70) and Solkzagyl
(-1804.01,72.17,0.70) corroborate Y ~72.2 at the same field
(scene-placements.csv, inspected).

Disposition: PRIVATE quest battle. Marker is journal fidelity only; the
fight runs in `quest_sqb_pld0j1_<ownerId>` (SimpleContentQuestBattle,
boundary r=45.0) from the caller's position. No public spawn row is
authored (guide: private plans are JSON-only candidates, never public
SQL; battle formation offsets are adapter policy).

## Mobs (SQL-inspected; no retail phases exist)

Client `QuestDirectorPld0j101` is an empty 7-instruction SQB shell
(directors/questdirectorpld0j101.txt): no count/wave/phase/position.
Roster is one copy of each of the 4 DAT resources (adapter policy):

| Mob | Actor | Mob | List | Skills (verified) |
|---|---|---|---|---|
| Wandering Soldier | 2201807 LivingdeadLancerPld0j1 | 32731 Lv30 | 88 | True Thrust 27269, Heavy Thrust 27273, Impulse Drive 27275, Feint 27278 |
| Wandering Mage | 2201808 LivingdeadThaumaturgePld0j1 | 32732 Lv30 | 5061 | Magicked Skull 23245, Shadow Sickle 23246, Minions of the Pit 23247, Soul Eater 23346 |
| Wandering Bogy | 2204318 PetitghostLesserPld0j1 | 32733 Lv30 | 32 | Forbidden Magicks 23125, Dark Cloud 23127, Curse 23128, Grave Reel 23129, Gate to Oblivion 23130 (+2373-2377 twins) |
| Ascian | 2206901 SpecterStandard fallback | 32734 Lv30 | 32 | same ghost list |

SpecterNormalPld0j1 is an empty subclass with no SQL row; 2206901 is the
explicit labeled fallback. Single wave, requireAllTargets, timeout 900,
maxParty 4. No adds/phases/AOEs beyond family kits (video search found
no 1.0 footage; fandom journal names only "undead monsters").

## Edge cases (shared runtime, inspected)

Wipe/timeout/death/disconnect/area-exit/quest-changed -> runtime
finish(false) -> retry seq 0 at Jenlyns; per-owner area + native live-shell
lease (no duplicate shells); abandon/reacquire blocked by
boundQuestIsCurrent; leader-only start, cap 4, entrants online/alive/
same-area/combat-class + minimumLevel (STAGED patch adds 30, sibling BLM
precedent); mounted leader/members refused with dismount message
(isMounted: GetMountState/ACTORSTATE_MOUNTED); exact uniqueId+actor+area
kill reconciliation rejects ambient kills; crystal is DummyItem so no
item-loss state; no 1.x level sync (era N/A).

## Sources (all inspected)

quest_marker.csv 11224001-3; xtx_journalxtxWil 511-515; xtx_quest 111281;
quest_new_reward 111281; spawn rows 178/244; actor-class rows;
mob-type rows 32731-34; skill lists 88/5061/32; battle command 27146;
items 2000201/3020410/11000558; job_quest_journal selectors;
JOB_QUEST_DECOMP_EVENTS Pld0j1; pld0j1.json methods; empty director shell;
scene-placements pld0j110; template Pld0j1 row + QuestDirectorJobPld0j1;
gc_sqb_runtime/gc_sqb_quest/private_quest_battle; fandom 1.0 PLD page
(journal/rewards/party text); forum 1.17 NM thread (no j1 NM: n/a).
