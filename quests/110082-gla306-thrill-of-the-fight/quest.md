# 110082 Thrill of the Fight — `gla306` safe slice (normalized from Batch A)

- Class: GLA 3 | Level: 36 | Offer: Lulutsu 1000863 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Gla306` (template SAFE SLICE only).
- SQL prereq: 0 in Lua (no prior-quest gate; melee doc s1). SQL row not re-mined: OPEN.

## Sequence flow (VERIFIED: melee sequences.csv + indepth s7 + journal)
- ACCEPT Lulutsu -> [1] Yoyobina {11008201} `003` briefing -> [2] Yoyobina
  {11008202} `005` ready check (requiredResult 1) -> battle {11008208}
  (preEvent `010`/gla30610) -> [20] Lulutsu {11008209} `055` report -> 30
  authoritative completion handshake.

## Delegate events (VERIFIED: melee process_events.csv)
Wired: LulutsuStart/003/005/010/055. Unbound (inventoried in template
`documentedUnboundChain`, needs Echo/past-area director): 020/gla30620,
020_999/gla30615, 023, 024 + 045 (Echo ask 51030), 025, 030/gla30630,
040/gla30640, 050/gla30650; markers 11008203-07.

## Actors/markers (VERIFIED: melee actors.csv + markers.csv DAT rows)
Lulutsu 1000863/1500022; Yoyobina 1001076/1400023. Live 11008201/02
briefing, 11008203 Yoyobina 2nd, 11008204/07 challenger-family displays,
11008205, 11008206 guild waypoint (= guild-trigger exact match), 11008208
Coliseum/battle, 11008209 Lulutsu reward; 11008210-20 filler.

## Fight (VERIFIED: melee fight_waves.csv + ge-walkthrough/journal order)
ONLY the player's challenger spawns: 2289007/mob 3035 Ala Mhigan
Challenger, lv 36, skill 15, single kill. Second SQL identity 2289010/3033
(bladedancer) is the OBSERVED next match per dialogue: scene-only, never a
fabricated two-target duty. Director 10 -> 20 -> retry 0. 600 s (INFERRED).

## Rewards (VERIFIED: melee rewards.csv)
Central gil 36000 + GLA marks 1000102x3600; Lua EXP 4720.

## Edge handling (VERIFIED: indepth s11)
Class+level gates; ready-check decline-hold; UpdateENPCs + EndEvent on all
paths. No chocobo.

## Open gaps
- Full Echo/refugee chain needs a dedicated Echo/past-area director.
- `validate_gla306_route.py` PASS (batch A).
