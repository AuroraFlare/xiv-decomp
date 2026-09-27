# 110381 Designer Imposters (Tan300) — decomp

Leatherworker 30, requires 110380. Saddle delivery to Owl's Nest
(cinematic lone-bandit ambush resolved by Lalatta), linkpearl bag
commission, Clearwater Lake hostage confrontation, mandatory Vielle
Parley, Knights' rescue, Hereward report. Non-combat for the player:
zero kill targets (walkthrough's cave bandits are open-world mobs,
not quest spawns).

## Sequences / flags / counters

States: 0 saddle delivery, 5 post-ambush, 10 Yuhelmeric delivery +
return, 15-19 bag craft, 20-24 Clearwater confrontation, 25 report.
Quest data: counter 0 bag baseline (snapshot-diff credit); flag 0
FLAG_VIELLE (Parley win, newly assigned); flag 1
FLAG_PARLEY_INTRODUCED (intro stamp, newly assigned).

## NPCs / actors

- Hereward 1000231: offer/reward (spawn row 691, zone 206).
- Lalatta 1000368 (stand-in row 3359; twin 1000467): ambush rescue,
  hostage, linkpearl contact. Walkthrough: escort + hostage scenes
  are cinematic; no server trigger owner.
- Ser Yuhelmeric: Owl's Nest saddle recipient, actor unresolved;
  delivery folded into the state-10 Lalatta return talk (marked).
- Vielle 1000388 (display 1300094): mandatory Parley opponent. NO
  public spawn: walkthrough puts the Parley inside an instance
  entered after the ??? cutscene at Clearwater Lake, so a public
  row would be retail-wrong. Marker 11038107 (2321.56, 756.97) =
  Coerthas map (60.34, 29.01), corroborating walkthrough (60,28).
  Zone id unresolvable from ground (nearest recorded nodes 523y+
  away in every Coerthas zone).
- Hostage leatherworkers + bandits: cinematic only, no actors.

## Dialogue / cutscenes (client scenario Tan300, 216 lines, read)

Text bank tan300.csv (108 rows). Offer: say 3-6, showQuestInfomation
gate (no ask). Cutscenes: tan30010, tan30020, tan30030 (afterWarp),
tan30040 (afterWarp), tan30050 (final). Talk-only: 025 (linkpearl
plea, turn 1). Sub-talk families (owners unrecovered, unwired):
005_2..8, 020_2, 025_2..8, 030_2..9, 040_2..7. Key cells: 11-15
ambush + Lalatta rescue, 17-23 Yuhelmeric receipt, 23-24 bag plea
(item link 11000047), 26-33 Vielle Parley lead-in, 34-40 Knights'
rescue. NOTE: journal state 15-19 says "signature shoes" (wolf
leather x3), but metadata + walkthrough + DAT item links all say
Fen-Yll Birkin Bag (toad + brass); the bag wins.

## Objectives / markers (DAT quest_marker.csv, all read)

11038101 Owl's Nest approach (2266,1026) Coerthas (59.78,31.70)
(~walkthrough cave (59,31)); 11038102 ambush point (2463,1217)
(61.75,33.61); 11038103/04/06 transitions (-431,187, unmapped);
11038105 Clearwater destination (2321.56,756.97) (60.34,29.01);
11038107 Vielle Parley (same XZ, d1300094); 11038108 Hereward
reward (= row 691 position); 11038109-20 filler (-431,187).
Script binds: 0->08, 5->02, 10->01, 15-19->05, 20-24->05+07, 25->08.

## Territory / instance

Gridania 206; Coerthas overworld travel (Owl's Nest + Clearwater
Lake legs); Clearwater Parley-room instance (private area
unrecovered; Vielle placement inside unowned). After-warp lifetimes
for tan30030/40 have no owner.

## Spawn positions (map tool, this pass)

- 11038107: Coerthas map (60.34,29.01) vs walkthrough (60,28).
  No zone owns recorded ground within 523y (143/144/145/147/148
  checked) -> no spawn authored, marked HOLD.
- 11038101: (59.78,31.70) vs walkthrough cave entrance (59,31).

## Mobs / AI

None quest-owned. Verified: quest director empty,
playerKillTargetCount 0, DAT mechanics cinematicBanditOnly. The
lone bandit is knocked out by Lalatta in-dialogue; cave Dreadwolves
/ bandits on the walkthrough path are ambient open-world mobs.

## Parley

DAT title 1101 "Designer Imposters" (xtx_negotiationTable.csv,
verified). Server engine: negotiation_game.lua (12-topic board,
gauge 100, default difficulty 3 / 12 turns / 20s) + C# route to
Lua onNegotiationResult (Player.cs verified). Script stamps the
board idempotently on first Vielle talk (Hrv300 pattern), wins set
flag 0, losses retry, then the bag ransom handoff consumes the bag
and advances 20-24->25. No required item (bag changes hands as
ransom after the win).

## Items / recipes

11000021 Leather Chocobo Saddle (delivery, consumed at the folded
state-10 return); 11000047 Fen-Yll Birkin Bag <- 10007113 Toad
Leather + 10003012 Brass Ingot (recipe 5403, E/30/CC, registered).

## Triggers / edge behavior

Offer: TNR33 + level 30 + completed 110380. Grants verified
(inv-full retries). Bag credit snapshot-diff (traded bags credit).
Confront range accepts any of 20-24. Win flag without bag holds;
ransom consume verified. Abandon/complete run onFinish cleanup
(verified). Logout/DC safe. No timeout/re-enter/sync (non-combat).
Chocobo clause N/A: no combat instance exists; the Parley room is
a dialogue instance with no mount interaction.

## Rewards

Central: 30000 gil + 3000 marks (1000117). Script: 3420 EXP
(post-1.20 maximum). No central Exp row. Reward era unresolved
(dat-old marks).

## Sources

Scenario tan300.lua + tan300.csv + quest_marker rows + template
Tan300 block + xtx_negotiationTable title 1101 +
Gamerescape Designer_Imposters journal/walkthrough (fetched
2026-09-27) + negotiation engine sources + map tooling.
