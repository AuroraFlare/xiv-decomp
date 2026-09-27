# 110080 All Bark and No Bite — `gla200` (normalized from Batch A)

- Class: GLA 3 | Level: 20 | Offer: Lulutsu 1000863 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Gla200` (template route).
- SQL prereq: 0 in Lua (no prior-quest gate; melee doc s1). SQL row not re-mined: OPEN.

## Sequence flow (VERIFIED: melee sequences.csv + indepth s5 + ge-walkthrough)
- ACCEPT Lulutsu -> 0 retry/launch -> battle {11008001} (preEvent `010`/
  gla20010 on duty entry) -> [20] Lulutsu {11008002} `020`/gla20020 ->
  30 reward `030`/gla20030.

## Delegate events (VERIFIED: melee process_events.csv)
Wired: LulutsuStart/010/020/030. Wiki s23 ambient 005_*/020_* groups unbound.

## Actors/markers (VERIFIED: melee actors.csv + markers.csv DAT rows)
Lulutsu 1000863/1500022. Live 11008001 Coliseum (-187.23,219.73 = Man0u1
Coliseum trigger X/Z), 11008002 Lulutsu; 11008003-20 filler.

## Fight (VERIFIED: melee fight_waves.csv + ge-walkthrough single challenger)
2289006/mob 3034 Ala Mhigan Challenger, lv 20, skill 15, single kill.
Director 10 -> 20 -> retry 0. 600 s, party 3 (INFERRED).

## Rewards (VERIFIED: melee rewards.csv)
Central gil 20000 + GLA marks 1000102x2000; Lua item 4030203 + EXP 1760.
NOTE: template item grant has no inventory-full retry (shared-driver gap,
indepth s12.3 — left for a driver-level pass).

## Edge handling (VERIFIED: indepth s11)
Class+level gates; UpdateENPCs + EndEvent on all paths. No chocobo.

## Open gaps
- `validate_gla200_route.py` BLOCKED on missing scenario file in batch-A
  checkout (gla/gla200.lua absent); all non-scenario asserts verified
  manually (indepth s11). Re-run where the file exists.
- Live entry-scene lifetime; client acceptance.
