# 110382 Head of the Class (Tan306) — decomp

Leatherworker 36, requires 110381. Guild evaluation: question the
students, Lifemend Stump assignment, stolen-goods discovery,
overambitious-novice Parley, Damaged Fen-Yll Boots, one-of-eight
five-piece preparatory synthesis, Boar Leather vintage repair,
Hereward showing, Garlean juggernaut scare, Lalatta Echo, Hereward
reward. Non-combat; no mobs, no sync, no lockouts.

## Sequences / flags / counters

States: 0 question students, 5 Lifemend assignment, 10 discovery,
16 novice Parley, 17 boots + consultations, 18 preparatory synth,
20 vintage repair, 22 showing, 25 juggernaut, 30 Echo + reward.
Quest data: counter 0 vintage baseline (snapshot-diff); flag 0
FLAG_NOVICE (reserved, no opponent to stamp it), flag 1 FLAG_BELI
(consult order), flag 2 FLAG_ECHO (ask gate). All flag slots newly
assigned. States 0 and 16 list no ENPC and have no talk handler:
their actors are unrecoverable (walkthrough redlinks), so the
script deliberately dead-ends there rather than inventing routing.

## NPCs / actors

- Hereward 1000231: offer/evaluation/reward (row 691, zone 206).
- Lalatta 1000368 (stand-in row 3359): assignment + Echo subject.
- Beli 1001077 (display 1000362): first consult. Row 684, zone 206
  (93.63, 20.00, -1482.87) = marker 11038202 XZ exactly.
- Maddeline 1001078 (display 1100372): prep task + repair
  instruction. Row 688, zone 206 (91.44, 20.00, -1464.58) =
  marker 11038203 XZ exactly.
- Unresolved: Agile/Mischievous/Elderly Adventurer students +
  overambitious novice (walkthrough redlinks, no actor ids; marker
  displays 4000149/4000153/4000154/1600061/1400114 unresolvable to
  actor classes), so no Parley opponent can be stamped.

## Dialogue / cutscenes (client scenario Tan306, 298 lines, read)

Text bank tan306.csv (143 rows). Offer: say 3, showQuestInfomation
gate (no ask). Cutscenes: tan30610 (afterWarp), tan30620, tan30630
(afterWarp), tan30640 (Echo vision, afterWarp). processEvent050 is
fade-only (NO startNQCutScene): the finale plays no cutscene.
Echo 040: say 45, worldMaster ask 51030 mode 2; on 1 the CLIENT
runs pastAreaIn itself, then cutscene; else return 0. Server keeps
the strict result gate (Fsh306 precedent). Talk-only: 023 (boots),
025 (prep done), 027 (vintage ready), 028 (route alternate, branch
rule unknown, unmapped). Dynamic-arg talks: 027_4 (say 132-133),
027_9 (say 136). Unwired sub-families: 005_2..9, 010_2..8,
020_2..8, 027_2..10, 030_2..5, 040_3..8. Key cells: 26 novice
yield, 131 Hereward send-off, 136 prep ask (selector-driven),
137-138 repair readiness, 139 repair-failure branch (rule unknown),
140-142 juggernaut reactions.

## Objectives / markers (DAT quest_marker.csv, all read)

Guild markers (zone 206, Gridania map): 01 Hereward
(97.02,-1459.46,d1000324) (7.05,3.65); 02 Beli-position
(93.63,-1482.87,d1000362) (7.02,3.41); 03 Maddeline-position
(91.44,-1464.58,d1100372) (6.99,3.59); 04 (106.66,-1483.73,d1600061)
(7.15,3.40); 05 (106.26,-1472.57,d1400114) (7.14,3.51); 06
(102.50,-1476.38,d4000149) (7.11,3.48); 07/11 (102.05,-1474.46,
d4000153) (7.10,3.50); 08 (101.96,-1475.57,d4000154) (7.10,3.48);
10 (97.96,-1469.63,d4000257) (7.06,3.54); 12 unmapped (-431,187);
13 Hereward (same as 01); 14 Lalatta-position (103.07,-1477.11,
d1500065) (7.11,3.47); 15 Hereward finale (= 01). Field marker 09
Lifemend Stump (-794.81,-1060.32,d4000257) = Central Shroud
(23.09,27.48) ~ walkthrough (23,27), 96 recorded nodes, Y~20.3.
16-20 filler (-431,187). Script binds sequentially (range-only
recovery, marked): state order -> 01..09, Echo -> 15.

## Territory / instance

Gridania 206 (guild evaluation; walkthrough's in-guild instance
for the questioning/Parley has no recovered private area);
Central Shroud 150 (Lifemend Stump discovery cutscene trigger,
mechanism unrecovered: walk-to vs push). Echo past-area entry is
client-side (scenario runs it); no server area work needed beyond
the ask gate.

## Spawn positions (map tool, this pass)

- 11038209: Central Shroud (23.09,27.48), 96 recorded nodes,
  nearest (-794.2,20.3,-1066.0). No trigger authored (mechanism
  unrecovered).
- Beli/Maddeline spawns match markers 02/03 XZ exactly.

## Mobs / AI

None. Verified: quest director empty, no kill targets, no hazards.

## Parley / Echo

DAT title 5401 "Head of the Class" verified, but the novice
opponent has no actor id -> Parley cannot be stamped; state 16 is
a deliberate dead-end (marked). Echo: ask 51030 strict-1 gate,
FLAG_ECHO, then Hereward 050 + 4720 EXP.

## Items / recipes

11000048 Damaged Fen-Yll Boots (Beli-then-Maddeline order-gated
grant) + 10007116 Boar Leather -> 11000049 Vintage Fen-Yll Boots
(recipe 5404, E/36/CC, registered). Preparatory: any ONE five-piece
set of 8 selector variants (8080806/8070903/8090002/8090201/
8080513/8090504/8030922 x2 recipes); held-count (bought pieces
explicitly allowed per walkthrough); first qualifying set in
selector order consumed. Work-slot selector mutation (slot 2,
values 1-8) has no engine owner -> complete-any-one-set (marked).
Normal prep recipes already registered (e.g. 2266 Toadskin Jacket:
2x toad + aldgoat + sinew, matching the walkthrough).

## Triggers / edge behavior

Offer: TNR33 + level 36 + completed 110381. Grants verified.
Prep delivery consume-verified; vintage credit snapshot-diff.
Showing consumes vintage; juggernaut advances bare (no recovered
scene maps 25->30); Echo strict gate; finale requires FLAG_ECHO.
Abandon/complete run onFinish cleanup (verified). Logout/DC safe.
No timeout/re-enter/sync (non-combat). Chocobo clause N/A.

## Rewards

Central: 36000 gil + 3600 marks (1000117). Script: 4720 EXP
(post-1.20 maximum). No central Exp row. Reward era unresolved.

## Sources

Scenario tan306.lua + tan306.csv + quest_marker rows + template
Tan306 block + xtx_negotiationTable title 5401 +
Gamerescape Head_of_the_Class journal/walkthrough (fetched
2026-09-27) + Fsh306 Echo precedent + map tooling.
