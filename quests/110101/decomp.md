# 110101 Two-man Crew — `Exc300` (Marauder 30)

- Offer: Waekbyrt 1000003 (zone 230, -752.53 / 382.14). Class MRD 30+.
- Chain: preceded by 110100 Bloody Baptism, followed by 110102.
- No battle or private duty in the recovered scenario; no chocobo
  callback or actor anywhere in this quest.

## Sequence flow (retail journal states)
ACCEPT Waekbyrt (`processEventWaekbyrtStart`/`exc30010`, accept on
nil/1) -> [0] Rostnsthal briefing (`processEvent020`/`exc30020`,
requiredResult 1) -> [5] steal five valuables -> [7..11] collection
ladder (row 37, one state per pickup; 11 is the transient
all-collected instant) -> [12] Rostnsthal report (`processEvent022`,
pure say, no gate) -> [15] Rorojaru sale (`processEvent025`, pure say)
-> [16] Waekbyrt reward (`processEvent030`/`exc30030`, journal row 39).
Flags 0-4 persist the five pickup identities (one trigger pushed five
times cannot complete the set). Ambient groups 010_2..025_9 stay
unbound (owners unrecovered). Marker 11010103 is the pre-existing
`push_mrd` guild-door waypoint, not an objective.

## Objectives / items
Five distinct valuables from the Krakens' den (marker 11010102,
-417 / 446; guide map (7.99, 7.66) page 900; nearest recorded ground
Y ~42.1, scaffold rows at Y 41.2): Mirage Token 11000032, Deep-red Ruby
11000033, Skull Island 11000034, Aged Rum 11000035, Far Eastern Sourleaf
11000036. Each pickup plays one `trialObject` flavor variant (1/2/3);
the spot-to-variant mapping is a documented scaffold (rotation
1,2,3,1,2). Triggers are generic invisible objects (1090199, Pgl200
coin precedent), uniqueIds `exc300_valuable_1..5`, one-shot with
despawn + flag protection across reconnects. Sale grants Pirate Ship
Funds 11000131 (consumed at the final reward).

## NPCs / markers
Rostnsthal 1001652 (zone-230 row `exc300_rostnsthal` at -784.81 / 9.15 /
386.61; display 1600150; 1000005 unspawned candidate). Rorojaru 1000374
(zone 175, 28.93 / 192 / 109.69, matches marker 11010105 exactly).
Markers: 01 briefing, 02 den, 04 report, 05 sale, 06 reward; 07-20 filler.

## Edge handling (implemented)
Class+level gates on every entry; inv-full holds pickup and sale steps
for retry (consumption idempotent, no dup); consumed valuables never
softlock the sale; Ship Funds never linger after completion.

## Rewards
Central: 24,000 gil + 2,400 Marauder marks (1000103). Script: 3,420 EXP.

## Sources
Decompiled client scenario + DAT markers/items; journal branch ladder;
Fandom journal text; map_coordinates guide for den/NPC placement.
