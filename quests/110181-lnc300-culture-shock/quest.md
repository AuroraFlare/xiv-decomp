# 110181 Culture Shock — `lnc300` (normalized from Batch B)

- Class: LNC | Level: 30 | Offer: J'moldva 1000599 | Reward: Willelda | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Lnc300` (generic driver route).
- SQL prereq: 110180 (VERIFIED: ranged doc cross-cutting; not a server gate).

## Sequence flow (VERIFIED: ranged sequences.csv + indepth Lnc300 + 3 videos)
- ACCEPT J'moldva briefing (accept ask DAT 87-89 inside; NO WilleldaStart
  scene exists for lnc300) -> [1] Gagaruna 1000862 @11018101 `020` Platinum
  Mirage canvass -> [2] Dreues 1000402 @11018107 `030` (100,000-gil ask NOT
  a gate: both answers converge) -> [3] J'moldva @11018102 `040` caravan
  order -> [4] rendezvous push 1000174 @11018103 `050` -> battle {11018103}
  -> [20] broker 1000403 @11018104 `065` + afterEvent `068` (injured-moogle
  + merchant thanks, one interaction) -> [21] J'moldva @11018105 `070` ->
  30 reward `075` (Willelda rows 85/86). Dreues confrontation scene-only.

## Delegate events (VERIFIED: ranged events.csv)
JMoldvaStart/020/030/040/050/060(flyover preEvent, presentation-only)/065/
068/070/075. No result gates.

## Actors/markers (VERIFIED: ranged actors.csv + markers.csv DAT rows)
J'moldva 1000599/1900046; Gagaruna 1000862/1400019; Dreues 1000402/2200071;
push 1000174; broker 1000403/4000135; Willelda 1000242/1100014. Live
11018101-07 (all); 11018108-20 filler. Defense site (379.70,-14.30).

## Fight (VERIFIED: ranged fights.csv; two-wave defense video-confirmed)
`QuestDirectorClassLnc300`: wave 1: 5x 2200108/mob 3131 Woodsent Pteroc lv
30; wave 2: 2x 2200304/mob 3132 Woodsent Doe lv 30. All kills. 10 -> 20 ->
retry 0. 600 s, party 3. No escort AI / failure rule evidenced. Caravan
chocobos are set dressing: no actors spawned.

## Rewards (VERIFIED: ranged rewards.csv)
Central gil 30000 + LNC marks 1000107x3000; script EXP 3420. No item.

## Edge handling (VERIFIED: ranged doc header)
Class/level gates; gc_sqb entry checks; fail-to-retry; onKillBNpc inert;
UpdateENPCs + EndEvent all paths. No chocobo actors/callbacks.

## Open gaps
- No caravan-failure rule evidenced; trigger Y scaffolds; after-warp lifetimes.
- `validate_lnc300_route.py` PASS (batch B).
