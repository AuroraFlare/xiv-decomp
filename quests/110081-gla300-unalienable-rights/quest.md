# 110081 Unalienable Rights — `gla300` (normalized from Batch A)

- Class: GLA 3 | Level: 30 | Offer: Lulutsu 1000863 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Gla300` (template route).
- SQL prereq: 0 in Lua (no prior-quest gate; melee doc s1). SQL row not re-mined: OPEN.

## Sequence flow (VERIFIED: melee sequences.csv + indepth s6)
- ACCEPT Lulutsu -> [1] Miounne 1000230 {11008101} `020` -> [2] Willelda
  1000242 {11008102} `025` spar choice (decline holds) + afterEvent `030` ->
  battle {11008103} -> [20] J'moldva 1000599 {11008104} `040` Echo +
  afterEvent `050` linkpearl handoff (same talk; no linkpearl-use command
  exists) -> [21] Lulutsu {11008105} `055` -> [22] Yoyobina 1001076
  {11008106} `065` Echo (requiredResult 1) + afterEvent `060` -> [23]
  Yoyobina {11008107} `070` (no gate, pure say chain) -> [24] Yoyobina
  {11008107} `080` (no gate) -> [25] Lulutsu {11008108} reward `090`.

## Delegate events (VERIFIED: melee process_events.csv)
Wired: LulutsuStart/020/025/030/040/050/055/065/070/080/090. Gating 070/080
would stall (pure say rows). Marker 11008109 (display 1300015, owner 1000928
cutscene shell) unbound: no talk/spawn/event.

## Actors/markers (VERIFIED: melee actors.csv + markers.csv DAT rows)
Lulutsu 1000863/1500022; Miounne 1000230/1300018 (Yoyobina stand-in
waypoint); Willelda 1000242/1100014; J'moldva 1000599/1900046; Yoyobina
1001076/1400023. Live 11008101-08 + 11008109 (unbound); 11008110-20 filler.

## Fight (VERIFIED: melee fight_waves.csv + ge-walkthrough single Lancer spar)
2289009/mob 3062 J'moldva, lv 30, skill 15, single kill. Director 10 -> 20
-> retry 0. 600 s, party 3 (INFERRED). Single-source "30 min" timer NOT adopted.

## Rewards (VERIFIED: melee rewards.csv)
Central gil 30000 + GLA marks 1000102x3000; Lua EXP 3420.

## Edge handling (VERIFIED: indepth s11)
Class+level gates; spar-choice + Echo decline-hold; UpdateENPCs + EndEvent
on all paths. No chocobo.

## Open gaps
- Yoyobina public Y/rotation is an SQL scaffold (live correction needed).
- `validate_gla300_route.py` PASS (batch A).
