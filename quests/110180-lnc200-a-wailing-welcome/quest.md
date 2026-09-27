# 110180 A Wailing Welcome — `lnc200` (normalized from Batch B)

- Class: LNC | Level: 20 | Offer+reward: Willelda 1000242/1100014 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Lnc200` (generic driver route).
- SQL prereq: 0 (VERIFIED: ranged doc cross-cutting; server does not gate offers on prereqs).

## Sequence flow (VERIFIED: ranged sequences.csv + indepth Lnc200 + video S-teBSI2N4ql4 00:00)
- ACCEPT Willelda `processEventWilleldaStart` -> 0 retry point -> [1]
  J'moldva 1000599 @11018001 `010` briefing -> battle {11018002} -> [20]
  J'moldva @11018003 `020` aftermath (after-warp exit as talk callback) ->
  [21] Willelda @11018004 `040` payment speech -> 30 reward `030`.

## Delegate events (VERIFIED: ranged events.csv)
WilleldaStart/010/020/040/030, no result gates. Wailing Barracks Linkpearl
grant UNBOUND (no evidence).

## Actors/markers (VERIFIED: ranged actors.csv + markers.csv DAT rows)
Willelda 1000242/1100014; J'moldva 1000599/1900046. Live 11018001-04
(briefing, chigoe duty site -642.01,-1060.05 Central Shroud, aftermath,
payment/reward); 11018005-20 filler.

## Fight (VERIFIED: ranged fights.csv; 4-chigoe sequence video-confirmed)
`QuestDirectorClassLnc200`: 4x 2205605/mob 3125 Orchard Chigoe, lv 15,
single wave, all kills. 10 -> 20 -> retry 0. 600 s, party 3.

## Rewards (VERIFIED: ranged rewards.csv)
Central gil 20000 + LNC marks 1000107x2000; script item 4080406x1 + EXP 1760.

## Edge handling (VERIFIED: ranged doc header)
Class/level gates; gc_sqb entry checks; death/timeout/disconnect/abandon
fail to retry; onKillBNpc inert; UpdateENPCs + EndEvent all paths;
StartPrivateQuestBattle two-value contract. No chocobo (actors/callbacks).

## Open gaps
- Linkpearl grant unbound; trigger Y scaffolds; after-warp lifetimes.
- `validate_lnc200_route.py` PASS (batch B).
