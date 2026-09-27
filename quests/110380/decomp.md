# 110380 The Silent Partners (Tan200) — decomp

Leatherworker 20. Hereward evaluation: Ebony Stalls repair work for the
Wood Wailers, replacement-jacket synthesis from Armor Remnants,
equipped chocobo-stable inspection, Quarrymill delivery, Hereward
report. Non-combat; no mobs, no sync, no lockouts.

## Sequences / flags / counters

States (recovered numbering): 0 meet Lalatta, 5 observe, 10 repair,
15 replace, 17 showing, 18 equipped inspection, 20 Quarrymill
delivery + report. Quest data: counter 0 repaired-armor baseline,
counter 1 jacket baseline (snapshot-diff credit); flag 0
FLAG_DELIVERED (newly assigned, Quarrymill two-step inside state 20).

## NPCs / actors

- Hereward 1000231 (display 1000324): offer/inspection/reward. Spawn
  row 691, zone 206 (97.02, 20.00, -1459.46).
- Lalatta candidates 1000368/1000467 (display 1500065, identical rows,
  no distinguishing evidence). Public stand-in row 3359: 1000368 at
  DAT-exact marker XZ (193.12, -1420.23), Y 27.7 stalls floor
  (wulfthryth 6.7y away; beaudefoin/meara/matheonien share it).
  Retail talks play inside the Ebony Stalls instance (walkthrough);
  the private-area owner is unrecovered.
- Lefwyne 1001396: remnant top-up. Spawn row 679, zone 206
  (180.42, 25.82, -1400.37), ~24y from the Lalatta marker.
- Gylbart 1000978 (display 1000130): Quarrymill delivery. Row 3360,
  zone 154 (1379.01, -12.50, 941.00); XZ DAT-exact, Y nearest
  recorded ground (~10y, verify !pos). Actor 1000978 is the sole
  actor_class row with displayId 1000130 and has an appearance row.
  (Actor 1000130 itself is Mynadaeg, displayId 1600120.)
- Theldry 1000379 (row 3357): instance-scene merchant, no server leg.
- Unresolved: stable inspector (display 1000164; marker 11038008 sits
  exactly on Lefwyne's position), ??? remnant crate east of the
  Atelier (object id unknown; pickup folded into Lefwyne).

## Dialogue / cutscenes (client scenario Tan200, 258 lines, read)

Text bank tan200.csv (115 rows). Offer: say 1-3, ask 38 mode 2,
showQuestInfomation gate. Cutscenes: tan20010 (afterWarp), tan20020,
tan20030 (afterWarp), tan20040, tan20050 (final). Talk-only: 033
(showing), 037 (inspection). Sub-talk families (owners unrecovered,
unwired): 005_2..8, 010_2, 020_2..10, 030_2..3, 033_2..12, 037_2,
040_2. Key cells: 75 Aldgoat Leather hint, 77/81 remnant recipe hint
+ Lefwyne pointer (FR), 98/99 stable round-trip order, 101/102/110
failure branch ("gather more scraps and try again" — trigger rule
unrecovered, not implemented), 109/111 comfort/superb status lines.

## Objectives / markers (DAT quest_marker.csv, all read)

01 Ebony Stalls (201.50,-1410.05,d4000257) map (8.10,4.14);
02/04 Lalatta (193.12,-1420.23,d1500065) map (8.01,4.04);
03/05 transitions (-431,187,d1600179, unmapped);
06 Gylbart/Quarrymill (1379.01,941,d1000130) South Shroud (44.83,47.49);
07 Hereward report (97.02,-1459.46,d1000324) map (7.05,3.65);
08 stable inspection (180.42,-1400.37,d1000164) map (7.88,4.24);
09 equipped route (108.78,-1467.61) map (7.17,3.56);
10 guild route (59.43,-1249.56) map (6.67,5.74);
11 guild route (69.76,-1423.58) map (6.78,4.00);
12-20 filler at (-431,187), never bound.
Script binds: 0->01, 5->02, 10->04, 15->10+11, 17->07, 18->08+09,
20->06+07.

## Territory / instance

Gridania 206 (guild + stalls + stables trip); South Shroud 154
(Quarrymill delivery, 11 recorded nodes near marker). Ebony Stalls
interior instance entered at the couches between Ebony/Rosewood
Stalls (walkthrough): private area + Lalatta placement inside are
unrecovered; after-warp lifetimes for tan20010/30 have no owner.

## Spawn positions (map tool, this pass)

- Lalatta marker: Gridania map (8.01,4.04), 0 recorded nodes;
  authored Y 27.7 from wulfthryth (190.2,27.7,-1426.3) 6.7y away.
- Gylbart marker: South Shroud map (44.83,47.49), 11 recorded nodes;
  authored Y -12.5 from nodes 3648-3650 (~10y, -12.2..-12.5).

## Mobs / AI

None. Verified: quest director empty, playerKillTargetCount 0,
Wailers vs Ishgard-bandit fighting is cutscene dressing, no kill
targets in any journal state.

## Items / recipes

11000044 Damaged Wailer Armor -> +10007126 Aldgoat Leather ->
11000045 Repaired Wailer Armor (recipe 5402, E/20/CC, registered);
11000045 -> 11000046 Armor Remnants x3 (1 Lalatta failure grant +
crate+Lefwyne folded top-up); 3x 11000046 -> 8030916 Wood Wailer's
Jacket (recipe 5405, E/20/CC, authored minimal: only the three
certain sets; extra inputs unrecovered). Journal's "buffalo leather
strap + spetch" vs DAT/working Aldgoat Leather conflict documented;
Aldgoat wins (DAT cell 75/114 + recipe + walkthrough).

## Triggers / edge behavior

Offer: TNR33 + level 20, ask-gated. Grants verify ownership
(inv-full retries). Synthesis credit is snapshot-diff (traded
outputs credit). BODY-slot (10) equip gate at 18. State-20 order
gate: Gylbart consumes jacket + FLAG_DELIVERED (bare talk, no
recovered scene binding), then Hereward 050 + 1760 EXP. Abandon and
complete both run onFinish cleanup (Quest.cs OnAbandon/OnComplete
verified). Logout/DC safe (quest data + inventory persist).
No timeout, no re-enter, no overlevel sync (non-combat).

## Rewards

Central: 20000 gil + 2000 marks (1000117). Script: 1760 EXP
(post-1.20 maximum). No central Exp row. Raw-gear jacket entry
mirrors the route item (consumed at Gylbart). Iron Round Knife
(6050011) era-unresolved, excluded. Linkpearl grant skipped (no
item id; Alc200 precedent).

## Sources

Scenario tan200.lua + tan200.csv + quest_marker rows + template
Tan200 block + Gamerescape The_Silent_Partners journal/walkthrough
(fetched 2026-09-27) + map tooling. No YouTube footage with new
gameplay claims was needed; mechanics come from DAT + walkthrough.
