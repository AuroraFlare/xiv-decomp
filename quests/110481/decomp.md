# 110481 The Grass is Always Greener — `Hrv300` (Botanist 30)

- Class: BTN (40) | Level: 30 | Offer: Opyltyl 1000236 | Chain: none | Status: ENABLED, bespoke script.
- Lua: `Data/scripts/quests/hrv/hrv300.lua` (Exc300 precedent: no template row, no DECOMP hooks entry).

## Sequence flow (VERIFIED: decomp hrv300.lua 203 lines, DAT markers, Gamerescape walkthrough, footage y-cQuN5N5YI ch 3:28-9:04)
- ACCEPT Opyltyl `processEventOpyltylStart` (double showQuestInfomation, nil-accept) -> [0] Cicely @11048101 `010` hrv30010 -> [5] Penelope 1700001 @11048102 `020` hrv30020 -> [10] Cicely @11048104 `030` hrv30030 -> [11] gather Bowing Pine Branch 11000086 (area A @11048109) + Foul-smelling Nut 11000087 (area B @11048110) -> Cicely `030` replay: branch+nut -> Nostalgic Ink 11000085 -> [12] Penelope Parley window (title 1301, ink required; Man300 defaults 3/12/20) -> win grants Pirate Ship Tale 11000042 -> [18] Cicely `030` replay: ink+tale -> Meracydian Olives 11000135 + Letter to Nenekko 11000136 -> [20] Linette 1000861 @11048106 (DAT-bound; no Nenekko spawn): olives consumed, letter presented-but-retained -> [25] Nogeloix 1000597 @11048105 first (flag-enforced), then Linette with letter -> Amajina Ceruleum 11000137 -> [30] guild trigger 1090046 push @11048107: ceruleum consumed -> [35] Opyltyl @11048108 `040` hrv30040 after warp -> central gil/marks.

## Delegate events (VERIFIED: decomp scenario)
OpyltylStart/010/020/030/040 cutscenes; talks 013,013_2,014,014_2,015,015_2,017,018,020_6,025,025_2,030_2,005_2..005_5,010_2,010_3,017_2,020_2..020_5,030_3..030_5. State 20/25 talks have no recovered client events: possession-check beats, no invented scene names.

## Actors/markers (VERIFIED: DAT quest_marker rows, spawn SQL X/Z-exact)
Opyltyl 547, Cicely 548 (zone 206); Penelope 614 (zone 155); Nogeloix 150 (zone 209); Linette shared; guild trigger 1090046 (zone 206, MSQ row untouched). Live 11048101/02/04/05/06/07/08/09/10; 11048103 replay-only contaminated, unbound; 11048111-20 filler.

## Gathering (VERIFIED: pools + map tool this pass)
Branch: Bentbranch logging pool 20123, zone 150 area A (358.59,-697.45) cell (34,31); 239 recorded nodes in 30y, nearest node 4657 `!pos 150 357.916 3.882 -698.324` (1.1y). Nut: Humblehearth logging pool 20203, zone 150 area B (-193.99,-629.15) cell (29,31); 0 recorded nodes in 30y (sparse corner, documented), nearest landmark etc1g1_extinguished_hearth_3 `!pos 150 -192.830 3.800 -628.220` (1.5y). Finds ride normal inventory; NQ only; HQ does not count; checklist flags $E8(2)/$E8(3) at state 11 only.

## Mobs (VERIFIED: no combat in scenario)
No quest mobs. Area A: star marmots 17y+. Area B: roselets/toadtraps 49y+. No instance, no chocobo handling needed.

## Rewards (VERIFIED: gamedata_quest_rewards.sql)
Central: 30,000 gil + 3,000 Botanist marks (1000122). EXP: none (scaling unresolved, DAT max 3,420).

## Edge handling (VERIFIED: script body)
BTN30 gate all paths incl. onNegotiationResult; re-accept clears Parley/Nogeloix flags; every exchange grants-before-consuming with verified once-grants (held copies satisfy, no doubling); full-inv holds sequence with make-room message; state-25 order flag-enforced with redirect; Parley win requires ink in hand + intro flag, loss retries, enabled var cleared on win; guild push never despawns shared actor; UpdateENPCs + EndEvent all paths; abandon keeps gathered finds (Exc300 precedent: public gatherables, no onFinish cleanup); death/DC/timeout N/A (no combat/timer); overlevel sync N/A; dup turn-ins impossible (consume-on-advance + once-grants).

## Open gaps
Parley board defaults (3/12/20) unrecovered; EXP scaling; marker 11048103; Nenekko actor fidelity; after-warp lifetime.
