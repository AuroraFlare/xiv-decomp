# 110062 Two Sides to Every Chip — `pgl306` (normalized from Batch A)

- Class: PUG 2 | Level: 36 | Offer: Gagaruna 1000862 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Pgl306` (template route).
- SQL prereq: 0 in Lua (no prior-quest gate; melee doc s1). SQL row not re-mined: OPEN.

## Sequence flow (VERIFIED: melee sequences.csv + indepth s4 + ge-walkthrough)
- ACCEPT Gagaruna -> [1] Hurrey 1000603 {11006202,11006203} `020` -> [2]
  1001013 {11006203} Echo ask (requiredResult 1) `030` -> [3] push trigger
  1000174 {11006204} Echo gate `040` -> battle {11006204} -> [20]/[21]
  Titinin {11006206} (050 aftermath + 060 report) -> [22]/[23] Gagaruna
  {11006205} (070 + 080) -> reward `090`.

## Delegate events (VERIFIED: melee process_events.csv)
Wired: GagarunaStart/020/030/040/050/060/070/080/090. `030_2`/`040_2`
after-warp twins unbound BY DESIGN (base-vs-twin choice unrecovered; playing
a twin without its warp desyncs the client).

## Actors/markers (VERIFIED: melee actors.csv + markers.csv DAT rows)
Gagaruna 1000862/1400019; Hurrey 1000603/2200172; Echo gate 1001013/4000515;
push trigger 1000174/4000257 (scaffold Y); Titinin 1000934/1400021. Live
11006201-06 (guild waypoint = trigger 1090042 exact match, Hurrey, Echo gate,
Silver Bazaar, Gagaruna, Titinin); 11006207-20 filler.

## Fight (VERIFIED: melee fight_waves.csv + ge-walkthrough 2x)
2x 2289014/mob 3079 Ossuary Almstaker, lv 36, skill **14** (only non-15
humanoid list in pack), requireAllTargets. Director 10 -> 20 -> retry 0.
Hurrey assist unimplemented. 600 s, party 3 (INFERRED).

## Rewards (VERIFIED: melee rewards.csv)
Central gil 36000 + PUG marks 1000101x3600; Lua EXP 4720.

## Edge handling (VERIFIED: indepth s11)
Class+level gates; Echo decline-hold; trigger keyed on uniqueId; UpdateENPCs
+ EndEvent on all paths. No chocobo.

## Open gaps
- Trigger Y/rotation scaffold; client marker X/Z + push semantics authoritative.
- `validate_pgl306_route.py` PASS (batch A).
