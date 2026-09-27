# 110182 Necessary Evils — `lnc306` (normalized from Batch B)

- Class: LNC | Level: 36 | Offer+reward: Willelda 1000242 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Lnc306` (generic driver route).
- SQL prereq: 110181 (VERIFIED: ranged doc cross-cutting; not a server gate).

## Sequence flow (VERIFIED: ranged sequences.csv + indepth Lnc306 + 2 videos)
- ACCEPT Willelda oath `processEventWilleldaStart` -> [1] J'moldva
  @11018201 `010` good/bad-news briefing (either answer, no gate) -> [2]
  south-road duty-trigger push 1000174 @11018202 `020` -> battle {11018202}
  -> [20] campfire aftermath push @11018202 `030` -> [21] broker @11018203
  `035` Echo gate (51030, requiredResult 1; 0 holds) + afterEvent `040` ->
  [22] J'moldva @11018204 `050` -> 30 reward `060` (Willelda). Campfire
  talks optional flavor; moogle chase / Garlean spies are Echo story beats,
  not targets.

## Delegate events (VERIFIED: ranged events.csv)
WilleldaStart/010/020/030/035(gated)/040/050/060.

## Actors/markers (VERIFIED: ranged actors.csv + markers.csv DAT rows)
Willelda 1000242/1100014; J'moldva 1000599/1900046; pushes 1000174; broker
1000403/4000135. Live 11018201-05 (briefing, duty/campfire 394.23,-782.40,
broker Echo, report, reward); 11018206-20 filler.

## Fight (VERIFIED: ranged fights.csv; single-elemental video-confirmed)
`QuestDirectorClassLnc306`: Woodsent Elemental 2205202/mob 3133, lv 36,
THM profile. Single kill. 10 -> 20 -> retry 0. 600 s, party 3. (2204605
homonym is open-world fire block; 2205201/2205202 are the quest pair.) No
caravan-failure rule evidenced.

## Rewards (VERIFIED: ranged rewards.csv)
Central gil 36000 + LNC marks 1000107x3600; script EXP 4720. No item.

## Edge handling (VERIFIED: ranged doc header)
Class/level gates; Echo decline-hold; gc_sqb entry checks; fail-to-retry;
onKillBNpc inert; UpdateENPCs + EndEvent all paths. No chocobo.

## Open gaps
- No caravan-failure rule; trigger Y scaffolds; after-warp lifetimes.
- `validate_lnc306_route.py` PASS (batch B).
