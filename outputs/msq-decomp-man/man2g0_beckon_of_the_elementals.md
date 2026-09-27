# Beckon of the Elementals — Man2g0 (110008, Lv 13)

- Prereq: 110007. Next: Man200 (one of three converging prereqs).
- Availability: enabled (`110008 ... Man2g0`, "instance + escort").
- Accept: SEQ_ACCEPT on Miounne (EndEvent before accept; no warp in onStart — safe).

## Sequence flow (verified)

ACCEPT → 0 (Nonolato → 3 + staging private) → 3 (O-App → combat instance) →
4 (elemental fight, below) → 5 (A'naidjaa → LS → 10) → 10 (LS → 15) → 15
(Soileine → 20 + private) → 20 (push → 25 + private) → 25 (Fye flag → O-App →
30 + LS + public) → 30 (LS → 35) → 35 (amphitheatre push → 40 + private) → 40
(Fye → 45 + zone 153 warp) → 45 (Yda/Papalymo → push 50/55 → 60 + zone 155
warp) → 60 (Miounne reward + CompleteQuest with overkill guard + 30000 gil + 500 exp).

## Fight: Spirit of the Wood (verified, documented BNPC, full fight)

- IDs (verified code + main SQL `server_battlenpc_mob_types.sql:644`):
  actor 2105201 / BNPC 1364 / `spirit_of_the_wood`, HP 2930 (SQL) matching
  director `BECKON_SPIRIT_HP = 2930` (verified cross-match).
- Entry (verified): `doSEQ004CombatInstance` → zone 153 private type 1,
  boundary circle center (-2015.643, -929.240) r=35 (actor r=33.5),
  landing (-2017.174, -11.625, -943.275).
- Allies (verified): Grinnaux 2290015 (950 HP), Handeloup 2290016 (850),
  T'kebbe 2290017 (700), Lv 28, quest-ally profiles `110008/grinnaux|handeloup|
  tkebbe`, pre-spawned into target area before zone-in (verified code).
- Ward mechanic (verified): O-App `processEventTrial001` prompt modes 1/2;
  wind/earth/water ward items 11000082/11000083/11000084 (one held at a time);
  removed onFinish. Exact retail effect unrecovered — mechanic shape only.
- Navmesh verdict: **VERIFIED** — recorded node 111 at exactly
  (-2017.174, -11.625, -943.275), distance 0.0, zone_153.tsv:116.
  `!pos 153 -2017.174 -11.625 -943.275`.
- Director (verified exists): `Quest/QuestDirectorMan2g001` (fire layers, ally
  lifecycle, flee timer).

## Delegate events (verified sample)

`processEventMiounneStart/005_2/007[_2..3]/010[_2]/020[_2..3]/030[_2..9]/
040[_2..6]/045[_2]/050[_2]/060[_2..26]/070[_2..3]/080[_01]/1000_1/1000_2`,
`processEventTrial001/002`, `processEventComplete`, `sqrwa`.

## ENPC IDs (verified)

Miounne 1000230, O-App-Pesi 1000033/1000235, Nonolato 1000463, A'naidjaa
1000465, Soileine 1000234/1700030, Dunstan 1000013, E-Sumi-Yan 1000011,
Fye 1000014, amphitheatre crowd 1000016–1001489, pushes 1090178–1090180.

## Markers (verified): 11000801–11000810.

## Flags: 0 (Fye seen). LS packs (65–67, 112–115).

## Journal hooks: static `(40,40,40)` + marker list with private/public splits.

## Rewards (verified): 30000 gil + 500 exp. GC whistle 2001005 commented OUT
in code (deliberate: no whistle granted — verified, do not "fix").

## Instance / scene surface

- NEEDED: ARC/CNJ staging privates, combat battlefield, amphitheatre privates.
- EXISTING (verified): `QuestDirectorMan2g001`, staging/combat privates,
  `startMan2g0EntryTest` GM helper.

## Prior decomp references

- `docs/beckon_elementals_instance_cutscene_decomp_2026-07-01.md`
- `docs/level_13_city_main_quests_decomp_2026-07-06.md`

## Open gaps

- Ward exact mitigation, spirit AI script, and ally DPS tuning are authored
  balance (damage mods verified in code), not retail numbers.
